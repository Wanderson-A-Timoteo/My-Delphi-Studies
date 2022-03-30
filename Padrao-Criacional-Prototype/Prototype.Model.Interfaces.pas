unit Prototype.Model.Interfaces;

interface

type
  iPrototype<T> = interface
    ['{11445C04-12AB-4EDF-A48B-66F4C9F309C2}']
    function Clone : T;
  end;


  iItens = interface
    ['{0B45097D-5B4E-4D00-AC0A-038F143422C7}']
    procedure SetCodigo(const Value: Integer);
    procedure SetDescricao(const Value: String);
    function GetCodigo : Integer;
    function GetDescricao : String;
    function GetPrecoUnitario: Currency;
    procedure SetPrecoUnitario(const Value: Currency);
    property Codigo : Integer read GetCodigo write SetCodigo;
    property Descricao : String read GetDescricao write SetDescricao;
    property PrecoUnitario: Currency read GetPrecoUnitario
      write SetPrecoUnitario;
    function Prototype : iPrototype<iItens>;
    function PrecoVenda : Currency;
  end;

implementation

end.
