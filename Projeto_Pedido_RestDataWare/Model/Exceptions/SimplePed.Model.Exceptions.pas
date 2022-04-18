unit SimplePed.Model.Exceptions;

interface

uses
  System.SysUtils;

type
  TValidaCampo = class(Exception)
    public
      FCampo : String;
      FMensagem : String;
      constructor Create(aCampo : String; aMensagem : String);
  end;

implementation

{ TValidaCampo }

constructor TValidaCampo.Create(aCampo, aMensagem: String);
begin
  FCampo := aCampo;
  FMensagem := aMensagem;
end;

end.
