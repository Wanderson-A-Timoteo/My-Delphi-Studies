unit Iterator.Model.Venda;

interface

uses Iterator.Model.Interfaces, System.Generics.Collections,
  Iterator.Model.Itens.Iterator;

Type
  TModelVenda = class(TInterfacedObject, iVenda)
    private
      FItens : TList<iItens>;
      FIteratorItens : iIteratorItens;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iVenda;
      function AddItens(Value : iItens) : iVenda;
      function Total : Currency;
      function Itens : iIteratorItens;
  end;

implementation

{ TModelVenda }

function TModelVenda.AddItens(Value: iItens): iVenda;
begin
  FItens.Add(Value);
end;

constructor TModelVenda.Create;
begin
  FItens := TList<iItens>.Create;
  FIteratorItens := TModelItensIterator.New;
end;

destructor TModelVenda.Destroy;
begin
  FItens.Free;
  inherited;
end;

function TModelVenda.Itens: iIteratorItens;
begin
  Result := FIteratorItens.AddList(FItens);
end;

class function TModelVenda.New: iVenda;
begin
  Result := Self.Create;
end;

function TModelVenda.Total: Currency;
var
  I: iIteratorItens;
begin
  Result := 0;
  I := Self.Itens;
  while I.hasNext do
    Result := Result + I.Next.Total;
end;

end.
