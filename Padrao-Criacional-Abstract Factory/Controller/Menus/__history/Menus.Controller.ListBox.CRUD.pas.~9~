unit Menus.Controller.ListBox.CRUD;

interface

uses Menus.Controller.ListBox.Interfaces, System.Classes, Data.DB;

Type
  TControllerListBoxCRUD = class(TInterfacedObject, iControllerListBoxMenu)
    private
      FContainer : TComponent;
      FDataSet : TDataSet;
    public
      constructor Create(Container: TComponent; DataSet : TDataSet);
      destructor Destroy; override;
      class function New(Container: TComponent; DataSet : TDataSet) : iControllerListBoxMenu;
      procedure Exibir;
  end;

implementation

{ TControllerListBoxCRUD }

uses Menus.Controller.ListBox.Factory, Menus.Controller.ListBox.Itens.Factory;

constructor TControllerListBoxCRUD.Create(Container: TComponent; DataSet : TDataSet);
begin
  FContainer := Container;
  FDataSet := DataSet;
end;

destructor TControllerListBoxCRUD.Destroy;
begin

  inherited;
end;

procedure TControllerListBoxCRUD.Exibir;
begin
   TControllerListBoxFactory.New
    .Default(FContainer)
    .AddItem(TControllerListBoxItensFactory.New.Insert.Execute)
    .AddItem(TControllerListBoxItensFactory.New.Update.Execute)
    .AddItem(TControllerListBoxItensFactory.New.Delete.Execute)
    .Exibir;
end;

class function TControllerListBoxCRUD.New(Container: TComponent; DataSet : TDataSet) : iControllerListBoxMenu;
begin
  Result := Self.Create(Container, Dataset);
end;

end.
