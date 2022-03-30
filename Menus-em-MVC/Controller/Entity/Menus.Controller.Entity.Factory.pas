unit Menus.Controller.Entity.Factory;

interface

uses
  Menus.Controller.Entity.Interfaces, Menus.Controller.Entity.Produtos;

type
  TControllerEntityFactory = class(TInterfacedObject, iControllerEntityFactory)
    private

    public
      constructor Create;
      destructor Destroy; override;

      class function New : iControllerEntityFactory;

      function Produto : iControllerEntity;
  end;

implementation

{ TControllerEntityFactory }

constructor TControllerEntityFactory.Create;
begin

end;

destructor TControllerEntityFactory.Destroy;
begin

  inherited;
end;

class function TControllerEntityFactory.New: iControllerEntityFactory;
begin
  Result := Self.Create;
end;

function TControllerEntityFactory.Produto: iControllerEntity;
begin
  Result := TControllerEntityProdutos.New;
end;

end.
