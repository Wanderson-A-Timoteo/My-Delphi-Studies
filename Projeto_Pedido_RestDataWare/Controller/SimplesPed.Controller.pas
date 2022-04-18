unit SimplesPed.Controller;

interface

uses
  SimplePed.Controller.Interfaces, SimplePed.Controller.Produto.Interfaces,
  SimplePed.Controller.Pedido.Interfaces, SimplePed.Controller.Exceptions,
  Vcl.Forms;

Type
  TController = class(TInterfacedObject, iController)
  private
    FForm : TForm;
    FException : iControllerExceptions;
  public
    constructor Create(Form : TForm);
    destructor Destroy; override;
    class function New(Form : TForm): iController;
    function Produto: iControllerProduto;
    function Pedido: iControllerPedido;
    function PedidoItens: iControllerPedidoItens;
  end;

implementation

uses
  SimplePed.Controller.Produto, SimplePed.Controller.Pedido,
  SimplePed.Controller.PedidoItens;

{ TController }

constructor TController.Create(Form : TForm);
begin
  FForm := Form;
  FException := TControllerExceptions.New(FForm);
end;

destructor TController.Destroy;
begin

  inherited;
end;

class function TController.New(Form : TForm): iController;
begin
  Result := Self.Create(Form);
end;

function TController.Pedido: iControllerPedido;
begin
  Result := TControllerPedido.New;
end;

function TController.PedidoItens: iControllerPedidoItens;
begin
  Result := TControllerPedidoItens.New;
end;

function TController.Produto: iControllerProduto;
begin
  Result := TControllerProduto.New;
end;

end.
