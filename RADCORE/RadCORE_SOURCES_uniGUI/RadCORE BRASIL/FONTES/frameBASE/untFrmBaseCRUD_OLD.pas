unit untFrmBaseCRUD_OLD; // v. 3.4.1.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  System.StrUtils, Maskutils, str_func,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, untFrmBase, uniGUIBaseClasses, uniScrollBox,
  uniPanel, uniPageControl, uniBasicGrid, uniDBGrid, uniEdit, uniDBEdit, UniSpeedButton,
  uniLabel, Data.DB, uniButton, uniBitBtn, uniMultiItem, uniComboBox,
  TypInfo, uniDBLookUpComboBox, uniDBComboBox, uniDBCheckBox, uniDBRadioGroup, uniDBMemo, uniDBImage, uniDBText,  uniListBox,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uniDateTimePicker, uniDBDateTimePicker, uniCheckBox, uniMenuButton, Vcl.Menus, uniMainMenu,
  uniHTMLFrame, uniSweetAlert;

type
  TfrmBaseCRUD = class(TfrmBase)
    pgBaseCadControl: TUniPageControl;
    tabSearch: TUniTabSheet;
    tabRegister: TUniTabSheet;
    paBaseRegSearch: TUniContainerPanel;
    paBaseRegData1: TUniContainerPanel;
    dsMaster: TDataSource;
    dsSearchMaster: TDataSource;
    sqlSearchMaster: TFDQuery;
    sqlMaster: TFDQuery;
    popMenuOptions: TUniPopupMenu;
    ExportarpraEXCEL1: TUniMenuItem;
    N1: TUniMenuItem;
    paBaseTopTitle: TUniContainerPanel;
    labTitleForm: TUniLabel;
    paBaseButtons: TUniContainerPanel;
    paOF: TUniContainerPanel;
    btnCloseForm: TUniBitBtn;
    btnOptions: TUniBitBtn;
    paP: TUniContainerPanel;
    btnSearch: TUniBitBtn;
    paNAE: TUniContainerPanel;
    btnNewReg: TUniBitBtn;
    btnEditReg: TUniBitBtn;
    btnDeleteReg: TUniBitBtn;
    paGC: TUniContainerPanel;
    btnSaveReg: TUniBitBtn;
    btnCancelReg: TUniBitBtn;
    FDSchemaAdapter1: TFDSchemaAdapter;
    paSearchFilters: TUniPanel;
    UniScrollBox1: TUniScrollBox;
    paSearchFilterDate: TUniContainerPanel;
    UniLabelFd1: TUniLabel;
    cbxSearchCRUDFieldDate: TUniComboBox;
    cbxSearchCRUDFieldDate_Fields: TUniComboBox;
    dbgSearchCRUD: TUniDBGrid;
    labExit: TUniLabel;
    labNew: TUniLabel;
    labCancel: TUniLabel;
    labSave: TUniLabel;
    labState: TUniLabel;
    edQuickSearch: TUniEdit;
    ed_Table_ItemSel: TUniEdit;
    ed_FormOrigin: TUniEdit;
    ed_FormOrigin_Tab: TUniEdit;
    ed_Table_Status: TUniEdit;
    ed_Order_Search: TUniEdit;
    ed_Where_Search: TUniEdit;
    ed_CodMaster: TUniEdit;
    ed_PK: TUniEdit;
    ed_FieldMasks: TUniEdit;
    ed_OldPKValue: TUniEdit;
    ed_Table_Status_OLD: TUniEdit;
    ed_AskNewRec_AfterPost: TUniEdit;
    ed_GenNextID_OnNew: TUniEdit;
    Excel1: TUniMenuItem;
    Excel2: TUniMenuItem;
    Xml1: TUniMenuItem;
    dbgExport: TUniDBGrid;
    Csv1: TUniMenuItem;
    labOptions: TUniLabel;
    labEdit: TUniLabel;
    labDelete: TUniLabel;
    btnQuickSearch: TUniBitBtn;
    paSearchFilter1: TUniContainerPanel;
    paSearchField1: TUniContainerPanel;
    cbxSearchCRUDField1: TUniComboBox;
    cbxSearchCRUDField1_Fields: TUniComboBox;
    UniLabelc1: TUniLabel;
    paSearchOp1: TUniContainerPanel;
    UniLabelp1: TUniLabel;
    cbxSearchCRUDOpt1: TUniComboBox;
    paSearchContent1: TUniContainerPanel;
    UniLabelv1: TUniLabel;
    edSearchCRUD1: TUniEdit;
    paSearchFilter2: TUniContainerPanel;
    paSearchField2: TUniContainerPanel;
    UniLabelc2: TUniLabel;
    cbxSearchCRUDField2: TUniComboBox;
    cbxSearchCRUDField2_Fields: TUniComboBox;
    paSearchOp2: TUniContainerPanel;
    UniLabelp2: TUniLabel;
    cbxSearchCRUDOpt2: TUniComboBox;
    paSearchContent2: TUniContainerPanel;
    UniLabelv2: TUniLabel;
    edSearchCRUD2: TUniEdit;
    paSearchFilterAndOr: TUniContainerPanel;
    paSearchFilterDescendent: TUniContainerPanel;
    cbxAndOr: TUniCheckBox;
    labTitleSearch: TUniLabel;
    paSearchFilterPeriod: TUniContainerPanel;
    UniLabelPd1: TUniLabel;
    cbxSearchCRUDPeriod: TUniComboBox;
    paSearchFilterPeriodSelect: TUniContainerPanel;
    paSearchFilterDtIni: TUniContainerPanel;
    UniLabelDtIni: TUniLabel;
    edSearchCRUDDtIni: TUniDateTimePicker;
    paSearchFilterDtEnd: TUniContainerPanel;
    UniLabelDtEnd: TUniLabel;
    edSearchCRUDDtEnd: TUniDateTimePicker;
    paSearchBtn: TUniContainerPanel;
    btnSearchCRUD: TUniBitBtn;
    btnSearchMoreFilters: TUniBitBtn;
    ed_PKS: TUniEdit;
    ed_OLDPKS: TUniEdit;
    paNotFound_dbgSearchCRUD: TUniContainerPanel;
    imgNoRecords_dbgSearchCRUD: TUniLabel;
    labNotFound_dbgSearchCRUD: TUniLabel;
    paPageBar: TUniContainerPanel;
    paPagePagBtns: TUniContainerPanel;
    labPagePrior: TUniLabel;
    labPageCurrPage: TUniLabel;
    labPageNext: TUniLabel;
    labPageLast: TUniLabel;
    labPageFirst: TUniLabel;
    edPageNumber: TUniEdit;
    labPageRefresh: TUniLabel;
    labPageSearch: TUniLabel;
    procedure UniFrameCreate(Sender: TObject);
    procedure UniFrameDestroy(Sender: TObject);
    procedure dsMasterStateChange(Sender: TObject);
    procedure dbgSearchCRUDDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure cbxSearchCRUDField1Change(Sender: TObject);
    procedure cbxSearchCRUDField2Change(Sender: TObject);
    procedure cbxSearchCRUDFieldDateChange(Sender: TObject);
    procedure cbxSearchCRUDPeriodChange(Sender: TObject);
    procedure btnCancelRegClick(Sender: TObject);
    procedure UniFrameAjaxEvent(Sender: TComponent; EventName: string;
      Params: TUniStrings);
    procedure btnSearchCRUDClick(Sender: TObject);
    procedure btnCloseFormClick(Sender: TObject);
    procedure btnOptionsClick(Sender: TObject);
    procedure dbgSearchCRUDDblClick(Sender: TObject);
    procedure cbxAndOrChange(Sender: TObject);
    procedure UniFrameReady(Sender: TObject);
    procedure cbxSearchCRUDPagedClick(Sender: TObject);
    procedure sqlMasterBeforeDelete(DataSet: TDataSet);
    procedure btnNewRegClick(Sender: TObject);
    procedure btnEditRegClick(Sender: TObject);
    procedure btnDeleteRegClick(Sender: TObject);
    procedure btnSaveRegClick(Sender: TObject);
    procedure btnSearchMoreFiltersClick(Sender: TObject);
    procedure sqlSearchMasterBeforeDelete(DataSet: TDataSet);
    procedure dbgSearchCRUDColumnSort(Column: TUniDBGridColumn;
      Direction: Boolean);
    procedure dbgSearchCRUDCellClick(Column: TUniDBGridColumn);
    procedure dbgSearchCRUDMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnSearchClick(Sender: TObject);
    procedure btnQuickSearchClick(Sender: TObject);
    procedure Excel1Click(Sender: TObject);
    procedure Excel2Click(Sender: TObject);
    procedure Xml1Click(Sender: TObject);
    procedure Csv1Click(Sender: TObject);
    procedure FDSchemaAdapter1AfterApplyUpdate(Sender: TObject);
    procedure labOptionsClick(Sender: TObject);
    procedure pgBaseCadControlChangeValue(Sender: TObject);
    procedure dsMasterDataChange(Sender: TObject; Field: TField);
    procedure dsSearchMasterStateChange(Sender: TObject);
    procedure sqlMasterAfterScroll(DataSet: TDataSet);
    procedure sqlMasterError(ASender, AInitiator: TObject; var AException: Exception);
    procedure sqlSearchMasterError(ASender, AInitiator: TObject; var AException: Exception);
    procedure labPageRefreshClick(Sender: TObject);
    procedure labPageFirstClick(Sender: TObject);
    procedure labPagePriorClick(Sender: TObject);
    procedure labPageNextClick(Sender: TObject);
    procedure labPageLastClick(Sender: TObject);
    procedure edPageNumberKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  // v. 3.3.0.1
  private
    { Private declarations }
    vt1, vt2 : Cardinal;
    vTime   : Extended;
    mX, mY,
    iFirstShow : integer;
    bSaveMasterPK,
    bActions,
    bModelCrud1,
    bPaged     : boolean;
    cFilters,
    cTemp, cTemp2: String;
    iCurrentPage,iCurrentRec : integer; // v. 3.3.1.0( future feature )
  public
    { Public declarations }
    procedure rc_CloseQuerys;
    procedure rc_DeleteFKs;
    procedure rc_DefaultTitleForm;
  end;

implementation

{$R *.dfm}

uses Main, MainModule,

  uconsts,
  mkm_func_web, ServerModule, untdm_rc, untFrmLookUp_Lite, //UExportExcel,
  mkm_layout, mkm_validate, mkm_translate, mkm_dbfuncs, mkm_dbcombobox;

procedure TfrmBaseCRUD.dbgSearchCRUDCellClick(Column: TUniDBGridColumn);
var
   cTemp : string;
begin
  inherited;
  cTemp := Column.FieldName;

  if cTemp.ToLower = 'rcaction_new' then
     btnNewRegClick( btnNewReg )
  else
  if cTemp.ToLower = 'rcaction_edit' then
     btnEditRegClick( btnEditReg )
  else
  if cTemp.ToLower = 'rcaction_delete' then
     btnDeleteRegClick( btnDeleteReg )
  else
  if cTemp.ToLower = 'rcaction_options' then
  begin
     if dm_rc.rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;

     popMenuOptions.Popup( mx - 165 , my, dbgSearchCRUD );
  end;
end;

procedure TfrmBaseCRUD.dbgSearchCRUDColumnSort(Column: TUniDBGridColumn;
  Direction: Boolean);
begin
  inherited;
  dm_rc.rc_GridSortColumn( TUniDBGrid( Column.Grid ), Column.FieldName, Direction );
end;

procedure TfrmBaseCRUD.dbgSearchCRUDDblClick(Sender: TObject);
begin
  inherited;

  ed_Table_Status.Text := '';
  ed_Table_Status_OLD.Text := '';
  // v. 3.2.0.5
  if not dsSearchMaster.DataSet.IsEmpty then
  begin
     // v. 3.3.1.0( future feature )
     iCurrentRec := dbgSearchCRUD.DataSource.DataSet.RecNo;

     pgBaseCadControl.ActivePage := tabRegister;

     if Self.FindComponent('pgComplementData' ) <> nil then
        if TUniPageControl( Self.FindComponent('pgComplementData' ) ).Pages[0].TabVisible then
           TUniPageControl( Self.FindComponent('pgComplementData' ) ).ActivePageIndex := 0;

     sqlMaster.Cancel;
     sqlMaster.close;

     if DataTypeIsNumber( dsSearchMaster.DataSet.FieldByName( Self.ed_PK.Text ).DataType ) then
        sqlMaster.ParamByName( 'table_pk' ).AsInteger  := StrToIntDef( dsSearchMaster.DataSet.FieldByName( Self.ed_PK.Text ).AsString , 0 )
     else
     if DataTypeIsString( dsSearchMaster.DataSet.FieldByName( Self.ed_PK.Text ).DataType ) then
        sqlMaster.ParamByName( 'table_pk' ).AsString   := dsSearchMaster.DataSet.FieldByName( Self.ed_PK.Text ).AsString
     else
     if DataTypeIsDateTime( dsSearchMaster.DataSet.FieldByName( Self.ed_PK.Text ).DataType ) then
        sqlMaster.ParamByName( 'table_pk' ).AsDateTime := dsSearchMaster.DataSet.FieldByName( Self.ed_PK.Text ).AsDateTime;

     dm_rc.rc_OpenQuery( sqlMaster );

     // atualizar todos os LOOKUPs dinamicamente
     dm_rc.rc_LookUpUpdateData(  self  );
  end;
end;

