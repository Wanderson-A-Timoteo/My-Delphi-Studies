unit unit_consulta_lojas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Buttons, Vcl.DBCtrls,
  Vcl.Mask, unit_dados, Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, classe.lojas;

type
  Tform_consulta_lojas = class(TForm)
    shape_fundo_form_agendamento: TShape;
    PanelAgrupaCamposConsulta: TPanel;
    PanelContainer: TPanel;
    LabelBuscar: TLabel;
    LabelTituloLojas: TLabel;
    PanelBotoesConsultarCancelarCadastrarLojas: TPanel;
    PanelBotaoConsultar: TPanel;
    SpeedButtonConsultarLoja: TSpeedButton;
    EditConsultaNomeLojas: TEdit;
    PanelBordaConsultaNomeLojas: TPanel;
    dbg_registros_consulta_lojas: TDBGrid;
    LabelLojasCadastrados: TLabel;
    ds_consulta_lojas: TDataSource;
    LabelBuscarInfo: TLabel;
    PanelBotaoCadastrarNovaLoja: TPanel;
    SpeedButtonCadastrarNovaLoja: TSpeedButton;
    PanelBotoesCadastrarNovaLojaFechar: TPanel;
    PanelBotaoCancelar: TPanel;
    SpeedButtonCancelarConsulta: TSpeedButton;
    labelMsnDELouEdit: TLabel;
    PanelBordaGridLojas: TPanel;
    procedure SpeedButtonCancelarConsultaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButtonConsultarLojaClick(Sender: TObject);
    procedure dbg_registros_consulta_lojasDblClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dbg_registros_consulta_lojasKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButtonCadastrarNovaLojaClick(Sender: TObject);
    procedure SpeedButtonSelecionarLojaClick(Sender: TObject);
    procedure SpeedButtonCancelarConsultaMouseEnter(Sender: TObject);
    procedure SpeedButtonCancelarConsultaMouseLeave(Sender: TObject);
    procedure SpeedButtonCadastrarNovaLojaMouseEnter(Sender: TObject);
    procedure SpeedButtonCadastrarNovaLojaMouseLeave(Sender: TObject);
    procedure SpeedButtonConsultarLojaMouseLeave(Sender: TObject);
    procedure SpeedButtonConsultarLojaMouseEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    LLojas : TLojas;
  end;

var
  form_consulta_lojas: Tform_consulta_lojas;

implementation

{$R *.dfm}

uses unit_funcoes, unit_clientes, classe_conexao, unit_mensagens, unit_agendamento, unit_agenda, classe.agendamento,
  unit_relatorios, unit_lojas;


procedure Tform_consulta_lojas.dbg_registros_consulta_lojasDblClick(Sender: TObject);
begin
  if (not (dbg_registros_consulta_lojas.DataSource.DataSet.IsEmpty)) then
  begin
    LLojas.id_loja := dbg_registros_consulta_lojas.DataSource.DataSet.FieldByName('id_loja').AsInteger;
    try
      form_lojas := Tform_lojas.Create(nil);

      form_lojas.EditRazaoSocial.Text :=
        dbg_registros_consulta_lojas.DataSource.DataSet.FieldByName('ds_razao_social').AsString;

      form_lojas.EditNomeFantasia.Text :=
        dbg_registros_consulta_lojas.DataSource.DataSet.FieldByName('ds_fantasia').AsString;

      form_lojas.EditEndereco.Text :=
        dbg_registros_consulta_lojas.DataSource.DataSet.FieldByName('ds_endereco').AsString;

      form_lojas.EditComplemento.Text :=
        dbg_registros_consulta_lojas.DataSource.DataSet.FieldByName('ds_complemento').AsString;

      form_lojas.EditObservacoes.Text :=
        dbg_registros_consulta_lojas.DataSource.DataSet.FieldByName('ds_obs').AsString;

      form_lojas.EditNumero.Text :=
        dbg_registros_consulta_lojas.DataSource.DataSet.FieldByName('nr_numero').AsString;

      form_lojas.EditBairro.Text :=
        dbg_registros_consulta_lojas.DataSource.DataSet.FieldByName('ds_bairro').AsString;

      form_lojas.EditCidade.Text :=
        dbg_registros_consulta_lojas.DataSource.DataSet.FieldByName('ds_cidade').AsString;

      form_lojas.EditUF.Text :=
        dbg_registros_consulta_lojas.DataSource.DataSet.FieldByName('ds_uf').AsString;

      form_lojas.MaskEditCelular.Text :=
        dbg_registros_consulta_lojas.DataSource.DataSet.FieldByName('nr_telefone2').AsString;

      form_lojas.MaskEditTelefoneFixo.Text :=
        dbg_registros_consulta_lojas.DataSource.DataSet.FieldByName('nr_telefone1').AsString;

      form_lojas.MaskEditDataAbertura.Text :=
        dbg_registros_consulta_lojas.DataSource.DataSet.FieldByName('dt_abertura').AsString;

      form_lojas.MaskEditInscricaoEstadual.Text :=
        dbg_registros_consulta_lojas.DataSource.DataSet.FieldByName('nr_inscricao_estadual').AsString;

      form_lojas.MaskEditCNPJ.Text :=
        dbg_registros_consulta_lojas.DataSource.DataSet.FieldByName('nr_cnpj').AsString;

      form_lojas.MaskEditCEP.Text :=
        dbg_registros_consulta_lojas.DataSource.DataSet.FieldByName('nr_cep').AsString;

      form_lojas.EditEmail.Text :=
        dbg_registros_consulta_lojas.DataSource.DataSet.FieldByName('ds_email').AsString;

      form_lojas.EditCodigoIBGE.Text :=
        IntToStr(dbg_registros_consulta_lojas.DataSource.DataSet.FieldByName('nr_ibge_cidade').AsInteger);

      ds_consulta_lojas.DataSet := nil;

      form_lojas.ShowModal;
    finally
      form_lojas.Free;
    end;
  end;
