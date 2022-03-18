unit Classe.Vendedor;

interface

uses
  Classe.Pessoa;

type
  TVendedor = class(TPessoa)
  private
    FComissao: Currency;
    procedure SetComissao(const Value: Currency);
  public
    property Comissao : Currency read FComissao write SetComissao;

  end;

implementation

{ TVendedor }

procedure TVendedor.SetComissao(const Value: Currency);
begin
  FComissao := Value;
end;

end.
