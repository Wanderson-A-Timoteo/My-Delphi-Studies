unit untFrmDEMO_TABS;// v. 4.0.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, StrUtils,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniGUIForm, uniGUIBaseClasses, uniButton, uniBitBtn, uniLabel, uniEdit, uniPanel, uniPageControl, uniHTMLFrame,
  uniURLFrame, Vcl.Imaging.jpeg, uniImage, uniScrollBox, uniMemo,
  Vcl.Imaging.pngimage, uniDateTimePicker, uniDBDateTimePicker, uniDBEdit, uniSweetAlert, uniFileUpload;

type
  TfrmDEMO_TABS = class(TUniFrame)
    sboxGridBlock: TUniScrollBox;
    rcSweetAlert: TUniSweetAlert;
    rcBlock1000: TUniContainerPanel;
    rcBlock240: TUniContainerPanel;
    UniContainerPanel1: TUniContainerPanel;
    UniLabel1: TUniLabel;
    pgTabSample: TUniPageControl;
    tabEx1: TUniTabSheet;
    pa1: TUniPanel;
    UniMemo1: TUniMemo;
    tabEx2: TUniTabSheet;
    UniMemo2: TUniMemo;
    tabEx3: TUniTabSheet;
    UniMemo3: TUniMemo;
    paTabSample: TUniContainerPanel;
    labTabs: TUniLabel;
    rcBlock250: TUniContainerPanel;
    UniContainerPanel2: TUniContainerPanel;
    UniLabel2: TUniLabel;
    pgCardTab: TUniPageControl;
    UniTabSheet1: TUniTabSheet;
    UniPanel1: TUniPanel;
    UniMemo4: TUniMemo;
    UniTabSheet2: TUniTabSheet;
    UniMemo5: TUniMemo;
    UniTabSheet3: TUniTabSheet;
    UniMemo6: TUniMemo;
    paPillSample: TUniContainerPanel;
    labPills: TUniLabel;
    rcBlock230: TUniContainerPanel;
    UniLabel3: TUniLabel;
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

procedure TfrmDEMO_TABS.UniFrameCreate(Sender: TObject);
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

procedure TfrmDEMO_TABS.UniFrameReady(Sender: TObject);
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
  RegisterClass(TfrmDEMO_TABS);

end.
