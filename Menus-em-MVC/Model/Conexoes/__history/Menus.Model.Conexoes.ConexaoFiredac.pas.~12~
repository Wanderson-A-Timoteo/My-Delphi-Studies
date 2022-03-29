unit Menus.Model.Conexoes.ConexaoFiredac;

interface

uses Menus.Model.Conexoes.Interfaces, FireDAC.Comp.Client, System.Classes,
  FireDAC.Comp.UI, FireDAC.Phys.FB, System.SysUtils;

type
  TModelConexaoFiredac = class(TInterfacedObject, iModelConexao, iModelConexaoParametros)
    private
      // Conexão com o FireDAC | declarar uses FireDAC.Comp.Client
      FConexao            : TFDConnection;
      FDGUIxWaitCursor1   : TFDGUIxWaitCursor;
      FDPhysFBDriverLink1 : TFDPhysFBDriverLink;
      FDatabase           : String;
      FPorta              : Integer;
      FServer             : String;
      FDriverID           : String;
      FUserName           : String;
      FPassword           : String;
    procedure LerParametros;
    public
      constructor Create;
      destructor Destroy; override;

      class function New  : iModelConexao;

      function EndConexao : TComponent;

      function Database(Value : String) : iModelConexaoParametros;
      function Porta(Value : Integer)   : iModelConexaoParametros;
      function Server(Value : String)   : iModelConexaoParametros;
      function DriverID(Value : String) : iModelConexaoParametros;
      function UserName(Value : String) : iModelConexaoParametros;
      function Password(Value : String) : iModelConexaoParametros;
      function EndParamentos            : iModelConexao;
  end;

implementation

{ TModelConexaoFiredac }

constructor TModelConexaoFiredac.Create;
begin
  FConexao            := TFDConnection.Create(nil);
  FDGUIxWaitCursor1   := TFDGUIxWaitCursor.Create(nil);
  FDPhysFBDriverLink1 := TFDPhysFBDriverLink.Create(nil);
  LerParametros;
  FConexao.Connected := true;

end;

function TModelConexaoFiredac.Database(Value: String): iModelConexaoParametros;
begin
  FDatabase := Value;
end;

destructor TModelConexaoFiredac.Destroy;
begin
  FConexao.Free;
  FDGUIxWaitCursor1.Free;
  FDPhysFBDriverLink1.Free;
  inherited;
end;

function TModelConexaoFiredac.DriverID(Value: String): iModelConexaoParametros;
begin
  Result := Self;
  FDriverID := Value;
end;

function TModelConexaoFiredac.EndConexao: TComponent;
begin
  Result := FConexao;
end;

function TModelConexaoFiredac.EndParamentos: iModelConexao;
begin
  Result := Self;
end;

procedure TModelConexaoFiredac.LerParametros;
begin
  FConexao.Params.Database := FDatabase;
  FConexao.Params.UserName := FUserName;
  FConexao.Params.Password := FPassword;
  FConexao.Params.DriverID := FDriverID;
  FConexao.Params.Add('server = ' + FServer);
  FConexao.Params.Add('Port = ' + IntToStr(FPorta));
end;

class function TModelConexaoFiredac.New: iModelConexao;
begin
  Result := Self.Create;
end;

function TModelConexaoFiredac.Password(Value: String): iModelConexaoParametros;
begin
  Result := Self;
  FPassword := Value;
end;

function TModelConexaoFiredac.Porta(Value: Integer): iModelConexaoParametros;
begin
  Result := Self;
  FPorta := Value;
end;

function TModelConexaoFiredac.Server(Value: String): iModelConexaoParametros;
begin
  Result := Self;
  FServer := Value;
end;

function TModelConexaoFiredac.UserName(Value: String): iModelConexaoParametros;
begin
  Result := Self;
  FUserName := Value;
end;

end.
