unit Menus.Model.Conexoes.Interfaces;

interface

uses
  System.Classes;

type
  iModelConexaoParametros = interface;

  iModelConexao = interface
    ['{E8538D27-DFF2-4485-A303-616176681A93}']
    function Conectar : iModelConexao;
    function EndConexao: TComponent;
    function Parametros: iModelConexaoParametros;
  end;

  iModelConexaoParametros = interface
    ['{69BA62BF-43C2-495B-8E0B-C5B6D509FFCB}']
    function Database(Value: String): iModelConexaoParametros;
    function UserName(Value: String): iModelConexaoParametros;
    function Password(Value: String): iModelConexaoParametros;
    function DriverID(Value: String): iModelConexaoParametros;
    function Server(Value: String): iModelConexaoParametros;
    function Porta(Value: Integer): iModelConexaoParametros;
    function EndParametros: iModelConexao;
  end;

  iModelDataSet = interface
    ['{5CFF1908-225F-4A05-A633-914A35BF2858}']
    function Open(aTable: String): iModelDataSet;
    function EndDataSet: TComponent;
  end;

  iModelFactoryConexao = interface
    ['{30C0A523-319F-46E8-97F5-F4C7B32BDF95}']
    function ConexaoFiredac : iModelConexao;
  end;

  iModelFactoryDataSet = interface
    ['{EA1766BB-437B-4133-95D5-73AF1EA851D7}']
    function DataSetFiredac(Conexao : iModelConexao) : iModelDataSet;
  end;

implementation

end.
