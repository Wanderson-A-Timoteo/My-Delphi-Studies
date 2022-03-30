unit Menus.Controller.ListBox.Itens.Insert;


interface

uses Menus.Controller.ListBox.Interfaces, FMX.Types, Menus.Controller.Forms.Default;

type
  TControllerListBoxItensInsert = class(TInterfacedObject, iControllerListBoxItemCRUD)
    constructor Create;
    destructor Destroy; override;
    class function New : iControllerListBoxItemCRUD;
    procedure onClick(Sender : TObject);
    function Execute : TFmxObject;
  end;

implementation

{ TControllerListBoxItensInsert }

uses Menus.Controller.ListBox.Itens.Factory;

constructor TControllerListBoxItensInsert.Create;
begin

end;

destructor TControllerListBoxItensInsert.Destroy;
begin

  inherited;
end;

class function TControllerListBoxItensInsert.New: iControllerListBoxItemCRUD;
begin
  Result := Self.Create;
end;

procedure TControllerListBoxItensInsert.onClick(Sender: TObject);
begin
  //
end;

function TControllerListBoxItensInsert.Execute: TFmxObject;
begin
  Result := TControllerListBoxItensFactory.New
              .Default
              .Name('btnNovo')
              .Text('Novo')
              .onClick(onClick)
              .Item;
end;

end.
