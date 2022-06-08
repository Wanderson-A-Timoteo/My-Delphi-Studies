unit unit_agendamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Buttons, Vcl.DBCtrls,
  Vcl.Mask;

type
  Tform_agendamento = class(TForm)
    shape_fundo_form_agendamento: TShape;
    PanelAgrupaCamposAgendamento: TPanel;
    PanelContainer: TPanel;
    LabelSelecioneProfissional: TLabel;
    PanelBordaNovaConfigServidor: TPanel;
    LabelNoemProfissional: TLabel;
    LabelData: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
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
    procedure SpeedButtonCancelarClick(Sender: TObject);
    procedure SpeedButtonCadastrarProfissionalClick(Sender: TObject);
    procedure SpeedButtonLupaPesquisaNomeClienteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_agendamento: Tform_agendamento;

implementation



{$R *.dfm}

uses unit_profissionais, unit_clientes;

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
  //form_clientes := Tform_clientes;
  form_clientes := Tform_clientes.Create(Self);
  try
    form_clientes.ShowModal;
  finally
    form_clientes.Free;
  end;
end;

end.
