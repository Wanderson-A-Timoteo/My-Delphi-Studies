unit unit_profissionais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Buttons, Vcl.DBCtrls,
  Vcl.Mask;

type
  Tform_profissionais = class(TForm)
    shape_fundo_form_agendamento: TShape;
    PanelAgrupaCamposAgendamento: TPanel;
    PanelContainer: TPanel;
    LabelNoemProfissional: TLabel;
    LabelCelular: TLabel;
    LabelTituloCadastrarProfissional: TLabel;
    MaskEditCelular: TMaskEdit;
    PanelBotoesAgendarCancelar: TPanel;
    PanelBotaoAgendar: TPanel;
    PanelBotaoCancelar: TPanel;
    SpeedButtonAgendar: TSpeedButton;
    SpeedButtonCancelar: TSpeedButton;
    EditNomeProfissional: TEdit;
    PanelBordaNomeProfissional: TPanel;
    PanelBordaEspecialidade: TPanel;
    EditEspecialidade: TEdit;
    LabelEspecialidade: TLabel;
    PanelBordaCelular: TPanel;
    procedure SpeedButtonCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_profissionais: Tform_profissionais;

implementation

{$R *.dfm}

procedure Tform_profissionais.SpeedButtonCancelarClick(Sender: TObject);
begin
  Close;
end;

end.
