program Observer;

uses
  Vcl.Forms,
  Observer.View.Principal in 'Observer.View.Principal.pas' {Form2},
  Observer.Model.Interfaces in 'Observer.Model.Interfaces.pas',
  Observer.Model.Observer in 'Observer.Model.Observer.pas',
  Observer.Model.Pedido in 'Observer.Model.Pedido.pas',
  Observer.Model.Cozinha in 'Observer.Model.Cozinha.pas',
  Observer.Model.Garcom in 'Observer.Model.Garcom.pas',
  Observer.View.Producao in 'Observer.View.Producao.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
