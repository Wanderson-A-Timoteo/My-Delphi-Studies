program LoginScreen;

uses
  System.StartUpCopy,
  FMX.Forms,
  untBase in 'untBase.pas' {FormBase},
  untLoginScreen1 in 'untLoginScreen1.pas' {LoginScreen1},
  untPrincipal in 'untPrincipal.pas' {frmMenu},
  untPerfil in 'untPerfil.pas' {frmPerfil};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TLoginScreen1, LoginScreen1);
  Application.CreateForm(TfrmPerfil, frmPerfil);
  Application.Run;
end.
