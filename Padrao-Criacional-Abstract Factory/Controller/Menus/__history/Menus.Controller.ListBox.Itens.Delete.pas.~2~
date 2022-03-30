unit Menus.Controller.ListBox.Itens.Delete;

interface

uses Menus.Controller.ListBox.Interfaces, FMX.Types, Menus.Controller.Forms.Default;

type
  TControllerListBoxItensDelete = class(TInterfacedObject, iControllerListBoxItemCRUD)
    constructor Create;
    destructor Destroy; override;
    class function New : iControllerListBoxItemCRUD;
    procedure onClick(Sender : TObject);
    function Execute : TFmxObject;
  end;

implementation

{ TControllerListBoxItensDelete }

uses Menus.Controller.ListBox.Itens.Factory;

constructor TControllerListBoxItensDelete.Create;
begin

end;

destructor TControllerListBoxItensDelete.Destroy;
begin

  inherited;
end;

class function TControllerListBoxItensDelete.New: iControllerListBoxItemCRUD;
begin
  Result := Self.Create;
end;

procedure TControllerListBoxItensDelete.onClick(Sender: TObject);
begin
  //
end;

function TControllerListBoxItensDelete.Execute: TFmxObject;
begin
  Result := TControllerListBoxItensFactory.New
              .Default
              .Name('btnExcluir')
              .Text('Excluir')
              .onClick(onClick)
              .Item;
end;

end.
