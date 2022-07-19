unit Pesquisar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFormPesquisar = class(TForm)
    Label1: TLabel;
    Cadastrar: TButton;
    PanelContainer: TPanel;
    Button1: TButton;
    procedure CadastrarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPesquisar: TFormPesquisar;

implementation

uses
  Cadastro;

{$R *.dfm}

procedure TFormPesquisar.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TFormPesquisar.CadastrarClick(Sender: TObject);
begin
  try
     Self.Hide;
     FormCadastro := TFormCadastro.Create(nil);
     FormCadastro.ShowModal;
     Self.Show;
   finally
     FreeAndNil(FormCadastro);
   end;
end;

procedure TFormPesquisar.FormActivate(Sender: TObject);
begin
  PanelContainer.Left := Round( (FormPesquisar.Width - PanelContainer.Width) / 2);
  PanelContainer.Top  := Round( (FormPesquisar.Height - PanelContainer.Height) / 2);
end;

end.

