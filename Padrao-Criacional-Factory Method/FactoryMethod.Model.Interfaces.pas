unit FactoryMethod.Model.Interfaces;

interface

type
  TTipoRefrigerante = (CocaCola, Guarana);

  iRefrigerante = interface
    ['{8D16B830-2AFA-49D1-A951-5DDF49FE9F3E}']
    function GetNome : String;
  end;


  iRefrigeranteFactory = interface
    ['{E592E081-4247-429B-862C-656F7185E5BE}']
    function Refrigerante(Tipo : TTipoRefrigerante) : iRefrigerante;
  end;

implementation

end.
