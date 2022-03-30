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
  Menus.Model.Conexoes.ConexaoFiredac in 'Model\Conexoes\Menus.Model.Conexoes.ConexaoFiredac.pas',
  Menus.Model.Conexoes.TableFiredac in 'Model\Conexoes\Menus.Model.Conexoes.TableFiredac.pas',
  Menus.Model.Conexoes.Factory.Conexao in 'Model\Conexoes\Menus.Model.Conexoes.Factory.Conexao.pas',
  Menus.Model.Conexoes.Factory.DataSet in 'Model\Conexoes\Menus.Model.Conexoes.Factory.DataSet.pas',
  Menus.Model.Entity.Interfaces in 'Model\Entity\Menus.Model.Entity.Interfaces.pas',
  Menus.Model.Entity.Produtos in 'Model\Entity\Menus.Model.Entity.Produtos.pas',
  Menus.Model.Entity.Factory in 'Model\Entity\Menus.Model.Entity.Factory.pas',
  Menus.Controller.Conexoes.Interfaces in 'Controller\Conexoes\Menus.Controller.Conexoes.Interfaces.pas',
  Menus.Concoller.Conexoes.Factory.Conexao in 'Controller\Conexoes\Menus.Concoller.Conexoes.Factory.Conexao.pas',
  Menus.Concoller.Conexoes.Factory.DataSet in 'Controller\Conexoes\Menus.Concoller.Conexoes.Factory.DataSet.pas',
  Menus.Controller.Entity.Interfaces in 'Controller\Entity\Menus.Controller.Entity.Interfaces.pas',
  Menus.Controller.Entity.Produtos in 'Controller\Entity\Menus.Controller.Entity.Produtos.pas',
  Menus.Controller.Entity.Factory in 'Controller\Entity\Menus.Controller.Entity.Factory.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
