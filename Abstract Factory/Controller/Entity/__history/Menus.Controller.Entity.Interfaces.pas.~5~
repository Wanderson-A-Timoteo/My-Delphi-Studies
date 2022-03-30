unit Menus.Controller.Entity.Interfaces;

interface

uses
  Data.DB;

type
  iControllerEntity = interface
    ['{C4456164-F064-461D-B383-7B4E4B538585}']
    function Lista(aDataSource : TDataSource) : iControllerEntity;
  end;

  iControllerEntityFactory = interface
    ['{9F063B38-9A72-44F6-8ABC-FF11867BAB47}']
    function Produto : iControllerEntity;
    function Cliente : iControllerEntity;
  end;

  iControllerEntityFacade = interface
    ['{5DC1F798-0D6C-4419-905E-CDF53D03C9B5}']
    function Entity : iControllerEntityFactory;
  end;

implementation

end.
