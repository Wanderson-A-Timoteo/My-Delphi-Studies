unit Flyweigth.Model.Cliente.Espanha;

interface

uses
  Flyweigth.Model.Interfaces;

Type
  TModelClienteEspanha = class(TInterfacedObject, iCliente)
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

{ TModelClienteEspanha }

constructor TModelClienteEspanha.Create;
begin

end;

destructor TModelClienteEspanha.Destroy;
begin

  inherited;
end;

function TModelClienteEspanha.Display(Value: TEvDisplay): iCliente;
begin
  Result := Self;
  FDisplay := Value;
end;

function TModelClienteEspanha.EnviarEmail: iCliente;
begin
  Result := Self;
  FDisplay('ESPANHOL ' + FNome + ' - ' + FEmail);
end;

class function TModelClienteEspanha.New: iCliente;
begin
  Result := Self.Create;
end;

function TModelClienteEspanha.SetEmail(Value: String): iCliente;
begin
  Result := Self;
  FEmail := Value;
end;

function TModelClienteEspanha.SetNome(Value: String): iCliente;
begin
  Result := Self;
  FNome := Value;
end;

end.
