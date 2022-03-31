program Iterator;

uses
  Vcl.Forms,
  Iterator.View.Principal in 'Iterator.View.Principal.pas' {Form2},
  Iterator.Model.Venda in 'Iterator.Model.Venda.pas',
  Iterator.Model.Interfaces in 'Iterator.Model.Interfaces.pas',
  Iterator.Model.Itens in 'Iterator.Model.Itens.pas',
  Iterator.Model.Itens.Iterator in 'Iterator.Model.Itens.Iterator.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
