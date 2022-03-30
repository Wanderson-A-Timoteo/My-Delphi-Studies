unit Menus.Controller.ListBox.Itens.Factory;

interface

uses
  Menus.Controller.ListBox.Interfaces, Menus.Controller.ListBox.Itens.Default,
  Menus.Controller.ListBox.Itens.Produto,
  Menus.Controller.ListBox.Itens.Cliente;

type
  TControllerListBoxItensFactory = class(TInterfacedObject, iControllerListBoxItensFactory)
    constructor Create;
    destructor Destroy; override;

    class function New : iControllerListBoxItensFactory;

    function Defaul : iControllerListBoxItensDefault;
    function Produto : iControllerListBoxItemForm;
    function Cliente : iControllerListBoxItemForm;

  end;

implementation

{ TControllerListBoxItensFactory }

function TControllerListBoxItensFactory.Cliente: iControllerListBoxItemForm;
begin
  Result := TControllerListBoxItensCliente.New;
end;

constructor TControllerListBoxItensFactory.Create;
begin

end;

function TControllerListBoxItensFactory.Defaul: iControllerListBoxItensDefault;
begin
  Result := TControllerListBoxItensDefault.New;
end;

destructor TControllerListBoxItensFactory.Destroy;
begin

  inherited;
end;

class function TControllerListBoxItensFactory.New: iControllerListBoxItensFactory;
begin
  Result := Self.Create;
end;

function TControllerListBoxItensFactory.Produto: iControllerListBoxItemForm;
begin
  Result := TControllerListBoxItensProduto.New;
end;

end.
