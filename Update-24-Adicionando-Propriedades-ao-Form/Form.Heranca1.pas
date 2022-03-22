unit Form.Heranca1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  Form.Padrao, FMX.Controls.Presentation, FMX.Layouts;

type
  TFormPadrao1 = class(TFormPadrao)
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPadrao1: TFormPadrao1;

implementation

{$R *.fmx}

procedure TFormPadrao1.Button4Click(Sender: TObject);
begin
  inherited;
  ShowMessage('Inserido pelo Form Herança 1');
end;

end.
