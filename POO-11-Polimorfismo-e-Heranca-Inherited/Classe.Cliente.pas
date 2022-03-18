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
    function RetornaNome : String; override;
    function MetodoAbstrato : String; override;
  end;

implementation

{ TCliente }

function TCliente.MetodoAbstrato: String;
begin
  Result := 'Eu sou o Metodo Abstrato';
end;

function TCliente.RetornaNome: String;
begin
  inherited;
  Result := 'Eu sou Filha de ' + Nome;
end;

procedure TCliente.SetValorCredito(const Value: Currency);
begin
  FValorCredito := Value;
end;

end.