procedure TfrmBaseCRUD.dbgSearchCRUDDrawColumnCell(Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  inherited;
  dm_rc.rc_GridDrawCell( dbgSearchCRUD , ACol, ARow, Column, Attribs ) ;
end;

procedure TfrmBaseCRUD.dbgSearchCRUDMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  mX := x;
  mY := y;
end;
// v. 3.2.0.0
procedure TfrmBaseCRUD.dsMasterDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  rc_UpdateDBComboBox( self, true );
end;

procedure TfrmBaseCRUD.dsMasterStateChange(Sender: TObject);
begin
  inherited;
  if TDataSource( sender ).State in [ dsInsert, dsEdit, dsBrowse ] then
     rc_DSReactiveCheck( self , TDataSource( sender ) ); // v. 3.3.0.0
  // caso utilize algum 'componente BS_COMPONENTS DBWARE' utilize as instruções abaixo
  // no evento "dsMasterStateChange" do respectivo DATASOURCE para renderização correta de CRUDS
  if ( dsMaster.State <> dsInactive ) then
      dm_rc.rc_BootStrapRender( self, True );

  rc_DefaultTitleForm; // v. 3.2.0.0

  // a IDEIA é manter ed_Table_Status / ed_Table_Status_OLD com o ULTIMO ESTADO operacional
  // pra poder CRITICAR alguma operacao PÓS GRAVAÇÃO no FORM( FRAME ) herdado
  // como por exemplo, a geracao do plano de contas apos cadastrar uma EMPRESA
  if dsMaster.State in [ dsEdit ] then
  begin
     labState.Caption      := mm.LAB_STATE_E;
     ed_Table_Status.Text := 'E';

     // v. 3.2.0.0
     if ( sqlSearchMaster.Active ) and ( Pos( ' [ID:', labTitleForm.Caption ) = 0 ) and ( Pos( 'caption-id', labTitleForm.Hint ) > 0 ) then
         labTitleForm.Caption := labTitleForm.Caption + ' [ID:' + sqlSearchMaster.FieldByName( ed_PK.Text ).AsString + ']';

  end
  else
  if dsMaster.State in [ dsInsert ] then
  begin
     labState.Caption      := mm.LAB_STATE_I;
     ed_Table_Status.Text := 'I';
  end
  else
  begin
     if sqlSearchMaster.Active then
     begin
         // v. 3.2.0.0
         iCurrentPage := dbgSearchCRUD.DataSource.DataSet.RecNo div dbgSearchCRUD.WebOptions.PageSize + 1;
         // v. 3.2.0.5
         labState.Caption      := mm.LAB_STATE_B;
         // v. 3.2.0.0
         if ( Pos( 'caption-id', labTitleForm.Hint ) > 0 ) and ( Pos( '[ID:', labTitleForm.Caption ) = 0 ) then
            labTitleForm.Caption := labTitleForm.Caption + ' [ID:' + sqlSearchMaster.FieldByName( ed_PK.Text ).AsString + ']';
     end;

     ed_Table_Status.Text := 'P';
  end;

  if dsMaster.State in [ dsInsert, dsEdit ] then
  begin
     // v. 3.2.0.0
     iCurrentPage := dbgSearchCRUD.DataSource.DataSet.RecNo div dbgSearchCRUD.WebOptions.PageSize + 1;

     ed_OldPKValue.Text := '';
     ed_Table_Status_OLD.Text := '';
  end;

  // isso é feito para q os panels q contem os botoes nao troquem de ordem
  // ao ficarem visiveis
  paOF.Visible      := false;
  paGC.Visible      := false;
  paNAE.Visible     := false;
  paP.Visible       := false;
  paP.Visible       := not ( dsMaster.State in [ dsEdit, dsInsert ] );
  paNAE.Visible     := paP.Visible;
  paGC.Visible      := not paP.Visible;
  btnOptions.Visible := ( popMenuOptions.Items.Count > 0 );
  paOF.Visible      := paP.Visible;

  //if bActions then
  begin
     labNew.Visible     := ( paNAE.Visible ) and ( bActions or bModelCrud1 );
     labEdit.Visible    := ( labNew.Visible ) and ( bModelCrud1 );
     labDelete.Visible  := ( labNew.Visible ) and ( bModelCrud1 );
     labOptions.Visible := ( labNew.Visible ) and ( bModelCrud1 );
     labCancel.Visible  := not labNew.Visible;
     labSave.Visible    := not labNew.Visible;
     dm_rc.rc_ObjectEnabled( Self, btnQuickSearch, labNew.Visible );
     edQuickSearch.Enabled := labNew.Visible;
  end;

  // v. 3.4.1.0 - paginator
  labPagePrior.Enabled   := paNAE.Visible;
  labPageFirst.Enabled   := paNAE.Visible;
  labPageNext.Enabled    := paNAE.Visible;
  labPageLast.Enabled    := paNAE.Visible;
  labPageRefresh.Enabled := paNAE.Visible;
  edPageNumber.Enabled   := paNAE.Visible;
  labPagePrior.font.Color := varIIF( labPagePrior.Enabled, clBlack, clSilver );
  labPageFirst.font.Color := varIIF( labPageFirst.Enabled, clBlack, clSilver );
  labPageNext.font.Color := varIIF( labPageNext.Enabled, clBlack, clSilver );
  labPageLast.font.Color := varIIF( labPageLast.Enabled, clBlack, clSilver );
  labPageRefresh.font.Color := varIIF( labPageRefresh.Enabled, clBlack, clSilver );

  labExit.Enabled   := paOF.Visible;
  labExit.font.Color := varIIF( labExit.Enabled, clBlack, clSilver );
  labState.Visible   := not mm.varB_Mobile_Screen_Portrait ;

  // para manter em cadastro
  if tabSearch.Visible <> paP.Visible then
     tabSearch.Visible := paP.Visible;

  //adjust edit masks
  dm_rc.rc_ApplyEditMasks( Self );
end;

procedure TfrmBaseCRUD.dsSearchMasterStateChange(Sender: TObject);
begin
  inherited;
  if TDataSource( sender ).State in [ dsInsert, dsEdit, dsBrowse ] then
     rc_DSReactiveCheck( self , TDataSource( sender ) ); // v. 3.3.0.0
end;

procedure TfrmBaseCRUD.Excel1Click(Sender: TObject);
begin
  inherited;
  dm_rc.rc_DBGridExport( dbgExport, etExcel );
end;

procedure TfrmBaseCRUD.Excel2Click(Sender: TObject);
begin
  inherited;
  dm_rc.rc_DBGridExport( dbgExport, etHTML );
end;

procedure TfrmBaseCRUD.FDSchemaAdapter1AfterApplyUpdate(Sender: TObject);
begin
  inherited;

  sqlMaster.CommitUpdates;

end;

procedure TfrmBaseCRUD.labOptionsClick(Sender: TObject);
begin
  inherited;
  if dm_rc.rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;

  popMenuOptions.PopupBy( TUniButton( sender ) );
end;
// v. 3.4.1.0 - paginator
procedure TfrmBaseCRUD.labPageFirstClick(Sender: TObject);
var
   iCurrPage : integer;
begin
  inherited;

  iCurrPage := 1;

  labPageCurrPage.Caption := //'[ ' +
                             //iCurrPage.ToString +
                             ' - ' +
                             IntToStr( ( dbgSearchCRUD.DataSource.DataSet.RecordCount - 1 ) div dbgSearchCRUD.WebOptions.PageSize + 1 )  ;
                             //' ]' ;
  edPageNumber.Text := iCurrPage.ToString;
  UniSession.AddJS( dbgSearchCRUD.JSName+'.store.loadPage(' + iCurrPage.ToString + ');');
end;
// v. 3.4.1.0 - paginator
procedure TfrmBaseCRUD.labPageLastClick(Sender: TObject);
var
   iTotalPages,
   iCurrPage : integer;
begin
  inherited;

  iTotalPages := ( dbgSearchCRUD.DataSource.DataSet.RecordCount - 1 ) div dbgSearchCRUD.WebOptions.PageSize + 1;
  iCurrPage   := iTotalPages;

  labPageCurrPage.Caption := //'[ ' +
                             //iCurrPage.ToString +
                             ' - ' +
                             iTotalPages.ToString  ;
                             //'] ' ;
  edPageNumber.Text := iCurrPage.ToString;
  UniSession.AddJS( dbgSearchCRUD.JSName+'.store.loadPage(' + iCurrPage.ToString + ');');
end;
// v. 3.4.1.0 - paginator
procedure TfrmBaseCRUD.labPageNextClick(Sender: TObject);
var
   iTotalPages,
   iCurrPage : integer;
begin
  inherited;

  iCurrPage := dbgSearchCRUD.DataSource.DataSet.RecNo div dbgSearchCRUD.WebOptions.PageSize + 1;
  iTotalPages := ( dbgSearchCRUD.DataSource.DataSet.RecordCount - 1 ) div dbgSearchCRUD.WebOptions.PageSize + 1;
  if iCurrPage < iTotalPages then
     Inc( iCurrPage )
  else
      iCurrPage := iTotalPages;

  edPageNumber.Text := iCurrPage.ToString;
  labPageCurrPage.Caption := //'[ ' +
                             //iCurrPage.ToString +
                             ' - ' +
                             iTotalPages.ToString  ;
                             //' ]' ;

  UniSession.AddJS( dbgSearchCRUD.JSName+'.store.loadPage(' + iCurrPage.ToString + ');');
end;
// v. 3.4.1.0 - paginator
procedure TfrmBaseCRUD.labPagePriorClick(Sender: TObject);
var
   iCurrPage : integer;
begin
  inherited;

  iCurrPage := dbgSearchCRUD.DataSource.DataSet.RecNo div dbgSearchCRUD.WebOptions.PageSize + 1;
  if iCurrPage > 1 then
     Dec( iCurrPage );

  edPageNumber.Text := iCurrPage.ToString;
  labPageCurrPage.Caption := //'[ ' +
                             //iCurrPage.ToString +
                             ' - ' +
                             IntToStr( ( dbgSearchCRUD.DataSource.DataSet.RecordCount - 1 ) div dbgSearchCRUD.WebOptions.PageSize + 1 )  ;
                             //' ]' ;
  UniSession.AddJS( dbgSearchCRUD.JSName+'.store.loadPage(' + iCurrPage.ToString + ');');
end;
// v. 3.4.1.0 - paginator
procedure TfrmBaseCRUD.labPageRefreshClick(Sender: TObject);
begin
  inherited;
  btnSearchCRUDClick( btnSearchCRUD );
end;
// v. 3.4.1.0 - paginator
procedure TfrmBaseCRUD.edPageNumberKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
   iTotalPages,
   iGoPage,
   iCurrPage : integer;
begin
  inherited;

  if Key = 13 then
  begin
     iCurrPage := dbgSearchCRUD.DataSource.DataSet.RecNo div dbgSearchCRUD.WebOptions.PageSize + 1;
     iTotalPages := ( dbgSearchCRUD.DataSource.DataSet.RecordCount - 1 ) div dbgSearchCRUD.WebOptions.PageSize + 1;

     iGoPage := StrToIntDef( edPageNumber.Text, 1 );

     if ( iGoPage > 0 ) and ( iGoPage <= iTotalPages ) then
        iCurrPage := iGoPage;

     edPageNumber.Text := iCurrPage.ToString;
     labPageCurrPage.Caption := //'[ ' +
                                //iCurrPage.ToString +
                                ' - ' +
                                iTotalPages.ToString  ;
                                //' ]' ;

     UniSession.AddJS( dbgSearchCRUD.JSName+'.store.loadPage(' + iCurrPage.ToString + ');');
  end;
end;

procedure TfrmBaseCRUD.Xml1Click(Sender: TObject);
begin
  inherited;
  dm_rc.rc_DBGridExport( dbgExport, etXML );
end;

procedure TfrmBaseCRUD.Csv1Click(Sender: TObject);
begin
  inherited;
  dm_rc.rc_DBGridExport( dbgExport, etCSV );
end;

procedure TfrmBaseCRUD.pgBaseCadControlChangeValue(Sender: TObject);
begin
  inherited;
  if dm_rc.rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;
end;

procedure TfrmBaseCRUD.btnCloseFormClick(Sender: TObject);
begin

  inherited;
  if dm_rc.rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;

  ed_Table_Status.Text := '';

  ed_Table_Status_OLD.Text := '';

  if pgBaseCadControl.ActivePage = tabRegister then
  begin
     pgBaseCadControl.ActivePage := tabSearch;

     // EXIBIÇÃO / EDIÇÃO DINÂMICA DE REGISTRO  /   DISPLAY / DYNAMIC REGISTRATION EDITION
     //( Requested by GUS from Italy )
     //
     // este trecho de código está relacionado com a abertura/edição dinâmica de formulários/frames
     // this code snippet is related to opening / editing dynamics of forms / frames
     //
     // Ex: MainForm.rc_AddFormFrameInTab( nil, '', 'clientes', '' , false, false, 569, true );
     //
     // Assumi como padrão que o primeiro campo de pesquisa definido deverá ser o campo usado para efetuar a pesquisa dinâmica, ou seja,
     // se vamos pesquisar pelo CODIGO DO CLIENTE( por exemplo ) deve existir uma opção de pesquisa pelo CODIGO DO CLIENTE no ON CREATE do CADASTRO DE CLIENTES.
     //
     // I assumed ( by default ) that the first defined search field should be the field used to perform the dynamic search, that is,
     // if we are going to search for the CUSTOMER CODE (for example) there must be an option to search for the CUSTOMER CODE in the ON CREATE of the CUSTOMER REGISTRATION.
     //
     if ( ed_CodMaster.Tag = 0 ) or ( StrToIntDef( ed_CodMaster.Hint, 0 ) > 0 ) then
     begin
           // v. 3.2.0.0
           //btnSearchCRUDClick( self );
           if iCurrentPage <> -1 then
              UniSession.AddJS( dbgSearchCRUD.JSName+'.store.loadPage(' + iCurrentPage.ToString + ');')
           else
              btnSearchCRUDClick( self );
     end;
     rc_DefaultTitleForm; // v. 3.2.0.0
  end
  else
  begin
     if mm.oPgGeneral <> nil then
        mm.oPgGeneral.ActivePage.Close;
  end;
end;

procedure TfrmBaseCRUD.btnDeleteRegClick(Sender: TObject);
begin
  inherited;

  if dm_rc.rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;

  // verifica licenca de uso
  if mm.varC_Locked = 'S' then
  begin
       dm_rc.rc_ShowSweetAlert( mm.MSG_INFO, mm.MSG_APP_LOCKED, 'warning' ); // v. 3.3.1.0
       Abort;
  end;

  // verifica restricao do usuário - EXCLUSAO
  If not dm_rc.rc_PermissionVerify( ed_FormOrigin_Tab.Text ,
                                    Trim( ed_Table_ItemSel.Text ) ,
                                    PT_DELETE ) then
  begin
     Abort;
  end;

  // cancela a alteracao pra poder EXCLUIR
  // ( aproveitar informacoes q estao na tela pra fazer alguma critica )
  sqlMaster.Cancel;

  ed_Table_Status_OLD.Text := '';
  ed_Table_Status.Text := '';

  ed_OldPKValue.Text := dsSearchMaster.DataSet.FieldByName( Self.ed_PK.Text ).AsString;

  mm.varB_OperationProcessed := False;
  // v. 3.2.0.5
  if not dsSearchMaster.DataSet.IsEmpty then
  begin
       mm.varC_LastErrorMsg := dm_rc.rc_HasCodeRegistered( ed_Table_ItemSel.Text, dsSearchMaster.DataSet.FieldByName( Self.ed_PK.Text ).AsString );

       if mm.varC_LastErrorMsg <> '' then
       begin
         mm.varC_SQLERROR := '';

         dm_rc.rc_ShowMessage( format( mm.MSG_BUGERROR_REGISTER_CAN_NOT_DELETE, [ ed_Table_ItemSel.Text, dbgSearchCRUD.Tag.ToString ] ) );

         mm.varB_OperationProcessed := False;
         Abort;
       end;

       // ajuste para confirmação via SWEETALERT
       mm.varB_Yes := False;                                                                                        //   +--> 1 indica TEM registro
                                                                                                                     //  |
       mm.varB_OperationProcessed := dm_rc.rc_DeleteActiveRecord( ed_Table_ItemSel.Text, sqlMaster, sqlSearchMaster , 1 );

       if mm.varB_OperationProcessed then
          pgBaseCadControl.ActivePage := tabSearch;
  end;
end;

procedure TfrmBaseCRUD.btnEditRegClick(Sender: TObject);
begin
  inherited;
  if dm_rc.rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;

  // verifica licenca de uso
  if mm.varC_Locked = 'S' then
  begin
       dm_rc.rc_ShowSweetAlert( mm.MSG_INFO, mm.MSG_APP_LOCKED, 'warning' ); // v. 3.3.1.0
       Abort;
  end;

  // verifica restricao do usuário - ALTERACAO
  If not dm_rc.rc_PermissionVerify( ed_FormOrigin_Tab.Text ,
                                    Trim( ed_Table_ItemSel.Text ) ,
                                    PT_EDIT ) then
  begin
     Abort;
  end;

  ed_Table_Status.Text := '';
  ed_Table_Status_OLD.Text := '';
  // v. 3.2.0.5
  if not dsSearchMaster.DataSet.IsEmpty then
  begin
     if not bSaveMasterPK then
     begin
        pgBaseCadControl.ActivePage := tabRegister;

        if Self.FindComponent('pgComplementData' ) <> nil then
           if TUniPageControl( Self.FindComponent('pgComplementData' ) ).Pages[0].TabVisible then
              TUniPageControl( Self.FindComponent('pgComplementData' ) ).ActivePageIndex := 0;

        sqlMaster.Cancel;
        sqlMaster.close;

        if DataTypeIsNumber( dsSearchMaster.DataSet.FieldByName( Self.ed_PK.Text ).DataType ) then
           sqlMaster.ParamByName( 'table_pk' ).AsInteger  := StrToIntDef( dsSearchMaster.DataSet.FieldByName( Self.ed_PK.Text ).AsString , 0 )
        else
        if DataTypeIsString( dsSearchMaster.DataSet.FieldByName( Self.ed_PK.Text ).DataType ) then
           sqlMaster.ParamByName( 'table_pk' ).AsString   := dsSearchMaster.DataSet.FieldByName( Self.ed_PK.Text ).AsString
        else
        if DataTypeIsDateTime( dsSearchMaster.DataSet.FieldByName( Self.ed_PK.Text ).DataType ) then
           sqlMaster.ParamByName( 'table_pk' ).AsDateTime := dsSearchMaster.DataSet.FieldByName( Self.ed_PK.Text ).AsDateTime;

        dm_rc.rc_OpenQuery( sqlMaster );
     end;

     sqlMaster.Edit;

     // atualizar todos os LOOKUPs dinamicamente
     dm_rc.rc_LookUpUpdateData(  self  );
  end;
end;

procedure TfrmBaseCRUD.btnNewRegClick(Sender: TObject);
var
   i : integer;
begin
  inherited;
  if dm_rc.rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;

  // verifica licenca de uso
  if mm.varC_Locked = 'S' then
  begin
       dm_rc.rc_ShowSweetAlert( mm.MSG_INFO, mm.MSG_APP_LOCKED, 'warning' ); // v. 3.3.1.0
       Abort;
  end;

  // verifica restricao do usuário - CADASTRO
  If not dm_rc.rc_PermissionVerify( ed_FormOrigin_Tab.Text ,
                                    Trim( ed_Table_ItemSel.Text ) ,
                                    PT_INSERT ) then
  begin
     Abort;
  end;

  ed_Table_Status.Text := '';
  ed_Table_Status_OLD.Text := '';

  pgBaseCadControl.ActivePage := tabRegister;

  if Self.FindComponent('pgComplementData' ) <> nil then
     if TUniPageControl( Self.FindComponent('pgComplementData' ) ).Pages[0].TabVisible then
        TUniPageControl( Self.FindComponent('pgComplementData' ) ).ActivePageIndex := 0;

  sqlMaster.Cancel;
  sqlMaster.Close;

  // apenas pra dar o select dos campos
  // se sua PK é 'INTEGER' ou STRING
  // TFDParam.size := length(string);
  try
     if DataTypeIsNumber( dsSearchMaster.DataSet.FieldByName( Self.ed_PK.Text ).DataType ) then
        sqlMaster.ParamByName( 'table_pk' ).AsInteger  :=-123456789
     else
     if DataTypeIsString( dsSearchMaster.DataSet.FieldByName( Self.ed_PK.Text ).DataType ) then
     begin
        sqlMaster.ParamByName( 'table_pk' ).AsString   := '-9';
     end
     else
     if DataTypeIsDateTime( dsSearchMaster.DataSet.FieldByName( Self.ed_PK.Text ).DataType ) then
        sqlMaster.ParamByName( 'table_pk' ).AsDateTime := StrToDate('01/01/1900');
  // v. 3.3.1.0
  except on e:exception do
         begin
              dm_rc.rc_ShowError( 'Fail on sqlMaster.ParamByName( ''table_pk'' )' + '<br><br>' + e.Message + '<br><br>' +
                                  'If your SQL sentence has an ALIAS on [[pk]] it must have [[allpks]] statement.' );
              Abort;
         end;
  end;

  dm_rc.rc_OpenQuery( sqlMaster );

  // inicializar possíveis "bsRgp"
  dm_rc.rc_RgpInitialize( self );

  // o append percorre todos registros ate o ultimo
  sqlMaster.Insert;

  // atualizar todos os LOOKUPs dinamicamente
  dm_rc.rc_LookUpUpdateData(  self  );

  // controle pra salvar PK( mestre x detalhe )
  bSaveMasterPK := ( ed_GenNextID_OnNew.Text = 'true' );

  // v. 3.3.0.3
  // se sua PK é INTEGER , STRING ou DATE e/ou AUTOINC ou a PK não deve ser sequencializada
  // if your PK is INTEGER , STRING or DATE and/or AUTOINC or the PK must not be sequential
  if ( sqlMaster.FieldByName( Self.ed_PK.Text ).DataType <> ftAutoInc ) and
     ( not AnsiMatchStr( lowercase( ed_Table_ItemSel.Text ) , ARRAY_PK_NO_INC ) ) then
  begin
     if ed_GenNextID_OnNew.Text = 'false' then
     begin
        i := -1;

        if DataTypeIsDateTime( sqlMaster.FieldByName( Self.ed_PK.Text ).DataType ) then
           sqlMaster.FieldByName( Self.ed_PK.Text ).AsDateTime := now
        else
        if DataTypeIsNumber( sqlMaster.FieldByName( Self.ed_PK.Text ).DataType ) then
           sqlMaster.FieldByName( Self.ed_PK.Text ).AsInteger := i
        else
           sqlMaster.FieldByName( Self.ed_PK.Text ).AsString := i.ToString;
     end
     else
     begin
        i := dm_rc.rc_GetNextID( mm.varB_Use_FireDac , ed_Table_ItemSel.Text , Self.ed_PK.Text , '' );

        if DataTypeIsDateTime( sqlMaster.FieldByName( Self.ed_PK.Text ).DataType ) then
           sqlMaster.FieldByName( Self.ed_PK.Text ).AsDateTime := now
        else
        if DataTypeIsNumber( sqlMaster.FieldByName( Self.ed_PK.Text ).DataType ) then
           sqlMaster.FieldByName( Self.ed_PK.Text ).AsInteger := i
        else
           sqlMaster.FieldByName( Self.ed_PK.Text ).AsString := i.ToString;
     end;
  end;
end;

procedure TfrmBaseCRUD.btnOptionsClick(Sender: TObject);
begin
  inherited;

  if dm_rc.rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;

  popMenuOptions.PopupBy( TUniButton( sender ) );
end;

procedure TfrmBaseCRUD.btnQuickSearchClick(Sender: TObject);
var
   i, f : integer;
   cWhere, cFilter,
   cAlias, cField : string;
begin
  inherited;

  pgBaseCadControl.ActivePage := tabSearch;

  cbxSearchCRUDField1_Fields.ItemIndex    := cbxSearchCRUDField1.ItemIndex;
  cbxSearchCRUDField2_Fields.ItemIndex    := cbxSearchCRUDField2.ItemIndex;
  cbxSearchCRUDFieldDate_Fields.ItemIndex := cbxSearchCRUDFieldDate.ItemIndex;

  cFilters := '';
  cWhere   := '';

  if edQuickSearch.Text <> '' then
  begin
     for f := 0 to cbxSearchCRUDField1.Items.Count-1 do
     begin
        cFilter  := '';
        cField := cbxSearchCRUDField1_Fields.Items[ f ];
        cAlias := dm_rc.rc_ExtractFieldNameFromSearchItem( cField, true );
        cField := dm_rc.rc_ExtractFieldNameFromSearchItem( cField );

        if cField <> '' then
        begin
          i := sqlSearchMaster.FieldByName( cAlias ).Index;

          if cFilters = '' then
             cWhere := ''
          else
             cWhere := ' or ';

          if ( DataTypeIsNumber( sqlSearchMaster.Fields[ i ].DataType ) ) and
             ( strtointdef( edQuickSearch.Text, -999999 ) <> -999999  ) then
             cFilter := cWhere + ' ( ' + cField + '=' + edQuickSearch.Text + ' )'
          else
          if ( DataTypeIsDateTime( sqlSearchMaster.Fields[ i ].DataType ) ) and
             ( StrToDateDef( edQuickSearch.Text, -999999 ) <> -999999  ) then
             cFilter := cWhere + ' ( ' + cField + '=' + QuotedStr( FormatDateTime( mm.APP_SQL_DATE_FORMAT, StrToDateTime( edQuickSearch.Text ) ) ) + ' )'
          else
          if ( DataTypeIsString( sqlSearchMaster.Fields[ i ].DataType ) ) then
             cFilter := cWhere + ' ( ' + cField + ' like ' + QuotedStr( '%' + edQuickSearch.Text + '%' ) + ' )';

          if cFilter <> '' then
             cFilters := cFilters + cFilter;
        end;
     end;
  end;

  edSearchCRUD1.Text := edQuickSearch.Text;
  btnSearchCRUDClick( btnSearchCRUD );

  cFilters := '';
end;

procedure TfrmBaseCRUD.btnSaveRegClick(Sender: TObject);
var
   i : integer;
begin
  inherited;

  if dm_rc.rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;

  if not rc_FormValidate( Self ) then
     Abort;

  // verifica licenca de uso
  if mm.varC_Locked = 'S' then
  begin
       dm_rc.rc_ShowSweetAlert( mm.MSG_INFO, mm.MSG_APP_LOCKED, 'warning' ); // v. 3.3.1.0
       Abort;
  end;
  // v. 3.3.0.3 - bugfix
  // se sua PK é INTEGER , STRING ou DATE e/ou AUTOINC ou a PK não deve ser sequencializada
  // if your PK is INTEGER , STRING or DATE and/or AUTOINC or the PK must not be sequential
  if ( sqlMaster.FieldByName( Self.ed_PK.Text ).DataType <> ftAutoInc ) and
     ( not AnsiMatchStr( lowercase( ed_Table_ItemSel.Text ) , ARRAY_PK_NO_INC ) ) then
  begin
     if sqlMaster.FieldByName( Self.ed_PK.Text ).AsString = '-1' then
     begin
           i := dm_rc.rc_GetNextID( mm.varB_Use_FireDac , ed_Table_ItemSel.Text , Self.ed_PK.Text , '' );

           if i = 0 then
           begin
                dm_rc.rc_ShowMessage( mm.MSG_BUGERROR_PK_SEQUENCE );
                Abort;
           end;

           mm.varC_Code_ID := i.ToString;

          if DataTypeIsNumber( sqlMaster.FieldByName( Self.ed_PK.Text ).DataType ) then
             sqlMaster.FieldByName( Self.ed_PK.Text ).AsInteger := i
          else
             // Aqui vc pode adicionar ZEROS a esquerda...Config. em uConst  mas fora de ARRAY_PK_NO_ZERO( tab. q nao terao ZEROS )
             if not AnsiMatchStr( ed_Table_ItemSel.Text , ARRAY_PK_NO_ZERO ) then
                sqlMaster.FieldByName( Self.ed_PK.Text ).AsString := varIIF( TABLE_PK_WITH_LEFT_ZEROS = 0, I.ToString, Zeros( I.ToString, sqlMaster.FieldByName( Self.ed_PK.Text ).Size ) )
             else
                sqlMaster.FieldByName( Self.ed_PK.Text ).AsString := I.ToString;
     end;
  end;

  if ( dsMaster.State in [ dsEdit ] ) then
  begin
       if sqlMaster.FieldList.IndexOf ( 'date_update' ) >= 0 then
          sqlMaster.FieldByName('date_update').AsDateTime := now;

       ed_Table_Status_OLD.Text := 'E';
  end
  else
  if ( dsMaster.State in [ dsInsert ] ) then
  begin
       ed_Table_Status_OLD.Text := 'I';

       // as TABELAS do RADCORE podem ser MULTIEMPRESAS, nesse caso,
       // por padrão utilizo o CAMPO: CODIEMP( CODICOMPANY ) em todas que precisam
       //
       // se a tabela tem CODIEMP, vincula...
       //
       // O Campo DATA_ALT vai servir pra uma possível SINCRONIZAÇAO DE DADOS COM MOBILE...
       //
       // Já os campos DATA_ACESSO e HORA ACESSO para controle de LOG de usuario por exemplo...
       //
       // se a tabela tem CODIEMP, DATA_ALT.etc.. vincula...
       //
       if sqlMaster.FieldList.IndexOf ( 'codiemp' ) >= 0 then
          sqlMaster.FieldByName('codiemp').AsInteger := mm.varI_Code_Company;   // codicompany

       if sqlMaster.FieldList.IndexOf ( 'date_update' ) >= 0 then               // date_change
          sqlMaster.FieldByName('date_update').AsDateTime := now;

       if sqlMaster.FieldList.IndexOf ( 'date_access' ) >= 0 then               // date_access
          sqlMaster.FieldByName('date_access').AsDateTime := date;

       if sqlMaster.FieldList.IndexOf ( 'hour_access' ) >= 0 then               // hour_access
          sqlMaster.FieldByName('hour_access').AsDateTime := time;
  end;

  //REMOVER AS MÁSCARAS APENAS de campos que TEM MÁSCARA DEFINIDA...
  for I := 0 to Self.ComponentCount - 1 do
  begin
    if Self.Components[I] is TUniDBEdit then
    begin
         // v. 3.1.0.61
         if TUniDBEdit( Self.Components[I] ).DataSource <> nil then
            if ( TUniDBEdit( Self.Components[I] ).tag = 9999 ) and
               ( TUniDBEdit( Self.Components[I] ).DataSource.State in [ dsEdit, dsInsert ] ) then
               TFDQuery( TUniDBEdit( Self.Components[I] ).DataSource.DataSet ).FieldByName( TUniDBEdit( Self.Components[I] ).DataField ).AsString := StrTokenClear( TUniDBEdit( Self.Components[I] ).Text );
    end ;
  end;

  rc_UpdateDBComboBox( self, false );

  sqlMaster.Post;

  //mm.SQLConn.StartTransaction;
//  if FDSchemaAdapter1.ChangeCount > 0 then
//  begin
//    mm.varI_ApplyUpdateErrors := FDSchemaAdapter1.ApplyUpdates(-1);
//  end;
  mm.varI_ApplyUpdateErrors := sqlMaster.ApplyUpdates(-1);
  if mm.varI_ApplyUpdateErrors > 0 then
  begin
    // mm.SQLConn.Rollback;
     dm_rc.rc_ApplyUpdatesError( sqlMaster, mm.varI_ApplyUpdateErrors, mm.MSG_BUGERROR_POST );
  end
  else
  begin
     sqlMaster.CommitUpdates;
     //mm.SQLConn.Commit;
  end;

  if not bSaveMasterPK then
  begin
     dm_rc.rc_ShowToaster( 'success' , mm.MSG_SUCCESS_POST ,false , 'slideLeftRightFade' );

     sqlSearchMaster.Close;

     dm_rc.rc_OpenQuery( sqlSearchMaster );

     // para manter cadastrando...
     // não tem como fazermos isso aqui, pois, o código do botão SALVAR é herdado no seu formulário para poder
     // executar processos específicos após o usuário clicar em SALVAR( veja o exemplo no "frmCadUsuarios" )
     // então, para conseguir esse recurso, será necessário adicionar um código no final do evento do "btnSaveReg" do
     // seu respectivo form herdado de "frmBaseCRUD"
     //
     // to keep registering ...
     // there is no way we can do that here, because the SAVE button code is inherited in your form to be able to
     // execute specific processes after the user clicks SAVE (see the example in "frmCadUsuarios")
     // so, to get this feature, you will need to add a code at the end of the "btnSaveReg" event
     // its respective form inherited from "frmBaseCRUD"
     if ed_AskNewRec_AfterPost.Text = 'true' then
     begin
   //    dm_rc.rc_ShowYesNo( mm.MSG_CONTINUE_REGISTERING );
   //    if mm.varB_Yes then
   //       btnNewReg.Click
   //    else
   //       pgBaseCadControl.ActivePage := tabSearch;
     end
     else
     // v. 3.2.0.5
     begin
         pgBaseCadControl.ActivePage := tabSearch;

         if Pos( 'add;', ed_Table_ItemSel.Hint ) > 0 then
            btnCloseFormClick( self ) ;
     end;
     // v. 3.3.1.0( future feature )
     //dbgSearchCRUD.DataSource.DataSet.RecNo := iCurrentRec;
  end;
end;
// v. 3.4.1.0 - paginator
procedure TfrmBaseCRUD.btnSearchClick(Sender: TObject);
begin
  inherited;
  if dm_rc.rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;

  if not ( dsMaster.State in [dsEdit, dsInsert ] ) then
  begin

     tabSearch.Visible := ( btnNewReg.Enabled) and ( not bModelCrud1 );
     pgBaseCadControl.ActivePage := tabSearch;

     if mm.varB_Mobile_Screen_Portrait then
        paSearchFilters.Width := varIIF( paSearchFilters.width = 0, dbgSearchCRUD.Width, 0 )
     else
        paSearchFilters.Width := varIIF( paSearchFilters.width = 0, 266, 0 );

     if paSearchFilters.Width > 0 then
        if ( StrToIntDef( ed_CodMaster.Hint, 0 ) > 0 ) then
        begin
            btnSearchCRUDClick( btnSearchCRUD );
        end;
  end;
end;
// v. 3.4.1.0 - paginator
procedure TfrmBaseCRUD.btnSearchCRUDClick(Sender: TObject);
var
  cFieldToSearch, cAliasToSearch,
  cFieldToSearch2,cAliasToSearch2,
  cQueryToSearch, cSql, cAndOr, cWhereAnd: String;
//  iCurrPage, i,
  iPosition: integer;
  iCurrPage: integer; // v. 3.4.1.0 - paginator
begin
  inherited;
  rc_DefaultTitleForm; // v. 3.2.0.0
  cbxSearchCRUDField1_Fields.ItemIndex    := cbxSearchCRUDField1.ItemIndex;
  cbxSearchCRUDField2_Fields.ItemIndex    := cbxSearchCRUDField2.ItemIndex;
  cbxSearchCRUDFieldDate_Fields.ItemIndex := cbxSearchCRUDFieldDate.ItemIndex;

  // SABER O TIPO DO CAMPO para criticar o tipo da OPERACAO
  // pode ser um ALIAS, entao tem que pegar a tabela equivalente
  // mas se for o alias padrão( TAB. ) pega a tabela ATUAL
  cFieldToSearch := AnsiLowerCase(cbxSearchCRUDField1_Fields.Text);

  if ( cFieldToSearch <> '' ) and ( trim(edSearchCRUD1.Text) <> '' ) then
  begin
     cAliasToSearch := dm_rc.rc_ExtractFieldNameFromSearchItem( cFieldToSearch, true );
     cFieldToSearch := dm_rc.rc_ExtractFieldNameFromSearchItem( cFieldToSearch );

     mm.varC_FieldType := '';

     // a query tem q ter sido carregada ao entrar na tela
     // v. 3.2.0.0
     if not sqlSearchMaster.active then
     begin
        if not dm_rc.rc_OpenQuery( sqlSearchMaster ) then
        begin
           sqlSearchMaster.close;
           Abort;
        end;
     end;

     iPosition := sqlSearchMaster.FieldByName( cAliasToSearch ).Index;

     if ( DataTypeIsNumber( sqlSearchMaster.Fields[ iPosition ].DataType ) ) or
        ( DataTypeIsDateTime( sqlSearchMaster.Fields[ iPosition ].DataType ) ) then
     begin
          if ( cbxSearchCRUDOpt1.ItemIndex >= 4 ) and ( cbxSearchCRUDOpt1.ItemIndex <= 6 ) and
             ( StrToIntDef( ReturnNumbers( edSearchCRUD1.Text ), 0 ) > 0  ) then
          begin
               cbxSearchCRUDOpt1.ItemIndex := 7; //IGUAL a
          end
          else
          if StrToIntDef( ReturnNumbers( edSearchCRUD1.Text ), 0 ) = 0 then
          begin
               dm_rc.rc_ShowMessage( mm.MSG_BUGERROR_CONTENT_MUST_BE_NUMERIC );
               Exit;
          end;
     end
     else
     if DataTypeIsString( sqlSearchMaster.Fields[ iPosition ].DataType ) then
     begin
          if cbxSearchCRUDOpt1.ItemIndex <= 3 then
          begin
               dm_rc.rc_ShowMessage( mm.MSG_BUGERROR_INVALID_SEARCH_OPERATOR );
               Exit;
          end;
     end
     else
     begin
          cbxSearchCRUDOpt1.ItemIndex := 7;
     end;
  end;

  cFieldToSearch2 := LowerCase(cbxSearchCRUDField2_Fields.Text);

  if ( cFieldToSearch2 <> '' ) and ( trim(edSearchCRUD2.Text) <> '' ) then
  begin
     cAliasToSearch2 := dm_rc.rc_ExtractFieldNameFromSearchItem( cFieldToSearch2, true );
     cFieldToSearch2 := dm_rc.rc_ExtractFieldNameFromSearchItem( cFieldToSearch2 );

     mm.varC_FieldType := '';

     iPosition := sqlSearchMaster.FieldByName( cAliasToSearch2 ).Index;

     if ( DataTypeIsNumber( sqlSearchMaster.Fields[ iPosition ].DataType ) ) or
        ( DataTypeIsDateTime( sqlSearchMaster.Fields[ iPosition ].DataType ) ) then
     begin
          if ( cbxSearchCRUDOpt2.ItemIndex >= 4 ) and ( cbxSearchCRUDOpt2.ItemIndex <= 6 ) and
             ( StrToIntDef( ReturnNumbers( edSearchCRUD2.Text ), 0 ) > 0  ) then
          begin
               cbxSearchCRUDOpt2.ItemIndex := 7; //IGUAL a
          end
          else
          if StrToIntDef( ReturnNumbers( edSearchCRUD2.Text ), 0 ) = 0 then
          begin
               dm_rc.rc_ShowMessage( mm.MSG_BUGERROR_CONTENT_MUST_BE_NUMERIC );
               Exit;
          end;
     end
     else
     if DataTypeIsString( sqlSearchMaster.Fields[ iPosition ].DataType ) then
     begin
          if cbxSearchCRUDOpt2.ItemIndex <= 3 then
          begin
               dm_rc.rc_ShowMessage( mm.MSG_BUGERROR_INVALID_SEARCH_OPERATOR );
               Exit;
          end;
     end
     else
     begin
          cbxSearchCRUDOpt2.ItemIndex := 7;
     end;
  end;

  cWhereAnd := '';

  if not cbxAndOr.Checked then
     cAndOr := ' OR '
  else
     cAndOr := ' AND ';

  if edSearchCRUD1.Text <> '' then
  begin
    case cbxSearchCRUDOpt1.ItemIndex of
      00 : cQueryToSearch := '((  ((' + cFieldToSearch + ' > ' + QuotedStr(edSearchCRUD1.Text) + ')) )) ';
      01 : cQueryToSearch := '((  ((' + cFieldToSearch + ' < ' + QuotedStr(edSearchCRUD1.Text) + ')) )) ';
      02 : cQueryToSearch := '((  ((' + cFieldToSearch + ' >= ' + QuotedStr(edSearchCRUD1.Text) + ')) )) ';
      03 : cQueryToSearch := '((  ((' + cFieldToSearch + ' <= ' + QuotedStr(edSearchCRUD1.Text) + ')) )) ';
      04 : cQueryToSearch := '((  ((' + cFieldToSearch + ' LIKE ' + QuotedStr(edSearchCRUD1.Text + '%') + ')) )) ';
      05 : cQueryToSearch := '((  ((' + cFieldToSearch + ' LIKE ' + QuotedStr('%' + edSearchCRUD1.Text) + ')) )) ';
      06 : cQueryToSearch := '((  ((' + cFieldToSearch + ' LIKE ' + QuotedStr('%' + edSearchCRUD1.Text + '%') + ')) )) ';
      07 : cQueryToSearch := '((  ((' + cFieldToSearch + ' = ' + QuotedStr(edSearchCRUD1.Text) + ')) )) ';
    end;

    if edSearchCRUD2.Text <> '' then
    begin
      case cbxSearchCRUDOpt2.ItemIndex of
        00 : cQueryToSearch := cQueryToSearch + cAndOr + ' (' + cFieldToSearch2 + '> ' + QuotedStr(edSearchCRUD2.Text) + ')';
        01 : cQueryToSearch := cQueryToSearch + cAndOr + ' (' + cFieldToSearch2 + ' < ' + QuotedStr(edSearchCRUD2.Text) + ')';
        02 : cQueryToSearch := cQueryToSearch + cAndOr + ' (' + cFieldToSearch2 + ' >= ' + QuotedStr(edSearchCRUD2.Text) + ')';
        03 : cQueryToSearch := cQueryToSearch + cAndOr + ' (' + cFieldToSearch2 + ' <= ' + QuotedStr(edSearchCRUD2.Text) + ')';
        04 : cQueryToSearch := cQueryToSearch + cAndOr + ' (' + cFieldToSearch2 + ' LIKE ' + QuotedStr(edSearchCRUD2.Text + '%') + ')';
        05 : cQueryToSearch := cQueryToSearch + cAndOr + ' (' + cFieldToSearch2 + ' LIKE ' + QuotedStr('%' + edSearchCRUD2.Text) + ')';
        06 : cQueryToSearch := cQueryToSearch + cAndOr + ' (' + cFieldToSearch2 + ' LIKE ' + QuotedStr('%' + edSearchCRUD2.Text + '%') + ')';
        07 : cQueryToSearch := cQueryToSearch + cAndOr + ' (' + cFieldToSearch2 + ' = ' + QuotedStr(edSearchCRUD2.Text) + ')';
      end;
    end;
  end;

  if cbxSearchCRUDFieldDate.Text <> '' then
  begin
       if cQueryToSearch <> '' then
          cQueryToSearch := cQueryToSearch +  ' AND ';

       cQueryToSearch := cQueryToSearch +  '( (' + cbxSearchCRUDFieldDate_Fields.Text + ' >= ' + QuotedStr( FormatDateTime( mm.APP_SQL_DATE_FORMAT, edSearchCRUDDtIni.DateTime ) ) + ')' +
                               '  AND (' + cbxSearchCRUDFieldDate_Fields.Text + ' <= ' + QuotedStr( FormatDateTime( mm.APP_SQL_DATE_FORMAT, edSearchCRUDDtEnd.DateTime ) ) + ') )';
  end;

  cSql := sqlSearchMaster.Sql.Text;

  iPosition := 0;
  iPosition   := Pos( ' where ' + '((  ((', lowerCase( cSql ) );

  if iPosition > 0 then
     cSql := Copy( cSql, 0, iPosition)
  else
  begin
     iPosition := 0;
     iPosition := Pos( ' order by   ' , lowerCase( cSql ) );

     if iPosition > 0 then
        cSql := Trim( Copy( cSql, 0, iPosition ) );
  end;

  cWhereAnd := ' WHERE ';

  // tem um WHERE no FORM que chamou ?
  if ed_Where_Search.Text <> '' then
  begin
     cSql := cSql + cWhereAnd + Trim( ed_Where_Search.Text ) ;
     cWhereAnd := ' AND ';
  end;

  if cQueryToSearch <> '' then
  begin
     cSql := cSql + cWhereAnd + cQueryToSearch;
     cWhereAnd := ' AND ';
  end;

  cSql := RemoveLineBreaks( cSql );

  // acionado ao clicar uma opcao no menu princopal
  // feedback SERGIO - SqlSERVER
  if ed_Order_Search.Text <> '' then
     cSql := cSql + ' order by   ' + trim( ed_Order_Search.Text )
  else
  begin
     cSql := cSql + ' order by   tab.' + ed_PK.Text  ;


     if ( strTokenCount( ed_Order_Search.Text, ',' ) = 0 ) then
        cSql := cSql + ' DESC ';
  end;

  cSql := RemoveLineBreaks( cSql );

  if cFilters <> '' then
  begin
     iPosition   := Pos( ' where ' + '((  ((', lowerCase( cSql ) );

     if iPosition > 0 then
     begin
        cSql := Copy( cSql, 0, iPosition);
     end;

     cSql := cSql + ' where ' + '((  ((' + cFilters + ')) )) ';
  end;

  sqlSearchMaster.close;

  if ( Pos( 'firstshow:', dbgSearchCRUD.Hint ) > 0 ) or
     // v. 3.4.1.0
     ( Self.Tag <> 0 ) then // cadastro dinamico..abrir só um registro pra acelerar...
     //( Self.Tag = 1 ) then // cadastro dinamico..abrir só um registro pra acelerar...
  begin
       // primeira execucao: Limitar a lista( você pode alterar ou parametriza isso )
       if ( sqlSearchMaster.tag = 1 ) then
       begin
          // v. 3.1.0.62
          //cSql := cSql + ' ' + dm_rc.rc_GetSQL( mm.CONFIG_DATABASE_FIREDAC , 'cmd_paginate' ) + ' ' + iFirstShow.ToString + ' ';
          if ( mm.CONFIG_DATABASE_FIREDAC = 'FIREBIRD' ) or ( mm.CONFIG_DATABASE_FIREDAC <> 'SQLSERVER' ) then
             // v. 3.2.0.3
             // v. 3.4.1.0
             //if ed_CodMaster.Tag < 0 then // edit or show
             if ed_CodMaster.Tag <> 0 then // edit or show
                cSql := cSql + ' ' + dm_rc.rc_GetSQL( mm.CONFIG_DATABASE_FIREDAC , 'cmd_paginate' ) + ' 1 '
             else
                cSql := cSql + ' ' + dm_rc.rc_GetSQL( mm.CONFIG_DATABASE_FIREDAC , 'cmd_paginate' ) + ' ' + iFirstShow.ToString + ' ';

          sqlSearchMaster.tag := 0;
       end;
  end;

  sqlSearchMaster.FetchOptions.RecordCountMode := cmVisible;
  sqlSearchMaster.Sql.Text := cSql;

//  labPageCurrPage.Caption := //'[ ' +
//                             //'0' +
//                             ' - ' +
//                             '0' ;
//                             //' ]' ;
  mm.varDW_LastTick := GetTickCount;

  if not dm_rc.rc_OpenQuery( sqlSearchMaster ) then
  begin
     sqlSearchMaster.close;
     Abort;
  end
  else
  begin
     // v. 3.2.0.5
     if ( ( iFirstShow < 0 ) and ( Pos( 'firstshow:0', dbgSearchCRUD.Hint ) = 0 ) ) or ( iFirstShow < 0 ) then
        labState.Caption      := '[ ' + FloatToStrF( sqlSearchMaster.RowsAffected , ffNumber, 10, 0 ) + ' ' + mm.MSG_RECORDS + ' ]';

     if ( mm.varB_Mobile_Screen_Portrait ) and ( not bActions ) and ( not bModelCrud1 ) then
        btnSearchClick( self );
     // v. 3.4.1.0 - paginator
     //dm_rc.rc_GridPaginatorUpdatePages( dbgSearchCRUD );
     iCurrPage := dbgSearchCRUD.DataSource.DataSet.RecNo div dbgSearchCRUD.WebOptions.PageSize + 1;
     edPageNumber.Text := iCurrPage.ToString;
     labPageCurrPage.Caption := //'[ ' +
                                //iCurrPage.ToString +
                                ' - ' +
                                IntToStr( ( dbgSearchCRUD.DataSource.DataSet.RecordCount - 1 ) div dbgSearchCRUD.WebOptions.PageSize + 1 )  ;
                                //' ]' ;
  end;
  //ShowMessage(  'Tempo( sem RDW ): ' + FloatToStr( GetTickCount - mm.varDW_LastTick ) );
  iFirstShow := -1;
end;

procedure TfrmBaseCRUD.cbxAndOrChange(Sender: TObject);
begin
  inherited;
  cbxAndOr.Caption := varIIF( cbxAndOr.Checked, mm.MSG_SEARCH_CONDICIONAL_AND, mm.MSG_SEARCH_CONDICIONAL_OR ) + '...';
end;

procedure TfrmBaseCRUD.cbxSearchCRUDField1Change(Sender: TObject);
begin
  inherited;
  cbxSearchCRUDField1_Fields.ItemIndex := cbxSearchCRUDField1.ItemIndex;
end;

procedure TfrmBaseCRUD.cbxSearchCRUDField2Change(Sender: TObject);
begin
  inherited;
  cbxSearchCRUDField2_Fields.ItemIndex := cbxSearchCRUDField2.ItemIndex;
end;

procedure TfrmBaseCRUD.cbxSearchCRUDFieldDateChange(Sender: TObject);
begin
  inherited;
  cbxSearchCRUDFieldDate_Fields.ItemIndex := cbxSearchCRUDFieldDate.ItemIndex;
end;

procedure TfrmBaseCRUD.cbxSearchCRUDPeriodChange(Sender: TObject);
begin
  inherited;
  dm_rc.rc_ReportDateInterval( cbxSearchCRUDPeriod.Text );

  edSearchCRUDDtIni.DateTime := mm.varD_DtIni;
  edSearchCRUDDtEnd.DateTime := mm.varD_DtEnd;
end;

procedure TfrmBaseCRUD.cbxSearchCRUDPagedClick(Sender: TObject);
begin
  inherited;

  // dbgSearchCRUD.WebOptions.Paged := not dbgSearchCRUD.WebOptions.Paged;

//  if not dbgSearchCRUD.WebOptions.Paged then
//     dbgSearchCRUD.WebOptions.PageSize := 1000000
//  else
//     dbgSearchCRUD.WebOptions.PageSize := 25;
//
//  dbgSearchCRUD.Refresh;
end;

procedure TfrmBaseCRUD.UniFrameAjaxEvent(Sender: TComponent; EventName: string;
  Params: TUniStrings);
var
   i : integer;

begin
  inherited;

  if EventName = 'del_reg' then
  begin
     sqlMaster.Cancel;
     sqlMaster.close;

     sqlMaster.ParamByName( 'table_pk' ).AsInteger := dbgSearchCRUD.Tag;

     dm_rc.rc_OpenQuery( sqlMaster );

     sqlMaster.Delete;
     i := sqlMaster.ApplyUpdates(-1);

     if i > 0 then
     begin
        sqlMaster.Cancel;
        sqlMaster.close;
        Abort;
     end;

     dm_rc.rc_OpenQuery( sqlSearchMaster );
  end;
end;

procedure TfrmBaseCRUD.btnSearchMoreFiltersClick(Sender: TObject);
begin
  inherited;
   if paSearchFilter2.visible then
   begin
       paSearchFilterPeriodSelect.Visible := ( not paSearchFilterPeriodSelect.Visible ) and ( cbxSearchCRUDFieldDate.Items.Count > 0 );
       paSearchFilterDate.Visible         := ( not paSearchFilterDate.Visible ) and ( cbxSearchCRUDFieldDate.Items.Count > 0 );
       paSearchFilterPeriod.Visible       := ( not paSearchFilterPeriod.Visible ) and ( cbxSearchCRUDFieldDate.Items.Count > 0 );
       paSearchContent2.Visible     := not paSearchContent2.Visible;
       paSearchFilter2.Visible      := not paSearchFilter2.Visible;
       paSearchFilterAndOr.Visible  := not paSearchFilterAndOr.Visible;
   end
   else
   begin
      paSearchFilterAndOr.Visible  := not paSearchFilterAndOr.Visible;
      paSearchFilter2.Visible      := not paSearchFilter2.Visible;
      paSearchContent2.Visible     := not paSearchContent2.Visible;

      paSearchFilterPeriod.Visible       := ( not paSearchFilterPeriod.Visible ) and ( cbxSearchCRUDFieldDate.Items.Count > 0 );
      paSearchFilterDate.Visible         := ( not paSearchFilterDate.Visible ) and ( cbxSearchCRUDFieldDate.Items.Count > 0 );
      paSearchFilterPeriodSelect.Visible := ( not paSearchFilterPeriodSelect.Visible ) and ( cbxSearchCRUDFieldDate.Items.Count > 0 );
   end;

   if paSearchFilterPeriod.Visible then
      paSearchBtn.Top := paSearchFilterPeriodSelect.Top + paSearchFilterPeriodSelect.Height + 12
   else
   if paSearchContent2.Visible then
      paSearchBtn.Top := paSearchContent2.Top + paSearchContent2.Height + 12
   else
      paSearchBtn.Top := paSearchContent1.Top + paSearchContent1.Height + 12;
end;

procedure TfrmBaseCRUD.UniFrameCreate(Sender: TObject);
var
   iPos, iPos2, iWidth, iHeight,
   I, F : integer;

   cActions, cCaption,
   cTemp, cTemp3,
   cCls, cIco,

   cSql : string;

   AllPKs,
   cPk : string;
begin
  inherited;
   case mm.varLT_Lang of

        ltpt_BR : begin
                    labNotFound_dbgSearchCRUD.Caption               := 'Pesquisa Não Encontrada';
                  end;
        lten_US, lten_GB   : begin
                    labNotFound_dbgSearchCRUD.Caption               := 'No records found';
                  end;
        ltes_ES   : begin
                    labNotFound_dbgSearchCRUD.Caption               := 'No records found';
                  end;
        ltfr_FR   : begin
                     labNotFound_dbgSearchCRUD.Caption               := 'No records found';
                  end;
        ltde_DE   : begin
                    labNotFound_dbgSearchCRUD.Caption               := 'No records found';
                  end;
        ltit_IT   : begin
                    labNotFound_dbgSearchCRUD.Caption               := 'No records found';
                  end;
        lttr_TR    : begin
                    labNotFound_dbgSearchCRUD.Caption               := 'No records found';
                  end;
        ltru_RU    : begin
                     labNotFound_dbgSearchCRUD.Caption               := 'No records found';
                  end;
        ltzn_CH : begin
                     labNotFound_dbgSearchCRUD.Caption               := 'No records found';
                  end;
        ltin_ID : begin
                     labNotFound_dbgSearchCRUD.Caption               := 'No records found';
                  end;
        ltth_TH : begin
                     labNotFound_dbgSearchCRUD.Caption               := 'No records found';
                  end;
        lthi_IN : begin
                     labNotFound_dbgSearchCRUD.Caption               := 'No records found';
                  end;
        ltar_SA : begin // v. 3.3.0.0
                     labNotFound_dbgSearchCRUD.Caption               := 'لا توجد سجلات';
                  end;
   end;
   // v. 3.2.0.0
   iCurrentPage := -1;

   dbgExport.Top := -50;
   cbxSearchCRUDPeriod.Clear;
   cbxSearchCRUDPeriod.Items.Add( '' );
   cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_TODAY );
   cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_YESTERDAY );
   cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_BEFORE_YESTERDAY );
   cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_TOMORROW );
   cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_AFTER_TOMORROW );
   cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_THIS_WEEK );
   cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_LAST_WEEK );
   cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_NEXT_WEEK );
   cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_THIS_FORTNIGHT );
   cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_LAST_FORTNIGHT );
   cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_NEXT_FORTNIGHT );
   cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_THIS_MONTH );
   cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_LAST_MONTH );
   cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_NEXT_MONTH );
   cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_THIS_BIMESTER );
   cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_THIS_QUARTER );
   cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_THIS_SEMESTER );
   cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_THIS_YEAR );
   cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_LAST_YEAR );
   cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_ALL );
   cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_ALL_UNTIL_TODAY );
   // v. 3.4.1.0 - paginator
   //if Pos( 'grid-paginator|', dbgSearchCRUD.Hint ) > 0 then
   //begin
      //paPageBar.Visible := true;
      //dm_rc.rc_DBGridHidePaginationBar( dbgSearchCRUD );
   //end;

   Self.Color             := StringToColor( mm.CONFIG_LAYOUT_BG_COLOR );
   paBaseTop.Color        := clWhite;
   paBaseButtons.Color    := clWhite;
   paBaseBackGround.Color := clWhite;

   mm.varC_CustomMsg := '';

   // locked
   //dbgSearchCRUD.EnableLocking := True;

   // sort
   //dbgSearchCRUD.ClientEvents.UniEvents.Add(
   //    'store.afterCreate=function store.afterCreate(sender)' +
   //     '{ sender.setRemoteSort(false);﻿ }'
   //);

   // from uniGUI forum: http://forums.unigui.com/index.php?/topic/9634-autofill-how-to-turn-off/
   //UniSession.AddJS('$("input").attr("autocomplete", "off");');

   // estes recursos ficarão comentados por enquanto
   //
   // centralizar a toolbar de paginacao( dica do fórum )
   // http://forums.unigui.com/index.php?/topic/15513-customize-unidbgrid-navigation-toolbar/&tab=comments#comment-85181
 //  dbgSearchCRUD.ClientEvents.ExtEvents.Values['beforerender'] :=
 //     'function beforerender(sender, eOpts) ' +
 //     '  { var pagingBar=sender.pagingBar; ' +
 //     '   if (pagingBar) { ' +
 //     '     pagingBar.add(0, {xtype: ''tbfill''}); ' +
 //     '     pagingBar.add(   {xtype: ''tbfill''}); ' +
 //     '   } ' +
 //     '} ';
 //  // remove refresh button
 //   dbgSearchCRUD.ClientEvents.ExtEvents.Values['afterrender'] :=
 //      'function OnAfterrender(sender) ' +
 //      '{ sender.dockedItems.items[1].items.get(''refresh'').hide();}';
   // reajustar largura das colunas
 //   dbgSearchCRUD.ClientEvents.ExtEvents.Values['reconfigure'] :=
 //      'function reconfigure(sender, store, columns, oldStore, oldColumns, eOpts)' +
 //      '{'+
 //      '  Ext.each(columns,'+
 //      '     function(column, index) {'+
 //
 //      '        if (!sender.columnManager) {'+
 //
 ////      '          //get grid new width'+
 ////      '          var grd_w=sender.columns[index].getWidth();'+
 ////
 ////      '          //validate'+
 ////      '          if(sender.columns[index].width==0) return;'+
 //
 //      '          sender.columns[index].flex=1;  /*fit width, comment to disable*/'+
 //      '          sender.columns[index].minWidth = 150; /*min.size*/'+
 //      '        } else {'+
 //      '          sender.columnManager.columns[index].flex=1;'+
 //      '          sender.columnManager.columns[index].minWidth = 120;'+
 //      '        };'+
 //      '     }'+
 //      '  )'+
 //      '}';


    paSearchFilters.Width := 0;

    // isso é feito para q os panels q contem os botoes nao troquem de ordem
    // ao ficarem visiveis
    paOF.Visible      := false;
    paGC.Visible      := false;
    paNAE.Visible     := false;
    paP.Visible       := false;

    paP.Visible       := not ( dsMaster.State in [ dsEdit, dsInsert ] );
    paNAE.Visible     := paP.Visible;
    paGC.Visible      := not paP.Visible;

    btnOptions.Visible := ( popMenuOptions.Items.Count > 0 );

    paOF.Visible      := paP.Visible;

    //if bActions then
    begin
       labNew.Visible     := ( paNAE.Visible ) and ( bActions or bModelCrud1 );
       labEdit.Visible    := ( labNew.Visible ) and ( bModelCrud1 );
       labDelete.Visible  := ( labNew.Visible ) and ( bModelCrud1 );
       labOptions.Visible := ( labNew.Visible ) and ( bModelCrud1 );
       labCancel.Visible  := not labNew.Visible;
       labSave.Visible    := not labNew.Visible;
       dm_rc.rc_ObjectEnabled( Self, btnQuickSearch, labNew.Visible );
       edQuickSearch.Enabled := labNew.Visible;
    end;
    // v. 3.4.1.0 - paginator
    labPagePrior.Enabled   := paNAE.Visible;
    labPageFirst.Enabled   := paNAE.Visible;
    labPageNext.Enabled    := paNAE.Visible;
    labPageLast.Enabled    := paNAE.Visible;
    labPageRefresh.Enabled := paNAE.Visible;
    edPageNumber.Enabled   := paNAE.Visible;
    labPagePrior.font.Color := varIIF( labPagePrior.Enabled, clBlack, clSilver );
    labPageFirst.font.Color := varIIF( labPageFirst.Enabled, clBlack, clSilver );
    labPageNext.font.Color := varIIF( labPageNext.Enabled, clBlack, clSilver );
    labPageLast.font.Color := varIIF( labPageLast.Enabled, clBlack, clSilver );
    labPageRefresh.font.Color := varIIF( labPageRefresh.Enabled, clBlack, clSilver );

    labState.Caption   := mm.LAB_STATE_B;

    labExit.Enabled    := paOF.Visible;
    labExit.font.Color := varIIF( labExit.Enabled, clBlack, clSilver );
    labState.Visible   := not mm.varB_Mobile_Screen_Portrait ;

    tabSearch.Visible  := paP.Visible;

    rc_AddCssClass( labTitleForm, 'rc-font-light' );

    labTitleForm.Font.Name  := mm.CONFIG_LAYOUT_APP_FONT;
    labTitleForm.Font.Color := $002a2a2a ;//clBlack;
    labTitleForm.Font.Size  := 16;
    labTitleForm.Font.Style := [];

    //rtl // v. 3.2.0.0
    labState.Alignment  := varIIF( ( mm.RTL ) and ( labState.Visible ), taLeftJustify, taRightJustify );
    if ( mm.RTL ) and ( labState.Visible ) then
       btnQuickSearch.Hint := '[[cls:ButtonThemeCrud-no-border-right |ico:fas-search |]]'
    else
       btnQuickSearch.Hint := '[[cls:ButtonThemeCrud-no-border-left |ico:fas-search |]]';

    // deixar  invisivel pra ganhar mais espaço vertical
    tabRegister.TabVisible         := false;
    tabSearch.TabVisible           := false;
    pgBaseCadControl.TabBarVisible := false;
    pgBaseCadControl.ActivePage    := tabSearch;

    if Self.FindComponent('pgComplementData' ) <> nil then
       if TUniPageControl( Self.FindComponent('pgComplementData' ) ).Pages[0].TabVisible then
          TUniPageControl( Self.FindComponent('pgComplementData' ) ).ActivePageIndex := 0;

    // para criticar cada coluna no ondrawcell
    mm.varC_GridColName := '';

    //pgBaseCadControl.ActivePage := tabSearch; // v. 3.3.2.0

    // ao entrar na tela setar os EDITs que guardam dados
    // referente ao FORM atual
    Self.ed_Table_ItemSel.Text  := trim( lowercase( mm.varC_Table_Search ) ) ;

    // novo controle captura chave dinamica
    Self.ed_PK.Text              := mm.varC_PK_MasterTable;

    if ed_Where_Search.Text <> '' then
       ed_Where_Search.Text          := '((  ((' + trim( ed_Where_Search.Text ) + ')) )) ';
    if ed_Order_Search.Text <> '' then
       ed_Order_Search.Text          := trim( ed_Order_Search.Text ) ;

    Self.ed_FormOrigin.Text       := mm.varC_FormSource_Search ;
    Self.ed_FormOrigin_Tab.Text   := mm.varC_Selected_FormFrame ;
    Self.ed_Table_Status.Text     := mm.varC_StatusSearch ;
    Self.ed_Table_Status_OLD.Text := '';

    // pre-defined grid columns attributes
    if ( Pos( 'fieldmasks:' , dbgSearchCRUD.Hint ) = 0 ) then
        dbgSearchCRUD.Hint := '[[' +
                              'fieldmasks:' +
                              'grid-resize|' +
                              ']]';
    dbgSearchCRUD.Hint   := rc_AddHintProperty( '|state-visible:empty-false ds:dsSearchMaster', dbgSearchCRUD.Hint, false ); // v. 3.3.3.0
    // v. 3.3.2.0
    if Pos( '[[pk-show]]' , sqlMaster.Sql.Text ) > 0 then
    begin
       sqlMaster.Sql.Text := StringReplace( sqlMaster.Sql.Text, '[[pk-show]]', '[[pk]]', [rfReplaceAll] );
       dbgSearchCRUD.Hint := rc_AddHintProperty( '|showpk', dbgSearchCRUD.Hint, false ); // v. 3.3.3.0
    end;

    if ( Pos( 'fieldmasks:' , dbgSearchCRUD.Hint ) > 0 ) and ( Pos( 'fieldmasks:table-' , dbgSearchCRUD.Hint ) = 0 ) then
    begin
         iPos := Pos( 'fieldmasks:' , dbgSearchCRUD.Hint ) + 11;
         cTemp := dbgSearchCRUD.Hint;
         Insert( 'table-' + lowercase( ed_Table_ItemSel.Text ) + ';', cTemp , iPos );
         dbgSearchCRUD.Hint := cTemp;
    end;

    mm.varC_FieldMasks := '';

    // Senão tiver sido definido a query no ON CREATE da nova tela herdada...
    if ( trim(sqlMaster.Sql.Text) = EmptyStr ) or ( Pos ( '[grid]' , trim(sqlMaster.Sql.Text) ) = 0  ) then
    begin
        sqlMaster.close;
        sqlMaster.SQL.Text := ' SELECT [[fields]]  ' +

                              '   FROM [[table]] tab ' +

                              '  WHERE tab.[[pk]] = :table_pk ' ;
    end;
    if Pos ( '[grid]' , trim(sqlMaster.Sql.Text) ) = 0 then
    begin
        sqlMaster.SQL.Text := sqlMaster.SQL.Text +
                              '[grid]' +

                              ' SELECT [[fields]] ' +

                              ' FROM [[table]] tab ';
    end;

    // configurar lookups...mascaras...etc.. preparar query [[fields]]...
    // adjust the lookup tables according to the query name
    dm_rc.rc_RenderLookUpControls( Self );

    // v. 3.1.0.62
    sqlSearchMaster.tag := 1;
    cSql := Trim( sqlMaster.SQL.Text );  // v. 3.1.0.63
    // SQLSERVER TOP...
    if ( Pos( 'firstshow:', dbgSearchCRUD.Hint ) > 0 ) or
       ( Self.Tag = 1 ) then // cadastro dinamico..abrir só um registro pra acelerar...
    begin
         // primeira execucao: Limitar a lista( você pode alterar ou parametriza isso )
         if ( sqlSearchMaster.tag = 1 ) then
         begin
              cSql := Trim( sqlMaster.SQL.Text );
              if ( lowercase( copy( cSql, 1, 6 ) ) = 'select' ) and ( mm.CONFIG_DATABASE_FIREDAC = 'SQLSERVER' ) then // v. 3.1.0.63
              begin
                   cTemp := Copy( dbgSearchCRUD.Hint, Pos( 'firstshow:', dbgSearchCRUD.Hint ) , 100 );
                   cTemp := Copy( cTemp, 1, Pos( '|', cTemp ) - 1 );

                   iFirstShow := StrToIntDef( ReturnNumbers( cTemp ), -1 ); // v. 3.1.0.63
                   cTemp := '';

                   cSql := 'SELECT TOP ' + iFirstShow.ToString + ' ' + copy( cSql, 7, 5000 );
                   //ql := 'SELECT [[TOP0]] ' + copy( cSql, 7, 5000 );
              end;
         end;
    end;
    sqlMaster.SQL.Text := cSql;     // v. 3.1.0.63

    // associar a TABELA ATUAL ao SCRIPT do FORM/FRAME atual
    if Pos( '[[table]]' , sqlMaster.Sql.Text ) > 0 then
       sqlMaster.Sql.Text := StringReplace( sqlMaster.Sql.Text , '[[table]]' , Self.ed_Table_ItemSel.Text, [rfReplaceAll] );
    // v. 3.3.1.0
    // tab.codigo por tab.[[pk]]
    // associar a PK ATUAL ao SCRIPT do FORM/FRAME atual
    if Pos( '[[pk]]' , sqlMaster.Sql.Text ) > 0 then
    begin
       if ( pos( 'tab.[[pk]] as ', sqlMaster.Sql.Text ) > 0 ) and ( pos( '[[allpks]]', sqlMaster.Sql.Text ) = 0 ) then
          dm_rc.rc_ShowError( 'Your SQL sentence do not have [[allpks]] statement.<br>When [[pk]] has an ALIAS it must have [[allpks]].' );
       sqlMaster.Sql.Text := StringReplace( sqlMaster.Sql.Text , '[[pk]]' , Self.ed_PK.Text, [rfReplaceAll] );
    end;

    // pega o SQL de pesquisa( GRID )
    sqlSearchMaster.close;
    sqlSearchMaster.sql.Text := RemoveLineBreaks( Copy( sqlMaster.Sql.Text, Pos( '[grid]' , sqlMaster.Sql.Text ) + 6, 5000 ) );

    // paged...firstshow...[[firstshow:20 no-paged]]
    iFirstShow := 0 ;
    bPaged     := true;
