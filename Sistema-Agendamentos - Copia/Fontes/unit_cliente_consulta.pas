unit unit_cliente_consulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Buttons, Vcl.DBCtrls,
  Vcl.Mask, unit_dados, Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, classe.cliente;

type
  Tform_cliente_consulta = class(TForm)
    shape_fundo_form_agendamento: TShape;
    PanelAgrupaCamposConsulta: TPanel;
    PanelContainer: TPanel;
    LabelConsultaNomeCliente: TLabel;
    LabelTituloCadastrarProfissional: TLabel;
    PanelBotoesConsultarCancelarCadastrarCliente: TPanel;
    PanelBotaoConsultar: TPanel;
    SpeedButtonConsultarCliente: TSpeedButton;
    EditConsultaNomeCliente: TEdit;
    PanelBordaConsultaNomeCliente: TPanel;
    dbg_registros_consulta_cliente: TDBGrid;
    LabelClientesCadastrados: TLabel;
    ds_cliente_consulta: TDataSource;
    Label1: TLabel;
    PanelBotaoCadastrarNovoCliente: TPanel;
    SpeedButtonCadastrarNovoCliente: TSpeedButton;
    PanelBotoesCadastrarNovoClienteFechar: TPanel;
    PanelBotaoCancelar: TPanel;
    SpeedButtonCancelarConsulta: TSpeedButton;
    labelMsnDELouEdit: TLabel;
    PanelBotaoSelecionarCliente: TPanel;
    SpeedButtonSelecionarCliente: TSpeedButton;
    Panel1: TPanel;
    procedure SpeedButtonCancelarConsultaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButtonConsultarClienteClick(Sender: TObject);
    procedure dbg_registros_consulta_clienteDblClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dbg_registros_consulta_clienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButtonCadastrarNovoClienteClick(Sender: TObject);
    procedure SpeedButtonSelecionarClienteClick(Sender: TObject);
    procedure SpeedButtonSelecionarClienteMouseEnter(Sender: TObject);
    procedure SpeedButtonSelecionarClienteMouseLeave(Sender: TObject);
    procedure SpeedButtonCancelarConsultaMouseEnter(Sender: TObject);
    procedure SpeedButtonCancelarConsultaMouseLeave(Sender: TObject);
    procedure SpeedButtonCadastrarNovoClienteMouseEnter(Sender: TObject);
    procedure SpeedButtonCadastrarNovoClienteMouseLeave(Sender: TObject);
    procedure SpeedButtonConsultarClienteMouseLeave(Sender: TObject);
    procedure SpeedButtonConsultarClienteMouseEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    LClientes : TCliente;
  end;

var
  form_cliente_consulta: Tform_cliente_consulta;

implementation

{$R *.dfm}

uses unit_funcoes, unit_clientes, classe_conexao, unit_mensagens, unit_agendamento, unit_agenda, classe.agendamento,
  unit_relatorios;


procedure Tform_cliente_consulta.dbg_registros_consulta_clienteDblClick(Sender: TObject);
begin
  if (not (dbg_registros_consulta_cliente.DataSource.DataSet.IsEmpty)) then
  begin
    LClientes.id_cliente := dbg_registros_consulta_cliente.DataSource.DataSet.FieldByName('id_cliente').AsInteger;
    try
      form_clientes := Tform_clientes.Create(nil);

      form_clientes.EditNomeCliente.Text :=
        dbg_registros_consulta_cliente.DataSource.DataSet.FieldByName('ds_cliente').AsString;

      form_clientes.EditEndereco.Text :=
        dbg_registros_consulta_cliente.DataSource.DataSet.FieldByName('ds_endereco').AsString;

      form_clientes.EditComplemento.Text :=
        dbg_registros_consulta_cliente.DataSource.DataSet.FieldByName('ds_complemento').AsString;

      form_clientes.EditObservacoes.Text :=
        dbg_registros_consulta_cliente.DataSource.DataSet.FieldByName('ds_obs').AsString;

      form_clientes.EditNumero.Text :=
        dbg_registros_consulta_cliente.DataSource.DataSet.FieldByName('nr_numero').AsString;

      form_clientes.EditBairro.Text :=
        dbg_registros_consulta_cliente.DataSource.DataSet.FieldByName('ds_bairro').AsString;

      form_clientes.EditCidade.Text :=
        dbg_registros_consulta_cliente.DataSource.DataSet.FieldByName('ds_cidade').AsString;

      form_clientes.EditUF.Text :=
        dbg_registros_consulta_cliente.DataSource.DataSet.FieldByName('ds_uf').AsString;

      form_clientes.MaskEditCelular.Text :=
        dbg_registros_consulta_cliente.DataSource.DataSet.FieldByName('nr_telefone2').AsString;

      form_clientes.MaskEditTelefoneFixo.Text :=
        dbg_registros_consulta_cliente.DataSource.DataSet.FieldByName('nr_telefone').AsString;

      form_clientes.MaskEditDataNascimento.Text :=
        dbg_registros_consulta_cliente.DataSource.DataSet.FieldByName('dt_nascimento').AsString;

      form_clientes.MaskEditRG.Text :=
        dbg_registros_consulta_cliente.DataSource.DataSet.FieldByName('nr_rg').AsString;

      form_clientes.MaskEditCPF.Text :=
        dbg_registros_consulta_cliente.DataSource.DataSet.FieldByName('nr_cpf').AsString;

      form_clientes.MaskEditCEP.Text :=
        dbg_registros_consulta_cliente.DataSource.DataSet.FieldByName('nr_cep').AsString;

      ds_cliente_consulta.DataSet := nil;

      form_clientes.ShowModal;
    finally
      form_clientes.Free;
    end;
  end;
