unit unit_principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls;

type
  Tform_principal = class(TForm)
    MainMenu1: TMainMenu;
    Encerrar1: TMenuItem;
    Servidor1: TMenuItem;
    Button1: TButton;
    procedure Servidor1Click(Sender: TObject);
    procedure Encerrar1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_principal: Tform_principal;

implementation

{$R *.dfm}

uses unit_configurar_servidor, unit_funcoes, unit_mensagens;

procedure Tform_principal.Button1Click(Sender: TObject);
begin
//  if fnc_criar_mensagem('CONFIRMA��O',
//                      'Tem certeza que deseja Continuar?',
//                      'Deseja Inserir estes Dados?',
//                      ExtractFilePath(Application.ExeName) + '\imagens\aviso.png',
//                      'Comfirma') then
//   ShowMessage('Sim')
//   else
//   ShowMessage('N�o');

   // Mensagem de erro
   fnc_criar_mensagem('CONFIRMA��O',
                      'Tem certeza que deseja Continuar?',
                      'Deseja Inserir estes Dados?',
                      ExtractFilePath(Application.ExeName) + '\imagens\erro.png',
                      'OK')


end;

procedure Tform_principal.Encerrar1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure Tform_principal.Servidor1Click(Sender: TObject);
begin
  form_configurar_servidor := Tform_configurar_servidor.Create(nil);
  form_configurar_servidor.Show;
end;

end.