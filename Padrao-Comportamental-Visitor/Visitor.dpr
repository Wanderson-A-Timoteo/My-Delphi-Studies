program Visitor;

uses
  Vcl.Forms,
  Visitor.View.Principal in 'Visitor.View.Principal.pas' {Form2},
  Visitor.Model.Interfaces in 'Visitor.Model.Interfaces.pas',
  Visitor.Model.Item in 'Visitor.Model.Item.pas',
  Visitor.Model.Item.Regra.Varejos in 'Visitor.Model.Item.Regra.Varejos.pas',
  Visitor.Model.Item.Regra.Atacado in 'Visitor.Model.Item.Regra.Atacado.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
