unit Flyweigth.Model.Cliente.Flyweigth;

interface

uses Flyweigth.Model.Interfaces, System.Classes;

Type
  TModelClienteFlyweight = class(TInterfacedObject, iFlyWeigth<iCliente>)
    private
      FList : TStringList;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iFlyWeigth<iCliente>;
      function GetInstance: iCliente;
  end;

implementation

{ TModelClienteFlyweight }

constructor TModelClienteFlyweight.Create;
begin

end;

destructor TModelClienteFlyweight.Destroy;
begin

  inherited;
end;

function TModelClienteFlyweight.GetInstance: iCliente;
var
  Index : Integer;
begin
  if FList.Find('TModelCliente', Index) then
    Result := TInterfacedObject(FList[Index]) as iCliente
  else
    FList

end;

class function TModelClienteFlyweight.New: iFlyWeigth<iCliente>;
begin
  Result := Self.Create;
end;

end.
