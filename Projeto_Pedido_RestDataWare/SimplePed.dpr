program SimplePed;

uses
  Vcl.Forms,
  SimplePed.View.Principal in 'View\SimplePed.View.Principal.pas' {Form6},
  SimplePed.Model.Conexao.RestDW in 'Model\Conexao\SimplePed.Model.Conexao.RestDW.pas' {ModelConexao: TDataModule},
  SimplePed.Model.Entidade.Produto in 'Model\Entidades\SimplePed.Model.Entidade.Produto.pas',
  SimplePed.Model.Entidade.Pedido in 'Model\Entidades\SimplePed.Model.Entidade.Pedido.pas',
  SimplePed.Model.Entidade.PedidoItens in 'Model\Entidades\SimplePed.Model.Entidade.PedidoItens.pas',
  SimplePed.Model.Produto in 'Model\Produto\SimplePed.Model.Produto.pas',
  SimplePed.Model.Produto.Interfaces in 'Model\Produto\SimplePed.Model.Produto.Interfaces.pas',
  SimplesPed.Model in 'Model\SimplesPed.Model.pas',
  SimplesPed.Model.Interfaces in 'Model\SimplesPed.Model.Interfaces.pas',
  SimplePed.Controller.Produto in 'Controller\Produto\SimplePed.Controller.Produto.pas',
  SimplePed.Controller.Produto.Interfaces in 'Controller\Produto\SimplePed.Controller.Produto.Interfaces.pas',
  SimplesPed.Controller in 'Controller\SimplesPed.Controller.pas',
  SimplePed.Controller.Interfaces in 'Controller\SimplePed.Controller.Interfaces.pas',
  SimplePed.Model.Pedido in 'Model\Pedido\SimplePed.Model.Pedido.pas',
  SimplePed.Model.Pedido.Interfaces in 'Model\Pedido\SimplePed.Model.Pedido.Interfaces.pas',
  SimplePed.Model.PedidoItens in 'Model\Pedido\SimplePed.Model.PedidoItens.pas',
  SimplePed.Controller.Pedido in 'Controller\Pedido\SimplePed.Controller.Pedido.pas',
  SimplePed.Controller.Pedido.Interfaces in 'Controller\Pedido\SimplePed.Controller.Pedido.Interfaces.pas',
  SimplePed.Controller.PedidoItens in 'Controller\Pedido\SimplePed.Controller.PedidoItens.pas',
  SimplePed.Model.Exceptions in 'Model\Exceptions\SimplePed.Model.Exceptions.pas',
  SimplePed.Controller.Exceptions in 'Controller\Exceptions\SimplePed.Controller.Exceptions.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TModelConexao, ModelConexao);
  Application.CreateForm(TForm6, Form6);
  Application.Run;
end.
