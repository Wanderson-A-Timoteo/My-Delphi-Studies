unit Classe.Cliente;

interface

uses Classe.Pessoa;

type
  TCliente = class(TPessoa)
  private
    FValorCredito: Currency;
    procedure SetValorCredito(const Value: Currency);
  public
    property ValorCredito : Currency read FValorCredito write SetValorCredito;
  end;

implementation

{ TCliente }

procedure TCliente.SetValorCredito(const Value: Currency);
begin
  FValorCredito := Value;
end;

end.
