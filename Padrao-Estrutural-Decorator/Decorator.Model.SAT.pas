unit Decorator.Model.SAT;

interface

uses Decorator.Model.Interfaces;

Type
  TModelSAT = class(TInterfacedObject, iModelVenda)
    private
      FDecorator : iModelVenda;
    public
      constructor Create(Decorator : iModelVenda);
      destructor Destroy; override;
      class function New(Decorator : iModelVenda) : iModelVenda;
      function Venda : iModelVenda;
  end;

implementation

{ TModelSAT }

constructor TModelSAT.Create(Decorator : iModelVenda);
begin
  FDecorator := Decorator;
end;

destructor TModelSAT.Destroy;
begin

  inherited;
end;

class function TModelSAT.New(Decorator : iModelVenda) : iModelVenda;
begin
  Result := Self.Create(Decorator);
end;

function TModelSAT.Venda: iModelVenda;
begin
  if Assigned(FDecorator) then FDecorator.Venda;
  Result := Self;
end;

end.
