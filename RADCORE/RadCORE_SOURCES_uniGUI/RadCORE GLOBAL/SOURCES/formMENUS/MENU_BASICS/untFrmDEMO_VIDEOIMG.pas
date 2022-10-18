unit untFrmDEMO_VIDEOIMG;// v. 4.0.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, StrUtils,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniGUIForm, uniGUIBaseClasses, uniButton, uniBitBtn, uniLabel, uniEdit, uniPanel, uniPageControl, uniHTMLFrame,
  uniURLFrame, Vcl.Imaging.jpeg, uniImage, uniScrollBox, uniMemo,
  Vcl.Imaging.pngimage, uniDateTimePicker, uniDBDateTimePicker, uniDBEdit, uniSweetAlert, uniFileUpload;

type
  TfrmDEMO_VIDEOIMG = class(TUniFrame)
    sboxGridBlock: TUniScrollBox;
    rcSweetAlert: TUniSweetAlert;
    rcBlock1000: TUniContainerPanel;
    rcBlock440: TUniContainerPanel;
    rcBlock450: TUniContainerPanel;
    UniLabel1: TUniLabel;
    rcBlock455: TUniContainerPanel;
    UniLabel2: TUniLabel;
    rcBlock400: TUniContainerPanel;
    rcBlock402: TUniContainerPanel;
    UniLabel3: TUniLabel;
    rcBlock410: TUniContainerPanel;
    rcBlock270: TUniContainerPanel;
    UniContainerPanel1: TUniContainerPanel;
    UniLabel4: TUniLabel;
    UniContainerPanel2: TUniContainerPanel;
    UniHTMLFrame1: TUniHTMLFrame;
    rcBlock280: TUniContainerPanel;
    UniContainerPanel3: TUniContainerPanel;
    UniLabel5: TUniLabel;
    UniContainerPanel4: TUniContainerPanel;
    imgCap: TUniImage;
    UniButton1: TUniButton;
    UniButton2: TUniButton;
    UniButton3: TUniButton;
    UniButton4: TUniButton;
    rcBlock260: TUniContainerPanel;
    UniLabel6: TUniLabel;
    procedure UniFrameCreate(Sender: TObject);
    procedure UniFrameReady(Sender: TObject);
    procedure UniButton1Click(Sender: TObject);
    procedure UniButton3Click(Sender: TObject);
    procedure UniButton4Click(Sender: TObject);
    procedure UniButton2Click(Sender: TObject);

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

procedure TfrmDEMO_VIDEOIMG.UniButton1Click(Sender: TObject);
begin
     // vai retornar o caminho da foto
     // will return the path of the photo
     frmWEBCAM.ShowModal( procedure(Sender: TComponent; Result:Integer)
                          begin
                               if mm.varB_Yes then
                                  imgCap.Picture.LoadFromFile( mm.varC_TempFile );
                          end
                          );
end;

procedure TfrmDEMO_VIDEOIMG.UniButton2Click(Sender: TObject);
begin
   dm_rc.rc_BitmapClear( imgCap );
end;

procedure TfrmDEMO_VIDEOIMG.UniButton3Click(Sender: TObject);
begin
     frmQRCODE.ShowModal( procedure(Sender: TComponent; Result:Integer)
                          begin
                               if ( mm.varB_Yes ) and ( mm.varC_TempFile <> '' ) then
                                  dm_rc.rc_ShowSweetAlertSuccess( mm.varC_TempFile );
                          end
                          );
end;

procedure TfrmDEMO_VIDEOIMG.UniButton4Click(Sender: TObject);
begin
//     frmBARCODE.ShowModal( procedure(Sender: TComponent; Result:Integer)
//                          begin
//                               if ( mm.varB_Yes ) and ( mm.varC_TempFile <> '' ) then
//                                  dm_rc.rc_ShowSweetAlertSuccess( mm.varC_TempFile );
//                          end
//                          );
end;

procedure TfrmDEMO_VIDEOIMG.UniFrameCreate(Sender: TObject);
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

procedure TfrmDEMO_VIDEOIMG.UniFrameReady(Sender: TObject);
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
  RegisterClass(TfrmDEMO_VIDEOIMG);

end.
