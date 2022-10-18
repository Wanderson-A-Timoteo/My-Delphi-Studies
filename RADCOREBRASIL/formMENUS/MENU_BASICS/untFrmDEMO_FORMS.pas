unit untFrmDEMO_FORMS;// v. 4.0.0.4

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, StrUtils,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniGUIForm, uniGUIBaseClasses, uniButton, uniBitBtn, uniLabel, uniEdit, uniPanel, uniPageControl, uniHTMLFrame,
  uniURLFrame, Vcl.Imaging.jpeg, uniImage, uniScrollBox, uniMemo,
  Vcl.Imaging.pngimage, uniDateTimePicker, uniDBDateTimePicker, uniDBEdit, uniSweetAlert, uniFileUpload;

type
  TfrmDEMO_FORMS = class(TUniFrame)
    sboxGridBlock: TUniScrollBox;
    rcBlock10: TUniContainerPanel;
    UniLabel35: TUniLabel;
    rcSweetAlert: TUniSweetAlert;
    rcBlock1000: TUniContainerPanel;
    rcBlock40: TUniContainerPanel;
    UniContainerPanel1: TUniContainerPanel;
    UniLabel1: TUniLabel;
    edUserName: TUniEdit;
    labRepitaNova: TUniLabel;
    UniLabel2: TUniLabel;
    edPassword: TUniEdit;
    btnLink: TUniBitBtn;
    rcBlock42: TUniContainerPanel;
    rcBlock43: TUniContainerPanel;
    UniLabel3: TUniLabel;
    btnSave: TUniBitBtn;
    btnCancel: TUniBitBtn;
    rcBlock44: TUniContainerPanel;
    UniEdit1: TUniEdit;
    rcBlock45: TUniContainerPanel;
    memo: TUniMemo;
    rcBlock72: TUniContainerPanel;
    UniContainerPanel2: TUniContainerPanel;
    UniLabel8: TUniLabel;
    UniScrollBox1: TUniScrollBox;
    UniContainerPanel3: TUniContainerPanel;
    UniLabel9: TUniLabel;
    UniLabel10: TUniLabel;
    UniLabel11: TUniLabel;
    UniLabel12: TUniLabel;
    UniLabel13: TUniLabel;
    UniLabel14: TUniLabel;
    UniLabel15: TUniLabel;
    UniLabel16: TUniLabel;
    UniLabel17: TUniLabel;
    UniLabel18: TUniLabel;
    rcBlock70: TUniContainerPanel;
    UniContainerPanel4: TUniContainerPanel;
    UniLabel19: TUniLabel;
    UniContainerPanel5: TUniContainerPanel;
    bsrgpTipo01_M: TUniLabel;
    UniLabel20: TUniLabel;
    bsrgpTipo02_E: TUniLabel;
    UniLabel21: TUniLabel;
    bsrgpTipo03_F: TUniLabel;
    UniLabel22: TUniLabel;
    btnGetIndex: TUniBitBtn;
    btnGetValue: TUniBitBtn;
    rcBlock76: TUniContainerPanel;
    UniContainerPanel6: TUniContainerPanel;
    UniLabel23: TUniLabel;
    btnInsertNew: TUniBitBtn;
    btnShowFishFact: TUniBitBtn;
    btnShowCustomer: TUniBitBtn;
    btnEditCustomer: TUniBitBtn;
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
    rcBlock390: TUniContainerPanel;
    UniBitBtn1: TUniBitBtn;
    rcBlock46: TUniContainerPanel;
    rcBlock48: TUniContainerPanel;
    UniLabel4: TUniLabel;
    rcBlock50: TUniContainerPanel;
    rcLabel3600: TUniLabel;
    rcBlock52: TUniContainerPanel;
    UniDateTimePicker1: TUniDateTimePicker;
    rcBlock58: TUniContainerPanel;
    UniLabel5: TUniLabel;
    rcBlock60: TUniContainerPanel;
    edID: TUniEdit;
    rcBlock65: TUniContainerPanel;
    rcBlock67: TUniContainerPanel;
    btnCancelForm: TUniBitBtn;
    rcBlock69: TUniContainerPanel;
    btnSaveFormValidate: TUniBitBtn;
    rcBlock54: TUniContainerPanel;
    UniLabel6: TUniLabel;
    rcBlock56: TUniContainerPanel;
    UniEdit2: TUniEdit;
    rcBlock63: TUniContainerPanel;
    UniLabel7: TUniLabel;
    rcBlock64: TUniContainerPanel;
    edSite: TUniEdit;
    procedure UniFrameCreate(Sender: TObject);
    procedure UniFrameReady(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnShowFishFactClick(Sender: TObject);
    procedure btnShowCustomerClick(Sender: TObject);
    procedure btnEditCustomerClick(Sender: TObject);
    procedure btnInsertNewClick(Sender: TObject);
    procedure btnInsideBlockClick(Sender: TObject);
    procedure btnSaveFormValidateClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
    procedure btnCancelFormClick(Sender: TObject);
    procedure btnGetValueClick(Sender: TObject);
    procedure btnGetIndexClick(Sender: TObject);

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

// copy to "clipboard" // v. 3.3.1.0
procedure TfrmDEMO_FORMS.btnSaveClick(Sender: TObject);
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
procedure TfrmDEMO_FORMS.btnCancelClick(Sender: TObject);
begin
     memo.Lines.Clear;
     memo.Lines.Add( mm.varC_TempString );
     // v. 3.4.0.0
     rc_CallOut( 'Content Pasted!', memo, ctSuccess, carBottom, '100,0', crpB_T  );
end;

procedure TfrmDEMO_FORMS.btnCancelFormClick(Sender: TObject);
begin
     dm_rc.rc_MaskAdjust( edID, mtUNMASK, '' );
end;

procedure TfrmDEMO_FORMS.btnCloseClick(Sender: TObject);
begin
     if mm.oPgGeneral <> nil then
        mm.oPgGeneral.ActivePage.Close;
end;

procedure TfrmDEMO_FORMS.btnEditCustomerClick(Sender: TObject);
begin
     MainForm.rc_AddFormFrameInTab( nil, 'Clientes', 'clientes', '' , false, false, aftEdit, 569 );
end;

procedure TfrmDEMO_FORMS.btnGetIndexClick(Sender: TObject);
begin
   //dm_rc.rc_ShowMessage( 'Selected ItemIndex = ' + dm_rc.rc_GetItemIndexFromRgp( bsrgpTipo01_M ).ToString );
   ShowMessage( 'Selected ItemIndex = ' + dm_rc.rc_GetItemIndexFromRgp( bsrgpTipo01_M ).ToString );
end;

procedure TfrmDEMO_FORMS.btnGetValueClick(Sender: TObject);
begin
   //dm_rc.rc_ShowMessage( 'Selected Item Value = ' + dm_rc.rc_GetValueFromRgp( bsrgpTipo01_M ) );
   ShowMessage( 'Selected Item Value = ' + dm_rc.rc_GetValueFromRgp( bsrgpTipo01_M ) );
end;

procedure TfrmDEMO_FORMS.btnInsertNewClick(Sender: TObject);
begin
     MainForm.rc_AddFormFrameInTab( nil, 'Clientes', 'clientes', '' , false, false, aftInsert );
     dm_rc.rc_ConsoleLog('Clicked option 4');
end;

procedure TfrmDEMO_FORMS.btnInsideBlockClick(Sender: TObject);
begin
     rcblock390.Height := 215;
     MainForm.rc_AddFormFrameInTab( nil, 'Fish Fact', '', 'FISHFACT' , false, false, aftNone, 0, rcblock390, true, false );
end;

procedure TfrmDEMO_FORMS.btnSaveFormValidateClick(Sender: TObject);
begin
  if not rc_FormValidate( Self ) then
  begin
     Abort;
  end;
end;

procedure TfrmDEMO_FORMS.btnShowCustomerClick(Sender: TObject);
begin
     //                                   Form Title  Form table
     MainForm.rc_AddFormFrameInTab( nil, 'Clientes', 'clientes', '' , false, false, aftShowReg,  569 );
end;

procedure TfrmDEMO_FORMS.btnShowFishFactClick(Sender: TObject);
begin
     //                                   Form Title  Form table
     MainForm.rc_AddFormFrameInTab( nil, 'Fish Fact', '', 'FISHFACT' , false, false );
end;

procedure TfrmDEMO_FORMS.UniBitBtn1Click(Sender: TObject);
begin
     if mm.oPgGeneral <> nil then
        mm.oPgGeneral.ActivePage.Close;
end;

procedure TfrmDEMO_FORMS.UniFrameCreate(Sender: TObject);
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
     rc_RenderLayout( Self, false, false, false, false, true ); // v. 4.0.0.4
end;

procedure TfrmDEMO_FORMS.UniFrameReady(Sender: TObject);
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
  RegisterClass(TfrmDEMO_FORMS);

end.
