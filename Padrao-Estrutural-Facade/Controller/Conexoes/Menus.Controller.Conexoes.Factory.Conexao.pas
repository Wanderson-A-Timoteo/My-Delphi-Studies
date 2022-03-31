unit Menus.Controller.Conexoes.Factory.Conexao;

interface

uses Menus.Controller.Conexoes.Interfaces, Menus.Model.Conexoes.Interfaces,
  Menus.Model.Conexoes.Factory.Conexao;

Type
  TControllerConexoesFactoryConexao = class(TInterfacedObject, iControllerFactoryConexao)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iControllerFactoryConexao;
      function Conexao : iModelConexao;
  end;

implementation

uses
  System.SysUtils;

{ TControllerConexoesFactoryConexao }

function TControllerConexoesFactoryConexao.Conexao: iModelConexao;
begin

  {$IFDEF FIREDAC}
    Result := TModelConexaoFactoryConexoes.New
              .ConexaoFiredac
              .Parametros
                .Database('D:\Firebird\MENUS.FDB')
                .UserName('SYSDBA')
                .Password('12345')
                .DriverID('FB')
                .Server('localhost')
                .Porta(3050)
              .EndParametros
              .Conectar;
  {$ENDIF}

  {$IFDEF ZEOS}
    Result := TModelConexaoFactoryConexoes.New
              .ConexaoZeos
              .Parametros
                .Database('D:\Firebird\MENUS.FDB')
                .UserName('SYSDBA')
                .Password('12345')
                .DriverID('firebird-2.5')
                .Server('localhost')
                .Porta(3050)
              .EndParametros
              .Conectar;
  {$ENDIF}

end;

constructor TControllerConexoesFactoryConexao.Create;
begin

end;

destructor TControllerConexoesFactoryConexao.Destroy;
begin

  inherited;
end;

class function TControllerConexoesFactoryConexao.New: iControllerFactoryConexao;
begin
  Result := Self.Create;
end;

end.
