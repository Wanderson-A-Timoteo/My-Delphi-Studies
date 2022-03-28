unit Menus.Controller.ListBox.Factory;

interface

uses
  Menus.Controller.Interfaces;

type
  TControllerListBoxFactory = class(TInterfacedObject, iControllerListBoxFactory)
    constructor Create;
    destructor Destroy; override;

    class function New : iControllerListBoxFactory;
  end;

implementation

{ TControllerListBoxFactory }

constructor TControllerListBoxFactory.Create;
begin

end;

destructor TControllerListBoxFactory.Destroy;
begin

  inherited;
end;

class function TControllerListBoxFactory.New: iControllerListBoxFactory;
begin
  Result := Self.Create;
end;

end.
