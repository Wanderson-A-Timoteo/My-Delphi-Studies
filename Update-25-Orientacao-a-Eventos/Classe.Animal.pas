unit Classe.Animal;

interface

Type
  TAnimal = class
    function Voz : String; virtual; abstract;
  end;

  TCachorro = class(TAnimal)
    function Voz : String; override;
  end;

  TGato = class(TAnimal)
    function Voz : String; override;
  end;
{
  - CLASSE SEALED(selada) - Essas classes não permite ser sobrecarregada.
  - METODO FINAL - O metodo FINAL não permite que seja novamente sobrecarregada,
     indica que ela poderá ser usada, mas não sobrecarregda.
}
  TDinossauro = class sealed(TAnimal)
    function Voz : String; override; //final;
  end;

  // A classe TDinosaurro esta selada, por isso esta dando erro
  {TTiranossauro = class(TDinossauro)
      //function Voz : String; override;
   end;}

implementation

{ TGato }

function TGato.Voz: String;
begin
  Result := 'Miau';
end;

{ TCachorro }

function TCachorro.Voz: String;
begin
  Result := 'Au au au';
end;

{ TDinosauro }

function TDinossauro.Voz: String;
begin
  Result := 'Gruuuuuuu!';
end;

end.
