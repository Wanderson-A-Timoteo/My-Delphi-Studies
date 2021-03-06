unit unitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Imaging.jpeg;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Sistema1: TMenuItem;
    Sair1: TMenuItem;
    Cadastro1: TMenuItem;
    Movimentaes1: TMenuItem;
    GerenciarMovimentaes1: TMenuItem;
    ConsultarMovimentaes1: TMenuItem;
    CadastrodeProdutos1: TMenuItem;
    Image1: TImage;
    procedure Sair1Click(Sender: TObject);
    procedure CadastrodeProdutos1Click(Sender: TObject);
    procedure GerenciarMovimentaes1Click(Sender: TObject);
    procedure ConsultarMovimentaes1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  unitCadastroProduto, unitCadastroMovimentacao, unitConsultaMovimentacao;

{$R *.dfm}

procedure TfrmPrincipal.CadastrodeProdutos1Click(Sender: TObject);
begin
  frmCadastroProduto.ShowModal;
end;

procedure TfrmPrincipal.ConsultarMovimentaes1Click(Sender: TObject);
begin
  frmConsultaMovimentacao.ShowModal;
end;

procedure TfrmPrincipal.GerenciarMovimentaes1Click(Sender: TObject);
begin
  frmCadastroMovimentacao.ShowModal;
end;

procedure TfrmPrincipal.Sair1Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.
