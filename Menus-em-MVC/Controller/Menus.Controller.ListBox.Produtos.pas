unit Menus.Controller.ListBox.Produtos;


interface

uses
  Menus.Controller.ListBox.Interfaces, System.Classes;


type
  TControllerListBoxProdutos = class(TInterfacedObject, iControllerListBoxMenu)
    private
      FContainer : TComponent;
    public
      constructor Create(Container : TComponent);
      destructor Destroy; override;

      class function New(Container : TComponent) : iControllerListBoxMenu;

      procedure Exibir;
  end;

implementation

{ TControllerListBoxProdutos }

uses
  Menus.Controller.ListBox.Factory, Menus.Controller.ListBox.Itens.Factory;

constructor TControllerListBoxProdutos.Create(Container: TComponent);
begin
  FContainer := Container;
end;

destructor TControllerListBoxProdutos.Destroy;
begin

  inherited;
end;

procedure TControllerListBoxProdutos.Exibir;
begin
  TControllerListBoxFactory.New
    .Defaul(FContainer)
    .AddItem(TControllerListBoxItensFactory.New.Cliente.Show)
    .Exibir;
end;

class function TControllerListBoxProdutos.New(
  Container: TComponent): iControllerListBoxMenu;
begin
  Result := Self.Create(Container);
end;

end.
