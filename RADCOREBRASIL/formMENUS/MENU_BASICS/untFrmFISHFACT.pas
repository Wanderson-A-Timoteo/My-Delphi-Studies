unit untFrmFISHFACT; // v. 4.0.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniDBEdit, uniCheckBox, uniDBCheckBox, uniButton,
  uniBitBtn, uniSpeedButton, uniEdit, uniMultiItem, uniComboBox, uniDBComboBox,
  uniDateTimePicker, uniDBDateTimePicker, uniLabel, uniPanel, uniScrollBox,
  uniPageControl, uniGUIBaseClasses, uniImageList, uniFileUpload, Vcl.Menus,
  uniMainMenu, Data.DB, uniRadioGroup, uniDBRadioGroup, uniMemo, uniDBMemo,
  uniDBText, uniBasicGrid, uniDBGrid, uniStatusBar, uniDBNavigator, uniImage,
  uniDBImage, Datasnap.DBClient;

type
  TfrmFishFact = class(TUniFrame)
    DataSource1: TDataSource;
    UniFileUpload1: TUniFileUpload;
    UniNativeImageList1: TUniNativeImageList;
    ClientDataSet: TClientDataSet;
    sboxFishFact: TUniScrollBox;
    rcBlock400: TUniContainerPanel;
    UniDBEdit1: TUniDBEdit;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniDBEdit2: TUniDBEdit;
    UniLabel7: TUniLabel;
    UniDBEdit3: TUniDBEdit;
    UniDBEdit4: TUniDBEdit;
    UniLabel3: TUniLabel;
    UniDBText1: TUniDBText;
    UniDBComboBox1: TUniDBComboBox;
    UniContainerPanel3: TUniContainerPanel;
    UniLabel8: TUniLabel;
    rcBlock410: TUniContainerPanel;
    UniDBImage1: TUniDBImage;
    UniDBNavigator1: TUniDBNavigator;
    UniBitBtn1: TUniBitBtn;
    UniBitBtn2: TUniBitBtn;
    UniContainerPanel2: TUniContainerPanel;
    UniLabel5: TUniLabel;
    rcBlock420: TUniContainerPanel;
    UniDBRadioGroup1: TUniDBRadioGroup;
    UniContainerPanel1: TUniContainerPanel;
    UniLabel4: TUniLabel;
    rcBlock430: TUniContainerPanel;
    UniDBMemo1: TUniDBHTMLMemo;
    UniContainerPanel4: TUniContainerPanel;
    UniLabel6: TUniLabel;
    rcBlock440: TUniContainerPanel;
    UniDBGrid1: TUniDBGrid;
    stBar: TUniStatusBar;
    procedure UniFrameCreate(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure UniFrameReady(Sender: TObject);
    procedure UniDBGrid1DrawColumnCell(Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure UniDBGrid1CellClick(Column: TUniDBGridColumn);
    procedure UniFrameDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses untdm_rc, mkm_layout;

procedure TfrmFishFact.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  try
     stBar.Panels[0].Text:=DataSource1.DataSet.FieldByName('species no').AsString;
     stBar.Panels[1].Text:=DataSource1.DataSet.FieldByName('common_name').AsString;
  except
    on E: Exception do
    begin
      if Pos('midas.dll', LowerCase(E.Message)) > 0 then
        MessageDlgN('Required file "Midas.DLL" not found.<br>' +
                    'Please make sure this file is deployed with your application.<br>'+
                    E.Message,
                    mtError, [mbOK]
                    )
      else
        raise;
    end;
  end;
end;

procedure TfrmFishFact.UniDBGrid1CellClick(Column: TUniDBGridColumn);
begin
// cria um CSS pra celula que foi clicada
//   unisession.addJS( 'Ext.util.CSS.createStyleSheet("'+
//      '#'+ UniDBGrid1.JSName+'_id .x-grid-cell-selected {' +
//      ' font-weight: bold;' +
//      ' background-color: yellow !important;' +
//      ' color:red;'+
//      '}")' );
end;

procedure TfrmFishFact.UniDBGrid1DrawColumnCell(Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
     dm_rc.rc_GridDrawCell( UniDBGrid1 , ACol, ARow, Column, Attribs ) ;
end;

procedure TfrmFishFact.UniFrameCreate(Sender: TObject);
begin

  UniSession.Log('fishfact - create');
  UniDBGrid1.Hint := '[[' +
                        //'no-paged|' +
                        'fieldmasks:' +
                        'grid-resize|'+
                        'grid-forcefit:8 mobile-v-5 mobile-h-8|' +
//                        'category[[' +
//                        //'     visible:false mobile ]];' +
//                        '     width:0 mobile-h:0 mobile-v:0 ]];' +
//
//                        'species name[[' +
//                        //'     visible:false mobile ]];' +
//                        '     width:0 mobile-h:0 mobile-v:0 ]];' +
//
//                        'length (cm)[[' +
//                        //'     visible:false mobile ]];' +
//                        '     width:0 mobile-h:0 mobile-v:0 ]];' +
//                        'length_in[[' +
//                        //'     visible:false mobile ]];' +
//                        '     width:0 mobile-h:0 mobile-v:0 ]];' +
                        'notes[[' +
                        '     visible:false ]];' +
//                        '     width:0 mobile-h:0 mobile-v:0 ]];' +
                        ']]' ;

     // para frames, não precisa efetuar o ResizeBlocks
     rc_RenderLayout( Self, false, false );


end;

procedure TfrmFishFact.UniFrameDestroy(Sender: TObject);
begin
   UniDBEdit1.JSInterface.JSCallGlobal('Ext.util.CSS.removeStyleSheet', [ UniDBEdit1.JSName+'_css' ]);
end;

procedure TfrmFishFact.UniFrameReady(Sender: TObject);
begin
     UniSession.Log('fishfact - create');

     dm_rc.rc_ResizeBlocks( Self, true, true );
     // v. 4.0.0.0
     //[PT] para forms/frames que não herdam do frmBaseCRUD e contenham GRIDS
     //[EN] for forms/frames that do not inherit from frmBaseCRUD and contain GRIDS
     dm_rc.rc_DBGridUpdateAll( Self , false, false, true); // v. 4.0.0.0
end;

initialization

  RegisterClass( TfrmFishFact );

end.
