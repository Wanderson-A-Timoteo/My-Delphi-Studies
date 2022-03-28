unit Menus.Controller.ListBox.Itens.Produto;

interface

uses
  Menus.Controller.Interfaces, FMX.Types;

type

  TControllerListBoxItensProduto = class(TInterfacedObject, iControllerListBoxItemForm)
    constructor Create;
    destructor Destroy; override;

    class function New: iControllerListBoxItemForm;

    function Show : TFmxObject;
  end;

implementation

uses
  Menus.Controller.ListBox.Itens.Factory;

{ TControllerListBoxItensProduto }

constructor TControllerListBoxItensProduto.Create;
begin

end;

destructor TControllerListBoxItensProduto.Destroy;
begin

  inherited;
end;

class function TControllerListBoxItensProduto.New: iControllerListBoxItemForm;
begin
  Result := Self.Create;
end;

function TControllerListBoxItensProduto.Show: TFmxObject;
begin
  Result := TControllerListBoxItensFactory.New
              .Defaul
              .Name('btnProduto')
              .Text('Produtos')
              .Item;
end;

end.
