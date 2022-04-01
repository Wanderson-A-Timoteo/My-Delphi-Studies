unit Prototype.Model.Strategy;

interface

Type
  TPromocao = (Domingo, Segunda, Terca, Quarta, Quinta, Sexta, Sabado);

  THelperPromocao = record helper for TPromocao
    function PrecoVenda(PrecoUnitario: Currency): Currency;
  end;

implementation

{ THelperPromoca }

function THelperPromocao.PrecoVenda(PrecoUnitario: Currency): Currency;
begin
  case Self of
    Domingo:
      Result := PrecoUnitario;
    Segunda:
      Result := PrecoUnitario - (PrecoUnitario * 0.20);
    Terca:
      Result := PrecoUnitario - (PrecoUnitario * 0.30);
    Quarta:
      Result := PrecoUnitario - (PrecoUnitario * 0.40);
    Quinta:
      Result := PrecoUnitario - (PrecoUnitario * 0.50);
    Sexta:
      Result := PrecoUnitario - (PrecoUnitario * 0.60);
    Sabado:
      Result := PrecoUnitario - (PrecoUnitario * 0.70);
  end;
end;

end.
