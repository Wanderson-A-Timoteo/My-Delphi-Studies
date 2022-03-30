unit Menus.Controller.ListBox.Default;

interface

uses Menus.Controller.ListBox.Interfaces, System.Classes, FMX.ListBox, FMX.Types;

type
  TControllerListBoxDefault = class(TInterfacedObject,
    iControllerListBoxDefault)
  private
    FContainer: TComponent;
    FListBox : TListBox;
  public
    constructor Create(Container: TComponent);
    destructor Destroy; override;
    class function New(Container: TComponent): iControllerListBoxDefault;
    function Name(Value : String) : iControllerListBoxDefault;
    function Align(Value : TAlignLayout) : iControllerListBoxDefault;
    function ItemHeight(Value : Integer) : iControllerListBoxDefault;
    function AddItem(Value : TFmxObject) : iControllerListBoxDefault;
    function Lista : TFmxObject;
    procedure Exibir;
  end;

implementation

uses
  FMX.Layouts;

{ TControllerListBoxDefault }

function TControllerListBoxDefault.AddItem(
  Value: TFmxObject): iControllerListBoxDefault;
begin
  Result := Self;
  FListBox.AddObject(Value);
end;

function TControllerListBoxDefault.Align(
  Value: TAlignLayout): iControllerListBoxDefault;
begin
  Result := Self;
  FListBox.Align := Value;
end;

constructor TControllerListBoxDefault.Create(Container: TComponent);
begin
  FContainer := Container;
  FListBox := TListBox.Create(nil);
  FListBox.Name := 'ListaDefault';
  FListBox.Align := TAlignLayout.Client;
  FListBox.ItemHeight := 60;
end;

destructor TControllerListBoxDefault.Destroy;
begin

  inherited;
end;

procedure TControllerListBoxDefault.Exibir;
begin
  TLayout(FContainer).AddObject(FListBox);
end;

function TControllerListBoxDefault.ItemHeight(
  Value: Integer): iControllerListBoxDefault;
begin
  Result := Self;
  FListBox.ItemHeight := Value;
end;

function TControllerListBoxDefault.Lista: TFmxObject;
begin
  Result := FListBox;
end;

function TControllerListBoxDefault.Name(
  Value: String): iControllerListBoxDefault;
begin
  Result := Self;
  FListBox.Name := Value;
end;

class function TControllerListBoxDefault.New(Container: TComponent)
  : iControllerListBoxDefault;
begin
  Result := Self.Create(Container);
end;

end.
