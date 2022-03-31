unit Adapter.View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Adapter.Model.Interfaces,
  Adapter.Controller.Itens;

type
  TForm2 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    FItem : iControllerItens;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
var
  Item : TItens;
begin
  Item.Produto := Edit1.Text;
  Item.Valor := StrToCurr(Edit2.Text);
  FItem.Add(Item);
end;

procedure TForm2.Button2Click(Sender: TObject);
var
  I: Integer;
begin
  Memo1.Lines.Clear;
  for I := 0 to Pred(FItem.Itens.Count) do
    Memo1.Lines.Add(
      FItem.Itens[I].Produto + ' - ' +
      FormatCurr('R$ #,##0.00', FItem.Itens[I].Valor)
    );
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  FItem := TControllerItens.New;
end;

end.
