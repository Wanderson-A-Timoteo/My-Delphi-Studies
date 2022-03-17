program OOP_Iniciantes;

uses
  Vcl.Forms,
  View.Principal in 'View.Principal.pas' {Form3},
  Classe.Pessoa in 'Classe.Pessoa.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
