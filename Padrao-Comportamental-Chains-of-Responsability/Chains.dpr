program Chains;

uses
  Vcl.Forms,
  Chains.View.Principal in 'Chains.View.Principal.pas' {Form2},
  Chains.Model.Interfaces in 'Chains.Model.Interfaces.pas',
  Chains.Model.Usuario.Caixa in 'Chains.Model.Usuario.Caixa.pas',
  Chains.Model.Usuario.Fiscal in 'Chains.Model.Usuario.Fiscal.pas',
  Chains.Model.Usuario.Gerente in 'Chains.Model.Usuario.Gerente.pas',
  Chains.Model.Item in 'Chains.Model.Item.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