//    if ( Pos( 'firstshow:', sqlSearchMaster.sql.Text ) > 0 ) or
//       ( Pos( 'no-paged|', sqlSearchMaster.sql.Text ) > 0 ) then
//    begin
//       cTemp := Copy( sqlSearchMaster.sql.Text, Pos( 'firstshow:', sqlSearchMaster.sql.Text ) , 100 );
//       cTemp := Copy( cTemp, 1, Pos( '|', cTemp ) + 2 );
//
//       if cTemp <> '' then
//          sqlSearchMaster.sql.Text := StringReplace( sqlSearchMaster.sql.Text, cTemp, '', [rfReplaceAll] );
//
//       iFirstShow := StrToIntDef( ReturnNumbers( cTemp ), 0 ); // 20
//       bPaged     := ( Pos( 'no-paged', cTemp ) = 0 );
//    end;

    // agrupamento / grouping
    //dbgSearchCRUD.Grouping.Enabled := true;

    //dbgSearchCRUD.WebOptions.Paged  := bPaged;

    //if dbgSearchCRUD.Grouping.Enabled then
    //   dbgSearchCRUD.Grouping.FieldName := 'uf';

    AllPKs := '';

    dm_rc.memPK.Filtered := false;
    dm_rc.memPK.Filter := 'table=' + quotedStr(lowercase(trim(Self.ed_Table_ItemSel.Text )));
    dm_rc.memPK.Filtered := true;
    dm_rc.memPK.First;
    cSql := lowercase( sqlSearchMaster.sql.Text );
    cSql :=  Copy( cSql, 1, Pos( ' from ' , cSql ) );

    while not dm_rc.memPK.eof do
    begin
         dm_rc.memPK.tag := 0;

         cPk := trim(lowercase( dm_rc.memPK.FieldByName( 'pk' ).AsString ));

         // se alguma das PK´s ja estiver presente na query do on create do form( preenchida manualmente ) não adicionar...
         AllPKs := AllPKs + 'tab.' + cPk ;

         // Append data
         dm_rc.memGridPK.Open;

         if not dm_rc.memGridPK.Locate( 'field' , cPk , [] ) then
            dm_rc.memGridPK.AppendRecord( [ cPk ] );

         dm_rc.memPK.tag := 1;

         dm_rc.memPK.Next;

         if ( not dm_rc.memPK.eof ) and ( AllPKs <> '' ) then
            AllPKs := AllPKs + ', ';
    end;

    dm_rc.memPK.Filtered := false;

    // [[allpks]]
    // inserir no grid todas as PK´s da tabela dinamicamente
    dbgSearchCRUD.Tag := 0; // se nao tem ALLPKS...nao critica a exibicao das colunas

    if Pos( '[[allpks]]' , sqlSearchMaster.Sql.Text ) > 0 then
    begin
       sqlSearchMaster.Sql.Text := StringReplace( sqlSearchMaster.Sql.Text , '[[allpks]]' , AllPKs, [rfReplaceAll] );
       dbgSearchCRUD.Tag := 1;
    end;

    // grid-btns -> Actions
    if Pos( '[[grid-btn:edo]]' , sqlSearchMaster.Sql.Text ) > 0 then
    begin
       sqlSearchMaster.Sql.Text := StringReplace( sqlSearchMaster.Sql.Text ,
                                                  '[[grid-btn:edo]]' ,
                                                  '( ''[[grid-btn:(edit)   ]] '' ) as rcAction_Edit, ' +
                                                  '( ''[[grid-btn:(delete) ]] '' ) as rcAction_Delete, ' +
                                                  '( ''[[grid-btn:(options) ]] '' ) as rcAction_Options ' ,
                                                  [rfReplaceAll] );
    end
    else
    begin
       if Pos( '[[grid-btn:edit]]' , sqlSearchMaster.Sql.Text ) > 0 then
       begin
          sqlSearchMaster.Sql.Text := StringReplace( sqlSearchMaster.Sql.Text ,
                                                     '[[grid-btn:edit]]' ,
                                                     '( ''[[grid-btn:(edit)]]'' ) as rcAction_Edit '  ,
                                                     [rfReplaceAll] );
       end;

       if Pos( '[[grid-btn:delete]]' , sqlSearchMaster.Sql.Text ) > 0 then
       begin
          sqlSearchMaster.Sql.Text := StringReplace( sqlSearchMaster.Sql.Text ,
                                                     '[[grid-btn:delete]]' ,
                                                     '( ''[[grid-btn:(delete)]]'' ) as rcAction_Delete '  ,
                                                     [rfReplaceAll] );
       end;

       if Pos( '[[grid-btn:options]]' , sqlSearchMaster.Sql.Text ) > 0 then
       begin
          sqlSearchMaster.Sql.Text := StringReplace( sqlSearchMaster.Sql.Text ,
                                                     '[[grid-btn:options]]' ,
                                                     '( ''[[grid-btn:(options)]]'' ) as rcAction_Options '  ,
                                                     [rfReplaceAll] );
       end;
    end;
    // em desenvolvimento  /  in development
    // action buttons
    cTemp := '';
    cActions := '';
    iPos := Pos( '[[grid-btn:' , sqlSearchMaster.Sql.Text );
    iPos2 := iPos;
    i := 0;

    While iPos > 0 do
    begin
       cTemp  := sqlSearchMaster.Sql.Text;
       cTemp  := Copy( cTemp , iPos, 2000 );
       cTemp  := Copy( cTemp , 3, Pos( ']]', cTemp ) - 3 );
       cTemp2 := Copy( cTemp , 10, 2000 );
       cActions := cTemp2;
       iPos2 := Pos( '|', cActions );

       if iPos2 > 0 then
          cCaption := Trim( Copy( cActions, 1, iPos2 - 1 ) )
       else
          cCaption := Trim( cActions );

       cCls := rc_GetHintProperty( 'cls:' , cActions );
       cIco := rc_GetHintProperty( 'ico:' , cActions );

       //event name
       cTemp3 := StringReplace( cCaption, '(', '', [rfReplaceAll] );
       cTemp3 := StringReplace( cTemp3, ')', '', [rfReplaceAll] );

       bActions := False;

       if ( cCaption = '(new)' ) and ( cCls = '' ) then
       begin
            cCls := 'btn ButtonBlue btn-sm rc-btn-action-padding'; //btn-primary

            if cIco = '' then
               cIco := 'fas-plus';

            cCaption := '';

            bActions := True;
       end;

       if ( cCaption = '(edit)' ) then
       begin
            cCls := 'btn ButtonGreen btn-sm rc-btn-action-padding'; //btn-success

            if cIco = '' then
               cIco := 'fas-pencil-alt';

            cCaption := '';
            bActions := True;
       end;

       if( cCaption = '(delete)' ) then
       begin
            cCls := 'btn ButtonRed btn-sm rc-btn-action-padding'; //

            if cIco = '' then
               cIco := 'fas-trash-alt';

            cCaption := '';
            bActions := True;
       end;

       if( cCaption = '(options)' ) then
       begin
            cCls := 'btn ButtonGray btn-sm rc-btn-action-padding'; //

            if cIco = '' then
               cIco := 'fas-bars';

            cCaption := '';
            bActions := True;
       end;

       iWidth  := StrToIntDef( rc_GetHintProperty( 'w:' , cActions ), 22 );
       iHeight := StrToIntDef( rc_GetHintProperty( 'h:' , cActions ), 22 );

       if cIco <> '' then
          cIco := Copy( cIco, 1, Pos( '-', cIco ) - 1 ) + ' fa-' + Copy( cIco, Pos( '-', cIco ) + 1 , 20 );

       // listar 2 colunas
       //
       // rc_action contendo a lista de botoes
       // rc_action_mob contendo um botao só..mas q ao clicar lista os botoes de rc_action
       Inc( i );
       if ( mm.varB_Mobile_Screen )  then
          cTemp2 := '<div>' +
                    ' <button ' +
                    '     id="rc-action-' + dbgSearchCRUD.Name + i.ToString + '" type="button" ' +
                    '     class="' + cCls + ' ' + cIco + '">' + cCaption +
                    ' </button>' +
                    '</div>'
       else
          cTemp2 := ' <div style="text-align:center; margin: -2px">' +
                    ' <button ' +
                    '     id="rc-action-' + dbgSearchCRUD.Name + i.ToString + '" type="button" ' +
                    '     class="' + cCls + ' ' + cIco + '">' + cCaption +
                    ' </button>' +
                    '</div>' ;

       sqlSearchMaster.Sql.Text := StringReplace( sqlSearchMaster.Sql.Text , '[[' + cTemp + ']]' , cTemp2, [rfReplaceAll] );

       iPos := Pos( '[[grid-btn:' , sqlSearchMaster.Sql.Text );

    end;

    bModelCrud1 := Pos( 'model-crud:1', dbgSearchCRUD.Hint ) > 0;

    paBaseTop.Height    := varIIF( bActions or bModelCrud1, 90, 46 );

    paBaseButtons.Width := varIIF( bActions or bModelCrud1, 0, 37 );
    labState.Width      := varIIF( bActions or bModelCrud1, 120, 164 );
    labNew.Visible      := bActions or bModelCrud1;
    labEdit.Visible     := bModelCrud1;
    labDelete.Visible   := bModelCrud1;
    labOptions.Visible  := bModelCrud1;
    labCancel.Visible   := not labNew.Visible;
    labSave.Visible     := not labNew.Visible;
    edQuickSearch.Enabled  := labNew.Visible;
    dm_rc.rc_ObjectEnabled( Self, btnQuickSearch, labNew.Visible );
    btnCloseForm.Visible   := False;

     // feedback SERGIO - SqlSERVER
    if trim( ed_Order_Search.Text ) = '' then
       sqlSearchMaster.sql.Text := sqlSearchMaster.sql.Text +
                                   ' order by   tab.' + Self.ed_PK.Text + ' DESC ' ;
                                   // do not remove the spaces above between "by" and "tab"
    //sqlSearchMaster.tag := 1; // v. 3.1.0.62

    for f := 0 to ComponentCount - 1 do
    begin
         if Components[f] is TUniDBGrid then
         begin
            TUniDBGrid( Components[f] ).EnableLocking    := ( Pos( 'locked|', TUniDBGrid( Components[f] ).Hint ) > 0 ) ;
            bPaged := ( ( Pos( 'fieldmasks:', TUniDBGrid( Components[f] ).Hint ) > 0 ) and ( Pos( 'no-paged|', TUniDBGrid( Components[f] ).Hint ) = 0 ) ) or ( TUniDBGrid( Components[f] ).WebOptions.Paged ) ; // v. 3.3.0.0
            // v. 3.3.0.1
            if TUniDBGrid( Components[f] ).WebOptions.Paged <> bPaged then
               TUniDBGrid( Components[f] ).WebOptions.Paged := bPaged;

            if ( Pos( 'firstshow:', TUniDBGrid( Components[f] ).Hint ) > 0 ) then
            begin
               cTemp := Copy( TUniDBGrid( Components[f] ).Hint, Pos( 'firstshow:', TUniDBGrid( Components[f] ).Hint ) , 100 );
               cTemp := Copy( cTemp, 1, Pos( '|', cTemp ) - 1 );

               iFirstShow := StrToIntDef( ReturnNumbers( cTemp ), 0 );
            end;

            if ( Pos( 'fieldmasks:' , TUniDBGrid( Components[f] ).Hint ) = 0 ) then
               TUniDBGrid( Components[f] ).Hint := '[[' +
                                                   'fieldmasks:' +
                                                   'grid-resize|' +
                                                   ']]' ;
            //paPagePagBtns.visible := bPaged;
            //paPageBar.visible := bPaged;
         end;
    end;

    // pega o SQL de cadastro( antes de GRID )
    sqlMaster.Close;
    sqlMaster.SQL.Text := Copy( sqlMaster.Sql.Text, 1, Pos( '[grid]' , sqlMaster.Sql.Text ) -1 );

    sqlMaster.UpdateOptions.KeyFields := Self.ed_PK.Text;

    // Carrega definicoes anteriores caso o cliente tenha mexido em alguma coluna...
    //dbgDados.Columns.Clear;
    if FileExists( mm.APP_PATH_CONTROL + 'delete_dbGrid_' + Trim( ed_Table_ItemSel.Text ) + '.cfg' ) then
    begin
       DeleteFile( mm.APP_PATH_CONTROL + 'delete_dbGrid_' + Trim( ed_Table_ItemSel.Text ) + '.cfg' );
       DeleteFile( mm.APP_PATH_CONTROL + 'dbGrid_' + Trim( ed_Table_ItemSel.Text ) + '.cfg' );
    end;
    // v. 3.3.3.0
    i := StrToIntDef( ed_CodMaster.Hint, 0 );
    if i = 0 then
    begin
       // contar quantos campos tem pra ativar ou nao o FORCEFIT
       // FORCEFIT fica melhor com poucos campos, mas nao funciona bem quando o LOCKED está ativo
       dm_rc.rc_DBGridUpdateAll( Self , false); // v. 3.3.3.0
    end;

