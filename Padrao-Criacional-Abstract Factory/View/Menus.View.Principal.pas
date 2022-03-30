unit Menus.View.Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Controls.Presentation, FMX.StdCtrls, Menus.Controller.Facade,
  Menus.Model.Conexoes.Factory.Conexao;

type
  TForm2 = class(TForm)
    Layout1: TLayout;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    procedure ExibirConfiguracoes;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses
  Menus.Model.Conexoes.Interfaces;

{$R *.fmx}

procedure TForm2.FormCreate(Sender: TObject);
begin
  ExibirConfiguracoes;
  TControllerFacade.New.Menu.ListBox.Principal(Layout1).Exibir;
end;

procedure TForm2.ExibirConfiguracoes;
begin
  {$IFDEF FIREDAC}
  Label1.Text := 'Conectado via Firedac';
  {$ENDIF}
  {$IFDEF ZEOS}
    Label1.Text := 'Conectado via Zeos';
  {$ENDIF}
end;

end.
