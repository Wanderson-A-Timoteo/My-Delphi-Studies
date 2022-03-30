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
var
  Conexao : Integer;
begin
  Conexao := 0;

  case Conexao of
    0 :  Result := TModelConexaoFactoryConexoes.New
              .ConexaoFiredac
              .Parametros
                .Database('D:\Bancos\Firebird\DIVERSOS.FDB')
                .UserName('SYSDBA')
                .Password('masterkey')
                .DriverID('FB')
                .Server('localhost')
                .Porta(3050)
              .EndParametros
              .Conectar;

    1 : raise Exception.Create('Componente de Acesso Zeos Não Configurado');
  end;



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
