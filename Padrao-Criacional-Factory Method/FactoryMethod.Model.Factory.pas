unit FactoryMethod.Model.Factory;

interface

uses
  FactoryMethod.Model.Interfaces, FactoryMethod.Model.CocaCola,
  FactoryMethod.Model.Guarana;

Type
  TModelFactory = class(TInterfacedObject, iRefrigeranteFactory)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iRefrigeranteFactory;
      function Refrigerante(Tipo : TTipoRefrigerante) : iRefrigerante;
  end;

implementation

{ TModelFactory }

constructor TModelFactory.Create;
begin

end;

destructor TModelFactory.Destroy;
begin

  inherited;
end;

class function TModelFactory.New: iRefrigeranteFactory;
begin
  Result := Self.Create;
end;

function TModelFactory.Refrigerante(Tipo: TTipoRefrigerante): iRefrigerante;
begin
  case Tipo of
    CocaCola: Result := TModelCocaCola.New;
    Guarana: Result := TModelGuarana.New;
  end;
end;

end.
