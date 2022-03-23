unit Classe.Cliente;

interface

uses Classe.Pessoa;

type
  TCliente = class(TPessoa)

    Saldo : Currency;
    function Devedor : Currency;
    function Tipo : String; override;
end;

implementation

{ TCliente }

function TCliente.Devedor: Currency;
begin
  Self.GetFProtected;
  Result := Saldo;
end;

// Sobrecarregando a função herdade de TPessoa
function TCliente.Tipo: String;
begin
  Result := 'Cliente';
end;

end.
