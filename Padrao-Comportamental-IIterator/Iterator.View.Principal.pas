unit Iterator.View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Iterator.Model.Interfaces,
  Iterator.Model.Itens, Iterator.Model.Venda;

type
  TForm2 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    Edit2: TEdit;
    Button3: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    FVenda : iVenda;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  FVenda.AddItens(
    TModelItem.New
      .Preco(StrToCurr(Edit1.Text))
      .Quantidade(StrToCurr(Edit2.Text))
  );
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  Memo1.Lines.Add(CurrToStr(FVenda.Total));
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  FVenda := TModelVenda.New;
end;

end.
