unit unit_modelo2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons;

type
  Tform_modelo2 = class(TForm)
    btn_fechar_sistema: TSpeedButton;
    procedure btn_fechar_sistemaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_modelo2: Tform_modelo2;

implementation

{$R *.dfm}

procedure Tform_modelo2.btn_fechar_sistemaClick(Sender: TObject);
begin
  form_modelo2.Close;
end;

procedure Tform_modelo2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
