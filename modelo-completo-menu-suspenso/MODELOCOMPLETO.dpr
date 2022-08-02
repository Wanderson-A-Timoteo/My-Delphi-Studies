program MODELOCOMPLETO;

uses
  Vcl.Forms,
  DMDados in 'DMDados.pas' {DataModuleDados: TDataModule},
  Login in 'Login.pas' {FormLogin},
  Principal in 'Principal.pas' {FormPrincipal},
  BibVariavel in '..\..\Maximus4.0\Fontes\BibVariavel.pas',
  BibMarco in '..\..\ComumSistemas\BibMarco.pas',
  FTIServices1 in '..\..\ComumSistemas\FTIServices1.pas',
  Progressao in '..\..\ComumSistemas\Progressao.pas' {FormProgressao},
  UnitNossoMdi in '..\..\ComumSistemas\UnitNossoMdi.pas' {NossoMdi},
  Pesquisa in '..\..\Maximus4.0\Fontes\Pesquisa.pas' {FormPesquisa},
  BibPesquisa in '..\..\Maximus4.0\BibPesquisa\BibPesquisa.pas',
  Conexao in '..\..\ComumSistemas\Conexao.pas' {FormConexao},
  UnitNossoModalRelatorio in '..\..\ComumSistemas\UnitNossoModalRelatorio.pas' {NossoModalRelatorio},
  UnitNossoMdiCadastro in '..\..\ComumSistemas\UnitNossoMdiCadastro.pas' {NossoMdiCadastro},
  PesquisarCriancas in 'PesquisarCriancas.pas' {FormPesquisarCriancas},
  CadastrarCrianca in 'CadastrarCrianca.pas' {FormCadastrarCrianca},
  Fundo in 'Fundo.pas' {FormFundo};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDataModuleDados, DataModuleDados);
  Application.CreateForm(TFormLogin, FormLogin);
  Application.CreateForm(TFormConexao, FormConexao);
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;
end.
