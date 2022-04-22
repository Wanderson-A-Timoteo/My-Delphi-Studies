unit SistemaFinanceiro.View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    menuCadastro: TMenuItem;
    menuRelatorio: TMenuItem;
    menuAjuda: TMenuItem;
    menuCadastroPadrao: TMenuItem;
    procedure menuCadastroPadraoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  SistemaFinanceiro.View.CadastroPadrao,
  SistemaFinanceiro.View.Splash;

{$R *.dfm}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  frmSplash := TFrmSplash.Create(nil);
  try
    frmSplash.ShowModal;
  finally
    FreeAndNil(frmSplash);
  end;
end;

procedure TfrmPrincipal.menuCadastroPadraoClick(Sender: TObject);
begin
  frmCadastroPadrao.Show;
end;

end.
