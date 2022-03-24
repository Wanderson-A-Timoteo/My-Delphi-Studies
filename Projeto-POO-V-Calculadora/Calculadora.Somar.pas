unit Calculadora.Somar;

interface


uses
  Calculadora.Interfaces, Calculadora.Helpers, System.SysUtils;

type
  // Toda classe precisa receber TInterfacedObject e a interface que ela usa
  TSomar = class(TInterfacedObject, IOperacoes)
  public
    constructor Create;
    destructor Destroy; override;

    class function New: IOperacoes;  // Metodo construtor

    function Operacao(Num1, Num2: double): double; overload;
    function Operacao(Num1, Num2 : String) : String; overload;

  end;

implementation


{ TSomar }

constructor TSomar.Create;
begin

end;

destructor TSomar.Destroy;
begin

  inherited;
end;

class function TSomar.New: IOperacoes;
begin
  Result := Self.Create;
end;

function TSomar.Operacao(Num1, Num2: String): String;
begin
  Result := (Num1.ToDouble + Num2.ToDouble).ToString;
end;

function TSomar.Operacao(Num1, Num2: double): double;
begin
  Result := Num1 + Num2;
end;

end.
