unit unit_agendamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Buttons, Vcl.DBCtrls,
  Vcl.Mask, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, unit_profissionais, unit_clientes, classe_conexao, unit_dados,
  classe.profissionais;

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
    DBLookupComboBoxNomeCliente: TDBLookupComboBox;
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
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    EditObservacoes: TEdit;
    ds_profissionais: TDataSource;
    procedure SpeedButtonCancelarClick(Sender: TObject);
    procedure SpeedButtonCadastrarProfissionalClick(Sender: TObject);
    procedure SpeedButtonLupaPesquisaNomeClienteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_agendamento: Tform_agendamento;

implementation



{$R *.dfm}

uses unit_cliente_consulta;

procedure Tform_agendamento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DataModule1.Profissional.Destroy;
  Action := caFree;
end;

procedure Tform_agendamento.FormCreate(Sender: TObject);
begin
  DataModule1.Profissional := TProfissionais.Create(DataModule1.FDConnection);
end;

procedure Tform_agendamento.FormShow(Sender: TObject);
begin
  ds_profissionais.DataSet := DataModule1.Profissional.fnc_consulta('');
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
