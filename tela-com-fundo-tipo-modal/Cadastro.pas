unit Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFormCadastro = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    PanelContainer: TPanel;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastro: TFormCadastro;

implementation

{$R *.dfm}

uses Pesquisar;

procedure TFormCadastro.Button1Click(Sender: TObject);
begin
  try
    Self.Hide;
    FormPesquisar := TFormPesquisar.Create(nil);
    FormPesquisar.ShowModal;
    Self.Show;
   finally
    FreeAndNil(FormPesquisar);
   end;
end;

procedure TFormCadastro.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TFormCadastro.FormActivate(Sender: TObject);
begin
  PanelContainer.Left := Round( (FormCadastro.Width - PanelContainer.Width) / 2);
  PanelContainer.Top  := Round( (FormCadastro.Height - PanelContainer.Height) / 2);
end;

end.
