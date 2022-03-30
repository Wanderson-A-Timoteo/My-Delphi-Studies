unit Menus.Concoller.Conexoes.Factory.Conexao;

interface

uses Menus.Controller.Conexoes.Interfaces, Menus.Model.Conexoes.Interfaces,
  Menus.Model.Conexoes.Factory.Conexao;

type
  TControllerConexoesFactoryConexao = class(TInterfacedObject, iControllerFactoryConexao)
    private

    public
      constructor Create;
      destructor Destroy; override;

      class function New : iControllerFactoryConexao;

      function Conexao : iModelConexao;
  end;

implementation

{ TControllerConexoesFactoryConexao }

function TControllerConexoesFactoryConexao.Conexao: iModelConexao;
begin
  Result := TModelConexoesFactoryConexao.New
              .ConexaoFiredac
              .Parametros
                .Database('D:\BDFirebird\MENUS.FDB')
                .UserName('SYSDBA')
                .Password('12345')
                .DriverID('FB')
                .Server('localhost')
                .Porta(3050)
              .EndParamentos
              .Conectar;
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
