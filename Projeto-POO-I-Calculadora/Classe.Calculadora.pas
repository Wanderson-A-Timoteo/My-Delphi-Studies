unit Classe.Calculadora;

interface

uses
  System.SysUtils;

type

  // Interface
  ICalculadora = Interface
    ['{187FB061-D7B5-48A5-BB46-7E989E40AAA6}'] //Assinatura da Interface
    function Operacao(Num1, Num2 : double) : double;
  End;

  // Toda classe precisa receber TInterfacedObject e a interface que ela usa
  TSomar = class(TInterfacedObject, ICalculadora)
    function Operacao(Num1, Num2 : double) : double;
  end;

  TSubtrair = class(TInterfacedObject, ICalculadora)
    function Operacao(Num1, Num2 : double) : double;
  end;

  TDividir = class(TInterfacedObject, ICalculadora)
    function Operacao(Num1, Num2 : double) : double;
  end;

  TMultiplicar = class(TInterfacedObject, ICalculadora)
    function Operacao(Num1, Num2 : double) : double;
  end;

implementation

{ TSoma }

function TSomar.Operacao(Num1, Num2: double): double;
begin
  Result := Num1 + Num2;
end;

{ TSubtrair }

function TSubtrair.Operacao(Num1, Num2: double): double;
begin
  Result := Num1 - Num2;
end;

{ TDividir }

function TDividir.Operacao(Num1, Num2: double): double;
begin
  if Num2 <= 0 then
    raise Exception.Create('Error: Valor n�o pode ser dividido por zero');
  Result := Num1 / Num2;
end;

{ TMultiplicar }

function TMultiplicar.Operacao(Num1, Num2: double): double;
begin
  Result := Num1 * Num2;
end;

end.