end;

procedure TfrmBaseCRUD.UniFrameDestroy(Sender: TObject);
//var
//   I, F : integer;
begin
  inherited;

  // fechar querys abertas
  dm_rc.rc_CloseQuerys( Self , False, False );
end;
// v. 3.2.0.0
procedure TfrmBaseCRUD.UniFrameReady(Sender: TObject);
var
   i : integer;
begin
  inherited;

   paSearchFilterPeriodSelect.Visible := ( not paSearchFilterPeriodSelect.Visible ) and ( cbxSearchCRUDFieldDate.Items.Count > 1 );
   paSearchFilterDate.Visible         := ( not paSearchFilterDate.Visible ) and ( cbxSearchCRUDFieldDate.Items.Count > 1 );
   paSearchFilterPeriod.Visible       := ( not paSearchFilterPeriod.Visible ) and ( cbxSearchCRUDFieldDate.Items.Count > 1 );
   paSearchContent2.Visible     := not paSearchContent2.Visible;
   paSearchFilter2.Visible      := not paSearchFilter2.Visible;
   paSearchFilterAndOr.Visible  := not paSearchFilterAndOr.Visible;

   labTitleSearch.Top             := 10;
   paSearchFilter1.Top            := 49;
   paSearchContent1.Top           := paSearchFilter1.Top + paSearchFilter1.Height;// 169;

   paSearchFilterAndOr.Top        := paSearchContent1.Top + paSearchContent1.Height;
   paSearchFilter2.Top            := paSearchFilterAndOr.Top + paSearchFilterAndOr.Height;
   paSearchContent2.Top           := paSearchFilter2.Top + paSearchFilter2.Height;

   paSearchFilterPeriod.Top       := paSearchContent2.Top + paSearchContent2.Height;
   paSearchFilterDate.Top         := paSearchFilterPeriod.Top + paSearchFilterPeriod.Height;
   paSearchFilterPeriodSelect.Top := paSearchFilterDate.Top + paSearchFilterDate.Height;

   if paSearchFilterPeriod.Visible then
      paSearchBtn.Top := paSearchFilterPeriodSelect.Top + paSearchFilterPeriodSelect.Height + 12
   else
   if paSearchContent2.Visible then
      paSearchBtn.Top := paSearchContent2.Top + paSearchContent2.Height + 12
   else
      paSearchBtn.Top := paBaseRegSearch.Top + paSearchFilters.Top + UniScrollBox1.Top + paSearchContent1.Top + paSearchContent1.Height + 12;

    // in development
    rc_Translate( Self, nil , '' , mm.CONFIG_LANGUAGE );

    dbgSearchCRUD.Grouping.Enabled := False;

    Self.ed_FormOrigin.Text      := mm.varC_FormSource_Search ;

    if ( Self.Tag = 1 ) then
    begin
       btnSearchCRUDClick( self );
       btnNewReg.Click;
    end
    else
    // EXIBIÇÃO / EDIÇÃO DINÂMICA DE REGISTRO  /   DISPLAY / DYNAMIC REGISTRATION EDITION
    //( Requested by GUS from Italy )
    //
    // este trecho de código está relacionado com a abertura/edição dinâmica de formulários/frames
    // this code snippet is related to opening / editing dynamics of forms / frames
    //
    // Ex: MainForm.rc_AddFormFrameInTab( nil, '', 'clientes', '' , false, false, 569, true );
    //
    // Assumi como padrão que o primeiro campo de pesquisa definido deverá ser o campo usado para efetuar a pesquisa dinâmica, ou seja,
    // se vamos pesquisar pelo CODIGO DO CLIENTE( por exemplo ) deve existir uma opção de pesquisa pelo CODIGO DO CLIENTE no ON CREATE do CADASTRO DE CLIENTES.
    //
    // I assumed ( by default ) that the first defined search field should be the field used to perform the dynamic search, that is,
    // if we are going to search for the CUSTOMER CODE (for example) there must be an option to search for the CUSTOMER CODE in the ON CREATE of the CUSTOMER REGISTRATION.
    //
    begin
       i := StrToIntDef( ed_CodMaster.Hint, 0 );
       if i <> 0 then
       begin
            cbxSearchCRUDField1.ItemIndex := 0;
            // v. 3.4.1.0
