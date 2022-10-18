unit untFrmFREEFRAME;// v. 3.4.0.0
(*

*)

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, StrUtils,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniGUIForm, uniGUIBaseClasses, uniButton, uniBitBtn, uniLabel, uniEdit, uniPanel, uniPageControl, uniHTMLFrame,
  uniURLFrame, Vcl.Imaging.jpeg, uniImage, uniScrollBox, uniMemo,
  Vcl.Imaging.pngimage, uniDateTimePicker, uniDBDateTimePicker, uniDBEdit, uniSweetAlert, uniFileUpload;

type
  TfrmFreeFrame = class(TUniFrame)
    sboxGridBlock: TUniScrollBox;
    rcBlock240: TUniContainerPanel;
    UniContainerPanel28: TUniContainerPanel;
    UniLabel13: TUniLabel;
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
    UniContainerPanel17: TUniContainerPanel;
    UniLabel14: TUniLabel;
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
    rcBlock172: TUniContainerPanel;
    UniContainerPanel24: TUniContainerPanel;
    UniLabel11: TUniLabel;
    labAlert: TUniLabel;
    UniLabel75: TUniLabel;
    rcBlock270: TUniContainerPanel;
    UniContainerPanel27: TUniContainerPanel;
    UniLabel15: TUniLabel;
    UniContainerPanel19: TUniContainerPanel;
    UniHTMLFrame1: TUniHTMLFrame;
    rcBlock280: TUniContainerPanel;
    UniContainerPanel35: TUniContainerPanel;
    UniLabel16: TUniLabel;
    UniContainerPanel18: TUniContainerPanel;
    imgCap: TUniImage;
    UniButton4: TUniButton;
    UniButton5: TUniButton;
    rcBlock200: TUniContainerPanel;
    UniLabel37: TUniLabel;
    rcBlock230: TUniContainerPanel;
    UniLabel40: TUniLabel;
    rcBlock260: TUniContainerPanel;
    UniLabel41: TUniLabel;
    rcBlock170: TUniContainerPanel;
    UniLabel43: TUniLabel;
    rcBlock174: TUniContainerPanel;
    UniContainerPanel13: TUniContainerPanel;
    UniLabel21: TUniLabel;
    UniLabel56: TUniLabel;
    UniLabel76: TUniLabel;
    rcBlock178: TUniContainerPanel;
    UniContainerPanel15: TUniContainerPanel;
    UniLabel24: TUniLabel;
    UniLabel58: TUniLabel;
    UniLabel78: TUniLabel;
    rcBlock176: TUniContainerPanel;
    UniContainerPanel30: TUniContainerPanel;
    UniLabel44: TUniLabel;
    UniLabel57: TUniLabel;
    UniLabel77: TUniLabel;
    rcBlock290: TUniContainerPanel;
    UniContainerPanel37: TUniContainerPanel;
    UniLabel60: TUniLabel;
    UniButton3: TUniButton;
    imgCarRed: TUniImage;
    rcBlock300: TUniContainerPanel;
    UniContainerPanel38: TUniContainerPanel;
    UniLabel61: TUniLabel;
    UniContainerPanel39: TUniContainerPanel;
    UniButton6: TUniButton;
    UniButton7: TUniButton;
    edMsg: TUniEdit;
    hfChat: TUniHTMLFrame;
    rcBlock350: TUniContainerPanel;
    rcBlock355: TUniContainerPanel;
    UniLabel62: TUniLabel;
    rcBlock360: TUniContainerPanel;
    rcBlock370: TUniContainerPanel;
    UniLabel63: TUniLabel;
    rcBlock380: TUniContainerPanel;
    UniLabel64: TUniLabel;
    rcBlock390: TUniContainerPanel;
    UniLabel65: TUniLabel;
    UniContainerPanel20: TUniContainerPanel;
    UniContainerPanel31: TUniContainerPanel;
    UniLabel59: TUniLabel;
    UniContainerPanel34: TUniContainerPanel;
    labCodeReaded: TUniEdit;
    UniButton1: TUniButton;
    UniButton2: TUniButton;
    rcBlock500: TUniContainerPanel;
    rcBlock510: TUniContainerPanel;
    UniLabel66: TUniLabel;
    rcBlock520: TUniContainerPanel;
    rcBlock440: TUniContainerPanel;
    rcBlock450: TUniContainerPanel;
    UniLabel12: TUniLabel;
    rcBlock455: TUniContainerPanel;
    UniLabel74: TUniLabel;
    rcBlock400: TUniContainerPanel;
    rcBlock402: TUniContainerPanel;
    UniLabel67: TUniLabel;
    rcBlock410: TUniContainerPanel;
    rcBlock210: TUniContainerPanel;
    rcBlock222: TUniContainerPanel;
    UniLabel10: TUniLabel;
    rcBlock225: TUniContainerPanel;
    rcBlock220: TUniContainerPanel;
    rcBl: TUniContainerPanel;
    UniLabel68: TUniLabel;
    UniContainerPanel12: TUniContainerPanel;
    rcBlock180: TUniContainerPanel;
    UniLabel79: TUniLabel;
    rcBlock182: TUniContainerPanel;
    UniLabel80: TUniLabel;
    rcBlock183: TUniContainerPanel;
    UniLabel81: TUniLabel;
    rcBlock184: TUniContainerPanel;
    UniLabel82: TUniLabel;
    rcBlock185: TUniContainerPanel;
    UniLabel83: TUniLabel;
    rcBlock187: TUniContainerPanel;
    UniLabel84: TUniLabel;
    rcBlock188: TUniContainerPanel;
    UniLabel85: TUniLabel;
    rcBlock189: TUniContainerPanel;
    UniLabel86: TUniLabel;
    rcBlock192: TUniContainerPanel;
    UniLabel87: TUniLabel;
    UniLabel92: TUniLabel;
    rcBlock194: TUniContainerPanel;
    UniLabel88: TUniLabel;
    UniLabel94: TUniLabel;
    rcBlock190: TUniContainerPanel;
    UniLabel89: TUniLabel;
    UniLabel91: TUniLabel;
    rcBlock193: TUniContainerPanel;
    UniLabel90: TUniLabel;
    UniLabel93: TUniLabel;
    rcBlock195: TUniContainerPanel;
    UniLabel95: TUniLabel;
    rcBlock196: TUniContainerPanel;
    rcBlock198: TUniContainerPanel;
    btnQrCode: TUniButton;
    edQrCodeLink: TUniEdit;
    paQrCode: TUniContainerPanel;
    UniContainerPanel25: TUniContainerPanel;
    imgQrCode: TUniImage;
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
    UniContainerPanel22: TUniContainerPanel;
    UniLabel32: TUniLabel;
    edUserName: TUniEdit;
    labRepitaNova: TUniLabel;
    UniLabel2: TUniLabel;
    edPassword: TUniEdit;
    btnLink: TUniBitBtn;
    rcBlock42: TUniContainerPanel;
    UniContainerPanel9: TUniContainerPanel;
    UniLabel17: TUniLabel;
    UniScrollBox1: TUniScrollBox;
    memo: TUniMemo;
    btnSave: TUniBitBtn;
    btnCancel: TUniBitBtn;
    UniEdit1: TUniEdit;
    rcBlock72: TUniContainerPanel;
    UniContainerPanel14: TUniContainerPanel;
    UniLabel18: TUniLabel;
    UniScrollBox2: TUniScrollBox;
    UniContainerPanel21: TUniContainerPanel;
    UniLabel22: TUniLabel;
    UniLabel23: TUniLabel;
    UniLabel25: TUniLabel;
    UniLabel26: TUniLabel;
    UniLabel27: TUniLabel;
    UniLabel28: TUniLabel;
    UniLabel38: TUniLabel;
    UniLabel39: TUniLabel;
    UniLabel53: TUniLabel;
    UniLabel55: TUniLabel;
    rcBlock70: TUniContainerPanel;
    UniContainerPanel29: TUniContainerPanel;
    UniLabel29: TUniLabel;
    UniContainerPanel36: TUniContainerPanel;
    bsrgpTipo01_M: TUniLabel;
    UniLabel31: TUniLabel;
    bsrgpTipo02_E: TUniLabel;
    UniLabel34: TUniLabel;
    bsrgpTipo03_F: TUniLabel;
    UniLabel47: TUniLabel;
    btnGetIndex: TUniBitBtn;
    btnGetValue: TUniBitBtn;
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
    rcBlock76: TUniContainerPanel;
    UniContainerPanel16: TUniContainerPanel;
    UniLabel69: TUniLabel;
    btnInsertNew: TUniBitBtn;
    btnShowFishFact: TUniBitBtn;
    btnShowCustomer: TUniBitBtn;
    btnEditCustomer: TUniBitBtn;
    rcBlock46: TUniContainerPanel;
    rcBlock48: TUniContainerPanel;
    UniLabel70: TUniLabel;
    rcBlock50: TUniContainerPanel;
    rcLabel3600: TUniLabel;
    rcBlock52: TUniContainerPanel;
    rcBlock58: TUniContainerPanel;
    UniLabel71: TUniLabel;
    rcBlock60: TUniContainerPanel;
    edID: TUniEdit;
    rcBlock65: TUniContainerPanel;
    rcBlock67: TUniContainerPanel;
    btnCancelForm: TUniBitBtn;
    rcBlock69: TUniContainerPanel;
    btnSaveFormValidate: TUniBitBtn;
    rcBlock54: TUniContainerPanel;
    UniLabel72: TUniLabel;
    rcBlock56: TUniContainerPanel;
    UniEdit3: TUniEdit;
    rcBlock63: TUniContainerPanel;
    UniLabel73: TUniLabel;
    rcBlock64: TUniContainerPanel;
    edSite: TUniEdit;
    rcBlock120: TUniContainerPanel;
    UniLabel30: TUniLabel;
    rcBlock128: TUniContainerPanel;
    UniContainerPanel33: TUniContainerPanel;
    UniLabel51: TUniLabel;
    btnQuestionInput: TUniBitBtn;
    btnInputShow: TUniBitBtn;
    chkPassword: TUniLabel;
    UniLabel54: TUniLabel;
    rcBlock126: TUniContainerPanel;
    UniContainerPanel32: TUniContainerPanel;
    UniLabel50: TUniLabel;
    btnToastSucces: TUniBitBtn;
    btnToastWarning: TUniBitBtn;
    btnToastError: TUniBitBtn;
    btnToastInfo: TUniBitBtn;
    chkSound: TUniLabel;
    UniLabel52: TUniLabel;
    rcBlock124: TUniContainerPanel;
    paSweetHeader: TUniContainerPanel;
    UniLabel49: TUniLabel;
    btnSweetSuccess: TUniBitBtn;
    btnSweetWarning: TUniBitBtn;
    btnSweetError: TUniBitBtn;
    btnSweetInfo: TUniBitBtn;
    rcBlock122: TUniContainerPanel;
    UniContainerPanel26: TUniContainerPanel;
    UniLabel48: TUniLabel;
    UniBitBtn12: TUniBitBtn;
    btnSuccess1: TUniBitBtn;
    btnShowMsgInfo: TUniBitBtn;
    btnShowWarning: TUniBitBtn;
    rcBlock130: TUniContainerPanel;
    UniLabel36: TUniLabel;
    rcBlock131: TUniContainerPanel;
    UniContainerPanel23: TUniContainerPanel;
    UniLabel33: TUniLabel;
    UniScrollBox4: TUniScrollBox;
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
    UniLabel45: TUniLabel;
    UniContainerPanel10: TUniContainerPanel;
    UniLabel46: TUniLabel;
    btnInsideBlock: TUniBitBtn;
    rcBlock151: TUniContainerPanel;
    rcBlock157: TUniContainerPanel;
    rcBlock152: TUniContainerPanel;
    rcBlock154: TUniContainerPanel;
    UUUniBitBtn1Clone170: TUniBitBtn;
    rcBlock155: TUniContainerPanel;
    UUUniBitBtn2Clone190: TUniBitBtn;
    rcBlock156: TUniContainerPanel;
    UUUniBitBtn3Clone210: TUniBitBtn;
    rcBlock153: TUniContainerPanel;
    rcBlock144: TUniContainerPanel;
    rcBlock150: TUniContainerPanel;
    rcBlock145: TUniContainerPanel;
    rcBlock147: TUniContainerPanel;
    UUUniBitBtn1: TUniBitBtn;
    rcBlock148: TUniContainerPanel;
    UUUniBitBtn2: TUniBitBtn;
    rcBlock149: TUniContainerPanel;
    UUUniBitBtn3: TUniBitBtn;
    rcBlock146: TUniContainerPanel;
    rcBlock132: TUniContainerPanel;
    rcBlock133: TUniContainerPanel;
    rcBlock134: TUniContainerPanel;
    UUUniDBEdit1: TUniDBEdit;
    UUUniLabel5: TUniLabel;
    rcBlock135: TUniContainerPanel;
    UUUniLabel6: TUniLabel;
    UUUniDBDateTimePicker1: TUniDBDateTimePicker;
    rcBlock136: TUniContainerPanel;
    rcBlock137: TUniContainerPanel;
    UUUniLabel7: TUniLabel;
    UUUniDBEdit2: TUniDBEdit;
    rcBlock138: TUniContainerPanel;
    rcBlock140: TUniContainerPanel;
    bbbtnNewReg: TUniBitBtn;
    rcBlock141: TUniContainerPanel;
    bbbtnEditReg: TUniBitBtn;
    rcBlock142: TUniContainerPanel;
    bbbtnDeleteReg: TUniBitBtn;
    rcBlock139: TUniContainerPanel;
    rcBlock158: TUniContainerPanel;
    rcBlock164: TUniContainerPanel;
    rcBlock159: TUniContainerPanel;
    rcBlock161: TUniContainerPanel;
    UUUUniBitBtn1Clone170: TUniBitBtn;
    rcBlock162: TUniContainerPanel;
    UUUUniBitBtn2Clone190: TUniBitBtn;
    rcBlock163: TUniContainerPanel;
    UUUUniBitBtn3Clone210: TUniBitBtn;
    rcBlock160: TUniContainerPanel;
    btnPrior: TUniButton;
    btnNext: TUniButton;
    paSlides: TUniContainerPanel;
    paImg1: TUniPanel;
    paImg2: TUniPanel;
    paImg3: TUniPanel;
    UniDateTimePicker1: TUniDateTimePicker;
    rcSweetAlert: TUniSweetAlert;
    rcBlock1000: TUniContainerPanel;
    UniButton8: TUniButton;
    UniButton9: TUniButton;
    procedure UniFrameCreate(Sender: TObject);
    procedure btnPriorClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure UniButton5Click(Sender: TObject);
    procedure UniButton4Click(Sender: TObject);
    procedure UniFrameReady(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnGetIndexClick(Sender: TObject);
    procedure btnGetValueClick(Sender: TObject);
    procedure btnSuccess1Click(Sender: TObject);
    procedure btnInputShowClick(Sender: TObject);
    procedure UniBitBtn12Click(Sender: TObject);
    procedure btnSweetWarningClick(Sender: TObject);
    procedure btnSweetSuccessClick(Sender: TObject);
    procedure btnSweetInfoClick(Sender: TObject);
    procedure btnSweetErrorClick(Sender: TObject);
    procedure UniBitBtn11Click(Sender: TObject);
    procedure UniButton2Click(Sender: TObject);
    procedure UniButton1Click(Sender: TObject);
    procedure UniButton3Click(Sender: TObject);
    procedure UniButton6Click(Sender: TObject);
    procedure UniButton7Click(Sender: TObject);
    procedure UniEdit3KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnQrCodeClick(Sender: TObject);
    procedure UniContainerPanel21Click(Sender: TObject);
    procedure btnToastSuccesClick(Sender: TObject);
    procedure btnToastWarningClick(Sender: TObject);
    procedure btnToastInfoClick(Sender: TObject);
    procedure btnToastErrorClick(Sender: TObject);
    procedure btnSaveFormValidateClick(Sender: TObject);
    procedure btnShowFishFactClick(Sender: TObject);
    procedure btnShowCustomerClick(Sender: TObject);
    procedure btnEditCustomerClick(Sender: TObject);
    procedure btnInsertNewClick(Sender: TObject);
    procedure btnInsideBlockClick(Sender: TObject);
    procedure btnQuestionInputClick(Sender: TObject);
    procedure btnShowMsgInfoClick(Sender: TObject);
    procedure btnShowWarningClick(Sender: TObject);
    procedure btnCancelFormClick(Sender: TObject);
    procedure edSiteExit(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure UniButton8Click(Sender: TObject);
    procedure UniButton9Click(Sender: TObject);
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
  mkm_layout, uconsts, mkm_anim, untDM_RC, mkm_translate, mkm_validate, mkm_qrcode, mkm_func_web, untFrmQRCODE;// v. 3.4.0.0    , untFrmBARCODE;

procedure TfrmFreeFrame.btnEditCustomerClick(Sender: TObject);
begin
     MainForm.rc_AddFormFrameInTab( nil, 'Clientes', 'clientes', '' , false, false, aftEdit, 569 );
end;

procedure TfrmFreeFrame.btnGetIndexClick(Sender: TObject);
begin
   //dm_rc.rc_ShowMessage( 'Selected ItemIndex = ' + dm_rc.rc_GetItemIndexFromRgp( bsrgpTipo01_M ).ToString );
   ShowMessage( 'Selected ItemIndex = ' + dm_rc.rc_GetItemIndexFromRgp( bsrgpTipo01_M ).ToString );
end;

procedure TfrmFreeFrame.btnGetValueClick(Sender: TObject);
begin
   //dm_rc.rc_ShowMessage( 'Selected Item Value = ' + dm_rc.rc_GetValueFromRgp( bsrgpTipo01_M ) );
   ShowMessage( 'Selected Item Value = ' + dm_rc.rc_GetValueFromRgp( bsrgpTipo01_M ) );
end;

procedure TfrmFreeFrame.btnInsertNewClick(Sender: TObject);
begin
     MainForm.rc_AddFormFrameInTab( nil, 'Clientes', 'clientes', '' , false, false, aftInsert );
     dm_rc.rc_ConsoleLog('Clicked option 4');
end;

procedure TfrmFreeFrame.btnInsideBlockClick(Sender: TObject);
begin
     rcblock120.Height := 215;
     MainForm.rc_AddFormFrameInTab( nil, 'Fish Fact', '', 'FISHFACT' , false, false, aftNone, 0, rcblock120 );
end;

procedure TfrmFreeFrame.UniBitBtn12Click(Sender: TObject);
begin
     dm_rc.rc_ShowError('Oh no !!!');
end;

procedure TfrmFreeFrame.btnSuccess1Click(Sender: TObject);
begin
     dm_rc.rc_ShowMessage( 'Processed!!!' , 'success' );
end;

procedure TfrmFreeFrame.btnInputShowClick(Sender: TObject);
begin
     dm_rc.rc_ShowInputBox( 'Admin required' , 'Enter info1' , '', 'Enter info2', '', ( chkPassword.tag = 1 ) );

     dm_rc.rc_ShowSweetAlert( 'Sucess!', 'Field 1:' + mm.varC_InputBox_Result1 + sLineBreak +
                                           'Field 2:' + mm.varC_InputBox_Result2 , 'success'  )
end;

procedure TfrmFreeFrame.btnSweetSuccessClick(Sender: TObject);
begin
     dm_rc.rc_ShowSweetAlert( 'Sucess!', 'Use Masks.', 'success'  );
end;

procedure TfrmFreeFrame.btnSweetWarningClick(Sender: TObject);
begin
     dm_rc.rc_ShowSweetAlert( 'Alert!', 'Use Masks.', 'warning' );
end;

procedure TfrmFreeFrame.btnToastErrorClick(Sender: TObject);
begin
     dm_rc.rc_ShowToaster( 'error', 'RadCORE helps you !', (chkSound.tag = 1), 'pinItUp' );
end;

procedure TfrmFreeFrame.btnToastInfoClick(Sender: TObject);
begin
     dm_rc.rc_ShowToaster( 'info', 'RadCORE it´s nice !', (chkSound.tag = 1), 'pinItUp' ); //slideLeftRightFade
end;

procedure TfrmFreeFrame.btnToastSuccesClick(Sender: TObject);
begin
     dm_rc.rc_ShowToaster( 'success', 'RadCORE helps you !', (chkSound.tag = 1), 'pinItUp' );
end;

procedure TfrmFreeFrame.btnToastWarningClick(Sender: TObject);
begin
     dm_rc.rc_ShowToaster( 'warning', 'Do not choose another. Choose RadCORE !', (chkSound.tag = 1), 'slideLeftRightFade' );
end;
// v. 3.3.1.0
procedure TfrmFreeFrame.edSiteExit(Sender: TObject);
begin
  if ( edSite.Text = '' ) then
     dm_rc.rc_ShowSweetAlert( 'SweetAlert', 'Fill Site Field', 'error', self, 'edSite');
end;

procedure TfrmFreeFrame.btnSweetErrorClick(Sender: TObject);
begin
     dm_rc.rc_ShowSweetAlert( 'Error!', 'Sorry...', 'error' );
end;

procedure TfrmFreeFrame.btnSweetInfoClick(Sender: TObject);
begin
     dm_rc.rc_ShowSweetAlert( 'Info!', 'Use Masks.', 'info' );
end;

procedure TfrmFreeFrame.UniBitBtn11Click(Sender: TObject);
begin

     dm_rc.rc_ShowToaster( 'success', 'RadCORE. Your best choice !', (chkSound.tag = 1), 'slideLeftRightFade' );
end;
// copy to "clipboard" // v. 3.3.1.0
procedure TfrmFreeFrame.btnSaveClick(Sender: TObject);
begin
     // v. 3.4.0.0
     if UniEdit1.Text = '' then
        rc_CallOut( 'Content is Empty!', UniEdit1, ctDanger )
     else
     begin
        UniSession.AddJS( 'ajaxRequest( ' + MainForm.htmlFrame.JSName + ' , "_CopyToClipBoard", ["content=" + ' + QuotedStr( UniEdit1.Text ) + '] );' );
        rc_CallOut( 'Content Copied!', UniEdit1, ctInfo );
     end;
end;
// paste from "clipboard" // v. 3.3.1.0
procedure TfrmFreeFrame.btnCancelClick(Sender: TObject);
begin
     memo.Lines.Clear;
     memo.Lines.Add( mm.varC_TempString );
     // v. 3.4.0.0
     rc_CallOut( 'Content Pasted!', memo, ctSuccess, carBottom, '100,0', crpB_T  );
end;

procedure TfrmFreeFrame.btnSaveFormValidateClick(Sender: TObject);
begin
  if not rc_FormValidate( Self ) then
  begin
     Abort;
  end;
end;

procedure TfrmFreeFrame.btnShowCustomerClick(Sender: TObject);
begin
     //                                   Form Title  Form table
     MainForm.rc_AddFormFrameInTab( nil, 'Clientes', 'clientes', '' , false, false, aftShow,  569 );
end;

procedure TfrmFreeFrame.btnShowFishFactClick(Sender: TObject);
begin
     //                                   Form Title  Form table
     MainForm.rc_AddFormFrameInTab( nil, 'Fish Fact', '', 'FISHFACT' , false, false );
end;

procedure TfrmFreeFrame.btnShowMsgInfoClick(Sender: TObject);
begin
     dm_rc.rc_ShowMessage( 'You Win!!!' , 'info' );
end;

procedure TfrmFreeFrame.btnShowWarningClick(Sender: TObject);
begin
     dm_rc.rc_ShowMessage( 'Invalid Input' , 'warning' );
end;

procedure TfrmFreeFrame.UniButton1Click(Sender: TObject);
begin
//     frmBARCODE.ShowModal( procedure(Sender: TComponent; Result:Integer)
//                          begin
//                               if mm.varB_Yes then
//                                  labCodeReaded.Text := mm.varC_TempFile ;
//                          end
//                          );
end;

procedure TfrmFreeFrame.UniButton2Click(Sender: TObject);
begin
     labCodeReaded.Text := '';
end;

procedure TfrmFreeFrame.UniButton3Click(Sender: TObject);
begin
    rc_AnimTimeLineCreate( 'rcRedCar' );

    rc_AnimTimeLineAdd( 'rcRedCar', imgCarRed, 'y', '-150', '1.8', gsEasePower1, '0.8', gsEaseTypeOut , '90') ;
    rc_AnimTimeLineAdd( 'rcRedCar', imgCarRed, 'x', '470' , '2.8', gsEaseBack  , '0.8', gsEaseTypeOut );
    rc_AnimTimeLineAdd( 'rcRedCar', imgCarRed, 'y', '50'  , '1.8', gsEasePower2, '0.8', gsEaseTypeOut, '270' );
    rc_AnimTimeLineAdd( 'rcRedCar', imgCarRed, 'x', '-100', '2.8', gsEaseBack  , '0.8', gsEaseTypeOut  );

    rc_AnimTimeLinePlay( 'rcRedCar' );
end;

procedure TfrmFreeFrame.UniButton4Click(Sender: TObject);
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

procedure TfrmFreeFrame.UniButton5Click(Sender: TObject);
begin
   dm_rc.rc_BitmapClear( imgCap );
end;

procedure TfrmFreeFrame.UniButton6Click(Sender: TObject);
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

procedure TfrmFreeFrame.UniButton7Click(Sender: TObject);
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

procedure TfrmFreeFrame.UniButton8Click(Sender: TObject);
begin
     frmQRCODE.ShowModal( procedure(Sender: TComponent; Result:Integer)
                          begin
                               if ( mm.varB_Yes ) and ( mm.varC_TempFile <> '' ) then
                                  dm_rc.rc_ShowSweetAlertSuccess( mm.varC_TempFile );
                          end
                          );
end;
// soon
procedure TfrmFreeFrame.UniButton9Click(Sender: TObject);
begin
//     frmBARCODE.ShowModal( procedure(Sender: TComponent; Result:Integer)
//                          begin
//                               if ( mm.varB_Yes ) and ( mm.varC_TempFile <> '' ) then
//                                  dm_rc.rc_ShowSweetAlertSuccess( mm.varC_TempFile );
//                          end
//                          );
end;

procedure TfrmFreeFrame.UniContainerPanel21Click(Sender: TObject);
begin
//  dm_rc.rc_RgpCheck( Self, 'bsrgpTipo02_E_db', True, True );
//  dm_rc.rc_BootStrapRender( Self , true, bsrgpTipo01_M_db );
//  dm_rc.rc_BootStrapRender( Self , true, bsrgpTipo02_E_db );
//  dm_rc.rc_BootStrapRender( Self , true, bsrgpTipo03_F_db );
end;

procedure TfrmFreeFrame.UniEdit3KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     //if key = 13 then
     //   dm_rc.rc_QrCode( hfQRCode, UniEdit3.Text, 3 );

     //   UniSession.AddJS( 'updateQRCode("rc-qrcode", "' + UniEdit3.Text  + '", 3 );' );
end;

procedure TfrmFreeFrame.btnPriorClick(Sender: TObject);
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

procedure TfrmFreeFrame.btnQrCodeClick(Sender: TObject);
begin
  rc_QRCode( imgQrCode, edQrCodeLink.Text, Self );
  rc_QRCode( paQrCode, edQrCodeLink.Text, Self );
end;

procedure TfrmFreeFrame.btnQuestionInputClick(Sender: TObject);
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

procedure TfrmFreeFrame.btnCancelFormClick(Sender: TObject);
begin
     dm_rc.rc_MaskAdjust( edID, mtUNMASK, '' );
end;

procedure TfrmFreeFrame.btnCloseClick(Sender: TObject);
begin
     if mm.oPgGeneral <> nil then
        mm.oPgGeneral.ActivePage.Close;
end;

procedure TfrmFreeFrame.btnNextClick(Sender: TObject);
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

procedure TfrmFreeFrame.UniFrameCreate(Sender: TObject);
begin
     Self.Color  := StringToColor( mm.CONFIG_LAYOUT_BG_COLOR );

     iSlides     := 1;
     iSlideCount := 3;

     hfChat.HTML.Clear;

     dm_rc.rc_ShowSweetAlert( 'RadCORE' , 'Do More. Better and Fast!' , 'info' );

     if mm.CONFIG_LANGUAGE = 'pt_BR' then
        btnLink.Hint := rc_SetHintProperty( 'https://radcore.pro.br/web/atualizacoes/' , 'link:', btnLink.Hint )
     else
        btnLink.Hint := rc_SetHintProperty( 'https://radcore.pro.br/web/updates/' , 'link:', btnLink.Hint );
     // para frames, não precisa efetuar o ResizeBlocks
     rc_RenderLayout( Self, false, false );
end;

procedure TfrmFreeFrame.UniFrameReady(Sender: TObject);
begin
     // adjust edit masks
     dm_rc.rc_ApplyEditMasks( Self );

     //mm.varDW_LastTick := GetTickCount;
     // ShowMessage(  'Tempo( sem RDW ): ' + FloatToStr( GetTickCount - mm.varDW_LastTick ) );
     dm_rc.rc_ResizeBlocks( Self, true, true );
     //ShowMessageN(  'Tempo( StringReplace default ): ' + FloatToStr( GetTickCount - mm.varDW_LastTick ) );

     // in development
     rc_Translate( Self, nil , '' , mm.CONFIG_LANGUAGE );
end;

initialization
  RegisterClass(TfrmFreeFrame);

end.
