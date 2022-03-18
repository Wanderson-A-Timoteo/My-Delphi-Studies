program OOP_Iniciantes;

uses
  Vcl.Forms,
  View.Principal in '..\POO-09-Polimorfismo-Virtual-e-Override\View.Principal.pas' {Form3},
  Classe.Pessoa in '..\POO-09-Polimorfismo-Virtual-e-Override\Classe.Pessoa.pas',
  Classe.SQL in '..\POO-09-Polimorfismo-Virtual-e-Override\Classe.SQL.pas',
  Classe.Cliente in '..\POO-09-Polimorfismo-Virtual-e-Override\Classe.Cliente.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
