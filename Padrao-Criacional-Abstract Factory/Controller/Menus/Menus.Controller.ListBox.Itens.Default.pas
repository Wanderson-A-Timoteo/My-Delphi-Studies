unit Menus.Controller.ListBox.Itens.Default;

interface

uses Menus.Controller.ListBox.Interfaces, FMX.ListBox, System.Classes, FMX.Types;

type
  TControllerListBoxItensDefault = class(TInterfacedObject,
    iControllerListBoxItensDefault)
  private
    FListBoxItem : TListBoxItem;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iControllerListBoxItensDefault;
    function Name(Value : String) : iControllerListBoxItensDefault;
    function Text(Value : String) : iControllerListBoxItensDefault;
    function StyleLookup(Value : String) : iControllerListBoxItensDefault;
    function onClick(Value : TNotifyEvent) : iControllerListBoxItensDefault;
    function Item : TFMXObject;
  end;

implementation

{ TControllerListBoxItensDefault }

constructor TControllerListBoxItensDefault.Create;
begin
  FListBoxItem := TListBoxItem.Create(nil);
  FListBoxItem.Name := 'btnDefault';
  FListBoxItem.Text := 'Default';
  FListBoxItem.StyleLookup := 'listboxitemdetaillabel';
end;

destructor TControllerListBoxItensDefault.Destroy;
begin

  inherited;
end;

function TControllerListBoxItensDefault.Item: TFMXObject;
begin
  Result := FListBoxItem;
end;

function TControllerListBoxItensDefault.Name(
  Value: String): iControllerListBoxItensDefault;
begin
  Result := Self;
  FListBoxItem.Name := Value;
end;

class function TControllerListBoxItensDefault.New
  : iControllerListBoxItensDefault;
begin
  Result := Self.Create;
end;

function TControllerListBoxItensDefault.onClick(
  Value: TNotifyEvent): iControllerListBoxItensDefault;
begin
  Result := Self;
  FListBoxItem.OnClick := Value;
end;

function TControllerListBoxItensDefault.StyleLookup(
  Value: String): iControllerListBoxItensDefault;
begin
  Result := Self;
  FListBoxItem.StyleLookup := Value;
end;

function TControllerListBoxItensDefault.Text(
  Value: String): iControllerListBoxItensDefault;
begin
  Result := Self;
  FListBoxItem.Text := Value;
end;

end.
