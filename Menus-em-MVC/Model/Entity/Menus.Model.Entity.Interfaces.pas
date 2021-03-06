unit Menus.Model.Entity.Interfaces;

interface

uses
  System.Classes, Menus.Model.Conexoes.Interfaces;

type

  iModelEntity = interface
    ['{09DDC51A-AA19-4482-BEC5-5BBCBA74921A}']
    function Listar : TComponent;
  end;

  iModelEntityFactory = interface
    ['{2A59B266-FDFF-42D1-8314-458AE654778E}']
    function Produtos(DataSet : iModelDataSet) : iModelEntity;
  end;

implementation

end.
