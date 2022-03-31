unit Decorator.Model.NFC;

interface

uses Decorator.Model.Interfaces;

Type
  TModelNFC = class(TInterfacedObject, iModelVenda)
    private
      FDecorator : iModelVenda;
    public
      constructor Create(Decorator : iModelVenda);
      destructor Destroy; override;
      class function New(Decorator : iModelVenda) : iModelVenda;
      function Venda : iModelVenda;
  end;

implementation

{ TModelNFC }

constructor TModelNFC.Create(Decorator : iModelVenda);
begin
  FDecorator := Decorator;
end;

destructor TModelNFC.Destroy;
begin

  inherited;
end;

class function TModelNFC.New(Decorator : iModelVenda) : iModelVenda;
begin
  Result := Self.Create(Decorator);
end;

function TModelNFC.Venda: iModelVenda;
begin
  if Assigned(FDecorator) then FDecorator.Venda;
  Result := Self;
end;

end.
