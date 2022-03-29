program Menus;

uses
  System.StartUpCopy,
  FMX.Forms,
  Menus.View.Principal in 'View\Menus.View.Principal.pas' {frmPrincipal},
  Menus.Controller.Interfaces in 'Controller\Menus.Controller.Interfaces.pas',
  Menus.Model.Interfaces in 'Model\Menus.Model.Interfaces.pas',
  Menus.Controller.ListBox.Itens.Factory in 'Controller\Menus.Controller.ListBox.Itens.Factory.pas',
  Menus.Controller.ListBox.Factory in 'Controller\Menus.Controller.ListBox.Factory.pas',
  Menus.Controller.ListBox.Itens.Default in 'Controller\Menus.Controller.ListBox.Itens.Default.pas',
  Menus.Controller.ListBox.Default in 'Controller\Menus.Controller.ListBox.Default.pas',
  Menus.Controller.ListBox.Itens.Produto in 'Controller\Menus.Controller.ListBox.Itens.Produto.pas',
  Menus.Controller.ListBox.Principal in 'Controller\Menus.Controller.ListBox.Principal.pas',
  Menus.Controller.ListBox.Itens.Cliente in 'Controller\Menus.Controller.ListBox.Itens.Cliente.pas',
  Menus.View.Produtos in 'View\Menus.View.Produtos.pas' {frmProdutos},
  Menus.View.Clientes in 'View\Menus.View.Clientes.pas' {frmClientes},
  Menus.Controller.ListBox.Produtos in 'Controller\Menus.Controller.ListBox.Produtos.pas',
  Menus.Controller.ListBox.Clientes in 'Controller\Menus.Controller.ListBox.Clientes.pas',
  Menus.Controller.Forms.Default in 'Controller\Menus.Controller.Forms.Default.pas',
  Menus.Model.Conexoes.Interfaces in 'Model\Conexoes\Menus.Model.Conexoes.Interfaces.pas',
  Menus.Model.Conexoes.ConexaoFiredac in 'Model\Conexoes\Menus.Model.Conexoes.ConexaoFiredac.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
