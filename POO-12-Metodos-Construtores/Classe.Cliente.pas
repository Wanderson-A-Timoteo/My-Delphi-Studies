unit Classe.Cliente;

interface

uses Classe.Pessoa;

type
  TCliente = class(TPessoa)
  private
    FValorCredito: Currency;
    procedure SetValorCredito(const Value: Currency);
  public
    constructor Create; overload;
    constructor Create(Value : String); overload;
    constructor Create(Value : TPessoa); overload;
    property ValorCredito : Currency read FValorCredito write SetValorCredito;
    function RetornaNome : String; override;
    function MetodoAbstrato : String; override;
  end;

implementation

{ TCliente }

constructor TCliente.Create;
begin
  Nome := 'Novo Cliente';
end;

constructor TCliente.Create(Value: String);
begin
  Nome := Value;
end;

constructor TCliente.Create(Value: TPessoa);
begin
  Nome := Value.Nome;
  DataNasc := Value.DataNasc;
  Sexo := Value.Sexo;
end;

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
