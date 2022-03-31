unit Interpreter.Model.Interfaces;

interface

type

  iContext = interface
    ['{5783E88C-1223-4880-9BF3-E4BC16FDA434}']
    function GetEntrada: String;
    function GetSaida: String;
    procedure SetEntrada(const Value: String);
    procedure SetSaida(const Value: String);
    property Entrada: String read GetEntrada write SetEntrada;
    property Saida: String read GetSaida write SetSaida;
  end;

  iExpression = interface
    ['{50BC612B-FCD8-44BF-8535-80E658B71A2C}']
    function Interpreter(Value: iContext): iExpression;
  end;

  iSyntax = interface
    ['{5D1D65A5-7CEB-48B1-99C4-D4242771C451}']
    function Process(Value : String) : String;
  end;

implementation

end.
