unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFormPrincipal = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure OnModalBegin(ASender: TObject);
    procedure OnModalEnd(ASender: TObject);
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.dfm}

uses Cadastro, Pesquisar, Relatorio, FundoPreto;

procedure TFormPrincipal.Button1Click(Sender: TObject);
begin
  try
     FormCadastro := TFormCadastro.Create(nil);
     FormCadastro.ShowModal;
   finally
     FreeAndNil(FormCadastro);
   end;
end;

procedure TFormPrincipal.Button2Click(Sender: TObject);
begin
  try
     FormPesquisar := TFormPesquisar.Create(nil);
     FormPesquisar.ShowModal;
   finally
     FreeAndNil(FormPesquisar);
   end;
end;

procedure TFormPrincipal.Button3Click(Sender: TObject);
begin
  try
     FormRelatorio := TFormRelatorio.Create(nil);
     FormRelatorio.ShowModal;
   finally
     FreeAndNil(FormRelatorio);
   end;
end;

procedure TFormPrincipal.FormShow(Sender: TObject);
begin
  Application.CreateForm(TFormFundoPretoTransparente, FormFundoPretoTransparente);
  Application.OnModalBegin := Self.OnModalBegin;
  Application.OnModalEnd   := Self.OnModalEnd;
end;

procedure TFormPrincipal.OnModalBegin(ASender: TObject);
begin
  FormFundoPretoTransparente.Show;
end;

procedure TFormPrincipal.OnModalEnd(ASender: TObject);
begin
  FormFundoPretoTransparente.Hide;
end;

end.
