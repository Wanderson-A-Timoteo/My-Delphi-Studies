unit untFrmDEMO_PANELS;// v. 4.0.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, StrUtils,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniGUIForm, uniGUIBaseClasses, uniButton, uniBitBtn, uniLabel, uniEdit, uniPanel, uniPageControl, uniHTMLFrame,
  uniURLFrame, Vcl.Imaging.jpeg, uniImage, uniScrollBox, uniMemo,
  Vcl.Imaging.pngimage, uniDateTimePicker, uniDBDateTimePicker, uniDBEdit, uniSweetAlert, uniFileUpload;

type
  TfrmDEMO_PANELS = class(TUniFrame)
    sboxGridBlock: TUniScrollBox;
    rcSweetAlert: TUniSweetAlert;
    rcBlock1000: TUniContainerPanel;
    rcBlock130: TUniContainerPanel;
    UniLabel1: TUniLabel;
    rcBlock131: TUniContainerPanel;
    UniContainerPanel9: TUniContainerPanel;
    UniLabel2: TUniLabel;
    UniScrollBox1: TUniScrollBox;
    UniContainerPanel1: TUniContainerPanel;
    UniLabel9: TUniLabel;
    UniContainerPanel4: TUniContainerPanel;
    UniLabel3: TUniLabel;
    UniContainerPanel6: TUniContainerPanel;
    UniLabel4: TUniLabel;
    UniContainerPanel2: TUniContainerPanel;
    UniLabel8: TUniLabel;
    UniContainerPanel3: TUniContainerPanel;
    UniLabel7: TUniLabel;
    UniContainerPanel7: TUniContainerPanel;
    UniLabel5: TUniLabel;
    UniContainerPanel5: TUniContainerPanel;
    UniLabel6: TUniLabel;
    UniContainerPanel8: TUniContainerPanel;
    UniLabel10: TUniLabel;
    UniContainerPanel10: TUniContainerPanel;
    UniLabel11: TUniLabel;
    rcBlock172: TUniContainerPanel;
    UniContainerPanel11: TUniContainerPanel;
    UniLabel12: TUniLabel;
    labAlert: TUniLabel;
    UniLabel13: TUniLabel;
    rcBlock170: TUniContainerPanel;
    UniLabel14: TUniLabel;
    rcBlock174: TUniContainerPanel;
    UniContainerPanel12: TUniContainerPanel;
    UniLabel15: TUniLabel;
    UniLabel16: TUniLabel;
    UniLabel17: TUniLabel;
    rcBlock178: TUniContainerPanel;
    UniContainerPanel13: TUniContainerPanel;
    UniLabel18: TUniLabel;
    UniLabel19: TUniLabel;
    UniLabel20: TUniLabel;
    rcBlock176: TUniContainerPanel;
    UniContainerPanel14: TUniContainerPanel;
    UniLabel21: TUniLabel;
    UniLabel22: TUniLabel;
    UniLabel23: TUniLabel;
    rcBlock180: TUniContainerPanel;
    UniLabel24: TUniLabel;
    rcBlock182: TUniContainerPanel;
    UniLabel25: TUniLabel;
    rcBlock183: TUniContainerPanel;
    UniLabel26: TUniLabel;
    rcBlock184: TUniContainerPanel;
    UniLabel27: TUniLabel;
    rcBlock185: TUniContainerPanel;
    UniLabel28: TUniLabel;
    procedure UniFrameCreate(Sender: TObject);
    procedure UniFrameReady(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

    iSlides, iSlideCount : integer;

    pObj : TUniControl;

  end;

implementation

{$R *.dfm}

uses Main, ServerModule, untFrmWEBCAM, MainModule, mkm_gridblock,
  mkm_layout, uconsts, mkm_anim, untDM_RC, mkm_translate, mkm_validate, mkm_qrcode, mkm_func_web, untFrmQRCODE, str_func;// v. 3.4.0.0    , untFrmBARCODE;

procedure TfrmDEMO_PANELS.UniFrameCreate(Sender: TObject);
begin

     Self.Color  := StringToColor( mm.CONFIG_LAYOUT_BG_COLOR );

     iSlides     := 1;
     iSlideCount := 3;

     //hfChat.HTML.Clear;

     dm_rc.rc_ShowSweetAlert( 'RadCORE' , 'Do More. Better and Fast!' , 'info' );

     //if mm.CONFIG_LANGUAGE = 'pt_BR' then
     //   btnLink.Hint := rc_SetHintProperty( 'https://radcore.pro.br/web/atualizacoes/' , 'link:', btnLink.Hint )
     //else
     //   btnLink.Hint := rc_SetHintProperty( 'https://radcore.pro.br/web/updates/' , 'link:', btnLink.Hint );

     // para frames, não precisa efetuar o ResizeBlocks
     rc_RenderLayout( Self, false, false );
end;

procedure TfrmDEMO_PANELS.UniFrameReady(Sender: TObject);
begin
     // adjust edit masks
     dm_rc.rc_ApplyEditMasks( Self );

     mm.varDW_LastTick := GetTickCount;
     // ShowMessage(  'Tempo( sem RDW ): ' + FloatToStr( GetTickCount - mm.varDW_LastTick ) );
     dm_rc.rc_ResizeBlocks( Self, true, true );
     //ShowMessageN(  'Tempo( StringReplace default ): ' + FloatToStr( GetTickCount - mm.varDW_LastTick ) );
     // in development
     rc_Translate( Self, nil , '' , mm.CONFIG_LANGUAGE );
end;

initialization
  RegisterClass(TfrmDEMO_PANELS);

end.
