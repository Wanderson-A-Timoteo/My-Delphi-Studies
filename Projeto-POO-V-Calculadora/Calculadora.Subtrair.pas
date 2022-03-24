unit Calculadora.Subtrair;

interface

uses
  Calculadora.Interfaces, Calculadora.Helpers, System.SysUtils;

type

  TSubtrair = class(TInterfacedObject, IOperacoes)
    constructor Create;
    destructor Destroy; override;

    class function New: IOperacoes;

    function Operacao(Num1, Num2: double): double; overload;
    function Operacao(Num1, Num2 : String) : String; overload;
  end;

implementation


{ TSubtrair }

constructor TSubtrair.Create;
begin

end;

destructor TSubtrair.Destroy;
begin

  inherited;
end;

class function TSubtrair.New: IOperacoes;
begin
  Result := Self.Create;
end;

function TSubtrair.Operacao(Num1, Num2: String): String;
begin
  Result := (Num1.ToDouble - Num2.ToDouble).ToString;
end;

function TSubtrair.Operacao(Num1, Num2: double): double;
begin
  Result := Num1 - Num2;
end;

end.
