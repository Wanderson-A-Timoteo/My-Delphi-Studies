program Decorator;

uses
  Vcl.Forms,
  Decorator.View.Principal in 'Decorator.View.Principal.pas' {Form2},
  Decorator.Model.NFC in 'Decorator.Model.NFC.pas',
  Decorator.Model.SAT in 'Decorator.Model.SAT.pas',
  Decorator.Model.Interfaces in 'Decorator.Model.Interfaces.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
