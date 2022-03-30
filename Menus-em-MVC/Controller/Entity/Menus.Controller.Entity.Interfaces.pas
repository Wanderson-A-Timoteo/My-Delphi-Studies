unit Menus.Controller.Entity.Interfaces;

interface

uses
  Data.DB;

type
  iControllerEntity = interface
    ['{4CAFB094-699C-4EDD-9AC0-EDBBFBA02DF0}']
    function Lista(aDataSource :TDataSource) : iControllerEntity;
  end;

  iControllerEntityFactory = interface
    ['{A211B64B-54CD-423A-BE6A-17A18E4915F8}']
    function Produto : iControllerEntity;
  end;

implementation

end.
