unit Visitor.Model.Interfaces;

interface

type
  iVisitor = interface;
  iVisitable = interface;

  iItem = interface
    ['{2053AF4E-8CE8-427E-8C9D-1C1666BF82DE}']
    function SetPrecoUnitario(Value : Currency) : iItem;
    function PrecoUnitario : Currency;
    function Regras : iVisitable;
  end;

  iItemRegras = interface
    ['{7E4FE1C5-C6CD-4D6B-AFA1-DDC4B825F1AD}']
    function PrecoVenda : Currency;
    function PrecoPromocao : Currency;
    function Visitor : iVisitor;
  end;

  iVisitor = interface
    ['{C6A38765-626B-443B-9E25-97E14AA0F3F9}']
    function Visit(Value : iItem) : iItemRegras;
  end;

  iVisitable = interface
    ['{BFE315DD-D482-46DA-A4D0-6E42F9ACF6B0}']
    function Accept(Value : iVisitor) : iItemRegras;
  end;

implementation

end.
