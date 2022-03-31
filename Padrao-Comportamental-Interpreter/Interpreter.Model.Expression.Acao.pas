unit Interpreter.Model.Expression.Acao;

interface

uses Interpreter.Model.Interfaces;

Type
  TModelExpressionAcao = class(TInterfacedObject, iExpression)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iExpression;
      function Interpreter(Value: iContext): iExpression;
  end;

implementation

uses
  System.SysUtils;

{ TModelExpressionAcao }

constructor TModelExpressionAcao.Create;
begin

end;

destructor TModelExpressionAcao.Destroy;
begin

  inherited;
end;

function TModelExpressionAcao.Interpreter(Value: iContext): iExpression;
begin
  Result := Self;
  if Pos('VENDER', UpperCase(Value.Entrada)) > 0 then
    Value.Saida := 'VENDIDO O ITEM ';
  if Pos('CANCELAR', UpperCase(Value.Entrada)) > 0 then
    Value.Saida := 'CANCELADO O ITEM ';
  if Pos('DEVOLVER', UpperCase(Value.Entrada)) > 0 then
    Value.Saida := 'DEVOLVIDO O ITEM ';
end;

class function TModelExpressionAcao.New: iExpression;
begin
  Result := Self.Create;
end;

end.