//            if bModelCrud1 then
//            begin
//               edQuickSearch.Text := IntToStr( i );
//               //btnQuickSearchClick( btnQuickSearch );
//            end;
            edSearchCRUD1.Text := IntToStr( i );
            btnSearchCRUDClick( btnSearchCRUD );
            case ed_CodMaster.Tag of
                 //-1 : dbgSearchCRUDDblClick( dbgSearchCRUD );
                 -2 : btnEditRegClick( btnEditReg );
                 //-3 : btnNewRegClick( btnNewReg );
                 -3 : dbgSearchCRUDDblClick( dbgSearchCRUD ); // v. 3.4.0.0
            end;

            edSearchCRUD1.Text := '';
       end
       else
       begin
          // v. 3.3.3.0
          mm.varI_Temp1 := 0;
          btnSearchCRUDClick( btnSearchCRUD );
          // contar quantos campos tem pra ativar ou nao o FORCEFIT
          // FORCEFIT fica melhor com poucos campos, mas nao funciona bem quando o LOCKED está ativo
          //dm_rc.rc_DBGridUpdateAll( Self , false); // v. 3.3.3.0
       end;
    end;
end;

procedure TfrmBaseCRUD.btnCancelRegClick(Sender: TObject);
var
   I, F : integer;
   cOldStatus, cOldPK : string;
