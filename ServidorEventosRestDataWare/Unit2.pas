unit Unit2;

interface

uses
  System.SysUtils, System.Classes, uDWDataModule, uDWAbout, uRESTDWServerEvents,
  uDWJSONObject, uDWJSON, System.Json, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, uRESTDWPoolerDB, uRestDWDriverFD,
  FireDAC.Comp.UI, FireDAC.Phys.IBBase, Data.DB, FireDAC.Comp.Client;

type
  TDataModule2 = class(TServerMethodDataModule)
    DWServerEvents1: TDWServerEvents;
    FDConnection1: TFDConnection;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    RESTDWPoolerDB1: TRESTDWPoolerDB;
    RESTDWDriverFD1: TRESTDWDriverFD;
    procedure DWServerEvents1EventstesteReplyEvent(var Params: TDWParams;
      var Result: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule2: TDataModule2;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDataModule2.DWServerEvents1EventstesteReplyEvent(
  var Params: TDWParams; var Result: string);
  var
    Json : TJsonObject;
begin
  Json := TJSONObject.Create;
  try
    Json.AddPair('Nome', 'Wanderson A. Timóteo');
    Json.AddPair('Cidade', 'Cuiabá');
    Json.AddPair('UF', 'MT');
    Json.AddPair('País', 'Brasil');
    Result := Json.ToJSON;
  finally
    FreeAndNil(Json);
  end;
end;

end.
