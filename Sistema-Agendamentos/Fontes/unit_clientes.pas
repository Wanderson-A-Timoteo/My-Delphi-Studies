unit unit_clientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Buttons, Vcl.DBCtrls,
  Vcl.Mask;

type
  Tform_clientes = class(TForm)
    shape_fundo_form_agendamento: TShape;
    PanelAgrupaCamposAgendamento: TPanel;
    PanelContainer: TPanel;
    Panel10: TPanel;
    LabelNomeCliente: TLabel;
    LabelCelular: TLabel;
    Label9: TLabel;
    LabelEndereco: TLabel;
    LabelTelefoneFixo: TLabel;
    LabelComplemento: TLabel;
    Label13: TLabel;
    LabelDataNascimento: TLabel;
    LabelNumero: TLabel;
    MaskEditCelular: TMaskEdit;
    PanelBotoesSalvarCancelar: TPanel;
    PanelBotaoSalvar: TPanel;
    SpeedButtonSalvar: TSpeedButton;
    PanelBotaoCancelar: TPanel;
    SpeedButtonCancelar: TSpeedButton;
    EditNomeCliente: TEdit;
    PanelBordaNomeCliente: TPanel;
    PanelBordaEndereco: TPanel;
    EditEndereco: TEdit;
    PanelBordaCelular: TPanel;
    MaskEditTelefoneFixo: TMaskEdit;
    PanelBordaComplemento: TPanel;
    EditComplemento: TEdit;
    PanelBordaObservacoes: TPanel;
    EditObservacoes: TEdit;
    PanelBordaTelefoneFixo: TPanel;
    PanelBordaCidade: TPanel;
    MaskEditDataNascimento: TMaskEdit;
    PanelBordaNumero: TPanel;
    EditNumero: TEdit;
    MaskEditRG: TMaskEdit;
    LabelRG: TLabel;
    PanelBordaRG: TPanel;
    MaskEditCPF: TMaskEdit;
    LabelCPF: TLabel;
    PanelBordaCPF: TPanel;
    MaskEditCEP: TMaskEdit;
    LabelCEP: TLabel;
    PanelBordaCEP: TPanel;
    PanelBordaBairro: TPanel;
    EditBairro: TEdit;
    LabelBairro: TLabel;
    LabelCidade: TLabel;
    EditCidade: TEdit;
    PanelBordaUF: TPanel;
    EditUF: TEdit;
    LabelUF: TLabel;
    PanelBordaDataNascimento: TPanel;
    procedure SpeedButtonCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_clientes: Tform_clientes;

implementation

{$R *.dfm}

procedure Tform_clientes.SpeedButtonCancelarClick(Sender: TObject);
begin
  Close;
end;

end.
