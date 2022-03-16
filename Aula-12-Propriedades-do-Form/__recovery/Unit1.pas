unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Menus;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Panel1: TPanel;
    Memo1: TMemo;
    MainMenu1: TMainMenu;
    Inicio1: TMenuItem;
    este11: TMenuItem;
    este21: TMenuItem;
    este1Submenu1: TMenuItem;
    este1Submenu21: TMenuItem;
    estes1Submenu31: TMenuItem;
    este2Submenu1: TMenuItem;
    este1SubmenuSub1: TMenuItem;
    este1SubmenuSub21: TMenuItem;
    N1: TMenuItem;
    PopupMenu1: TPopupMenu;
    frm11: TMenuItem;
    frm21: TMenuItem;
    subfrm1: TMenuItem;
    subfrm21: TMenuItem;
    N2: TMenuItem;
    PopupMenu2: TPopupMenu;
    Menumenu21: TMenuItem;
    N3: TMenuItem;
    Memomenu1: TMenuItem;
    SubMemomeu1: TMenuItem;
    Button2: TButton;
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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
  Memo1.Lines.Clear;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  ShowMessage('Até logo!');
  Close;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
  Memo1.Lines.Add(Edit1.Text);
end;

procedure TForm1.Edit1Enter(Sender: TObject);
begin
  ShowMessage('Entrando');
end;

procedure TForm1.Edit1Exit(Sender: TObject);
begin
  ShowMessage('Saindo do edit');
end;

end.