end;

procedure Tform_cliente_consulta.dbg_registros_consulta_clienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_DELETE) and (not (dbg_registros_consulta_cliente.DataSource.DataSet.IsEmpty)) then
    LClientes.prc_deleta(dbg_registros_consulta_cliente.DataSource.DataSet.FieldByName('id_cliente').AsInteger);

  LClientes.fnc_consulta(EditConsultaNomeCliente.Text);
  //prcAjustaTamanhoLinha(dbg_Registros, 33);

end;

procedure Tform_cliente_consulta.FormCreate(Sender: TObject);
begin
  LClientes := TCliente.Create( DataModule1.FDConnection );
end;

procedure Tform_cliente_consulta.FormDestroy(Sender: TObject);
begin
  LClientes.Free;
end;

procedure Tform_cliente_consulta.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
  begin
    ds_cliente_consulta.DataSet := LClientes.fnc_consulta( EditConsultaNomeCliente.Text );
  end;

end;

procedure Tform_cliente_consulta.SpeedButtonCadastrarNovoClienteClick(Sender: TObject);
begin
   try
    form_clientes := Tform_clientes.Create(nil);
    ds_cliente_consulta.DataSet := nil;
    form_clientes.ShowModal;
  finally
    form_clientes.Free;
  end;
end;

procedure Tform_cliente_consulta.SpeedButtonCadastrarNovoClienteMouseEnter(Sender: TObject);
begin
  SpeedButtonCadastrarNovoCliente.Font.Color := $00591A05;
end;

procedure Tform_cliente_consulta.SpeedButtonCadastrarNovoClienteMouseLeave(Sender: TObject);
begin
  SpeedButtonCadastrarNovoCliente.Font.Color := clWhite;
end;

procedure Tform_cliente_consulta.SpeedButtonCancelarConsultaClick(Sender: TObject);
begin
  Close;
end;

procedure Tform_cliente_consulta.SpeedButtonCancelarConsultaMouseEnter(Sender: TObject);
begin
  SpeedButtonCancelarConsulta.Font.Color := $00591A05;
end;

procedure Tform_cliente_consulta.SpeedButtonCancelarConsultaMouseLeave(Sender: TObject);
begin
  SpeedButtonCancelarConsulta.Font.Color := clWhite;
end;

procedure Tform_cliente_consulta.SpeedButtonConsultarClienteClick(Sender: TObject);
begin
  ds_cliente_consulta.DataSet := LClientes.fnc_consulta( EditConsultaNomeCliente.Text );
end;

procedure Tform_cliente_consulta.SpeedButtonConsultarClienteMouseEnter(Sender: TObject);
begin
  SpeedButtonConsultarCliente.Font.Color := $00591A05;
end;

procedure Tform_cliente_consulta.SpeedButtonConsultarClienteMouseLeave(Sender: TObject);
begin
  SpeedButtonConsultarCliente.Font.Color := clWhite;
end;

procedure Tform_cliente_consulta.SpeedButtonSelecionarClienteClick(Sender: TObject);
begin
  with dbg_registros_consulta_cliente.DataSource.DataSet do
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

      form_cliente_consulta.Close;
    end;
end;

procedure Tform_cliente_consulta.SpeedButtonSelecionarClienteMouseEnter(Sender: TObject);
begin
  SpeedButtonSelecionarCliente.Font.Color := $00591A05;
end;

procedure Tform_cliente_consulta.SpeedButtonSelecionarClienteMouseLeave(Sender: TObject);
begin
  SpeedButtonSelecionarCliente.Font.Color := clWhite;
end;

end.
