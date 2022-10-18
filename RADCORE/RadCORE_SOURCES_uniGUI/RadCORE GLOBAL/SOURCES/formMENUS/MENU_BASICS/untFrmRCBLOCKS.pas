unit untFrmRCBLOCKS; // 3.3.1.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniDBEdit, uniCheckBox, uniDBCheckBox, uniButton,
  uniBitBtn, uniSpeedButton, uniEdit, uniMultiItem, uniComboBox, uniDBComboBox,
  uniDateTimePicker, uniDBDateTimePicker, uniLabel, uniPanel, uniScrollBox,
  uniPageControl, uniGUIBaseClasses, uniBasicGrid, uniDBGrid, uniListBox, uniDBLookupComboBox, uniImage, Vcl.Imaging.pngimage, uniImageList, uniHTMLFrame, uniMemo;

type
  TfrmRCBlocks = class(TUniFrame)
    rcBlock1: TUniContainerPanel;
    pgPadrao: TUniPageControl;
    tabGeral: TUniTabSheet;
    sboxGridBlockTab1: TUniScrollBox;
    rcBlock10: TUniContainerPanel;
    edCodigo: TUniDBEdit;
    UniLabel3: TUniLabel;
    rcBlock20: TUniContainerPanel;
    UniLabel66: TUniLabel;
    edDtCad: TUniDBDateTimePicker;
    rcBlock30: TUniContainerPanel;
    UniLabel5: TUniLabel;
    UniDBDateTimePicker1: TUniDBDateTimePicker;
    rcBlock50: TUniContainerPanel;
    UniLabel10: TUniLabel;
    edCnpjCpf: TUniDBEdit;
    rcBlock40: TUniContainerPanel;
    UniLabel67: TUniLabel;
    edTipoPessoa: TUniDBComboBox;
    rcBlock70: TUniContainerPanel;
    UniLabel68: TUniLabel;
    UniDBEdit21: TUniDBEdit;
    rcBlock60: TUniContainerPanel;
    rcBlock80: TUniContainerPanel;
    UniLabel6: TUniLabel;
    UniDBEdit1: TUniDBEdit;
    rcBlock90: TUniContainerPanel;
    UniLabel12: TUniLabel;
    edRazSoc: TUniDBEdit;
    rcBlock100: TUniContainerPanel;
    UniLabel4: TUniLabel;
    edCep: TUniDBEdit;
    rcBlock110: TUniContainerPanel;
    UniLabel21: TUniLabel;
    UniDBEdit4: TUniDBEdit;
    rcBlock120: TUniContainerPanel;
    UniLabel13: TUniLabel;
    UniDBEdit5: TUniDBEdit;
    rcBlock130: TUniContainerPanel;
    UniLabel46: TUniLabel;
    UniDBEdit6: TUniDBEdit;
    rcBlock140: TUniContainerPanel;
    UniLabel61: TUniLabel;
    UniDBEdit7: TUniDBEdit;
    rcBlock150: TUniContainerPanel;
    UniLabel14: TUniLabel;
    edLkpUFS: TUniDBEdit;
    rcBlock160: TUniContainerPanel;
    UniLabel15: TUniLabel;
    edLkpCIDADES: TUniDBEdit;
    rcBlock180: TUniContainerPanel;
    UniLabel16: TUniLabel;
    UniDBEdit8: TUniDBEdit;
    rcBlock170: TUniContainerPanel;
    UniLabel70: TUniLabel;
    edLkpCIDADES_SetDS: TUniDBEdit;
    rcBlock190: TUniContainerPanel;
    UniLabel35: TUniLabel;
    UniDBEdit3: TUniDBEdit;
    rcBlock200: TUniContainerPanel;
    UniLabel56: TUniLabel;
    UniDBEdit13: TUniDBEdit;
    rcBlock210: TUniContainerPanel;
    UniLabel57: TUniLabel;
    UniDBEdit19: TUniDBEdit;
    rcBlock220: TUniContainerPanel;
    UniLabel58: TUniLabel;
    UniDBEdit20: TUniDBEdit;
    rcBlock270: TUniContainerPanel;
    rcBlock5: TUniContainerPanel;
    labAlerta: TUniLabel;
    UniTabSheet2: TUniTabSheet;
    sboxGridBlockTab2: TUniScrollBox;
    rcBlock360: TUniContainerPanel;
    UniLabel73: TUniLabel;
    UniDBEdit22: TUniDBEdit;
    rcBlock370: TUniContainerPanel;
    UniLabel74: TUniLabel;
    UniDBEdit32: TUniDBEdit;
    rcBlock380: TUniContainerPanel;
    UniLabel75: TUniLabel;
    UniDBEdit34: TUniDBEdit;
    rcBlock390: TUniContainerPanel;
    UniLabel76: TUniLabel;
    UniDBEdit36: TUniDBEdit;
    rcBlock400: TUniContainerPanel;
    UniLabel77: TUniLabel;
    UniDBEdit38: TUniDBEdit;
    rcBlock410: TUniContainerPanel;
    UniLabel78: TUniLabel;
    edLkpUFS__ENTREGA: TUniDBEdit;
    rcBlock420: TUniContainerPanel;
    UniLabel79: TUniLabel;
    edLkpCIDADES__ENTREGA: TUniDBEdit;
    rcBlock430: TUniContainerPanel;
    UniLabel80: TUniLabel;
    UniDBEdit43: TUniDBEdit;
    rcBlock350: TUniContainerPanel;
    UniLabel30: TUniLabel;
    rcBlock460: TUniContainerPanel;
    UniPageControl1: TUniPageControl;
    UniTabSheet1: TUniTabSheet;
    sboxGridBlockTab3: TUniScrollBox;
    rcBlock465: TUniContainerPanel;
    UniDBEdit2: TUniDBEdit;
    UniLabel1: TUniLabel;
    rcBlock466: TUniContainerPanel;
    UniLabel2: TUniLabel;
    UniDBDateTimePicker2: TUniDBDateTimePicker;
    rcBlock467: TUniContainerPanel;
    UniLabel7: TUniLabel;
    UniDBDateTimePicker3: TUniDBDateTimePicker;
    rcBlock469: TUniContainerPanel;
    UniLabel8: TUniLabel;
    UniDBEdit9: TUniDBEdit;
    rcBlock468: TUniContainerPanel;
    UniLabel9: TUniLabel;
    UniDBComboBox1: TUniDBComboBox;
    rcBlock470: TUniContainerPanel;
    UniLabel22: TUniLabel;
    UniDBEdit14: TUniDBEdit;
    rcBlock490: TUniContainerPanel;
    UniLabel24: TUniLabel;
    UniDBEdit16: TUniDBEdit;
    rcBlock500: TUniContainerPanel;
    UniLabel25: TUniLabel;
    UniDBEdit17: TUniDBEdit;
    rcBlock459: TUniContainerPanel;
    UniPageControl2: TUniPageControl;
    UniTabSheet5: TUniTabSheet;
    UniScrollBox3: TUniScrollBox;
    rcBlock510: TUniContainerPanel;
    UniDBEdit40: TUniDBEdit;
    UniLabel37: TUniLabel;
    rcBlock520: TUniContainerPanel;
    UniLabel38: TUniLabel;
    UniDBDateTimePicker4: TUniDBDateTimePicker;
    rcBlock530: TUniContainerPanel;
    UniLabel39: TUniLabel;
    UniDBDateTimePicker5: TUniDBDateTimePicker;
    rcBlock550: TUniContainerPanel;
    UniLabel41: TUniLabel;
    UniDBEdit41: TUniDBEdit;
    rcBlock540: TUniContainerPanel;
    UniLabel42: TUniLabel;
    UniDBComboBox2: TUniDBComboBox;
    rcBlock560: TUniContainerPanel;
    UniLabel44: TUniLabel;
    UniDBEdit44: TUniDBEdit;
    UniContainerPanel22: TUniContainerPanel;
    UniLabel32: TUniLabel;
    UniContainerPanel2: TUniContainerPanel;
    UniLabel11: TUniLabel;
    btnCancel: TUniBitBtn;
    UniTabSheet3: TUniTabSheet;
    UniScrollBox1: TUniScrollBox;
    rcBlock580: TUniContainerPanel;
    rcBlock: TUniLabel;
    rcBlock590: TUniContainerPanel;
    rcBlock600: TUniContainerPanel;
    rcBlock610: TUniContainerPanel;
    rcBlock620: TUniContainerPanel;
    rcBlock640: TUniContainerPanel;
    rcBlock650: TUniContainerPanel;
    rcBlock660: TUniContainerPanel;
    rcBlock670: TUniContainerPanel;
    procedure UniFrameCreate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure UniFrameReady(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses untdm_rc, MainModule, Main, mkm_layout;

procedure TfrmRCBlocks.btnCancelClick(Sender: TObject);
begin
     if mm.oPgGeneral <> nil then
        mm.oPgGeneral.ActivePage.Close;
end;

procedure TfrmRCBlocks.UniFrameCreate(Sender: TObject);
begin
  Self.Color             := StringToColor( mm.CONFIG_LAYOUT_BG_COLOR );

  // para frames, não precisa efetuar o ResizeBlocks
  rc_RenderLayout( Self, false, false );

  //rc_AddCssClass( unipanel1, 'rc-border-color-red'  );

  //rc_AddCssClass( rcBlock680, 'rc-border-color-red'  );

  //UniPanel1.JSInterface.JSCode('var me='#1'; if (me.body.hasCls("rc-border-color-red")) {me.removeBodyCls("rc-border-color-red")} else {me.addBodyCls("rc-border-color-red")};');

end;

procedure TfrmRCBlocks.UniFrameReady(Sender: TObject);
begin

     dm_rc.rc_ResizeBlocks( Self, true, true );
     dm_rc.rc_SetFocus( edDtCad );

end;

initialization

  RegisterClass( TfrmRCBlocks );

end.
