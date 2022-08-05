unit DMDados;

interface

uses
  SysUtils, Classes, DB, Provider, DBClient, ppDB, ppDBPipe, ppBands, ppCache,
  ppClass, ppComm, ppRelatv, ppProd, ppReport, ppEndUsr, Messages, StdCtrls,
  Dialogs, FireDAC.Comp.Client, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.PG, FireDAC.Phys.PGDef;

type
  TDataModuleDados = class(TDataModule)
    DatabaseMaximus: TFDConnection;
    QueryParametros: TFDQuery;
    QueryPesquisa: TFDQuery;
    QueryDataHoraServidor: TFDQuery;
    ADPhysPgDriverLink: TFDPhysPgDriverLink;
    ADGUIxWaitCursor: TFDGUIxWaitCursor;
    QueryGeral: TFDQuery;
    QueryAcessaLoja: TFDQuery;
    DataSetProviderAcessaLoja: TDataSetProvider;
    ClientDataSetAcessaLoja: TClientDataSet;
    QryCrianca: TFDQuery;
    QryPesquisarCrianca: TFDQuery;
    DscPesquisarCrianca: TDataSource;
    procedure QryPesquisarCriancaAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    Banco_Dados : String;
    function DataServidor(SomenteData:Boolean=true):TDateTime;
    function AcessoLoja(CodigoUsuario: Integer; CodigoLoja: Integer):Boolean;
    function ConfiguraConexao: Boolean;
  end;

var
  DataModuleDados: TDataModuleDados;

implementation

uses BibVariavel, BibMarco, Conexao;

{$R *.dfm}

{ TDataModuleDados }

function TDataModuleDados.AcessoLoja(CodigoUsuario,
  CodigoLoja: Integer): Boolean;
begin
  with ClientDataSetAcessaLoja do
  begin
    Close;
    Params[0].AsInteger   := CodigoUsuario;
    Open;
    if FieldByName('acessa_outras_loja').AsString = 'N' then
    begin
      if CodigoLoja = FieldByName('cod_loja').AsInteger then
      begin
        Result              := True;
      end
      else if (CodigoLoja <> FieldByName('cod_loja').AsInteger) AND
              (FieldByName('acessa_outras_loja').AsBoolean = False) then
      begin
        Result              := False;
      end;
    end
    else
    begin
      Result                := True;
    end;
  end;

end;

function TDataModuleDados.ConfiguraConexao: Boolean;
var
  p1,
  p2,
  tm         : Integer;
  BDuser,
  BDpws,
  Secao      : String;
begin
  if FormConexao.ClientDataSetConexoes.RecordCount < 1 then
  begin
    Mensagem('BANCO DE DADOS não configurado.',mtError,[mbOk],0);
    Result := False;
    Exit;
  end;
  Secao        := 'MAXIMUS - '+GetIp+'/'+UpperCase(GetEnvironmentVariable('SESSIONNAME'));
  BDuser       := 'fontdata';
  BDpws        := 'FDTI'+IntToStr(1252);
  with FormConexao.ClientDataSetConexoes do
  begin
    DatabaseMaximus.Params.Clear;
    DatabaseMaximus.Params.Add('Server='+FieldByName('servidor').AsString);
    DatabaseMaximus.Params.Add('Database='+FieldByName('banco').AsString);
    DatabaseMaximus.Params.Add('Port='+FieldByName('porta').AsString);
    DatabaseMaximus.Params.Add('DriverID=PG');
    if FieldByName('usuario').AsString <> '' then
    begin
      DatabaseMaximus.Params.Add('User_Name='+FieldByName('usuario').AsString);
      DatabaseMaximus.Params.Add('Password='+ConectaSenhaCripto(FieldByName('senha').AsString));
    end
    else begin
      DatabaseMaximus.Params.Add('User_Name='+BDuser);
      DatabaseMaximus.Params.Add('Password='+BDpws);
    end;
    DatabaseMaximus.Params.Add('ApplicationName='+Secao);
    Banco_Dados :=FieldByName('banco').AsString;
  end;
  Result := True;
end;

function TDataModuleDados.DataServidor(SomenteData: Boolean): TDateTime;
begin
  with QueryDataHoraServidor do
  begin
    SQL.Clear;
    SQL.Add('SELECT current_timestamp as data ');
    Prepare;
    Open;
    if SomenteData then
       Result             := StrToDate(DateToStr(FieldByName('data').AsDateTime))
    else
       Result             := FieldByName('data').AsDateTime;
  end;
end;

procedure TDataModuleDados.QryPesquisarCriancaAfterOpen(DataSet: TDataSet);
begin
  TIntegerField(QryPesquisarCrianca.FieldByName('numero_pulseira')).DisplayFormat := '0000';
  TIntegerField(QryPesquisarCrianca.FieldByName('numero_mesa')).DisplayFormat     := '0000';
end;

end.