begin
  inherited;

  if dm_rc.rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;

  cOldStatus := ed_Table_Status.Text;
  ed_Table_Status.Text := '';
  ed_Table_Status_OLD.Text := '';

  cOldPK := sqlMaster.FieldByName( Self.ed_PK.Text ).AsString;

  // fechar todas as querys abertas
  try
     for I := 0 to Self.ComponentCount - 1 do
     begin
       // to clean "valid:" red borders
       // para limpar as bordas vermelhas do "valid:"
       If GetPropInfo( Self.Components[I].ClassInfo, 'Hint') <> nil then
       begin
          if Pos( 'invalid:true', TUniControl( Self.Components[I] ).Hint ) > 0 then
          begin
             rc_RemoveCssClass( TUniControl( Self.Components[I] ), 'rc-invalid' );
             rc_SetHintProperty( 'false' , 'invalid:', TUniControl( Self.Components[I] ).Hint ); //para limpar ao cancelar o cadastro
          end;
       end;

       f := 0;
       if Self.Components[I] is TFDQuery then
       begin
          if TFDQuery( Self.Components[I] ).Name <> 'sqlSearchMaster' then
          begin
             TFDQuery( Self.Components[I] ).Cancel;
             f := 1;
          end;
       end
       else
       if Self.Components[I] is TDataSource then
       begin
          if ( TDataSource( Self.Components[I] ).DataSet.Name <> 'sqlSearchMaster' ) and
             ( TDataSource( Self.Components[I] ).DataSet.IsLinkedTo( TDataSource( Self.Components[I] ) ) ) then
          begin
             TDataSource( Self.Components[I] ).DataSet.Cancel;
             f := 1;
          end;
       end;

       if ( bSaveMasterPK ) and ( f = 1 ) and ( TDataSource( Self.Components[I] ).DataSet.Name = 'sqlMaster' ) then
       begin
           if ( cOldStatus = 'I' ) then
           begin

              dm_rc.rc_DeleteFKTables( ed_Table_ItemSel.Text, ed_PK.Text, cOldPK );
              if not dm_rc.rc_DeleteRecord( ed_Table_ItemSel.Text, ' where ' + ed_PK.Text + ' = ' + cOldPK ) then
              begin
                   dm_rc.rc_ShowError( mm.MSG_CONTACT_SUPPORT + sLineBreak + sLineBreak +
                                       //cMSG_COMPANY_DELETE + sLineBreak + sLineBreak +
                                       mm.varC_LastErrorMsg );
              end;
           end;
       end;
     end;
     except on e:exception do
            begin
               dm_rc.rc_ShowError( mm.MSG_BUGERROR_CLOSE_QUERY );
            end;
  end;

  pgBaseCadControl.ActivePage := tabSearch;
  // v. 3.2.0.0
  if ( StrToIntDef( ed_CodMaster.Hint, 0 ) > 0 ) then
  begin
      // v. 3.2.0.0
      //btnSearchCRUDClick( self );
      if iCurrentPage <> -1 then
         UniSession.AddJS( dbgSearchCRUD.JSName+'.store.loadPage(' + iCurrentPage.ToString + ');')
      else
         btnSearchCRUDClick( self );
  end
  else
  begin
     rc_DefaultTitleForm;
  end;
