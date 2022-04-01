unit DS.View.Entidade.Produto;

interface

uses
  System.SysUtils, System.Classes, System.JSON, DS.Controller;

  {$METHODINFO ON}

type
  TProduto = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    FController : TController;
  public
    { Public declarations }
    function Produto (const Key : String) : TJsonArray;
  end;

  {$METHODINFO OFF}

var
  Produto: TProduto;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TProduto }

procedure TProduto.DataModuleCreate(Sender: TObject);
begin
  FController := TController.Create;
end;

procedure TProduto.DataModuleDestroy(Sender: TObject);
begin
  FreeAndNil(FController);
end;

function TProduto.Produto(const Key: String): TJsonArray;
begin
  Result := FController.Entidades.Produto.Get(Key);
end;

end.
