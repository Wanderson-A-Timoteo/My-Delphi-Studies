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
    ['{2ADDE3D1-1C3D-43FA-BABA-8F4F17346C07}']
    function Database(Value : String) : iModelConexaoParametros;
    function Porta(Value : Integer)   : iModelConexaoParametros;
    function Server(Value : String)   : iModelConexaoParametros;
    function DriverID(Value : String) : iModelConexaoParametros;
    function UserName(Value : String) : iModelConexaoParametros;
    function Password(Value : String) : iModelConexaoParametros;
    function EndParamentos            : iModelConexao;
  end;

  iModelDataSet = interface
    ['{6B3E6A74-F6FF-4E2C-8AFD-2BC8133EAE12}']
    function Open(aTable : String) : iModelDataSet;
    function EndDataSet : TComponent;
  end;
implementation

end.
