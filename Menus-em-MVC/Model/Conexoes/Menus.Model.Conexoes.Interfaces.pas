unit Menus.Model.Conexoes.Interfaces;

interface

uses
  System.Classes;

type

  iModelConexaoParametros = interface;

  iModelConexao = interface
    ['{EBB3DC18-0E54-4A6A-A0E2-1BDF326E86E2}']
    function EndConexao : TComponent;
    function Parametros : iModelConexaoParametros;
  end;

  iModelConexaoParametros = interface
    function Database(Value : String) : iModelConexaoParametros;
    function Porta(Value : Integer)   : iModelConexaoParametros;
    function Server(Value : String)   : iModelConexaoParametros;
    function DriverID(Value : String) : iModelConexaoParametros;
    function UserName(Value : String) : iModelConexaoParametros;
    function Password(Value : String) : iModelConexaoParametros;
    function EndParamentos            : iModelConexao;
  end;
implementation

end.
