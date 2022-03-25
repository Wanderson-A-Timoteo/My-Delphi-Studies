unit Calculadora.Subtrair;

interface

uses
  Calculadora.Interfaces, Calculadora.Helpers, System.SysUtils,
  Calculadora.Operacoes, System.Generics.Collections;

type

  TSubtrair = class sealed (TOperacoes)
    constructor Create(var Value : TList<double>);
    destructor Destroy; override;

    class function New(var Value : TList<double>): IOperacoes;

    function Executar : String; override;
  end;

implementation


{ TSubtrair }

constructor TSubtrair.Create(var Value : TList<double>);
begin
  FLista := Value;
end;

destructor TSubtrair.Destroy;
begin

  inherited;
end;

function TSubtrair.Executar: String;
var
  I : Integer;
begin
  Result := FLista[0].ToString;
  for I := 1 to FLista.Count-1 do
    Result := (Result.ToDouble - FLista[I]).ToString;
  inherited;
end;

class function TSubtrair.New(var Value : TList<double>): IOperacoes;
begin
  Result := Self.Create(Value);
end;

end.
