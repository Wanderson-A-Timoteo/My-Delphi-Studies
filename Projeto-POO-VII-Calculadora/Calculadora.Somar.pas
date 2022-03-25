unit Calculadora.Somar;

interface


uses
  Calculadora.Interfaces, Calculadora.Helpers, System.SysUtils,
  Calculadora.Operacoes, System.Generics.Collections;

type
  // Toda classe precisa receber TInterfacedObject e a interface que ela usa
  TSomar = class sealed (TOperacoes)
  public
    constructor Create(var Value : TList<double>);
    destructor Destroy; override;

    class function New(var Value : TList<double>): IOperacoes;  // Metodo construtor

    function Executar : String; override;

  end;

implementation


{ TSomar }

constructor TSomar.Create(var Value : TList<double>);
begin
  FLista := Value;
end;

destructor TSomar.Destroy;
begin

  inherited;
end;

function TSomar.Executar: String;
var
  I : Integer;
begin
  Result := FLista[0].ToString;
  for I := 1 to FLista.Count-1 do
    Result := (Result.ToDouble + FLista[I]).ToString;
  DisplayTotal(Result);
  inherited;
end;

class function TSomar.New(var Value : TList<double>): IOperacoes;
begin
  Result := Self.Create(Value);
end;

end.
