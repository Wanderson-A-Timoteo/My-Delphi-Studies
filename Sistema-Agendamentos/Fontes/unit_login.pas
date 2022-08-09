unit unit_login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  unit_dados, ACBrBase, ACBrEnterTab;

type
  Tform_login = class(TForm)
    pnl_fundo: TPanel;
    pnl_lateral: TPanel;
    lblBemVindos: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    img_logo: TImage;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    pnlNomeUsuario: TPanel;
    Label11: TLabel;
    EditNomeUsuario: TEdit;
    pnlBordaUsuario: TPanel;
    pnlSenhaUsuario: TPanel;
    EditSenhaUsuario: TEdit;
    Label10: TLabel;
    pnlBordaSenha: TPanel;
    pnlEntrar: TPanel;
    SpeedButtonEntrar: TSpeedButton;
    SpeedButton2: TSpeedButton;
    ACBrEnterTab1: TACBrEnterTab;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButtonEntrarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButtonEntrarMouseEnter(Sender: TObject);
    procedure SpeedButtonEntrarMouseLeave(Sender: TObject);
    procedure EditSenhaUsuarioKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_login: Tform_login;

implementation

{$R *.dfm}

uses
  classe.usuarios, unit_funcoes;

procedure Tform_login.EditSenhaUsuarioKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
    SpeedButtonEntrarClick(Self);
end;

procedure Tform_login.FormActivate(Sender: TObject);
begin
  pnl_fundo.Left := Round( (form_login.Width - pnl_fundo.Width) / 2);
  pnl_fundo.Top  := Round( (form_login.Height - pnl_fundo.Height) / 2);
end;

procedure Tform_login.SpeedButtonEntrarClick(Sender: TObject);
begin
  prcValidarCamposObrigatorios(form_login);

  if ((EditNomeUsuario.Text = 'ADM') and (EditSenhaUsuario.Text = 'ADM')) or
     (DataModule1.Usuarios.fnc_validar_login(EditNomeUsuario.Text, MD5(EditSenhaUsuario.Text))) then
   Close;
end;

procedure Tform_login.SpeedButtonEntrarMouseEnter(Sender: TObject);
begin
  SpeedButtonEntrar.Font.Color := $00591A05;
end;

procedure Tform_login.SpeedButtonEntrarMouseLeave(Sender: TObject);
begin
  SpeedButtonEntrar.Font.Color := clWhite;
end;

procedure Tform_login.SpeedButton2Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.
