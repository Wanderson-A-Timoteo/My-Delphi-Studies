program Bridge;

uses
  Vcl.Forms,
  Bridge.View.Principal in 'Bridge.View.Principal.pas' {Form2},
  Bridge.Model.Interfaces in 'Bridge.Model.Interfaces.pas',
  Bridge.Model.Venda in 'Bridge.Model.Venda.pas',
  Bridge.Model.SPED.C100 in 'Bridge.Model.SPED.C100.pas',
  Bridge.Model.SPED.C190 in 'Bridge.Model.SPED.C190.pas',
  Bridge.Model.SPED.C140 in 'Bridge.Model.SPED.C140.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
