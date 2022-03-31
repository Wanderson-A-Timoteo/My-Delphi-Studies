unit Flyweigth.Model.Cliente.USA;

interface

uses
  Flyweigth.Model.Interfaces;

Type
  TModelClienteUSA = class(TInterfacedObject, iCliente)
    private
    FEmail: String;
    FNome: String;
    FDisplay : TEvDisplay;
    function SetEmail(Value: String) : iCliente;
    function SetNome(Value: String): iCliente;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iCliente;
      function Display(Value : TEvDisplay) : iCliente;
      function EnviarEmail: iCliente;
  end;

implementation

{ TModelClienteUSA }

constructor TModelClienteUSA.Create;
begin

end;

destructor TModelClienteUSA.Destroy;
begin

  inherited;
end;

function TModelClienteUSA.Display(Value: TEvDisplay): iCliente;
begin
  Result := Self;
  FDisplay := Value;
end;

function TModelClienteUSA.EnviarEmail: iCliente;
begin
  Result := Self;
  FDisplay('INGLES ' + FNome + ' - ' + FEmail);
end;

class function TModelClienteUSA.New: iCliente;
begin
  Result := Self.Create;
end;

function TModelClienteUSA.SetEmail(Value: String): iCliente;
begin
  Result := Self;
  FEmail := Value;
end;

function TModelClienteUSA.SetNome(Value: String): iCliente;
begin
  Result := Self;
  FNome := Value;
end;

end.
