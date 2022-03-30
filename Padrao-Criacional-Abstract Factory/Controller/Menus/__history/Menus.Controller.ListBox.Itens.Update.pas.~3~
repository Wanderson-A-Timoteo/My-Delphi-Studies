unit Menus.Controller.ListBox.Itens.Update;

interface

uses Menus.Controller.ListBox.Interfaces, FMX.Types, Menus.Controller.Forms.Default;

type
  TControllerListBoxItensUpdate = class(TInterfacedObject, iControllerListBoxItemCRUD)
    constructor Create;
    destructor Destroy; override;
    class function New : iControllerListBoxItemCRUD;
    procedure onClick(Sender : TObject);
    function Execute : TFmxObject;
  end;

implementation

{ TControllerListBoxItensUpdate }

uses Menus.Controller.ListBox.Itens.Factory;

constructor TControllerListBoxItensUpdate.Create;
begin

end;

destructor TControllerListBoxItensUpdate.Destroy;
begin

  inherited;
end;

class function TControllerListBoxItensUpdate.New: iControllerListBoxItemCRUD;
begin
  Result := Self.Create;
end;

procedure TControllerListBoxItensUpdate.onClick(Sender: TObject);
begin
  //
end;

function TControllerListBoxItensUpdate.Execute: TFmxObject;
begin
  Result := TControllerListBoxItensFactory.New
              .Default
              .Name('btnEditar')
              .Text('Editar')
              .onClick(onClick)
              .Item;
end;

end.
