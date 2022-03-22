unit Classe.Cliente;

interface

uses Classe.Pessoa;

type
  TCliente = class(TPessoa)

    Saldo : Currency;
    function Devedor : Currency;
end;

implementation

{ TCliente }

function TCliente.Devedor: Currency;
begin
  Self.GetFProtected;
  Result := Saldo;
end;

end.
