unit unit_login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons;

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
    Label12: TLabel;
    SpeedButton2: TSpeedButton;
    Edit3: TEdit;
    pnlCadastrar: TPanel;
    SpeedButtonCadastrar: TSpeedButton;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButtonEntrarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_login: Tform_login;

implementation

{$R *.dfm}

procedure Tform_login.FormActivate(Sender: TObject);
begin
  pnl_fundo.Left := Round( (form_login.Width - pnl_fundo.Width) / 2);
  pnl_fundo.Top  := Round( (form_login.Height - pnl_fundo.Height) / 2);
end;

procedure Tform_login.SpeedButtonEntrarClick(Sender: TObject);
begin
  Close;
end;

procedure Tform_login.SpeedButton2Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.
