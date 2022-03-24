unit Calculadora.Multiplicar;

interface

uses
  Calculadora.Interfaces, Calculadora.Helpers, System.SysUtils;

type

  TMultiplicar = class(TInterfacedObject, IOperacoes)
    constructor Create;
    destructor Destroy; override;

    class function New: IOperacoes;

    function Operacao(Num1, Num2: double): double; overload;
    function Operacao(Num1, Num2 : String) : String; overload;
  end;

implementation


{ TMultiplicar }

constructor TMultiplicar.Create;
begin

end;

destructor TMultiplicar.Destroy;
begin

  inherited;
end;

class function TMultiplicar.New: IOperacoes;
begin
  Result := Self.Create;
end;

function TMultiplicar.Operacao(Num1, Num2: String): String;
begin
  Result := CurrToStr(Num1.ToDouble * Num2.ToDouble);
end;

function TMultiplicar.Operacao(Num1, Num2: double): double;
begin
  Result := Num1 * Num2;
end;

end.
