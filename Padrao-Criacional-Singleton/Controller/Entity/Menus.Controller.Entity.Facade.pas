unit Menus.Controller.Entity.Facade;

interface

uses Menus.Controller.Entity.Interfaces, Menus.Controller.Entity.Factory;

Type
  TControllerEntityFacade = class(TInterfacedObject, iControllerEntityFacade)
  private
    FEntity : iControllerEntityFactory;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iControllerEntityFacade;
    function Entity: iControllerEntityFactory;
  end;

implementation

{ TControllerEntityFacade }

constructor TControllerEntityFacade.Create;
begin
  FEntity := TControllerEntityFactory.New;
end;

destructor TControllerEntityFacade.Destroy;
begin

  inherited;
end;

function TControllerEntityFacade.Entity: iControllerEntityFactory;
begin
  Result := FEntity;
end;

class function TControllerEntityFacade.New: iControllerEntityFacade;
begin
  Result := Self.Create;
end;

end.
