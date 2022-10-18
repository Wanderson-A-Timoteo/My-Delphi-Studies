unit untFrmDEMO_EXTRAS;// v. 4.0.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, StrUtils,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniGUIForm, uniGUIBaseClasses, uniButton, uniBitBtn, uniLabel, uniEdit, uniPanel, uniPageControl, uniHTMLFrame,
  uniURLFrame, Vcl.Imaging.jpeg, uniImage, uniScrollBox, uniMemo,
  Vcl.Imaging.pngimage, uniDateTimePicker, uniDBDateTimePicker, uniDBEdit, uniSweetAlert, uniFileUpload;

type
  TfrmDEMO_EXTRAS = class(TUniFrame)
    sboxGridBlock: TUniScrollBox;
    rcSweetAlert: TUniSweetAlert;
    rcBlock1000: TUniContainerPanel;
    rcBlock195: TUniContainerPanel;
    UniLabel1: TUniLabel;
    rcBlock196: TUniContainerPanel;
    rcBlock198: TUniContainerPanel;
    btnQrCode: TUniButton;
    edQrCodeLink: TUniEdit;
    paQrCode: TUniContainerPanel;
    UniContainerPanel1: TUniContainerPanel;
    imgQrCode: TUniImage;
    rcBlock200: TUniContainerPanel;
    UniLabel2: TUniLabel;
    rcBlock210: TUniContainerPanel;
    rcBlock222: TUniContainerPanel;
    UniLabel3: TUniLabel;
    rcBlock225: TUniContainerPanel;
    rcBlock220: TUniContainerPanel;
    rcBl: TUniContainerPanel;
    UniLabel4: TUniLabel;
    UniContainerPanel2: TUniContainerPanel;
    btnPrior: TUniButton;
    btnNext: TUniButton;
    paSlides: TUniContainerPanel;
    paImg1: TUniPanel;
    paImg2: TUniPanel;
    paImg3: TUniPanel;
    rcBlock290: TUniContainerPanel;
    UniContainerPanel7: TUniContainerPanel;
    UniLabel8: TUniLabel;
    UniButton5: TUniButton;
    imgCarRed: TUniImage;
    rcBlock300: TUniContainerPanel;
    UniContainerPanel8: TUniContainerPanel;
    UniLabel9: TUniLabel;
    UniContainerPanel9: TUniContainerPanel;
    UniButton6: TUniButton;
    UniButton7: TUniButton;
    edMsg: TUniEdit;
    hfChat: TUniHTMLFrame;
    rcBlock350: TUniContainerPanel;
    rcBlock355: TUniContainerPanel;
    UniLabel10: TUniLabel;
    rcBlock360: TUniContainerPanel;
    rcBlock370: TUniContainerPanel;
    UniLabel11: TUniLabel;
    rcBlock380: TUniContainerPanel;
    UniLabel12: TUniLabel;
    rcBlock390: TUniContainerPanel;
    UniLabel13: TUniLabel;
    rcBlock500: TUniContainerPanel;
    rcBlock510: TUniContainerPanel;
    UniLabel5: TUniLabel;
    rcBlock520: TUniContainerPanel;
    procedure UniFrameCreate(Sender: TObject);
    procedure UniFrameReady(Sender: TObject);
    procedure btnQrCodeClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnPriorClick(Sender: TObject);
    procedure UniButton6Click(Sender: TObject);
    procedure UniButton7Click(Sender: TObject);

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

procedure TfrmDEMO_EXTRAS.btnNextClick(Sender: TObject);
begin
     if iSlides < iSlideCount then
     begin
        rc_jQueryAnimate(
          TUniControl( Self.FindComponent( 'paImg' + iSlides.ToString ) ) ,
            'left'  ,
            IntToStr( ( TUniControl( Self.FindComponent( 'paImg' + iSlides.ToString ) ).Width + 3 ) * (-1) ) ,
            '350' );

        Inc( iSlides );

        rc_jQueryAnimate(
          TUniControl( Self.FindComponent( 'paImg' + ( iSlides ).ToString ) ) ,
            'left'  ,
            '3' ,
            '350');
     end;
end;

procedure TfrmDEMO_EXTRAS.btnPriorClick(Sender: TObject);
begin
     if iSlides >= 2 then
     begin
        rc_jQueryAnimate(
          TUniControl( Self.FindComponent(
            'paImg' + iSlides.ToString ) ) ,
            'left'  ,
            IntToStr( ( TUniControl( Self.FindComponent( 'paImg' + iSlides.ToString ) ).Width + 3 )  ) ,
            '350' );

        Dec( iSlides );

        rc_jQueryAnimate(
          TUniControl( Self.FindComponent(
            'paImg' + ( iSlides ).ToString ) ) ,
            'left'  ,
            '3' ,
            '350');
     end;
end;

procedure TfrmDEMO_EXTRAS.btnQrCodeClick(Sender: TObject);
begin
  rc_QRCode( imgQrCode, edQrCodeLink.Text, Self );
  rc_QRCode( paQrCode, edQrCodeLink.Text, Self );
end;

procedure TfrmDEMO_EXTRAS.UniButton6Click(Sender: TObject);
begin
    hfChat.HTML.Add(
            '                    <!-- Message to the right -->' +
            '                    <div class="direct-chat-msg right">' +
            '                        <div class="direct-chat-infos clearfix">' +
            '                            <span class="direct-chat-name float-right">RadCORE</span>' +
            '                            <span class="direct-chat-timestamp float-left">' + DateTimeToStr(now)  + '</span>' +
            '                        </div>' +
            '                        <!-- /.direct-chat-infos -->' +
            '                        <img class="direct-chat-img" src="files/images/avatar_12.png" alt="func image">' +
            '                        <!-- /.direct-chat-img -->' +
            '                        <div class="direct-chat-text">' +
            '                            ' + edMsg.Text +
            '                        </div>' +
            '                        <!-- /.direct-chat-text -->' +
            '                    </div>' +
            '                    <!-- /.direct-chat-msg -->' );

    edMsg.Text := '';
end;

procedure TfrmDEMO_EXTRAS.UniButton7Click(Sender: TObject);
begin
    hfChat.HTML.Add(
         '                    <!-- Message. Default to the left -->' +
         '                    <div class="direct-chat-msg">' +
         '                        <div class="direct-chat-infos clearfix">' +
         '                            <span class="direct-chat-name float-left">Flavio Motta</span>' +
         '                            <span class="direct-chat-timestamp float-right">' + DateTimeToStr(now)  + '</span>' +
         '                        </div>' +
         '                        <!-- /.direct-chat-infos -->' +
         '                        <img class="direct-chat-img" src="files/images/avatar_8.png" alt="cli image">' +
         '                        <!-- /.direct-chat-img -->' +
         '                        <div class="direct-chat-text">' +
         '                            ' + edMsg.Text +
         '                        </div>' +
         '                        <!-- /.direct-chat-text -->' +
         '                    </div>' +
         '                    <!-- /.direct-chat-msg -->' );

    edMsg.Text := '';
end;

procedure TfrmDEMO_EXTRAS.UniFrameCreate(Sender: TObject);
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

procedure TfrmDEMO_EXTRAS.UniFrameReady(Sender: TObject);
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
  RegisterClass(TfrmDEMO_EXTRAS);

end.
