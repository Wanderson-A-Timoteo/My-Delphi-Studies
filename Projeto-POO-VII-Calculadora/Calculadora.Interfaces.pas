unit Calculadora.Interfaces;

interface

uses
  System.SysUtils, Controls, System.Generics.Collections, Calculadora.Eventos;

type

  ICalculadora = Interface;
  IOperacoesDisplay = Interface;

  // Interface
  IOperacoes = Interface
    ['{187FB061-D7B5-48A5-BB46-7E989E40AAA6}'] // Assinatura da Interface

    function Executar : String;
    function Display : IOperacoesDisplay;

  End;

  IOperacoesDisplay = Interface
    ['{D28FC3F0-6270-4F5F-84DF-3D9E7DFB40CE}']
    function Resultado(Value : TEventDisplayTotal) : IOperacoesDisplay;
    function EndDisplay : IOperacoes;
  End;

  ICalculadoraDisplay = Interface
    ['{02333E8F-DF6F-4B79-BE28-20419B07B21C}']
    function Resultado(Value : TEventDisplayTotal) : ICalculadoraDisplay;
    function EndDisplay : ICalculadora;
  End;


  // Interface
  ICalculadora = Interface
    ['{B302AC98-88A7-4A40-B8C2-CEB67C7AC1D1}']
    function Add(Value : String) : ICalculadora; overload;
    function Add(Value : Integer) : ICalculadora; overload;
    function Add(Value : Currency) : ICalculadora; overload;
    function Somar: IOperacoes;
    function Subtrair: IOperacoes;
    function Dividir: IOperacoes;
    function Multiplicar: IOperacoes;
    function Display : ICalculadoraDisplay;

  end;


implementation

end.
