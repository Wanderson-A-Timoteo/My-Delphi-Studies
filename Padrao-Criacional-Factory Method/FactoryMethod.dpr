program FactoryMethod;

uses
  Vcl.Forms,
  FactoryMethod.View.Principal in 'FactoryMethod.View.Principal.pas' {Form2},
  FactoryMethod.Model.CocaCola in 'FactoryMethod.Model.CocaCola.pas',
  FactoryMethod.Model.Interfaces in 'FactoryMethod.Model.Interfaces.pas',
  FactoryMethod.Model.Guarana in 'FactoryMethod.Model.Guarana.pas',
  FactoryMethod.Model.Factory in 'FactoryMethod.Model.Factory.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
