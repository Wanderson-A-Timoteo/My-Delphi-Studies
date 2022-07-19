program TELATIPOMODAL;

uses
  Vcl.Forms,
  Principal in 'Principal.pas' {FormPrincipal},
  FundoPreto in 'FundoPreto.pas' {FormFundoPretoTransparente},
  Cadastro in 'Cadastro.pas' {FormCadastro},
  Pesquisar in 'Pesquisar.pas' {FormPesquisar},
  Relatorio in 'Relatorio.pas' {FormRelatorio};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;
end.
