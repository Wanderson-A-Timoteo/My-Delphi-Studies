unit Menus.Controller.Conexoes.Interfaces;

interface

uses
  Menus.Model.Conexoes.Interfaces;

type

  iControllerFactoryConexao = interface
    ['{824C9D2D-AC09-424E-A6E7-9FADFAF6DA93}']
    function Conexao : iModelConexao;
  end;

  iControllerFactoryDataSet = interface
    ['{65B61C40-6DBF-46E5-9BFA-B42995D2CB8E}']
    function DataSet(Conexao : iModelConexao) : iModelDataSet;
  end;

implementation

end.
