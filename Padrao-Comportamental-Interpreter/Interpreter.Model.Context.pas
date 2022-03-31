unit Interpreter.Model.Context;

interface

uses Interpreter.Model.Interfaces;

Type
  TModelContext = class(TInterfacedObject, iContext)
  private
    FEntrada : String;
    FSaida : String;
    function GetEntrada: String;
    function GetSaida: String;
    procedure SetEntrada(const Value: String);
    procedure SetSaida(const Value: String);
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iContext;

    property Entrada: String read GetEntrada write SetEntrada;
    property Saida: String read GetSaida write SetSaida;
  end;

implementation

{ TModelContext }

constructor TModelContext.Create;
begin

end;

destructor TModelContext.Destroy;
begin

  inherited;
end;

function TModelContext.GetEntrada: String;
begin
  Result := FEntrada;
end;

function TModelContext.GetSaida: String;
begin
  Result := FSaida;
end;

class function TModelContext.New: iContext;
begin
  Result := Self.Create;
end;

procedure TModelContext.SetEntrada(const Value: String);
begin
  FEntrada := Value;
end;

procedure TModelContext.SetSaida(const Value: String);
begin
  FSaida := FSaida + Value;
end;

end.
