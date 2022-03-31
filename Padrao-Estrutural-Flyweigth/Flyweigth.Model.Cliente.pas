unit Flyweigth.Model.Cliente;

interface

uses
  Flyweigth.Model.Interfaces;

Type
  TModelCliente = class(TInterfacedObject, iCliente)
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

{ TModelCliente }

constructor TModelCliente.Create;
begin

end;

destructor TModelCliente.Destroy;
begin

  inherited;
end;

function TModelCliente.Display(Value: TEvDisplay): iCliente;
begin
  Result := Self;
  FDisplay := Value;
end;

function TModelCliente.EnviarEmail: iCliente;
begin
  Result := Self;
  FDisplay('DEFAULT ' + FNome + ' - ' + FEmail);
end;

class function TModelCliente.New: iCliente;
begin
  Result := Self.Create;
end;

function TModelCliente.SetEmail(Value: String): iCliente;
begin
  Result := Self;
  FEmail := Value;
end;

function TModelCliente.SetNome(Value: String): iCliente;
begin
  Result := Self;
  FNome := Value;
end;

end.
