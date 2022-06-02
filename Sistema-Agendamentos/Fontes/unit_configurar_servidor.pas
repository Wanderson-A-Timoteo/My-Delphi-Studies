unit unit_configurar_servidor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Buttons;

type
  Tform_configurar_servidor = class(TForm)
    shape_fundo: TShape;
    PanelConfiguracaoServidor: TPanel;
    PanelConfiguracaoAtualServidor: TPanel;
    PanelNovaConfiguracaoServidor: TPanel;
    pnlContainer: TPanel;
    ImageServidorDados: TImage;
    Label1: TLabel;
    Label2: TLabel;
    pnlConfigServidor: TPanel;
    pnlConfigServidorCancelar: TPanel;
    pnlConfigServidorEntrar: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    PanelBordaNovaConfigServidor: TPanel;
    PanelBordaConfigAtualServidor: TPanel;
    EditNovoCaminhoBDServidor: TEdit;
    EditNovaSenha: TEdit;
    EditNovaBaseDados: TEdit;
    EditNovoUsuario: TEdit;
    EditNovaPorta: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    EditAtualCaminhoBDServidor: TEdit;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    EditAtualBaseDados: TEdit;
    EditAtualUsuario: TEdit;
    EditAtualSenha: TEdit;
    EditAtualPorta: TEdit;
    Label24: TLabel;
    PanelBordaNovaConfigCaminhoBDServidor: TPanel;
    PanelBordaNovaConfigPorta: TPanel;
    PanelBordaNovaConfigSenha: TPanel;
    PanelBordaNovaConfigUsuario: TPanel;
    PanelBordaNovaConfigBaseDados: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_configurar_servidor: Tform_configurar_servidor;

implementation

{$R *.dfm}

procedure Tform_configurar_servidor.SpeedButton2Click(Sender: TObject);
begin
  Close;
end;

end.
