unit untFrmDEMO_BUTTONS;// v. 4.0.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, StrUtils,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniGUIForm, uniGUIBaseClasses, uniButton, uniBitBtn, uniLabel, uniEdit, uniPanel, uniPageControl, uniHTMLFrame,
  uniURLFrame, Vcl.Imaging.jpeg, uniImage, uniScrollBox, uniMemo,
  Vcl.Imaging.pngimage, uniDateTimePicker, uniDBDateTimePicker, uniDBEdit, uniSweetAlert, uniFileUpload, uniMultiItem, uniComboBox;

type
  TfrmDEMO_BUTTONS = class(TUniFrame)
    sboxGridBlock: TUniScrollBox;
    rcBlock10: TUniContainerPanel;
    UniLabel35: TUniLabel;
    rcBlock30: TUniContainerPanel;
    UniContainerPanel11: TUniContainerPanel;
    UniLabel42: TUniLabel;
    UniScrollBox3: TUniScrollBox;
    btnRedOutL: TUniBitBtn;
    btnGreenOutL: TUniBitBtn;
    btnBlueOutL: TUniBitBtn;
    btnRedRound: TUniBitBtn;
    btnGreenRound: TUniBitBtn;
    btnRound: TUniBitBtn;
    btnOrangeOutL: TUniBitBtn;
    btnGrayOutL: TUniBitBtn;
    btnOrangeRound: TUniBitBtn;
    btnSilverOutL: TUniBitBtn;
    btnGrayRound: TUniBitBtn;
    btnSilverRound: TUniBitBtn;
    rcSweetAlert: TUniSweetAlert;
    rcBlock1000: TUniContainerPanel;
    rcBlock19: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    UniLabel1: TUniLabel;
    labRcCollapse24: TUniLabel;
    rcBlock21: TUniContainerPanel;
    btnClose: TUniBitBtn;
    rcBlock22: TUniContainerPanel;
    btnRed: TUniBitBtn;
    rcBlock23: TUniContainerPanel;
    btnGreen: TUniBitBtn;
    rcBlock27: TUniContainerPanel;
    btnGray: TUniBitBtn;
    rcBlock28: TUniContainerPanel;
    btnSilver: TUniBitBtn;
    rcBlock29: TUniContainerPanel;
    btnCrud: TUniBitBtn;
    rcBlock24: TUniContainerPanel;
    btnOrange: TUniBitBtn;
    rcBlock25: TUniContainerPanel;
    btnBlue: TUniBitBtn;
    rcBlock26: TUniContainerPanel;
    btnDark: TUniBitBtn;
    rcBlock40: TUniContainerPanel;
    UniContainerPanel11Clone: TUniContainerPanel;
    UniLabel42Clone: TUniLabel;
    UniScrollBox3Clone: TUniScrollBox;
    UniContainerPanel1: TUniContainerPanel;
    btnLink: TUniBitBtn;
    btnCancel: TUniBitBtn;
    btnSave: TUniBitBtn;
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

procedure TfrmDEMO_BUTTONS.UniFrameCreate(Sender: TObject);
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

procedure TfrmDEMO_BUTTONS.UniFrameReady(Sender: TObject);
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
  RegisterClass(TfrmDEMO_BUTTONS);

end.