end;

procedure TfrmBaseCRUD.rc_CloseQuerys;
var
   I : integer;
begin
     for I := 0 to Self.ComponentCount - 1 do
     begin
       if Self.Components[I] is TFDQuery then
       begin
          if TFDQuery( Self.Components[I] ).Name <> 'sqlSearchMaster' then
          begin
             TFDQuery(Self.Components[I]).Cancel;
             TFDQuery(Self.Components[I]).Close;
          end;
       end
       else
       if Self.Components[I] is TFDMemTable then
       begin
          TFDMemTable(Self.Components[I]).Close;
       end
       else
       if Self.Components[I] is TDataSource then
       begin
          if TDataSource( Self.Components[I] ).DataSet <> nil then
             if TDataSource( Self.Components[I] ).DataSet.Name <> 'sqlSearchMaster' then
             begin
                TDataSource(Self.Components[I]).DataSet.Cancel;
                TDataSource(Self.Components[I]).DataSet.Close;
             end;
       end;
     end;
end;
// v. 3.2.0.0
procedure TfrmBaseCRUD.rc_DefaultTitleForm;
var
   i : integer;
begin
     i := Pos( ' [ID:', labTitleForm.Caption );
     if ( i > 0 ) and ( Pos( 'caption-id', labTitleForm.Hint ) > 0 ) then
     begin
        labTitleForm.Caption := Copy ( labTitleForm.Caption, 1, i-1 );
        labTitleForm.hint := rc_SetHintProperty( '', 'caption-dots-default:', labTitleForm.hint );
        labTitleForm.hint := StringReplace( labTitleForm.hint, 'caption-dots-default:', '', [rfReplaceAll] );
     end;
