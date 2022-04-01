unit Memento.View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Memento.Model.Cliente, Vcl.StdCtrls,
  Memento.Model.Interfaces;

type
  TForm2 = class(TForm)
    Edit1: TEdit;
    ListBox1: TListBox;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
  private
    { Private declarations }
    FCliente : iCliente;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
var
  Key: string;
begin
  FCliente.Nome := Edit1.Text;
  Key := TGUID.NewGuid.ToString;
  FCliente.Memento.Save(Key);
  ListBox1.Items.Add(Key);
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  FCliente := TModelCliente.New;
end;

procedure TForm2.ListBox1Click(Sender: TObject);
begin
  FCliente := FCliente.Memento.Restore(ListBox1.Items[ListBox1.ItemIndex]);
  Edit1.Text := FCliente.Nome;
end;

end.
