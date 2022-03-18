unit Classe.Administrativo;

interface

uses
  Classe.Pessoa;

type
  TAdministrativo = class(TPessoa)
  private
    FBonus: Currency;
    procedure SetBonus(const Value: Currency);
  public
    property Bonus : Currency read FBonus write SetBonus;
  end;

implementation

{ TAdministrativo }

procedure TAdministrativo.SetBonus(const Value: Currency);
begin
  FBonus := Value;
end;

end.
