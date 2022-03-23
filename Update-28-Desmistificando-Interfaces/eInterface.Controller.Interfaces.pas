unit eInterface.Controller.Interfaces;

interface

uses
  eInterface.Model.Interfaces;

type
  TTypePessoa = (tpFisica, tpJuridica);

  IControllerPessoa = Interface
    ['{9F0F13D0-4B4A-406C-BDB4-76BC89BAE373}']
    function Pessoa(Value : TTypePessoa) : IPessoa;
  End;

implementation

end.
