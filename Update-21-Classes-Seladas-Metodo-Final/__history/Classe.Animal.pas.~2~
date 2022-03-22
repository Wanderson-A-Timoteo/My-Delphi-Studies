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

end.
