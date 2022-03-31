unit Composite.Model.Itens;

interface

uses Composite.Model.Interfaces;

Type
  TModelItens = class(TInterfacedObject, iItens)
  private
    FPreco : Currency;
    FQuantidade : Currency;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iItens;
    function Quantidade(Value: Currency): iItens;
    function Preco(Value: Currency): iItens;
    function Total: Currency;
  end;

implementation

{ TModelItens }

constructor TModelItens.Create;
begin

end;

destructor TModelItens.Destroy;
begin

  inherited;
end;

class function TModelItens.New: iItens;
begin
  Result := Self.Create;
end;

function TModelItens.Preco(Value: Currency): iItens;
begin
  Result := Self;
  FPreco := Value;
end;

function TModelItens.Quantidade(Value: Currency): iItens;
begin
  Result := Self;
  FQuantidade := Value;
end;

function TModelItens.Total: Currency;
begin
  Result := (FQuantidade * FPreco);
end;

end.
