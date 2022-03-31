unit Bridge.Model.Venda;

interface

uses Bridge.Model.Interfaces, System.Generics.Collections;

Type
  TModelVenda = class(TInterfacedObject, iSource<TVenda>)
    private
      FList : TList<TVenda>;
      procedure AddItens;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iSource<TVenda>;
      function Exportar(Value : iExport<TVenda>) : iSource<TVenda>;
  end;

implementation

uses
  System.SysUtils;

{ TModelVenda }

procedure TModelVenda.AddItens;
var
  Venda : TVenda;
begin
  Venda.COO := 10;
  Venda.Itens := 2;
  Venda.Total := 20;
  FList.Add(Venda);

  Venda.COO := 20;
  Venda.Itens := 2;
  Venda.Total := 20;
  FList.Add(Venda);

  Venda.COO := 30;
  Venda.Itens := 3;
  Venda.Total := 30;
  FList.Add(Venda);

  Venda.COO := 40;
  Venda.Itens := 4;
  Venda.Total := 40;
  FList.Add(Venda);
end;

constructor TModelVenda.Create;
begin
  FList := TList<TVenda>.Create;
  AddItens;
end;

destructor TModelVenda.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TModelVenda.Exportar(Value: iExport<TVenda>): iSource<TVenda>;
var
  I: Integer;
begin
  Result := Self;
  for I := 0 to Pred(FList.Count) do
    Value.GerarRegistros(FList.Items[I]);
end;

class function TModelVenda.New: iSource<TVenda>;
begin
  Result := Self.Create;
end;

end.
