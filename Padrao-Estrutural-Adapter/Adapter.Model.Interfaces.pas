unit Adapter.Model.Interfaces;

interface

uses
  System.Generics.Collections;

type

  TItens = record
    Produto : String;
    Valor : Currency;
  end;

  iControllerItens = interface
    ['{8E88A79B-C071-4B64-B05D-36304C9B4CA7}']
    function Add(Value : TItens) : iControllerItens;
    function Itens : TList<TITens>;
  end;

  iModelItens = interface
    ['{F21EAE0F-E3E4-4A0D-A778-41E1BA1CF4DF}']
    function Add(Value : iModelItens) : iModelItens;
    function Itens : TList<iModelItens>;
    function GetProduto : String;
    function GetValor : Currency;
    function SetProduto(Value : String) : iModelItens;
    function SetValor(Value : Currency) : iModelItens;
  end;


implementation

end.
