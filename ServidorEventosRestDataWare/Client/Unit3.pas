unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDWAbout, uRESTDWPoolerDB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uDWConstsData;

type
  TForm3 = class(TForm)
    RESTDWDataBase1: TRESTDWDataBase;
    RESTDWClientSQL1: TRESTDWClientSQL;
    DBGrid1: TDBGrid;
    Button1: TButton;
    DataSource1: TDataSource;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
begin
  RESTDWClientSQL1.Close;
  RESTDWClientSQL1.SQL.Clear;
  RESTDWClientSQL1.SQL.Add('SELECT * FROM PRODUTOS;');
  RESTDWClientSQL1.Open;
end;

procedure TForm3.Button2Click(Sender: TObject);
var
  vErro: string;
begin
  RESTDWClientSQL1.Append;
  RESTDWClientSQL1.FieldByName('CODIGO').AsString := '10';
  RESTDWClientSQL1.FieldByName('NOME').AsString := 'RestDataWare';
  RESTDWClientSQL1.FieldByName('DESCRICAO').AsString := 'Teste RestDataware';
  RESTDWClientSQL1.FieldByName('QUANTIDADE').AsString := '11';
  RESTDWClientSQL1.Post;

  if not RESTDWClientSQL1.ApplyUpdates(vErro) then
    raise Exception.Create(vErro);


end;

end.
