unit Calculadora.Operacoes;

interface

uses
  Calculadora.Interfaces, System.Generics.Collections;

type
  TOperacoes = class(TInterfacedObject, IOperacoes)
  protected
    FLista : TList<double>;
  public
    function Executar : String; virtual;
  end;

implementation

{ TOperacoes }

function TOperacoes.Executar: String;
begin
  FLista.Clear;
end;

end.
