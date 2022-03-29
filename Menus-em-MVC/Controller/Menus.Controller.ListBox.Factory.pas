unit Menus.Controller.ListBox.Factory;

interface

uses
  Menus.Controller.Interfaces, System.Classes,
  Menus.Controller.ListBox.Default, Menus.Controller.ListBox.Principal;

type
  TControllerListBoxFactory = class(TInterfacedObject, iControllerListBoxFactory)
    constructor Create;
    destructor Destroy; override;

    class function New : iControllerListBoxFactory;

    function Defaul(Container : TComponent) : iControllerListBoxDefault;
    function Principal(Container : TComponent) : iControllerListBoxMenu;
  end;

implementation

{ TControllerListBoxFactory }

constructor TControllerListBoxFactory.Create;
begin

end;

function TControllerListBoxFactory.Defaul(
  Container: TComponent): iControllerListBoxDefault;
begin
  Result := TControllerListBoxDefault.New(Container);
end;

destructor TControllerListBoxFactory.Destroy;
begin

  inherited;
end;

class function TControllerListBoxFactory.New: iControllerListBoxFactory;
begin
  Result := Self.Create;
end;

function TControllerListBoxFactory.Principal(
  Container: TComponent): iControllerListBoxMenu;
begin
  Result := TControllerListBoxPrincipal.New(Container);
end;

end.