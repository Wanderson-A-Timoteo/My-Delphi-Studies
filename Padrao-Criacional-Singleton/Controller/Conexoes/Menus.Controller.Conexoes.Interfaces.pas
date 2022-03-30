unit Menus.Controller.Conexoes.Interfaces;

interface

uses Menus.Model.Conexoes.Interfaces;

type

  iControllerFactoryConexao = interface
    ['{5EBF8D54-0A15-4A32-A123-D78C2DEF7E98}']
    function Conexao : iModelConexao;
  end;

  iControllerFactoryDataSet = interface
    ['{549A7119-DBF9-4141-B3A6-6325E54CC9B7}']
    function DataSet(Conexao : iModelConexao) : iModelDataSet;
  end;

  iControllerConexoesFacade = interface
    ['{46F86B6E-C340-4CB3-BA30-FEAF60778837}']
    function iConexao : iModelConexao;
    function iDataSet : iModelDataSet;
  end;

implementation

end.
