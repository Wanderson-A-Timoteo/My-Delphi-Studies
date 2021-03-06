unit Calculadora.Operacoes;

interface

uses
  Calculadora.Interfaces, System.Generics.Collections, Calculadora.Eventos;

type
  TOperacoes = class(TInterfacedObject, IOperacoes, IOperacoesDisplay)
  protected
    FLista : TList<double>;
    FEventDisplayTotal : TEventDisplayTotal;
    procedure DisplayTotal(Value : String);
  public
    function Executar : String; virtual;
    function Display : IOperacoesDisplay;
    function Resultado(Value : TEventDisplayTotal) : IOperacoesDisplay;
    function EndDisplay : IOperacoes;
  end;

implementation

{ TOperacoes }

function TOperacoes.Display: IOperacoesDisplay;
begin
  Result := Self;
end;

procedure TOperacoes.DisplayTotal(Value: String);
begin
  if Assigned(FEventDisplayTotal) then
    FEventDisplayTotal(Value);
end;

function TOperacoes.EndDisplay: IOperacoes;
begin
  Result := Self;
end;

function TOperacoes.Executar: String;
begin
  FLista.Clear;
end;

function TOperacoes.Resultado(Value: TEventDisplayTotal): IOperacoesDisplay;
begin
  Result := Self;
  FEventDisplayTotal := Value;
end;

end.
