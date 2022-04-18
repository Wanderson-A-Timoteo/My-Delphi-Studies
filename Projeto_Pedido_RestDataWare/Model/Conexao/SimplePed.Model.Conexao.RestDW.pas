unit SimplePed.Model.Conexao.RestDW;

interface

uses
  System.SysUtils, System.Classes, uDWAbout, uRESTDWPoolerDB;

type
  TModelConexao = class(TDataModule)
    RESTDWDataBase1: TRESTDWDataBase;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ModelConexao: TModelConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