end;

procedure Tform_consulta_lojas.dbg_registros_consulta_lojasKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_DELETE) and (not (dbg_registros_consulta_lojas.DataSource.DataSet.IsEmpty)) then
    LLojas.prc_deleta(dbg_registros_consulta_lojas.DataSource.DataSet.FieldByName('id_loja').AsInteger);

  LLojas.fnc_consulta(EditConsultaNomeLojas.Text);
  //prcAjustaTamanhoLinha(dbg_Registros, 33);

end;

procedure Tform_consulta_lojas.FormCreate(Sender: TObject);
begin
  LLojas := TLojas.Create( DataModule1.FDConnection );
end;

procedure Tform_consulta_lojas.FormDestroy(Sender: TObject);
begin
  LLojas.Free;
end;

procedure Tform_consulta_lojas.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
  begin
    ds_consulta_lojas.DataSet := LLojas.fnc_consulta( EditConsultaNomeLojas.Text );
  end;

end;

procedure Tform_consulta_lojas.SpeedButtonCadastrarNovaLojaClick(Sender: TObject);
begin
   try
    form_lojas := Tform_lojas.Create(nil);
    ds_consulta_lojas.DataSet := nil;
    form_lojas.ShowModal;
  finally
    form_lojas.Free;
  end;
end;

procedure Tform_consulta_lojas.SpeedButtonCadastrarNovaLojaMouseEnter(Sender: TObject);
begin
  SpeedButtonCadastrarNovaLoja.Font.Color := $00591A05;
end;

procedure Tform_consulta_lojas.SpeedButtonCadastrarNovaLojaMouseLeave(Sender: TObject);
begin
  SpeedButtonCadastrarNovaLoja.Font.Color := clWhite;
end;

procedure Tform_consulta_lojas.SpeedButtonCancelarConsultaClick(Sender: TObject);
begin
  Close;
end;

procedure Tform_consulta_lojas.SpeedButtonCancelarConsultaMouseEnter(Sender: TObject);
begin
  SpeedButtonCancelarConsulta.Font.Color := $00591A05;
end;

procedure Tform_consulta_lojas.SpeedButtonCancelarConsultaMouseLeave(Sender: TObject);
begin
  SpeedButtonCancelarConsulta.Font.Color := clWhite;
end;

procedure Tform_consulta_lojas.SpeedButtonConsultarLojaClick(Sender: TObject);
begin
  ds_consulta_lojas.DataSet := LLojas.fnc_consulta( EditConsultaNomeLojas.Text );
end;

procedure Tform_consulta_lojas.SpeedButtonConsultarLojaMouseEnter(Sender: TObject);
begin
  SpeedButtonConsultarLoja.Font.Color := $00591A05;
end;

procedure Tform_consulta_lojas.SpeedButtonConsultarLojaMouseLeave(Sender: TObject);
begin
  SpeedButtonConsultarLoja.Font.Color := clWhite;
end;

procedure Tform_consulta_lojas.SpeedButtonSelecionarLojaClick(Sender: TObject);
begin
  with dbg_registros_consulta_lojas.DataSource.DataSet do
    if (not ( IsEmpty )) then
    begin
      // Verifica se o form_agendamento foi criado
      if form_agendamento <> nil then
      begin
        form_agenda.Agendamento.cli_id_cliente      := FieldByName('id_cliente').AsInteger;
        form_agendamento.EditNomeCliente.Text       := FieldByName('ds_cliente').AsString;
        form_agendamento.MaskEditTelefoneFixo.Text  := FieldByName('nr_telefone').AsString;
        form_agendamento.MaskEditCelular.Text       := FieldByName('nr_telefone2').AsString;
      end else
      if form_relatorios <> nil then
      begin
        form_relatorios.cli_id_cliente              := FieldByName('id_cliente').AsInteger;
        form_relatorios.EditNomeCliente.Text        := FieldByName('ds_cliente').AsString;
      end;

      form_consulta_lojas.Close;
    end;
end;

end.