program Memento;

uses
  Vcl.Forms,
  Memento.View.Principal in 'Memento.View.Principal.pas' {Form2},
  Memento.Model.Interfaces in 'Memento.Model.Interfaces.pas',
  Memento.Model.Memento in 'Memento.Model.Memento.pas',
  Memento.Model.Cliente in 'Memento.Model.Cliente.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
