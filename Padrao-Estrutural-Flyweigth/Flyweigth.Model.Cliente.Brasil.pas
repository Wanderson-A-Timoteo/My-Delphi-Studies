unit Flyweigth.Model.Cliente.Brasil;

interface

uses
  Flyweigth.Model.Interfaces;

Type
  TModelClienteBrasil = class(TInterfacedObject, iCliente)
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

{ TModelClienteBrasil }

constructor TModelClienteBrasil.Create;
begin

end;

destructor TModelClienteBrasil.Destroy;
begin

  inherited;
end;

function TModelClienteBrasil.Display(Value: TEvDisplay): iCliente;
begin
  Result := Self;
  FDisplay := Value;
end;

function TModelClienteBrasil.EnviarEmail: iCliente;
begin
  Result := Self;
  FDisplay('PORTUGUES ' + FNome + ' - ' + FEmail);
end;

class function TModelClienteBrasil.New: iCliente;
begin
  Result := Self.Create;
end;

function TModelClienteBrasil.SetEmail(Value: String): iCliente;
begin
  Result := Self;
  FEmail := Value;
end;

function TModelClienteBrasil.SetNome(Value: String): iCliente;
begin
  Result := Self;
  FNome := Value;
end;

end.
