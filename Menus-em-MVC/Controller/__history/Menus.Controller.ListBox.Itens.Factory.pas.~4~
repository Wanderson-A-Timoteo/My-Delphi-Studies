unit Menus.Controller.ListBox.Itens.Factory;

interface

uses
  Menus.Controller.Interfaces, Menus.Controller.ListBox.Itens.Default,
  Menus.Controller.ListBox.Itens.Produto;

type
  TControllerListBoxItensFactory = class(TInterfacedObject, iControllerListBoxItensFactory)
    constructor Create;
    destructor Destroy; override;

    class function New : iControllerListBoxItensFactory;

    function Defaul : iControllerListBoxItensDefault;
    function Produto : iControllerListBoxItemForm;

  end;

implementation

{ TControllerListBoxItensFactory }

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
