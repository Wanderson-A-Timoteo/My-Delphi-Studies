unit Menus.Controller.ListBox.Itens.Cliente;

interface

uses
  Menus.Controller.Interfaces, FMX.Types;

type

  TControllerListBoxItensCliente = class(TInterfacedObject, iControllerListBoxItemForm)
    constructor Create;
    destructor Destroy; override;

    class function New: iControllerListBoxItemForm;

    function Show : TFmxObject;
  end;

implementation

uses
  Menus.Controller.ListBox.Itens.Factory;

{ TControllerListBoxItensCliente }

constructor TControllerListBoxItensCliente.Create;
begin

end;

destructor TControllerListBoxItensCliente.Destroy;
begin

  inherited;
end;

class function TControllerListBoxItensCliente.New: iControllerListBoxItemForm;
begin
  Result := Self.Create;
end;

function TControllerListBoxItensCliente.Show: TFmxObject;
begin
  Result := TControllerListBoxItensFactory.New
              .Defaul
              .Name('btnCliente')
              .Text('Clientes')
              .Item;
end;

end.
