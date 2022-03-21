unit Classe.Carro;

interface

type
TCarro = class

{
  Criando uma classe Roda dentro da Classe Carro, encapsulando essa classe
  que é especifica do Carro, desta forma nenhuma outra classe tera acesso
    a esta classe Roda
}
  type
  TRoda = class
    public
      Tipo : String;
      Tamanho : Integer;
  end;

  private
    Marca : String;
    Modelo : String;
    Roda : TRoda; // Criando um atributo da classe Carro do tipo Classe Roda

  public
    procedure MontarCarro;

end;

implementation

{ TCarro }

procedure TCarro.MontarCarro;
begin
  Marca := 'BMW';
  Modelo := 'i320';
  Roda.Tipo := 'Liga Leve';
  Roda.Tamanho := 15;
end;

end.
