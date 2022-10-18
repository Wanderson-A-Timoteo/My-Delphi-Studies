unit untFrmDEMO_MESSAGES;// v. 4.0.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, StrUtils,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniGUIForm, uniGUIBaseClasses, uniButton, uniBitBtn, uniLabel, uniEdit, uniPanel, uniPageControl, uniHTMLFrame,
  uniURLFrame, Vcl.Imaging.jpeg, uniImage, uniScrollBox, uniMemo,
  Vcl.Imaging.pngimage, uniDateTimePicker, uniDBDateTimePicker, uniDBEdit, uniSweetAlert, uniFileUpload;

type
  TfrmDEMO_MESSAGES = class(TUniFrame)
    sboxGridBlock: TUniScrollBox;
    rcBlock10: TUniContainerPanel;
    UniLabel35: TUniLabel;
    rcSweetAlert: TUniSweetAlert;
    rcBlock1000: TUniContainerPanel;
    rcBlock128: TUniContainerPanel;
    UniContainerPanel1: TUniContainerPanel;
    UniLabel1: TUniLabel;
    btnQuestionInput: TUniBitBtn;
    btnInputShow: TUniBitBtn;
    chkPassword: TUniLabel;
    UniLabel2: TUniLabel;
    rcBlock126: TUniContainerPanel;
    UniContainerPanel2: TUniContainerPanel;
    UniLabel3: TUniLabel;
    btnToastSucces: TUniBitBtn;
    btnToastWarning: TUniBitBtn;
    btnToastError: TUniBitBtn;
    btnToastInfo: TUniBitBtn;
    chkSound: TUniLabel;
    UniLabel4: TUniLabel;
    rcBlock124: TUniContainerPanel;
    paSweetHeader: TUniContainerPanel;
    UniLabel5: TUniLabel;
    btnSweetSuccess: TUniBitBtn;
    btnSweetWarning: TUniBitBtn;
    btnSweetError: TUniBitBtn;
    btnSweetInfo: TUniBitBtn;
    rcBlock122: TUniContainerPanel;
    UniContainerPanel3: TUniContainerPanel;
    UniLabel6: TUniLabel;
    UniBitBtn1: TUniBitBtn;
    btnSuccess1: TUniBitBtn;
    btnShowMsgInfo: TUniBitBtn;
    btnShowWarning: TUniBitBtn;
    procedure UniFrameCreate(Sender: TObject);
    procedure UniFrameReady(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnSuccess1Click(Sender: TObject);
    procedure btnShowMsgInfoClick(Sender: TObject);
    procedure btnShowWarningClick(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
    procedure btnSweetSuccessClick(Sender: TObject);
    procedure btnSweetInfoClick(Sender: TObject);
    procedure btnSweetWarningClick(Sender: TObject);
    procedure btnSweetErrorClick(Sender: TObject);
    procedure btnToastSuccesClick(Sender: TObject);
    procedure btnToastInfoClick(Sender: TObject);
    procedure btnToastWarningClick(Sender: TObject);
    procedure btnToastErrorClick(Sender: TObject);
    procedure btnQuestionInputClick(Sender: TObject);
    procedure btnInputShowClick(Sender: TObject);

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

procedure TfrmDEMO_MESSAGES.btnCloseClick(Sender: TObject);
begin
     if mm.oPgGeneral <> nil then
        mm.oPgGeneral.ActivePage.Close;
end;

procedure TfrmDEMO_MESSAGES.btnInputShowClick(Sender: TObject);
begin
     dm_rc.rc_ShowInputBox( 'Admin required' , 'Enter info1' , '', 'Enter info2', '', ( chkPassword.tag = 1 ) );

     dm_rc.rc_ShowSweetAlert( 'Sucess!', 'Field 1:' + mm.varC_InputBox_Result1 + sLineBreak +
                                           'Field 2:' + mm.varC_InputBox_Result2 , 'success'  )
end;

procedure TfrmDEMO_MESSAGES.btnQuestionInputClick(Sender: TObject);
begin
  dm_rc.rc_ShowYesNo( 'Confirm ?' );
  if mm.varB_Yes then
  begin
     dm_rc.rc_ShowYesNo( 'Really yes ?' );
     //dm_rc.rc_ShowMessage( 'confirmed' );
     dm_rc.rc_ShowSweetAlert( 'Sucess!', 'Clicked YES', 'success'  )
  end
  else
  begin
     dm_rc.rc_ShowYesNo( 'Really No ?' );
     //dm_rc.rc_ShowMessage( 'bye' );
     dm_rc.rc_ShowSweetAlert( 'Warning!', 'Clicked NO', 'warning'  );
  end;
end;

procedure TfrmDEMO_MESSAGES.btnShowMsgInfoClick(Sender: TObject);
begin
     dm_rc.rc_ShowMessage( 'You Win!!!' , 'info' );
end;

procedure TfrmDEMO_MESSAGES.btnShowWarningClick(Sender: TObject);
begin
     dm_rc.rc_ShowMessage( 'Invalid Input' , 'warning' );
end;

procedure TfrmDEMO_MESSAGES.btnSuccess1Click(Sender: TObject);
begin
     dm_rc.rc_ShowMessage( 'Processed!!!' , 'success' );
end;

procedure TfrmDEMO_MESSAGES.btnSweetErrorClick(Sender: TObject);
begin
     dm_rc.rc_ShowSweetAlert( 'Error!', 'Sorry...', 'error' );
end;

procedure TfrmDEMO_MESSAGES.btnSweetInfoClick(Sender: TObject);
begin
     dm_rc.rc_ShowSweetAlert( 'Info!', 'Use Masks.', 'info' );
end;

procedure TfrmDEMO_MESSAGES.btnSweetSuccessClick(Sender: TObject);
begin
     dm_rc.rc_ShowSweetAlert( 'Sucess!', 'Use Masks.', 'success'  );
end;

procedure TfrmDEMO_MESSAGES.btnSweetWarningClick(Sender: TObject);
begin
     dm_rc.rc_ShowSweetAlert( 'Alert!', 'Use Masks.', 'warning' );
end;

procedure TfrmDEMO_MESSAGES.btnToastErrorClick(Sender: TObject);
begin
     dm_rc.rc_ShowToaster( 'error', 'RadCORE helps you !', (chkSound.tag = 1), 'pinItUp' );
end;

procedure TfrmDEMO_MESSAGES.btnToastInfoClick(Sender: TObject);
begin
     dm_rc.rc_ShowToaster( 'info', 'RadCORE it´s nice !', (chkSound.tag = 1), 'pinItUp' ); //slideLeftRightFade
end;

procedure TfrmDEMO_MESSAGES.btnToastSuccesClick(Sender: TObject);
begin
     //dm_rc.rc_ShowToaster( 'success', 'RadCORE helps [[ico:fas-check]] you !', (chkSound.tag = 1), 'pinItUp' );
     dm_rc.rc_ShowToaster( 'success', 'RadCORE helps you !', (chkSound.tag = 1), 'pinItUp' );
end;

procedure TfrmDEMO_MESSAGES.btnToastWarningClick(Sender: TObject);
begin
     dm_rc.rc_ShowToaster( 'warning', 'Do not choose another. Choose RadCORE !', (chkSound.tag = 1), 'slideLeftRightFade' );
end;

procedure TfrmDEMO_MESSAGES.UniBitBtn1Click(Sender: TObject);
begin
     dm_rc.rc_ShowError('Oh no !!!');
end;

procedure TfrmDEMO_MESSAGES.UniFrameCreate(Sender: TObject);
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

procedure TfrmDEMO_MESSAGES.UniFrameReady(Sender: TObject);
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
  RegisterClass(TfrmDEMO_MESSAGES);

end.
