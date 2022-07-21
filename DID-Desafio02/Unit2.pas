unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Datasnap.DBClient, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.WinXPanels,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.CategoryButtons, Vcl.WinXCtrls;

type
  TfrmCadastro = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    CardPanel1: TCardPanel;
    Card1: TCard;
    Panel2: TPanel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    CardPanel2: TCardPanel;
    Card2: TCard;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Card3: TCard;
    StackPanel1: TStackPanel;
    ClientDataSet1EmpNo: TIntegerField;
    ClientDataSet1LastName: TStringField;
    ClientDataSet1FirstName: TStringField;
    ClientDataSet1PhoneExt: TStringField;
    ClientDataSet1HireDate: TDateTimeField;
    ClientDataSet1Salary: TFloatField;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    Label8: TLabel;
    DBEdit2: TDBEdit;
    Label9: TLabel;
    DBEdit3: TDBEdit;
    Label10: TLabel;
    DBEdit4: TDBEdit;
    Label11: TLabel;
    DBEdit5: TDBEdit;
    Label12: TLabel;
    DBEdit6: TDBEdit;
    StackPanel2: TStackPanel;
    Label13: TLabel;
    DBEdit7: TDBEdit;
    Label14: TLabel;
    DBEdit8: TDBEdit;
    Label15: TLabel;
    DBEdit9: TDBEdit;
    Label16: TLabel;
    DBEdit10: TDBEdit;
    Label17: TLabel;
    DBEdit11: TDBEdit;
    Label18: TLabel;
    DBEdit12: TDBEdit;
    Card4: TCard;
    Panel3: TPanel;
    Image5: TImage;
    Image6: TImage;
    Image8: TImage;
    Label19: TLabel;
    Label20: TLabel;
    Label22: TLabel;
    Panel4: TPanel;
    SplitView1: TSplitView;
    CategoryButtons1: TCategoryButtons;
    Card5: TCard;
    StackPanel3: TStackPanel;
    Label21: TLabel;
    DBEdit13: TDBEdit;
    Label23: TLabel;
    DBEdit14: TDBEdit;
    Label24: TLabel;
    DBEdit15: TDBEdit;
    Label25: TLabel;
    DBEdit16: TDBEdit;
    Label26: TLabel;
    DBEdit17: TDBEdit;
    Label27: TLabel;
    DBEdit18: TDBEdit;
    procedure Image1Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure CategoryButtons1Categories0Items0Click(Sender: TObject);
    procedure CategoryButtons1Categories0Items1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastro: TfrmCadastro;

implementation

{$R *.dfm}

procedure TfrmCadastro.CategoryButtons1Categories0Items0Click(Sender: TObject);
begin
  CardPanel2.ActiveCardIndex := 1;
end;

procedure TfrmCadastro.CategoryButtons1Categories0Items1Click(Sender: TObject);
begin
  CardPanel2.ActiveCardIndex := 2;
end;

procedure TfrmCadastro.Image1Click(Sender: TObject);
begin
  CardPanel2.ActiveCardIndex := 1;
  CardPanel1.ActiveCardIndex := 1;
  SplitView1.Open;
end;

procedure TfrmCadastro.Image5Click(Sender: TObject);
begin
  CardPanel2.ActiveCardIndex := 0;
  CardPanel1.ActiveCardIndex := 0;
  SplitView1.Close;
end;

end.
