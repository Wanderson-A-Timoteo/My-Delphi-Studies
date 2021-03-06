unit Calculadora.Dividir;

interface

uses
  Calculadora.Interfaces, Calculadora.Helpers, System.SysUtils,
  Calculadora.Operacoes, System.Generics.Collections;

type

  TDividir = class sealed (TOperacoes)
    constructor Create(var Value : TList<double>);
    destructor Destroy; override;

    class function New(var Value : TList<double>): IOperacoes;

    function Executar : String; override;
  end;

implementation



{ TDividir }

constructor TDividir.Create(var Value : TList<double>);
begin
  FLista := Value;
end;

destructor TDividir.Destroy;
begin

  inherited;
end;

function TDividir.Executar: String;
var
  I : Integer;
begin
  Result := FLista[0].ToString;
  for I := 1 to FLista.Count-1 do
    Result := (Result.ToDouble / FLista[I]).ToString;
  DisplayTotal(Result);
  inherited;
end;

class function TDividir.New(var Value : TList<double>): IOperacoes;
begin
  Result := Self.Create(Value);
end;

end.
