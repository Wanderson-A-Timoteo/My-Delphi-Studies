unit Menus.Model.Conexoes.Interfaces;

interface

uses
  System.Classes;

type

  iModelConexaoParametros = interface;

  iModelConexao = interface
    ['{EBB3DC18-0E54-4A6A-A0E2-1BDF326E86E2}']
    function Conectar   : iModelConexao;
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

  iModelFactoryConexao = interface
    ['{C62A3AB7-97B6-47C0-B37D-62417CEB348B}']
    function ConexaoFiredac : iModelConexao;
  end;

  iModelFactoryDataSet = interface
    ['{4402840F-9B58-4432-AE4C-D6028B70A7E9}']
    function DataSetFiredac(Conexao : iModelConexao) : iModelDataSet;
  end;
implementation

end.
