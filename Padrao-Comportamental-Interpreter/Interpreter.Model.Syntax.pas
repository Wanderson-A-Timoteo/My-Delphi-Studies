unit Interpreter.Model.Syntax;

interface

uses Interpreter.Model.Interfaces, System.Classes, System.Generics.Collections,
  Interpreter.Model.Context, Interpreter.Model.Expression.Acao,
  Interpreter.Model.Expression.Item;

Type
  TModelSyntax = class(TInterfacedObject, iSyntax)
    private
      FLista : TList<iExpression>;
      FContext : iContext;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iSyntax;
      function Process(Value : String) : String;
  end;

implementation

{ TModelSyntax }

constructor TModelSyntax.Create;
begin
  FLista := TList<iExpression>.Create;
  FContext := TModelContext.New;
end;

destructor TModelSyntax.Destroy;
begin
  FLista.Free;
  inherited;
end;

class function TModelSyntax.New: iSyntax;
begin
  Result := Self.Create;
end;

function TModelSyntax.Process(Value: String): String;
var
  I: Integer;
begin
  FContext.Entrada := Value;
  FLista.Add(TModelExpressionAcao.New);
  FLista.Add(TModelExpressionItem.New);

  for I := 0 to Pred(FLista.Count) do
    FLista[I].Interpreter(FContext);

  Result := FContext.Saida;
end;

end.
