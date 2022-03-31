unit Composite.Model.Venda;

interface

uses Composite.Model.Interfaces, System.Generics.Collections,
  Composite.Model.Itens;

Type
  TModelVenda = class(TInterfacedObject, iVenda)
  private
    FItens : TList<iItens>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iVenda;
    function Add(Value: iItens): iVenda;
    function Total: Currency;
  end;

implementation

{ TModelVenda }

function TModelVenda.Add(Value: iItens): iVenda;
begin
  Result := Self;
  FItens.Add(Value);
end;

constructor TModelVenda.Create;
begin
  FItens := TList<iItens>.Create;
end;

destructor TModelVenda.Destroy;
begin
  FItens.Free;
  inherited;
end;

class function TModelVenda.New: iVenda;
begin
  Result := Self.Create;
end;

function TModelVenda.Total: Currency;
var
  I: Integer;
begin
  Result := 0;
  for I := 0 to Pred(FItens.Count) do
    Result := Result + FItens[I].Total;
end;

end.
