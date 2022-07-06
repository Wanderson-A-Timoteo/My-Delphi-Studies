unit unit_agendamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Buttons, Vcl.DBCtrls,
  Vcl.Mask, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, unit_profissionais, unit_clientes, classe_conexao, unit_dados,
  classe.profissionais, classe.agendamento;

type
  Tform_agendamento = class(TForm)
    shape_fundo_form_agendamento: TShape;
    PanelAgrupaCamposAgendamento: TPanel;
    PanelContainer: TPanel;
    LabelSelecioneProfissional: TLabel;
    PanelBordaNovaConfigServidor: TPanel;
    LabelNoemProfissional: TLabel;
    LabelData: TLabel;
    dbl_cmb_profissionais: TDBLookupComboBox;
    PanelBordaSelecioneCliente: TPanel;
    LabelSelecioneCliente: TLabel;
    LabelNomeCliente: TLabel;
    LabelHora: TLabel;
    LabelTelefoneFixo: TLabel;
    LabelCelular: TLabel;
    LabelObservacoes: TLabel;
    LabelTituloAgendamento: TLabel;
    SpeedButtonCadastrarData: TSpeedButton;
    MaskEditData: TMaskEdit;
    MaskEditHora: TMaskEdit;
    MaskEditTelefoneFixo: TMaskEdit;
    MaskEditCelular: TMaskEdit;
    SpeedButtonLupaPesquisaNomeCliente: TSpeedButton;
    PanelBotoesAgendarCancelar: TPanel;
    PanelBotaoAgendar: TPanel;
    PanelBotaoCancelar: TPanel;
    SpeedButtonAgendar: TSpeedButton;
    SpeedButtonCancelar: TSpeedButton;
    SpeedButtonCadastrarProfissional: TSpeedButton;
    PanelBordaData: TPanel;
    PanelBordaHora: TPanel;
    PanelBordaTelefoneFixo: TPanel;
    PanelBordaCelular: TPanel;
    PanelBordaObservacoes: TPanel;
    EditObservacoes: TEdit;
    ds_profissionais: TDataSource;
    PanelBordaNomeCliente: TPanel;
    EditNoemCliente: TEdit;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure SpeedButtonCancelarClick(Sender: TObject);
    procedure SpeedButtonCadastrarProfissionalClick(Sender: TObject);
    procedure SpeedButtonLupaPesquisaNomeClienteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SpeedButtonCadastrarDataClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButtonAgendarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Agendamento : TAgendamentos;
  end;

var
  form_agendamento: Tform_agendamento;

implementation



{$R *.dfm}

uses unit_cliente_consulta, unit_agendamento_consulta, unit_funcoes;

procedure Tform_agendamento.FormActivate(Sender: TObject);
begin
  PanelContainer.Left := Round( (form_agendamento.Width - PanelContainer.Width) / 2);
  PanelContainer.Top  := Round( (form_agendamento.Height - PanelContainer.Height) / 2);
end;

procedure Tform_agendamento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DataModule1.Profissional.Free;

  Agendamento.Free;

  Action := caFree;
end;

procedure Tform_agendamento.FormCreate(Sender: TObject);
begin
  DataModule1.Profissional := TProfissionais.Create(DataModule1.FDConnection);

  Agendamento              := TAgendamentos.Create(DataModule1.FDConnection);
end;

procedure Tform_agendamento.FormShow(Sender: TObject);
begin
  ds_profissionais.DataSet := DataModule1.Profissional.fnc_consulta('');
end;

procedure Tform_agendamento.SpeedButtonAgendarClick(Sender: TObject);
var
  sErro : String;
begin
  prcValidarCamposObrigatorios(form_agendamento);

  if Agendamento.fnc_validar_agendamento( dbl_cmb_profissionais.KeyValue,
                                          StrToDate(MaskEditData.Text),
                                          MaskEditHora.Text ) then
  begin
    Agendamento.pro_id_profissional := dbl_cmb_profissionais.KeyValue;
    Agendamento.dt_data             := StrToDate(MaskEditData.Text);
    Agendamento.hr_hora             := MaskEditHora.Text;
    Agendamento.ds_obs              := EditObservacoes.Text;

    sErro := Agendamento.fnc_inserir;
    if sErro = '' then
    begin

      fnc_criar_mensagem('GRAVANDO OS DADOS',
                         'Data e Hora de Agendamento Disponível',
                         'Agendamento Realizado Com Sucesso!.',
                         ExtractFilePath(Application.ExeName) + 'imagens\sucesso.png',
                         'OK');
      form_agendamento.Close;
     end else
     begin
      fnc_criar_mensagem('GRAVANDO OS DADOS',
                         'Erro no agendamento!',
                         sErro,
                         ExtractFilePath(Application.ExeName) + 'imagens\erro.png',
                         'OK');

      MaskEditData.SetFocus;
     end;
  end else
  begin
    fnc_criar_mensagem('VALIDANDO DADOS',
                       'Erro ao agendar horário!',
                       'Dia e Hora do agendamento indisponível! Selecione outra data.',
                       ExtractFilePath(Application.ExeName) + 'imagens\erro.png',
                       'OK');

    MaskEditData.SetFocus;
  end;


end;

procedure Tform_agendamento.SpeedButtonCadastrarDataClick(Sender: TObject);
begin
  try
    form_agendamento_consulta := Tform_agendamento_consulta.Create(Self);

    if dbl_cmb_profissionais.KeyValue <> null then
      form_agendamento_consulta.dbl_cmb_Consulta_Profissional.KeyValue := dbl_cmb_profissionais.KeyValue;

    form_agendamento_consulta.EditObservacoes.Text := EditObservacoes.Text;

    form_agendamento_consulta.ShowModal;
  finally
    form_agendamento_consulta.Free;
  end;
end;

procedure Tform_agendamento.SpeedButtonCadastrarProfissionalClick(Sender: TObject);
begin
  form_profissionais := Tform_profissionais.Create(Self);
  try
    form_profissionais.ShowModal;
  finally
    form_profissionais.Free;
  end;
end;

procedure Tform_agendamento.SpeedButtonCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure Tform_agendamento.SpeedButtonLupaPesquisaNomeClienteClick(Sender: TObject);
begin
  form_cliente_consulta := Tform_cliente_consulta.Create(Self);
  try
    form_cliente_consulta.ShowModal;
  finally
    form_cliente_consulta.Free;
  end;
end;

end.