end;

procedure TfrmBaseCRUD.rc_DeleteFKs;
begin
  dm_rc.sqlDelete.SQL.Text := format( dm_rc.rc_GetSQL( mm.CONFIG_DATABASE_FIREDAC , 'fk_tables' ) , [ trim( ed_Table_ItemSel.Text ) ] );

  if dm_rc.sqlDelete.SQL.Text = '' then
  begin
       dm_rc.rc_ShowSweetAlert( mm.MSG_WARNING, Format( mm.MSG_BUGERROR_INCOMPATIBLE_SGBD, ['fk_table'] ) , 'warning');
  end
  else
  begin
     dm_rc.rc_OpenQuery( dm_rc.sqlDelete );

     while not dm_rc.sqlDelete.Eof do
     begin
          mm.varC_SQL_GENERIC := ' delete from ' + dm_rc.sqlDelete.FieldByName( 'table_name' ).AsString + ' ' +
                                 ' where ' + dm_rc.sqlDelete.FieldByName( 'field_name' ).AsString + ' = ' +
                                             sqlSearchMaster.FieldByName( ed_PK.Text ).AsString;

          mm.varC_LastErrorMsg := dm_rc.rc_ExecuteQuery( mm.varB_Use_FireDac,
                                                         mm.varC_SQL_GENERIC,
                                                         [] );
          if mm.varC_LastErrorMsg <> '' then
          begin
             dm_rc.rc_ShowError( mm.MSG_CONTACT_SUPPORT + sLineBreak + sLineBreak +
                                 mm.MSG_BUGERROR_FOREIGN_KEY_DELETE + sLineBreak + sLineBreak +
                                 mm.varC_LastErrorMsg );
             dm_rc.sqlDelete.close;
             Abort;

          end;

          dm_rc.sqlDelete.Next;
     end;
  end;
end;

// Devido a um problema com firedac( ou talvez por não permitir em runtime ) ao deletar um registro
// com relacionamente( ... DELETE CASCADE ) apenas o MASTER está sendo removido. Com esse código todas
// as tabelas relacionadas com chave estrangeira vinculadas a tabela que está sendo deletada serão
// removidas antes para evitar violação de chave estrangeira. Por enquanto apenas funcionando para FIREBIRD
//
// Due to a problem with firedac (or perhaps not allowing it at runtime) when deleting a record
// with relative (and DELETE CASCADE) only MASTER is being removed. With this code all tables related
// to foreign keys linked to the table being deleted will be removed beforehand to avoid foreign key violations.
// For now only working for FIREBIRD
procedure TfrmBaseCRUD.sqlMasterAfterScroll(DataSet: TDataSet);
begin
  inherited;
  rc_DSReactiveCheck( self , DataSet.DataSource ); // v. 3.3.0.0
end;

procedure TfrmBaseCRUD.sqlMasterBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  dm_rc.rc_DeleteFKTables( ed_Table_ItemSel.Text, ed_PK.Text, sqlSearchMaster.FieldByName( ed_PK.Text ).AsString );
  //rc_DeleteFKs;
end;
// v. 3.3.3.2
procedure TfrmBaseCRUD.sqlMasterError(ASender, AInitiator: TObject; var AException: Exception);
begin
  inherited;
  dm_rc.rc_ShowError( AException.Message );
end;

// future feature( thinking... )
procedure TfrmBaseCRUD.sqlSearchMasterBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  dm_rc.rc_DeleteFKTables( ed_Table_ItemSel.Text, ed_PK.Text, sqlSearchMaster.FieldByName( ed_PK.Text ).AsString );
end;
// v. 3.3.3.2
procedure TfrmBaseCRUD.sqlSearchMasterError(ASender, AInitiator: TObject; var AException: Exception);
begin
  inherited;
  dm_rc.rc_ShowError( AException.Message );
end;

end.

