unit untBase;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl,
  FMX.Objects;

type
  TFormBase = class(TForm)
    tbc1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    rct1: TRectangle;
    rct2: TRectangle;
    rct3: TRectangle;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormBase: TFormBase;

implementation

{$R *.fmx}

procedure TFormBase.FormCreate(Sender: TObject);
begin
  tbc1.TabPosition := TTabPosition.None;
end;

end.
