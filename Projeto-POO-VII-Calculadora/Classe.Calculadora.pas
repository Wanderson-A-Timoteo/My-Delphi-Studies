unit Classe.Calculadora;

interface

uses
  System.SysUtils, Controls, System.Generics.Collections, Calculadora.Interfaces,
  Calculadora.Dividir, Calculadora.Multiplicar, Calculadora.Somar,
  Calculadora.Subtrair, Calculadora.Eventos;

type
  // Classe
  TCalculadora = class(TInterfacedObject, ICalculadora, ICalculadoraDisplay)
  private
    FLista : TList<Double>;
    FEventDisplayTotal : TEventDisplayTotal;

  public
    constructor Create;
    destructor Destroy; override;

    class function New: ICalculadora;

    function Somar: IOperacoes;
    function Subtrair: IOperacoes;
    function Dividir: IOperacoes;
    function Multiplicar: IOperacoes;

    function Display : ICalculadoraDisplay;
    function Resultado(Value : TEventDisplayTotal) : ICalculadoraDisplay;
    function EndDisplay : ICalculadora;

    function Add(Value : String) : ICalculadora; overload;
    function Add(Value : Integer) : ICalculadora; overload;
    function Add(Value : Currency) : ICalculadora; overload;
  end;


implementation


{ TCalculadora }

function TCalculadora.Add(Value: String): ICalculadora;
begin
  Result := Self;
  FLista.Add(Value.ToDouble);
end;

function TCalculadora.Add(Value: Integer): ICalculadora;
begin
  Result := Self;
  FLista.Add(Value.ToDouble);
end;

function TCalculadora.Add(Value: Currency): ICalculadora;
begin
  Result := Self;
  FLista.Add(Value);
end;

constructor TCalculadora.Create;
begin
  FLista := TList<Double>.Create;
end;

destructor TCalculadora.Destroy;
begin
  FLista.Free;
  inherited;
end;

function TCalculadora.Display: ICalculadoraDisplay;
begin
  Result :=Self;
end;

function TCalculadora.Dividir: IOperacoes;
begin
  Result := TDividir.New(FLista).Display.Resultado(FEventDisplayTotal).EndDisplay;
end;

function TCalculadora.EndDisplay: ICalculadora;
begin
  Result := Self;
end;

function TCalculadora.Multiplicar: IOperacoes;
begin
  Result := TMultiplicar.New(FLista).Display.Resultado(FEventDisplayTotal).EndDisplay;
end;

class function TCalculadora.New: ICalculadora;
begin
  Result := Self.Create;
end;

function TCalculadora.Resultado(Value: TEventDisplayTotal): ICalculadoraDisplay;
begin
  Result := Self;
  FEventDisplayTotal := Value;
end;

function TCalculadora.Somar: IOperacoes;
begin
Result := TSomar.New(FLista).Display.Resultado(FEventDisplayTotal).EndDisplay;
end;

function TCalculadora.Subtrair: IOperacoes;
begin
  Result := TSubtrair.New(FLista).Display.Resultado(FEventDisplayTotal).EndDisplay;
end;

end.
