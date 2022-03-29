unit Menus.Model.Entity.Produtos;

interface

uses
  Menus.Model.Entity.Interfaces, System.Classes, Menus.Model.Conexoes.Interfaces;

type
  TModelEntityProdutos = class(TInterfacedObject, iModelEntity)
    private
    FDataSet : iModelDataSet;
    public
      constructor Create(DataSet : iModelDataSet);
      destructor Destroy; override;

      class function New(DataSet : iModelDataSet) : iModelEntity;

      function Listar : TComponent;
  end;

implementation

const
  FTABLENAME = 'PRODUTOS';
{ TModelEntityProdutos }

constructor TModelEntityProdutos.Create(DataSet : iModelDataSet);
begin
  FDataSet := DataSet;
end;

destructor TModelEntityProdutos.Destroy;
begin

  inherited;
end;

function TModelEntityProdutos.Listar: TComponent;
begin
  Result := FDataSet.Open(FTABLENAME).EndDataSet;
end;

class function TModelEntityProdutos.New(DataSet : iModelDataSet) : iModelEntity;
begin
  Result := Self.Create(DataSet);
end;

end.
