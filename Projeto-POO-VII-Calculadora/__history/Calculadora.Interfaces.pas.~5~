unit Calculadora.Interfaces;

interface

uses
  System.SysUtils, Controls, System.Generics.Collections;

type

  // Interface
  IOperacoes = Interface
    ['{187FB061-D7B5-48A5-BB46-7E989E40AAA6}'] // Assinatura da Interface

    function Executar : String;

  End;

  // Interface
  ICalculadora = Interface
    function Add(Value : String) : ICalculadora; overload;
    function Add(Value : Integer) : ICalculadora; overload;
    function Add(Value : Currency) : ICalculadora; overload;
    function Somar: IOperacoes;
    function Subtrair: IOperacoes;
    function Dividir: IOperacoes;
    function Multiplicar: IOperacoes;

  end;

implementation

end.
