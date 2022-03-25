program Calculadora;

uses
  Vcl.Forms,
  Principal in 'Principal.pas' {Form1},
  Classe.Calculadora in 'Classe.Calculadora.pas',
  Calculadora.Interfaces in 'Calculadora.Interfaces.pas',
  Calculadora.Helpers in 'Calculadora.Helpers.pas',
  Calculadora.Somar in 'Calculadora.Somar.pas',
  Calculadora.Subtrair in 'Calculadora.Subtrair.pas',
  Calculadora.Dividir in 'Calculadora.Dividir.pas',
  Calculadora.Multiplicar in 'Calculadora.Multiplicar.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
