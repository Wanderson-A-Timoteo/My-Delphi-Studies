unit DS.Model.Entidade.Produto;

interface

uses
  System.SysUtils, System.Classes, DS.Model.Conexao.Firedac, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.JSON, DataSetConverter4D.Helper,
  DataSetConverter4D.Impl;

type
  TModelEntidadeProduto = class(TDataModule)
    FDQuery1: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    function Get(const Key  : String = '')                    : TJsonArray;
    function Put(const Key  : String; jObject : TJSONObject)  : TModelEntidadeProduto;
    function Post(const Key : String; jObject : TJSONObject)  : TModelEntidadeProduto;
  end;

var
  ModelEntidadeProduto: TModelEntidadeProduto;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TModelEntidadeProduto }

function TModelEntidadeProduto.Get(const Key: String): TJsonArray;
begin
  FDQuery1.Close;
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add(' SELECT * FROM PRODUTO ');
  if Key <> '' then
    FDQuery1.SQL.Add(' WHERE CODIGO = ' + Key);

  FDQuery1.Open;
  Result := FDQuery1.AsJSONArray;
end;

function TModelEntidadeProduto.Post(const Key: String;
  jObject: TJSONObject): TModelEntidadeProduto;
begin
  Result := Self;
  FDQuery1.Close;
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('SELECT * FROM PRODUTO WHERE CODIGO = :CODIGO');
  FDQuery1.ParamByName('CODIGO').Value := Key;
  FDQuery1.Open;
  FDQuery1.RecordFromJSONObject(jObject);
  FDQuery1.ApplyUpdates(-1);
end;

function TModelEntidadeProduto.Put(const Key : String; jObject : TJSONObject) : TModelEntidadeProduto;
begin
  Result := Self;
  FDQuery1.Close;
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('SELECT * FROM PRODUTO WHERE 1=2');
  FDQuery1.Open;
  FDQuery1.FromJSONObject(jObject);
  FDQuery1.ApplyUpdates(-1);
end;

end.
