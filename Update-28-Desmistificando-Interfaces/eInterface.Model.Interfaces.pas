unit eInterface.Model.Interfaces;

interface

type

  TEventDisplay = procedure (Value : String) of Object;

  IPessoa = Interface
    ['{5BBE5449-3972-4B4C-B742-C2B781D9C674}']

    function Nome(Value : String) : IPessoa; overload;
    function Nome : String; overload;
    function SobreNome(Value : String) : IPessoa;
    function NomeCompleto : IPessoa;
    function Display (Value : TEventDisplay) : IPessoa;
  End;

  IPessoaFactory = Interface
    ['{5DBE2149-28D6-40D2-B8BA-ED685625865C}']
    function PessoaFisica : IPessoa;
    function PessoaJuridica : IPessoa;
  End;

implementation

end.
