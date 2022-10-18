unit untFrmRCRacing; // 2.0.0.150

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniDBEdit, uniCheckBox, uniDBCheckBox, uniButton,
  uniBitBtn, uniSpeedButton, uniEdit, uniMultiItem, uniComboBox, uniDBComboBox,
  uniDateTimePicker, uniDBDateTimePicker, uniLabel, uniPanel, uniScrollBox,
  uniPageControl, uniGUIBaseClasses, uniBasicGrid, uniDBGrid, uniListBox,
  uniTimer, Vcl.Imaging.pngimage, Vcl.Imaging.jpeg, uniImage, uniThreadTimer;

type
  TfrmRCRACING = class(TUniFrame)
    paPista: TUniContainerPanel;
    imgPista: TUniImage;
    btnStart: TUniButton;
    paFinish: TUniContainerPanel;
    red: TUniContainerPanel;
    yellow: TUniContainerPanel;
    green: TUniContainerPanel;
    car_pos: TUniContainerPanel;
    imgRedOFF: TUniImage;
    imgYellowOFF: TUniImage;
    imgGreenOFF: TUniImage;
    imgCarYellow: TUniImage;
    imgCarBlue: TUniImage;
    imgCarRed: TUniImage;
    UniTimer1: TUniTimer;
    procedure UniFrameCreate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure UniTimer1Timer(Sender: TObject);
    procedure UniFrameReady(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure StartRace;
  end;

implementation

{$R *.dfm}

uses untdm_rc, MainModule, Main, mkm_layout, uconsts;

procedure TfrmRCRACING.btnCancelClick(Sender: TObject);
begin
     if mm.oPgGeneral <> nil then
        mm.oPgGeneral.ActivePage.Close;
end;

procedure TfrmRCRACING.btnStartClick(Sender: TObject);
begin
    imgCarYellow.Top := 647;
    imgCarBlue.Top   := 647;
    imgCarRed.Top    := 647;

    imgRedOFF.Visible    := true;
    imgYellowOFF.Visible := true;
    imgGreenOFF.Visible  := true;

    UniTimer1.Enabled := True;
end;

procedure TfrmRCRACING.StartRace;
var
  num, avanco, contador: integer;
  cNum : string;

  pObj, pObj1, pObj2, pObj3 : TUniPanel;

  bExit : boolean;

  aCars : Array [1..3] of string;

begin

    aCars[1] := 'Yellow';
    aCars[2] := 'Blue';
    aCars[3] := 'Red';

    btnStart.Tag := 0;
    btnStart.Enabled := false;

    UniTimer1.Enabled := False;

    bExit := false;

    contador := 0;

    pObj1 := nil;
    pObj2 := nil;
    pObj3 := nil;

    //UniSession.Synchronize;

    while not bExit do
    begin

          num := Random( 4 ) ; //so os 3 carros

          if num > 0 then
          begin
              cNum := IntToStr( num );

              pObj :=  TUniPanel ( FindComponent( 'imgCar' + aCars[ Num ] ) );

              if pObj <> nil then
              begin

                   avanco := Random( 7 ) + 1 ;

                   avanco := avanco * ( -1 );

                   pObj.Top  := pObj.Top + avanco;

                   if ( pObj.Top ) <= imgPista.Top then
                   begin

                      Inc( contador );

                      if contador = 1 then
                      begin
                         pObj.Font.Color := clLime;

                         pObj1 := pObj;

                         bExit := true;
                      end;
                   end;
              end;
              UniSession.Synchronize;
          end;
    end;
    btnStart.Enabled := True;
    rc_AddCssClass( btnStart , 'rc-pulse' );
end;

procedure TfrmRCRACING.UniFrameCreate(Sender: TObject);
var
  iScreenRight,
  iScreenLeft,
  iScreenTop,
  iScreenBottom,
  iScreenCenter : integer;
begin

  //Self.Color             := StringToColor( mm.CONFIG_LAYOUT_BG_COLOR );

  rc_RenderLayout( Self );

  rc_AddCssClass( btnStart , 'rc-pulse' );


  imgRedOFF.Visible    := true;
  imgYellowOFF.Visible := true;
  imgGreenOFF.Visible  := true;

  Self.Width           := mm.varI_ScreenWidth;
  Self.Height          := mm.varI_ScreenHeight;
  Self.top             := 0;
  Self.Left            := 0;

//  imgPista.Width     := Self.Width;
//  imgPista.Height    := Self.Height;
  paPista.left         := ( ( Self.Width - 260 ) div 2 ) - ( imgPista.Width div 2 );
  paPista.top          := ( Self.Height div 2 ) - ( imgPista.Height div 2 );

  iScreenRight         := imgPista.left + imgPista.Width;
  iScreenLeft          := imgPista.left ;
  iScreenTop           := imgPista.Top;
  iScreenBottom        := imgPista.Top + imgPista.Height;
  iScreenCenter        := ( Self.Width div 2 ) - ( Self.Width div 2 );

  paFinish.Top         := imgPista.top + 37;
  paFinish.left        := imgPista.left + 150;
  // btnStart
  //btnStart.Left        := iScreenRight - 48 - btnStart.Width;
  //btnStart.Top         := iScreenBottom - ( iScreenBottom - 685 );

  // light off
//  imgRedOFF.Left       := btnStart.Left + ( btnStart.Width div 2 ) - 24;
//  imgYellowOFF.Left    := imgRedOFF.Left;
//  imgGreenOFF.Left     := imgRedOFF.Left;
//
//  imgYellowOFF.Top     := btnStart.Top - 140;
//  imgRedOFF.Top        := imgYellowOFF.Top -58;
//  imgGreenOFF.Top      := imgYellowOFF.Top + 52;

  //cars
  //
  imgCarYellow.Left    := iScreenLeft + 193;
  imgCarBlue.Left      := imgCarYellow.Left + 90;
  imgCarRed.Left       := imgCarBlue.Left + 99;

  imgCarYellow.Top     := 647;// iScreenBottom - imgCarYellow.Height;
  imgCarBlue.Top       := 647;//imgCarYellow.Top;
  imgCarRed.Top        := 647;//imgCarYellow.Top ;


end;

procedure TfrmRCRACING.UniFrameReady(Sender: TObject);
begin
     dm_rc.rc_ResizeBlocks( Self, true, true );
end;

procedure TfrmRCRACING.UniTimer1Timer(Sender: TObject);
begin

  rc_RemoveCssClass( btnStart , 'rc-pulse' );


  case btnStart.Tag of

    0 : begin
          imgRedOFF.Visible := False;
          btnStart.Tag := 1;
        end;
    1 : begin
          imgYellowOFF.Visible := False;
          btnStart.Tag := 2;
        end;
    2 : begin
          imgGreenOFF.Visible := False;
          btnStart.Tag := 3;
          StartRace;
        end;
  end;
end;

initialization

  RegisterClass( TfrmRCRACING );

end.
