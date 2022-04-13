unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Unit2, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDWAbout, uRESTDWBase, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    RESTServicePooler1: TRESTServicePooler;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  RESTServicePooler1.ServerMethodClass := TDataModule2;
  RESTServicePooler1.Active            := not RESTServicePooler1.Active;
end;

end.
