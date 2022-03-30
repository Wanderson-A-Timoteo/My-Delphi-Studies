unit Menus.Controller.Interfaces;

interface

uses
  Menus.Controller.Conexoes.Interfaces, Menus.Controller.Entity.Interfaces,
  Menus.Controller.ListBox.Interfaces;

type
  iControllerFacade = interface
    function Conexao : iControllerConexoesFacade;
    function Entity : iControllerEntityFacade;
    function Menu : iControllerMenusFacade;
  end;

implementation

end.
