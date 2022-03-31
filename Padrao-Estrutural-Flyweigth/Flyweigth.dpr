program Flyweigth;

uses
  Vcl.Forms,
  Flyweigth.View.Principal in 'Flyweigth.View.Principal.pas' {Form2},
  Flyweigth.Model.Interfaces in 'Flyweigth.Model.Interfaces.pas',
  Flyweigth.Model.Cliente in 'Flyweigth.Model.Cliente.pas',
  Flyweigth.Model.Flyweight in 'Flyweigth.Model.Flyweight.pas',
  Flyweigth.Model.Cliente.Brasil in 'Flyweigth.Model.Cliente.Brasil.pas',
  Flyweigth.Model.Cliente.USA in 'Flyweigth.Model.Cliente.USA.pas',
  Flyweigth.Model.Cliente.Espanha in 'Flyweigth.Model.Cliente.Espanha.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
