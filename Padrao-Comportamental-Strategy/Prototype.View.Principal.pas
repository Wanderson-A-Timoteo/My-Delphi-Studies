unit Prototype.View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Prototype.Model.Interfaces,
  Prototype.Model.Itens, System.Generics.Collections;

type
  TForm2 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    FLista : TList<iItens>;
    procedure ExibeItens;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
var
  Item : iItens;
begin
  Item := TItens.New;
  Item.Codigo := StrToInt(Edit1.Text);
  Item.Descricao := Edit2.Text;
  FLista.Add(Item);
  ExibeItens;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  FLista.Add(FLista[Pred(FLista.Count)].Prototype.Clone);
  ExibeItens;
end;

procedure TForm2.ExibeItens;
var
  I: Integer;
begin
  Memo1.Lines.Clear;
  for I := 0 to Pred(FLista.Count) do
    Memo1.Lines.Add(FLista[I].Codigo.ToString + ' - ' + FLista[I].Descricao + FormatCurr('  R$ #,##0.00', FLista[I].PrecoVenda));
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  FLista := TList<iItens>.Create;
end;

end.
