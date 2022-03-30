unit FactoryMethod.Model.Guarana;

interface

uses FactoryMethod.Model.Interfaces;

Type
  TModelGuarana = class(TInterfacedObject, iRefrigerante)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iRefrigerante;
      function GetNome : String;
  end;

implementation

{ TModelGuarana }

constructor TModelGuarana.Create;
begin

end;

destructor TModelGuarana.Destroy;
begin

  inherited;
end;

function TModelGuarana.GetNome: String;
begin
  Result := 'Guarana';
end;

class function TModelGuarana.New: iRefrigerante;
begin
  Result := Self.Create;
end;

end.
