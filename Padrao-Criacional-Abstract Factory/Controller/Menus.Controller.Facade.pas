unit Menus.Controller.Facade;

interface

uses
  Menus.Controller.Interfaces, Menus.Controller.Conexoes.Interfaces,
  Menus.Controller.Entity.Interfaces, Menus.Controller.Conexoes.Facade,
  Menus.Controller.Entity.Facade, Menus.Controller.ListBox.Interfaces,
  Menus.Controller.ListBox.Facade;

Type
  TControllerFacade = class(TInterfacedObject, iControllerFacade)
  private
    FConexao : iControllerConexoesFacade;
    FEntity : iControllerEntityFacade;
    FMenu : iControllerMenusFacade;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iControllerFacade;
    function Conexao: iControllerConexoesFacade;
    function Entity: iControllerEntityFacade;
    function Menu : iControllerMenusFacade;
  end;

implementation

{ TControllerFacade }

function TControllerFacade.Conexao: iControllerConexoesFacade;
begin
  FConexao := TControllerConexoesFacade.New;
  Result := FConexao;
end;

constructor TControllerFacade.Create;
begin

end;

destructor TControllerFacade.Destroy;
begin

  inherited;
end;

function TControllerFacade.Entity: iControllerEntityFacade;
begin
  FEntity := TControllerEntityFacade.New;
  Result := FEntity;
end;

function TControllerFacade.Menu: iControllerMenusFacade;
begin
  FMenu := TControllerMenusFacade.New;
  Result := FMenu;
end;

class function TControllerFacade.New: iControllerFacade;
begin
  Result := Self.Create;
end;

end.
