﻿unit untDM_RC; // v. 4.0.0.0

interface

uses
  SysUtils, Classes, Controls,  TypInfo, // v. 4.0.0.0
  uniGUIBaseClasses, uniGUIClasses, uniGUITypes, uniGUIJSUtils, RTTI, Vcl.forms,
  uniComboBox, uniDBComboBox,uniDBLookupComboBox, uniDateTimePicker, uniDBDateTimePicker,  uniListBox,
  uniBitBtn, uniButton, uniEdit, UniDBEdit, UniSpeedButton, uniGUIFrame, uniGUIForm,  uniGUIDialogs, Messages, MainModule,
  uniGUIAbstractClasses,  uniGUIApplication, uniPanel, IniFiles, UniImage, uniLabel,  Unipagecontrol,
  uniMemo, uniDBMemo, uniGUIRegClasses, uniDBNavigator, uniScrollBox,
  UniDBRadioGroup, uniDBCheckBox, uniDBImage, uniDBText,
   // feedback: Mesut from Turkey
  {$ifdef LINUX}
  IdHTTP, IdSSLOpenSSL,
  {$endif}
  {$ifdef MSWINDOWS}
  Winapi.WinInet,
  {$endif}
  System.Types, System.Generics.Collections,
  Variants, pngimage, jpeg, vcl.stdctrls, uniCheckBox, uniTreeMenu,
  uconsts,
  //uconsts_msgs_portuguese, // v. 3.0.0.0
  uniHTMLFrame, uniURLFrame,
  uMenu_BASICS, uMenu_TOOLS, uMenu_MOVEMENT, uMenu_OTHERS, uMenu_REPORTS, mkm_menus,
  IdHashMessageDigest, uniDBGrid, Graphics,StrUtils, //untClsEnderecoCompleto, // v. 3.0.0.0'
  MaskUtils, DateUtils,
  //----------[[RESTDATAWARE
//  uRESTDWServerEvents,
//  uRESTDWBase,
//  uDWConstsData,
//  uRESTDWPoolerDB,
//  uDWAbout,
//  ServerUtils,
  //----------RESTDATAWARE]]
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdExplicitTLSClientServerBase, IdFTP, uniFileUpload,
  //ACBrPosPrinter, ACBrConsultaCNPJ, ACBrSocket, ACBrCEP, ACBrBase, ACBrMail, // v. 3.0.0.0
  uniSweetAlert, uniGridExporters, uniBasicGrid ;

type
  TExUniCustomDBGrid = class (TUniCustomDBGrid)
  end;

type
  tdm_rc = class(TDataModule)
    dsSqlGeneric: TDataSource;
    memRecords: TFDMemTable;
    memTemp: TFDMemTable;
    sqlGeneric: TFDQuery;
    sqlDelete: TFDQuery;
    sqlGetDataSet: TFDQuery;
    sqlNextID: TFDQuery;
    sqlSearchMaster: TFDQuery;
    sqlDS: TFDQuery;
    memStructure: TFDMemTable;
    sqlIns_Upd: TFDQuery;
    memUsers: TFDMemTable;
    memTotRecords: TFDMemTable;
    sqlGetRecords: TFDQuery;
    memUsersPermissions: TFDMemTable;
    memUsersPermissionsSecondary: TFDMemTable;
    memUsersPermissionsEdit: TFDMemTable;
    sqlCompanies: TFDQuery;
    dsSqlCompanies: TDataSource;
    memUsersSecondary : TFDMemTable;
    REGISTER_REQUEST: TFDQuery;
    IdFTP1: TIdFTP;
    memPK: TFDMemTable;
    memGridPK: TFDMemTable;
    dsMemPk: TDataSource;
    uniFileUp: TUniFileUpload;
    sqlLookUpSearch: TFDQuery;
    dsLookUpSearch: TDataSource;
    UniGridExcelExporter1: TUniGridExcelExporter;
    UniGridXMLExporter1: TUniGridXMLExporter;
    UniGridHTMLExporter1: TUniGridHTMLExporter;
    UniGridCSVExporter1: TUniGridCSVExporter;
    UniSweetAlert: TUniSweetAlert;
    procedure DataModuleCreate(Sender: TObject);
    procedure UniSweetAlertDismiss(Sender: TObject; const Reason: TDismissType);
    procedure UniSweetAlertConfirm(Sender: TObject);
  // v. 3.3.0.1
  private
    { Private declarations }
    C : TUniClientInfoRec;
    oSweetAlertFocus_Confirm, oSweetAlertFocus_Dismiss : TUniControl; // v. 3.3.1.0
    oSweetAlert : TUniSweetAlert; // v. 3.3.1.0
    cMSG_SEARCH_RECORD,
    cMSG_BUGERROR_DATABASE_CONN : string; //'Falha ao conectar com o Banco de Dados '
  public
    { Public declarations }
    procedure rc_CloseQuerys( pRoot : TComponent; pCloseALL, pCloseConnections : boolean);
    function  rc_OpenQuery( pQry : TFDQuery; pSW : boolean = false ) : Boolean;
    // deleta o reg. clicado no GRID DE PESQUISA PADRAO
    function  rc_DeleteActiveRecord( pTable : string; pQryMaster, pQrySearchMaster : TFDQuery; pId : integer; pShowMsgAfterDel : boolean = true ):boolean; // v. 3.1.0.60
    function  rc_DeleteRecord( pTable : String = ''; pWhere : string = ''):boolean; // v. 3.0.0.0
    function  rc_HasCodeRegistered( pTable : string; pId: string): string; // v. 3.0.0.0
    // retorna o conteudo de um campo qualquer
    // deixei informacao do TIPO como parametro para diminuir o acesso ao BD( principalmente ON LINE )
    function  rc_GetSQL( pDBType, pDefinition: string; pIni : integer = 0; pEnd : integer = 0 ; pS1 : string = ''): string; // v. 3.1.0.63
    //----------[[RESTDATAWARE
//    function  rc_ConnectRestDATAWARE( pDataBase: TRestDWDataBase; pIP, pLogin, pPass, pWelcome, pTag : string; pPort : integer ) : Boolean;
    //----------RESTDATAWARE]]
    function  rc_ConnectFireDAC( pDBType: String; pConn: TFDConnection; pSW : boolean = false ) : Boolean;
    function  rc_GetFIELD( pIsFireDac: Boolean; pField, pTable : string; pWhere: string = '' ) : variant; // v. 3.0.0.0
    // saber se o campo existe
    function  rc_FieldExists( pIsFireDac : Boolean; pField, pTable: string): Boolean; // v. 3.0.0.0
    // saber se uma tabela existe no BD
    function  rc_TableExists( pIsFireDac : Boolean; pTable: string): Boolean; // v. 3.0.0.0
    // retorna um REGISTRO/DATASET COMPLETO
    function  rc_GetRecord( pIsFireDac: Boolean; pAll : boolean; pSql: String ) : TFDMemTable; // v. 3.0.0.0
    // gerar prox. cod. sequencia
    function  rc_GetNextID( pIsFireDac : Boolean; pTable : string; pField : string; pWhere : string = '' ) : Integer; // v. 4.0.0.6
    procedure rc_ApplyUpdatesError( pQry : TFDQuery; pErrors : Integer; pMessage : string ); // v. 3.0.0.0
    // retorna o totalizador de registros de uma tabela
    function  rc_GetTotRecords ( pIsFireDac : Boolean; pTable : string; pWhere : string = '' ) : integer; // v. 3.0.0.0
    function  rc_ExecuteQuery( pIsFireDac : Boolean; pQry : string; pParams : array of Variant ): String; // v. 3.0.0.0
    function  rc_GetMD5(const pText:string ):string; // v. 3.0.0.0
    // controle de permissões
    function  rc_PermissionVerify( pFormName, pCaption: String; pPos: Integer ; pAdm : boolean = true; pShowMessage : boolean = true ): Boolean;  // v. 3.2.0.1
    //sweet alert and toast
    function  rc_ShowSweetAlert( pTitle, pText: String; pType: String = 'success'; pFormSender : TObject = nil; pControlFocusConfirm : string = ''; pControlFocusDismiss : string = '' ): Boolean; // v. 3.3.1.0
    function  rc_ShowSweetAlertQuestion( pTitle, pText, pSourceForm: String ): Boolean; // v. 3.0.0.0
    procedure rc_ShowSweetAlertSimple( pMessage: string); // v. 3.3.1.0
    procedure rc_ShowSweetAlertSuccess( pMessage: string ); // v. 3.3.1.0
    procedure rc_ShowSweetAlertWarning( pMessage: string ); // v. 3.3.1.0
    procedure rc_ShowSweetAlertInfo( pMessage: string ); // v. 3.3.1.0
    procedure rc_ShowSweetAlertError( pMessage: string ); // v. 3.3.1.0
    procedure rc_ShowToaster( pType, pMessage: string; pSound : boolean; pTransition: string; pDuration : integer = 2000 ); // v. 3.0.0.0
    procedure rc_ShowMessage( pMessage : string; pTipo : string = 'info'; pWidth : integer = 360; pHeight : integer = 360 ); // v. 3.3.1.0
    procedure rc_ShowSuccess( pMessage : string; pWidth : integer = 360; pHeight : integer = 360 ); // v. 3.3.1.0
    procedure rc_ShowInfo( pMessage : string; pWidth : integer = 360; pHeight : integer = 360 ); // v. 3.3.1.0
    procedure rc_ShowWarning( pMessage : string; pWidth : integer = 360; pHeight : integer = 360 ); // v. 3.3.1.0
    procedure rc_ShowError( pMessage : string ; pWidth : integer = 360; pHeight : integer = 360 ); // v. 3.3.1.0
    procedure rc_ShowYesNo( pMessage : string ; pWidth : integer = 360; pHeight : integer = 360 ); // v. 3.3.1.0
    procedure rc_ShowInputBox( pTitle : string ; pLab1, pEd1 : string ; pLab2 : string = ''; pEd2 : string = ''; bIsPassword : boolean = false );
    // devido a um 'erro' q nao descobri com SHOWMODAL, criei uma rotina exclusiva pra tratar
    // a exclusão de registros( confirmação )
    procedure rc_RecordDeleteCallBack(Sender: TComponent; AResult:Integer);
    procedure rc_GridDrawCell(Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure rc_GridColumnLock( pGrid : TUniDBGrid; pColumn : Integer );
    procedure rc_GridSortColumn( pGrid : TUniDBGrid; const FieldName: string; Dir: Boolean);
    procedure rc_ReportDateInterval( pPeriod: string ); // v. 3.0.0.0
    procedure rc_ResizeBlocks( pFrame : TObject; pRunBSRender : boolean = true; pRunAlignment : boolean = true; pScrollTop : boolean = true ); // v. 4.0.0.0
    procedure rc_BootStrapRender( pForm : TObject ; pUpdateDBFields : Boolean = False ; pOnlyThisObj : TObject = nil );
    procedure rc_AdjustEditColors( pForm : TObject );
    procedure rc_RenderControls(pForm: TObject; pOnlyThisObj : TUniControl = nil ); // v. 4.0.0.0
    // funções relacionadas ao lookup dinâmico( em conjunto com frmLookUP e frmLookUpLite )
    // eventos dinamicos
    // v. 3.1.0.61
    // Search and replace all "Dinamic..." prefix below and replace to "Dynamic..." - read the file: "README - v.03.01.00.61.txt"
    procedure DynamicBtnClick(Sender: TObject );
    procedure DynamicOnKeyPress(Sender: TObject; var Key: Char);
    procedure DynamicOnDblClick(Sender: TObject);
    procedure DynamicOnExit( sender: TObject );
    procedure DynamicOnExitLkpExtra( sender: TObject );
    procedure DynamicOnChangeValueForSetDS( sender : TObject );
    procedure DynamicOnClickLink( sender :TObject ); // v. 3.0.0.0
    procedure DynamicOnClickDial( sender :TObject ); // v. 3.0.0.0
    procedure DynamicOnClickMail( sender :TObject ); // v. 3.0.0.0( in development )
    procedure rc_LookUpSearchFilter(Sender: TObject ; pWhere: string = ''; pOrder : string = ''; pSearchFields : string = ''; pLookUpGridAttr : string = '' ); // 3.3.1.0
    procedure rc_RenderLookUpControls( pFrame: TObject );
    function  rc_LookUpSearch( pFrame : TObject ; pLkpbtnLkp: String ; pSender : TObject = nil; pLookUpGridAttr : string = '' ):Boolean;    // v. 3.3.1.0
    function  rc_LookUpSearchLite( pFrame : TObject; pLkpbtnLkp: String ; pSender : TObject = nil; pLookUpGridAttr : string = '' ):Boolean; // v. 3.3.1.0
    procedure rc_UpdateLookupCalled( pFrame : TObject; pTemp , pExtraResponseField , pExtraSearchField : string; pIsExtraSearch : boolean; LkpDBPesqExtra, LkpDBCod, LkpDBEdit : TUniDBEdit; lkpQuery, pSQLMaster : TFDQuery; iTag : integer ); // v. 3.0.0.0
    function  rc_GetLookUpField( pFrame, pLkp : TObject; pField: string ): Variant;
    // associa o btnLkp ao lkp_COD ou lkp_pesqextra
    procedure rc_LookUpClickButton( pFrame : TObject ; pEdit : string ); //overload;
    // atualiza o conteúdo dos lookups na tela
    procedure rc_LookUpUpdateData( pFrame: TObject; pLkp : TUniControl = nil; pClearLkpOnlySearch : boolean = false ); // v. 4.0.0.0 onlysearch
    // enabled on / off lookup controls
    procedure rc_LookUpControlsEnabled( pFrame: TObject; pLkp : TUniControl; pState: Boolean );
    procedure rc_ObjectEnabled( pFrame: TObject; pObj : TUniControl; pState: Boolean);
    procedure rc_LookUpControlsVisible( pFrame: TObject; pLkp : TUniControl; pState: Boolean);
    procedure rc_LookUpControlsClear( pFrame: TObject; pLkp : TUniControl); // v. 3.3.3.1
    // retorna se conectou com o BD
    function  rc_ProcessFirstConnection ( pSW : boolean = false ): Boolean;
    procedure rc_ProcessLogin( pUser, pPassWord : string; pMobile : boolean ); // v. 3.0.0.0
    // pesquisa de CEP em QUALQUER FORM/FRAME via JQUERY e atualiza a QUERY com o resultado do JSON  ( only for Brazil )
    procedure rc_SearchPostalCodeCEP( pCep, pType, pFormFrame : string ; pQry : TFDQuery = nil ); // v. 3.0.0.0
    procedure rc_MaskAdjust( pDbEdit : TObject; pMaskType : TRCMaskType; pCustomMask : string = '' ); // v. 3.0.0.0
    // retorna o componente pai para retornar a posição absoluta ( x, y )
    procedure rc_GetObjParent( pForm:TObject; pObj : TUniControl; out iLeft, iTop : integer; pParentComp : TComponent );
    procedure rc_ShowTour( pForm:TObject );
    procedure rc_NextTour(Sender: TObject; pForm:TObject );
    function rc_GetPrimaryKey( pTable : string ) : string;
    procedure rc_FillSearchFieldsCRUD( pFrame: TObject; pName, pField, pDescription: String);  // v. 3.0.0.0
    // preenche um combobox
    procedure rc_FillComboBox( pCbx: TObject; pTable, pField, pWhere : String; pFiles : string = '' ); // v. 4.0.0.0
    // salva um BLOB
    function  rc_SaveBlobImg( pImg : TUniImage; pPng : Boolean; pTable, pField , pWhere : string ) : Boolean;
    // Carrega um BLOB
    function  rc_LoadBlobImg(pImg: TUniImage; pPng: Boolean; pQuery : TFDQuery; pField : string): Boolean;
    // centraliza um modal via JS
    function  rc_OnResize( pFormName : string ; pCenter : boolean = true ) : string;
    // abre um LINK
    procedure rc_OpenLink( pLink : string; pTarget : string = '_blank' );
    procedure rc_SetFocus( pObj : TObject );
    function  rc_ObjectExists( pName: string): boolean;
    function  rc_PrepareDetailForm( pForm : TObject; pTable_Detail, pCode_ID_Field, pTitle : string ): integer;
    // v. 3.2.0..7 // experimental
    //function  rc_GetURLContent(pURL: string): string;
    // Capturar informações sobre dispositivo que está acessando a aplicação
    // Capture information about device accessing the application
    function  rc_GetDeviceType : string;
    // Atualizar valores referentes a resolução para auxílio no controle de responsividade
    // Update resolution values to aid in responsiveness control
    function rc_ScreenUpdate( pMainMenuExists : boolean = true ) : TObject; // v. 3.0.0.0
    procedure rc_SwtEnabled( pFrame : TObject; pObj : string; pState : Boolean; pRender : Boolean = false );
    procedure rc_ChkEnabled( pFrame : TObject; pObj : string; pState : Boolean; pRender : Boolean = false  );
    procedure rc_RgpEnabled( pFrame : TObject; pObj : string; pState : Boolean; pRender : Boolean = false  );
    procedure rc_SwtCheck( pFrame : TObject; pObj : string; pState : Boolean; pRender : Boolean = false );
    procedure rc_ChkCheck( pFrame : TObject; pObj : string; pState : Boolean; pRender : Boolean = false  );
    procedure rc_RgpCheck( pFrame : TObject; pObj : string; pState : Boolean; pRender : Boolean = false  );
    procedure rc_RgpInitialize( pFrame : TObject );
    function  rc_GetItemIndexFromRgp( pLabel : TUniLabel ) : Integer;
    function  rc_GetValueFromRgp( pLabel : TUniLabel ) : String;
    function  rc_GetTagFromChk( pLabel : TUniLabel ) : Integer;
    function rc_GetParamFromRGP( pName : string; pParam: TRCRGPParamType ): string;
    procedure rc_ApplyEditMasks( pForm : TObject );
    // gerar um LOG com o ultimo erro ocorrido
    // generate a LOG with the last error occurred
    procedure rc_ErrorLog( E: Exception );
    function rc_LoadConfig : integer; // v. 3.0.0.0
    procedure rc_LoadTheme( pName:String );
    procedure rc_SaveTheme( pName:String );
    procedure rc_BuildMainMenu( pSearch : string; pTreeMenu : TUniTreeMenu );  // v. 3.0.0.0
    function rc_IntToString( pInt : Integer ): String;
    function rc_ForceDirectories(pPath: string): boolean;
    function rc_GetIndexFromArray( pStr : string; pArray : Array of string) : integer;
    function rc_StripHtmlTags( pHtml : string ) : string;
    procedure rc_DBGridUpdate(pGrid: TUniDBGrid; pRefresh : boolean; pCheckForceFit : boolean = false ); // v. 4.0.0.0
    procedure rc_DBGridHidePaginationBar( pGrid : TUniDBGrid ) ; // thanks Eduardo Belo
    function rc_ExtractFieldNameFromSearchItem( pItem : string; pAlias : boolean = false ) : string;
    // v. 3.0.0.0
    procedure rc_BitmapClear( pImgObj : TUniImage ); // windows and linux
    procedure rc_DBGridExport( pGrid : TUniDBGRID; pType : TRCExportType );
    procedure rc_DBGridUpdateAll( pObj : TObject ; pRefresh : boolean = true; pRefreshPaginator : boolean = false; pCheckForceFit : boolean = false ); // v. 4.0.0.0
    procedure rc_ProtectForm( sender : TObject );
    // v. 3.1.0.60
    function rc_DeleteFKTables( pTable : string; pPKField, pPKValue : string ):boolean;
    procedure rc_UpdateDetailField( pErrors : integer; pStatus : string; pQuery : TFDQuery; pField : string; pValue : integer );
    //function rc_GetJSNameID( pObj:TObject ):string; // v. 3.1.0.63
    procedure rc_GridFieldGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    // v. 3.1.0.61
    function rc_CloseTab( pForm : TObject; pPgCtrlName, pTabName : string ) : boolean;
    // v. 3.1.0.63
    function rc_GetJSName( pObj:TObject ):string;
    function rc_GetJSID( pObj:TObject ):string;
    function rc_ExtEvtKeyDownOnlyNumbers:string; // thanks Eduardo Belo
    // v. 3.2.0.7
    procedure DynamicCollapse( Sender : TObject );
    // v. 3.3.0.1
    procedure rc_ConsoleLog(pText: string);
    // v. 3.3.3.0
    function rc_GetActiveFormFrameNameInMainTab:string;
    // v. 4.0.0.0 - paginator
    procedure DynamicGridPaginatorSearch( Sender : TObject );
    procedure DynamicGridPaginatorRefresh( Sender : TObject );
    procedure DynamicGridPaginatorFirst( Sender : TObject );
    procedure DynamicGridPaginatorPrior( Sender : TObject );
    procedure DynamicGridPaginatorNext( Sender : TObject );
    procedure DynamicGridPaginatorLast( Sender : TObject );
    procedure DynamicGridPaginatorGoPageDown( Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DynamicGridPaginatorOnRecCount(Sender: TUniDBGrid; var RecCount: Integer);
    procedure DynamicGridPaginatorOnStateChange(Sender: TObject );
    //procedure DynamicGridPaginatorGoPage( Sender : TObject );
    procedure rc_GridPaginatorUpdatePages( pGrid : TUniDBGrid );
    procedure rc_GridPaginatorSearch( pGrid : TUniDBGrid );
    procedure rc_GridPaginatorRefresh( pGrid : TUniDBGrid );
    procedure rc_GridPaginatorFirst( pGrid : TUniDBGrid );
    procedure rc_GridPaginatorPrior( pGrid : TUniDBGrid );
    procedure rc_GridPaginatorNext( pGrid : TUniDBGrid );
    procedure rc_GridPaginatorLast( pGrid : TUniDBGrid );
    procedure rc_GridPaginatorGoPageKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rc_GridPaginatorGoPage( pGrid : TUniDBGrid; pPage : TUniEdit; pTotPages : TUniLabel; bInit : Boolean = false );
    procedure rc_GridPaginatorUpdateControls( pGrid : TUniDBGrid; iPageNumber, iCurrPage : integer );
    //
    function rc_FindDataModule( pName : string ) : TDataModule;
  end;

function dm_rc: tdm_rc;

implementation

{$R *.dfm}

uses
  UniGUIVars, uniGUIMainModule, ServerModule,
  mkm_func_web,  str_func,
  Main, untFrmInputBox, untFrmMessage, untFrmLookUp, // v. 3.0.0.0
  Login,
  mkm_dbfuncs, // v. 4.0.0.0
  untFrmLookUp_Lite, mkm_layout, mkm_gridblock, mkm_login; // v. 3.2.0.0

function dm_rc: tdm_rc;
begin
  Result := tdm_rc(mm.GetModuleInstance(tdm_rc));
end;
// v. 4.0.0.0
procedure tdm_rc.DynamicBtnClick(Sender: TObject );
var
   LkpDBEdit : TUniDBEdit;
   // v. 3.3.1.0
   iPos,iAdd : integer;
   bProceed : boolean;
   LkpDBEditFilter,
   LkpDBEditFilterCodID : TUniDBEdit;
   cFilter         ,
   cFilterField,
   cFilterFieldType,
   cFilterType     ,
   cFilterMsgEmpty ,
   cFilterSearchField,
   cFilterOrder,
   cFilterGridAttr,
   cTemp : string;
   pDs : TDataSource;
   // v. 4.0.0.0
   pDM : TDataModule;
   bOnlySearch : boolean;
begin
     bProceed := true;
     if ( sender is TUniSpeedButton ) then
        if lowercase( Copy( TUniSpeedButton( sender ).Name, 1, 6 ) ) = 'btnlkp' then
        begin
             if rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;

             // Quando o lookup precisar ser filtrado, informe aqui antes de
             // chamar a função
             mm.varC_Where := '';
             mm.varC_Order := '';
             // pode adicionar mais campos para serem pesquisados no lookup ou
             // deixe em branco pra montar o padrão
             mm.varC_Search_Fields := '';

             cTemp := StringReplace( lowercase( TUniSpeedButton( sender ).Name ) , 'btnlkp' , 'edlkp' , [rfReplaceAll] );
             LkpDBEdit := TUniDBEdit( TUniSpeedButton( sender ).owner.FindComponent( cTemp ) );
             // v. 3.3.1.0
             (*
             lkpfilter:quoted(uf=edLkpUFS<text>)
             lkpfilter-empty:Selecione uma UF|
             lkpfilter-order: |
             lkpfilter-searchfields: |
             lkpfilter-gridattr: |
             lkpfilter-settext:ed_lkp_Email field:email |
             lkpfilter-settext:ed_lkp_fone  field:fone1 |
             lkpfilter-settext:ed_lkp_block field:bloqueado |
             *)
             cFilter            := rc_GetHintProperty( 'lkpfilter:' , LkpDBEdit.Hint , false, true);
             cFilterType        := '';
             cFilterMsgEmpty    := '';
             cFilterField       := '';
             cFilterFieldType   := '';
             cFilterSearchField := '';
             cFilterOrder       := '';
             cFilterGridAttr    := '';
             if not cFilter.IsEmpty then
             begin
                  cFilterSearchField := rc_GetHintProperty( 'lkpfilter-searchfields:' , LkpDBEdit.Hint , false, true);
                  cFilterOrder       := rc_GetHintProperty( 'lkpfilter-order:' , LkpDBEdit.Hint , false, true);
                  cFilterGridAttr    := rc_GetHintProperty( 'lkpfilter-gridattr:' , LkpDBEdit.Hint , false, true);
                  cFilterMsgEmpty    := rc_GetHintProperty( 'lkpfilter-empty:' , LkpDBEdit.Hint , false, true);
                  // <text>: edLkpAAAA.Text or <id>: edLkpAAAA_CodID.Text
                  if Pos( '<text>', cFilter ) > 0 then
                     cFilterType        := '<text>'
                  else
                  if Pos( '<id>', cFilter ) > 0 then
                     cFilterType        := '<id>'
                  else
                     cFilterType        := '<text>';

                  cFilter            := Trim( StringReplace( cFilter, cFilterType, '', [rfReplaceAll] ) ) + ' ';
                  if copy( cFilter, 1, 7 ) = 'quoted(' then
                  begin
                     cFilterFieldType := '<str>';
                     cFilter          := Trim( Copy( cFilter, 8 ));
                     cFilter          := Trim( Copy( cFilter, 1, Length( cFilter ) - 1 ) );
                  end
                  else
                  begin
                     cFilterFieldType := '<0>';
                     cFilter          := Trim( Copy( cFilter, 2 ));
                     cFilter          := Trim( Copy( cFilter, 1, Length( cFilter ) - 1 ) );
                  end;
                  iAdd := 1;
                  iPos := Pos( '<>', cFilter );
                  if iPos = 0 then
                  begin
                     iPos := Pos( '>=', cFilter );
                     if iPos = 0 then
                     begin
                        iPos := Pos( '<=', cFilter );
                        if iPos = 0 then
                        begin
                           iPos := Pos( '=', cFilter );
                           iAdd := 0;
                        end;
                     end;
                  end;

                  if iPos > 0 then
                  begin
                     cFilterField     := Trim( Copy( cFilter, 1, iPos + iAdd  ) );
                     cFilter          := Trim( Copy( cFilter, iPos + 1 + iAdd ) );
                  end
                  else
                  begin
                     dm_rc.rc_ShowError('"lkpfilter:" missing operator.');
                     Abort;
                  end;

                  LkpDBEditFilter := TUniDBEdit( LkpDBEdit.owner.FindComponent( cFilter ) );
                  LkpDBEditFilterCodID := TUniDBEdit( LkpDBEdit.owner.FindComponent( cFilter + '_CodID' ) );
                  if cFilterType = '<text>' then
                  begin
                       if LkpDBEditFilter.Text = '' then
                       begin
                          bProceed := false;
                          dm_rc.rc_ShowWarning( cFilterMsgEmpty );
                          rc_SetFocus( LkpDBEditFilter );
                       end;
                  end;
                  if cFilterType = '<id>' then
                  begin
                       if LkpDBEditFilterCodID.Text = '' then
                       begin
                          bProceed := false;
                          dm_rc.rc_ShowSweetAlertWarning( cFilterMsgEmpty );
                          if LkpDBEditFilterCodID.Visible then
                          begin
                             dm_rc.rc_ShowWarning( cFilterMsgEmpty );
                             rc_SetFocus( LkpDBEditFilterCodID );
                          end;
                       end;
                  end;
             end;
             // v. 3.3.1.0
             if bProceed then
             begin
                cTemp := 'dsMaster';
                if Pos( ' ds:' , LkpDBEdit.Hint ) > 0  then
                begin
                   cTemp := Copy( LkpDBEdit.Hint, Pos( ' ds:' , LkpDBEdit.Hint ) + 4, 200 );
                   cTemp := StringReplace( cTemp, ']]', '', [rfReplaceAll] ) + ' ';
                   cTemp := Trim( Copy( cTemp, 1, Pos( ' ' , cTemp ) - 1 ) );
                end;
                // v. 4.0.0.0
                If Pos( '.', cTemp ) > 0 then
                begin
                    pDM := nil;
                    pDM := rc_FindDataModule( Copy( cTemp, 1, pos( '.', cTemp ) - 1 ) );
                    cTemp := Copy( cTemp, pos( '.', cTemp ) + 1 );
                end;
                if pDM <> nil then
                   pDS  := TDataSource( pDM.FindComponent( cTemp ) )
                else
                   pDS  := TDataSource( TUniSpeedButton( sender ).owner.FindComponent( cTemp ) );
                //pDs   := TDataSource( TUniSpeedButton( sender ).owner.FindComponent( cTemp ) );

                // v. 4.0.0.0 onlysearch
                bOnlySearch := Pos( 'lkponlysearch', LkpDBEdit.Hint ) > 0 ;
                if ( pDs <> nil ) or ( bOnlySearch ) then
                begin
                   if ( pDs.State in [dsEdit, dsInsert] ) or ( bOnlySearch ) then
                   begin
                     // v. 4.0.0.0
                     if cFilterField.IsEmpty then
                     begin
                        // v. 4.0.0.0 onlysearch
                        //if LkpDBEdit.tag = 0 then
                        if TUniSpeedButton( sender ).Tag = 0 then
                           rc_LookUpSearch( TUniSpeedButton( sender ).owner, TUniSpeedButton( sender ).Name , Sender )
                        else
                        begin
                           TUniSpeedButton( sender ).Tag := 0;//varIIF( bOnlySearch, 0, TUniSpeedButton( sender ).Tag );
                           rc_LookUpSearchLite( TUniSpeedButton( sender ).owner, TUniSpeedButton( sender ).Name , Sender );
                           TUniSpeedButton( sender ).Tag := 1;//varIIF( bOnlySearch, 1, TUniSpeedButton( sender ).Tag );
                        end;
                     end
                     else
                     begin
                         if cFilterFieldType = '<str>' then
                            rc_LookUpSearchFilter( TUniSpeedButton( sender ), cFilterField + QuotedStr( LkpDBEditFilter.Text ), cFilterOrder, cFilterSearchField, cFilterGridAttr )
                         else
                         if cFilterFieldType = '<0>' then
                            rc_LookUpSearchFilter( TUniSpeedButton( sender ), cFilterField + LkpDBEditFilter.Text, cFilterOrder, cFilterSearchField, cFilterGridAttr );
                     end;
                   end;
                end;
             end;
        end;
end;
// v. 3.2.0.7
procedure tdm_rc.DynamicCollapse( Sender: TObject );
begin
     rc_Collapse( Sender, TComponent( Sender ).Owner, TUniControl( sender ) );
end;
// v. 4.0.0.0
procedure tdm_rc.DynamicOnKeyPress(Sender: TObject; var Key: Char);
// v. 3.2.0..7
var
   cTemp : string;
   pDs : TDataSource;
   // v. 4.0.0.0
   pDM : TDataModule;
   bOnlySearch : boolean;
begin
     if ( sender is TUniDBEdit ) then
        if lowercase( Copy( TUniDBEdit( sender ).Name, 1, 5 ) ) = 'edlkp' then
        begin
           // v. 3.2.0..7
           //if Key in [ ' ', '0'..'9', 'a'..'z', 'A'..'Z' ] then
           if CharInSet( Key , [ ' ', '0'..'9', 'a'..'z', 'A'..'Z' ] ) then
           begin
               Key := #0;

               if rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;

               // o SUFIXO do campo lookup e do Button de pesquisa devem ser iguais
               //
               // Ex: edLkpCLIENTES e btnLkpCLIENTES
               cTemp := 'dsMaster';
               if Pos( ' ds:' , TUniDBEdit( sender ).Hint ) > 0  then
               begin
                  cTemp := Copy( TUniDBEdit( sender ).Hint, Pos( ' ds:' , TUniDBEdit( sender ).Hint ) + 4, 200 );
                  cTemp := StringReplace( cTemp, ']]', '', [rfReplaceAll] ) + ' ';
                  cTemp := Trim( Copy( cTemp, 1, Pos( ' ' , cTemp ) - 1 ) );
               end;
               // v. 4.0.0.0
               If Pos( '.', cTemp ) > 0 then
               begin
                   //for F := 0 to UniApplication.FormRegistered( ) - 1 do
                   pDM := nil;
                   pDM := rc_FindDataModule( Copy( cTemp, 1, pos( '.', cTemp ) - 1 ) );
                   cTemp := Copy( cTemp, pos( '.', cTemp ) + 1 );
               end;
               if pDM <> nil then
                  pDS  := TDataSource( pDM.FindComponent( cTemp ) )
               else
                  pDS  := TDataSource( TUniDBEdit( sender ).owner.FindComponent( cTemp ) );
               //pDs   := TDataSource( TUniDBEdit( sender ).owner.FindComponent( cTemp ) );

               // v. 4.0.0.0 onlysearch
               bOnlySearch := Pos( 'lkponlysearch', TUniDBEdit( sender ).Hint ) > 0 ;
               if ( pDs <> nil ) or ( bOnlySearch ) then
                  if ( pDs.State in [dsEdit, dsInsert] ) or ( bOnlySearch ) then
                     TUniSpeedButton( TUniDBEdit( sender ).owner.FindComponent( 'btnLkp' + Copy( TUniDBEdit( sender ).Name, 6, 100 ) ) ).Click;
           end;
        end;
end;
// v. 4.0.0.0
procedure tdm_rc.DynamicOnDblClick(Sender: TObject);
var
   cTemp,
   cTableName, // v. 4.0.0.0
   cFrm : string;
   LkpEDIT : TUniControl;
begin
     if rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;

     if ( sender is TUniDBEdit ) then
     begin
        if lowercase( Copy( TUniDBEdit( sender ).Name, 1, 5 ) ) = 'edlkp' then
        begin
            // o SUFIXO do campo lookup e do Button de pesquisa devem ser iguais
            //
            // Ex: edLkpCLIENTES e btnLkpCLIENTES
            if UniApplication.FindComponent('MainForm' ) <> nil then // v. 3.0.0.0
            begin
               // v. 4.0.0.0
               cTableName := rc_GetHintProperty( 'tbl:' , TUniDBEdit( sender ).Hint , true, true);
               if cTableName = '' then
                  cTableName := Copy( TUniDBEdit( sender ).Name, 6, 100 );

               MainForm.rc_AddFormFrameInTab( nil, '', cTableName , '' , false, false ); // v. 4.0.0.0
            end;
        end;
     end
     else
     if ( sender is TUniSpeedButton ) then
        if lowercase( Copy( TUniSpeedButton( sender ).Name, 1, 9 ) ) = 'btnlkpadd' then
        begin
            cTemp   := lowercase( TUniSpeedButton( sender ).Name );
            cTemp   := StringReplace( cTemp , 'btnlkpadd' , '' , [rfReplaceAll] );
            LkpEDIT := TUniControl( TUniDBEdit( sender ).owner.FindComponent( 'edlkp' + cTemp ) );

            // o SUFIXO do campo lookup e do Button de pesquisa devem ser iguais
            // Ex: edLkpCLIENTES e btnLkpCLIENTES
            cFrm := '';
            if LkpEDIT <> nil then
               if Pos( '+:', LkpEDIT.Hint ) > 0 then
               begin
                  cFrm := Copy( LkpEDIT.hint , Pos( '+:', LkpEDIT.Hint ) + 2, 200 );
                  cFrm := Trim( StringReplace( cFrm, ']]', '', [rfReplaceAll] ) ) + ' ' ; // v. 3.2.0.4
                  cFrm := Trim( Copy( cFrm , 1, Pos( ' ', cFrm ) ) );                     // v. 3.2.0.4
               end;

            if UniApplication.FindComponent('MainForm' ) <> nil then
            begin
               // v. 4.0.0.0
               cTableName := rc_GetHintProperty( 'tbl:' , LkpEDIT.Hint , true, true);
               if cTableName = '' then
                  cTableName := Copy( TUniSpeedButton( sender ).Name, 10, 100 );

               MainForm.rc_AddFormFrameInTab( nil, '', cTableName + '_ADD-' + cFrm , cFrm , false, false ); // v. 4.0.0.0
            end;
        end;
end;
// v. 4.0.0.0
procedure tdm_rc.DynamicOnExit(sender: TObject );
var
   cTemp : string;
   LkpEDIT : TUniControl;
   LkpBtn : TUniSpeedButton;
   pDs : TDataSource;
   // v. 4.0.0.0
   pDM : TDataModule;
   bOnlySearch : boolean;
begin
     if ( sender is TUniDBEdit ) then
        if  Pos( '_codid' , lowercase( TUniDBEdit( sender ).Name ) ) > 0 then
        begin
           if rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;

           // Associar o conteudo do campo ATUAL pra montar a query de FILTRO
           mm.varC_WhereExtra := ' [[pk]] = ' + TFDQuery( TUniDBEdit( sender ).DataSource.DataSet ).FieldByName( TUniDBEdit( sender ).DataField ).AsString ;

           // Quando o lookup precisar ser filtrado, informe aqui antes de chamar a função
           mm.varC_Where := '';
           mm.varC_Order := '';

           // pode adicionar mais campos para serem pesquisados no lookup ou deixe em branco pra montar o padrão
           mm.varC_Search_Fields := '';

           cTemp   := StringReplace( lowercase( TUniDBEdit( sender ).Name ) , 'edlkp' , 'btnlkp' , [rfReplaceAll] );
           cTemp   := StringReplace( cTemp , '_codid' , '' , [rfReplaceAll] );
           LkpBtn  := TUniSpeedButton( TUniDBEdit( sender ).owner.FindComponent( cTemp ) );

           cTemp   := lowercase( TUniDBEdit( sender ).Name );
           cTemp   := StringReplace( cTemp , '_codid' , '' , [rfReplaceAll] );
           LkpEDIT := TUniControl( TUniDBEdit( sender ).owner.FindComponent( cTemp ) );

           cTemp := 'dsMaster';
           if Pos( ' ds:' , TUniControl( LkpEDIT ).Hint ) > 0  then
           begin
              cTemp := Copy( TUniControl( LkpEDIT ).Hint, Pos( ' ds:' , TUniControl( LkpEDIT ).Hint ) + 4, 200 );
              cTemp := StringReplace( cTemp, ']]', '', [rfReplaceAll] ) + ' ';
              cTemp := Trim( Copy( cTemp, 1, Pos( ' ' , cTemp ) - 1 ) );
           end;
           // v. 4.0.0.0
           If Pos( '.', cTemp ) > 0 then
           begin
               pDM := nil;
               pDM := rc_FindDataModule( Copy( cTemp, 1, pos( '.', cTemp ) - 1 ) );
               cTemp := Copy( cTemp, pos( '.', cTemp ) + 1 );
           end;
           if pDM <> nil then
              pDS  := TDataSource( pDM.FindComponent( cTemp ) )
           else
              pDS  := TDataSource( TUniDBEdit( sender ).owner.FindComponent( cTemp ) );
           //pDs   := TDataSource( TUniDBEdit( sender ).owner.FindComponent( cTemp ) );

           // v. 4.0.0.0 onlysearch
           bOnlySearch := Pos( 'lkponlysearch', TUniDBEdit( sender ).Hint ) > 0 ;
           if ( pDs <> nil ) or ( bOnlySearch ) then
              if ( pDs.State in [dsEdit, dsInsert] ) or ( bOnlySearch ) then
              begin
                // indica q é uma pesquisa DIGITADA
                // a diferença é que CASO o resultado seja apenas 1 registro, não será exibido o LOOKUP PADRAO
                //LkpBtn.Tag := 1; // v. 4.0.0.0 onlysearch

                // acionar o click para montar o WHERE...
                LkpBtn.Click;

                if LkpEDIT <> nil then
                begin
                   LkpEDIT.SetFocus;
                end;
              end;
        end;
end;
// v. 4.0.0.0
procedure tdm_rc.DynamicOnExitLkpExtra(sender: TObject );
var
   cTemp : string;
   LkpEDIT : TUniControl;
   LkpBtn : TUniSpeedButton;
   pDs : TDataSource;
   // v. 4.0.0.0
   pDM : TDataModule;
   bOnlySearch : boolean;
begin
     if ( sender is TUniDBEdit ) then
        if  Pos( '_pesqextra' , lowercase( TUniDBEdit( sender ).Name ) ) > 0 then
        begin
           if rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;
           // v. 4.0.0.0
           if TFDQuery( TUniDBEdit( sender ).DataSource.DataSet ).FieldByName( TUniDBEdit( sender ).DataField ).AsString <> '' then
           begin

              // #SEQCONTAPADRAO=SEQNIVEL
              //   pesquisa extra para o campo SEQCONTAPADRAO da tabela de destino
              //   mas que equivale ao campo SEQNIVEL da tabela ORIGEM a ser pesquisada
              if DataTypeIsNumber( TUniDBEdit( sender ).Field.DataType ) then
                 mm.varC_WhereExtra := ' tab.' + TUniDBEdit( sender ).Hint + ' = ' + ( TFDQuery( TUniDBEdit( sender ).DataSource.DataSet ).FieldByName( TUniDBEdit( sender ).DataField ).AsString )
              else
              if DataTypeIsDateTime( TUniDBEdit( sender ).Field.DataType ) then
                 mm.varC_WhereExtra := ' tab.' + TUniDBEdit( sender ).Hint + ' = ' + QuotedStr( FormatDateTime( 'dd.mm.yyyy', StrToDateDef( TFDQuery( TUniDBEdit( sender ).DataSource.DataSet ).FieldByName( TUniDBEdit( sender ).DataField ).AsString, 0 ) ) )
              else
              if DataTypeIsString( TUniDBEdit( sender ).Field.DataType ) then
                 mm.varC_WhereExtra := ' tab.' + TUniDBEdit( sender ).Hint + ' = ' + QuotedStr( TFDQuery( TUniDBEdit( sender ).DataSource.DataSet ).FieldByName( TUniDBEdit( sender ).DataField ).AsString );

              // Quando o lookup precisar ser filtrado, informe aqui antes de
              // chamar a função
              mm.varC_Where := '';
              mm.varC_Order := '';

              // pode adicionar mais campos para serem pesquisados no lookup ou
              // deixe em branco pra montar o padrão
              // v. 4.0.0.0
              mm.varC_Search_Fields := TUniDBEdit( sender ).Hint + ';';
              //if Pos( TUniDBEdit( sender ).Hint + ';', mm.varC_Search_Fields ) = 0 then
              //   mm.varC_Search_Fields := TUniDBEdit( sender ).Hint + ';' + mm.varC_Search_Fields;

              cTemp := StringReplace( lowercase( TUniDBEdit( sender ).Name ) , 'edlkp' , 'btnlkp' , [rfReplaceAll] );
              cTemp := StringReplace( cTemp , '_pesqextra' , '' , [rfReplaceAll] );
              LkpBtn := TUniSpeedButton( TUniDBEdit( sender ).owner.FindComponent( cTemp ) );

              cTemp   := lowercase( TUniDBEdit( sender ).Name );
              cTemp   := StringReplace( cTemp , '_pesqextra' , '' , [rfReplaceAll] );
              LkpEDIT := TUniControl( TUniDBEdit( sender ).owner.FindComponent( cTemp ) );

              cTemp := 'dsMaster';
              if Pos( ' ds:' , TUniControl( LkpEDIT ).Hint ) > 0  then
              begin
                 cTemp := Copy( TUniControl( LkpEDIT ).Hint, Pos( ' ds:' , TUniControl( LkpEDIT ).Hint ) + 4, 200 );
                 cTemp := StringReplace( cTemp, ']]', '', [rfReplaceAll] ) + ' ';
                 cTemp := Trim( Copy( cTemp, 1, Pos( ' ' , cTemp ) - 1 ) );
              end;
              // v. 4.0.0.0
              If Pos( '.', cTemp ) > 0 then
              begin
                  pDM := nil;
                  pDM := rc_FindDataModule( Copy( cTemp, 1, pos( '.', cTemp ) - 1 ) );
                  cTemp := Copy( cTemp, pos( '.', cTemp ) + 1 );
              end;
              if pDM <> nil then
                 pDS  := TDataSource( pDM.FindComponent( cTemp ) )
              else
                 pDS  := TDataSource( TUniDBEdit( sender ).owner.FindComponent( cTemp ) );
              //pDs   := TDataSource( TUniDBEdit( sender ).owner.FindComponent( cTemp ) );

              // v. 4.0.0.0 onlysearch
              bOnlySearch := Pos( 'lkponlysearch', TUniDBEdit( sender ).Hint ) > 0 ;
              if ( pDs <> nil ) or ( bOnlySearch ) then
                 if ( pDs.State in [dsEdit, dsInsert] ) or ( bOnlySearch ) then
                 begin
                   // indica q é uma pesquisa DIGITADA
                   // a diferença é que CASO o resultado seja apenas 1 registro, não será exibido o LOOKUP PADRAO
                   //LkpBtn.Tag := 1; // v. 4.0.0.0 onlysearch

                   // acionar o click para montar o WHERE...
                   LkpBtn.Click;

                   if LkpEDIT <> nil then
                   begin
                      LkpEDIT.SetFocus;
                   end;
                 end;
           end;
        end;
end;
//chamada do lookup com FILTROS
// v. 3.3.1.0
procedure tdm_rc.rc_LookUpSearchFilter(Sender: TObject ; pWhere, pOrder, pSearchFields : string; pLookUpGridAttr : string );
var
   LkpDBEditFilter,
   LkpDBEditFilterCodID,
   LkpDBEdit : TUniDBEdit;
   cTemp : string;
   pDs : TDataSource;
   // v. 4.0.0.0
   pDM : TDataModule;
   bOnlySearch : boolean;
begin
     if ( sender is TUniSpeedButton ) then
     begin
        if lowercase( Copy( TUniSpeedButton( sender ).Name, 1, 6 ) ) = 'btnlkp' then
        begin
             if rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;

             if ( pWhere <> '' ) and ( Pos( 'where' , lowercase( pWhere ) ) = 0 ) then
                pWhere := ' WHERE ' + pWhere;

//             if ( pSearchFields <> '' ) and ( Copy( ReverseString( pSearchFields ), 1, 1 ) <> ';' ) then
//                pSearchFields := pSearchFields + ';';

//             mm.varC_Where := pWhere;
//             mm.varC_Order := pOrder;
//             mm.varC_Search_Fields := pSearchFields;

             cTemp := StringReplace( lowercase( TUniSpeedButton( sender ).Name ) , 'btnlkp' , 'edlkp' , [rfReplaceAll] );
             LkpDBEdit := TUniDBEdit( TUniSpeedButton( sender ).owner.FindComponent( cTemp ) );
             // v. 3.2.0.0
             // future feature
//             if Pos( '{',LkpDBEdit.hint) > 0 then
//             begin
//                  LkpDBEdit.hint := StringReplace( LkpDBEdit.hint, '}',
//                                                   StringReplace( ',' + pSearchFields, ';',',',[rfReplaceAll] ) + '}' ,
//                                                   [rfReplaceAll] );
//             end;
             if ( pSearchFields <> '' ) and ( Copy( ReverseString( pSearchFields ), 1, 1 ) <> ';' ) then
                pSearchFields := pSearchFields + ';';

             mm.varC_Where := pWhere;
             mm.varC_Order := pOrder;
             // v. 4.0.0.0
             mm.varC_Search_Fields := pSearchFields;
             //if ( mm.varC_Search_Fields = '' ) or ( ( Pos( mm.varC_Search_Fields, pSearchFields ) = 0 ) and ( strTokenCount( mm.varC_Search_Fields, ';' ) = 1 ) ) then
             //   mm.varC_Search_Fields := pSearchFields + mm.varC_Search_Fields;
             // v. 3.3.1.0
             cTemp := 'dsMaster';
             if Pos( ' ds:' , LkpDBEdit.Hint ) > 0  then
             begin
                cTemp := Copy( LkpDBEdit.Hint, Pos( ' ds:' , LkpDBEdit.Hint ) + 4, 200 );
                cTemp := StringReplace( cTemp, ']]', '', [rfReplaceAll] ) + ' ';
                cTemp := Trim( Copy( cTemp, 1, Pos( ' ' , cTemp ) - 1 ) );
             end;
             // v. 4.0.0.0
             If Pos( '.', cTemp ) > 0 then
             begin
                 pDM := nil;
                 pDM := rc_FindDataModule( Copy( cTemp, 1, pos( '.', cTemp ) - 1 ) );
                 cTemp := Copy( cTemp, pos( '.', cTemp ) + 1 );
             end;
             if pDM <> nil then
                pDS  := TDataSource( pDM.FindComponent( cTemp ) )
             else
                pDS  := TDataSource( LkpDBEdit.owner.FindComponent( cTemp ) );
             //pDs   := TDataSource( LkpDBEdit.owner.FindComponent( cTemp ) );

             // v. 4.0.0.0 onlysearch
             bOnlySearch := Pos( 'lkponlysearch', LkpDBEdit.Hint ) > 0 ;
             if ( pDs <> nil ) or ( bOnlySearch ) then
                if ( pDs.State in [dsEdit, dsInsert] ) or ( bOnlySearch ) then
                begin
                    // v. 4.0.0.0 onlysearch
                    //if LkpDBEdit.tag = 0 then
                    if TUniSpeedButton( sender ).tag = 0 then
                       rc_LookUpSearch( TUniSpeedButton( sender ).owner, TUniSpeedButton( sender ).Name , Sender, pLookUpGridAttr)
                    else
                    begin
                       TUniSpeedButton( sender ).tag :=0;
                       rc_LookUpSearchLite( TUniSpeedButton( sender ).owner, TUniSpeedButton( sender ).Name , Sender, pLookUpGridAttr );
                       TUniSpeedButton( sender ).tag := 1;
                    end;
                end;
        end;
     end;
end;

procedure tdm_rc.rc_GridColumnLock(pGrid: TUniDBGrid; pColumn: Integer);
begin
   if not pGrid.Columns[ pColumn ].Locked then
   begin
      pGrid.Columns[ pColumn ].Locked  := True;
   end;
end;
// v. 3.2.0.0
// future implementation
procedure tdm_rc.rc_GridFieldGetText(Sender: TField; var Text: string; DisplayText: Boolean);
// v. 3.2.0..7
var
  idecimalprecision : integer;
begin
  idecimalprecision := 2; // v. 3.2.0..7
  if Sender.AsVariant = Null then
     Exit;

   Text := Sender.AsString;

   //if Sender.FieldName = 'CNPJ_CPF' then
   if ( pos( 'CEP', uppercase( Sender.FieldName ) ) > 0 ) then
   begin
        Text := FormatMaskText('00\.000\-00;0;', Sender.AsString);
   end
   else
   if ( pos( 'CPF', uppercase( Sender.FieldName ) ) > 0 ) or
      ( pos( 'CNPJ', uppercase( Sender.FieldName ) ) > 0 ) then
   begin
      case Length(Sender.AsString) of
        11: Text := FormatMaskText('000\.000\.000\-00;0;', Sender.AsString);
        14: Text := FormatMaskText('00\.000\.000\/0000\-00;0;', Sender.AsString);
      end;
   end
   else
   if ( pos( 'FONE', uppercase( Sender.FieldName ) ) > 0 ) then
   begin
      case Length(Sender.AsString) of
         8: Text := FormatMaskText('0000\-0009;0;', Sender.AsString);
         9: Text := FormatMaskText('00000\-0009;0;', Sender.AsString);
        10: Text := FormatMaskText('(00)0000\-0009;0;', Sender.AsString);
        11: Text := FormatMaskText('(00)00000\-0009;0;', Sender.AsString);
      end;
   end
   else
   if ( pos( 'SITE', uppercase( Sender.FieldName ) ) > 0 ) or
      ( pos( 'EMAIL', uppercase( Sender.FieldName ) ) > 0 ) then
   begin
      mm.varC_ContentField := LowerCase( mm.varC_ContentField );

      TStringField( Sender ).Alignment := taLeftJustify;

      Text := mm.varC_ContentField ;
   end
   else
   if ( ( Sender.DataType  = ftFloat )   or
        ( Sender.DataType  = ftBCD )     or
        ( Sender.DataType  = ftSingle )  or
        ( Sender.DataType  = ftFMTBcd )  or
        ( Sender.DataType  = ftCurrency ) ) then
   begin
        //valores negativos: vermelhor e negrito
//        if Column.Field.AsExtended < 0 then
//        begin
//           Attribs.Font.Color  := clMaroon;
//           Attribs.Font.Style := [fsBold];
//        end
//        else
//        begin
//           Attribs.Font.Color  := $00dc3545;
//           Attribs.Font.Style := [];
//        end;

        if Sender.Size > 0 then
        begin
           if idecimalprecision = 0 then
              idecimalprecision := Sender.Size ;

           if ( pos( 'GEO_', uppercase( Sender.FieldName ) ) > 0 ) then
              mm.varC_ContentField := FloatToStrF( Sender.AsExtended, ffNumber, 11, 8 ) + '  '
           else
              mm.varC_ContentField := FloatToStrF( Sender.AsExtended, ffNumber, 15, idecimalprecision ) + '  ';

           TNumericField( Sender ).DisplayFormat := mm.varC_Mask_float;
        end
        else
           mm.varC_ContentField := FloatToStrF( Sender.AsExtended, ffNumber, 15, 0 ) + '  ';
   end;
end;
// v. 4.0.0.0 - paginator
procedure tdm_rc.rc_GridPaginatorGoPageKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if key = 13 then
     begin
          rc_GridPaginatorGoPage( TUniDBGrid( sender ), TUniEdit( TUniDBGrid( sender ).Owner.FindComponent('edPageNumber_' + TUniDBGrid( sender ).Name) ), TUniLabel( TUniDBGrid( sender ).Owner.FindComponent('labPageCurrPage_' + TUniDBGrid( sender ).Name) ) );
     end;
end;
// v. 4.0.0.0 - paginator
procedure tdm_rc.rc_GridPaginatorGoPage(pGrid: TUniDBGrid; pPage : TUniEdit; pTotPages : TUniLabel; bInit : Boolean = false );
var
   iTotalPages,
   iGoPage,
   iCurrPage : integer;
begin
  inherited;

  //if Key = 13 then
  begin
     iCurrPage := pGrid.DataSource.DataSet.RecNo div pGrid.WebOptions.PageSize + 1;
     iTotalPages := ( pGrid.DataSource.DataSet.RecordCount - 1 ) div pGrid.WebOptions.PageSize + 1;

     iGoPage := StrToIntDef( pPage.Text, 1 );

     if ( iGoPage > 0 ) and ( iGoPage <= iTotalPages ) then
        iCurrPage := iGoPage;

     //bInit := ( pPage.Caption <> '[001]' ) or ( pPage.Caption = '' );
     pPage.Text := iCurrPage.ToString;
     pTotPages.Caption := //'[ ' +
                                //iCurrPage.ToString +
                                ' - ' +
                                iTotalPages.ToString  ;
                                //' ]' ;
     //if not bInit then
     if pPage.Tag = 1 then
        UniSession.AddJS( pGrid.JSName+'.store.loadPage(' + iCurrPage.ToString + ');')
     else
     begin
        pPage.Tag := 1;
        //rc_GridPaginatorFirst( pGrid );
     end;
  end;
end;
// v. 4.0.0.0 - paginator
procedure tdm_rc.rc_GridPaginatorUpdateControls( pGrid : TUniDBGrid; iPageNumber, iCurrPage : integer );
var
  oLabel : TUniLabel;
  cLabel : string;
  //iPageNumber, iCurrPage : integer;
begin
  if iPageNumber = -1 then
     iPageNumber := StrToIntDef( TUniEdit( pGrid.Owner.FindComponent( 'edPageNumber_' + pGrid.Name ) ).Text, 0 ) ;
  if iCurrPage = -1 then
     iCurrPage   := StrToIntDef( TUniLabel( pGrid.Owner.FindComponent( 'labPageCurrPage_' + pGrid.Name ) ).Caption, 0 ) ;
  //first
  cLabel := 'labPageFirst_' + pGrid.Name;
  oLabel := TUniLabel( pGrid.Owner.FindComponent( cLabel ) );
  oLabel.Enabled := iPageNumber > 1;//False;
  oLabel.Font.Color := varIIF( oLabel.Enabled, clBlack, clSilver );
  //prior
  cLabel := StringReplace( cLabel, 'labPageFirst_' , 'labPagePrior_', [rfReplaceAll] );
  oLabel := TUniLabel( pGrid.Owner.FindComponent( cLabel ) );
  oLabel.Enabled := iPageNumber > 1;//False;
  cLabel := oLabel.Name;
  oLabel.Font.Color := varIIF( oLabel.Enabled, clBlack, clSilver );
  //next
  cLabel := StringReplace( cLabel, 'labPagePrior_' , 'labPageNext_', [rfReplaceAll] );
  oLabel := TUniLabel( pGrid.Owner.FindComponent( cLabel ) );
  oLabel.Enabled := iPageNumber < iCurrPage;//True;
  cLabel := oLabel.Name;
  oLabel.Font.Color := varIIF( oLabel.Enabled, clBlack, clSilver );
  //last
  cLabel := StringReplace( cLabel, 'labPageNext_' , 'labPageLast_', [rfReplaceAll] );
  oLabel := TUniLabel( pGrid.Owner.FindComponent( cLabel ) );
  oLabel.Enabled := iPageNumber < iCurrPage;//True;
  cLabel := oLabel.Name;
  oLabel.Font.Color := varIIF( oLabel.Enabled, clBlack, clSilver );
end;
// v. 4.0.0.0 - paginator
procedure tdm_rc.rc_GridPaginatorUpdatePages(pGrid: TUniDBGrid);
var
   iTotalPages,
   iCurrPage : integer;
   oLabel : TUnilabel;
begin
  inherited;
  iTotalPages := ( pGrid.DataSource.DataSet.RecordCount - 1 ) div pGrid.WebOptions.PageSize + 1;
  iCurrPage   := 1;//iTotalPages;

  if ( TUniEdit( pGrid.Owner.FindComponent('labPageCurrPage_' + pGrid.Name ) ).Tag = 0 ) or
     ( TUniEdit( pGrid.Owner.FindComponent('labPageCurrPage_' + pGrid.Name ) ).Tag = 2 ) then
  begin
     TUniLabel( pGrid.Owner.FindComponent('labPageCurrPage_' + pGrid.Name ) ).Caption := //'[ ' +
                                //iCurrPage.ToString +
                                ' - ' +
                                iTotalPages.ToString  ;
                                //'] ' ;
     TUniEdit( pGrid.Owner.FindComponent('edPageNumber_' + pGrid.Name ) ).Text := iCurrPage.ToString;
     if ( Pos( 'firstshow:', pGrid.Hint ) > 0 ) and ( TUniEdit( pGrid.Owner.FindComponent('labPageCurrPage_' + pGrid.Name ) ).Tag = 0 ) then
        TUniEdit( pGrid.Owner.FindComponent('labPageCurrPage_' + pGrid.Name ) ).Tag  := 2
     else
        TUniEdit( pGrid.Owner.FindComponent('labPageCurrPage_' + pGrid.Name ) ).Tag  := 1;

     rc_GridPaginatorUpdateControls( pGrid, iCurrPage, iTotalPages );
  end;
  TUniEdit( pGrid.Owner.FindComponent('labPageCurrPage_' + pGrid.Name ) ).Tag  := 0;
//  else
//     TUniEdit( pGrid.Owner.FindComponent('labPageCurrPage_' + pGrid.Name ) ).Tag  := 0;
end;
// v. 4.0.0.0 - paginator
procedure tdm_rc.rc_GridPaginatorLast(pGrid: TUniDBGrid);
var
   iTotalPages,
   iCurrPage : integer;
begin
  inherited;

  iTotalPages := ( pGrid.DataSource.DataSet.RecordCount - 1 ) div pGrid.WebOptions.PageSize + 1;
  iCurrPage   := iTotalPages;

  TUniLabel( pGrid.Owner.FindComponent('labPageCurrPage_' + pGrid.Name ) ).Caption := //'[ ' +
                             //iCurrPage.ToString +
                             ' - ' +
                             iTotalPages.ToString  ;
                             //'] ' ;
  TUniEdit( pGrid.Owner.FindComponent('labPageCurrPage_' + pGrid.Name ) ).Tag  := 1;
  TUniEdit( pGrid.Owner.FindComponent('edPageNumber_' + pGrid.Name ) ).Text := iCurrPage.ToString;
  UniSession.AddJS( pGrid.JSName+'.store.loadPage(' + iCurrPage.ToString + ');');
  rc_GridPaginatorUpdateControls( pGrid, iCurrPage, iTotalPages );
end;
// v. 4.0.0.0 - paginator
procedure tdm_rc.rc_GridPaginatorNext(pGrid: TUniDBGrid);
var
   iTotalPages,
   iCurrPage : integer;
begin
  inherited;

  iCurrPage := pGrid.DataSource.DataSet.RecNo div pGrid.WebOptions.PageSize + 1;
  iTotalPages := ( pGrid.DataSource.DataSet.RecordCount - 1 ) div pGrid.WebOptions.PageSize + 1;
  if iCurrPage < iTotalPages then
     Inc( iCurrPage )
  else
      iCurrPage := iTotalPages;
  TUniEdit( pGrid.Owner.FindComponent('labPageCurrPage_' + pGrid.Name ) ).Tag  := 1;
  TUniEdit( pGrid.Owner.FindComponent('edPageNumber_' + pGrid.Name) ).Text := iCurrPage.ToString;
  TUniLabel( pGrid.Owner.FindComponent('labPageCurrPage_' + pGrid.Name) ).Caption := //'[ ' +
                             //iCurrPage.ToString +
                             ' - ' +
                             iTotalPages.ToString  ;
                             //' ]' ;

  UniSession.AddJS( pGrid.JSName+'.store.loadPage(' + iCurrPage.ToString + ');');
  rc_GridPaginatorUpdateControls( pGrid, iCurrPage, iTotalPages );
end;
// v. 4.0.0.0 - paginator
procedure tdm_rc.rc_GridPaginatorFirst(pGrid: TUniDBGrid);
var
   iCurrPage, iTotalPages : integer;
begin
  inherited;

  iCurrPage := 1;

  TUniLabel( pGrid.Owner.FindComponent('labPageCurrPage_' + pGrid.Name) ).Caption := //'[ ' +
                             //iCurrPage.ToString +
                             ' - ' +
                             IntToStr( ( pGrid.DataSource.DataSet.RecordCount - 1 ) div pGrid.WebOptions.PageSize + 1 )  ;
                             //' ]' ;
  iTotalPages := ( pGrid.DataSource.DataSet.RecordCount - 1 ) div pGrid.WebOptions.PageSize + 1 ;
  TUniEdit( pGrid.Owner.FindComponent('labPageCurrPage_' + pGrid.Name ) ).Tag  := 1;
  TUniEdit( pGrid.Owner.FindComponent('edPageNumber_' + pGrid.Name) ).Text := iCurrPage.ToString;
  UniSession.AddJS( pGrid.JSName+'.store.loadPage(' + iCurrPage.ToString + ');');
  rc_GridPaginatorUpdateControls( pGrid, iCurrPage, iTotalPages );
end;
// v. 4.0.0.0 - paginator
procedure tdm_rc.rc_GridPaginatorPrior(pGrid: TUniDBGrid);
var
   iCurrPage, iTotalPages : integer;
begin
  inherited;

  iCurrPage := pGrid.DataSource.DataSet.RecNo div pGrid.WebOptions.PageSize + 1;
  if iCurrPage > 1 then
     Dec( iCurrPage );

  TUniEdit( pGrid.Owner.FindComponent('labPageCurrPage_' + pGrid.Name ) ).Tag  := 1;
  TUniEdit( pGrid.Owner.FindComponent('edPageNumber_' + pGrid.Name) ).Text := iCurrPage.ToString;
  TUniLabel( pGrid.Owner.FindComponent('labPageCurrPage_' + pGrid.Name) ).Caption := //'[ ' +
                             //iCurrPage.ToString +
                             ' - ' +
                             IntToStr( ( pGrid.DataSource.DataSet.RecordCount - 1 ) div pGrid.WebOptions.PageSize + 1 )  ;
                             //' ]' ;
  iTotalPages := ( pGrid.DataSource.DataSet.RecordCount - 1 ) div pGrid.WebOptions.PageSize + 1 ;
  UniSession.AddJS( pGrid.JSName+'.store.loadPage(' + iCurrPage.ToString + ');');
  rc_GridPaginatorUpdateControls( pGrid, iCurrPage, iTotalPages );
end;
// v. 4.0.0.0 - paginator
procedure tdm_rc.rc_GridPaginatorRefresh(pGrid: TUniDBGrid);
begin
  if not ( pGrid.DataSource.State in [dsEdit, dsInsert ] ) then
  begin
     pGrid.DataSource.DataSet.Close;
     pGrid.DataSource.DataSet.Open;
  end;
end;
// v. 4.0.0.0 - paginator
procedure tdm_rc.DynamicGridPaginatorFirst(Sender: TObject);
var
   cGrid : string;
   oGrid : TUniDBGrid;
   oLabel : TUniLabel;
   cLabel : string;
begin
     cGrid := Copy( TUniControl( sender ).Name , Pos( '_', TUniControl( sender ).Name ) + 1 );
     oGrid := TUniDBGrid( TUniControl( sender ).Owner.FindComponent( cGrid ) );
     if oGrid <> nil then
     begin
       rc_GridPaginatorFirst( oGrid );
     end;
end;
// v. 4.0.0.0 - paginator
procedure tdm_rc.DynamicGridPaginatorOnRecCount(Sender: TUniDBGrid; var RecCount: Integer);
begin
  dm_rc.rc_GridPaginatorUpdatePages( sender );
  inherited;
end;
// v. 4.0.0.0 - paginator
procedure tdm_rc.DynamicGridPaginatorOnStateChange(Sender: TObject);
begin
  if TDataSource( sender ).State in [ dsInsert, dsEdit, dsBrowse ] then
  begin
     rc_DSReactiveCheck( TDataSource( sender ).Owner , TDataSource( sender ) );
  end;
end;
// v. 4.0.0.0 - paginator
procedure tdm_rc.DynamicGridPaginatorGoPageDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
   cGrid : string;
   oGrid : TUniDBGrid;
begin
     if Key = 13 then
     begin
        cGrid := Copy( TUniControl( sender ).Name , Pos( '_', TUniControl( sender ).Name ) + 1 );
        oGrid := TUniDBGrid( TUniControl( sender ).Owner.FindComponent( cGrid ) );
        if oGrid <> nil then
          rc_GridPaginatorGoPageKeyDown( oGrid, Key, Shift );
     end;
end;
// v. 4.0.0.0 - paginator
procedure tdm_rc.DynamicGridPaginatorLast(Sender: TObject);
var
   cGrid : string;
   oGrid : TUniDBGrid;
begin
     cGrid := Copy( TUniControl( sender ).Name , Pos( '_', TUniControl( sender ).Name ) + 1 );
     oGrid := TUniDBGrid( TUniControl( sender ).Owner.FindComponent( cGrid ) );
     if oGrid <> nil then
       rc_GridPaginatorLast( oGrid );
end;
// v. 4.0.0.0 - paginator
procedure tdm_rc.DynamicGridPaginatorNext(Sender: TObject);
var
   cGrid : string;
   oGrid : TUniDBGrid;
begin
     cGrid := Copy( TUniControl( sender ).Name , Pos( '_', TUniControl( sender ).Name ) + 1 );
     oGrid := TUniDBGrid( TUniControl( sender ).Owner.FindComponent( cGrid ) );
     if oGrid <> nil then
       rc_GridPaginatorNext( oGrid );
end;
// v. 4.0.0.0 - paginator
procedure tdm_rc.DynamicGridPaginatorPrior(Sender: TObject);
var
   cGrid : string;
   oGrid : TUniDBGrid;
begin
     cGrid := Copy( TUniControl( sender ).Name , Pos( '_', TUniControl( sender ).Name ) + 1 );
     oGrid := TUniDBGrid( TUniControl( sender ).Owner.FindComponent( cGrid ) );
     if oGrid <> nil then
       rc_GridPaginatorPrior( oGrid );
end;
// v. 4.0.0.0 - paginator
procedure tdm_rc.DynamicGridPaginatorRefresh(Sender: TObject);
var
   cGrid : string;
   oGrid : TUniDBGrid;
begin
     cGrid := Copy( TUniControl( sender ).Name , Pos( '_', TUniControl( sender ).Name ) + 1 );
     oGrid := TUniDBGrid( TUniControl( sender ).Owner.FindComponent( cGrid ) );
     if oGrid <> nil then
       rc_GridPaginatorRefresh( oGrid );
end;
// v. 4.0.0.0 - paginator
procedure tdm_rc.DynamicGridPaginatorSearch(Sender: TObject);
var
   cGrid : string;
   oGrid : TUniDBGrid;
begin
     cGrid := Copy( TUniControl( sender ).Name , Pos( '_', TUniControl( sender ).Name ) + 1 );
     oGrid := TUniDBGrid( TUniControl( sender ).Owner.FindComponent( cGrid ) );
     if oGrid <> nil then
       rc_GridPaginatorSearch( oGrid );
end;
// v. 4.0.0.0 - paginator
procedure tdm_rc.rc_GridPaginatorSearch(pGrid: TUniDBGrid);
begin
  if dm_rc.rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;

//  if not ( pGrid.DataSource.State in [dsEdit, dsInsert ] ) then
//  begin
//
//     tabSearch.Visible := ( btnNewReg.Enabled) and ( not bModelCrud1 );
//     pgBaseCadControl.ActivePage := tabSearch;
//
//     if mm.varB_Mobile_Screen_Portrait then
//        paSearchFilters.Width := varIIF( paSearchFilters.width = 0, pGrid.Width, 0 )
//     else
//        paSearchFilters.Width := varIIF( paSearchFilters.width = 0, 266, 0 );
//
//     if paSearchFilters.Width > 0 then
//        if ( StrToIntDef( ed_CodMaster.Hint, 0 ) > 0 ) then
//        begin
//            btnSearchCRUDClick( btnSearchCRUD );
//        end;
//  end;
end;
// v. 3.3.3.0
procedure tdm_rc.rc_GridDrawCell(Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
var
   grid: TUniDBGrid;
   iNumCols,
   iPos, iPos2,
   iTag, iBigger,
   iLength, iAlign : integer;

   bTitleCol,
   bChanged,
   bRender,
   bResize,
   bSameTable : boolean;

   c, i, f,
   idecimalprecision,
   isize,
   ititleset,
   ilocked,
   iDisplayMemo, // v. 4.0.0.0
   iCheckBox, // v. 4.0.0.0
   idisplaywidth,
   ivisible : integer;

   cCheckBoxValues, // v. 4.0.0.0
   cCheckBoxDisplayValues, // v. 4.0.0.0
   ccolcolor,
   ctable,
   ccolumn,
   ccharcase,
   cfield,
   ctitle,
   cmask,
   calign,
   ctitlealign,
   cvisible,
   ccss,
   cpill,

   cTemp, cTemp2, cTemp3,
   cTrueValue, cFalseValue,
   cOperator, cValue,
   cStr1, cStr2 : string;
begin

  inherited;
    // v. 3.2.0..7
    idisplaywidth     := 0;
    idecimalprecision := 2;
    ilocked           := 0;
    ititleset         := 0;
    iTag              := 0;
    // v. 4.0.0.0
    iCheckBox         := 0;
    cCheckBoxValues   := '';
    cCheckBoxDisplayValues := '';
    iDisplayMemo      := 0;

    UniSession.SuspendLayouts;// v. 4.0.0.0
    //Unisession.JSCode( TUniDBGrid(Sender).JSName + '.store.suspendEvents();' );
    //TUniDBGrid(Sender).Columns.BeginUpdate;
    //TUniDBGrid(Sender).SuspendColumnsChanged := True;
    try
       //render rc_Draw ?
       bRender := false;
       bResize := ( Pos( 'grid-resize' , TUniDBGrid(Sender).Hint ) > 0 ) or
                  ( Pos( 'grid-fm-rs!' , TUniDBGrid(Sender).Hint ) > 0 );

       if ( Pos( 'fieldmasks:' , TUniDBGrid(Sender).Hint ) > 0 ) and
          ( ( Pos( 'grid-fm-ok!' , TUniDBGrid(Sender).Hint ) = 0 ) and ( Pos( 'grid-fm-rs!' , TUniDBGrid(Sender).Hint ) = 0 ) ) then
       begin
            if ( Pos( 'fieldmasks:' , TUniDBGrid(Sender).Hint ) > 0 ) and ( Pos( 'fieldmasks:table-' , TUniDBGrid(Sender).Hint ) = 0 ) then
            begin
                 iPos := Pos( 'fieldmasks:' , TUniDBGrid(Sender).Hint ) + 11;
                 cTemp := TUniDBGrid(Sender).Hint;
                 Insert( 'table-' + lowercase( TUniDBGrid(Sender).Name ) + ';', cTemp , iPos );
                 TUniDBGrid(Sender).Hint := cTemp;
            end;
            // v. 3.3.3.0
            mm.varC_FieldMasks := rc_NormalizeHintProperty( TUniDBGrid(Sender).Hint + ']]' );

            if Pos( 'fieldmasks:table-' , TUniDBGrid(Sender).Hint ) > 0 then
            begin
               mm.varC_Table_Search := Copy( TUniDBGrid(Sender).Hint, Pos( 'fieldmasks:table-' , TUniDBGrid(Sender).Hint ) + 17, 2000 );
               mm.varC_Table_Search := Copy( mm.varC_Table_Search , 1, Pos( ';' , mm.varC_Table_Search ) - 1 );
            end;

            mm.varC_FieldMasks := Trim( StringReplace( mm.varC_FieldMasks, 'fieldmasks:' , '', [rfReplaceAll] ) );
            mm.varC_FieldMasks := StringReplace( mm.varC_FieldMasks, '  ;', ';', [rfReplaceAll] );
            mm.varC_FieldMasks := StringReplace( mm.varC_FieldMasks, ' ;', ';', [rfReplaceAll] );
            mm.varC_FieldMasks := StringReplace( mm.varC_FieldMasks, ';  ', ';', [rfReplaceAll] );
            mm.varC_FieldMasks := StringReplace( mm.varC_FieldMasks, '; ', ';', [rfReplaceAll] );
            // v. 3.3.3.0
            if ( Pos( '|', Copy( mm.varC_FieldMasks, 1, Pos( '[[', mm.varC_FieldMasks ) ) ) > 0 ) then
            repeat
               mm.varC_FieldMasks := ';' + Copy( mm.varC_FieldMasks, Pos( '|', mm.varC_FieldMasks ) + 1 );
            until ( Pos( '|', Copy( mm.varC_FieldMasks, 1, Pos( '[[', mm.varC_FieldMasks ) ) ) = 0 );
            // para processar apenas uma vez o fieldmasks de cada grid
            if bResize then
            begin
               TUniDBGrid(Sender).Hint := 'grid-fm-rs!' + mm.varC_FieldMasks;
            end
            else
               TUniDBGrid(Sender).Hint := 'grid-fm-ok!' + mm.varC_FieldMasks;

            bRender := True;
       end
       else
       if ( Pos( 'grid-fm-ok!' , TUniDBGrid(Sender).Hint ) > 0 ) or ( Pos( 'grid-fm-rs!' , TUniDBGrid(Sender).Hint ) > 0 ) then
       begin
           mm.varC_FieldMasks := Copy( TUniDBGrid(Sender).Hint, 12, 2000 ) ;
           // v. 3.3.3.0
           bRender := True;
       end;

       iBigger := 0;

       //verficar se pode EXIBIR todas as colunas
       if ( Column.Visible ) and ( Column.Field <> nil ) then
       begin
          //verficar se pode EXIBIR todas as colunas
          Column.Visible := ( not AnsiMatchStr( Column.Title.Caption.ToLower , ARRAY_DO_NOT_SHOW_DBGRID ) ) ;

          // se nao usou ALLPKs, entao EXIBE todas as colunas / esconder a coluna PK
          // v. 3.3.2.0
          if ( Column.Visible ) then //and ( Pos( '|allpks' , TUniDBGrid(Sender).Hint ) = 0 ) then
          begin
             if ( Pos( '|showpk' , TUniDBGrid(Sender).Hint ) = 0 ) then
                Column.Visible := not memGridPK.Locate( 'field' , Column.Title.Caption.ToLower , [] );

             TStringField( Column.Field ).Visible := Column.Visible ;
          end;
       end;

       If ( bRender ) and ( ( Column.Visible ) or ( Pos( ';' + ansilowercase( Column.FieldName ) + '[[' , mm.varC_FieldMasks ) > 0 ) ) then
       begin
           Column.Sortable := True;

           if ( trim( mm.varC_Table_Search ) <> '' ) and ( Column <> nil ) then
           begin
                 ccolcolor     := '';
                 cmask         := '';
                 idecimalprecision := 0;
                 cTitle        := '';
                 ctitlealign   := '';
                 cAlign        := '';
                 ccharcase     := '';
                 cVisible      := '';
                 cCss          := '';
                 cPill         := '';
                 idisplaywidth := 0;
                 ivisible      := 1;
                 ilocked       := 0;
                 // v. 4.0.0.0
                 iCheckBox       := 0;
                 cCheckBoxValues := '';
                 cCheckBoxDisplayValues := '';
                 iDisplayMemo    := 0;

                 ctable  := ansilowercase( trim(mm.varC_Table_Search ) );
                 ccolumn := ansilowercase( Column.Title.Caption );
                 isize   := iBigger;

                 // the field have a mask or some adjustment ?
                 // Ex.: código[[W:20|M:00000]]
                 // v. 3.3.3.0
                 iPos := Pos( ';' + ansilowercase( Column.FieldName ) + '[[' , ansilowercase( mm.varC_FieldMasks ) );

                 if ( iPos > 0 ) then
                 begin
                      cTemp  := Copy( mm.varC_FieldMasks, iPos, 10000 ) ;
                      cTemp  := Copy( cTemp, 1, Pos( ']]' , cTemp ) - 1 ) ; // pega os params da coluna
                      cTemp2 := Copy( cTemp, Pos( '[[', cTemp ), 1000 );
                      cTemp  := StringReplace( cTemp, cTemp2 , '', [rfReplaceAll] );
                      cTemp  := Trim( StringReplace( cTemp, cTemp2 , '', [rfReplaceAll] ) );

                      cField := Copy( cTemp, 2, 1000 ) ;

                      cTemp2 := StringReplace( cTemp2, '[[', '', [rfReplaceAll] );
                      cTemp2 := StringReplace( cTemp2, ']];', '', [rfReplaceAll] );
                      cTemp2 := StringReplace( cTemp2, ']]', '', [rfReplaceAll] );
                      cTemp2 := cTemp2 + '|';

                      iPos2 := Pos( '|' , cTemp2 );
                      While ( iPos2 > 0 ) do
                      begin
                           cTemp  := Copy( cTemp2, 1 , iPos2 );
                           cTemp2 := StringReplace( cTemp2, cTemp, '', [rfReplaceAll] );

                           cTemp  := StringReplace( cTemp, '|', '', [rfReplaceAll] );
                           cTemp  := Trim(StringReplace( cTemp, '|', '', [rfReplaceAll] ));

                           if ( Pos( 'width:', cTemp ) > 0 ) then
                           begin
                              // v. 4.0.0.0
                              // verificar quantos botoes existem p calcular o width mais corretamente
                              if ( Pos( 'width:default', cTemp ) > 0 ) then
                                 cTemp := 'width:9% mobile-h:14% mobile-v:26%'; // v. 4.0.0.0
                                 //cTemp := 'width:102 mobile-h:102 mobile-v:114'; // v. 3.3.3.0

                              cTemp := cTemp + ' ';
                              if ( Pos( 'mobile-v:', cTemp ) > 0 ) and
                                 ( mm.varB_Mobile_Screen_Portrait ) then
                              begin
                                   cTemp3 := trim( Copy( cTemp, Pos( 'mobile-v:', cTemp ) + 9, Pos( ' ', cTemp ) ) );
                                   cTemp  := cTemp3;
                                   cTemp3 := ReturnNumbers( cTemp3 );

                                 if Pos( '%', cTemp ) = 0 then
                                    idisplaywidth := StrToIntDef( cTemp3, 0 )
                                 else
                                    idisplaywidth := StrToIntDef( cTemp3, 0 ) * (-1); // percentual ( / 100 )

                                 if cTemp3 = '0' then
                                    idisplaywidth := 9999;
                              end
                              else
                              if ( Pos( 'mobile-h:', cTemp ) > 0 ) and
                                 ( mm.varB_Mobile_Screen_Landscape ) then
                              begin
                                   cTemp3 := trim( Copy( cTemp, Pos( 'mobile-h:', cTemp ) + 9, Pos( ' ', cTemp ) ) );
                                   cTemp  := cTemp3;
                                   cTemp3 := ReturnNumbers( cTemp3 );

                                 if Pos( '%', cTemp ) = 0 then
                                    idisplaywidth := StrToIntDef( cTemp3, 0 )
                                 else
                                    idisplaywidth := StrToIntDef( cTemp3, 0 ) * (-1); // percentual ( / 100 )

                                 if cTemp3 = '0' then
                                    idisplaywidth := 9999;
                              end
                              else
                              if ( Pos( 'mobile:', cTemp ) > 0 ) and
                                 ( mm.varB_Mobile_Screen ) then
                              begin
                                   cTemp3 := trim( Copy( cTemp, Pos( 'mobile:', cTemp ) + 7, Pos( ' ', cTemp ) ) );
                                   cTemp  := cTemp3;
                                   cTemp3 := ReturnNumbers( cTemp3 );

                                 if Pos( '%', cTemp ) = 0 then
                                    idisplaywidth := StrToIntDef( cTemp3, 0 )
                                 else
                                    idisplaywidth := StrToIntDef( cTemp3, 0 ) * (-1); // percentual ( / 100 )

                                 if cTemp3 = '0' then
                                    idisplaywidth := 9999;
                              end
                              else
                              begin
                                 cTemp3 := trim( Copy( cTemp, 1, Pos( ' ', cTemp ) ) );
                                 cTemp  := cTemp3;
                                 cTemp3 := ReturnNumbers( cTemp3 );

                                 if Pos( '%', cTemp ) = 0 then
                                    idisplaywidth := StrToIntDef( cTemp3, 0 )
                                 else
                                    idisplaywidth := StrToIntDef( cTemp3, 0 ) * (-1); // percentual ( / 100 )

                                 if cTemp3 = '0' then
                                    idisplaywidth := 9999;
                              end;
                           end
                           else
                           if ( Pos( 'pill:' , cTemp ) > 0 ) then
                           begin

   //                              cTemp3 := Copy( cTemp, Pos( 'pill:' + trim( TField( Column.Field ).AsString ), cTemp ), 200 );
   //
   //                              if Pos( 'pill:', cTemp3) > 0 then
   //                              begin
   //                                 cTemp2 := Copy( cTemp3, 6, 100 );
   //                                 cTemp2 := Copy( cTemp2, 1, Pos( ' ', cTemp2 ) - 1 );
   //                                 cPill  := cTemp2 + '</span>';
   //                                 cTemp3 := Copy( cTemp3, Pos( ' ', cTemp3 ) + 1, 100 );
   //                                 cPill  := '<div style="color=red"><span class="badge badge-pill badge-' + cTemp3 + '">"' + cPill + '</div>';
   //                                 cPill := '';
   //                                 //Attribs.Style.cls := 'badge rc-grid-cell-badge bg-warning';//'badge badge-pill badge-' + cTemp3;
   //                                 Attribs.Style.cls := 'badge badge-pill badge-' + cTemp3;
   //
   //                                 with TUniDBGrid ( sender ) do
   //                                 begin
   //                                      TStringField( Column.Field ).Alignment := taCenter;
   //                                 end;
   //
   //                                 Column.AllowHTML := True;
   //                                 //ccolumn +
   //                              end;

                           end
                           else
                           if Pos( 'visible:', cTemp ) > 0 then
                           begin
                              cTemp := cTemp + ' ';

                              cvisible := 'true';
                              ivisible := 1;

                              if ( Pos( 'visible:false mobile-v ', cTemp ) > 0 ) and
                                 ( mm.varB_Mobile_Screen_Portrait ) then
                              begin
                                 cvisible := 'false';
                                 ivisible := 0;
                              end
                              else
                              if ( Pos( 'visible:false mobile-h ', cTemp ) > 0 ) and
                                 ( mm.varB_Mobile_Screen_Landscape ) then
                              begin
                                 cvisible := 'false';
                                 ivisible := 0;
                              end
                              else
                              if ( Pos( 'visible:false mobile ', cTemp ) > 0 ) and
                                 ( mm.varB_Mobile_Screen ) then
                              begin
                                 cvisible := 'false';
                                 ivisible := 0;
                              end
                              else
                              if ( ( Pos( 'visible:false ', cTemp ) > 0 ) or
                                 ( Pos( 'visible:true ', cTemp ) > 0 ) ) then
                              begin
                                 //visible:(NOT EMPTY)
                                 cvisible := Trim( Copy( cTemp, 9, 100 ) );
                                 ivisible := varIIF( cvisible = 'true', 1, 0 );
                              end;
                           end
                           else
                           //color
                           if Pos( 'cls:', cTemp ) > 0 then
                           begin
                              //color:(>=0,color-red,color-black)
                              ccss  := Copy( cTemp, 5, 100 );
                           end
                           // v. 4.0.0.0
                           else
                           //checked
                           if Pos( 'checkbox:', cTemp ) > 0 then
                           begin
                              iCheckBox := varIIF( Pos( 'checkbox:', cTemp ) > 0, 1, 0 );
                              cCheckBoxValues := Copy( cTemp, Pos( 'checkbox:', cTemp ) + 9 ) + ' ';
                              cCheckBoxValues := Copy( cCheckBoxValues, 1, Pos( ' ', cCheckBoxValues )) ;
                              if Pos( ' dv', cTemp ) > 0 then
                              begin
                                 if Pos( ' dv:', cTemp ) > 0 then
                                    cCheckBoxDisplayValues := Copy( cTemp, Pos( ' dv:', cTemp ) + 4 )
                                 else
                                    cCheckBoxDisplayValues := Copy( cTemp, Pos( ' dv', cTemp ) + 3 ) ;
                                 //cCheckBoxDisplayValues := Copy( cTemp, Pos( ' dv', cTemp ) + 3 ) ;
                              end;
                           end
                           else
                           // v. 4.0.0.0
                           //displaymemo
                           if Pos( 'displaymemo', cTemp ) > 0 then
                           begin
                              iDisplayMemo := varIIF( Pos( 'displaymemo', cTemp ) > 0, 1, 0 );
                              Column.DisplayMemo := True;
                           end
                           else
                           //locked
                           if Pos( 'locked', cTemp ) > 0 then
                              ilocked := varIIF( Pos( 'locked', cTemp ) > 0, 1, 0 )
                           else
                           //ctitle
                           if Pos( 'title:', cTemp ) > 0 then
                           begin
                              ctitle := Copy( cTemp, 7, 100 );
                              if ctitle = '' then
                                 ctitle := ' ';
                           end
                           else
                           //ctitlealign
                           if Pos( 'titlealign:', cTemp ) > 0 then
                              ctitlealign := Copy( cTemp, 12, 1 )
                           else
                           //calign
                           if Pos( 'align:', cTemp ) > 0 then
                              calign := Copy( cTemp, 7, 1 )
                           else
                           //ccharcase
                           if Pos( 'charcase:', cTemp ) > 0 then
                              ccharcase := Copy( cTemp, 10, 1 )
                           else
                           //cmask
                           if Pos( 'mask:', cTemp ) > 0 then
                           begin
                              cmask := Copy( cTemp, 6, 100 );
                              if Pos( PFmtSettings.DecimalSeparator + '00', cmask ) > 0 then
                              begin
                                   cTemp := Copy( cmask, Pos( PFmtSettings.DecimalSeparator , cmask ) + 1, 100 );
                                   idecimalprecision := strTokenCount( ctemp, '0' );
                              end;
                           end;

                           iPos2 := Pos( '|' , cTemp2 );
                      end;
                 end;
           end;

           bSameTable := ( ctable <> '' ) and
                         ( trim( mm.varC_Table_Search ) = ctable ) ;

           // Ajustar os campos( alinhamento e espaçamento )
           if Column.Field <> nil then
           begin
               if ( bRender ) or
                  ( bResize ) or
                  ( trim( mm.varC_Table_Search ) = '' ) then
               begin
                    if bSameTable then
                    begin
                       if ( ctitle <> '' ) or
                          ( ititleset = 0 ) then
                       begin
                          if ititleset = 0 then
                          begin
                             if ( bRender ) then
                                Column.Visible := ( cvisible <> 'false' );
                             // v. 3.3.3.0
                             if not Column.Visible then
                                Column.Width := 0;

                             if Column.Visible then
                             begin
                                if ( bRender ) then
                                begin
                                   if ctitle <> '' then
                                   begin
                                      Column.Menu.MenuEnabled := ( Pos ( 'rcaction_' , lowercase( Column.Title.Caption ) ) > 0 );
                                      Column.Title.Caption := ctitle;
                                   end;
                                   // v. 4.0.0.0
                                   // o CSS global não funcionou para "Capitalize"
                                   // the global CSS do not work for "capitalize"
                                   if mm.CONFIG_LAYOUT_GRID_TITLE_UPPER = 'OFF' then
                                      Column.Title.Caption := rc_CamelCase( Column.Title.Caption );

                                   if ( ctitlealign <> '' ) then
                                   begin
                                      if ctitlealign = 'c' then
                                         Column.Title.Alignment := taCenter
                                      else
                                      if ctitlealign = 'r' then
                                         Column.Title.Alignment := taRightJustify
                                      else
                                      if ctitlealign = 'l' then
                                         Column.Title.Alignment := taLeftJustify;
                                   end;

                                   if ( ilocked = 1 ) then
                                   begin
                                        dm_rc.rc_GridColumnLock( TUniDBGrid( sender ), Column.Index );
                                   end;
                                   // v. 4.0.0.0 - Feedback from Fabio Oliveira( ported to right place )
                                   if ( iDisplayMemo = 1 ) then
                                   begin
                                        Column.DisplayMemo := True;
                                   end;
                                   // v. 4.0.0.0
                                   if ( iCheckBox = 1 ) then
                                   begin
                                      Column.CheckBoxField.Enabled          := true;
                                      Column.CheckBoxField.BooleanFieldOnly := Pos( 'true', cCheckBoxValues ) > 0;
                                      Column.CheckBoxField.FieldValues      := cCheckBoxValues;
                                      if cCheckBoxDisplayValues = '' then
                                         Column.CheckBoxField.DisplayValues    := '&#160'
                                      else
                                         Column.CheckBoxField.DisplayValues    := cCheckBoxDisplayValues;
                                      //Column.Alignment                      := taCenter;
                                   end;
                                end;

                                if ( bResize ) or ( idisplaywidth = 9999 ) then
                                begin
                                  if idisplaywidth = 0 then
                                  begin
                                     idisplaywidth := TUniDBGrid(Sender).DataSource.DataSet.FieldByName( Column.FieldName ).DisplayWidth;

                                     iLength := Length( Column.Title.Caption ) + 2;

                                     if TStringField( Column.Field ).EditMask = '' then
                                        iTag     := Length( trim( TStringField( Column.Field ).Text ) )
                                     else
                                        iTag     := Length( trim( StringReplace( TStringField( Column.Field ).EditMask, '\' , '', [rfReplaceAll] ) ) );

                                     if iLength >= iTag then
                                        iBigger := iLength
                                     else
                                        iBigger := iTag;
                                  end
                                  else
                                  begin
                                       iBigger := iTag;
                                       iTag := iBigger ;
                                  end;

                                  if column.Visible then
                                  begin
                                     if idisplaywidth = 9999 then
                                     begin
                                          Column.MinWidth := 0;
                                          Column.Width    := 0;
                                          Column.Tag      := 0;
                                          Column.Flex     := 0;
                                          iBigger         := 0;
                                          iTag            := 0 ;
                                     end
                                     else
                                     if bResize then
                                     begin
                                         if Pos( 'grid-noforcefit|' , mm.varC_FieldMasks ) > 0 then
                                            Column.Flex     := 0
                                         else
                                         if Pos( 'locked|' , mm.varC_FieldMasks ) > 0 then
                                            Column.Flex     := 1;

                                         mm.varC_GridColName := lowercase( Column.FieldName);

                                         if Column.Tag < ( iBigger + 6 ) * 6 then
                                            Column.Tag := ( iBigger + 6 ) * 6;

                                         if idisplaywidth > Column.Tag then
                                         begin
                                            Column.Width := idisplaywidth;
                                         end
                                         else
                                         begin
                                            if idisplaywidth < 0 then
                                               Column.Tag := Trunc( TUniDBGrid(Sender).Width * ( ( idisplaywidth * (-1 ) ) / 100 ) );

                                            Column.Width := Column.Tag;
                                         end;

                                         Column.MinWidth := Column.Width;

                                         iBigger := Column.MinWidth;
                                         iTag := iBigger ;
                                     end;
                                  end;
                                end;
                             end;
                          end;
                          ititleset := 1;
                       end;

                       if ( bRender ) and ( ccolcolor <> '' ) and ( Column.Visible ) then
                          column.Color := StringToColor( ccolcolor );

                       if ( bRender ) and ( ccss <> '' ) and ( Column.Visible ) then
                       begin
                          // have a condition ?
                          if Pos( '{' , ccss ) > 0 then
                          begin
                               cStr1 := ccss ;
                               cStr1 := StringReplace( cStr1 , 'cls:' , '', [rfReplaceAll] );
                               cStr1 := StringReplace( cStr1 , '{' , '', [rfReplaceAll] );
                               cStr1 := StringReplace( cStr1 , '}' , '', [rfReplaceAll] );

                               cStr2 := Copy( cStr1 , 1, Pos( ',', cStr1 ) - 1 );
                               cStr1 := StringReplace( cStr1 , cStr2 + ',' , '', [rfReplaceAll] );

                               if Pos( '>=' , cStr2 ) > 0 then
                                  cOperator := '>='
                               else
                               if Pos( '<=' , cStr2 ) > 0 then
                                  cOperator := '<='
                               else
                               if Pos( '<>' , cStr2 ) > 0 then
                                  cOperator := '<>'
                               else
                               if Pos( '<' , cStr2 ) > 0 then
                                  cOperator := '<'
                               else
                               if Pos( '>' , cStr2 ) > 0 then
                                  cOperator := '>'
                               else
                               if Pos( '=' , cStr2 ) > 0 then
                                  cOperator := '=';

                               cStr2 := StringReplace( cStr2 , cOperator , '', [rfReplaceAll] );
                               cValue := cStr2;

                               cTrueValue  := Copy( cStr1, 1, Pos( ',', cStr1 ) - 1 );
                               cStr1 := StringReplace( cStr1 , cTrueValue + ',' , '', [rfReplaceAll] );
                               cFalseValue := cStr1;

                               if DataTypeIsNumber( Column.Field.DataType ) then
                               begin
                                  if cOperator = '=' then
                                     Attribs.Style.Cls := VarIIF( Column.Field.Value = StrToIntDef( cValue , 0 ) , cTrueValue , cFalseValue )
                                  else
                                  if cOperator = '>' then
                                     Attribs.Style.Cls := VarIIF( Column.Field.Value > StrToIntDef( cValue , 0 ) , cTrueValue , cFalseValue )
                                  else
                                  if cOperator = '<' then
                                     Attribs.Style.Cls := VarIIF( Column.Field.Value < StrToIntDef( cValue , 0 ) , cTrueValue , cFalseValue )
                                  else
                                  if cOperator = '>=' then
                                     Attribs.Style.Cls := VarIIF( Column.Field.Value >= StrToIntDef( cValue , 0 ) , cTrueValue , cFalseValue )
                                  else
                                  if cOperator = '<=' then
                                     Attribs.Style.Cls := VarIIF( Column.Field.Value <= StrToIntDef( cValue , 0 ) , cTrueValue , cFalseValue )
                                  else
                                  if cOperator = '<>' then
                                     Attribs.Style.Cls := VarIIF( Column.Field.Value <> StrToIntDef( cValue , 0 ) , cTrueValue , cFalseValue );
                               end
                               else
                               if DataTypeIsString( Column.Field.DataType ) then
                               begin
                                  if cOperator = '=' then
                                     Attribs.Style.Cls := VarIIF( Column.Field.Value = cValue , cTrueValue , cFalseValue )
                                  else
                                  if cOperator = '>' then
                                     Attribs.Style.Cls := VarIIF( Column.Field.Value > cValue , cTrueValue , cFalseValue )
                                  else
                                  if cOperator = '<' then
                                     Attribs.Style.Cls := VarIIF( Column.Field.Value < cValue , cTrueValue , cFalseValue )
                                  else
                                  if cOperator = '>=' then
                                     Attribs.Style.Cls := VarIIF( Column.Field.Value >= cValue , cTrueValue , cFalseValue )
                                  else
                                  if cOperator = '<=' then
                                     Attribs.Style.Cls := VarIIF( Column.Field.Value <= cValue , cTrueValue , cFalseValue )
                                  else
                                  if cOperator = '<>' then
                                     Attribs.Style.Cls := VarIIF( Column.Field.Value <> cValue , cTrueValue , cFalseValue );
                               end;
                          end
                          else
                             Attribs.Style.Cls := ccss;
                       end;
                    end;
                    //Alinhar campos numericos a DIREITA
                    if ( bRender ) and ( Column.Visible ) then
                    begin
                       if DataTypeIsNumber( Column.Field.DataType ) then
                       begin
                            with TUniDBGrid(Sender) do
                            begin
                               // apply pre-defined attributes
                               if bSameTable then
                               begin
                                  if ( calign <> '' ) then
                                  begin
                                     if calign = 'c' then
                                        TNumericField( Column.Field ).Alignment := taCenter
                                     else
                                     if calign = 'r' then
                                        TNumericField( Column.Field ).Alignment := taRightJustify
                                     else
                                     if calign = 'l' then
                                        TNumericField( Column.Field ).Alignment := taLeftJustify;
                                  end;
                               end;

                               if ( bSameTable ) and ( cmask <> '' ) then
                               begin
                                  TNumericField( Column.Field ).DisplayFormat := cmask;
                               end
                               else
                               if ( ( Column.Field.DataType  = ftFloat )   or
                                    ( Column.Field.DataType  = ftBCD )     or
                                    ( Column.Field.DataType  = ftSingle )  or
                                    ( Column.Field.DataType  = ftFMTBcd )  or
                                    ( Column.Field.DataType  = ftCurrency ) ) then
                               begin
                                    //valores negativos: vermelhor e negrito
                                    if Column.Field.AsExtended < 0 then
                                    begin
                                       Attribs.Font.Color  := clMaroon;
                                       Attribs.Font.Style := [fsBold];
                                    end
                                    else
                                    begin
                                       Attribs.Font.Color  := $00dc3545;
                                       Attribs.Font.Style := [];
                                    end;

                                    if Column.Field.Size > 0 then
                                    begin
                                       if idecimalprecision = 0 then
                                          idecimalprecision := Column.Field.Size ;

                                       if ( pos( 'GEO_', uppercase( Column.FieldName ) ) > 0 ) then
                                          mm.varC_ContentField := FloatToStrF( Column.Field.AsExtended, ffNumber, 11, 8 ) + '  '
                                       else
                                          mm.varC_ContentField := FloatToStrF( Column.Field.AsExtended, ffNumber, 15, idecimalprecision ) + '  ';

                                       TNumericField( Column.Field ).DisplayFormat := mm.varC_Mask_float;
                                    end
                                    else
                                       mm.varC_ContentField := FloatToStrF( Column.Field.AsExtended, ffNumber, 15, 0 ) + '  ';
                               end
                               else
                               begin
                                  mm.varC_ContentField := IntToStr( Column.Field.AsInteger ) + '  ';
                                  TNumericField( Column.Field ).DisplayFormat := '';
                               end;

                               if Trim( mm.varC_ContentField ) = '30/12/1899' then
                                  mm.varC_ContentField := '';

                               mm.varC_ContentField := mm.varC_ContentField ;
                               // v. 3.3.2.0
                               if ( calign <> '' ) then
                               begin
                                  if calign = 'c' then
                                     Text := Middle( PChar( mm.varC_ContentField ), ( Length( mm.varC_ContentField ) div 2 ) , ' ' )
                                  else
                                  if calign = 'l' then
                                     Text := PadLeft( PChar( mm.varC_ContentField ), Length( mm.varC_ContentField ) , ' ' )
                                  else
                                     Text := PadRight( PChar( mm.varC_ContentField ), Length( mm.varC_ContentField ) , ' ' );
                               end
                               else
                                  Text := PadRight( PChar( mm.varC_ContentField ), Length( mm.varC_ContentField ) , ' ' );
                            end;
                       end
                       else
                       //Alinhar campos FONE a DIREITA e FORMATAR
                       if ( Column.Field.DataType  = ftString ) or (Column.Field.DataType = ftWideString) then
                       begin
                            with TUniDBGrid(Sender) do
                            begin
                               if cPill <> '' then
                                  mm.varC_ContentField := cPill
                               else
                                  mm.varC_ContentField := ' ' + Column.Field.AsString + ' ';

                               // apply pre-defined mask
                               if ( bSameTable ) then
                               begin
                                  if ccharcase = 'u' then
                                     Attribs.Style.Cls := 'toupper '
                                  else
                                  if ccharcase = 'l' then
                                     Attribs.Style.Cls := 'tolower ';

                                  if ( calign <> '' ) then
                                  begin
                                     if calign = 'c' then
                                        Column.Alignment := taCenter
                                     else
                                     if calign = 'r' then
                                        Column.Alignment := taRightJustify
                                     else
                                     if calign = 'l' then
                                        Column.Alignment := taLeftJustify;
                                  end;
                               end;

                               TEXT := mm.varC_ContentField;

                               if ( bSameTable ) and ( cmask <> '' ) then
                               begin
                                    TStringField( Column.Field ).EditMask := cmask;
                               end
                               else
                               if pos( 'FONE', uppercase( Column.FieldName ) ) > 0 then
                               begin
                                  mm.varC_ContentField := Trim ( ReturnNumbers( mm.varC_ContentField ) ) ;

                                  // se o registro já contém ( ) ou -..não aplicar mascara
                                  TStringField( Column.Field ).EditMask := '';

                                  if Pos( '(' , Column.Field.AsString ) = 0 then
                                  begin
                                     if Length( mm.varC_ContentField ) = 8 then
                                        TStringField( Column.Field ).EditMask := '0000\-0000;0;_'
                                     else
                                     if Length( mm.varC_ContentField ) = 9 then
                                        TStringField( Column.Field ).EditMask := '00000\-0000;0;_'
                                     else
                                     if Length( mm.varC_ContentField ) = 10 then
                                        TStringField( Column.Field ).EditMask := '\(00\)0000-0000;0;_'
                                     else
                                     if Length( mm.varC_ContentField ) = 11 then
                                        TStringField( Column.Field ).EditMask := '\(00\)00000\-0000;0;_';
                                  end;
                                  TStringField( Column.Field ).Alignment := taRightJustify;
                                  Text := mm.varC_ContentField;
                               end
                               else
                               if ( pos( 'SITE', uppercase( Column.FieldName ) ) > 0 ) or
                                  ( pos( 'EMAIL', uppercase( Column.FieldName ) ) > 0 ) then
                               begin
                                  mm.varC_ContentField := LowerCase( mm.varC_ContentField );

                                  TStringField( Column.Field ).Alignment := taLeftJustify;

                                  Text := mm.varC_ContentField ;
                               end
                               else
                               if ( pos( 'CPF', uppercase( Column.FieldName ) ) > 0 ) or
                                  ( pos( 'CNPJ', uppercase( Column.FieldName ) ) > 0 ) then
                               begin
                                  mm.varC_ContentField := Trim ( ReturnNumbers( mm.varC_ContentField ) ) ;

                                  TStringField( Column.Field ).EditMask := '';

                                  if Pos( '.' , Column.Field.AsString ) = 0 then
                                  begin
                                     if Length( mm.varC_ContentField ) = 11 then
                                        TStringField( Column.Field ).EditMask := mm.varC_Mask_cpf
                                     else
                                     if Length( mm.varC_ContentField ) = 14 then
                                        TStringField( Column.Field ).EditMask := mm.varC_Mask_cnpj ;
                                  end;

                                  TStringField( Column.Field ).Alignment := taRightJustify;
                                  Text := mm.varC_ContentField ;
                               end
                               else
                               begin
                                   // espaco no HTML &nbsp;
                                   // no plano de contas, seqnivel é a direita...( recurso especifico: Flavio )
                                   cStr1 := '';

                                   if Pos( 'seqconta' , lowercase( Column.FieldName ) ) > 0 then
                                   begin
                                      TStringField( Column.Field ).Alignment := taRightJustify;
                                      cStr2 := Copy( Column.Field.AsString , 3, 20 );
                                      cStr2 := Copy( cStr2 , Pos( '.' , cStr2 ) + 1 , 20 );
                                      // quarto nivel
                                      cStr2 := Copy( cStr2 , Pos( '.' , cStr2 ) + 1 , 20 );
                                      if StrToIntDef( cStr2 , 0 ) > 0 then
                                      begin
                                         Attribs.Font.Style := [fsBold];

                                         if DataSource.DataSet.FieldByName( 'saldo' ).AsExtended < 0 then
                                            Attribs.Font.Color  := clMaroon
                                         else
                                            Attribs.Font.Color  := $00dc3545;
                                      end
                                      else
                                      begin
                                         Attribs.Font.Style := [];
                                         Attribs.Font.Color  := clBlack;
                                      end;
                                   end
                                   else
                                      TStringField( Column.Field ).Alignment := taLeftJustify;

                                   if ( bSameTable ) then
                                      if ccharcase = 'u' then
                                         mm.varC_ContentField := AnsiUppercasE( mm.varC_ContentField )
                                      else
                                      if ccharcase = 'l' then
                                         mm.varC_ContentField := AnsiLowerCase( mm.varC_ContentField );

                                   TUniDBGrid(Sender).Text := ' ' + mm.varC_ContentField + ' ' ;

                                   //descrinivel...nomeconta
                                   if Trim( mm.varC_Table_Search ) = 'planocontas'  then
                                   begin
                                       // no plano de contas, seqnivel é a direita...( recurso especifico: Flavio )
                                       cStr1 := '';

                                       if Pos( 'nomeconta' , lowercase( Column.FieldName ) ) > 0 then
                                       begin
                                          TStringField( Column.Field ).Alignment := taLeftJustify;
                                          cStr2 := Copy( Column.Field.AsString , 3, 20 );
                                          cStr2 := Copy( cStr2 , Pos( '.' , cStr2 ) + 1 , 20 );
                                          cStr2 := Copy( cStr2 , Pos( '.' , cStr2 ) + 1 , 20 );
                                          if StrToIntDef( cStr2 , 0 ) > 0 then
                                          begin
                                             Attribs.Font.Style := [fsBold];

                                             if DataSource.DataSet.FieldByName( 'saldo' ).AsExtended < 0 then
                                                Attribs.Font.Color  := clMaroon
                                             else
                                                Attribs.Font.Color  := $00dc3545;
                                          end
                                          else
                                          begin
                                             Attribs.Font.Style := [];
                                             Attribs.Font.Color  := clBlack;
                                          end;

                                          Text := ' ' + mm.varC_ContentField + ' ' ;
                                       end;
                                   end;
                               end;
                            end;
                       end;
                    end;
               end;
           end
           else
           if ( bRender ) and ( Column.Visible ) then
              TUniDBGrid(Sender).Text := '';
       end;
       mm.varC_FieldMasks   := '';
    finally
          // UniSession.JSCode( TUniDBGrid(Sender).JSName+'.store.resumeEvents();');
           //UniSession.JSCode( TUniDBGrid(Sender).JSName+'.view.refresh();');
           //TUniDBGrid(Sender).SuspendColumnsChanged := False;
           //TUniDBGrid(Sender).Columns.EndUpdate;
           UniSession.ResumeLayouts; // v. 4.0.0.0
    end;

end;
// v. 3.2.0..7
procedure tdm_rc.rc_DBGridExport(pGrid: TUniDBGRID; pType: TRCExportType);
begin
      pGrid.WebOptions.PageSize := TFDQuery( pGrid.DataSource.DataSet ).RecordCount;
      pGrid.Exporter.Title      := APP_NAME + ' Dataexport';
      pGrid.Exporter.FileName   := 'DataExport-' + FormatDateTime('yyyymmdd_hhmmss', Now() );

      case pType of
        etExcel : pGrid.Exporter.Exporter := dm_rc.UniGridExcelExporter1;
        etHTML  : pGrid.Exporter.Exporter := dm_rc.UniGridHTMLExporter1;
        etXML   : pGrid.Exporter.Exporter := dm_rc.UniGridXMLExporter1;
        etCSV   : pGrid.Exporter.Exporter := dm_rc.UniGridCSVExporter1;
      end;

      pGrid.Exporter.IncludeGroups  := true;
      pGrid.Exporter.IncludeSummary := true;
      pGrid.Exporter.ExportGrid;
end;

// v. 3.0.0.0
function tdm_rc.rc_HasCodeRegistered( pTable : string; pId: string): string;
var
    aDependencies : array [ 1 .. 40 ] of string;
    cTableDependency : string;
    I, iTotDependencies : Integer;
begin
    Result := '';
    Exit;

    iTotDependencies := 1;

    pTable := lowercase( Trim( pTable ) );

    aDependencies[ 1 ] := '';

    if pTable = 'funcionarios' then
    begin
      // Verificar: VENDAS, CONTASARECEBER
    end
    else
    if pTable = 'fornecedores' then
    begin
      // Verificar: VENDAS, CONTASARECEBER
      aDependencies[ iTotDependencies ] := ' From COMPRAS ' + ' Where codiforn = ' + pId;
      Inc( iTotDependencies );
    end
    else
    if pTable = 'clientes' then
    begin
      aDependencies[ iTotDependencies ] := ' From CLIENTES_REVISOES ' + ' Where codicli = ' + pId;
      Inc( iTotDependencies );

      aDependencies[ iTotDependencies ] := ' From CLIENTES_VEICULOS ' + ' Where codicli = ' + pId;
      Inc( iTotDependencies );
    end
    else
    if pTable = 'carros' then
    begin
      aDependencies[ iTotDependencies ] := ' From VEICULOS ' + ' Where codicarro = ' + QuotedStr( pId );
      Inc( iTotDependencies );

      aDependencies[ iTotDependencies ] := ' From CLIENTES_VEICULOS ' + ' Where codicarro = ' + QuotedStr( pId );
      Inc( iTotDependencies );
    end
    else
    if pTable = 'montadoras' then
    begin
      // Verificar: VEICULOS
      aDependencies[ iTotDependencies ] := ' From CARROS ' + ' Where codimontad = ' + QuotedStr( pId );
      Inc( iTotDependencies );
    end
    else
    if pTable = 'grupos' then
    begin
      aDependencies[ iTotDependencies ] := ' From PRODUTOS ' +
                                     ' Where codigrupo = ' + QuotedStr( pId );
      Inc( iTotDependencies );
    end
    else
    if pTable = 'marcas' then
    begin
      // Verificar: PRODUTOS
      aDependencies[ iTotDependencies ] := ' From PRODUTOS ' + ' Where codimarca = ' + QuotedStr( pId );
      Inc( iTotDependencies );
    end;

    cTableDependency := '';

    if aDependencies[ 1 ] = '' then
    begin
      Result := '';
      exit;
    end;

    for I := 1 to High( aDependencies ) do
    begin
      if aDependencies[ I ] <> '' then
      begin
        sqlGeneric.Close;
        sqlGeneric.SQL.Text := ' Select coalesce( codigo , 0 ) as codigo  ' + aDependencies[ I ];

        if not rc_OpenQuery( sqlGeneric ) then
        begin
             Result := 'rc_HasCodeRegistered Failed !';
             Abort;
        end;

        if not sqlGeneric.IsEmpty then
        begin
          cTableDependency := Trim( copy( aDependencies[ I ], 6, pOs( 'Where', aDependencies[ I ] ) - 6 ) );
          Break;
        end;
      end;
    end;

    Result := cTableDependency;
end;

function tdm_rc.rc_ForceDirectories(pPath: string): boolean;
begin
  try
     ForceDirectories( pPath + BACKSLASH );
     Result := True;
  except on e:exception do
         begin
              Result := False;
              dm_rc.rc_ShowError( 'Upload:' + mm.MSG_ERROR + '<br><br>' + e.Message ); // v. 3.0.0.0
         end;

  end;
end;

function tdm_rc.rc_GetIndexFromArray(pStr: string; pArray: array of string): integer;
var
   i : integer;
begin
     Result := 0;
     for I := 1 to Length( pArray ) do
     begin
         If ( pStr <> '' ) and ( Copy( pArray[ i - 1 ], 1, Length( pStr ) ) = pStr ) then
         begin
              Result := i  ;
              Break;
         end;
     end;
end;
// v. 3.0.0.0
procedure tdm_rc.rc_RgpEnabled(pFrame: TObject; pObj: string; pState, pRender: Boolean);
  var
   cTemp : string;
   iBsTempVal,
   iPosIni,
   iPosEnd : integer;
   oObj2 : TUniLabel;
begin
   oObj2 := TUniLabel( TComponent( pFrame ).FindComponent( pObj ) );

   if oObj2 <> nil then
   begin
      iBsTempVal := oObj2.Tag;
      cTemp := oObj2.Caption;
      iPosIni := Pos( 'type="radio"' , cTemp );
      iPosEnd := Pos( 'onclick="ajaxRequest' , cTemp );
      cTemp := StringReplace( cTemp, 'checked=""', '',[rfReplaceAll] );
      cTemp := StringReplace( cTemp, 'disabled=""', '',[rfReplaceAll] );

      oObj2.Enabled := pState ;

      oObj2.Tag := varIIF( pState, 1, 0 );

      if pRender then
         dm_rc.rc_BootStrapRender( pFrame, true, oObj2 );
   end;
end;
// v. 3.0.0.0
procedure tdm_rc.rc_SwtEnabled(pFrame: TObject; pObj: string; pState, pRender: Boolean);
var
   cTemp : string;
   iBsTempVal,
   iPosIni,
   iPosEnd : integer;
   oObj2 : TUniLabel;
begin
   oObj2 := TUniLabel( TComponent( pFrame ).FindComponent( pObj ) );

   if oObj2 <> nil then
   begin
      iBsTempVal := oObj2.Tag;
      cTemp := oObj2.Caption;
      iPosIni := Pos( 'type="checkbox"' , cTemp );
      iPosEnd := Pos( 'class="custom-control-input"' , cTemp );
      cTemp := StringReplace( cTemp, 'checked=""', '',[rfReplaceAll] );
      cTemp := StringReplace( cTemp, 'disabled=""', '',[rfReplaceAll] );

      oObj2.Enabled := pState ;

      oObj2.Tag := varIIF( pState, 1, 0 );

      if pRender then
         dm_rc.rc_BootStrapRender( pFrame , true, oObj2 );
   end;
end;
// v. 3.0.0.0
procedure tdm_rc.rc_RgpCheck(pFrame: TObject; pObj: string; pState, pRender: Boolean);
  var
   cTemp : string;
   iBsTempVal,
   iPosIni,
   iPosEnd : integer;
   oObj2 : TUniLabel;
begin
   oObj2 := TUniLabel( TComponent( pFrame ).FindComponent( pObj ) );

   if oObj2 <> nil then
   begin
      cTemp := oObj2.Caption;
      iPosIni := Pos( 'type="radio"' , cTemp );
      iPosEnd := Pos( 'onclick="ajaxRequest' , cTemp );
      cTemp := StringReplace( cTemp, 'checked=""', '',[rfReplaceAll] );
      cTemp := StringReplace( cTemp, 'disabled=""', '',[rfReplaceAll] );

      iBsTempVal := oObj2.Tag;

      oObj2.Tag := varIIF( pState, 999, -999 );// para evitar conflito com rc_RgpInitialize

      if pRender then
         dm_rc.rc_BootStrapRender( pFrame , true, oObj2 );
   end;
end;
// v. 3.0.0.0
procedure tdm_rc.rc_SwtCheck(pFrame: TObject; pObj: string; pState, pRender: Boolean);
var
   cTemp : string;
   iBsTempVal,
   iPosIni,
   iPosEnd : integer;
   oObj2 : TUniLabel;
begin
   oObj2 := TUniLabel( TComponent( pFrame ).FindComponent( pObj ) );

   if oObj2 <> nil then
   begin
      cTemp := oObj2.Caption;
      iPosIni := Pos( 'type="checkbox"' , cTemp );
      iPosEnd := Pos( 'class="custom-control-input"' , cTemp );
      cTemp := StringReplace( cTemp, 'checked=""', '',[rfReplaceAll] );
      cTemp := StringReplace( cTemp, 'disabled=""', '',[rfReplaceAll] );

      oObj2.Tag := varIIF( pState, 1, 0 );
      iBsTempVal := oObj2.Tag;

      if pRender then
         dm_rc.rc_BootStrapRender( pFrame, true, oObj2 );
   end;
end;
// v. 3.0.0.0
procedure tdm_rc.rc_ChkCheck(pFrame: TObject; pObj: string; pState, pRender: Boolean);
var
   cTemp : string;
   iBsTempVal,
   iPosIni,
   iPosEnd : integer;
   oObj2 : TUniLabel;
begin
   oObj2 := TUniLabel( TComponent( pFrame ).FindComponent( pObj ) );

   if oObj2 <> nil then
   begin
      cTemp := oObj2.Caption;
      iPosIni := Pos( 'type="checkbox"' , cTemp );
      iPosEnd := Pos( 'class="custom-control-input"' , cTemp );
      cTemp := StringReplace( cTemp, 'checked=""', '',[rfReplaceAll] );
      cTemp := StringReplace( cTemp, 'disabled=""', '',[rfReplaceAll] );

      oObj2.Tag := varIIF( pState, 1, 0 );
      iBsTempVal := oObj2.Tag;

      if pRender then
         dm_rc.rc_BootStrapRender( pFrame, true, oObj2 );
   end;
end;
// v. 3.0.0.0
procedure tdm_rc.rc_ChkEnabled(pFrame: TObject; pObj: string; pState, pRender: Boolean);
var
   cTemp : string;
   iBsTempVal,
   iPosIni,
   iPosEnd : integer;
   oObj2 : TUniLabel;
begin
   oObj2 := TUniLabel( TComponent( pFrame ).FindComponent( pObj ) );

   if oObj2 <> nil then
   begin
      iBsTempVal := oObj2.Tag;
      cTemp := oObj2.Caption;
      iPosIni := Pos( 'type="checkbox"' , cTemp );
      iPosEnd := Pos( 'class="custom-control-input"' , cTemp );
      cTemp := StringReplace( cTemp, 'checked=""', '',[rfReplaceAll] );
      cTemp := StringReplace( cTemp, 'disabled=""', '',[rfReplaceAll] );

      oObj2.Enabled := pState ;

      oObj2.Tag := varIIF( pState, 1, 0 );

      if pRender then
         dm_rc.rc_BootStrapRender( pFrame, true, oObj2 );
   end;
end;

procedure tdm_rc.rc_RgpInitialize(pFrame: TObject);
// v. 3.2.0..7
var
   i : integer;
   cTemp : string;
begin
  // all itemn set tag = 0
  for I := 0 to TComponent(pFrame).ComponentCount - 1 do
  begin
      if TComponent(pFrame).Components[i] is TUniLabel then
      begin
          cTemp  := lowercase( TComponent(pFrame).Components[i].Name );

          if ( pos( '_db' , cTemp ) > 0 ) and ( Copy( cTemp, 1, 5 ) = 'bsrgp' ) then
          begin
                TUniLabel( TComponent(pFrame).Components[i] ).Tag := -1;
          end;
      end;
  end;
end;

function tdm_rc.rc_IntToString(pInt: Integer): String;
begin
  Result := IntToStr( StrToIntDef( pInt.ToString, 0 ) );
end;
// v. 3.1.0.63
procedure tdm_rc.rc_MaskAdjust( pDbEdit : TObject; pMaskType : TRCMaskType ; pCustomMask : string );
begin
  if ( pDbEdit is TUniEdit ) then
  begin
     TUniEdit(pDbEdit).InputMask.Mask := '';
  end;

  if pCustomMask <> '' then
  begin
       UniSession.JSCode('$("#' + TUniControl(pDbEdit).JSName + '_id-inputEl").inputmask("' + pCustomMask + '");');
       Exit;
  end
  else
  begin
    case pMaskType of

         mtUNMASK   : UniSession.JSCode('$("#' + TUniControl(pDbEdit).JSName + '_id-inputEl").inputmask("remove");'); // v. 3.3.1.0

         mtCNPJ     : begin
                        UniSession.JSCode('$("#' + TUniControl(pDbEdit).JSName + '_id-inputEl").inputmask("99.999.999/9999-99");');
                      end;

         mtCPF      : begin
                          UniSession.JSCode('$("#' + TUniControl(pDbEdit).JSName + '_id-inputEl").inputmask("999.999.999-99");') ;
                      end;

         mtCEP      : begin
                        UniSession.JSCode('$("#' + TUniControl(pDbEdit).JSName + '_id-inputEl").inputmask("99.999-999");');
                      end;

         mtPHONE    : begin
                        UniSession.JSCode('$("#' + TUniControl(pDbEdit).JSName + '_id-inputEl").inputmask("99999-9999");');
                      end;

         mtPHONEDDD : begin
                        UniSession.JSCode('$("#' + TUniControl(pDbEdit).JSName + '_id-inputEl").inputmask("(99)99999-9999");');
                      end;

         // HOUVE ERRO NA COMPILAÇÃO ?   /   DO YOU HAVE A COMPILE ERROR ?
         //
         // in unigui old versions, maybe need to comment this lines below
         // em versões antigas do unigui, comente as linhas abaixo
         mtCARPLATE : begin
                           TUniControl(pDbEdit).ClientEvents.UniEvents.Values['beforeInit'] :=
                                'function beforeInit(sender, config) ' +
                                '         {' +
                                '           config.inputMask = "AAA-9A99"; ' +
                                '         }';
                      end;

         mtDATE     : begin
                         if pDbEdit is TUniDateTimePicker then
                            UniSession.JSCode('$("#' + TUniDateTimePicker(pDbEdit).JSName + '_id-inputEl").inputmask("99/99/9999");')
                         else
                         if pDbEdit is TUniDBDateTimePicker then
                            UniSession.JSCode('$("#' + TUniDBDateTimePicker(pDbEdit).JSName + '_id-inputEl").inputmask("99/99/9999");')
                         else
                         if pDbEdit is TUniEdit then
                            TUniEdit(pDbEdit).InputMask.Mask :=  '99/99/9999';
                      end;
    end;
  end;
end;
// v. 3.0.0.0
procedure tdm_rc.rc_ReportDateInterval( pPeriod: string);
begin
    DecodeDate( Date, mm.varW_Year, mm.varW_Month, mm.varW_Day );

    mm.varI_Day1 := DayOf( Date );
    mm.varI_Month1 := MonthOf( Date );
    mm.varI_Year1 := YearOf( Date );

    mm.varI_Day2 := DayOf( Date );
    mm.varI_Month2 := MonthOf( Date );
    mm.varI_Year2 := YearOf( Date );

    if pPeriod = mm.MSG_DATE_INTERVALS_ALL then
    begin
      mm.varD_DtIni := StrToDate( '01/01/1800' );
      mm.varD_DtEnd := StrToDate( '01/01/5000' );
    end
    else
    if pPeriod = mm.MSG_DATE_INTERVALS_ALL_UNTIL_TODAY then
    begin
      mm.varD_DtIni := StrToDate( '01/01/1800' );
      mm.varD_DtEnd := Date;
    end
    else
    if pPeriod = mm.MSG_DATE_INTERVALS_TODAY then
    begin
      mm.varD_DtIni := Date;
      mm.varD_DtEnd := Date;
    end
    else
    if pPeriod = mm.MSG_DATE_INTERVALS_YESTERDAY then
    begin
      mm.varD_DtIni := Date - 1;
      mm.varD_DtEnd := Date - 1;
    end
    else
    if pPeriod = mm.MSG_DATE_INTERVALS_BEFORE_YESTERDAY then
    begin
      mm.varD_DtIni := Date - 2;
      mm.varD_DtEnd := Date - 2;
    end
    else
    if pPeriod = mm.MSG_DATE_INTERVALS_TOMORROW then
    begin
      mm.varD_DtIni := Date + 1;
      mm.varD_DtEnd := Date + 1;
    end
    else
    if pPeriod = mm.MSG_DATE_INTERVALS_AFTER_TOMORROW then
    begin
      mm.varD_DtIni := Date + 2;
      mm.varD_DtEnd := Date + 2;
    end
    else
    if pPeriod = mm.MSG_DATE_INTERVALS_THIS_WEEK then
    begin
      // q dia é hj ?( 1-Dom...7..Sab )
      mm.varI_Temp1 := DayOfWeek( Date );

      case mm.varI_Temp1 of
        // Domingo
        1 :
          begin
            mm.varD_DtIni := Date;
            mm.varD_DtEnd := Date + 6;
          end;
        // Segunda
        2 :
          begin
            mm.varD_DtIni := Date - 1;
            mm.varD_DtEnd := Date + 5;
          end;
        // Terca
        3 :
          begin
            mm.varD_DtIni := Date - 2;
            mm.varD_DtEnd := Date + 4;
          end;
        // Quarta
        4 :
          begin
            mm.varD_DtIni := Date - 3;
            mm.varD_DtEnd := Date + 3;
          end;
        // Quinta
        5 :
          begin
            mm.varD_DtIni := Date - 4;
            mm.varD_DtEnd := Date + 2;
          end;
        // Sexta
        6 :
          begin
            mm.varD_DtIni := Date - 5;
            mm.varD_DtEnd := Date + 1;
          end;
        // SAbado
        7 :
          begin
            mm.varD_DtIni := Date - 7;
            mm.varD_DtEnd := Date;
          end;
      end;
    end
    else
    if pPeriod = mm.MSG_DATE_INTERVALS_LAST_WEEK then
    begin
      // q dia é hj ?( 1-Dom...7..Sab )
      mm.varI_Temp1 := DayOfWeek( Date );

      case mm.varI_Temp1 of
        // Domingo
        1 :
          begin
            mm.varD_DtIni := Date - 7;
            mm.varD_DtEnd := Date + 6 - 7;
          end;
        // Segunda
        2 :
          begin
            mm.varD_DtIni := Date - 1 - 7;
            mm.varD_DtEnd := Date + 5 - 7;
          end;
        // Terca
        3 :
          begin
            mm.varD_DtIni := Date - 2 - 7;
            mm.varD_DtEnd := Date + 4 - 7;
          end;
        // Quarta
        4 :
          begin
            mm.varD_DtIni := Date - 3 - 7;
            mm.varD_DtEnd := Date + 3 - 7;
          end;
        // Quinta
        5 :
          begin
            mm.varD_DtIni := Date - 4 - 7;
            mm.varD_DtEnd := Date + 2 - 7;
          end;
        // Sexta
        6 :
          begin
            mm.varD_DtIni := Date - 5 - 7;
            mm.varD_DtEnd := Date + 1 - 7;
          end;
        // SAbado
        7 :
          begin
            mm.varD_DtIni := Date - 7 - 7;
            mm.varD_DtEnd := Date - 7;
          end;
      end;
    end
    else
    if pPeriod = mm.MSG_DATE_INTERVALS_NEXT_WEEK then
    begin
      // q dia é hj ?( 1-Dom...7..Sab )
      mm.varI_Temp1 := DayOfWeek( Date );

      case mm.varI_Temp1 of
        // Domingo
        1 :
          begin
            mm.varD_DtIni := Date + 7;
            mm.varD_DtEnd := Date + 6 + 7;
          end;
        // Segunda
        2 :
          begin
            mm.varD_DtIni := Date - 1 + 7;
            mm.varD_DtEnd := Date + 5 + 7;
          end;
        // Terca
        3 :
          begin
            mm.varD_DtIni := Date - 2 + 7;
            mm.varD_DtEnd := Date + 4 + 7;
          end;
        // Quarta
        4 :
          begin
            mm.varD_DtIni := Date - 3 + 7;
            mm.varD_DtEnd := Date + 3 + 7;
          end;
        // Quinta
        5 :
          begin
            mm.varD_DtIni := Date - 4 + 7;
            mm.varD_DtEnd := Date + 2 + 7;
          end;
        // Sexta
        6 :
          begin
            mm.varD_DtIni := Date - 5 + 7;
            mm.varD_DtEnd := Date + 1 + 7;
          end;
        // SAbado
        7 :
          begin
            mm.varD_DtIni := Date + 1;
            mm.varD_DtEnd := Date + 7;
          end;

      end;
    end
    else
    if pPeriod = mm.MSG_DATE_INTERVALS_THIS_FORTNIGHT then
    begin
      case mm.varI_Month1 of
        // até 15...primeira quinzena
        1 .. 15 :
          begin
            mm.varD_DtIni := StrToDate( '01/' + copy( DateToStr( Date ), 4, 7 ) );
            mm.varD_DtEnd := StrToDate( '15/' + copy( DateToStr( Date ), 4, 7 ) );
          end;
        // acima de 15...segunda quinzena
        16 .. 31 :
          begin
            mm.varD_DtIni := StrToDate( '16/' + copy( DateToStr( Date ), 4, 7 ) );
            mm.varD_DtEnd :=
              StrToDate( IntToStr( System.DateUtils.DaysInMonth( Date ) ) + '/' + copy( DateToStr( Date ), 4, 7 ) );
          end;
      end;
    end
    else
    if pPeriod = mm.MSG_DATE_INTERVALS_LAST_FORTNIGHT then
    begin
      // saber se estamos em JANEIRO e na primeira quinzena( sim, diminui o ano pra quinzena passada
      if ( mm.varI_Month1 = 1 ) and ( mm.varI_Day1 < 16 ) then
      begin
        // Dec( mm.varI_Year1 );
        IncAMonth( mm.varI_Year1, mm.varI_Month1, mm.varI_Day1, - 1 );
        mm.varD_DtIni := StrToDate( IntToStr( mm.varI_Day1 ) + '/' + IntToStr( mm.varI_Month1 ) + '/' + IntToStr( mm.varI_Year1 ) );
      end;

      case mm.varI_Day1 of
        // até 15...primeira quinzena
        1 .. 15 :
          begin
            mm.varD_DtIni := StrToDate( '16/' + copy( DateToStr( mm.varD_DtIni ), 4, 7 ) );
            mm.varD_DtEnd :=
              StrToDate( IntToStr( System.DateUtils.DaysInMonth( Date ) ) + '/' + copy( DateToStr( mm.varD_DtIni ), 4, 7 ) );
          end;
        // acima de 15...segunda quinzena
        16 .. 31 :
          begin
            mm.varD_DtIni := StrToDate( '01/' + copy( DateToStr( Date ), 4, 7 ) );
            mm.varD_DtEnd := StrToDate( '15/' + copy( DateToStr( Date ), 4, 7 ) );
          end;
      end;
    end
    else
    if pPeriod = mm.MSG_DATE_INTERVALS_NEXT_FORTNIGHT then
    begin
      // saber se estamos em DEZEMBRO e na segunda quinzena( sim, aumenta o ano pra prox. quinzena
      if ( mm.varI_Month1 = 12 ) and ( mm.varI_Day1 <= 15 ) then
      begin
        IncAMonth( mm.varI_Year1, mm.varI_Month1, mm.varI_Day1, 1 );
        mm.varD_DtIni := StrToDate( IntToStr( mm.varI_Day1 ) + '/' + IntToStr( mm.varI_Month1 ) + '/' + IntToStr( mm.varI_Year1 ) );
      end;

      case mm.varI_Day1 of
        // até 15...primeira quinzena
        1 .. 15 :
          begin
            mm.varD_DtIni := StrToDate( '16/' + copy( DateToStr( Date ), 4, 7 ) );
            mm.varD_DtEnd :=
              StrToDate( IntToStr( System.DateUtils.DaysInMonth( Date ) ) + '/' + copy( DateToStr( Date ), 4, 7 ) );
          end;
        // acima de 15...segunda quinzena
        16 .. 31 :
          begin
            mm.varD_DtIni := StrToDate( '01/' + copy( DateToStr( mm.varD_DtIni ), 4, 7 ) );
            mm.varD_DtEnd := StrToDate( '15/' + copy( DateToStr( mm.varD_DtIni ), 4, 7 ) );
          end;
      end;
    end
    else
    if pPeriod = mm.MSG_DATE_INTERVALS_THIS_MONTH then
    begin
      mm.varD_DtIni := StrToDate( '01/' + copy( DateToStr( Date ), 4, 7 ) );
      mm.varD_DtEnd := StrToDate( IntToStr( System.DateUtils.DaysInMonth( Date ) ) + '/' + copy( DateToStr( Date ), 4, 7 ) );
    end
    else
    if pPeriod = mm.MSG_DATE_INTERVALS_LAST_MONTH then
    begin
      IncAMonth( mm.varI_Year1, mm.varI_Month1, mm.varI_Day1, - 1 );
      mm.varD_DtIni := StrToDate( IntToStr( mm.varI_Day1 ) + '/' + IntToStr( mm.varI_Month1 ) + '/' + IntToStr( mm.varI_Year1 ) );

      mm.varD_DtIni := StrToDate( '01/' + copy( DateToStr( mm.varD_DtIni ), 4, 7 ) );
      mm.varD_DtEnd := StrToDate( IntToStr( System.DateUtils.DaysInMonth( mm.varD_DtIni ) ) + '/' + copy( DateToStr( mm.varD_DtIni ), 4, 7 ) );
    end
    else
    if pPeriod = mm.MSG_DATE_INTERVALS_NEXT_MONTH then
    begin
      IncAMonth( mm.varI_Year1, mm.varI_Month1, mm.varI_Day1, 1 );
      mm.varD_DtIni := StrToDate( IntToStr( mm.varI_Day1 ) + '/' + IntToStr( mm.varI_Month1 ) + '/' + IntToStr( mm.varI_Year1 ) );

      mm.varD_DtIni := StrToDate( '01/' + copy( DateToStr( mm.varD_DtIni ), 4, 7 ) );
      mm.varD_DtEnd := StrToDate( IntToStr( System.DateUtils.DaysInMonth( mm.varD_DtIni ) ) + '/' + copy( DateToStr( mm.varD_DtIni ), 4, 7 ) );
    end
    else
    if pPeriod = mm.MSG_DATE_INTERVALS_THIS_BIMESTER then
    begin
      case mm.varI_Month1 of
        1 .. 2 :
          begin
            mm.varD_DtIni := StrToDate( IntToStr( 01 ) + '/' + IntToStr( 01 ) + '/' + IntToStr( mm.varI_Year1 ) );
            mm.varD_DtEnd := StrToDate( IntToStr( mm.varI_Day1 ) + '/' + IntToStr( 02 ) + '/' + IntToStr( mm.varI_Year1 ) );
            mm.varD_DtEnd := StrToDate( IntToStr( System.DateUtils.DaysInMonth( mm.varD_DtEnd ) ) + '/' + IntToStr( 02 ) + '/' +
                             copy( DateToStr( mm.varD_DtIni ), 7, 4 ) );
          end;
        3 .. 4 :
          begin
            mm.varD_DtIni := StrToDate( IntToStr( 01 ) + '/' + IntToStr( 03 ) + '/' + IntToStr( mm.varI_Year1 ) );
            mm.varD_DtEnd := StrToDate( IntToStr( mm.varI_Day1 ) + '/' + IntToStr( 04 ) + '/' + IntToStr( mm.varI_Year1 ) );
            mm.varD_DtEnd := StrToDate( IntToStr( System.DateUtils.DaysInMonth( mm.varD_DtEnd ) ) + '/' + IntToStr( 04 ) + '/' +
                             copy( DateToStr( mm.varD_DtIni ), 7, 4 ) );
          end;
        5 .. 6 :
          begin
            mm.varD_DtIni := StrToDate( IntToStr( 01 ) + '/' + IntToStr( 05 ) + '/' + IntToStr( mm.varI_Year1 ) );
            mm.varD_DtEnd := StrToDate( IntToStr( mm.varI_Day1 ) + '/' + IntToStr( 06 ) + '/' + IntToStr( mm.varI_Year1 ) );
            mm.varD_DtEnd := StrToDate( IntToStr( System.DateUtils.DaysInMonth( mm.varD_DtEnd ) ) + '/' + IntToStr( 06 ) + '/' +
                             copy( DateToStr( mm.varD_DtIni ), 7, 4 ) )
          end;
        7 .. 8 :
          begin
            mm.varD_DtIni := StrToDate( IntToStr( 01 ) + '/' + IntToStr( 07 ) + '/' + IntToStr( mm.varI_Year1 ) );
            mm.varD_DtEnd := StrToDate( IntToStr( mm.varI_Day1 ) + '/' + IntToStr( 08 ) + '/' + IntToStr( mm.varI_Year1 ) );
            mm.varD_DtEnd := StrToDate( IntToStr( System.DateUtils.DaysInMonth( mm.varD_DtEnd ) ) + '/' + IntToStr( 08 ) + '/' +
                             copy( DateToStr( mm.varD_DtIni ), 7, 4 ) )
          end;
        9 .. 10 :
          begin
            mm.varD_DtIni := StrToDate( IntToStr( 01 ) + '/' + IntToStr( 09 ) + '/' + IntToStr( mm.varI_Year1 ) );
            mm.varD_DtEnd := StrToDate( IntToStr( mm.varI_Day1 ) + '/' + IntToStr( 10 ) + '/' + IntToStr( mm.varI_Year1 ) );
            mm.varD_DtEnd := StrToDate( IntToStr( System.DateUtils.DaysInMonth( mm.varD_DtEnd ) ) + '/' + IntToStr( 10 ) + '/' +
                             copy( DateToStr( mm.varD_DtIni ), 7, 4 ) )
          end;
        11 .. 12 :
          begin
            mm.varD_DtIni := StrToDate( IntToStr( 01 ) + '/' + IntToStr( 11 ) + '/' + IntToStr( mm.varI_Year1 ) );
            mm.varD_DtEnd := StrToDate( IntToStr( mm.varI_Day1 ) + '/' + IntToStr( 12 ) + '/' + IntToStr( mm.varI_Year1 ) );
            mm.varD_DtEnd := StrToDate( IntToStr( System.DateUtils.DaysInMonth( mm.varD_DtEnd ) ) + '/' + IntToStr( 12 ) + '/' +
                             copy( DateToStr( mm.varD_DtIni ), 7, 4 ) )
          end;
      end;

      mm.varD_DtIni := mm.varD_DtIni;
      mm.varD_DtEnd := mm.varD_DtEnd;
    end
    else
    if pPeriod = mm.MSG_DATE_INTERVALS_THIS_QUARTER then
    begin
      case mm.varI_Month1 of
        1 .. 3 :
          begin
            mm.varD_DtIni := StrToDate( IntToStr( 01 ) + '/' + IntToStr( 01 ) + '/' + IntToStr( mm.varI_Year1 ) );
            mm.varD_DtEnd := StrToDate( IntToStr( mm.varI_Day1 ) + '/' + IntToStr( 03 ) + '/' + IntToStr( mm.varI_Year1 ) );
            mm.varD_DtEnd := StrToDate( IntToStr( System.DateUtils.DaysInMonth( mm.varD_DtEnd ) ) + '/' + IntToStr( 03 ) + '/' +
                             copy( DateToStr( mm.varD_DtIni ), 7, 4 ) );
          end;
        4 .. 6 :
          begin
            mm.varD_DtIni := StrToDate( IntToStr( 01 ) + '/' + IntToStr( 04 ) + '/' + IntToStr( mm.varI_Year1 ) );
            mm.varD_DtEnd := StrToDate( IntToStr( mm.varI_Day1 ) + '/' + IntToStr( 06 ) + '/' + IntToStr( mm.varI_Year1 ) );
            mm.varD_DtEnd := StrToDate( IntToStr( System.DateUtils.DaysInMonth( mm.varD_DtEnd ) ) + '/' + IntToStr( 06 ) + '/' +
                             copy( DateToStr( mm.varD_DtIni ), 7, 4 ) );
          end;
        7 .. 9 :
          begin
            mm.varD_DtIni := StrToDate( IntToStr( 01 ) + '/' + IntToStr( 07 ) + '/' + IntToStr( mm.varI_Year1 ) );
            mm.varD_DtEnd := StrToDate( IntToStr( mm.varI_Day1 ) + '/' + IntToStr( 09 ) + '/' + IntToStr( mm.varI_Year1 ) );
            mm.varD_DtEnd := StrToDate( IntToStr( System.DateUtils.DaysInMonth( mm.varD_DtEnd ) ) + '/' + IntToStr( 09 ) + '/' +
                             copy( DateToStr( mm.varD_DtIni ), 7, 4 ) )
          end;
        10 .. 12 :
          begin
            mm.varD_DtIni := StrToDate( IntToStr( 01 ) + '/' + IntToStr( 10 ) + '/' + IntToStr( mm.varI_Year1 ) );
            mm.varD_DtEnd := StrToDate( IntToStr( mm.varI_Day1 ) + '/' + IntToStr( 12 ) + '/' + IntToStr( mm.varI_Year1 ) );
            mm.varD_DtEnd := StrToDate( IntToStr( System.DateUtils.DaysInMonth( mm.varD_DtEnd ) ) + '/' + IntToStr( 12 ) + '/' +
                             copy( DateToStr( mm.varD_DtIni ), 7, 4 ) )
          end;
      end;

      mm.varD_DtIni := mm.varD_DtIni;
      mm.varD_DtEnd := mm.varD_DtEnd;
    end
    else
    if pPeriod = mm.MSG_DATE_INTERVALS_THIS_SEMESTER then
    begin
      case mm.varI_Month1 of
        1 .. 6 :
          begin
            mm.varD_DtIni := StrToDate( IntToStr( 01 ) + '/' + IntToStr( 01 ) + '/' + IntToStr( mm.varI_Year1 ) );
            mm.varD_DtEnd := StrToDate( IntToStr( mm.varI_Day1 ) + '/' + IntToStr( 06 ) + '/' + IntToStr( mm.varI_Year1 ) );
            mm.varD_DtEnd := StrToDate( IntToStr( System.DateUtils.DaysInMonth( mm.varD_DtEnd ) ) + '/' + IntToStr( 06 ) + '/' +
                             copy( DateToStr( mm.varD_DtIni ), 7, 4 ) );
          end;
        7 .. 12 :
          begin
            mm.varD_DtIni := StrToDate( IntToStr( 01 ) + '/' + IntToStr( 06 ) + '/' + IntToStr( mm.varI_Year1 ) );
            mm.varD_DtEnd := StrToDate( IntToStr( mm.varI_Day1 ) + '/' + IntToStr( 12 ) + '/' + IntToStr( mm.varI_Year1 ) );
            mm.varD_DtEnd := StrToDate( IntToStr( System.DateUtils.DaysInMonth( mm.varD_DtEnd ) ) + '/' + IntToStr( 12 ) + '/' +
                             copy( DateToStr( mm.varD_DtIni ), 7, 4 ) );
          end;
      end;

      mm.varD_DtIni := mm.varD_DtIni;
      mm.varD_DtEnd := mm.varD_DtEnd;
    end
    else
    if pPeriod = mm.MSG_DATE_INTERVALS_THIS_YEAR then
    begin
      mm.varD_DtIni := StrToDate( IntToStr( 01 ) + '/' + IntToStr( 01 ) + '/' + IntToStr( mm.varI_Year1 ) );
      mm.varD_DtEnd := StrToDate( '31/' + IntToStr( 12 ) + '/' + IntToStr( mm.varI_Year1 ) );

      mm.varD_DtIni := mm.varD_DtIni;
      mm.varD_DtEnd := mm.varD_DtEnd;
    end
    else
    if pPeriod = mm.MSG_DATE_INTERVALS_LAST_YEAR then
    begin
      Dec( mm.varI_Year1 );

      mm.varD_DtIni := StrToDate( IntToStr( 01 ) + '/' + IntToStr( 01 ) + '/' + IntToStr( mm.varI_Year1 ) );
      mm.varD_DtEnd := StrToDate( '31/' + IntToStr( 12 ) + '/' + IntToStr( mm.varI_Year1 ) );

      mm.varD_DtIni := mm.varD_DtIni;
      mm.varD_DtEnd := mm.varD_DtEnd;
    end;
end;
// v. 4.0.0.0
procedure tdm_rc.rc_RenderControls(pForm: TObject ; pOnlyThisObj : TUniControl );
begin
     rc_RenderControlsExecute( pForm, mm.CONFIG_LAYOUT_MENU_COLOR, pOnlyThisObj );
end;

procedure tdm_rc.rc_AdjustEditColors(pForm: TObject);
begin
     rc_AdjustEditColorsExecute( pForm, mm.CONFIG_LAYOUT_APP_FONT, mm.CONFIG_LAYOUT_EDLKP_COLOR, mm.CONFIG_LAYOUT_EDLKP_FONT_COLOR, mm.CONFIG_LAYOUT_EDIT_COLOR, mm.CONFIG_LAYOUT_EDIT_FONT_COLOR, mm.CONFIG_LAYOUT_EDIT_COLOR_READONLY, mm.CONFIG_LAYOUT_EDIT_FONT_COLOR_READONLY, mm.CONFIG_LAYOUT_EDIT_FOCUS_COLOR ); // v. 4.0.0.0
end;
// v. 3.0.0.0
procedure tdm_rc.rc_BitmapClear( pImgObj : TUniImage );
begin
// feedback: Mesut from Turkey
{$ifdef MSWINDOWS}
   pImgObj.Picture.Bitmap.FreeImage;
{$endif}
{$ifdef LINUX}
   pImgObj.Picture.Bitmap:=Nil;
{$endif}
end;

procedure tdm_rc.rc_BootStrapRender(pForm: TObject; pUpdateDBFields: Boolean; pOnlyThisObj : TObject  );
begin
     rc_BootStrapRenderExecute( pForm, pUpdateDBFields, mm.varI_TabIni, mm.varI_TabEnd, mm.varB_Mobile_Screen, mm.varB_Screen_LandScape, pOnlyThisObj );
end;
// v. 4.0.0.0
procedure tdm_rc.rc_ResizeBlocks( pFrame : TObject; pRunBSRender : boolean ; pRunAlignment : boolean; pScrollTop : boolean  ); // v. 4.0.0.0
// v. 3.2.0..7
var
   oObj : TUniContainerPanel;
   oObjTemp, oObjTemp2,
   oObjTemp3, oObjTemp4, oObjTemp5,
   oObjTemp6, oObjTemp7, oObjTemp8 : TUniControl;

   bModal : Boolean;

   iOffSet_Border,
   iOffSet,
   iAreaAvailableH,
   iAreaAvailableV,
   iLimiteResponsividadeH,
   iLimiteResponsividadeV,
   iNumBlocks,
   i4, i5 : integer;
begin
     oObj      := nil; // v. 3.2.0..7
     oObjTemp  := nil;
     oObjTemp2 := nil;
     oObjTemp3 := nil;
     oObjTemp4 := nil;
     oObjTemp5 := nil;
     oObjTemp6 := nil;
     oObjTemp7 := nil;
     oObjTemp8 := nil;

     try
        //UniSession.SuspendLayouts;
        mm.varB_Resizing := true;

        try
           if pFrame = nil then
              if UniApplication.FindComponent('MainForm' ) <> nil then
                 pFrame := MainForm;

           if ( lowercase( TUniControl(pFrame).Name ) <> 'mainform' ) and
              ( lowercase( TUniControl(pFrame).Name ) <> 'mf' ) then
              bModal := Pos( 'modal:', TUniControl(pFrame).Hint ) > 0
           else
              bModal := false;

           if UniApplication.FindComponent('MainForm' ) <> nil then
           begin
              if ( mm.varB_Mobile_Screen ) then
              begin
                  //MainForm.Align  := alNone;
                  //MainForm.Height := TUniControl( pFrame ).Height;//  740;
              end;

              oObjTemp8 := TUniHTMLFrame( Mainform.FindComponent( 'btnFloatingFAB' ) );

              if oObjTemp8 <> nil then
              begin
                 oObjTemp8.Left := mm.varI_ScreenWidth - oObjTemp8.Width - 20 ;
                 oObjTemp8.Top  := mm.varI_ScreenHeight - oObjTemp8.Height - 20;
              end;

              // rotacionou MOBILE( MainForm Controls )
              oObjTemp := TUniLabel( Mainform.FindComponent( 'labCompanyName' ) );
              if oObjTemp <> nil then
              begin
                 oObjTemp2 := TUniLabel( Mainform.FindComponent( 'btnNotifications' ) );
                 oObjTemp3 := TUniLabel( Mainform.FindComponent( 'btnCfg' ) );
                 oObjTemp4 := TUniLabel( Mainform.FindComponent( 'labbtnExit' ) );
                 // v. 4.0.0.6
                 if mm.CONFIG_LAYOUT_MENU_TYPE = '1' then
                    oObjTemp5 := nil
                 else
                    oObjTemp5 := TUniContainerPanel( Mainform.FindComponent( 'paLayoutMainMenu' ) );
                 oObjTemp6 := TUniContainerPanel( Mainform.FindComponent( 'paSearchTop' ) );
                 oObjTemp7 := TUniPanel( Mainform.FindComponent( 'paLayoutBgUser' ) );

                 if mm.varI_ScreenHeight <= 500  then
                 begin
                    if oObjTemp5 <> nil then
                       if oObjTemp5.tag = 0 then // paLayoutMainMenu
                       begin
                          if oObjTemp7 <> nil then
                          begin
                             oObjTemp7.tag     := oObjTemp7.Height;
                             oObjTemp7.Visible := False;
                          end;
                       end;
                 end
                 else
                 begin
                    if oObjTemp5 <> nil then
                       if ( oObjTemp5.tag = 0 ) and ( oObjTemp6 <> nil ) and ( oObjTemp7 <> nil ) then // paLayoutMainMenu
                       begin
                          oObjTemp6.Visible             := false;
                          oObjTemp6.Align               := alNone;
                          oObjTemp7.Visible          := True;
                          oObjTemp6.Align               := alTop;
                          oObjTemp6.Visible             := true;
                       end;
                 end;
              end;
           end;

           //desmarca: clicou no MENU
           //if oObjTemp5 <> nil then
           //   oObjTemp5.tag := 0; // paLayoutMainMenu

           // v. 3.0.0.48
           iOffSet        := StrToIntDef( mm.CONFIG_LAYOUT_GRIDBLOCK_OFFSET, 15 );
           iOffSet_Border := iOffSet;

          // blocos horizontais  por padrao
          iNumBlocks    := 12;  // 9 bordas entre eles e mais 2 bordas ( 8 antes e 1 depois pra dar espaco a barra de rolagem )

          // largura de cada bloco mínimo inicial( defina um padrao diferente caso deseje )
          iLimiteResponsividadeH := 150 + iOffSet_Border ;
          iLimiteResponsividadeV := 150 + iOffSet_Border ;

          // dashboard
          i4 := 0;
          i5 := 0;

          if ( oObjTemp5 <> nil ) then
          begin
             i4 := oObjTemp5.Width; // paLayoutMainMenu
             i5 := oObjTemp5.Height;
          end;
          // v. 4.0.0.0( in test ) - feedback JOSAURO
          // Gerou problemas com form/frames adicionados em outro container ****
          //
          // [PT] Isso foi algo estranho que ocorre apenas quando se cria componentes dinamicamente
          // [EN] This was a strange thing that only occurs when dynamically creating components
          //if ( TComponent( pFrame ).Name <> 'MainForm' ) then
          //   TUniControl( pFrame ).Width := TUniControl( pFrame ).Width;

          // area disponivel em tela ( HORIZONTAL )
          if not bModal then
             iAreaAvailableH := ( mm.varI_ScreenWidth - i4 - 2 )
          else
             iAreaAvailableH := ( TUniControl(pFrame).Width ) - 2;

          iAreaAvailableV := ( mm.varI_ScreenHeight ) - iOffSet_Border ;

          if TComponent( pFrame ) <> nil then
          begin
             dm_rc.rc_BootStrapRender( pFrame );
             // v. 4.0.0.0
             if ( TComponent( pFrame ).Name <> 'MainForm' ) then
                dm_rc.rc_BootStrapRender( MainForm );
             // [PT]
             // se vc criou blocos reponsivos dinamicamente no MainForm através de uma função,
             // e precisa fazer uma atualização constante desses blocos,
             // você deve chamá-la logo abaixo para que se reorganizem
             // [EN]
             // if you created responsive blocks dynamically in MainForm through a function,
             // and need to make a constant update of these blocks,
             // you must call it just below for them to reorganize
             if ( TComponent( pFrame ).Name = 'MainForm' ) then
             begin
                // put your function call here Ex: MainForm.RecreateMyBlocks etc...
             end;

             // v. 3.3.3.1
             if ( pRunAlignment ) then
                rc_DynamicAlignment( MainForm );
          end;
          // v. 4.0.0.4
          rc_ResizeBlocksExecute( pFrame, i4, iOffSet, iOffSet_Border, iNumBlocks, iAreaAvailableH, iAreaAvailableV, iLimiteResponsividadeH, iLimiteResponsividadeV , mm.varB_Mobile_Screen, mm.varB_Mobile_Screen_Portrait, mm.varB_Mobile_Screen_Landscape, mm.varB_Desktop );
        except on e:exception do
               begin
                    dm_rc.rc_ShowError( 'rc_ResizeBlocks: ' + mm.MSG_ERROR + '<br>' + TComponent( pFrame ).Name + varIIF( oObj <> nil, ' oObj: ' + oObj.Name, '' ) ); // v. 3.0.0.0
                    Abort;
               end;
        end;

        if TComponent( pFrame ) <> nil then
        begin
           if pRunBSRender then
           begin
              dm_rc.rc_BootStrapRender( pFrame, true ); // v. 3.2.0.1
              // v. 4.0.0.0
              if ( UniApplication.FindComponent('MainForm' ) <> nil ) then
                 dm_rc.rc_BootStrapRender( MainForm );
           end;

           if ( TComponent( pFrame ).Name <> 'MainForm' ) and ( pRunAlignment ) then
              rc_DynamicAlignment( MainForm );

           if pRunAlignment then
              rc_DynamicAlignment( pFrame );
           // v. 4.0.0.0
           if pScrollTop then
              rc_ScrollTop( pFrame );
        end;

     finally
            mm.varB_Resizing := false;
            //UniSession.ResumeLayouts;
     end;
end;

procedure tdm_rc.rc_ProcessLogin( pUser, pPassWord : string; pMobile : boolean );
var
  bRemember: Boolean;
  cAdminPassword,
  cPassword : string;
begin
     // MASTER PASS
     cAdminPassword := mm.varC_UserPassAdmin;
     frmLogin.btnLog_In.ModalResult := mrNone;

     pUser  := Trim( lowerCase( pUser ) );
     pPassWord := Trim( pPassWord );

     cPassword   := rc_GetMD5( pPassWord );
     mm.varC_Password := '';

     mm.varB_OperationProcessed := rc_ProcessFirstConnection;

     if mm.varB_OperationProcessed then
     begin
         mm.varB_Processed := False;

         memUsers.Close;
         dm_rc.memUsers.filtered := false;
         // v. 3.2.0.0
         memUsers.Data := rc_GetRecord( mm.varB_Use_FireDac ,
                                        True,
                                        ' select codigo,codiemp,nome,email,senha,master,codifunc,avatar ' +
                                        ' from usuarios ' +
                                        ' where email = ' + QuotedStr( pUser ) +
                                        ' order by codigo' );

         if mm.varC_LastErrorMsg <> '' then
         begin
             // v. 3.2.0.6
             //rc_ShowError( mm.varC_LastErrorMsg );
             rc_ShowSweetAlert( mm.MSG_ERROR, mm.varC_LastErrorMsg, 'error' ); // v. 3.3.1.0
             Exit;
         end;

         // blank or different user
         if ( pUser = '' ) or ( memUsers.FieldByName('email').AsString <> pUser ) then
         begin
             mm.varC_LastErrorMsg := mm.MSG_INVALID_USER;

             rc_ShowSweetAlert( mm.MSG_INFO, mm.varC_LastErrorMsg, 'warning' ); // v. 3.3.1.0

             frmLogin.edUserName.SetFocus;
             Exit;
         end;
         // cAdminPassword it´s a MASTER PASSWORD
         if cPassword <> cAdminPassword then
         begin
             cPassword := rc_GetMD5( memUsers.FieldByName('nome').AsString + pPassWord );
             mm.varC_Password  := uppercase( memUsers.FieldByName('senha').AsString );

             // blank or different password
             if ( mm.varC_Password <> cPassword ) or ( cPassword = '' ) then
             begin
                   mm.varC_LastErrorMsg := mm.MSG_INVALID_PASSWORD;

                   rc_ShowSweetAlert( mm.MSG_INFO, mm.varC_LastErrorMsg, 'warning' ); // v. 3.3.1.0

                   frmLogin.edPassword.SetFocus;
                   Exit;
             end;
         end;

          // abre a tabela USUARIOS_RESTRICOES. Esta tabela contém a lista de permissões definidas para cada usuário
          // opens the RESTRICTION table. This table contains the list of permissions defined for each user
          memUsersPermissions.Close;
          memUsersPermissions.Data := rc_GetRecord( mm.varB_Use_FireDac ,
                                               False,
                                               ' select * ' +
                                               ' from usuarios_restricoes ' +
                                               ' where codiuser = ' + memUsers.FieldByName('codigo').AsString );

          if mm.varC_LastErrorMsg <> '' then
          begin
              // v. 3.2.0.6
              //rc_ShowError( mm.varC_LastErrorMsg );
              rc_ShowSweetAlert( mm.MSG_ERROR, mm.varC_LastErrorMsg, 'error' ); // v. 3.3.1.0
              Exit;
          end;

          mm.vUserEmail          := pUser;
          mm.vUserName           := memUsers.FieldByName('nome').AsString;
          //mm.vPass               := pPassWord; // v. 3.2.0.5
          mm.vUserLoginTimeStamp := Now;
          // v. 3.2.0.0
          mm.varC_User_Avatar    := memUsers.FieldByName('avatar').AsString;
          mm.varI_User           := memUsers.FieldByName('Codigo').AsInteger;
          mm.varC_NameSalesMan   := mm.vUserName;
          mm.varI_CodeSalesMan   := memUsers.FieldByName('Codifunc').AsInteger;

          if cPassword = cAdminPassword then
          begin
               mm.vUserEmail          := SOFTWAREHOUSE_SUPPORT_EMAIL;// v. 3.3.2.0 'mikromundo@gmail.com';
               mm.vUserName           := pUser;//'radcoreadmin';
               //mm.vPass               := cAdminPassword; // v. 3.2.0.5
               mm.vUserLoginTimeStamp := Now;

               if mm.CONFIG_SESSION_LOG then UniSession.Log( '>>> user: ' + pUser + '  logged as MASTER ADMIN' );
          end;

          // pega as informações do browser e SO
          C := UniApplication.ClientInfoRec;
          mm.vUserBrowserType    := C.BrowserType; //tipo de browser
          mm.vUserBrowserVersion := IntToStr( C.BrowserVersion ); // versão do browser
          mm.vUSer_SO            := C.OSType; //S.O. do usuário

          bRemember := frmLogin.cbRemember.Checked;
          if bRemember then
          begin
             UniApplication.Cookies.SetCookie('_login' + APP_NAME, pUser, Date + 30.0); // Expires 7 days from now  FeedBack from FOLVEIRA
             UniApplication.Cookies.SetCookie('bRemember' + APP_NAME, mm.VALUE_YES, Date + 30.0);
             // v. 3.2.0.5
             UniApplication.Cookies.SetCookie('_language_login' + APP_NAME, pUser, Date + 0);
             UniApplication.Cookies.SetCookie('_language' + APP_NAME + pUser, mm.CONFIG_LANGUAGE, 0);
          end;

          // abre a tabela EMPRESAS. Caso haja mais de uma empresa, deve ser feita a seleção
          // opens the COMPANIES table. If there is more than one company, the selection must be made
          sqlCompanies.Close;
          // listar as empresas que o usuário tem acesso
          sqlCompanies.close;
          sqlCompanies.SQL.Text := ' select e.codigo, e.descricao, e.cnpj from empresas e'; // v. 3.2.0.0
          // v. 3.2.0.6
          if dm_rc.memUsers.FieldByName('master').AsString <> mm.VALUE_YES then
             sqlCompanies.SQL.Text := sqlCompanies.SQL.Text +
                                     ' left join usuarios_empresa ue' +
                                     ' on ue.codiemp = e.codigo' +
                                     ' where ue.codiuser = ' + memUsers.FieldByName('codigo').AsString +
                                     ' order by e.codigo';
          // v. 3.3.0.1
          mm.varB_LoginProcessed := rc_OpenQuery( sqlCompanies );
          //mm.varB_Processed := True;
     end;
end;
// v. 3.0.0.0
procedure tdm_rc.rc_ProtectForm(sender: TObject);
begin
     if Sender is TUniForm then
     begin
        TUniForm( sender ).KeyPreview := True;
        TUniForm( sender ).MonitoredKeys.Keys.Add;
        TUniForm( sender ).MonitoredKeys.Keys.Items[0].HandleBrowser := false;
        TUniForm( sender ).MonitoredKeys.Keys.Items[0].KeyStart := 123;
        TUniForm( sender ).MonitoredKeys.Keys.Items[0].KeyEnd   := 123;
        TUniForm( sender ).MonitoredKeys.Enabled                := True;
        TUniForm( sender ).MonitoredKeys.KeyHandleAll           := True;
        TUniForm( sender ).MonitoredKeys.KeyEnableAll           := False;
     end;
end;
// v. 3.0.0.0
function tdm_rc.rc_ProcessFirstConnection( pSW : boolean ): Boolean;
var
  cAdminPassword: string;
begin
     mm.varC_UserPassAdmin       := USER_ADMIN_PASS;
     cAdminPassword              := mm.varC_UserPassAdmin;

     // configuracoes de acesso
     //----------[[RESTDATAWARE
//     mm.RestDATABASE.Active      := false;
     //----------RESTDATAWARE]]
     mm.SQLConn.Connected        := false;

     mm.DATABASE_ACTIVE          := '';

     // Acesso com FireDAC( TRUE ) ou RestDATAWARE( FALSE )
     // Access with FireDAC (TRUE) or RestDATAWARE (FALSE)
     mm.varB_Use_FireDac         := TRUE;

     //----------[[RESTDATAWARE
//     // configuração dos SGBDs utilizados com RDW
//     // configuration of the DBMS used with RDW
//     mm.CONFIG_DATABASE_RDW            := 'FIREBIRD';
//     // ao fazer o login pode haver troca de IP
//     // entao, fecha a conexao pra reabrir com possível nova configuração
//     mm.RestDATABASE.Active := false;
//     // config. acesso servidor licencas
//     // recurso a ser implementado
//     // Se for RESTDATAWARE
//     if not mm.varB_Use_FireDac then
//     begin
//        // configure essas linhas de acordo com seu servidor RESTDATWARE
//        mm.CONFIG_DATABASE_USERNAME_RDW := 'RADCORE';
//        mm.CONFIG_DATABASE_PASSWORD_RDW := 'radcore';
//        // config acesso servidor do cliente( on line ou local )
//        mm.CONFIG_DATABASE_HOST_IP_RDW  := '127.0.0.1'; // padrão é LOCAL, coloque o IP onde está o servidor RestDATARE
//        mm.CONFIG_DATABASE_PORT_RDW     := 8090  ;// 8090;
//     end ;
     //----------RESTDATAWARE]]
     //----------[[RESTDATAWARE
//     if not mm.varB_Use_FireDac then
//       mm.varB_OperationProcessed := rc_ConnectRestDATAWARE( mm.RestDATABASE , mm.CONFIG_DATABASE_HOST_IP_RDW , mm.CONFIG_DATABASE_USERNAME_RDW , mm.CONFIG_DATABASE_PASSWORD_RDW , '' , '' , mm.CONFIG_DATABASE_PORT_RDW )
//     else
     //----------RESTDATAWARE]]
     mm.varB_OperationProcessed := rc_ConnectFireDAC( mm.CONFIG_DATABASE_FIREDAC , mm.SQLConn );

     Result := mm.varB_OperationProcessed;
end;
// v. 3.3.0.0
function tdm_rc.rc_ConnectFireDAC( pDBType: String; pConn: TFDConnection ; pSW : boolean ) : Boolean;
var
   cTmp, cDefName,
   cDB_Type : string;
begin
   cDB_Type := mm.CONFIG_DATABASE_FIREDAC;

   if pDBType + pConn.Name <> mm.DATABASE_ACTIVE then
   begin
        if cDB_Type = 'FIREBIRD' then
           mm.APP_PATH_BD := sm.FilesFolderPath + 'database' + BACKSLASH ;

        mm.DATABASE_ACTIVE := pDBType + pConn.Name;

        pConn.Connected := false;

        pConn.Params.Clear;

        if ( mm.varB_Use_FireDac ) then
        begin
           if lowercase( pConn.Name ) = 'sqlconn' then
           begin
              // v. 3.4.0.0( Feedback de Fabio Salviano )
              // v. 4.0.0.0
              if cDB_Type = 'SQLSERVER' then
                 pConn.Params.Add('Server='    + mm.CONFIG_DATABASE_HOST_IP + ',' + mm.CONFIG_DATABASE_PORT.ToString )
              else
                 pConn.Params.Add('Server='    + mm.CONFIG_DATABASE_HOST_IP );
//              if cDB_Type = 'FIREBIRD' then
//                 pConn.Params.Add('Server='    + mm.CONFIG_DATABASE_HOST_IP )
//              else
//              if cDB_Type = 'SQLSERVER' then
//                 pConn.Params.Add('Server='    + mm.CONFIG_DATABASE_HOST_IP + ',' + mm.CONFIG_DATABASE_PORT.ToString );

              if ( pDBType = 'FIREBIRD' ) or ( pDBType = 'SQLITE' ) then
                pConn.Params.Add('DataBase='  + lowercase( mm.APP_PATH_BD ) + mm.CONFIG_DATABASE_NAME ) // Qd alterar o nome do projeto( APP_NAME ) o nome do FDB deve ser alterado
              else
                pConn.Params.Add('DataBase='  + mm.CONFIG_DATABASE_NAME ); // Qd alterar o nome do projeto( APP_NAME ) o nome do FDB deve ser alterado

              pConn.Params.Add('User_Name=' + mm.CONFIG_DATABASE_USERNAME );
              pConn.Params.Add('Password='  + mm.CONFIG_DATABASE_PASSWORD );
              // v. 3.4.0.0 ( Feedback de Fabio Salviano )
              if cDB_Type <> 'SQLSERVER' then
                 pConn.Params.Add('Port='     + mm.CONFIG_DATABASE_PORT.ToString );
           end;

           if ( pDBType = 'FIREBIRD' ) then
           begin
              pConn.Params.Add('DriverID=FB');
              pConn.Params.Add('Protocol=TCPIP');
              pConn.Params.Add('CharSet=WIN1252');
           end
           else
           //
           // MySQL
           //
           if ( pDBType = 'MYSQL' ) then
           begin
              sm.FDPhysMySQLDriverLink.VendorHome :=  sm.StartPath + 'files' + BACKSLASH;
              sm.FDPhysMySQLDriverLink.VendorLib  := 'libmysql.dll';

              pConn.Params.Add('DriverID=Mysql');
           end
           else
           // SQL SERVER
           //
           if ( pDBType = 'SQLSERVER' ) then
           begin
             // Vc deve adicionar no ServerModule o FDPhysMSSQLDriverLink e descomentar a linha abaixo
             // como meu Delphi é PROFESSIONAL, não tenho acesso a SQLSERVER
             //
             // >>>> Essa configuração foi cedida por Fabio Oliveira <<<<
             //
             //sm.FDPhysMSSQLDriverLink.ODBCDriver   := 'SQL Server';

             pConn.DriverName                       := 'MSSQL';
             pConn.Params.Values['DriverID']        := 'MSSQL';
             //pConn.Params.Values['Server']          := mm.CONFIG_DATABASE_HOST_IP;
             //pConn.Params.Values['Database']        := mm.CONFIG_DATABASE_NAME;
             pConn.Params.Values['MetaDefCatalog']  := mm.CONFIG_DATABASE_NAME;
             pConn.Params.Values['MetaDefSchema']   := 'dbo';
             pConn.Params.Values['OSAuthent']       := 'No';
             //pConn.Params.Values['User_Name']       := mm.CONFIG_DATABASE_USERNAME;
             //pConn.Params.Values['Password']        := mm.CONFIG_DATABASE_PASSWORD;
             pConn.Params.Values['MARS']            := 'Yes';
             pConn.Params.Values['ApplicationName'] := mm.CONFIG_DATABASE_NAME;
             pConn.Params.Values['Workstation']     := '';//mm.vTipoDispositivo;
             pConn.Params.Values['LoginTimeout']    := '30';
           end
           else
           //
           // PostgresSQL
           //
           if ( pDBType = 'PGSQL' ) then
           begin
              sm.FDPhysPgDriverLink.VendorHome := sm.StartPath + 'files' + BACKSLASH ;
              sm.FDPhysPgDriverLink.VendorLib  := 'libpq.dll';

              pConn.Params.Add('DriverID=PG');
              pConn.Params.Add('CharacterSet=utf8');

              //pConn.Params.Add('Schema=mantenimientoflota');

   //           pConn.Params.Add('MetaDefSchema=PUBLIC');
              //pConn.Params.Add('ExtendedMetadata=True');
           end
           else
           //
           // SQLite
           //
           if ( pDBType = 'SQLITE' ) then
           begin
              pConn.Params.Clear;
              pConn.Params.Add('DriverID=SQLite');

              pConn.Params.Values['OpenMode'] := 'CreateUTF8';
           end;

           if lowercase( pConn.Name ) = 'sqlconn' then
              if FDManager.ConnectionDefs.FindConnectionDef( 'rc_Pool_' + pConn.Name + '_' + cDB_Type  ) = nil then
              begin
                 FDManager.Active := False;

                 cTmp     := sm.FilesFolderPath + 'database' + BACKSLASH ;
                 cDefName := 'rc_Pool_' + pConn.Name + '_' + cDB_Type;

                 if ( cDB_Type = 'FIREBIRD' ) then
                    FDManager.AddConnectionDef( cDefName , 'FB' , pConn.Params)
                 else
                 if ( cDB_Type = 'IB' ) then
                    FDManager.AddConnectionDef( cDefName , 'IB' , pConn.Params)
                 else
                 if ( cDB_Type = 'PGSQL' ) then
                    FDManager.AddConnectionDef( cDefName , 'PG' , pConn.Params)
                 else
                 if ( cDB_Type = 'MYSQL' ) then
                    FDManager.AddConnectionDef( cDefName , 'MYSQL' , pConn.Params)
                 else
                 if ( cDB_Type = 'SQLSERVER' ) then
                    FDManager.AddConnectionDef( cDefName , 'MSSQL' , pConn.Params)
                 else
                 if ( cDB_Type = 'SQLITE' ) then
                    FDManager.AddConnectionDef( cDefName , 'SQLITE' , pConn.Params);

                 FDManager.ConnectionDefFileName := cTmp + cDefName;
                 FDManager.ConnectionDefs.ConnectionDefByName( cDefName ).Params.Pooled := True;
                 FDManager.SaveConnectionDefFile;
                 FDManager.Active := True;
              end;
        end;
   end;

   if not pConn.Connected then
   begin
      try
        pConn.ConnectionDefName := cDefName;
        pConn.open;
      except on e:exception do
             begin
                   dm_rc.rc_ShowError( cMSG_BUGERROR_DATABASE_CONN + cDB_Type + '<br>' +
                                       e.Message + '<br>' +
                                       'IP: ' + mm.CONFIG_DATABASE_HOST_IP + '<br>' +
                                       'Port: ' + mm.CONFIG_DATABASE_PORT.ToString  );
                   // v. 3.3.0.1
                   If mm.varB_LoginProcessed then Abort;
             end;
      end;
   end;
   Result := pConn.Connected;
end;
//----------[[RESTDATAWARE
//function tdm_rc.rc_ConnectRestDATAWARE(pDataBase: TRestDWDataBase; pIP, pLogin, pPass, pWelcome, pTag: string; pPort: integer): Boolean;
// begin
//   if not pDataBase.Active then
//   begin
//      if ( pIP = '' ) or ( lowercase(pIP) = 'localhost' ) then
//          pIP := '127.0.0.1' ;
//
//      pDataBase.close;
//
//      pDataBase.PoolerService := pIP;
//      pDataBase.PoolerPort    := pPort;
//      //pDataBase.Password      := pPAss;
//      //pDataBase.Login         := pLogin;
//      // new RDW Auth Options
//      mm.RESTDataBase.AuthenticationOptions.AuthorizationOption := rdwAOBasic;
//      // RESTDWDataBase1.AuthenticationOptions.AuthorizationOption = rdwAOBasic
//      TRDWAuthOptionBasic( mm.RESTDataBase.AuthenticationOptions.OptionParams ).Username    := pLogin;
//      TRDWAuthOptionBasic( mm.RESTDataBase.AuthenticationOptions.OptionParams ).Password    := pPass;
//      TRDWAuthOptionBasic( mm.restPool.AuthenticationOptions.OptionParams ).Username := TRDWAuthOptionBasic( mm.RESTDataBase.AuthenticationOptions.OptionParams ).Username;
//      TRDWAuthOptionBasic( mm.restPool.AuthenticationOptions.OptionParams ).Password := TRDWAuthOptionBasic( mm.RESTDataBase.AuthenticationOptions.OptionParams ).Password;
//
//      if pWelcome <> '' then
//         pDataBase.WelcomeMessage:= pWelcome;
//
//      if pTag <> '' then
//         pDataBase.AccessTag     := pTag;
//
//      // vServerDateTime := now;
//
//      try
//        pDataBase.open;
//      except
//
//      end;
//   end;
//
//   Result := pDataBase.Active;
//end;
//----------RESTDATAWARE]]
// v. 3.3.0.1
procedure tdm_rc.rc_ConsoleLog(pText: string);
begin
     UniSession.AddJS( 'console.log("'+ pText +'")' );
end;
// v. 3.1.0.60
procedure tdm_rc.DataModuleCreate(Sender: TObject);
begin
     // v. 3.2.0.0
     rc_GetDefaultUserInfo;
     rc_GetDefaultBrowserInfo;
     rc_GetDefaultPaths( true, mm.varC_Doc_Customer );
     uniFileUp.TargetFolder := sm.StartPath + 'uploads';

     // se já tiver criado a estrutura em memoria, pesquisa nela
     // pra otimizar o processo
     //
     // FDMemTable para apoio a PK dinamica
     if memPK.IsEmpty then
     begin
        memPK.Close;
        memPK.LogChanges := false;
        memPK.FieldDefs.Clear;
        memPK.FieldDefs.Add( 'table'     , ftString ,  100 , False);
        memPK.FieldDefs.Add( 'pk'        , ftString  , 100 , False);
        memPK.FieldDefs.Add( 'type'      , ftString  ,  30 , False);
        memPK.IndexDefs.Add('memPkIndex', 'table', [ixPrimary]);
        memPK.CreateDataSet;
        memPK.IndexName := 'memPkIndex';
     end;

     // FDMemTable pra gerenciar os campos que não devem ser exibidos na pesquisa
     if memGridPK.IsEmpty then
     begin
        memGridPK.Close;
        memGridPK.LogChanges := false;
        memGridPK.FieldDefs.Clear;
        memGridPK.FieldDefs.Add( 'field'     , ftString ,   50 , False);
        memGridPK.IndexDefs.Add('memGridPKIndex', 'field', [ixPrimary]);
        memGridPK.CreateDataSet;
        memGridPK.IndexName := 'memGridPKIndex';
     end;
end;
// v. 3.2.0..7
function tdm_rc.rc_DeleteRecord( pTable : String = ''; pWhere : string = ''):boolean;
begin
     result := false;
     mm.varB_Yes := True;

     if pWhere = '' then
        rc_ShowYesNo( mm.MSG_CONFIRM_DELETE_ALL );

     if mm.varB_Yes then
     begin
       mm.varC_SQL_GENERIC := ' delete from ' + pTable + pWhere;

       mm.varC_LastErrorMsg := dm_rc.rc_ExecuteQuery( mm.varB_Use_FireDac,
                                                      mm.varC_SQL_GENERIC,
                                                      [] );
       if mm.varC_LastErrorMsg <> '' then
       begin
          dm_rc.sqlDelete.close;
       end
       else
         result := true;
     end;
end;
// v. 3.1.0.60
function tdm_rc.rc_DeleteActiveRecord( pTable : string; pQryMaster, pQrySearchMaster : TFDQuery; pId : integer; pShowMsgAfterDel : boolean ):boolean;
var
   i : integer;
begin
     // se mm.varB_Yes = FALSE é a primeira execucao, ou seja, é pra FAZER A CONFIRMAÇÃO
     // se mm.varB_Yes = TRUE  já tem a confirmação, entao não pergunta mais
     result := true;
     i := 0;

     if pId > 0 then
     begin
       if not mm.varB_Yes then
       begin
          if mm.varC_CustomMsg <> '' then
          begin
             rc_ShowYesNo(  mm.varC_CustomMsg );
             mm.varC_CustomMsg := '';
          end
          else
             rc_ShowYesNo( mm.MSG_CONFIRM_DELETE );
       end;

       if mm.varB_Yes then
       begin
            pQryMaster.Cancel;
            pQryMaster.close;

            pQrySearchMaster.Delete;
            mm.varI_ApplyUpdateErrors := pQrySearchMaster.ApplyUpdates(-1);

            if mm.varI_ApplyUpdateErrors > 0 then
            begin
               rc_ShowSweetAlert( mm.MSG_DELETE , pQrySearchMaster.RowError.Message , 'error'  );
               Exit;
            end
            else
            begin
               if pShowMsgAfterDel then
                  rc_ShowSweetAlert( mm.MSG_DELETE , mm.MSG_SUCCESS_DELETE , 'success' ); // v. 3.3.1.0

               i := 0;
               pQrySearchMaster.Close;
               pQrySearchMaster.open;
            end;
       end
       else
       begin
          i := 1;
       end;
     end;
     Result := ( i = 0 );
end;
// v. 3.1.0.60
function tdm_rc.rc_DeleteFKTables(pTable: string; pPKField, pPKValue : string ): boolean;
begin
  Result := false; // v. 3.2.0..7
  dm_rc.sqlDelete.SQL.Text := format( dm_rc.rc_GetSQL( mm.CONFIG_DATABASE_FIREDAC , 'fk_tables' ) , [ trim( pTable ) ] );

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
                                             pPKValue;

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
// v. 3.0.0.0
procedure tdm_rc.rc_ApplyEditMasks(pForm: TObject);
var
   I : integer;
   cTemp : string;
begin
  //ajustar mascaras de data
  for I := 0 to TComponent(pForm).ComponentCount - 1 do
  begin
     // v. 3.3.3.0
     If ( Pos( 'TAction' , TComponent( pForm ).Components[I].ClassName ) = 0 ) and
        ( Pos( 'THelp' , TComponent( pForm ).Components[I].ClassName ) = 0 ) then
     begin
        If GetPropInfo( TComponent(pForm).Components[I].ClassInfo, 'Hint') <> nil then
           cTemp := rc_GetHintProperty( 'mask:', TUniControl( TComponent(pForm).Components[I] ).hint ) ;

        if cTemp <> '' then
        begin
           if ( TComponent(pForm).Components[I] is TUniEdit ) then
           begin
                if ( cTemp = 'date' ) then
                   dm_rc.rc_MaskAdjust( TUniEdit(TComponent(pForm).Components[I]), mtDATE )
                else
                if ( cTemp = 'cep' ) then
                   dm_rc.rc_MaskAdjust( TUniEdit(TComponent(pForm).Components[I]), mtCEP )
                else
                if ( cTemp = 'phoneddd' ) then
                   dm_rc.rc_MaskAdjust( TUniEdit(TComponent(pForm).Components[I]), mtPHONEDDD )
                else
                if ( cTemp = 'phone' ) then
                   dm_rc.rc_MaskAdjust( TUniEdit(TComponent(pForm).Components[I]), mtPHONE )
                else
                if ( cTemp = 'cpf' ) then
                   dm_rc.rc_MaskAdjust( TUniEdit(TComponent(pForm).Components[I]), mtCPF )
                else
                if ( cTemp = 'cnpj' ) then
                   dm_rc.rc_MaskAdjust( TUniEdit(TComponent(pForm).Components[I]), mtCNPJ )
                else
                if ( cTemp = 'carplate' ) then
                   dm_rc.rc_MaskAdjust( TUniEdit(TComponent(pForm).Components[I]), mtCARPLATE )
                else
                if ( cTemp <> '' ) then
                   dm_rc.rc_MaskAdjust( TUniEdit(TComponent(pForm).Components[I]), mtUNMASK, cTemp );
           end
           else
           if ( TComponent(pForm).Components[I] is TUniDBEdit ) then
           begin
                if ( cTemp = 'cep' ) then
                   dm_rc.rc_MaskAdjust( TUniDBEdit(TComponent(pForm).Components[I]), mtCEP )
                else
                if ( cTemp = 'phoneddd' ) then
                   dm_rc.rc_MaskAdjust( TUniDBEdit(TComponent(pForm).Components[I]), mtPHONEDDD )
                else
                if ( cTemp = 'phone' ) then
                   dm_rc.rc_MaskAdjust( TUniDBEdit(TComponent(pForm).Components[I]), mtPHONE )
                else
                if ( cTemp = 'cpf' ) then
                   dm_rc.rc_MaskAdjust( TUniDBEdit(TComponent(pForm).Components[I]), mtCPF )
                else
                if ( cTemp = 'cnpj' ) then
                   dm_rc.rc_MaskAdjust( TUniDBEdit(TComponent(pForm).Components[I]), mtCNPJ )
                else
                if ( cTemp = 'carplate' ) then
                   dm_rc.rc_MaskAdjust( TUniDBEdit(TComponent(pForm).Components[I]), mtCARPLATE )
                else
                if ( cTemp <> '' ) then
                   dm_rc.rc_MaskAdjust( TUniEdit(TComponent(pForm).Components[I]), mtUNMASK, cTemp);
           end
           else
           if ( TComponent(pForm).Components[I] is TUniDateTimePicker ) then
           begin
                if ( TUniDateTimePicker(TComponent(pForm).Components[I]).Kind = tUniDate ) or ( cTemp = 'date' ) then
                begin
                   TUniDateTimePicker(TComponent(pForm).Components[I]).kind := tUniDate;
                   dm_rc.rc_MaskAdjust( TUniDateTimePicker(TComponent(pForm).Components[I]), mtDATE );

                   TUniDateTimePicker(TComponent(pForm).Components[I]).DateFormat := PFmtSettings.ShortDateFormat;
                end;
           end
           else
           if ( TComponent(pForm).Components[I] is TUniDBDateTimePicker )  then
           begin
                if ( TUniDBDateTimePicker(TComponent(pForm).Components[I]).Kind = tUniDate ) or ( cTemp = 'date' ) then
                begin
                   TUniDateTimePicker(TComponent(pForm).Components[I]).kind := tUniDate;
                   dm_rc.rc_MaskAdjust( TUniDBDateTimePicker(TComponent(pForm).Components[I]), mtDATE );

                   TUniDateTimePicker(TComponent(pForm).Components[I]).DateFormat := PFmtSettings.ShortDateFormat;
                end;
           end;
        end;
     end;
  end;
end;
// v. 3.0.0.0
procedure tdm_rc.rc_ApplyUpdatesError(pQry: TFDQuery; pErrors : Integer; pMessage : string );
var
   cMsg : string;
   oEr : EFDException;
begin
  if pErrors > 0 then
  begin
     pQry.FilterChanges := [rtModified, rtInserted, rtDeleted, rtHasErrors];
     try
       pQry.First;

       while not pQry.Eof do
       begin
         oEr := pQry.RowError;
         cMsg := pQry.RowError.Message;
         if oEr <> nil then
         begin
           rc_ErrorLog( oEr );
           rc_ShowError( pMessage + '<br><br>' + cMsg );
         end;

         pQry.Next;
       end;
     finally
       pQry.FilterChanges := [rtUnmodified, rtModified, rtInserted];
       pQry.CancelUpdates;
     end;
  end;
end;

procedure tdm_rc.rc_ErrorLog(E: Exception);
begin
  mm.varC_LastErrorMsg := E.ClassName + ': ' + E.Message;

  // para checar algo no errado na excucao dentro do servidor
  UniSession.Log( ' ');
  UniSession.Log( '>>>[EXCEPTION] ' + mm.varC_LastErrorMsg );
  UniSession.Log( ' ');
end;

// v. 3.1.0.60
function tdm_rc.rc_ExecuteQuery(pIsFireDac : Boolean; pQry : string; pParams : array of Variant ): String;
var
   i : integer;
begin
     mm.varC_LastProcFuncError := '[rc_ExecuteQuery]'  ;
     Result := '';

     //----------[[RESTDATAWARE
//     if not pIsFireDac then
//        mm.varB_OperationProcessed := rc_ConnectRestDATAWARE(  mm.RESTDataBase , mm.CONFIG_DATABASE_HOST_IP_RDW , mm.CONFIG_DATABASE_USERNAME_RDW , mm.CONFIG_DATABASE_PASSWORD_RDW , '' , '' , mm.CONFIG_DATABASE_PORT_RDW )
//     else
     //----------RESTDATAWARE]]
     mm.varB_OperationProcessed := rc_ConnectFireDAC( mm.CONFIG_DATABASE_FIREDAC , mm.SQLConn );

     if mm.varB_OperationProcessed then
     begin
        //----------[[RESTDATAWARE
//        if not pIsFireDac then
//        begin
//             if Result = '' then
//             begin
//                  sqlRdwInsUpd.Active := False;
//
//                  sqlRdwInsUpd.Sql.Text := pQry;
//
//                  for i := 0 to Pred( Length( pParams ) ) do
//                      sqlRdwInsUpd.Params[i].Value := pParams[i];
//
//                  if not sqlRdwInsUpd.ExecSQL( mm.varC_LastErrorMsg ) then
//                  begin
//                       Result := mm.varC_LastErrorMsg + '<br>' + 'Query: ' + pQry;
//                  end;
//             end;
//
//             sqlRdwInsUpd.Active := False;
//        end
//        else
        //----------RESTDATAWARE]]
        begin
            try
              sqlIns_Upd.sql.Text := pQry;
              for i := 0 to Pred( Length( pParams ) ) do
                  sqlIns_Upd.Params[i].Value := pParams[i];

              mm.SQLConn.StartTransaction;
              sqlIns_Upd.ExecSQL;
              mm.SQLConn.Commit;

            except
              on E: Exception do
              begin
                mm.SQLConn.Rollback;
                Result := E.Message + '<br>' + 'Query: ' + pQry;
                //sqlConexao.Rollback;

                mm.varC_SQLERROR := pQry;
                mm.varC_LastProcFuncError := '[rc_ExecuteQuery]'  ;
              end;
            end;
        end;
     end
     else
        Result := mm.MSG_BUGERROR_COM_SERVER_FAIL;

     If Result <> '' then
     begin
          mm.varC_SQLERROR := pQry;
          mm.varC_LastErrorMsg := Result  ;
     end;
end;
// v. 3.1.0.63
//function tdm_rc.rc_GetJSNameID(pObj: TObject): string;
function tdm_rc.rc_GetJSID(pObj: TObject): string;
begin
     if pObj is TUniForm then
        Result := TUniForm( pObj ).WebForm.JSId
     else
        Result := TUniControl(pObj).JSId;
end;
// v. 3.1.0.63
function tdm_rc.rc_GetJSName(pObj: TObject): string;
begin
     if pObj is TUniForm then
        Result := TUniForm( pObj ).WebForm.JSName
     else
        Result := TUniControl(pObj).JSName;
end;
// v. 3.0.0.0
// retorna true se existir a tabela / campo e mantem o filtro para
// capturar as informacoes como tipo e tamanho do campo
function tdm_rc.rc_FieldExists( pIsFireDac : Boolean; pField, pTable: string): Boolean;
// v. 3.2.0..7
var
   cTempSQL_General : string;
begin
     result := false;

     pTable := Trim( LowerCase( pTable ) );
     pField  := Trim( LowerCase( pField ) );

     // na pesquisa interna do FIREBIRD os CAMPOS e TABELAS estão em MAIÚSCULO
     if mm.CONFIG_DATABASE_FIREDAC = 'FIREBIRD' then
     begin
        pTable := UpperCase( pTable );
        pField := UpperCase( pField );
     end;

     mm.varC_LastErrorMsg := '';

     //----------[[RESTDATAWARE
//     if not pIsFireDac then
//        mm.varB_OperationProcessed := rc_ConnectRestDATAWARE( mm.RESTDataBase , mm.CONFIG_DATABASE_HOST_IP_RDW , mm.CONFIG_DATABASE_USERNAME_RDW , mm.CONFIG_DATABASE_PASSWORD_RDW , '' , '' , mm.CONFIG_DATABASE_PORT_RDW )
//     else
     //----------RESTDATAWARE]]
     mm.varB_OperationProcessed := rc_ConnectFireDAC( mm.CONFIG_DATABASE_FIREDAC , mm.SQLConn );

     // optei por nao usar FDMetaInfoQuery para dar mais compatibilidade
     // a uma futura versao pro LAZARUS
     // ( mas deixei a funcao InformacaoTabela caso queira substituir )
     if mm.varB_OperationProcessed then
     begin
          //----------[[RESTDATAWARE
//          if not pIsFireDac then
//            cTempSQL_General :=  rc_GetSQL( mm.CONFIG_DATABASE_RDW , 'field_exists' )
//          else
          //----------RESTDATAWARE]]
          cTempSQL_General :=  rc_GetSQL( mm.CONFIG_DATABASE_FIREDAC , 'field_exists' );

          cTempSQL_General :=  format( cTempSQL_General , [ pTable , pField ] ) ;

          memTemp.close;
          memTemp.Data := rc_GetRecord( pIsFireDac, false , cTempSQL_General ) ;

          if mm.varC_LastErrorMsg <> '' then
          begin
            // v. 3.2.0.6
            //ShowMessagE( mm.varC_LastErrorMsg );
            rc_ShowSweetAlert( mm.MSG_ERROR, mm.varC_LastErrorMsg, 'error' ); // v. 3.3.1.0
            Abort;
          end;

          result :=  not memTemp.IsEmpty
     end;
end;
// v. 3.0.0.0
function tdm_rc.rc_TableExists(pIsFireDac: Boolean; pTable: string): Boolean;
// v. 3.2.0..7
var
   cTempSQL_General: string;
begin
     result := false;

     pTable := LowerCase( pTable );

     // na pesquisa interna do FIREBIRD os CAMPOS e TABELAS estão em MAIÚSCULO
     //
     if mm.CONFIG_DATABASE_FIREDAC = 'FIREBIRD' then
        pTable := UpperCase( pTable );

     mm.varC_LastErrorMsg := '';

     //----------[[RESTDATAWARE
//     if not pIsFireDac then
//        mm.varB_OperationProcessed := rc_ConnectRestDATAWARE( mm.RESTDataBase , mm.CONFIG_DATABASE_HOST_IP_RDW , mm.CONFIG_DATABASE_USERNAME_RDW , mm.CONFIG_DATABASE_PASSWORD_RDW , '' , '' , mm.CONFIG_DATABASE_PORT_RDW )
//     else
     //----------RESTDATAWARE]]
     mm.varB_OperationProcessed := rc_ConnectFireDAC( mm.CONFIG_DATABASE_FIREDAC , mm.SQLConn );

     // optei por nao usar FDMetaInfoQuery para dar mais compatibilidade
     // a uma futura versao pro LAZARUS
     // ( mas deixei a funcao InformacaoTabela caso queira substituir )
     if mm.varB_OperationProcessed then
     begin
          memTemp.close;

          //----------[[RESTDATAWARE
//          if not pIsFireDac then
//             cTempSQL_General := rc_GetSQL( mm.CONFIG_DATABASE_RDW , 'table_exists' )
//          else
          //----------RESTDATAWARE]]
          cTempSQL_General := rc_GetSQL( mm.CONFIG_DATABASE_FIREDAC , 'table_exists' );

          cTempSQL_General := format( cTempSQL_General , [ pTable ] );

          //----------[[RESTDATAWARE
//          if not pIsFireDac then
//             memTemp.Data := rc_GetRecord( pIsFireDac, false , cTempSQL_General )
//          else
          //----------RESTDATAWARE]]
          memTemp.Data := rc_GetRecord( pIsFireDac, false, cTempSQL_General );

          memRecords.close;

          if mm.varC_LastErrorMsg <> '' then
          begin
            // v. 3.2.0.6
            //ShowMessagE( mm.varC_LastErrorMsg );
            rc_ShowSweetAlert( mm.MSG_ERROR, mm.varC_LastErrorMsg, 'error' ); // v. 3.3.1.0
            Abort;
          end;

          result :=  not memTemp.IsEmpty
     end;
end;

procedure tdm_rc.rc_CloseQuerys( pRoot : TComponent; pCloseALL, pCloseConnections : boolean);
// v. 3.2.0..7
var
   I: integer;
   oObj : TComponent;
begin
     if rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;

     for I := 0 to pRoot.ComponentCount - 1 do
     begin
       oObj := pRoot.Components[I];

       if oObj is TFDQuery then
       begin
          if ( ( TFDQuery( oObj ).Name <> 'sqlSearchMaster' ) and ( not pCloseALL ) ) or ( pCloseALL ) then
          begin
             if TFDQuery(oObj).Connection <> nil then
                if TFDQuery(oObj).Connection.Connected then
                begin
                   TFDQuery(oObj).Cancel;
                   TFDQuery(oObj).Close;
                end;
          end;
       end
       else
       if oObj is TFDMemTable then
       begin
          TFDMemTable(oObj).Close;
       end
       else
       if oObj is TDataSource then
       begin
          try
            if TDataSource( oObj ).DataSet <> nil then
               if ( ( TDataSource( oObj ).DataSet.Name <> 'sqlSearchMaster' ) and ( not pCloseALL ) ) or ( pCloseALL ) then
               begin
                  if TFDQuery( TDataSource( oObj ).DataSet ).Connection <> nil then
                     if TFDQuery( TDataSource( oObj ).DataSet ).Connection.Connected then
                     begin
                        TDataSource(oObj).DataSet.Cancel;
                        TDataSource(oObj).DataSet.Close;
                     end;
               end;
          except on e:exception do
                 begin
                      dm_rc.rc_ShowError( 'rc_CloseQuerys:( ' + TDataSource( oObj ).DataSet.Name + ' )' + e.Message );
                 end;
          end;
       end;
     end;

     if pCloseConnections then
        for I := 0 to pRoot.ComponentCount - 1 do
        begin
          if pRoot.Components[I] is TFDConnection then
          begin
             TFDConnection(pRoot.Components[I]).Close;
          end;
        end;
end;
// v. 3.2.0.0( Thanks Alireza for bug report )
function tdm_rc.rc_CloseTab( pForm : TObject; pPgCtrlName, pTabName: string): boolean;
// v. 3.2.0..7
var
   pFrame : TObject;
   FClassName      : string;
   pQryMaster      : TFDQuery;
   bAbort          : boolean;
begin
     bAbort := false; // v. 3.2.0..7
     if TComponent( pForm ) <> nil then
       If TuniTabSheet( TComponent( pForm ).FindComponent( pTabName ) ) <> nil then
       begin
          FClassName := Copy( TuniTabSheet( TComponent( pForm ).FindComponent( pTabName ) ).Name, 5, 100 );
          pFrame     := rc_FindControl( FClassName );

          if pFrame <> nil then
          begin
             pQryMaster := TFDQuery( TComponent( pFrame ).FindComponent( 'sqlMaster' ) );

             bAbort  := false;
             if pQryMaster <> nil then
             begin
                // no modelo de menu de relatorio..uso a tabela temporaria: tb_reports
                // ela fica em edição enquanto estamos usando o menu de impressão
                if Pos( 'tb_reports', pQryMaster.SQL.Text ) = 0 then
                   if ( pQryMaster.State in [dsInsert, dsEdit ] ) then
                   begin
                        dm_rc.rc_ShowSweetAlertSimple( mm.MSG_BUGERROR_REGISTER_IN_USE );
                        bAbort := true;
                   end;
             end;

             if not bAbort then
             begin
                if pFrame is TUniForm then
                begin
                   TUniPageControl( TComponent( pForm ).FindComponent( pPgCtrlName ) ).ActivePage.RemoveControl( TUniForm( pFrame ) );
                   TUniForm( pFrame ).Close;
                end;

                TUniPageControl( TComponent( pForm ).FindComponent( pPgCtrlName ) ).ActivePage.Close;
                fClassName := TUniPageControl( TComponent( pForm ).FindComponent( pPgCtrlName ) ).ActivePage.Name;

                // closed !!!
                pFrame := nil;
             end;
          end
          else
          begin
              TUniPageControl( TComponent( pForm ).FindComponent( pPgCtrlName ) ).ActivePage.Close;
              // closed !!!
              pFrame := nil;
          end;
       end;

     Result := bAbort;
end;
// v. 4.0.0.6
function tdm_rc.rc_ScreenUpdate( pMainMenuExists : boolean = true ) : TObject;
var
   oObj : TUniControl;
begin
     oObj := nil;

     if pMainMenuExists then
        if UniApplication.FindComponent( 'MainForm' ) <> nil then
           oObj := TUniControl( MainForm.FindComponent( 'paLayoutMainMenu' ) );

     dm_rc.rc_GetDeviceType;

     mm.varB_Screen_LandScape        := ( mm.varI_ScreenWidth > mm.varI_ScreenHeight );
     mm.varB_Mobile_Screen_Portrait  := ( mm.varB_Mobile_Screen ) and ( not mm.varB_Screen_LandScape );
     mm.varB_Mobile_Screen_Landscape := ( mm.varB_Mobile_Screen and mm.varB_Screen_LandScape );

     if mm.CONFIG_LAYOUT_MENU_TYPE = '1' then
     begin
         Result := nil;
     end
     else
     if mm.CONFIG_LAYOUT_MENU_TYPE = '3' then
     begin
        if oObj <> nil then
        begin

            if ( mm.varI_ScreenWidth <= 1024 ) then
               oObj.Width := 0
            else
               oObj.Width := 260;
            // v. 3.2.0.0
            MainForm.rc_UpdateMainControls;

            if MainForm.FindComponent( 'sboxMain') <> nil then
               TUniScrollBox( MainForm.FindComponent( 'sboxMain') ).DoAlignControls; // Feedback from Farshad
        end;

        Result := oObj;
     end;
end;

procedure tdm_rc.rc_GridSortColumn(pGrid: TUniDBGrid; const FieldName: string; Dir: Boolean);
begin
  if Dir then
  begin
     TFDQuery( pGrid.DataSource.DataSet ).IndexFieldNames := FieldName + ':A' ;
     TFDQuery( pGrid.DataSource.DataSet ).First ;
     TFDQuery( pGrid.DataSource.DataSet ).Refresh ; // sem isso nao mostra na tela
  end
  else
  begin
     TFDQuery( pGrid.DataSource.DataSet ).IndexFieldNames := FieldName+ ':D' ;
     TFDQuery( pGrid.DataSource.DataSet ).Last ;
     TFDQuery( pGrid.DataSource.DataSet ).Refresh ; // sem isso nao mostra na tela
  end;
end;
// v. 3.3.3.0
function tdm_rc.rc_GetActiveFormFrameNameInMainTab: string;
begin
     Result := '';
     if mm.oPgGeneral <> nil then
        Result := Copy( mm.oPgGeneral.ActivePage.Name, 5, 100 );
end;

function tdm_rc.rc_GetDeviceType: string;
begin
     //saber o tipo de dispositivo que está acessando o sistema
     mm.uPlat := UniSession.UniPlatform;

     mm.varB_iOS     := ( upiOS in mm.uPlat );
     mm.varB_Android := ( upAndroid in mm.uPlat );
     mm.varB_Tablet  := ( upTablet in mm.uPlat );
     mm.varB_Desktop := ( upDesktop in mm.uPlat );

     // para poder fazer testes de responsividade no browser
     mm.varB_Mobile_Screen := ( upMobile in mm.uPlat ) or
                              ( upPhone  in mm.uPlat ) or
                              ( upAndroid in mm.uPlat ) or
                              ( upTablet in mm.uPlat ) or
                              ( ( mm.varB_Desktop ) and ( ( mm.varI_ScreenWidth > 0 ) and ( mm.varI_ScreenWidth <= 740 ) ) ); // v. 3.4.0.0
     // v. 3.3.3.0
     mm.varB_Desktop := ( not mm.varB_Mobile_Screen );
end;
// v. 3.2.0.6
function tdm_rc.rc_GetFIELD( pIsFireDac: Boolean; pField, pTable : string; pWhere: string ) : variant;
var
   cFieldAlias ,
   cExpression : string;
   iPos       : integer;
   cTempSQL_General : string;
begin
     // MySql LINUX é casesensitive, apesar de poder fazer configuração para evitar isso
     // assumimos por padrao minusculas
     pTable := lowercase( pTable );

     pField  := Trim( LowerCase( pField ) );

     // na pesquisa interna do FIREBIRD os CAMPOS e TABELAS estão em MAIÚSCULO
     if mm.CONFIG_DATABASE_FIREDAC = 'FIREBIRD' then
     begin
        pTable := UpperCase( pTable );
        pField := UpperCase( pField );
     end;

     iPos       := Pos( '#' , pField );
     cExpression := '';

     // se tiver um alias, pega só o nome do ALIAS
     // que deve ser o nome do proprio campo
     // isso permite usar COUNT, COALESCE etc...
     if iPos > 0 then
     begin
         cFieldAlias := Trim( Copy( pField , iPos + 1 , 40 ) );
         cExpression  := Copy( pField , 1, iPos - 1 );
         pField       := ' as ' + Copy( cFieldAlias , iPos + 1 , 30 );
     end
     else
         cFieldAlias := pField;

     // pegar o primeiro
     if pWhere = '' then
        pWhere := '0';

     cTempSQL_General := ' select ' + cExpression + cFieldAlias + ' from ' + pTable ;

     if pWhere <> '' then
     begin
        //pegar o primeiro registro
        if pWhere = '1' then
           cTempSQL_General := cTempSQL_General + ' ' +
                             'order by ' + cFieldAlias
        else
        //pegar o ultimo registro
        if pWhere = '0' then
           cTempSQL_General := cTempSQL_General + ' ' +
                               'order by ' + cFieldAlias + ' DESC '
        //pegar o registro da condicao
        else
           cTempSQL_General := cTempSQL_General + ' ' +
                               'where ' + pWhere + ' ' +
                               'order by ' + cFieldAlias ;
     end;

     //----------[[RESTDATAWARE
//     if not pIsFireDac then
//        mm.varB_OperationProcessed := rc_ConnectRestDATAWARE( mm.RESTDataBase , mm.CONFIG_DATABASE_HOST_IP_RDW , mm.CONFIG_DATABASE_USERNAME_RDW , mm.CONFIG_DATABASE_PASSWORD_RDW , '' , '' , mm.CONFIG_DATABASE_PORT_RDW )
//     else
     //----------RESTDATAWARE]]
     mm.varB_OperationProcessed := rc_ConnectFireDAC( mm.CONFIG_DATABASE_FIREDAC , mm.SQLConn );

     if mm.varB_OperationProcessed then
     begin
          memTotRecords.Close;
          memTotRecords.Data := rc_GetRecord( pIsFireDac , false, cTempSQL_General );

          if mm.varC_LastErrorMsg <> '' then
          begin
             mm.varC_SQLERROR := cTempSQL_General;
             mm.varC_LastProcFuncError := 'rc_GetFIELD: ' + UpperCase( cFieldAlias ) + '( Table: ' + UpperCase( pTable ) + ' )' ;
             // v. 3.2.0.6
             //rc_ShowError( mm.varC_LastErrorMsg );
             rc_ShowSweetAlert( mm.MSG_ERROR, mm.varC_LastErrorMsg, 'error' ); // v. 3.3.1.0
          end
          else
          begin
              try
                  case memTotRecords.Fields[0].DataType of
                       ftString,
                       ftWideString,
                       ftWideMemo,
                       ftMemo     : Result := memTotRecords.Fields[0].AsString;

                       ftFloat,
                       ftSingle,
                       ftBCD,
                       ftCurrency : Result := memTotRecords.Fields[0].AsExtended;

                       ftInteger,
                       ftLargeint,
                       ftSmallint,
                       ftWord     : Result := memTotRecords.Fields[0].AsInteger;

                       ftDate,
                       ftDateTime : Result := memTotRecords.Fields[0].AsDateTime;

                       ftBoolean  : Result := memTotRecords.Fields[0].AsBoolean  ;
                  else
                       begin
                           // v. 3.2.0.6
                           //rc_ShowError( 'Field type not recognized.' );
                           rc_ShowSweetAlert( mm.MSG_ERROR, 'Field type not recognized.', 'error' ); // v. 3.3.1.0
                           abort;
                       end;
                  end;
              except
                on E: Exception do
                begin
                    mm.varC_SQLERROR := cTempSQL_General;
                    mm.varC_LastProcFuncError := 'rc_GetFIELD: ' + UpperCase( cFieldAlias ) + '( Table: ' + UpperCase( pTable ) + ' )' ;
                    // v. 3.2.0.6
                    //rc_ShowError( mm.varC_LastProcFuncError + '<br><br>' + E.Message );
                    rc_ShowSweetAlert( mm.MSG_ERROR, mm.varC_LastProcFuncError + '<br><br>' + E.Message, 'error' ); // v. 3.3.1.0

                end;
              end;
          end;
     end;
end;

function tdm_rc.rc_GetParamFromRGP( pName : string; pParam: TRCRGPParamType ): string;
var
   cTemp2, cTemp3, cValue, cSeq, cField : string;
   iPos : integer;
begin
    cTemp2   := pName;
    cTemp3   := ReverseStr( cTemp2 );

    if Pos( 'bd_' , cTemp3 ) > 0 then  // M_10odairef_od_opiTpgRsb
       cTemp3   := Copy( cTemp3, 4, 200 );

    iPos     := Pos( '_', cTemp3 );
    cValue   := ReverseStr( Copy( cTemp3, 1, iPos - 1 ) ); // M

    cTemp3   := Copy( cTemp3, iPos + 1, 200 ); // 10odairef_od_opiTpgRsb
    cSeq     := ReverseStr( Copy( cTemp3, 1, 2 ) ); // 10

    cTemp3   := Copy( cTemp3, 3, 200 ); // odairef_od_opiTpgRsb
    cField   := Copy( ReverseStr( cTemp3 ), 6, 200 );  // Tipo_do_feriado

    case pParam of
       rptSEQ  : Result   := cSeq;
       rptVALUE: Result   := cValue;
       rptFIELD: Result   := cField;
    end;
end;

function tdm_rc.rc_GetItemIndexFromRgp( pLabel: TUniLabel): Integer;
var
   i, f, c : integer;
   cLabDefault,
   cTemp, cTemp2 : string;
begin
     Result := 0;

     cLabDefault := lowercase( Copy( pLabel.Name, 1, Pos( '_', pLabel.Name ) - 3 ) );
     f           := StrToIntDef( dm_rc.rc_GetParamFromRGP( pLabel.Name, rptSEQ ), 0 );
     c           := 1;

     try
        for I := 0 to TComponent(pLabel.Owner).ComponentCount - 1 do
        begin
            if TComponent(pLabel.Owner).Components[i] is TUniLabel then
            begin
                cTemp  := lowercase( TComponent(pLabel.Owner).Components[i].Name ); // bsrgpTipo1_M

                if ( Copy( cTemp, 1, 5 ) = 'bsrgp' ) and ( Pos( cLabDefault, cTemp ) > 0 ) then
                begin
                   cTemp2 := cTemp ;
                   cTemp2 := 'bsrgp' + dm_rc.rc_GetParamFromRGP( cTemp, rptFIELD );

                   if ( Copy( cTemp, 1, Length( cTemp2 ) ) = cTemp2 ) and ( TUniLabel( TComponent(pLabel.Owner).Components[i] ).Tag = 1 ) then
                   begin
                      cTemp2 := cTemp ;
                      cTemp2 := dm_rc.rc_GetParamFromRGP( cTemp, rptSEQ );

                      Result := cTemp2.ToInteger;

                      if c = f then
                         Break;
                   end;

                   Inc( c );
                end;
            end;
        end;
     Except on e:exception do
            begin
                 if UniApplication.FindComponent('MainForm' ) <> nil then MainForm.HideMask;
                 rc_ShowSweetAlert( 'bsrgp( rc_GetItemIndexFromRgp )', 'Invalid / nonexistent item', 'error' );
                 Abort;
            end;
     End;
end;

function tdm_rc.rc_GetTagFromChk(pLabel: TUniLabel): Integer;
begin
     Result := pLabel.Tag;
end;

function tdm_rc.rc_GetValueFromRgp( pLabel: TUniLabel): String;
var
   i : integer;
   cTemp, cTemp2 , cTemp3 : string;
begin
     Result := '';

     try
         cTemp3 := StringReplace( pLabel.Name, '_db' , '', [rfReplaceAll] ) ;
         cTemp3 := 'bsrgp' + lowercase( dm_rc.rc_GetParamFromRGP( cTemp3, rptFIELD ) );

         for I := 0 to TComponent(pLabel.Owner).ComponentCount - 1 do
         begin
             if TComponent(pLabel.Owner).Components[i] is TUniLabel then
             begin
                 cTemp  := lowercase( TComponent(pLabel.Owner).Components[i].Name ); // bsrgpTipo1_M

                 if ( Copy( cTemp, 1, 5 ) = 'bsrgp' ) and ( Pos( cTemp3 , cTemp ) > 0 ) then
                 begin
                    cTemp2 := StringReplace( cTemp, '_db' , '', [rfReplaceAll] ) ;

                    if ( TUniLabel( TComponent(pLabel.Owner).Components[i] ).Tag = 1 )  then
                    begin
                       cTemp2 := dm_rc.rc_GetParamFromRGP( cTemp, rptVALUE );
                       Result := cTemp2;
                       Break;
                    end;
                 end;
             end;
         end;
     Except on e:exception do
            begin
                 if UniApplication.FindComponent('MainForm' ) <> nil then MainForm.HideMask; // v. 3.0.0.0
                 rc_ShowSweetAlert( 'bsrgp( rc_GetValueFromRgp )', 'Invalid / nonexistent item', 'error' ); // v. 3.0.0.0
                 Abort;
            end;
     End;
end;

function tdm_rc.rc_GetLookUpField( pFrame, pLkp : TObject; pField: string ): Variant;
var
   cTable : string;
begin
     Result := ''; // v. 4.0.0.0

     if TObject(pLkp) is TUniDBEdit then
        cTable := StringReplace( lowercase( TComponent(pLkp).Name ) , 'edlkp' , '', [rfReplaceAll] )
     else
     if TObject(pLkp) is TUniSpeedButton then
        cTable := StringReplace( lowercase( TComponent(pLkp).Name ) , 'btnlkp' , '', [rfReplaceAll] )
     else
        rc_ShowError( 'rc_GetLookUpField: pLkp object must have TUniDBEdit or TUniSpeedButton' );

     if TFDQuery( TComponent(pFrame).FindComponent( 'LKP_' + cTable ) ) <> nil then
     begin
          if not TFDQuery( TComponent(pFrame).FindComponent( 'LKP_' + cTable ) ).FieldByName( pField ).IsNull then
             try
                Result := TFDQuery( TComponent(pFrame).FindComponent( 'LKP_' + cTable ) ).FieldByName( pField ).AsVariant;
             except
                   rc_ShowError( '<strong>rc_GetLookUpField<strong><br><br>Field' + pField + '<br>' + 'LookUP:' + TComponent(pLkp).Name + '<br>');
             end;
     end;
end;
// v. 3.0.0.0
function tdm_rc.rc_GetNextID(pIsFireDac: Boolean; pTable , pField , pWhere : string ) : Integer;
begin
     mm.varC_LastProcFuncError := 'rc_GetNextID';

     pTable := Trim( pTable );

     // MySql LINUX é casesensitive, apesar de poder fazer configuração para evitar isso
     // assumimos por padrao minusculas
     pTable := lowercase( pTable );

     pField  := Trim( pField );
     pWhere  := Trim( pWhere );

      if pWhere <> '' then
         pWhere := ' Where ' + pWhere;

      Result := 0;

      //----------[[RESTDATAWARE
//      if not pIsFireDac then
//         mm.varB_OperationProcessed := rc_ConnectRestDATAWARE( mm.RESTDataBase , mm.CONFIG_DATABASE_HOST_IP_RDW , mm.CONFIG_DATABASE_USERNAME_RDW , mm.CONFIG_DATABASE_PASSWORD_RDW , '' , '' , mm.CONFIG_DATABASE_PORT_RDW )
//      else
      //----------RESTDATAWARE]]
      mm.varB_OperationProcessed := rc_ConnectFireDAC( mm.CONFIG_DATABASE_FIREDAC , mm.SQLConn );

      if mm.varB_OperationProcessed then
      begin
         sqlNextID.Active := False;

         // para melhor performance
         // crie um índice em sua tabela pelo campo chave em ordem decrescente
         //
         // for better performance
         // create an index on your table by the key field in descending order
         sqlNextID.SQL.Text := ' Select Max( ' + pField + ')id ' + // alias padrão( codigo = id )
                               ' From ' + pTable +
                               pWhere;
         Try
               //----------[[RESTDATAWARE
//               if not pIsFireDac then
//               begin
//                    sqlRdwNextID.Active := False;
//                    sqlRdwNextID.SQL.Text := sqlNextID.SQL.Text;
//                    sqlRdwNextID.Active := True;
//
//                    Result := sqlRdwNextID.FieldByName( 'id' ).AsInteger;
//                    sqlRdwNextID.Active := False;
//               end
//               else
               //----------RESTDATAWARE]]
               begin
                    sqlNextID.Active := True;

                    // mantive 'id' pois é associado um ALIAS logo acima...
                    // qd o campo STRING é CHAR, vem com ESPACOS: Ex: Campo CHAR(6) -> retorna '1      '
                    // se for o primeiro registro retorna vazio, temos q tratar
                    if sqlNextID.FieldByName( 'id' ).AsString = '' then
                       Result := 0
                    else
                       Result := StrToIntDef( trim( sqlNextID.FieldByName( 'id' ).AsString ) , -1);

                    sqlNextID.Active := False;
               end;
         except
               on e:Exception do
               begin
                       ShowMessagE( E.Message );
                       abort;
               end;
         End;

         // para replicacao( se nao for usar o sistema on line )
         // ou simplesmente para organizar os CODIGOS SEQUENCIAIS por EMPRESA
         //
         // Comente essas linhas se quiser usar SEQUENCIAL padrao mesmo
         //
         // adiciona o cod. da empresa como prefixo
         //
         //if Result = 0 then
         //   Result := StrToInt( ReverseString( StrZero( mm.varI_Code_Company, 12 ) ) ) + Result;

         Result := Result + 1;
      end;
end;

procedure tdm_rc.rc_GetObjParent( pForm:TObject; pObj : TUniControl; out iLeft, iTop : integer; pParentComp : TComponent );
begin
   iLeft := pObj.Left;
   iTop  := pObj.Top ;

   if pObj.HasParent then
      pParentComp := pObj.GetParentComponent
   else
      pParentComp := nil;

   repeat
       if pObj <> NIL then
       begin
          iLeft := iLeft + TUniControl( pParentComp ).Left;
          iTop  := iTop  + TUniControl( pParentComp ).Top;

          if TUniControl( pParentComp ).HasParent then
             pParentComp := TUniControl( pParentComp ).GetParentComponent
          else
             pParentComp := nil;
       end;
   until ( pParentComp = nil ) or not ( pObj.HasParent );
end;

// feedback: Mesut from Turkey
{$ifdef LINUX}
function tdm_rc.rc_GetURLContent(pURL: string): string;
var
  h:tidhttp;
begin
result:='';
  try
  h:=tidhttp.create(nil);
  if pos('https',pURL)>0 then
    begin
    h.IOHandler := TIdSSLIOHandlerSocketOpenSSL.Create(h);
    h.HandleRedirects := True;
    end;
    try
    h.HandleRedirects:=true;
    h.ReadTimeout:=5000;
      try
      result:=h.get(pURL);
      except
      end;
    finally
    freeandnil(h);
    end;
  except

  end;
end;
{$endif}
// v. 3.2.0..7
//{$ifdef MSWINDOWS}
//// experimental
//function tdm_rc.rc_GetURLContent(pURL: string): string;
//var
//  NetHandle: HINTERNET;
//  UrlHandle: HINTERNET;
//  Buffer: array[0..1023] of byte;
//  BytesRead: dWord;
//  StrBuffer: UTF8String;
//begin
//  Result := '';
//  NetHandle := InternetOpen('Delphi 2009', INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0);
//  if Assigned(NetHandle) then
//    try
//      UrlHandle := InternetOpenUrl(NetHandle, PChar( pURL ), nil, 0, INTERNET_FLAG_RELOAD, 0);
//      if Assigned(UrlHandle) then
//        try
//          repeat
//            InternetReadFile(UrlHandle, @Buffer, SizeOf(Buffer), BytesRead);
//            SetString(StrBuffer, PAnsiChar(@Buffer[0]), BytesRead);
//            Result := Result + StrBuffer;
//          until BytesRead = 0;
//        finally
//          InternetCloseHandle(UrlHandle);
//        end
//      else
//        raise Exception.CreateFmt('Cannot open URL %s', [pURL]);
//    finally
//      InternetCloseHandle(NetHandle);
//    end
//  else
//    raise Exception.Create('Unable to initialize Wininet');
//end;
//{$endif}

procedure tdm_rc.DynamicOnChangeValueForSetDS(sender: TObject);
// v. 3.2.0..7
var
   cTemp, cTemp2, cSaveTo : string;
   LkpEDIT : TUniControl;
   LkpDs : TDataSource;
   // v. 4.0.0.0
   pDM : TDataModule;
begin
     if ( sender is TUniDBEdit ) then
        if  Pos( '_setds_' , lowercase( TUniDBEdit( sender ).Name ) ) > 0 then
        begin
           cTemp   := lowercase( TUniDBEdit( sender ).Name );
           cTemp   := Copy( cTemp, 1, Pos( '_setds_', cTemp ) - 1 );
           LkpEDIT := TUniControl( TUniDBEdit( sender ).owner.FindComponent( cTemp ) );

           //ds
           cTemp2 := TUniDBEdit( sender ).Hint;
           cTemp2 := Trim ( Copy( cTemp2, Pos( ' ds:', cTemp2 ) + 4, 100 )  )+ ' '; // v. 3.3.1.0
           cTemp2 := Copy( cTemp2 , 1, Pos( ' ', cTemp2  ) - 1 );
           cTemp2 := StringReplace( cTemp2 , ']]', '', [rfReplaceAll] );
           cTemp2 := rc_GetHintProperty( 'ds:', TUniControl( sender ).Hint );

           //saveto... [[saveto:codiibge_cli]]
           cSaveTo := rc_GetHintProperty( 'saveto:', TUniControl( sender ).Hint );
           if cSaveTo = '_default' then
              cSaveTo := TUniDBEdit( sender ).DataField;
           // v. 4.0.0.0
           If Pos( '.', cTemp2 ) > 0 then
           begin
               pDM := nil;
               pDM := rc_FindDataModule( Copy( cTemp2, 1, pos( '.', cTemp2 ) - 1 ) );
               cTemp2 := Copy( cTemp2, pos( '.', cTemp2 ) + 1 );
           end;
           if pDM <> nil then
              LkpDS  := TDataSource( pDM.FindComponent( cTemp2 ) )
           else
              LkpDS  := TDataSource( TUniDBEdit( sender ).owner.FindComponent( cTemp2 ) );
           //LkpDs   := TDataSource( TUniDBEdit( sender ).owner.FindComponent( cTemp2 ) );

           if ( LkpDs <> nil ) and ( cSaveTo <> '' ) then
           begin
              Try
                 if ( LkpDs.DataSet.State in [ dsEdit, dsInsert ] ) then
                 begin
                     cTemp := dm_rc.rc_GetLookUpField( TUniDBEdit( LkpEDIT ).Owner , TUniDBEdit( LkpEDIT ), TUniDBEdit( sender ).DataField );
                     if DataTypeIsNumber( LkpDs.DataSet.FieldByName( cSaveTo ).DataType ) then
                        LkpDs.DataSet.FieldByName( cSaveTo ).AsInteger := StrToIntDef( cTemp, 0 )
                     else
                     if DataTypeIsDateTime( LkpDs.DataSet.FieldByName( cSaveTo ).DataType ) then
                        LkpDs.DataSet.FieldByName( cSaveTo ).AsDateTime := StrToDateDef( cTemp, 0 )
                     else
                     if DataTypeIsString( LkpDs.DataSet.FieldByName( cSaveTo ).DataType ) then
                        LkpDs.DataSet.FieldByName( cSaveTo ).AsString := cTemp;
                 end;
              except on e:exception do
                     begin
                          // v. 3.2.0..7
                          cTemp := UTF8ToString( TUniDBEdit( LkpEDIT ).DataField );
                          dm_rc.rc_ShowSweetAlert( 'SetDS Error', 'Source / destination field not found: ' + cTemp , 'error' );
                          Abort;
                     end;
              End;
           end;
        end;
end;
// v. 3.0.0.0
procedure tdm_rc.DynamicOnClickLink(sender: TObject );
var
   pLink, pName : string;
   oEdit : TUniControl;
   oOwner : TComponent;
begin
     pLink :=  rc_GetHintProperty( 'link:' , TUniControl( sender ).Hint ) ;

     if pLink = '' then
     begin
          pName  := StringReplace( TUniControl( sender ).Name, 'rcBtnLink_', '', [rfReplaceAll] );
          oEdit  := TUniEdit( TUniControl( sender ).FindComponent( pName ) );
          oOwner := TComponent( sender ).Owner;
          oEdit  :=  TUniControl( TUniEdit( TObject( oOwner ) ).FindComponent( pName ) );

          if oEdit <> nil then
          begin
               pLink :=  TUniEdit( oEdit ).Text ;
          end;
     end;

     if pLink <> '' then
     begin
        if Pos( 'http', lowercase( pLink ) ) = 0 then
           pLink := 'http://' + pLink;
     end;

     rc_OpenLink( pLink );
end;
// v. 3.0.0.0
procedure tdm_rc.DynamicOnClickDial(sender: TObject );
var
   pPhone, pName : string;
   oEdit : TUniControl;
   oOwner : TComponent;
begin
     pPhone :=  rc_GetHintProperty( 'dial:' , TUniControl( sender ).Hint ) ;

     if pPhone = '' then
     begin
          pName  := StringReplace( TUniControl( sender ).Name, 'rcBtnPhone_', '', [rfReplaceAll] );
          oEdit  := TUniEdit( TUniControl( sender ).FindComponent( pName ) );
          oOwner := TComponent( sender ).Owner;
          oEdit  :=  TUniControl( TUniEdit( TObject( oOwner ) ).FindComponent( pName ) );

          if oEdit <> nil then
          begin
               pPhone :=  TUniEdit( oEdit ).Text ;
          end;
     end;

     UniSession.AddJS( 'window.location.href="tel://' + pPhone + '"');
end;
// v. 3.0.0.0
procedure tdm_rc.DynamicOnClickMail(sender: TObject );
var
   pEmail, pName : string;
   oEdit : TUniControl;
   oOwner : TComponent;
begin
     pEmail :=  rc_GetHintProperty( 'mail:' , TUniControl( sender ).Hint ) ;

     if pEmail = '' then
     begin
          pName  := StringReplace( TUniControl( sender ).Name, 'rcBtnpEmail_', '', [rfReplaceAll] );
          oEdit  := TUniEdit( TUniControl( sender ).FindComponent( pName ) );
          oOwner := TComponent( sender ).Owner;
          oEdit  :=  TUniControl( TUniEdit( TObject( oOwner ) ).FindComponent( pName ) );

          if oEdit <> nil then
          begin
               pEmail :=  TUniEdit( oEdit ).Text ;
          end;
     end;
end;
// v. 3.0.0.0
function tdm_rc.rc_GetRecord(pIsFireDac: Boolean; pAll : boolean; pSql: String ) : TFDMemTable;
var
   cGetFields ,
   cTempSQL_General : string;
begin
     // OBS
     // ===
     // as mensagens de erro da GetRegistroS devem ser acionadas no codigo e nao
     // dentro da função
     mm.varC_LastProcFuncError := 'GetRegistroS';

     // _todos S ou N pode serguir de '.' e a lista de campos que se deseja retornar na query
     if Pos( '.' , pSql ) > 0 then
        cGetFields := Copy( pSql , 2, 10000 )
     else
        cGetFields := '*';

     // se nao pos o ORDER acrescenta para nao dar erro no ROWS / LIMIT
     // mas só se não tiver o PRAGMA( pra trazer a estrutura LOCAL do SQLITE )
     // ou nao vier do MySQL tb...
     //
     if ( Pos( 'order by' , lowercase( pSql ) ) = 0 ) and
        ( Pos( 'pragma', lowercase( pSql ) ) = 0 ) and
        ( Pos( 'show columns' , lowercase( pSql ) ) = 0 ) and
        ( Pos( 'show keys' , lowercase( pSql ) ) = 0 ) and
        ( Pos( 'show tables' , lowercase( pSql ) ) = 0 ) then
     begin
          if Pos( 'noorder.' , pSql ) = 0 then
             pSql := pSql + ' order by 1'
          else
             pSql := Copy( pSql , 9, 10000 );
     end;

     cTempSQL_General := pSql;

     // Tratar o tipo de CONEXÃO usada
     //----------[[RESTDATAWARE
//     if not pIsFireDac then
//     begin
//           //trazer só um registro
//           //
//           // se nao vier do MySQL
//           if ( not pAll ) and
//              ( Pos( 'show columns' , lowercase( pSql ) ) = 0 ) and
//              ( Pos( 'show tables' , lowercase( pSql ) ) = 0 ) then
//              cTempSQL_General := cTempSQL_General + ' ' + rc_GetSQL( mm.CONFIG_DATABASE_RDW , 'cmd_paginate' ) + ' 1 ';
//
//           sqlRdwGetRecords.Active := False;
//           sqlRdwGetRecords.SQL.Text    := cTempSQL_General;
//     end
//     else
     //----------RESTDATAWARE]]
     begin
           //trazer só um registro
           if ( not pAll ) and
              ( Pos( 'show columns' , lowercase( pSql ) ) = 0 ) and
              ( Pos( 'show tables' , lowercase( pSql ) ) = 0 ) then
           begin
                // Feedback by Fábio Oliveira and adapt to bug prevent by Flávio Motta - In SQL SERVER the TOP X, must be after the SELECT not in the final
                if mm.CONFIG_DATABASE_FIREDAC = 'SQLSERVER' then
                begin
                   cTempSQL_General := Trim (cTempSQL_General );
                   cTempSQL_General := Copy( cTempSQL_General, Pos( ' ' , cTempSQL_General ) + 1, 5000 );
                   cTempSQL_General := ' select TOP 1 ' + cTempSQL_General;
                end
                // v. 4.0.0.5
                else
                begin
                   cTempSQL_General := cTempSQL_General + ' ' + rc_GetSQL( mm.CONFIG_DATABASE_FIREDAC , 'cmd_paginate' ) + ' 1 ';
                   cTempSQL_General := StringReplace( cTempSQL_General , ' order by 1', '', [rfReplaceAll] );
                end;
           end;

           sqlGetRecords.Active   := False;
           sqlGetRecords.SQL.Text := cTempSQL_General  ;
     end;

    mm.varC_LastErrorMsg := '';

    // senao foi inserido um dos campos padroes de lookup, a estrutura SQLITE ou a tab. origem tem que ser remodelada
    if Pos( 'semestrutura' , cTempSQL_General ) > 0 then
    begin
         mm.varC_LastErrorMsg := 'A tabela de pesquisa não foi definida ou a estrutura do BD( sqlite ) está desatualizada!';
    end;

    Result := nil;

    //----------[[RESTDATAWARE
//    if not pIsFireDac then
//       mm.varB_OperationProcessed := rc_ConnectRestDATAWARE( mm.RESTDataBase , mm.CONFIG_DATABASE_HOST_IP_RDW , mm.CONFIG_DATABASE_USERNAME_RDW , mm.CONFIG_DATABASE_PASSWORD_RDW , '' , '' , mm.CONFIG_DATABASE_PORT_RDW )
//    else
    //----------RESTDATAWARE]]
    mm.varB_OperationProcessed := rc_ConnectFireDAC( mm.CONFIG_DATABASE_FIREDAC , mm.SQLConn );

    if mm.varB_OperationProcessed then
    begin
       //----------[[RESTDATAWARE
//       if not pIsFireDac then
//       begin
//             // dentro da query( DM ) há um evento para guardar um possivel ERRO na variavel
//             // mm.varC_LastErrorMsg
//             //
//             sqlRdwGetRecords.Active := True;
//       end
//       else
       //----------RESTDATAWARE]]
       begin
             try
                sqlGetRecords.Open;
             except
                   on e:Exception do
                   begin
                       mm.varC_LastProcFuncError := 'GetRegistroS( LOCAL )';
                       mm.varC_LastErrorMsg := mm.MSG_BUGERROR_COM_SERVER_FAIL + '<br><br>' + E.Message;
                   end;
             end;
       end;

       // se nao houve erro...
       if mm.varC_LastErrorMsg = '' then
       begin
            memRecords.Close;

            //----------[[RESTDATAWARE
//            if not pIsFireDac then
//               memRecords.Data := sqlRdwGetRecords.Data
//            else
            //----------RESTDATAWARE]]
            memRecords.Data := sqlGetRecords.Data ;

            Result := memRecords;
       end
       else
           mm.varC_SQLERROR := cTempSQL_General;
    end
    else
       mm.varC_LastErrorMsg := mm.MSG_BUGERROR_COM_SERVER_FAIL ;
end;
// v. 3.1.0.60
function tdm_rc.rc_GetTotRecords( pIsFireDac : Boolean;  pTable : string; pWhere : string  ) : integer;
begin
   // MySql LINUX é casesensitive, apesar de poder fazer configuração para evitar isso
   // assumimos por padrao minusculas
   pTable := lowercase( pTable );

   memTotRecords.Close;
   Result := 0;
   if pTable <> '' then
   begin
      memTotRecords.Data := rc_GetRecord( pIsFireDac,
                                         false,
                                         'Select count(*)TOT from ' + Trim( pTable ) +
                                         varIIF( pWhere <> '' , ' Where ' , '' ) + pWhere );

      if mm.varC_LastErrorMsg <> '' then
      begin
        // v. 3.2.0.6
        //ShowMessagE( mm.varC_LastErrorMsg );
        rc_ShowSweetAlert( mm.MSG_ERROR, mm.varC_LastErrorMsg, 'error' ); // v. 3.3.1.0
        abort;
      end;

      Result := memTotRecords.Fields[0].AsInteger;

      memTotRecords.Close;
   end
   else
      UniSession.Log( 'rc_GetTotRecords: Table is missing!!!' );
end;
// v. 3.3.1.0
procedure tdm_rc.rc_ShowInputBox( pTitle : string ; pLab1, pEd1 : string ; pLab2 : string = ''; pEd2 : string = ''; bIsPassword : boolean = false );
begin
     mm.varC_InputBox_Result1 := '';
     mm.varC_InputBox_Result2 := '';
     mm.varC_InputBox_Result3 := '';

     frmInputBox.imgTipo.Picture.LoadFromFile( sm.FilesFolderPath + 'images' + BACKSLASH + 'messages' + BACKSLASH + 'question.png' );

     frmInputBox.labTitleForm.Text := pTitle;

     frmInputBox.lab1.Text     := pLab1;
     frmInputBox.Ed1.emptytext := pEd1;

     frmInputBox.lab2.visible  := pLab2 <> '';
     frmInputBox.lab2.Text     := pLab2;
     frmInputBox.Ed2.emptytext := pEd2;

     frmInputBox.ed2.visible   := frmInputBox.lab2.visible;

     if ( frmInputBox.ed2.visible ) then
     begin
        if bIsPassword then
           frmInputBox.ed2.PasswordChar := '*'
        else
           frmInputBox.ed2.PasswordChar := #0;
     end
     else
     begin
        if bIsPassword then
           frmInputBox.ed1.PasswordChar := '*'
        else
           frmInputBox.ed1.PasswordChar := #0;
     end;
     // v. 4.0.0.0
     frmInputBox.btnOk.Caption := mm.MSG_OK;
     frmInputBox.btnNo.Caption := mm.MSG_NO;

     frmInputBox.btnNo.Hint    := '[[cls:ButtonRed|center:parent x:-95]]';
     frmInputBox.btnOk.Hint    := '[[cls:ButtonGreen|align:btnNo r:10]]';
     frmInputBox.ShowModal;
end;
// v. 3.3.1.0
procedure tDM_RC.rc_ShowMessage( pMessage : string; pTipo : string = 'info'; pWidth : integer = 360; pHeight : integer = 360 );
var
   cMessageType : string;
begin
   if UniApplication.FindComponent('MainForm' ) <> nil then
      MainForm.HideMask;

   if pTipo = 'warning' then
      cMessageType := mm.MSG_WARNING
   else
   if pTipo = 'info' then
      cMessageType := mm.MSG_INFO
   else
   if pTipo = 'success' then
      cMessageType := mm.MSG_SUCCESS
   else
   if pTipo = 'error' then
      cMessageType := 'Ops! ' + mm.MSG_ERROR + '...'
   else
   if pTipo = 'question' then
      cMessageType := mm.MSG_CONFIRM;
   // when an error occurs in "frmLOGIN" there is an "anomaly" that I could not
   // solve. This workaround gets around the problem.
   // quando ocorre um erro no "frmLOGIN" há uma "anomalia" que não consegui
   // resolver. Esta alternativa contorna o problema.
   if ( pTipo = 'error' ) and ( not mm.varB_LoginProcessed ) then
      rc_ShowSweetAlert( cMessageType , pMessage, pTipo )
   else
   begin
      pMessage := '<div class="centerTxt">' + pMessage + '</div>';
      pMessage := StringReplace( pMessage, #13#10 , '<br>' , [rfReplaceAll] );

      frmMessage.btnTicket.Caption := mm.MSG_OPEN_TICKET; // v. 3.3.0.0
      frmMessage.btnOk.Caption := mm.MSG_OK;
      frmMessage.btnOk.Hint := '[[cls:ButtonBlueDark]]';
      frmMessage.btnNo.visible := ( pTipo = 'question' ) or ( pTipo = 'error' );
      frmMessage.btnTicket.visible := ( pTipo = 'error' );

      frmMessage.Width  := pWidth;
      frmMessage.Height := pHeight;

      if pTipo = 'error' then
      begin
         frmMessage.btnOk.Caption := mm.MSG_CONTINUE;
         frmMessage.btnNo.Caption := mm.MSG_CANCEL;
         frmMessage.btnOk.Hint    := '[[cls:ButtonBlue]]';
         frmMessage.btnNo.Hint    := '[[cls:ButtonRed]]';
      end
      else
      if pTipo = 'question' then
      begin
         frmMessage.btnOk.Caption := mm.MSG_YES ;
         frmMessage.btnNo.Caption := mm.MSG_NO ;
         frmMessage.btnNo.Hint    := '[[cls:ButtonRed|center:parent x:-95]]';
         frmMessage.btnOk.Hint    := '[[cls:ButtonGreen|align:btnNo r:10]]';
      end
      else
      begin
         frmMessage.btnOk.Hint    := '[[cls:ButtonGreen|center:parent x]]';
      end;


      frmMessage.labTitleForm.Caption := cMessageType;
      frmMessage.imgTipo.Picture.LoadFromFile( sm.FilesFolderPath + 'images' + BACKSLASH + 'messages' + BACKSLASH +pTipo + '.png' );

      frmMessage.memoMensagem.HTML.Clear;
      frmMessage.memoMensagem.HTML.Add( '<style>' );
      frmMessage.memoMensagem.HTML.Add( '.centerTxt{' );

      if frmMessage.memoMensagem.Alignment = taLeftJustify then
         frmMessage.memoMensagem.HTML.Add( '  text-align: center;' )
      else
      if frmMessage.memoMensagem.Alignment = taRightJustify then
         frmMessage.memoMensagem.HTML.Add( '  text-align: right;' )
      else
      if frmMessage.memoMensagem.Alignment = taCenter then
         frmMessage.memoMensagem.HTML.Add( '  text-align: center;' );

      frmMessage.memoMensagem.HTML.Add( '  font-size: 18px;' );
      frmMessage.memoMensagem.HTML.Add( '  color: black;' );
      frmMessage.memoMensagem.HTML.Add( '}' );
      frmMessage.memoMensagem.HTML.Add( '</style>' );

      frmMessage.memoMensagem.HTML.Add( pMessage );

      if pTipo = 'question' then
         frmMessage.ShowModal
      else
        frmMessage.ShowModal( procedure(Sender: TComponent; Result:Integer)
                               begin
                                 //callback....nesse caso, não é necessário tratar o retorno
                               end
                             );
   end;
end;
// v. 3.3.1.0
procedure tdm_rc.rc_ShowYesNo(pMessage: string; pWidth : integer = 360; pHeight : integer = 360 );
begin
     rc_ShowMessage( pMessage, 'question' , pWidth, pHeight );
end;
procedure tdm_rc.rc_ShowSuccess(pMessage: string; pWidth, pHeight: integer);
begin
     rc_ShowMessage( pMessage, 'success' , pWidth, pHeight );
end;
procedure tdm_rc.rc_ShowInfo(pMessage: string; pWidth, pHeight: integer);
begin
     rc_ShowMessage( pMessage, 'info' , pWidth, pHeight );
end;
procedure tdm_rc.rc_ShowWarning(pMessage: string; pWidth, pHeight: integer);
begin
     rc_ShowMessage( pMessage, 'warning' , pWidth, pHeight );
end;

function tdm_rc.rc_StripHtmlTags(pHtml: string): string;
var
  TagBegin, TagEnd, TagLength: integer;
begin
  TagBegin := Pos( '<', pHtml );

  while (TagBegin > 0) do
  begin
    TagEnd    := Pos('>', pHtml );
    TagLength := TagEnd - TagBegin + 1;

    Delete(pHtml, TagBegin, TagLength);

    TagBegin  := Pos( '<', pHtml);

  end;

  Result := Trim( pHtml );
end;
// v. 3.3.1.0
procedure tdm_rc.rc_ShowError( pMessage: string; pWidth : integer = 360; pHeight : integer = 360 );
begin
     rc_ShowMessage( pMessage, 'error' , pWidth, pHeight );
end;

procedure tdm_rc.rc_RecordDeleteCallBack(Sender: TComponent;
  AResult: Integer);
begin
   UniSession.ShowAlert( 'callback: '  + Inttostr( AResult ) );
end;
// v. 3.1.0.63
function tdm_rc.rc_ExtEvtKeyDownOnlyNumbers: string;
begin
     Result := '  function keydown(sender, e, eOpts)' +
               '  {' +
               '    var ok =' +
               '          event.keyCode == 8 || ' +//backspace
               '          event.keyCode == 9 || ' +//tab
               '          event.keyCode == 13 || ' +//enter
               '          event.keyCode >= 35 && event.keyCode <= 37 || ' +//end, home, left arrow
               '          event.keyCode == 39 || ' +//right arrow, downd arrow, insert, delete
               '          event.keyCode == 45 || ' +//insert
               '          event.keyCode == 46 || ' +//delete
               '          event.keyCode >= 96 && event.keyCode <= 105 || ' +// 0-9 on keypad
               '          event.keyCode >= 48 && event.keyCode <= 57; ' +// 0-9
               '      if (!ok) {' +
               '          e.preventDefault();' +
               '      }' +
               '  }';
end;

function tdm_rc.rc_ExtractFieldNameFromSearchItem(pItem: string; pAlias : boolean ) : string;
var
   cAlias, cTabStructurecAlias,
   cField : string;
begin
     cField := pItem;

     if ( Pos( '.' , cField ) > 0 ) then
     begin
        if ( Pos( ' as ' , cField ) > 0 ) then
        begin
           cAlias := StringReplace( ansilowercase(trim(Copy ( cField , Pos( ' as ' , cField ) + 4, 40 ))), #34, '', [rfReplaceAll] ) ;
           cField := lowercase(trim(Copy ( cField , 1, Pos( ' as ' , cField ) - 1  )))
        end
        else
        begin
           mm.varC_FieldName := ansilowercase(trim(Copy ( cField , Pos( '.' , cField ) + 1, 40 )));
           cTabStructurecAlias  := Trim( Copy ( cField , 1, Pos( '.' , cField ) - 1 ) );
           cAlias         := ansilowercase(trim(mm.varC_FieldName));
        end;
     end
     else
     begin
         mm.varC_FieldName := ansilowercase(trim(cField));
         cTabStructurecAlias  := Trim( mm.varC_Table_Search );
         cAlias         := mm.varC_FieldName;
     end;

     if pAlias then
        Result := cAlias
     else
        Result := cField;
end;
// v. 4.0.0.0 - paginator
// este recurso está em análise para ser liberado ou não
// this feature is under review to be released or not
procedure tdm_rc.rc_DBGridHidePaginationBar(pGrid: TUniDBGrid);
var
   cHidden : string;
begin
     cHidden := 'true';//varIIF( mm.varB_DefaulPageBar, 'false', 'true' );
     pGrid.ClientEvents.UniEvents.Values['pagingBar.beforeInit'] := 'function (sender, config) {config.hidden = ' + cHidden + ';}';
end;
// v. 4.0.0.0
procedure tdm_rc.rc_DBGridUpdateAll(pObj: TObject ; pRefresh : boolean; pRefreshPaginator : boolean; pCheckForceFit : boolean  ); // v. 4.0.0.0
var
   i : integer;
// v. 4.0.0.0
   oPaPageBar, oPaPageBtn : TUniContainerPanel;
   oDBGrid    : TUniDBGrid;
   pControl : TUniControl;
begin
      if ( TComponent( pObj ) is TUniForm ) or ( TComponent( pObj ) is TUniFrame ) then
      begin
           for i := 0 to TUniControl( pObj ).ComponentCount - 1 do
           begin
              if ( TUniControl( pObj ).Components[i] is TUniDBGrid ) then
              begin
                 oDBGrid := TUniDBGrid( TUniControl( pObj ).Components[i] );
                 // v. 4.0.0.0 - paginator
                 if ( Pos( 'grid-fm-rs!' , oDBGrid.Hint ) > 0 ) or
                    ( Pos( 'grid-resize', oDBGrid.Hint ) > 0 ) then
                 begin
                    // v. 4.0.0.0
                    if not pRefreshPaginator then
                       dm_rc.rc_DBGridUpdate( oDBGrid, pRefresh, pCheckForceFit );
                    // v. 4.0.0.0
                    if ( oDBGrid.WebOptions.Paged ) and
                       ( ( Pos( 'grid-paginator' , oDBGrid.Hint ) > 0 ) or ( mm.CONFIG_LAYOUT_GRID_RC_PAGINATOR = 'ON' ) ) then
//                       rc_GridPaginatorGoPage(
//                          oDBGrid,
//                          TUniEdit( oDBGrid.Owner.FindComponent('edPageNumber_' + oDBGrid.Name) ),
//                          TUniLabel( oDBGrid.Owner.FindComponent('labPageCurrPage_' + oDBGrid.Name) )
//                       );
                 end;
              end;
           end;
      end;
end;
// v. 4.0.0.0
// recarregar registros,  reajustar forcefit do grid padrão para reconfiguração de GRID BTN ACTIONS
procedure tdm_rc.rc_DBGridUpdate(pGrid: TUniDBGrid; pRefresh : boolean; pCheckForceFit : boolean );
var
   bRcAction : boolean;
   iColumns , iPos, iPos2, iLastPos, f, i, // v. 3.3.3.0
   iActions : integer;
   cGridColsVisible, // v. 4.0.0.0
   cAction, cSql, cHint, cTmp, cTemp, cTemp2, cTemp3, cFieldMask, cField : string;
begin
     if ( pGrid <> nil ) then // v. 3.3.3.0
     if ( pGrid.Name <> 'dbgExport' ) then // v. 3.3.3.0
     begin
          bRcAction := false;
          iActions  := 0;
          if pGrid.DataSource <> nil then
             if pGrid.DataSource.DataSet <> nil then
                if lowercase( pGrid.DataSource.DataSet.ClassName ) = 'tfdquery' then
                begin
                  bRcAction := Pos( 'rcAction_' , TFDQuery( pGrid.DataSource.DataSet ).SQL.Text ) > 0;
                  iActions  := Occurs( 'rcAction_' , TFDQuery( pGrid.DataSource.DataSet ).SQL.Text ) ;
                end;

          if bRcAction then
          begin
             iActions := iActions;

             // (re)constuir / (re)build  HINT
             //    'rcAction_Edit[[title:|width:4% mobile-h:8% mobile-v:12%]];' +
             (*
             [[fieldmasks:table-feriados;grid-resize|código[[visible:false mobile-v]];data[[visible:false mobile-v]];tipo[[visible:false mobile]];|state-visible:empty-false ds:dsSearchMaster]]'
             *)
             // v. 3.3.3.0
             cHint := trim( RightStr( pGrid.Hint, 3 ) );
             if Pos( ';', cHint ) > 0 then
                cHint := Trim( Copy( pGrid.Hint , 1, Length( pGrid.Hint ) - 2 ) )
             else
             begin
                cTmp  := ReverseStr( pGrid.Hint );
                cTmp  := Copy( cTmp, 1, Pos( ';]]', cTmp )-1  );
                cTmp  := ReverseStr( cTmp );
                cHint := StringReplace( pGrid.Hint, cTmp, '', [rfReplaceAll] );
             end;

             if Pos( 'width:default', cHint ) = 0 then
             begin
                iLastPos := 0;
                for f := 1 to iActions do
                begin
                     cSql := TFDQuery( pGrid.DataSource.DataSet ).SQL.Text;
                     cSql := Copy( cSql, iLastPos , 5000 );
                     iPos := Pos( 'as rcAction_' , cSql );
                     cSql := Copy( cSql, iPos, 200 );
                     cSql := Copy( cSql, 1, 100 );
                     iLastPos := iLastPos + iPos + 12;

                     cAction := Trim( Copy( cSql, 1 + 12, 100 ) ) + ' ';
                     cAction := Trim( Copy( cAction, 1 ,Pos( ' ', cAction ) ) )  ; // v. 4.0.0.0
                     // v. 4.0.0.0
                     if ( cAction <> '' ) and ( Pos( lowercase( 'rcAction_' + cAction ), lowercase( pGrid.Hint ) ) = 0 ) then
                     begin
                          if Pos( ',', cAction ) > 0 then
                             cAction := Trim( Copy( cAction, 1, Pos( ',', cAction ) - 1 ) )
                          else
                          if Pos( ' ', cAction ) > 0 then
                             cAction := Trim( Copy( cAction, 1, Pos( ' ', cAction ) - 1 ) );
                          // v. 4.0.0.0
                          //cHint := cHint + 'rcAction_' + cAction + '[[title:|width:99 mobile-v-112]];'; // v. 3.3.3.0 action
                          cHint := cHint + 'rcAction_' + cAction + '[[title:|width:default]];';
                     end;
                end;
                // v. 3.3.3.0
                pGrid.Hint := cHint + cTmp;//']]';
             end;
          end;
          // v. 4.0.0.0
          //f := -1;
          //iColumns := -3;
          //if ( pCheckForceFit ) and ( pGrid.DataSource <> nil ) then
          if pGrid.DataSource <> nil then
             if pGrid.DataSource.DataSet <> nil then
             begin
               // v. 4.0.0.0             
               //iColumns := 0;
               // v. 3.3.3.0
               if Pos( 'grid-forcefit:', pGrid.Hint ) > 0 then
               begin
                    cHint := Copy( pGrid.Hint, Pos( 'grid-forcefit:', pGrid.Hint ) + 14 );
                    cHint := Copy( cHint, 1, Pos( '|', cHint ) - 1 ) + ' ' ;  // v. 3.3.3.1
               end;
               // v. 3.3.3.1
               if ( ( Pos( 'mobile-v-', cHint ) > 0 ) and ( mm.varB_Mobile_Screen_Portrait ) ) or ( mm.varB_Mobile_Screen_Portrait ) then
                  f := StrToIntDef( rc_GetHintProperty( 'mobile-v-', cHint, true ) , 5 )
               else
               if ( ( Pos( 'mobile-h-', cHint ) > 0 ) and ( mm.varB_Mobile_Screen_Landscape ) ) or ( mm.varB_Mobile_Screen_Landscape ) then
                  f := StrToIntDef( rc_GetHintProperty( 'mobile-h-', cHint, true ) , 8 )
               else
               if ( ( Pos( 'mobile-', cHint ) > 0 ) and ( mm.varB_Mobile_Screen ) ) or ( mm.varB_Mobile_Screen ) then
                  f := StrToIntDef( rc_GetHintProperty( 'mobile-', cHint, true ) , 5 )
               else
               begin
                  f := StrToIntDef( Copy( cHint, 1, Pos( ' ', cHint ) - 1 ), -2 );
               end;
               cFieldMask := ansilowercase( pGrid.Hint  );
               // v. 4.0.0.0
               cGridColsVisible := '';
               for I := 0 to pGrid.Columns.Count - 1 do
               begin
                    cTemp := ansilowercase(pGrid.Columns[i].FieldName) ;
                    if Pos( RemoveAccents( cTemp ) , cGridColsVisible ) = 0  then
                    begin
                         cGridColsVisible := cGridColsVisible+ RemoveAccents( cTemp ) + ' ';
                         Inc( iColumns );
                    end;
                    iPos := Pos( cTemp + '[[' , ansilowercase( cFieldMask ) );
                    if ( iPos > 0 ) then
                    begin
                         cTemp3 := cFieldMask;
                         cFieldMask := Copy( cFieldMask, iPos + 2, 10000 );
                         iPos := Pos( '[[' , ansilowercase( cFieldMask ) );
                         cTemp  := Copy( cFieldMask , iPos, 10000 ) ;
                         cTemp  := Copy( cTemp, 1, Pos( ']]' , cTemp ) - 1 ) ; // pega os params da coluna
                         cTemp2 := Copy( cTemp, Pos( '[[', cTemp ) + 2, 1000 );
                         cField := ansilowercase(pGrid.Columns[i].FieldName) ;

                         cTemp2 := StringReplace( cTemp2, '[[', '', [rfReplaceAll] );
                         cTemp2 := StringReplace( cTemp2, ']];', '', [rfReplaceAll] );
                         cTemp2 := StringReplace( cTemp2, ']]', '', [rfReplaceAll] );
                         cTemp2 := cTemp2 + '|';

                         iPos2 := Pos( '|' , cTemp2 );
                         While ( iPos2 > 0 ) do
                         begin
                              cTemp  := Copy( cTemp2, 1 , iPos2 );
                              cTemp2 := StringReplace( cTemp2, cTemp, '', [rfReplaceAll] );

                              cTemp  := StringReplace( cTemp, '|', '', [rfReplaceAll] );
                              cTemp  := Trim(StringReplace( cTemp, '|', '', [rfReplaceAll] ));

                              if Pos( 'visible:', cTemp ) > 0 then
                              begin
                                 cTemp := cTemp + ' ';

                                 if ( Pos( 'visible:false mobile-v ', cTemp ) > 0 ) and
                                    ( mm.varB_Mobile_Screen_Portrait ) then
                                 begin
                                    Dec( iColumns );
                                 end
                                 else
                                 if ( Pos( 'visible:false mobile-h ', cTemp ) > 0 ) and
                                    ( mm.varB_Mobile_Screen_Landscape ) then
                                 begin
                                    Dec( iColumns );
                                 end
                                 else
                                 if ( Pos( 'visible:false mobile ', cTemp ) > 0 ) and
                                    ( mm.varB_Mobile_Screen ) then
                                 begin
                                    Dec( iColumns );
                                 end
                                 else
                                 // v. 4.0.0.0
                                 //if ( Pos( 'visible:false ', cTemp ) > 0 ) and
                                 if ( Pos( 'visible:false ', cTemp ) > 0 ) and
                                 ( mm.varB_Desktop ) then
                                 begin
                                    Dec( iColumns );
                                 end;
                              end;
                              iPos2 := Pos( '|' , cTemp2 );
                         end;
                    end;
               end;
               if f = -2 then
                  f := iColumns;
               if ( Pos( 'grid-noforcefit', pGrid.Hint ) = 0 ) then
               begin
                     if ( pCheckForceFit ) and ( iColumns > 0 ) then
                        pGrid.ForceFit := ( iColumns <= f );
//                     mm.varB_GridForceFitCheck   := false;
//                     mm.varI_GridColsForceFit    := -1;
//                     mm.varI_TotGridCols         := 0;
//                     mm.varI_TotGridColsVisible  := 0;
//                     mm.varC_GridCols            := '';
               end;
               // v. 4.0.0.0
               if pRefresh then
               begin
                  if ( pGrid.DataSource.DataSet.State <> dsInactive ) and
                     ( not ( pGrid.DataSource.DataSet.State in [dsEdit, dsInsert] ) ) then
                  begin
                     // para reconfigurar o "width" dos campos "rcAction_"
                     // removido até uma solução mais otimizada
                     // removed until a more optimized solution
                     if ( ( ( Pos( 'grid-resize', pGrid.Hint ) > 0 ) or ( Pos( 'grid-fm-rs!' , pGrid.Hint ) > 0 ) ) and
                        ( ( Pos( 'width:', pGrid.Hint ) > 0 ) ) ) or
                        ( Pos( 'rcAction_', cHint ) > 0 ) then
                     begin
                     // v. 4.0.0.0 1
//                       pGrid.DataSource.DataSet.close;
//                       pGrid.DataSource.DataSet.open;
//                       if ( pGrid.WebOptions.Paged ) and
//                          ( ( Pos( 'grid-paginator', pGrid.Hint ) > 0 ) or ( mm.CONFIG_LAYOUT_GRID_RC_PAGINATOR = 'ON' ) ) then
//                          dm_rc.rc_GridPaginatorUpdatePages( pGrid ); // v. 4.0.0.0
                     end;
                  end;
               end;
             end;
     end;
end;
// v. 3.3.1.0
function tdm_rc.rc_ShowSweetAlert( pTitle, pText: String; pType: String; pFormSender : TObject; pControlFocusConfirm : string; pControlFocusDismiss : string ): Boolean; // v. 3.3.1.0
var
   cTmp : string;
begin
   if pFormSender <> nil then
   begin
      if not pControlFocusConfirm.IsEmpty then
         oSweetAlertFocus_Confirm := rc_FindControl( pControlFocusConfirm , pFormSender );

      if not pControlFocusDismiss.IsEmpty then
         oSweetAlertFocus_Dismiss := rc_FindControl( pControlFocusDismiss, pFormSender );

      oSweetAlert := TUniSweetAlert( rc_FindControl( 'rcSweetAlert', pFormSender ) );

      if oSweetAlert <> nil then
         oSweetAlert.OnConfirm := UniSweetAlertConfirm
      else
      begin
         if Pos( '__', TUnicontrol( pFormSender ).Name ) > 0 then
            cTmp := Copy( TUnicontrol( pFormSender ).Name, 1, Pos( '__', TUnicontrol( pFormSender ).Name )-1 )
         else
            cTmp := TUnicontrol( pFormSender ).Name;
         rc_ShowError( 'rc_ShowSweetAlert Param Error:<br> Put one uniSweetAlert component( named rcSweetAlert ) on ' + cTmp );
         Abort;
      end;
   end
   else
      oSweetAlert := uniSweetAlert;

   Result := true; // v. 3.2.0..7
   pText := StringReplace( pText, '''' , '' , [rfReplaceAll]);
   oSweetAlert.Title     := pTitle;
   oSweetAlert.Html      := pText; //uniSweetAlert.Text      := pText; // v. 3.2.0.6
   oSweetAlert.Width     := 360;

   oSweetAlert.AlertType := atSuccess;

   if pType = 'success' then
      oSweetAlert.AlertType := atSuccess
   else
   if pType = 'info' then
      oSweetAlert.AlertType := atInfo
   else
   if pType = 'warning' then
      oSweetAlert.AlertType := atWarning
   else
   if pType = 'error' then
      oSweetAlert.AlertType := atError
   else
   if pType = 'question' then
      oSweetAlert.AlertType := atQuestion;

   oSweetAlert.AllowEscapeKey      := True;
   oSweetAlert.AllowOutsideClick   := False;
   oSweetAlert.CancelButtonText    := mm.MSG_CANCEL;
   oSweetAlert.ConfirmButtonText   := mm.MSG_OK;
   oSweetAlert.ShowCancelButton    := False;
   oSweetAlert.ShowCloseButton     := True;
   oSweetAlert.ShowLoaderOnConfirm := False;
   oSweetAlert.InputType           := ItNone;

   oSweetAlert.Show();
end;
// v. 3.3.1.0
procedure tdm_rc.rc_ShowSweetAlertSuccess(pMessage: string ); // v. 3.3.1.0
begin
     rc_ShowSweetAlert( mm.MSG_SUCCESS, pMessage, 'success' );
end;
procedure tdm_rc.rc_ShowSweetAlertWarning(pMessage: string ); // v. 3.3.1.0
begin
     rc_ShowSweetAlert( mm.MSG_WARNING, pMessage, 'warning' );
end;
procedure tdm_rc.rc_ShowSweetAlertError(pMessage: string ); // v. 3.3.1.0
begin
     rc_ShowSweetAlert( mm.MSG_ERROR, pMessage, 'error' );
end;
procedure tdm_rc.rc_ShowSweetAlertInfo(pMessage: string ); // v. 3.3.1.0
begin
     rc_ShowSweetAlert( mm.MSG_INFO, pMessage, 'info' );
end;
// v. 3.0.0.0 - in dev
function tdm_rc.rc_ShowSweetAlertQuestion( pTitle, pText, pSourceForm: String ): Boolean;
begin
     pText := StringReplace( pText, #13#10, '<br>', [rfReplaceAll] );
     Result := true; // v. 3.2.0..7
end;
// v. 3.0.0.0
procedure tdm_rc.rc_ShowSweetAlertSimple(pMessage: string);
begin
     // good    warning     danger     attention
     pMessage := StringReplace( pMessage, #13#10, '<br>', [rfReplaceAll] );
     rc_ShowSweetAlert( mm.MSG_INFO , pMessage, 'info' );
end;

// v. 3.0.0.0
procedure tdm_rc.rc_ShowToaster( pType, pMessage: string; pSound : boolean; pTransition: string; pDuration : integer = 2000 );
var
   cIcon,
   cTemp : string;
const
     cDir = 'files/js/toasty/dist/sounds/';
begin
//     cIcon := rc_GetHintProperty( 'ico:', pMessage );
//     if cIcon <> '' then
//     begin
//          cIcon := '<i class=''' + cIcon + '''></i>';
//          pMessage := StringReplace( pMessage, Copy( pMessage, Pos( '[[', pMessage ), Pos( ']]', pMessage ) + 2 ), cIcon, [rfReplaceAll]);
//     end;

     cTemp := 'var toast = new Toasty({ ' +
              '    progressBar: true, ' +
              '    duration: ' + pDuration.ToString + ', ';

     if pSound then
        cTemp := cTemp +
                 '    enableSounds: true, ' +
                 '    sounds: { ' +
                 '         ' + pType + ': "' + cDir + '/' + pType + '/1.mp3", ' +
                 '     } '
     else
        cTemp := cTemp +
                 '    enableSounds: false ' ;

     cTemp := cTemp +
              '   }); ' +
              'toast.transition("' + pTransition + '");' +

              'toast.' + pType + '("' + pMessage + '");' ;

     UniSession.AddJS( cTemp );
end;
// v. 3.0.0.1
function tdm_rc.rc_OpenQuery( pQry: TFDQuery; pSW : boolean ): Boolean;
var
   cMsgErr,
   cMsgSQL : string;
begin
     mm.varC_LastErrorMsg := '';
     pQry.Close;

     Result := false;

     pQry.SQL.Text := RemoveLineBreaks( pQry.SQL.Text );

     //----------[[RESTDATAWARE
//     if not mm.varB_Use_FireDac then
//        mm.varB_OperationProcessed := rc_ConnectRestDATAWARE(  mm.RESTDataBase , mm.CONFIG_DATABASE_HOST_IP_RDW , mm.CONFIG_DATABASE_USERNAME_RDW , mm.CONFIG_DATABASE_PASSWORD_RDW , '' , '' , mm.CONFIG_DATABASE_PORT_RDW )
//     else
     //----------RESTDATAWARE]]
     mm.varB_OperationProcessed := rc_ConnectFireDAC( mm.CONFIG_DATABASE_FIREDAC , mm.SQLConn, pSW );

     if mm.varB_OperationProcessed then
     begin
        try
           pQry.Open();

           // não manter as conexões abertas
           //
           // mm.SQLConn.Offline;

           Result := true;
        except on e:exception do
               begin
                    if UniApplication.FindComponent('MainForm' ) <> nil then
                       MainForm.HideMask;

                    if Pos( 'operation aborted', lowercase( e.Message ) ) = 0 then
                    begin
                       mm.varC_LastErrorMsg := e.Message;

                       // declare a variavel no topo da função
                       cMsgSQL := '';
                       {$IFDEF DEBUG}
                       cMsgSQL := '<br>Query: ' + pQry.SQL.Text;
                       {$ENDIF}

                       cMsgErr := 'Failed to open table !<br><strong>Table</strong>: ' + pQry.Name + '<br><br>' +
                                  ' <strong>Error</strong>: ' + mm.varC_LastErrorMsg ;

                       mm.varC_LastErrorMsg := cMsgErr + cMsgSQL;
                       rc_ShowError( mm.varC_LastErrorMsg );
                    end
                    else
                    begin
                       mm.varC_LastErrorMsg := e.Message;
                       rc_ShowSweetAlert( 'Open Query' , mm.varC_LastErrorMsg, 'error' );
                    end;
                    UniSession.Log( '>>> rc_OpenQuery( sql ):' + cMsgSQL );
                    UniSession.Log( '>>> rc_OpenQuery( err ):' + cMsgErr  );
                    // v. 3.3.0.1
                    if mm.varB_LoginProcessed then Abort;
               end;
        end;
     end;
end;
// v. 3.0.0.0
function tdm_rc.rc_GetMD5(const pText: string): string;
var
  idmd5 : TIdHashMessageDigest5;
begin
     mm.varC_LastProcFuncError := 'rc_GetMD5';

     idmd5 := TIdHashMessageDigest5.Create;
     try
        result := ( idmd5.HashStringAsHex(pText) );
     finally
            idmd5.Free;
     end;
end;

procedure tdm_rc.rc_NextTour(Sender: TObject; pForm:TObject );
begin
     Inc( mm.varI_GuideTourSeq );
     rc_ShowTour( pForm );
end;

// v. 3.0.0.0
procedure tdm_rc.rc_ShowTour(pForm: TObject );
// v. 3.2.0..7
var
   imgArrow,
   objNext,
   objCurrent : String;

   Inifile : TIniFile;

   imgObjArrow : TUniLabel;

   btnObjTour : TObject;

   pParentComp : TComponent;

   paObjTourTrans, paObjMessage,
   paObjFeatured : TUniContainerPanel;

   iLeft, iTop,
   iLeft_To, iTop_To,
   iOffset_X, iOffset_Y : integer;

   bLastGuide : Boolean;
begin
     // v. 3.2.0..7
     IniFile  := nil;
     iLeft_To := 0;
     iTop_To  := 0;

     try
          try
            IniFile := TiniFile.Create( sm.FilesFolderPath + 'guide-tour' + BACKSLASH + lowercase(TComponent( pForm ).Name) + '.ini');

            objCurrent := 'object' + mm.varI_GuideTourSeq.ToString;
            objCurrent := IniFile.ReadString( objCurrent , 'name', '' );

            objNext := 'object' + intToStr( mm.varI_GuideTourSeq + 1);
            objNext := IniFile.ReadString( objNext , 'name', '' );

            bLastGuide := ( objNext = '' );

            iOffset_X  := IniFile.ReadInteger( 'object' + mm.varI_GuideTourSeq.ToString , 'Offset_x', 0 );
            iOffset_Y  := IniFile.ReadInteger( 'object' + mm.varI_GuideTourSeq.ToString , 'Offset_y', 0 );

            imgArrow  := IniFile.ReadString( 'object' + mm.varI_GuideTourSeq.ToString , 'arrow', '' );

            if TComponent( pForm ).FindComponent( 'labTourTit1' )  <> nil then
               TuniLabel( TComponent( pForm ).FindComponent( 'labTourTit1' ) ).Caption := Utf8ToAnsi( IniFile.ReadString( 'object' + mm.varI_GuideTourSeq.ToString , 'title', '' ) );


            if TComponent( pForm ).FindComponent( 'memoTour' )  <> nil then
            begin
                TUniMemo( TComponent( pForm ).FindComponent( 'memoTour' ) ).Lines.Clear;
                TUniMemo( TComponent( pForm ).FindComponent( 'memoTour' ) ).Color := $002a2a2a;
                TUniMemo( TComponent( pForm ).FindComponent( 'memoTour' ) ).Font.Color := clSilver;
                TUniMemo( TComponent( pForm ).FindComponent( 'memoTour' ) ).Lines.Add( Utf8ToAnsi( IniFile.ReadString( 'object' + mm.varI_GuideTourSeq.ToString , 'text', '' ) ) );
            end;

          finally
            IniFile.Free;
          end;

          if objCurrent <> '' then
          begin
               //aplica uma sombra na mensagem
              if TComponent( pForm ).FindComponent( 'btnPrior' ) <> nil then
              begin
                  UniSession.AddJS( TUniBitBtn( TComponent( pForm ).FindComponent( 'btnPrior' ) ).JsName + '.addCls(''ButtonBlueDark'')')  ;
                  UniSession.AddJS( TUniBitBtn( TComponent( pForm ).FindComponent( 'btnNext' ) ).JsName + '.addCls(''ButtonBlueDark'')')  ;
              end;

              paObjTourTrans       := TUniContainerPanel( TComponent( pForm ).FindComponent( 'paTourTransp' ) );

              if paObjTourTrans <> nil then
              begin
                  paObjTourTrans.Align := alClient;

                  paObjTourTrans.Visible := true;
              end;

              // qual objeto será exibido ?
              btnObjTour := TUniControl( TComponent( pForm ).FindComponent( objCurrent ) );

              if btnObjTour = nil then
              begin
                   rc_ShowError( 'objCurrent:<strong>' + objCurrent + '</strong> not found. Check the file. of config. TOUR' );
              end;

              //tentar pegar o TOP e LEFT do componente
              iLeft := TUniControl( TComponent( pForm ).FindComponent( objCurrent ) ).Left;
              iTop  := TUniControl( TComponent( pForm ).FindComponent( objCurrent ) ).Top;


              pParentComp := TUniControl( TComponent( pForm ).FindComponent( objCurrent ) );
              if pParentComp <> nil then
                 if pParentComp.HasParent then
                    pParentComp := pParentComp.GetParentComponent
                 else
                    pParentComp := nil;
              repeat
                  if pParentComp <> NIL then
                  begin
                     iLeft := iLeft + TUniControl( pParentComp ).Left;
                     iTop  := iTop  + TUniControl( pParentComp ).Top;

                     pParentComp := TUniControl( pParentComp ).GetParentComponent;
                  end;
              until ( pParentComp = nil ) or not ( TUniControl( TComponent( pForm ).FindComponent( objCurrent ) ).HasParent );

              //destacar o objeto que será alvo de explicacao
              paObjFeatured := TUniContainerPanel( TComponent( pForm ).FindComponent( 'paObjFeatured' ) );

              if paObjFeatured <> nil then
              begin
                  paObjFeatured.Align  := alNone;
                  paObjFeatured.Top    := iTop;
                  paObjFeatured.Left   := iLeft;
                  paObjFeatured.Width  := TUniControl( TComponent( pForm ).FindComponent( objCurrent ) ).Width;
                  paObjFeatured.Height := TUniControl( TComponent( pForm ).FindComponent( objCurrent ) ).Height;
              end;
              //posicionar a mensagem
              paObjMessage := TUniContainerPanel( TComponent( pForm ).FindComponent( 'paMessage' ) );

              if paObjMessage <> nil then
              begin
                 paObjMessage.SetFocus;
                  //aplica uma sombra na mensagem
                  UniSession.AddJS( paObjMessage.JsName + '.addCls(''shadow-obj-tour'')')  ;
              end;

              //seta
              imgObjArrow := TUniLabel( TComponent( pForm ).FindComponent( 'labImg' + imgArrow ) );

              if imgObjArrow <> nil then
              begin
                  imgObjArrow.Visible := True;

                  if imgArrow = 'up' then
                  begin
                     //fica acima do paObjMensagem
                     iTop_To  := iTop + TUniControl( TComponent( pForm ).FindComponent( objCurrent ) ).Height - iOffset_Y ;
                     iLeft_To := iLeft + iOffset_X;
                  end
                  else
                  if imgArrow = 'down' then
                  begin
                     //fica abaixo do paObjMensagem
                     iTop_To  := iTop + iOffset_Y;
                     iLeft_To := iLeft + iOffset_X;
                  end
                  else
                  if imgArrow = 'left' then
                  begin
                     //fica do lado esquerdo do objeto( com excecao se estourar os limites da tela
                     iTop_To  := iTop + iOffset_Y;
                     iLeft_To := iLeft + TUniControl( TComponent( pForm ).FindComponent( objCurrent ) ).Width - iOffset_X - 20;
                  end
                  else
                  if imgArrow = 'right' then
                  begin
                     //fica abaixo do paObjMensagem
                     iTop_To  := iTop + iOffset_Y;
                     iLeft_To := iLeft - TUniControl( TComponent( pForm ).FindComponent( objCurrent ) ).Width + iOffset_X;
                  end;

                  imgObjArrow.Top     := iTop_To  ;
                  imgObjArrow.Left    := iLeft_To ;

                  //posicionar a mensagem
                  iTop  := imgObjArrow.Top ;
                  iLeft := imgObjArrow.Left ;

                  if imgArrow = 'up' then
                  begin
                     //fica acima do paObjMensagem
                     iTop_To  := iTop + imgObjArrow.Height - 5;
                     iLeft_To := iLeft;
                  end
                  else
                  if imgArrow = 'down' then
                  begin
                     //fica acima do paObjMensagem
                     iTop_To  := iTop - paObjMessage.Height ;
                     iLeft_To := iLeft;
                  end
                  else
                  if imgArrow = 'left' then
                  begin
                     //fica acima do paObjMensagem
                     iTop_To  := iTop ;
                     iLeft_To := iLeft + imgObjArrow.Width - 5;
                  end
                  else
                  if imgArrow = 'right' then
                  begin
                     //fica acima do paObjMensagem
                     iTop_To  := iTop ;
                     iLeft_To := iLeft - imgObjArrow.Width;
                  end;

                  if ( iLeft_To + paObjMessage.width ) > mm.varI_ScreenWidth then
                     iLeft_To := mm.varI_ScreenWidth - paObjMessage.width - 10;

                  if ( iTop_To + paObjMessage.Height ) > mm.varI_ScreenHeight then
                     iTop_To := mm.varI_ScreenHeight - paObjMessage.Height - 10;

                  UniSession.AddJS( paObjMessage.JSName +
                                    '.animate({ duration: ' + inttostr( 400 ) +
                                    ', to: {      x:' + inttostr( iLeft_To  ) +
                                    ',            y:' + inttostr( iTop_To  ) +
                                    ',      opacity: ' + inttostr( 1  ) + ' } } );');
              end;
          end
          else
          begin
              paObjTourTrans := TUniContainerPanel( TComponent( pForm ).FindComponent( 'paTourTransp' ) );

              if paObjTourTrans <> nil then
              begin
                  paObjTourTrans.Align   := alClient;
                  paObjTourTrans.Visible := false;
              end;
          end;
     except on e:exception do
            begin
                 dm_rc.rc_ShowSweetAlert( mm.MSG_ERROR, 'rc_ShowTour Failed !', 'error' );
            end;
     end;
end;
// v. 3.4.0.0
function tdm_rc.rc_PermissionVerify( pFormName, pCaption: String; pPos: Integer ; pAdm : boolean ; pShowMessage : boolean  ): Boolean;
var
   bSecundary : Boolean;
   iPos : integer;
   cUserID,
   cMessage : String;

   function HasAcess( pUser, pPermissionMsg : String; pPos : integer; pShowMessage : boolean  ) : Boolean;
   begin
         cMessage := pPermissionMsg;
         iPos     := pPos;
         // para cada tabela tem que criar o campo equivalente em RESTRICOES
         //
         // se nao achou o campo, libera o acesso total
         //
         // a criptografia usa 3 chaves pra ser gerada, entao nao adianta abrir o BD e copiar
         // um CAMPO de restricao pra outro
         //
         if mm.varC_User_Permissions = '' then
         begin
            mm.varC_User_Permissions := Replicate( '1' , 50 );
            mm.varC_User_Permissions := Crypta( mm.varC_User_Permissions, pUser + pCaption  );
            //
            // criptografia PADRÃO para acesso a USUÁRIOS pelo CODIUSER 1
            //
            // 090B49094FE161FB42007C9CA6A5B987CD90A5B9B8A9BE8C8DCCCE31173B192B2E36084A3656EC6CF2490F2E3B0366D76DFD1F
         end;

         Result := True;

         mm.varC_User_Permissions := DeCrypta( mm.varC_User_Permissions, pUser + pCaption );

         if ( Pos( ',', mm.varC_User_Permissions ) > 0 ) or
            ( Pos( '*', mm.varC_User_Permissions ) > 0 ) or
            ( Pos( '.', mm.varC_User_Permissions ) > 0 ) or
            ( Pos( 'e', mm.varC_User_Permissions ) > 0 ) then
            rc_ShowSweetAlert( mm.MSG_INFO, 'something it´s wrong with mm.varC_User_Permissions data!( ' + pUser + pCaption + ')'  , 'warning' ); // v. 3.3.1.0

         Result := True;

         iPos := pPos;

         If ( ( cMessage = mm.MSG_ACCESS_MOVE_TO ) and ( Copy( mm.varC_User_Permissions, iPos , 1 ) = '1' ) ) then
         begin
              if pFormName <> '' then
              begin
                 if ( cMessage = mm.MSG_ACCESS_MOVE_TO ) and ( pShowMessage ) then
                    rc_ShowSweetAlert( mm.MSG_INFO, mm.MSG_USER_DO_NOT_HAVE_ACCESS + AnsiUpperCase( cMessage ) + AnsiUpperCase( pFormName ) + '( apenas FRACIONAMENTO ) !' , 'warning' ); // v. 3.3.1.0
              end;

              Result := False;
         end
         else
         If ( cMessage <> mm.MSG_ACCESS_MOVE_TO ) and ( Copy( mm.varC_User_Permissions, iPos , 1 ) <> '1' ) then
         begin
              //                                        +-> opção criada a pedido do RAI DUARTE( grupo RadCORE )
         //                                            |
              if ( pFormName <> '' ) and ( pFormName <> 'showMenuOption' ) and ( pShowMessage ) then
              begin
                  rc_ShowSweetAlert( mm.MSG_INFO, mm.MSG_USER_DO_NOT_HAVE_ACCESS + AnsiUpperCase( cMessage ) + AnsiUpperCase( pFormName ) + ' !' , 'warning' ); // v. 3.3.1.0
              end;

              Result := False;
         end;

         if cMessage = mm.MSG_ACCESS_MOVE_TO then
         begin
              If Copy( mm.varC_User_Permissions, iPos , 1 ) = '1' then
              begin
                 Result := False;
              end;
         end
         else
         begin
              If Copy( mm.varC_User_Permissions, iPos , 1 ) <> '1' then
              begin
                 Result := False;
              end;
         end;
   end;
begin
       
       pAdm := dm_rc.memUsers.FieldByName('master').AsString = mm.VALUE_YES;

       pCaption := LowerCase( pCaption );
       iPos     := pPos;

       cMessage := pFormName;
       if Pos( '<span>', cMessage ) > 0 then
       begin
          cMessage := Copy( cMessage, Pos( '<span>', cMessage ) + 6 );
          cMessage := Trim( Copy( cMessage, 1, Pos( '<', cMessage ) -1 ) );
          pFormName := cMessage;
       end;

       bSecundary := ( Copy( pFormName , 1, 2 ) = '.2.' );

       if Copy( pFormName , 1, 2 ) = '.2.' then
          pFormName   := Copy( pFormName , 3, 50 );

         //opcoes gerais
         cMessage := 'a ';
         // v. 3.2.0.7
         if ( Copy( uppercase( pCaption ), 1, 6 ) <> 'REPORT' ) and
            ( uppercase( pCaption ) <> 'RELATORIOS' )  and
            ( uppercase( pCaption ) <> 'MENUS' )  and
            ( uppercase( pCaption ) <> 'ACERTO_ESTOQUE' ) then //PQ ACERTO NAO TEM ALTERACAO, AI QUEBRA A REGRA
         begin
             Case iPos of
                  1 : cMessage := mm.MSG_ACCESS_TO;
                  2 : cMessage := mm.MSG_ACCESS_INSERT_TO;
                  3 : cMessage := mm.MSG_ACCESS_EDIT_TO;
                  4 : cMessage := mm.MSG_ACCESS_DELETE_TO;
                  //5 : cMessage := mm.MSG_ACCESS_SEARCH_TO; // v. 4.0.0.0
             end;
         end;

         if ( ( uppercase( pCaption ) = 'VENDAS' ) ) and
            ( iPos > 5 ) then
         begin
             //opcoes extras
             Case iPos of
                   6 : cMessage := 'a EXCLUSÃO DE PRODUTOS ';
                   7 : cMessage := 'a FECHAMENTO DE ';
                   9 : cMessage := 'a ALTERAÇÃO DE PREÇOS EM ';
                  10 : cMessage := 'a DESCONTO EM ';
                  12 : cMessage := 'a LIBERAR DESCONTO EM ';
                  19 : cMessage := 'a ALTERAR ESTÁGIOS EM ';
                  20 : cMessage := 'a RESEQUENCIALIZAR EM ';
                  21 : cMessage := 'a SUSPENDER/LIBERAR EM ';
                  22 : cMessage := 'a MARCAR COMISSÃO PAGA EM ';
                  23 : cMessage := 'a ALTERAR FUNCIONÁRIO EM ';
             end;
         end
         else
         if ( uppercase( pCaption ) = 'ACERTO_ESTOQUE' ) then
         begin
             //opcoes extras
             Case iPos of
                   1 : cMessage := mm.MSG_ACCESS_TO;
                   2 : cMessage := mm.MSG_ACCESS_INSERT_TO;
                   3 : cMessage := mm.MSG_ACCESS_DELETE_TO;
                   4 : cMessage := 'a SAÍDA EM ';
                   //5 : cMessage := 'a SAÍDA EM ';
                   6 : cMessage := 'a ENTRADA EM ';
                   7 : cMessage := mm.MSG_ACCESS_MOVE_TO;
             end;
         end;

         // critica será de LOGIN principal ou secundario ?
         //
         // Login secundario é quando uma acao requer acesso SUPERIOR, entao o Form LOGIN_SECUNDARIO
         // é acionado.
         mm.varC_User_Permissions  := '';
         if not bSecundary then
         begin
              if memUsersPermissions.FieldList.IndexOf ( pCaption ) >= 0 then
                 mm.varC_User_Permissions  := memUsersPermissions.FieldByName( pCaption ).AsString;

              cUserID := memUsers.fieldbyname('codigo').AsString;
         end
         else
         begin
              if memUsersPermissionsSecondary.FieldList.IndexOf ( pCaption ) >= 0 then
                 mm.varC_User_Permissions  := memUsersPermissionsSecondary.FieldByName( pCaption ).AsString;

              cUserID := memUsersPermissionsSecondary.FieldByName( 'codiuser' ).AsString;
         end;
         // v. 3.4.0.0
         Result := pAdm;
         if not Result then
            Result := HasAcess( cUserID, cMessage, iPos, pShowMessage );
         // só pede acesso superior quando for o caso         +-> opção criada a pedido do RAI DUARTE( grupo RadCORE )
         //                                                  |
         if ( not Result ) and ( not pAdm ) and ( pFormName <> 'showMenuOption' ) and ( pShowMessage )  then // v. 3.4.0.0
         begin
              rc_ShowInputBox( mm.MSG_USER_SUPERIOR_PERMISSION , mm.MSG_USER, '', mm.MSG_USER_RELEASE_PASSWORD, '', True );

              // é email, pra prevenir erro de digitacao( maiuscula )
              mm.varC_InputBox_Result1 := lowercase( mm.varC_InputBox_Result1 );

              Result := ( rc_GetMD5( mm.varC_InputBox_Result2 ) = mm.varC_UserPassAdmin );

              if ( not Result ) and ( mm.varC_InputBox_Result1 <> '' ) then
              begin
                   mm.varC_User_Permissions := '';

                   //Verifica RESTRICAO
                   memUsersSecondary .Close;
                   memUsersSecondary .Data := rc_GetRecord( mm.varB_Use_FireDac ,
                                                            false,
                                                            ' select codigo,nome,email,senha ' + // v. 3.2.0.0
                                                            ' from usuarios ' +
                                                            ' where email = ' + QuotedStr( Trim( mm.varC_InputBox_Result1 )) +
                                                            varIIF( dm_rc.memUsers.FieldByName('master').AsString <> mm.VALUE_YES,
                                                                    ' and codiemp = ' + IntToStr( mm.varI_Code_Company ), '' ) );
                   if mm.varC_LastErrorMsg <> '' then
                   begin
                       rc_ShowSweetAlert( mm.MSG_ERROR, mm.varC_LastErrorMsg, 'warning' ); // v. 3.3.1.0
                       Exit;
                   end
                   else
                   begin
                       Result := True;

                       if ( mm.varC_InputBox_Result1 = '' ) or ( memUsersSecondary.FieldByName('email').AsString <> Trim( ( mm.varC_InputBox_Result1 ) )) then
                       begin
                             mm.varC_LastErrorMsg := mm.MSG_INVALID_USER;

                             rc_ShowSweetAlert( mm.MSG_INFO, mm.varC_LastErrorMsg, 'warning' ); // v. 3.3.1.0

                             Result := False;

                             Exit;
                       end;
                   end;

                   if Result then
                   begin
                       Result := False;

                       // dm_lkp.zQryLkpRestricao_principal ficará aberta durante TODO o projeto
                       // para evitar o select CONSTANTE na funcao de VERIFICACAO DE RESTRICAO
                       memUsersPermissionsSecondary.Close;
                       memUsersPermissionsSecondary.Data := rc_GetRecord( mm.varB_Use_FireDac ,
                                                                      false,
                                                                      ' select * ' +
                                                                      ' from usuarios_restricoes ' +
                                                                      ' where codiuser = ' + memUsersSecondary .FieldByName('codigo').AsString );

                       if mm.varC_LastErrorMsg <> '' then
                       begin
                           rc_ShowSweetAlert( mm.MSG_ERROR, mm.varC_LastErrorMsg, 'warning' ); // v. 3.3.1.0
                           Exit;
                       end;

                       if memUsersPermissionsSecondary.FieldList.IndexOf ( pCaption ) >= 0 then
                          mm.varC_User_Permissions  := memUsersPermissionsSecondary.FieldByName( pCaption ).AsString;

                       cUserID := memUsersPermissionsSecondary.FieldByName( 'codiuser' ).AsString;

                       If rc_GetMD5( memUsersSecondary.FieldByName( 'nome' ).AsString + mm.varC_InputBox_Result2 ) = ( memUsersSecondary.FieldByName( 'senha' ).AsString ) then
                          Result := HasAcess( cUserID, '', 0, pShowMessage )
                       else
                          Result := HasAcess( '-999', '' , 0, pShowMessage );
                   end;
              end;
         end;
end;
// visible on / off lookup controls
procedure tdm_rc.rc_LookUpControlsVisible(pFrame: TObject;
  pLkp: TUniControl; pState: Boolean);
var
   LkpDBCod,
   LkpDBPesqExtra,
   LkpDBEdit : TUniDBEdit;

   LkpBtn : TUniSpeedButton;
begin
     LkpDBEdit      := TUniDBEdit( TComponent( pFrame ).FindComponent( pLkp.Name ) );
     LkpDBCod       := TUniDBEdit( TComponent( pFrame ).FindComponent( pLkp.Name + '_CodID' )  );
     LkpDBPesqExtra := TUniDBEdit( TComponent( pFrame ).FindComponent( pLkp.Name + '_PesqExtra' ) );
     LkpBtn         := TUniSpeedButton( TComponent( pFrame ).FindComponent( StringReplace( lowercase( pLkp.Name ) , 'edlkp' , 'btnlkp' , [rfReplaceAll] ) ) );

     if LkpDBEdit <> nil then
        LkpDBEdit.Visible := pState;

     if LkpDBCod <> nil then
        LkpDBCod.Visible := pState;

     if LkpDBPesqExtra <> nil then
        LkpDBPesqExtra.Visible := pState;

     if LkpBtn <> nil then
        LkpBtn.Visible := pState;
end;
// v. 3.0.0.0
// enabled on / off lookup controls
procedure tdm_rc.rc_LookUpControlsEnabled( pFrame: TObject; pLkp : TUniControl; pState: Boolean);
var
   LkpDBCod,
   LkpDBPesqExtra,
   LkpDBEdit : TUniDBEdit;

   LkpBtn, LkpBtnAdd : TUniSpeedButton;
begin
     LkpDBEdit      := TUniDBEdit( TComponent( pFrame ).FindComponent( pLkp.Name ) );
     LkpDBCod       := TUniDBEdit( TComponent( pFrame ).FindComponent( pLkp.Name + '_CodID' )  );
     LkpDBPesqExtra := TUniDBEdit( TComponent( pFrame ).FindComponent( pLkp.Name + '_PesqExtra' ) );
     LkpBtn         := TUniSpeedButton( TComponent( pFrame ).FindComponent( StringReplace( lowercase( pLkp.Name ) , 'edlkp' , 'btnlkp' , [rfReplaceAll] ) ) );
     LkpBtnAdd      := TUniSpeedButton( TComponent( pFrame ).FindComponent( StringReplace( lowercase( pLkp.Name ) , 'edlkp' , 'btnlkpAdd' , [rfReplaceAll] ) ) );

     if LkpDBEdit <> nil then
        LkpDBEdit.Enabled := pState;

     if LkpDBCod <> nil then
        LkpDBCod.Enabled := pState;

     if LkpDBPesqExtra <> nil then
        LkpDBPesqExtra.Enabled := pState;

     if LkpBtn <> nil then
        LkpBtn.Enabled := pState;

     if LkpBtnAdd <> nil then
        LkpBtnAdd.Enabled := pState;
end;
// v. 3.3.3.1
// clear lookup controls
procedure tdm_rc.rc_LookUpControlsClear( pFrame: TObject; pLkp : TUniControl);
var
   LkpDBCod,
   LkpDBPesqExtra,
   LkpDBEdit : TUniDBEdit;

   LkpBtn, LkpBtnAdd : TUniSpeedButton;
begin
     LkpDBEdit      := TUniDBEdit( TComponent( pFrame ).FindComponent( pLkp.Name ) );
     LkpDBCod       := TUniDBEdit( TComponent( pFrame ).FindComponent( pLkp.Name + '_CodID' )  );
     LkpDBPesqExtra := TUniDBEdit( TComponent( pFrame ).FindComponent( pLkp.Name + '_PesqExtra' ) );
     LkpBtn         := TUniSpeedButton( TComponent( pFrame ).FindComponent( StringReplace( lowercase( pLkp.Name ) , 'edlkp' , 'btnlkp' , [rfReplaceAll] ) ) );
     LkpBtnAdd      := TUniSpeedButton( TComponent( pFrame ).FindComponent( StringReplace( lowercase( pLkp.Name ) , 'edlkp' , 'btnlkpAdd' , [rfReplaceAll] ) ) );

     if LkpDBEdit <> nil then
        LkpDBEdit.Clear;

     if LkpDBCod <> nil then
        LkpDBCod.Clear;

     if LkpDBPesqExtra <> nil then
        LkpDBPesqExtra.Clear;
end;

procedure tdm_rc.rc_LookUpClickButton( pFrame: TObject; pEdit: string);
// v. 3.2.0..7
var
   sTemp : string;
   pDBEdit : TUniDBEdit;

   LkpName,
   LkpName_DataField_CodID : string;

   iPos : integer;
begin
  // associar o Button de pesquisa ( saber se veio de lkp_COD ou lkp_PesqEXTRA
  sTemp := LowerCase( pEdit ) ;
  sTemp := Copy( sTemp, 6, 50 );

  // Tem CODID dinamico ?
  iPos := 0;
  if Pos( '_codid' , sTemp ) > 0 then
     iPos      := Pos ( '__' , sTemp );

  LkpName_DataField_CodID := '';
  LkpName   := '';
  if iPos > 0 then
  begin
     LkpName_DataField_CodID := Copy( sTemp, iPos + 2 , 50 );
     LkpName   := Copy( sTemp, 6, iPos - 1 );
     LkpName   := StringReplace( sTemp , '_codid' , '' , [rfReplaceAll] );
     sTemp     := Copy( LkpName, 6, 50 );
  end;

  pDBEdit := TUniDBEdit( TComponent( pFrame ).FindComponent( 'edlkp' + sTemp ) );
  if pDBEdit <> nil then
  begin
       if pDBEdit.Text <> '' then
       begin
          if Pos( '_pesqextra', sTemp ) > 0 then
             sTemp := StringReplace( sTemp, '_pesqextra' , '' , [rfReplaceAll] )
          else
          if Pos( '_codid', sTemp ) > 0 then
             sTemp := StringReplace( sTemp, '_codid' , '' , [rfReplaceAll] );

          if TUniSpeedButton( TComponent( pFrame ).FindComponent( 'btnLkp' + sTemp ) ) = nil then
             rc_ShowError( format( '<h2> Search LookUp Button Failed! </h2> <br>' +
                                   '<strong> MESSAGE </strong> <br> <hr>' + '<strong> btnLkp: </strong>' + '%s' + 'not declared!' + '<br> <br>' +
                                   '<strong> TIP </strong> <br> <hr> Button with non-standard nomenclature.' + '<br> <br>' +
                                   mm.MSG_CONTACT_SUPPORT, [ sTemp , 'edlkp' + sTemp ] ) )
          else
          begin
             // indica q é uma pesquisa DIGITADA
             //
             // a diferença é que CASO o resultado seja apenas 1 registro, não será exibido o LOOKUP PADRAO
             TUniSpeedButton( TComponent( pFrame ).FindComponent( 'btnLkp' + sTemp ) ).Tag := 1;
             TUniSpeedButton( TComponent( pFrame ).FindComponent( 'btnLkp' + sTemp ) ).Click;
          end;
       end;
  end;
end;
// v. 4.0.0.0
function tdm_rc.rc_LookUpSearch( pFrame : TObject ; pLkpbtnLkp: String ; pSender : TObject; pLookUpGridAttr : string ) : Boolean;
// v. 3.2.0..7
var
   LkpDBCod,
   LkpDBPesqExtra,
   LkpDBEdit : TUniDBEdit;
   pDSDetail : TDataSource;
   // v. 4.0.0.0
   pDM : TDataModule;

   pSQLDetail,
   pSQLMaster,
   LkpQuery : TFDQuery;

   sExtraSearchField,
   sExtraReturnField,
   cTemp,
   sTemp,
   sSearchFields,
   LkpJoinTable,
   LkpJoinField,

   LkpTable : string;

   bIsExtraSearch : boolean;

   iPos,
   iTag : integer;
begin
  inherited;
  // v. 3.2.0..7
  Result         := true;
  pSQLMaster     := nil;
  bIsExtraSearch := false;
  // configure your settings
  case mm.varLT_Lang of
       ltpt_BR : begin
                   cMSG_SEARCH_RECORD := 'Pesquisa de Registros';
                 end;
       lten_US, lten_GB: begin
                  cMSG_SEARCH_RECORD := 'Record Search';
                end;
       ltes_ES: begin
                  cMSG_SEARCH_RECORD := 'Búsqueda de registros';
                end;
       ltfr_FR: begin
                  cMSG_SEARCH_RECORD := 'Recherche d''enregistrement';
                end;
       ltde_DE: begin
                  cMSG_SEARCH_RECORD := 'Datensatzsuche';
                end;
       ltit_IT: begin
                  cMSG_SEARCH_RECORD := 'Ricerca record';
                end;
       lttr_TR : begin
                  cMSG_SEARCH_RECORD := 'Kayıt Arama';
                end;
       ltru_RU : begin
                  cMSG_SEARCH_RECORD := 'Поиск записи';
                end;
      ltzn_CH : begin
                   cMSG_SEARCH_RECORD := 'Record Search';
                end;
      ltin_ID : begin
                  cMSG_SEARCH_RECORD := 'Record Search';
                end;
      ltth_TH : begin
                   cMSG_SEARCH_RECORD := 'Record Search';
                end;
      lthi_IN : begin
                   cMSG_SEARCH_RECORD := 'Record Search';
                end;
      ltar_SA : begin // v. 3.3.0.0
                cMSG_SEARCH_RECORD := 'سجل البحث';
                end;
  end;
  // nomenclatura padrao para capturar os dados necessários
  // para otimizar a pesquisa lookup
  //
  // Todo lookUp precisa ter um KEYFIELD( padrao CODIGO ) e LISTFIELD( padrao DESCRICAO )
  // uma QUERY e um DATASOURCE pra vincular a PESQUISA
  //
  sTemp  := Copy( pLkpbtnLkp, 7 , 50 );

  //checa se a nomenclatura do botão está no PADRÃO
  if TUniSpeedButton( TComponent( pFrame ).FindComponent( 'btnLkp' + sTemp ) ) = nil then
     rc_ShowError( format( '<h2> Search LookUp Button Failed! </h2> <br>' +
                           '<strong> MESSAGE </strong> <br> <hr>' + '<strong> btnLkp: </strong>' + '%s' + 'not declared!' + '<br> <br>' +
                           '<strong> TIP </strong> <br> <hr> Button with non-standard nomenclature.' + '<br> <br>' +
                           mm.MSG_CONTACT_SUPPORT, [ sTemp , '( ' + pLkpbtnLkp + ' ).' ] ) );

  LkpQuery  := TFDQuery( TComponent( pFrame ).FindComponent( sTemp ) );

  // foi criada dinamicamente ?  ( prefixo "LKP_" )
  if LkpQuery = nil then
     LkpQuery  := TFDQuery( TComponent( pFrame ).FindComponent( 'LKP_' + uppercase(sTemp) ) );

  if LkpQuery = nil then
     rc_ShowError( format( '<h2>LookUps Preparation failed!</h2><br>' +
                           '<strong>MESSAGE</strong><br><hr>' + '<strong>LkpQuery: </strong>' + '%s ' + 'not declared!' + '<br><br>' +
                           '<strong>TIP</strong><br><hr>Query with non-standard nomenclature %s' + '<br><br>' +
                           mm.MSG_CONTACT_SUPPORT, [ sTemp , '( ' + pLkpbtnLkp + ' ).' ] ) );

  // separar o nome da tabela de um possivel COMPLEMENTO[ separado por '_' ]
  // ( mesma tabela sendo acessada por mais de 1 query - ex: plano de contas( desp e receitas )
  if Pos( '__' , LkpQuery.Name ) > 0 then
     LkpTable := Copy( LkpQuery.Name, 1, Pos( '__' , LkpQuery.Name ) -1 )
  else
     LkpTable := LkpQuery.Name;

  if Pos( 'LKP_' , LkpTable ) > 0 then
     LkpTable := Copy( LkpTable , 5, 100 );

  // DESCRICAO(carros|codicarro)__CODIVEICULO!#PLACA
  LkpDBCod  := TUniDBEdit( TComponent( pFrame ).FindComponent( 'edLkp' + sTemp + '_CodID' ) );
  LkpDBEdit := TUniDBEdit( TComponent( pFrame ).FindComponent( 'edLkp' + sTemp ) );

  // Have a Join ?
  LkpJoinTable := '';
  iPos := Pos( '(' , LkpDBEdit.Hint );
  if iPos > 0 then
  begin
      LkpJoinTable := Copy( LkpDBEdit.Hint, iPos, Pos( ')' , LkpDBEdit.Hint ) );
      LkpJoinTable := Copy( LkpJoinTable, 1, Pos( ')' , LkpJoinTable ) );
      LkpJoinField := Copy( LkpJoinTable, Pos( '|' , LkpJoinTable ) + 1 , Pos( ')' , LkpJoinTable ) );
      LkpJoinField := Copy( LkpJoinField, 1 , Pos( ')' , LkpJoinField ) - 1 );
      LkpJoinTable := Copy( LkpJoinTable, 2, Pos( '|' , LkpJoinTable ) - 2 );
  end;

  pDSDetail  := nil;
  pSQLDetail := nil;
  cTemp := LkpDBEdit.Hint;
  if Pos( ' ds:', cTemp ) > 0 then // v. 3.3.1.0
  begin
     cTemp := Trim( StringReplace( cTemp, '[[', '', [rfReplaceAll] ) );
     cTemp := StringReplace( cTemp, ']]', '', [rfReplaceAll] ) + ' ';

     cTemp     := Trim( Copy( cTemp, Pos( ' ds:', cTemp ) + 4, 200 ) ); // v. 3.3.1.0
     // v. 4.0.0.0
     If Pos( '.', cTemp ) > 0 then
     begin
         pDM := nil;
         pDM := rc_FindDataModule( Copy( cTemp, 1, pos( '.', cTemp ) - 1 ) );
         cTemp := Copy( cTemp, pos( '.', cTemp ) + 1 );
     end;
     if pDM <> nil then
        pDSDetail  := TDataSource( pDM.FindComponent( cTemp ) )
     else
        pDSDetail  := TDataSource( TComponent(pFrame).FindComponent( cTemp ) );
     //pDSDetail  := TDataSource( TComponent(pFrame).FindComponent( cTemp ) );
     if pDSDetail <> nil then
     begin
        if pDM <> nil then
           pSQLDetail  := TFDQuery( pDM.FindComponent( pDSDetail.DataSet.Name ) )  //TDataSource( pDM.FindComponent( cTemp ) )
        else
           pSQLDetail  := TFDQuery( TComponent(pFrame).FindComponent( pDSDetail.DataSet.Name ) );
     end;
  end
  else
     pSQLMaster := TFDQuery( TComponent( pFrame ).FindComponent( 'sqlMaster' ) );

  // tem campo de Retorno ? pesquisa extra vinculado ao lookup padrão
  sExtraReturnField := '';

  // v. 4.0.0.0
//  if mm.varC_Search_Fields <> '' then
//  begin
//     sExtraReturnField := Copy( mm.varC_Search_Fields, 1, Pos( ';' , mm.varC_Search_Fields ) - 1 ) + ', ';
//     // get Result Field on Extra Search( # )
//     If Pos( ' #', LkpDBEdit.Hint ) > 0 then
//     begin
//          sExtraReturnField := StringReplace( LkpDBEdit.Hint, '|', '', [rfReplaceAll] );
//          sExtraReturnField := StringReplace( sExtraReturnField, ']]', '', [rfReplaceAll] );
//          sExtraReturnField := Copy( sExtraReturnField, Pos( ' #', LkpDBEdit.Hint ) + 2 ) + ' ';
//          //mm.varC_Temp1 := sExtraReturnField; // remove..is test
//          // remove WIDTH
//          If ReturnNumbers( Copy( sExtraReturnField, 1, 2 ) ) <> '' then
//             sExtraReturnField := Copy( sExtraReturnField, 3 );
//          //mm.varC_Temp1 := sExtraReturnField; // remove..is test
//          If Pos( '=', sExtraReturnField ) > 0 then
//          begin
//              sExtraReturnField := Copy( sExtraReturnField, 1, Pos( '=', sExtraReturnField ) -1 )
//          end
//          else
//          begin
//             sExtraReturnField := Copy( sExtraReturnField, 1, Pos( ' ', sExtraReturnField ) -1 ) ;
//             //mm.varC_Temp1 := sExtraReturnField; // remove..is test
//          end;
//     end;
//  end;
//  sExtraReturnField := Trim( sExtraReturnField );
  //mm.varC_Temp1 := sExtraReturnField; // remove..is test
  // o campo PADRAO pra RETORNO é o primeiro passado na lista do rc_LookUpSearchFilter
  //if mm.varC_Search_Fields <> '' then
  //   sExtraReturnField := Copy( mm.varC_Search_Fields, 1, Pos( ';' , mm.varC_Search_Fields ) - 1 ) + ', ';

  // se nao informou nada pra pesquisar no LOOKUP_PESQEXTRA e teclou ENTER,
  // REMOVE o WHERE pra não ter problemas com a pesquisa, ou seja, é como
  // se tivesse teclado no Button PESQUISA mesmo
  LkpDBPesqExtra := TUniDBEdit( TComponent( pFrame ).FindComponent( 'edLkp' + sTemp + '_PesqExtra' ) );

  if ( LkpDBPesqExtra <> nil ) then
  begin
     sExtraSearchField := lowercasE( LkpDBPesqExtra.DataField );
     // v. 4.0.0.0
     sExtraReturnField := sExtraSearchField;

     if pSQLDetail = nil then
     begin
         // v. 4.0.0.0
         if ( pSQLMaster.FieldByName( sExtraSearchField ).AsString = '' ) then //or
//            ( pSQLMaster.FieldByName( sExtraSearchField ).AsString = '0' ) then
         begin
           // v. 4.0.0.0
           if Pos( '[[pk]]' , mm.varC_WhereExtra ) = 0 then
           begin
               mm.varC_WhereExtra := '';
               pSQLMaster.FieldByName( lkpDBCod.DataField ).AsInteger      := 0;
           end;
           //pSQLMaster.FieldByName( lkpDBCod.DataField ).AsInteger      := 0;

           rc_LookUpUpdateData( pFrame , LkpDBEdit );
           Result := False;
         end;
     end
     else
     begin
         // v. 4.0.0.0
         if ( pSQLDetail.FieldByName( sExtraSearchField ).AsString = '' ) then //or
//            ( pSQLDetail.FieldByName( sExtraSearchField ).AsString = '0' ) then
         begin
           // v. 4.0.0.0
           if Pos( '[[pk]]' , mm.varC_WhereExtra ) = 0 then
           begin
              mm.varC_WhereExtra := '';
              pSQLDetail.FieldByName( lkpDBCod.DataField ).AsInteger      := 0;
           end;
           //pSQLDetail.FieldByName( lkpDBCod.DataField ).AsInteger      := 0;

           rc_LookUpUpdateData( pFrame , LkpDBEdit );
           Result := False;
         end;
     end;
  end
  else
  // v. 4.0.0.0
  begin
     sExtraSearchField := '';
     sExtraReturnField := '';
  end;

  // campo PK PADRÃO de PESQUISA
  mm.varC_Field_PK :=  rc_GetPrimaryKey( lkpTable.ToLower );

  mm.Active_Component := LkpDBEdit;

  // caso deseje resgatar outros campos, basta adiciona-los na query abaixo e
  // associa-los na condição( state ) mais abaixo...
  if mm.varC_Search_Fields <> '' then
  begin
     sSearchFields := 'tab.' + Copy( mm.varC_Search_Fields, 1, Length( mm.varC_Search_Fields ) - 1 );
     sSearchFields := StringReplace( sSearchFields , ';' , ', tab.' , [rfReplaceAll] )  ;
     // v. 4.0.0.0
     sSearchFields := sSearchFields + varIIF( sExtraReturnField <> '', ', tab.' + sExtraReturnField , '' );
     sSearchFields := StringReplace( sSearchFields, ',,', ',', [rfReplaceAll] );
  end
  else
     sSearchFields := varIIF( sExtraReturnField <> '', sExtraReturnField, '' );

  // se adiciona se nao houver JOIN
  if LkpJoinTable = '' then
     if Pos( 'tab.' + lowercase( LkpDBEdit.DataField ), sSearchFields ) = 0 then
        sSearchFields := 'tab.' + lowercase( LkpDBEdit.DataField ) + varIIF( sSearchFields <> '', ', ' , '' ) + sSearchFields;

  if Pos( 'tab.' + mm.varC_Field_PK + ' ', sSearchFields ) = 0 then
     sSearchFields := sSearchFields + varIIF( sSearchFields <> '', ', ' , '' ) + 'tab.' + mm.varC_Field_PK + ' ';

  mm.varC_SQL_Default_LookUps := ' SELECT ' + sSearchFields + ' FROM ' + lkpTable + ' tab';

  if LkpJoinTable <> '' then
  begin
       mm.varC_SQL_Default_LookUps := ' Select ' +

                                      sSearchFields + ', ' +

                                      ' tbJoin.' + lowercase( LkpDBEdit.DataField ) +

                                      ' from ' + LkpTable + ' tab ' +

                                      ' left join ' + LkpJoinTable + ' tbJoin ' +
                                      ' on tbJoin.' + rc_GetPrimaryKey( LkpJoinTable.ToLower ) + ' = tab.' + LkpJoinField ;
  end;

  // remove a vírgula( deixei apenas pra montar o select ACIMA
  sExtraReturnField := trim( StringReplace( sExtraReturnField , ',', '', [rfReplaceAll] ) );
  // v. 3.3.0.3 - thanks FABIO OLIVEIRA
  // o ORDER BY pode ser definido na chamada da função
  // se nao, assume um padrão
  if mm.varC_Order = '' then
     mm.varC_Order := ' Order by ' + varIIF( LkpJoinTable <> '' , 'tbJoin.' , 'tab.' ) + lowercase( LkpDBEdit.DataField )
  else
     mm.varC_Order := ' ' + Trim( mm.varC_Order );

  // pode adicionar vários campos antes da 'PK' que serão usados para pesquisa
  // no form de lookup padrao
  //
  // campos PADRÃO de PESQUISA e RETORNO( ult. campo sempre é a 'PK' )
  // v. 4.0.0.0
  //mm.varC_Search_Fields := ' ' + mm.varC_Search_Fields + lowercase( LkpDBEdit.DataField ) + ';' + mm.varC_Field_PK + ' ';
  if Pos( lowercase( LkpDBEdit.DataField ) + ';' + mm.varC_Field_PK + ' ', mm.varC_Search_Fields ) = 0 then
     mm.varC_Search_Fields := ' ' + mm.varC_Search_Fields + lowercase( LkpDBEdit.DataField ) + ';' + mm.varC_Field_PK + ' ';

  // Essa variavel é preenchida no OnExit do campo EXTRA que se deseja pesquisar
  if Trim( Copy( mm.varC_WhereExtra , Pos( '=' , mm.varC_WhereExtra ) + 1 , 100 ) )  = '' then
     mm.varC_WhereExtra := '';

  // para tratar RETORNO automatico de pesquisa direta
  mm.varC_FrmLookUpTag := TUniSpeedButton( TComponent( pFrame ).FindComponent( 'btnLkp' + sTemp ) ).Tag;

  // pra saber se veio do ONEXIT do _CodID ou do CLICK do BtnLkp
  iTag := TUniSpeedButton( TComponent( pFrame ).FindComponent( 'btnLkp' + sTemp ) ).Tag;
  TUniSpeedButton( TComponent( pFrame ).FindComponent( 'btnLkp' + sTemp ) ).Tag := 0;

  if mm.varC_WhereExtra <> '' then
  begin
     if Pos( '[[pk]]' , mm.varC_WhereExtra ) > 0 then
        mm.varC_WhereExtra := StringReplace( mm.varC_WhereExtra , '[[pk]]', + varIIF( LkpJoinTable <> '' , 'tbJoin.' , 'tab.' ) + mm.varC_Field_PK, [rfReplaceAll] );

     if mm.varC_Where <> '' then
        mm.varC_Where := mm.varC_Where + ' AND ' + mm.varC_WhereExtra
     else
        mm.varC_Where := ' WHERE ' + mm.varC_WhereExtra;

     dm_rc.sqlLookUpSearch.close;
     dm_rc.sqlLookUpSearch.sql.Text := mm.varC_SQL_Default_LookUps + mm.varC_Where + mm.varC_Order;

     mm.varC_Lookup_Code := '';

     if rc_OpenQuery( dm_rc.sqlLookUpSearch ) then
     begin
        // se teclou ESC no LOOKUP, nao atualiza os dados
        if mm.varC_Lookup_Code <> '_ESC_' then
        begin
             mm.varC_Lookup_Code := dm_rc.sqlLookUpSearch.FieldByName( mm.varC_Field_PK ).AsString;
        end;
     end;
  end
  else
  begin
       if ( ( LkpDBCod.Text <> '' ) and ( iTag = 1 ) ) or ( iTag = 0 ) then
       begin
           frmLookUp.Caption := cMSG_SEARCH_RECORD;// + lkpTable;
           // coluna com a PK deve ficar invisivel
           frmLookUp.dbgSearchCRUDLookUp.Tag := 1; // v. 4.0.0.0
           // v. 4.0.0.0
           if pLookUpGridAttr = '' then
              pLookUpGridAttr := '[[fieldmasks:grid-resize|grid-paginator:center(' + LkpDBEdit.Width.ToString + ')|]]'
           else
           if Pos( 'grid-paginator' , pLookUpGridAttr ) = 0 then
              pLookUpGridAttr := StringReplace( pLookUpGridAttr, 'fieldmasks:','fieldmasks:grid-paginator:center(' + LkpDBEdit.Width.ToString + ')|', [rfReplaceAll] );

           frmLookUp.dbgSearchCRUDLookUp.Hint := pLookUpGridAttr; // v. 4.0.0.0

           frmLookUp.ShowModal;
       end;
  end;

  if pSQLDetail = nil then
     rc_UpdateLookUpCalled( pFrame , sTemp , sExtraReturnField , sExtraSearchField , bIsExtraSearch , LkpDBPesqExtra, LkpDBCod, LkpDBEdit , lkpQuery, pSQLMaster , iTag  )
  else
     rc_UpdateLookUpCalled( pFrame , sTemp , sExtraReturnField , sExtraSearchField , bIsExtraSearch , LkpDBPesqExtra, LkpDBCod, LkpDBEdit , lkpQuery, pSQLDetail , iTag  );
end;
// v. 4.0.0.0
function tdm_rc.rc_LookUpSearchLite( pFrame: TObject; pLkpbtnLkp: String ; pSender : TObject; pLookUpGridAttr : string ): Boolean;
// v. 3.2.0..7
var
   LkpDBCod,
   LkpDBPesqExtra,
   LkpDBEdit : TUniDBEdit;

   pDsDetail : TDataSource;
   // v. 4.0.0.0
   pDM : TDataModule;

   pSQLDetail,
   pSQLMaster,
   LkpQuery : TFDQuery;

   sExtraSearchField,
   sExtraReturnField,
   cTemp,
   sTemp,
   cTmp,
   sSearchFields,

   LkpJoinTable,
   LkpJoinField,

   LkpTable : string;

   bIsExtraSearch : boolean;

   iPos,
   iTag : integer;
begin
  inherited;
  // v. 3.2.0..7
  Result := True;
  // nomenclatura padrao para capturar os dados necessários
  // para otimizar a pesquisa lookup
  // Todo lookUp precisa ter um KEYFIELD( padrao CODIGO ) e LISTFIELD( padrao DESCRICAO )
  // uma QUERY e um DATASOURCE pra vincular a PESQUISA
  sTemp     := Copy( pLkpbtnLkp, 7 , 50 );

  mm.varC_Temp1 := Copy( pLkpbtnLkp, 7 , 50 );
  mm.varC_Temp1 := sTemp;

  //checa se a nomenclatura do botão está no PADRÃO
  if TUniSpeedButton( TComponent( pFrame ).FindComponent( 'btnLkp' + sTemp ) ) = nil then
     rc_ShowError( format( '<h2> Search LookUp Button Failed! </h2> <br>' +
                           '<strong> MESSAGE </strong> <br> <hr>' + '<strong> btnLkp: </strong>' + '%s' + 'not declared!' + '<br> <br>' +
                           '<strong> TIP </strong> <br> <hr> Button with non-standard nomenclature.' + '<br> <br>' +
                           mm.MSG_CONTACT_SUPPORT, [ sTemp , '( ' + pLkpbtnLkp + ' ).' ] ) );

  LkpQuery  := TFDQuery( TComponent( pFrame ).FindComponent( sTemp ) );

  // foi criada dinamicamente ?  ( prefixo "LKP_" )
  if LkpQuery = nil then
     LkpQuery  := TFDQuery( TComponent( pFrame ).FindComponent( 'LKP_' + sTemp ) );

  if LkpQuery = nil then
     rc_ShowError( format( '<h2>LookUps Preparation failed!</h2><br>' +
                           '<strong>MESSAGE</strong><br><hr>' + '<strong>LkpQuery: </strong>' + '%s ' + 'not declared!' + '<br><br>' +
                           '<strong>TIP</strong><br><hr>Query with non-standard nomenclature %s' + '<br><br>' +
                           mm.MSG_CONTACT_SUPPORT, [ sTemp , '( ' + pLkpbtnLkp + ' ).' ] ) );

  // separar o nome da tabela de um possivel COMPLEMENTO[ separado por '_' ]
  // ( mesma tabela sendo acessada por mais de 1 query - ex: plano de contas( desp e receitas )
  if Pos( '__' , LkpQuery.Name ) > 0 then
     LkpTable := Copy( LkpQuery.Name, 1, Pos( '__' , LkpQuery.Name ) -1 )
  else
     LkpTable := LkpQuery.Name;

  if Pos( 'LKP_' , LkpTable ) > 0 then
     LkpTable := Copy( LkpTable , 5, 100 );

  LkpDBCod  := TUniDBEdit( TComponent( pFrame ).FindComponent( 'edLkp' + sTemp + '_CodID' ) );
  LkpDBEdit := TUniDBEdit( TComponent( pFrame ).FindComponent( 'edLkp' + sTemp ) );

  // Have a Join ?
  LkpJoinTable := '';
  iPos := Pos( '(' , LkpDBEdit.Hint );
  if iPos > 0 then
  begin
      LkpJoinTable := Copy( LkpDBEdit.Hint, iPos, Pos( ')' , LkpDBEdit.Hint ) );
      LkpJoinTable := Copy( LkpJoinTable, 1, Pos( ')' , LkpJoinTable ) );
      LkpJoinField := Copy( LkpJoinTable, Pos( '|' , LkpJoinTable ) + 1 , Pos( ')' , LkpJoinTable ) );
      LkpJoinField := Copy( LkpJoinField, 1 , Pos( ')' , LkpJoinField ) - 1 );
      LkpJoinTable := Copy( LkpJoinTable, 2, Pos( '|' , LkpJoinTable ) - 2 );
  end;

  pDSDetail  := nil;
  pSQLDetail := nil;
  cTemp := LkpDBEdit.Hint;
  if Pos( ' ds:', cTemp ) > 0 then // v. 3.3.1.0
  begin
     cTemp := Trim( StringReplace( cTemp, '[[', '', [rfReplaceAll] ) );
     cTemp := StringReplace( cTemp, ']]', '', [rfReplaceAll] ) + ' ';

     cTemp     := Trim( Copy( cTemp, Pos( ' ds:', cTemp ) + 4, 200 ) ); // v. 3.3.1.0
     // v. 4.0.0.0
     If Pos( '.', cTemp ) > 0 then
     begin
         pDM := nil;
         pDM := rc_FindDataModule( Copy( cTemp, 1, pos( '.', cTemp ) - 1 ) );
         cTemp := Copy( cTemp, pos( '.', cTemp ) + 1 );
     end;
     if pDM <> nil then
        pDSDetail  := TDataSource( pDM.FindComponent( cTemp ) )
     else
        pDSDetail  := TDataSource( TComponent(pFrame).FindComponent( cTemp ) );
     //pDSDetail  := TDataSource( TComponent(pFrame).FindComponent( cTemp ) );
     if pDSDetail <> nil then
     begin
        if pDM <> nil then
           pSQLDetail  := TFDQuery( pDM.FindComponent( pDSDetail.DataSet.Name ) )
        else
           pSQLDetail  := TFDQuery( TComponent(pFrame).FindComponent( pDSDetail.DataSet.Name ) );
     end;
     //pDSDetail  := TDataSource( TComponent(pFrame).FindComponent( cTemp ) );
     //if pDSDetail <> nil then
     //   pSQLDetail  := TFDQuery( TComponent(pFrame).FindComponent( pDSDetail.DataSet.Name ) );
  end
  else
     pSQLMaster := TFDQuery( TComponent( pFrame ).FindComponent( 'sqlMaster' ) );

  // tem campo de Retorno ? pesquisa extra vinculado ao lookup padrão
  sExtraReturnField := '';
  // v. 4.0.0.0
//  if mm.varC_Search_Fields <> '' then
//  begin
//     sExtraReturnField := Copy( mm.varC_Search_Fields, 1, Pos( ';' , mm.varC_Search_Fields ) - 1 ) + ', ';
//     // get Result Field on Extra Search( # )
//     If Pos( ' #', LkpDBEdit.Hint ) > 0 then
//     begin
//          sExtraReturnField := StringReplace( LkpDBEdit.Hint, '|', '', [rfReplaceAll] );
//          sExtraReturnField := StringReplace( sExtraReturnField, ']]', '', [rfReplaceAll] );
//          sExtraReturnField := Copy( sExtraReturnField, Pos( ' #', LkpDBEdit.Hint ) + 2 ) + ' ';
//          //mm.varC_Temp1 := sExtraReturnField; // remove..is test
//          // remove WIDTH
//          If ReturnNumbers( Copy( sExtraReturnField, 1, 2 ) ) <> '' then
//             sExtraReturnField := Copy( sExtraReturnField, 3 );
//          //mm.varC_Temp1 := sExtraReturnField; // remove..is test
//          If Pos( '=', sExtraReturnField ) > 0 then
//          begin
//              sExtraReturnField := Copy( sExtraReturnField, 1, Pos( '=', sExtraReturnField ) -1 )
//          end
//          else
//          begin
//             sExtraReturnField := Copy( sExtraReturnField, 1, Pos( ' ', sExtraReturnField ) -1 ) ;
//             //mm.varC_Temp1 := sExtraReturnField; // remove..is test
//          end;
//     end;
//  end;
//  sExtraReturnField := Trim( sExtraReturnField );
  //mm.varC_Temp1 := sExtraReturnField; // remove..is test

  // se nao informou nada pra pesquisar no LOOKUP_PESQEXTRA e teclou ENTER,
  // REMOVE o WHERE pra não ter problemas com a pesquisa, ou seja, é como
  // se tivesse teclado no Button PESQUISA mesmo
  LkpDBPesqExtra := TUniDBEdit( TComponent( pFrame ).FindComponent( 'edLkp' + sTemp + '_PesqExtra' ) );


  if ( LkpDBPesqExtra <> nil ) then
  begin
     sExtraSearchField := lowercasE( LkpDBPesqExtra.DataField );
     // v. 4.0.0.0
     sExtraReturnField := sExtraSearchField;

     if pSQLDetail = nil then
     begin
         // v. 4.0.0.0
         if ( pSQLMaster.FieldByName( sExtraSearchField ).AsString = '' ) then //or
//            ( pSQLMaster.FieldByName( sExtraSearchField ).AsString = '0' ) then
         begin
           // v. 4.0.0.0
           if Pos( '[[pk]]' , mm.varC_WhereExtra ) = 0 then
           begin
               mm.varC_WhereExtra := '';
               pSQLMaster.FieldByName( lkpDBCod.DataField ).AsInteger      := 0;
           end;
           //pSQLMaster.FieldByName( lkpDBCod.DataField ).AsInteger      := 0;

           rc_LookUpUpdateData( pFrame , LkpDBEdit );
           Result := False;
         end;
     end
     else
     begin
         // v. 4.0.0.0
         if ( pSQLDetail.FieldByName( sExtraSearchField ).AsString = '' ) then //or
//            ( pSQLDetail.FieldByName( sExtraSearchField ).AsString = '0' ) then
         begin
           // v. 4.0.0.0
           if Pos( '[[pk]]' , mm.varC_WhereExtra ) = 0 then
           begin
               mm.varC_WhereExtra := '';
               pSQLDetail.FieldByName( lkpDBCod.DataField ).AsInteger      := 0;
           end;
           //pSQLDetail.FieldByName( lkpDBCod.DataField ).AsInteger      := 0;

           rc_LookUpUpdateData( pFrame , LkpDBEdit );
           Result := False;
         end;
     end;
  end
  else
  // v. 4.0.0.0
  begin
     sExtraSearchField := '';
     sExtraReturnField := '';
  end;

  // campo PK PADRÃO de PESQUISA
  mm.varC_Field_PK :=  rc_GetPrimaryKey( lkpTable.ToLower );

  mm.Active_Component := LkpDBEdit;

  // v. 4.0.0.0
  if pLookUpGridAttr = '' then
     pLookUpGridAttr := '[[fieldmasks:grid-resize|grid-paginator:center(' + LkpDBEdit.Width.ToString + ')|]]'
  else
  if Pos( 'grid-paginator' , pLookUpGridAttr ) = 0 then
     pLookUpGridAttr := StringReplace( pLookUpGridAttr, 'fieldmasks:','fieldmasks:grid-paginator:center(' + LkpDBEdit.Width.ToString + ')|', [rfReplaceAll] );
  frmLookUp_Lite.dbgSearchCRUDLookUpLite.Hint := pLookUpGridAttr;

  //identificar controle que chamou
  frmLookUp_Lite.ed_PK.text := mm.varC_Field_PK;

  // caso deseje resgatar outros campos, basta adiciona-los na query abaixo e
  // associa-los na condição( state ) mais abaixo...
  if mm.varC_Search_Fields <> '' then
  begin
     sSearchFields := 'tab.' + Copy( mm.varC_Search_Fields, 1, Length( mm.varC_Search_Fields ) - 1 );
     sSearchFields := StringReplace( sSearchFields , ';' , ', tab.' , [rfReplaceAll] )  ;
     // v. 4.0.0.0
     sSearchFields := sSearchFields + varIIF( sExtraReturnField <> '', ', tab.' + sExtraReturnField , '' );
     sSearchFields := StringReplace( sSearchFields, ',,', ',', [rfReplaceAll] );
  end
  else
     sSearchFields := varIIF( sExtraReturnField <> '', sExtraReturnField, '' );
  //mm.varC_Temp2 := sSearchFields; // remove..is test

  // se adiciona se nao houver JOIN
  if LkpJoinTable = '' then
     if Pos( 'tab.' + lowercase( LkpDBEdit.DataField ), sSearchFields ) = 0 then
        sSearchFields := 'tab.' + lowercase( LkpDBEdit.DataField ) + varIIF( sSearchFields <> '', ', ' , '' ) + sSearchFields;

  if Pos( 'tab.' + mm.varC_Field_PK + ' ', sSearchFields ) = 0 then
     sSearchFields := sSearchFields + varIIF( sSearchFields <> '', ', ' , '' ) + 'tab.' + mm.varC_Field_PK + ' ';

  mm.varC_SQL_Default_LookUps := ' SELECT ' + sSearchFields + ' FROM ' + lkpTable + ' tab';

  if LkpJoinTable <> '' then
  begin
       mm.varC_SQL_Default_LookUps := ' Select ' +

                                      sSearchFields + ', ' +

                                      ' tbJoin.' + lowercase( LkpDBEdit.DataField ) +

                                      ' from ' + LkpTable + ' tab ' +

                                      ' left join ' + LkpJoinTable + ' tbJoin ' +
                                      ' on tbJoin.' + rc_GetPrimaryKey( LkpJoinTable.ToLower ) + ' = tab.' + LkpJoinField ;
  end;

  // remove a vírgula( deixei apenas pra montar o select ACIMA
  sExtraReturnField := trim( StringReplace( sExtraReturnField , ',', '', [rfReplaceAll] ) );
  //mm.varC_Temp1 := sExtraReturnField; // remove..is test

  // v. 3.3.0.3 - thanks FABIO OLIVEIRA
  // o ORDER BY pode ser definido na chamada da função
  // se nao, assume um padrão
  if mm.varC_Order = '' then
     mm.varC_Order := ' Order by ' + varIIF( LkpJoinTable <> '' , 'tbJoin.' , 'tab.' ) + lowercase( LkpDBEdit.DataField )
  else
     mm.varC_Order := ' ' + Trim( mm.varC_Order );

  // pode adicionar vários campos antes da 'PK' que serão usados para pesquisa
  // no form de lookup padrao
  //
  // campos PADRÃO de PESQUISA e RETORNO( ult. campo sempre é a 'PK' )
  // v. 4.0.0.0
  //mm.varC_Search_Fields := ' ' + mm.varC_Search_Fields + lowercase( LkpDBEdit.DataField ) + ';' + mm.varC_Field_PK + ' ';
  if Pos( lowercase( LkpDBEdit.DataField ) + ';' + mm.varC_Field_PK + ' ', mm.varC_Search_Fields ) = 0 then
     mm.varC_Search_Fields := ' ' + mm.varC_Search_Fields + lowercase( LkpDBEdit.DataField ) + ';' + mm.varC_Field_PK + ' ';

  // Essa variavel é preenchida no OnExit do campo EXTRA que se deseja pesquisar
  if Trim( Copy( mm.varC_WhereExtra , Pos( '=' , mm.varC_WhereExtra ) + 1 , 100 ) )  = '' then
     mm.varC_WhereExtra := '';

  // v. 4.0.0.0 onlysearch
  frmLookUp_Lite.tag   := TUniSpeedButton( TComponent( pFrame ).FindComponent( 'btnLkp' + sTemp ) ).Tag;
  //frmLookUp_Lite.dbgSearchCRUDLookUpLite.Hint := pLookUpGridAttr; // v. 4.0.0.0

  if mm.varC_WhereExtra <> '' then
  begin
     // v. 4.0.0.2 bugfix #1
     frmLookUp_Lite.tag := 1;

     if Pos( '[[pk]]' , mm.varC_WhereExtra ) > 0 then
        mm.varC_WhereExtra := StringReplace( mm.varC_WhereExtra , '[[pk]]', + varIIF( LkpJoinTable <> '' , 'tbJoin.' , 'tab.' ) + frmLookUp_Lite.ed_PK.text, [rfReplaceAll] );

     if mm.varC_Where <> '' then
        mm.varC_Where := mm.varC_Where + ' AND ' + mm.varC_WhereExtra
     else
        mm.varC_Where := ' WHERE ' + mm.varC_WhereExtra;

     dm_rc.sqlLookUpSearch.close;
     dm_rc.sqlLookUpSearch.sql.Text := mm.varC_SQL_Default_LookUps + mm.varC_Where + mm.varC_Order;

     mm.varC_Lookup_Code := '';

     if rc_OpenQuery( dm_rc.sqlLookUpSearch ) then
     begin
        // se teclou ESC no LOOKUP, nao atualiza os dados
        if mm.varC_Lookup_Code <> '_ESC_' then
        begin
             mm.varC_Lookup_Code := dm_rc.sqlLookUpSearch.FieldByName( mm.varC_Field_PK ).AsString;
             mm.varC_Temp1 := sExtraReturnField; // remove..is test
             if pSQLDetail = nil then
                rc_UpdateLookUpCalled( pFrame , sTemp , sExtraReturnField , sExtraSearchField , bIsExtraSearch , LkpDBPesqExtra, LkpDBCod, LkpDBEdit , lkpQuery, pSQLMaster , iTag  )
             else
                rc_UpdateLookUpCalled( pFrame , sTemp , sExtraReturnField , sExtraSearchField , bIsExtraSearch , LkpDBPesqExtra, LkpDBCod, LkpDBEdit , lkpQuery, pSQLDetail , iTag  );
        end;
     end;
  end
  else
  begin
     // coluna com a PK deve ficar invisivel
     frmLookUp_Lite.dbgSearchCRUDLookUpLite.Tag := 1; // v. 4.0.0.0
     frmLookUp_Lite.dbgSearchCRUDLookUpLite.Hint := pLookUpGridAttr; // v. 4.0.0.0

     frmLookUp_Lite.Show( procedure(Sender: TComponent; Resrrult:Integer)
                            begin
                                 if pSQLDetail = nil then
                                    rc_UpdateLookUpCalled( pFrame , sTemp , sExtraReturnField , sExtraSearchField , bIsExtraSearch , LkpDBPesqExtra, LkpDBCod, LkpDBEdit , lkpQuery, pSQLMaster , iTag  )
                                 else
                                    rc_UpdateLookUpCalled( pFrame , sTemp , sExtraReturnField , sExtraSearchField , bIsExtraSearch , LkpDBPesqExtra, LkpDBCod, LkpDBEdit , lkpQuery, pSQLDetail , iTag  );
                            end
                          );
     Result := True;
  end;
end;
// v. 3.1.0.60
procedure tdm_rc.rc_UpdateDetailField(pErrors : integer; pStatus : string; pQuery: TFDQuery; pField: string; pValue: integer);
begin
  // se ocorreu tudo bem, atualizar RESTRICOES
  //
  if pErrors = 0 then
  begin
     // ajustar o detail...
     if pStatus = 'I' then
     begin
          pQuery.First;
          while not pQuery.Eof do
          begin
               pQuery.Edit;
               pQuery.FieldByName( pField ).AsInteger := pValue;
               pQuery.Post;
               pQuery.next;
          end;
     end;

     mm.varI_ApplyUpdateErrors := pQuery.ApplyUpdates(-1);
     if mm.varI_ApplyUpdateErrors > 0 then
     begin
        dm_rc.rc_ApplyUpdatesError( pQuery, pErrors, mm.MSG_BUGERROR_POST );
        //mm.SQLConn.Rollback;
     end
     else
     begin
       pQuery.CommitUpdates;
       // mm.SQLConn.Commit;
     end;
  end;
end;
// v. 4.0.0.0
procedure tdm_rc.rc_UpdateLookupCalled( pFrame : TObject; pTemp , pExtraResponseField , pExtraSearchField : string; pIsExtraSearch : boolean; LkpDBPesqExtra, LkpDBCod, LkpDBEdit : TUniDBEdit; lkpQuery, pSQLMaster : TFDQuery; iTag : integer ); // v. 3.0.0.0
var
   bOnlySearch : boolean;
begin
  // v. 4.0.0.0 onlysearch
  //TUniSpeedButton( TComponent( pFrame ).FindComponent( 'btnLkp' + pTemp ) ).Tag := 0;

  bOnlySearch := Pos( 'lkponlysearch', LkpDBEdit.Hint ) > 0; // v. 4.0.0.0 onlysearch

  if ( pSQLMaster.State in [ dsEdit, dsInsert ] ) or ( bOnlySearch ) then // v. 4.0.0.0 onlysearch
  begin
     try
        // se teclou ESC no LOOKUP, nao atualiza os dados
        if ( mm.varC_Lookup_Code <> '_ESC_' ) then
        begin
           pIsExtraSearch := false;
           if ( LkpDBPesqExtra <> nil ) then
              pIsExtraSearch := ( LkpDBPesqExtra.Text <> '' ) ;//and ( LkpDBPesqExtra.Text <> '0' ); // v. 4.0.0.0
           // v. 4.0.0.0
           if ( ( ( ( LkpDBCod.Text <> '' ) and ( LkpDBCod.Text <> '0' ) and ( iTag = 1 ) ) or ( iTag = 0 ) ) or
                ( ( ( pIsExtraSearch ) and ( iTag = 1 ) ) or ( iTag = 0 ) ) ) and ( mm.varC_Lookup_Code <> '' ) then
           begin
                // parametro da query, nao é CAMPO é um PARAMETRO
                lkpQuery.ParamByName( 'table_pk' ).AsInteger := StrToIntDef( mm.varC_Lookup_Code , 0 );

                if rc_OpenQuery( lkpQuery ) then
                begin
                   // v. 4.0.0.0 onlysearch
                   if not bOnlySearch then
                      pSQLMaster.FieldByName( lkpDBCod.DataField ).AsInteger := StrToIntDef( mm.varC_Lookup_Code , 0 )
                   else
                      //TUniSpeedButton( TComponent( pFrame ).FindComponent( 'btnLkp' + pTemp ) ).Tag := StrToIntDef( mm.varC_Lookup_Code , -1234567 );
                      LkpDBEdit.Tag := StrToIntDef( mm.varC_Lookup_Code , -1234567 );

                   // campos adicionais que se deseja atribuir no resultado da pesquisa lookup
                   if ( pExtraResponseField <> '' ) and ( pExtraSearchField <> '' ) and ( lkpQuery.ParamByName( 'table_pk' ).AsInteger >= 0 ) then
                      pSQLMaster.FieldByName( LkpDBPesqExtra.DataField ).AsString := dm_rc.sqlLookUpSearch.FieldByName( pExtraResponseField ).AsString;
                end;
           end;
        end;
     finally
        // caso tenha vindo de um edLKP____PesqExtra
        mm.varC_WhereExtra := '';

        if ( mm.varC_Lookup_Code <> '_ESC_' ) and ( StrToIntDef( mm.varC_Lookup_Code , 0 ) = 0 ) and
           ( ( LkpDBCod.Text <> '' ) and ( LkpDBCod.Text <> '0' ) and ( iTag = 1 ) ) then
        begin
           if dm_rc.sqlLookUpSearch.IsEmpty then
              rc_ShowSweetAlert( mm.MSG_INFO, mm.MSG_RECORD_NOT_FOUND, 'warning' ); // v. 3.3.1.0
        end
        else
        begin
            // por o foco no campo que chamou... ( EM TESTES..dando conflitos )
//                if LkpDBPesqExtra <> nil then
//                   rc_SetFocus( LkpDBPesqExtra )
//                else
//                if ( LkpDBCod <> nil ) and ( LkpDBCod.Visible ) then
//                   rc_SetFocus( LkpDBCod );
        end;

        dm_rc.sqlLookUpSearch.Close;

        // atualizar todos os LOOKUPs dinamicamente
        rc_LookUpUpdateData( pFrame, LkpDBEdit );

        dm_rc.rc_SetFocus( LkpDBEdit );
     end;
  end;
end;
// v. 3.3.1.0
procedure tdm_rc.UniSweetAlertConfirm(Sender: TObject);
begin
     if oSweetAlertFocus_Confirm <> nil then
     begin
         rc_SetFocus( oSweetAlertFocus_Confirm );
     end;
end;
// v. 3.3.1.0
procedure tdm_rc.UniSweetAlertDismiss(Sender: TObject; const Reason: TDismissType);
begin
     if oSweetAlertFocus_Dismiss <> nil then
     begin
         rc_SetFocus( oSweetAlertFocus_Dismiss );
     end;
end;
// v. 4.0.0.5
procedure tdm_rc.rc_RenderLookUpControls(pFrame: TObject);
var
   iPos, iTabOrder,
   I, F : integer;
   // identifiers
   // +     @        !      #         *         &         >
   bTableName, bPlus, bSearch, bLite, bExtra, bSearchOFF, bInsEdit, bDetail, bOnlySearch : Boolean; // v. 4.0.0.0
   cTableName, // v. 4.0.0.0
   cFieldConcat, // Ex: NAME+SURNAME

   cDbCodWidth, cDbExtraWidth,

   cTmp, cTmp2, cLkpTblPK, // v. 4.0.0.5
   cTemp, cTemp2, cTemp3, cTemp4, cFields, cSaveTo,

   WhereAnd, sql, consulta,
   pTypeButton : string;

   slLkpSetDS : TStringList;
   LkpSetDS : TObject;
   oHtmlFrm : TUniHTMLFrame; // v. 3.4.0.0
   LkpDBCod,
   LkpDBCodExtra,
   LkpDBEdit : TUniDBEdit;

   LkpBtn,
   LkpBtnAdd : TUniSpeedButton;

   pSQLMaster,
   pSQLDetail,
   LkpQuery : TFDQuery;

   pDSMaster,
   pDSDetail,
   pDSSetDS_Orig,
   LkpDataSource : TDataSource;

   pComponent : TComponent;

   AllPKs, cSql,
   cAllPKExists, cPk,
   LkpName,

   LkpSelectFields,

   LkpName_Query, // query <> sqlMaster
   LkpName_DataField_CodID,
   LkpName_DataField_Extra,
   LkpName_DataField_Extra_Source,

   LkpJoinTable,
   LkpJoinField,

   LkpTable : string;
   // v. 4.0.0.0
   pDM : TDataModule;
begin
    //UniSession.SuspendLayouts;
    // v. 3.2.0..7
    LkpDBCodExtra := nil;
    pDSDetail     := nil;

    pSQLMaster := TFDQuery( TComponent(pFrame).FindComponent( 'sqlMaster' ) );
    pDSMaster  := TDataSource( TComponent(pFrame).FindComponent( 'dsMaster' ) );

    // ajustar as tabelas de lookup de acordo com o nome da query
    for I := 0 to TComponent(pFrame).ComponentCount - 1 do
    begin
       pComponent := TComponent(pFrame).Components[I];

       if ( pComponent is TUniLabel ) Then
       begin
          if mm.CONFIG_LAYOUT_APPLY_FONT_ALL = 'ON' then
             TUniLabel( pComponent ).Font.Name  := mm.CONFIG_LAYOUT_APP_FONT;

          // versao 1530 acima..traz FONTAWESOME 5
          cTemp := TUniLabel( pComponent ).Caption;
       end
       else
       if ( pComponent is TUniListBox ) Then
       begin
          if mm.CONFIG_LAYOUT_APPLY_FONT_ALL = 'ON' then
             TUniListBox( pComponent ).Font.Name  := mm.CONFIG_LAYOUT_APP_FONT;

          TUniListBox( pComponent ).Font.Size  := 10;
       end
       else
       //btnLkp
       if ( pComponent is TUniSpeedButton ) or ( pComponent is TUniBitBtn ) then
       begin
          if ( pComponent is TUniSpeedButton ) then
             cTemp := TUniSpeedButton( pComponent ).Caption
          else
             cTemp := TUniBitBtn( pComponent ).Caption;

          if ( lowercase( Copy( TUniSpeedButton( pComponent ).Name , 1, 6 ) ) = 'btnlkp' ) then
          begin
             TUniSpeedButton( pComponent ).JSInterface.JSCall( 'addCls' , [ 'ButtonThemeCrud' ]);
          end;
       end
       else
       if pComponent is TUniDBEdit then
       begin
          // indicacao que esse uniDbEdit tem mascara...
          cTemp := rc_GetHintProperty( 'mask:', TUniDBEdit( pComponent ).hint ) ;
          if ( TUniDBEdit( pComponent ).InputMask.Mask <> '' ) or ( cTemp <> '' ) then
          begin
               TUniDBEdit( pComponent ).InputMask.Mask := '';
               TUniDBEdit( pComponent ).tag := 9999;
          end;

          // ajustar cores dos campos lkp e adicionar EVENTO dinamico
          if ( lowercase( Copy( TUniDBEdit( pComponent ).Name , 1, 5 ) ) = 'edlkp' ) and
             ( ( Pos( '_setds' , lowercase( TUniDBEdit( pComponent ).Name ) ) = 0 ) and
               ( Pos( '_pesqextra' , lowercase( TUniDBEdit( pComponent ).Name ) ) = 0 ) and
               ( Pos( '_codid' , lowercase( TUniDBEdit( pComponent ).Name ) ) = 0 ) ) then
          begin
             // adicionar evento dinamico caso o usuario esteja usando somente teclado
             // ao teclar algo, aciona a pesquisa lookup vinculada
             //TUniDBEdit( pComponent ).OnKeyPress := DynamicOnKeyPress; // v. 4.0.0.0

             TUniDBEdit( pComponent ).InputType  := 'text';

             // nomenclatura padrao para capturar os dados necessários
             // para otimizar a pesquisa lookup
             //
             // Todo lookUp precisa ter um KEYFIELD( padrao CODIGO ) e LISTFIELD( padrao DESCRICAO )
             // uma QUERY e um DATASOURCE pra vincular a PESQUISA e poderem ser acessiveis para
             // alguma parte do projeto suas respectivas informações
             LkpDBEdit           := TUniDBEdit( pComponent );
             LkpName             := LkpDBEdit.Name;
             cTemp               := LkpDBEdit.DataField;

             if ( Pos( '[[' , LkpDBEdit.Hint ) > 0 ) or ( Pos( '[[ ' , LkpDBEdit.Hint ) > 0 )  then
             begin
                  cTemp := LkpDBEdit.Hint;
             end;

             // DESCRICAO(carros|codicarro)__CODIVEICULO!#PLACA    <- previous version in DATAFIELD property
             // DESCRICAO(carros|codicarro) CODIVEICULO ! #PLACA   <- new version in HINT property
             bOnlySearch         := Pos ( ' lkponlysearch' , cTemp ) > 0 ; // v. 4.0.0.0
             bTableName          := Pos ( ' tbl:' , cTemp ) > 0 ; // v. 4.0.0.0
             bPlus               := Pos ( ' +' , cTemp ) > 0 ;
             bSearch             := Pos ( ' @' , cTemp ) > 0 ;
             bLite               := Pos ( ' !' , cTemp ) > 0 ; // rc_SearchLite
             bExtra              := Pos ( ' #' , cTemp ) > 0 ; // EXTRA search
             bSearchOFF          := Pos ( ' *' , cTemp ) > 0 ; // search OFF
             //bInsEdit            := Pos ( '&' , cTemp ) > 0 ; // state in Insert or Edit ?
             bDetail             := Pos ( ' ds:' , cTemp  ) > 0 ; // query <> sqlMaster( Default ) to use with Detail // v. 3.3.1.0
             // future feature
             LkpSelectFields     := '*';
//             iPos := Pos( '{' , LkpDBEdit.Hint ) ;
//             if iPos > 0 then
//             begin
//                  LkpSelectFields := Copy( LkpDBEdit.Hint, iPos+1, 1000 );
//                  LkpSelectFields := Copy( LkpSelectFields, 1, Pos( '}' , LkpSelectFields )-1 );
//                  //LkpDBEdit.Hint  := StringReplace( LkpDBEdit.Hint, '{'+LkpSelectFields+'}', '', [rfReplaceAll] );
//             end;

             // manter compatibilidade com versão anterior do lookup
             // maintain compatibility with the previous version of the lookup
             if ( Pos( '[[' , LkpDBEdit.Hint ) > 0 ) or ( Pos( '[[ ' , LkpDBEdit.Hint ) > 0 )  then
             begin
                  cTemp := Trim( StringReplace( cTemp, '[[', '', [rfReplaceAll] ) );
                  cTemp := StringReplace( cTemp, ']]', '', [rfReplaceAll] ) + ' ';
                  // v. 4.0.0.0
                  if bTableName then
                  begin
                     cTableName := rc_GetHintProperty( 'tbl:' , cTemp , true, true);
                     cTemp      := StringReplace( cTemp, 'tbl:' + cTableName, '', [rfReplaceAll] );
                  end;
                  // v. 3.2.0.4
                  if Pos( '|', cTemp ) > 0 then
                  begin
                     // tem join ? ( | ).....| valid...
                     cTemp2 := ReverseStr( cTemp );
                     if ( Pos( ')', cTemp2 ) > 0 ) then
                     begin
                        cTmp := Copy( cTemp2, 1, Pos( ')', cTemp2 ) - 1 );
                        if LastPos( '|', cTmp ) > 0 then
                           cTemp := Copy( cTemp, 1, LastPos( '|', cTemp ) - 1 );
                     end
                     else
                       cTemp := Copy( cTemp, 1, Pos( '|', cTemp ) - 1 );
                  end;

                  pDSDetail := nil;
                  if bDetail then
                  begin
                     // v. 3.2.0.4 // issue feedback by FABIO OLIVEIRA
                     cTemp2 := '';
                     begin
                       cTmp   := cTemp;
                       cTemp2 := Trim( Copy( cTemp, Pos( ' ds:', cTemp ) + 4, 200 ) ) + ' ';
                       cTemp2 := Trim( Copy( cTemp2, 1, Pos( ' ', cTemp2 ) ) );
                       cTemp  := StringReplace( cTemp, ' ds:' + cTemp2, '', [rfReplaceAll] )  + ' ds:' + cTemp2 + ' '; // v. 3.3.1.0
                       LkpDBEdit.Hint := '[[' + cTemp + ']]';
                       cTmp   := '';
                     end;

                     cTemp2     := Trim( Copy( cTemp, Pos( ' ds:', cTemp ) + 4, 200 ) ); // v. 3.3.1.0
                     // v. 4.0.0.0
                     If Pos( '.', cTemp2 ) > 0 then
                     begin
                         //for F := 0 to UniApplication.FormRegistered( ) - 1 do
                         pDM := nil;
                         pDM := rc_FindDataModule( Copy( cTemp2, 1, pos( '.', cTemp2 ) - 1 ) );
                         cTemp2 := Copy( cTemp2, pos( '.', cTemp2 ) + 1 );
                     end;
                     if pDM <> nil then
                        pDSDetail  := TDataSource( pDM.FindComponent( cTemp2 ) )
                     else
                        pDSDetail  := TDataSource( TComponent(pFrame).FindComponent( cTemp2 ) );
                  end;

                  LkpDBEdit.DataField := cTemp;

                  cTemp3 := '';
                  if bSearch then
                  begin
                    cTemp3 := Trim( Copy( LkpDBEdit.DataField, Pos( '@', LkpDBEdit.DataField ) , 100 ) );

                    if Pos( ' ', cTemp3) > 0 then
                       cTemp3 := Trim( Copy( cTemp3, 1, Pos( ' ', cTemp3 ) - 1 ) );
                  end;

                  // v. 3.2.0.2 // feedback by JOSAURO
                  cTemp2 := '';
                  if bExtra then
                  begin
                    cTemp2 := Trim( Copy( LkpDBEdit.DataField, Pos( '#', LkpDBEdit.DataField ) , 100 ) ) + ' ';
                    cTemp2 := Trim( Copy( cTemp2, 1, Pos( ' ', cTemp2 ) ) );
                  end;

                  cFieldConcat := '';
                  cTemp := Trim( Copy( cTemp, 1, Pos( ' ', cTemp ) ) );

                  if Pos( '+' , cTemp ) > 0 then
                     cFieldConcat  := Trim( Copy( cTemp, Pos( '+' , cTemp ), 100 ) );

                  cTemp := StringReplace( cTemp, cFieldConcat , '', [rfReplaceAll] );

                  if cFieldConcat <> '' then
                  begin
                     LkpDBEdit.DataField := Trim( StringReplace( LkpDBEdit.DataField, cTemp + cFieldConcat , '', [rfReplaceAll] ) ) + ' ';
                     cFieldConcat        := '||' + Copy( cFieldConcat, 2, 200 );
                  end
                  else
                  begin
                     cTmp := LkpDBEdit.DataField;
                     iPos := Pos( cTemp, cTmp );
                     LkpDBEdit.DataField := Trim( Copy( LkpDBEdit.DataField, iPos + Length( cTemp ), 200 ) ) + ' ' ;
                  end;

                  LkpDBEdit.DataField := Copy( LkpDBEdit.DataField , 1, Pos( ' ', LkpDBEdit.DataField ) - 1 );

                  cTemp := cTemp + cFieldConcat + '__' + LkpDBEdit.DataField + varIIF( bPlus     , '+', '' ) +
                                                                               varIIF( bSearch   , cTemp3, '' ) +
                                                                               varIIF( bLite     , '!', '' ) +
                                                                               varIIF( bSearchOFF, '*', '' ) + cTemp2;
                  LkpDBEdit.DataField := cTemp;
             end;

             cDbCodWidth := '40';
             if bSearch then
             begin
                cDbCodWidth := ReturnNumbers( Copy( cTemp, Pos ( '@' , cTemp ) , 3 ) ) ; // v. 4.0.0.0
                LkpDBEdit.DataField := StringReplace( LkpDBEdit.DataField, '@' + cDbCodWidth , '', [rfReplaceAll] );
             end;

             LkpDBEdit.DataField := StringReplace( LkpDBEdit.DataField, '+', '', [rfReplaceAll] );
             LkpDBEdit.DataField := StringReplace( LkpDBEdit.DataField, '@', '', [rfReplaceAll] );
             LkpDBEdit.DataField := StringReplace( LkpDBEdit.DataField, '!', '', [rfReplaceAll] );
             LkpDBEdit.DataField := StringReplace( LkpDBEdit.DataField, '*', '', [rfReplaceAll] );

//             if bQuery then
//             begin
//                  LkpName_Query := Copy( LkpDBEdit.DataField, Pos( '>' , LkpDBEdit.DataField ) + 1 , 100 );
//                  LkpDBEdit.DataField := StringReplace( LkpDBEdit.DataField, '>' + LkpName_Query, '', [rfReplaceAll] );
//             end;

             LkpName_DataField_Extra := '';

             if bExtra then
             begin
                cDbExtraWidth := '70';

                if bExtra then
                begin
                   // v. 4.0.0.0
                   //cTemp               := Copy( LkpDBEdit.DataField, Pos( '#', LkpDBEdit.DataField ) + 1, 100 );
                   cDbExtraWidth       := ReturnNumbers( Copy( LkpDBEdit.DataField, Pos( '#', LkpDBEdit.DataField ) + 1, 2 ) ) ;
                   //cDbExtraWidth       := ReturnNumbers( Copy( cTemp, 1, 2 ) ) ;
                   LkpDBEdit.DataField := StringReplace( LkpDBEdit.DataField, '#' + cDbExtraWidth , '#', [rfReplaceAll] );
                end;
                LkpName_DataField_Extra        := Copy( LkpDBEdit.DataField , Pos( '#', LkpDBEdit.DataField ) + 1, 100 );
                LkpName_DataField_Extra_Source := Copy( LkpName_DataField_Extra, Pos( '=', LkpName_DataField_Extra ) + 1, 100 );
                LkpName_DataField_Extra        := StringReplace( LkpName_DataField_Extra, '=' + LkpName_DataField_Extra_Source, '', [rfReplaceAll] );
             end;

             if Pos( '=' , LkpDBEdit.DataField ) > 0 then
                LkpDBEdit.DataField := StringReplace( LkpDBEdit.DataField, '#' + LkpName_DataField_Extra + '=' + LkpName_DataField_Extra_Source, '', [rfReplaceAll] )
             else
                LkpDBEdit.DataField := StringReplace( LkpDBEdit.DataField, '#' + LkpName_DataField_Extra , '', [rfReplaceAll] );

             // Have a Join ?
             LkpJoinTable := '';
             iPos := Pos( '(' , LkpDBEdit.DataField );
             if iPos > 0 then
             begin
                 LkpJoinTable        := Copy( LkpDBEdit.DataField, iPos, Pos( ')' , LkpDBEdit.DataField ) );
                 LkpJoinTable        := Copy( LkpJoinTable, 1, Pos( ')' , LkpJoinTable ) );
                 LkpDBEdit.DataField := StringReplace( LkpDBEdit.DataField, LkpJoinTable, '', [rfReplaceAll] );
                 //LkpDBEdit.Hint      := LkpJoinTable; // v. 4.0.0.0
                 LkpJoinField        := Copy( LkpJoinTable, Pos( '|' , LkpJoinTable ) + 1 , Pos( ')' , LkpJoinTable ) );
                 LkpJoinField        := Copy( LkpJoinField, 1 , Pos( ')' , LkpJoinField ) - 1 );
                 LkpJoinTable        := Copy( LkpJoinTable, 2, Pos( '|' , LkpJoinTable ) - 2 );
             end;

             cTemp               := LkpDBEdit.DataField;

             // Criar _CodID dinamico ?
             iPos      := Pos ( '__' , cTemp  );

             LkpName_DataField_CodID := '';
             if iPos > 0 then
             begin
                LkpName_DataField_CodID := Copy( cTemp , iPos + 2 , 50 );

                // tem concatenacao de campos de resultado ?( field1||field2 )
                if Pos( '||' , cTemp ) > 0 then
                   LkpDBEdit.DataField  := Copy ( cTemp , 1, Pos( '||' , cTemp ) - 1 )
                else
                    LkpDBEdit.DataField := Copy ( cTemp , 1, iPos - 1 );  //'NOME+FONE1'
             end;
             // v. 4.0.0.0 onlysearch
             if bOnlySearch then LkpDBEdit.Tag := -1234567;

             LkpDBCod  := TUniDBEdit( TComponent(pFrame).FindComponent( LkpName + '_CodID' ) );
             // se nao encontrou já existente, cria _CodID dinamico...
             if LkpDBCod = nil then
             begin
                  LkpDBCod              := TUniDBEdit.Create( TComponent(pFrame) );
                  LkpDBCod.Parent       := LkpDBEdit.Parent;
                  LkpDBCod.Name         := lowercase( LkpDBEdit.Name ) + '_CodID';
                  // v. 4.0.0.0 onlysearch
                  if not bOnlySearch then
                  begin
                     if pDSDetail = nil then
                        LkpDBCod.DataSource   := pDSMaster
                     else
                        LkpDBCod.DataSource   := pDSDetail;

                     LkpDBCod.DataField    := LkpName_DataField_CodID;
                  end;
                  LkpDBCod.InputType    := 'text';

                  if mm.CONFIG_LAYOUT_APPLY_FONT_ALL = 'ON' then
                     LkpDBCod.Font.Name    := mm.CONFIG_LAYOUT_APP_FONT;

                  LkpDBCod.Font.Size    := LkpDBEdit.Font.Size ;
                  LkpDBCod.Visible      := bSearch ;
                  LkpDBCod.Width        := StrToIntDef( cDbCodWidth, 40 );
                  LkpDBCod.Height       := LkpDBEdit.Height ;
                  LkpDBCod.Left         := LkpDBEdit.Left ;
                  LkpDBCod.Top          := LkpDBEdit.Top ;
                  LkpDBCod.TabOrder     := LkpDBEdit.TabOrder ;
                  LkpDBEdit.TabOrder    := LkpDBEdit.TabOrder + 1 ;

                  if LkpDBCod.Visible then
                  begin
                     LkpDBEdit.Width    := LkpDBEdit.Width - ( LkpDBCod.Width + 4 );
                     LkpDBEdit.Left     := LkpDBEdit.Left  + ( LkpDBCod.Width + 4 );
                     LkpDBCod.OnExit    := DynamicOnExit;
                     // v. 3.1.0.63
                     //LkpDBCod.InputType := 'number'; // this option work but show a "spin" in "edit"
                     LkpDBCod.ClientEvents.ExtEvents.Values['keydown'] := rc_ExtEvtKeyDownOnlyNumbers;
                     // v. 4.0.0.0
                     rc_AddFocusBlur( pFrame, TUniControl( LkpDBCod ), mm.CONFIG_LAYOUT_EDIT_COLOR, mm.CONFIG_LAYOUT_EDIT_FOCUS_COLOR, mm.CONFIG_LAYOUT_EDIT_FONT_COLOR );
                  end;
             end;
             // v. 4.0.0.0 onlysearch
             if not bOnlySearch then
             begin
                // pesq. EXTRA
                if bExtra then
                begin
                   LkpDBCodExtra  := TUniDBEdit( TComponent(pFrame).FindComponent( LkpName + '_PesqEXTRA' ) );

                   // se nao encontrou já existente, cria _PesqEXTRA dinamico...
                   if LkpDBCodExtra = nil then
                   begin
                        LkpDBCodExtra              := TUniDBEdit.Create( TComponent(pFrame) );
                        LkpDBCodExtra.Parent       := LkpDBEdit.Parent;
                        LkpDBCodExtra.Name         := lowercase( LkpDBEdit.Name ) + '_PesqEXTRA';

                        if pDSDetail = nil then
                           LkpDBCodExtra.DataSource   := pDSMaster
                        else
                           LkpDBCodExtra.DataSource   := pDSDetail;

                        LkpDBCodExtra.DataField    := LkpName_DataField_Extra;
                        LkpDBCodExtra.CharCase     := ecUpperCase;
                        LkpDBCodExtra.InputType    := 'text';

                        if mm.CONFIG_LAYOUT_APPLY_FONT_ALL = 'ON' then
                           LkpDBCodExtra.Font.Name    := mm.CONFIG_LAYOUT_APP_FONT;

                        LkpDBCodExtra.Font.Size    := LkpDBEdit.Font.Size ;
                        LkpDBCodExtra.Hint         := LkpName_DataField_Extra_Source;
                        LkpDBCodExtra.Width        := StrToIntDef( cDbExtraWidth, 70 );
                        LkpDBCodExtra.Left         := LkpDBEdit.Left ;
                        LkpDBCodExtra.Top          := LkpDBEdit.Top ;
                        LkpDBCodExtra.Height       := LkpDBEdit.Height ;

                        if LkpDBCodExtra.Visible then
                        begin
                           LkpDBEdit.Width         := LkpDBEdit.Width - ( LkpDBCodExtra.Width + 4 );
                           LkpDBEdit.Left          := LkpDBCodExtra.Left + LkpDBCodExtra.Width + 4;
                        end;

                        LkpDBCodExtra.OnExit       := DynamicOnExitLkpExtra;

                        if LkpDBCod.Visible then
                        begin
                           LkpDBCodExtra.TabOrder  := LkpDBCod.TabOrder + 1 ;
                           LkpDBEdit.TabOrder      := LkpDBCodExtra.TabOrder + 1 ;
                           LkpDBCodExtra.Left      := LkpDBCod.Left + LkpDBCod.Width + 4;
                           //LkpDBEdit.Width         := LkpDBEdit.Width - ( LkpDBCod.Width + 4 ); // v. 4.0.0.0
                           LkpDBEdit.Left          := LkpDBCodExtra.Left + LkpDBCodExtra.Width + 4;
                           // v. 4.0.0.0
                           rc_AddFocusBlur( pFrame, TUniControl( LkpDBCod ), mm.CONFIG_LAYOUT_EDIT_COLOR, mm.CONFIG_LAYOUT_EDIT_FOCUS_COLOR, mm.CONFIG_LAYOUT_EDIT_FONT_COLOR );
                        end
                        else
                        begin
                           LkpDBCodExtra.TabOrder     := LkpDBEdit.TabOrder ;
                           LkpDBEdit.TabOrder         := LkpDBEdit.TabOrder + 1 ;
                        end;
                   end;
                end;
             end;

             // se nao encontrou 'btnLkp', cria...
             cTemp  := StringReplace( lowercase( LkpDBEdit.Name ), 'edlkp' , 'btnLkp' , [rfReplaceAll] );
             LkpBtn := TUniSpeedButton( TComponent(pFrame).FindComponent( cTemp ) );

             if LkpBtn = nil then
             begin
                  LkpBtn              := TUniSpeedButton.Create( TComponent(pFrame) );
                  LkpBtn.Parent       := LkpDBEdit.Parent;
                  LkpBtn.Name         := cTemp;
                  LkpBtn.Hint         := '[[cls:ButtonThemeCrud | ico:fas-search]]';
                  LkpBtn.Font.Size    := LkpDBEdit.Font.Size ;
                  LkpBtn.Alignment    := taCenter;

                  // se estiver dentro de um bloco 'responsivo'...
                  if Pos( 'rcblock', lowercase( LkpBtn.Parent.Name ) ) > 0 then
                     LkpBtn.Anchors      := [akTop,akRight];
                  // v. 4.0.0.0 onlysearch
                  LkpBtn.Tag       := varIIF( bLite, 1, 0 );
                  //LkpDBEdit.Tag       := varIIF( bLite, 1, 0 );

                  // v. 3.1.0.61
                  LkpBtn.TabStop   := False;
                  if not bSearchOFF then
                     LkpDBEdit.Width  := LkpDBEdit.Width - 27;

                  if not Assigned( LkpDBEdit.OnClick ) then
                     LkpBtn.OnClick      := DynamicBtnClick
                  else
                  begin
                     LkpBtn.OnClick      := LkpDBEdit.OnClick;
                     LkpDBEdit.OnClick   := nil;
                  end;
             end;

             if LkpBtn <> nil then
             begin
                LkpBtn.Left   := LkpDBEdit.Left + LkpDBEdit.Width + 1;
                LkpBtn.Top    := LkpDBEdit.Top ;
                LkpBtn.Height := varIIF( LkpDBEdit.Height < 24, 24, LkpDBEdit.Height ) ;

                if not bSearchOFF then
                   LkpBtn.Width  := 25
                else
                begin
                   LkpBtn.Width   := 0;
                   LkpBtn.Visible := false;
                end;

                // v. 3.2.0.0
                LkpBtn.ClientEvents.ExtEvents.Values['click'] :=
                   'function click(sender, eOpts) ' +
                   '{ ' +
                   '  ajaxRequest( MainForm.htmlFrame, "_getXY" , ' +
                   '    ["x=" + ' + LkpDBEdit.JSName + '.getEl().getLeft(), ' +
                   '     "y=" + ' + LkpDBEdit.JSName + '.getEl().getTop() ,' +
                   '     "h=" + ' + LkpDBEdit.JSName + '.getEl().getHeight() ,' +
                   '     "w=" + ' + LkpDBEdit.JSName + '.getEl().getWidth() ]);' +
                   '} ';
             end;

             // v. 4.0.0.0 onlysearch
             if not bOnlySearch then
             begin
                 // se nao encontrou 'btnLkpAdd', cria...
                 cTemp  := StringReplace( lowercase( LkpDBEdit.Name ), 'edlkp' , 'btnLkpAdd' , [rfReplaceAll] );
                 LkpBtnAdd := TUniSpeedButton( TComponent(pFrame).FindComponent( cTemp ) );

                 if LkpBtnAdd = nil then
                 begin
                      if bPlus and not bSearchOFF then
                      begin
                         LkpBtnAdd              := TUniSpeedButton.Create( TComponent(pFrame) );
                         LkpBtnAdd.Parent       := LkpDBEdit.Parent;
                         LkpBtnAdd.Name         := cTemp;
                         LkpBtnAdd.Hint         := '[[cls:ButtonThemeCrud | ico:fas-plus]]';

                         // se estiver dentro de um bloco 'responsivo'...
                         if Pos( 'rcblock', lowercase( LkpBtnAdd.Parent.Name ) ) > 0 then
                            LkpBtnAdd.Anchors   := [akTop,akRight];

                         LkpBtnAdd.Visible      := not bSearchOFF;

                         // v. 3.1.0.61
                         LkpBtnAdd.TabStop      := False;

                         if LkpBtnAdd.Visible then
                         begin
                            LkpDBEdit.Width     := LkpDBEdit.Width - 27;
                            if not bSearchOFF then
                               LkpBtn.Left := LkpBtn.Left - 27;
                         end;

                         LkpBtnAdd.OnClick      := DynamicOnDblClick;
                      end;
                 end;

                 if LkpBtnAdd <> nil then
                 begin
                    if bSearchOFF then
                       LkpBtnAdd.Left   := LkpDBEdit.Left + LkpDBEdit.Width + 2
                    else
                       LkpBtnAdd.Left   := LkpBtn.Left + LkpBtn.Width + 2;
                    LkpBtnAdd.Top    := LkpDBEdit.Top ;
                    LkpBtnAdd.Height := LkpBtn.Height;
                    LkpBtnAdd.Width  := LkpBtn.Width;
                 end;
             end;
             // v. 3.4.0.0
             oHtmlFrm := TUniHTMLFrame( TComponent(pFrame).FindComponent('rc__Required' + LkpDBEdit.Name) );
             if oHtmlFrm <> nil then
             begin
                // v. 4.0.0.0
                oHtmlFrm.Left := LkpDBEdit.Left + LkpDBEdit.Width - 8;
                oHtmlFrm.Top  := oHtmlFrm.Top - 1;
             end;
             oHtmlFrm := nil;
             // tentar ajustar o TabOrder...
             iTabOrder := LkpDBEdit.TabOrder;

             // v. 4.0.0.0 onlysearch
             if not bOnlySearch then
             begin
                if ( bExtra ) and ( LkpDBCodExtra <> nil ) then // v. 3.0.0.48
                begin
                   LkpDBCodExtra.TabOrder := iTabOrder;
                   LkpDBEdit.TabOrder     := LkpDBCodExtra.TabOrder + 1;
                   LkpBtn.TabOrder        := LkpDBEdit.TabOrder + 1;

                   if LkpBtnAdd <> nil then
                   begin
                      LkpBtnAdd.TabOrder  := LkpBtn.TabOrder + 1;
                      LkpBtn.TabOrder     := LkpBtnAdd.TabOrder + 1;
                   end;
                end
                else
                begin
                   LkpDBEdit.TabOrder     := iTabOrder ;
                   LkpBtn.TabOrder        := iTabOrder + 1;

                   if LkpBtnAdd <> nil then
                   begin
                      LkpBtnAdd.TabOrder  := LkpBtn.TabOrder ;
                      LkpBtn.TabOrder     := LkpBtnAdd.TabOrder + 1;
                   end;
                end;
             end;

             LkpTable  := lowercase( Copy( LkpName, 6, 50 ) );
             LkpQuery  := TFDQuery( TComponent(pFrame).FindComponent( lkpTable ) );

            // se nao encontou componente fisico, foi criada dinamicamente  ( prefixo "LKP_" )
            if LkpQuery = nil then
               LkpQuery  := TFDQuery( TComponent(pFrame).FindComponent( 'LKP_' + lkpTable ) );

             // se nao encontrar cria dinamicamente
             if LkpQuery = nil then
             begin
                  LkpQuery              := TFDQuery.Create( TComponent(pFrame) );
                  LkpQuery.Name         := 'LKP_' + uppercase( lkpTable );
                  LkpQuery.Connection   := mm.SQLConn;

                  LkpDataSource         := TDataSource.Create( TComponent(pFrame) );
                  LkpDataSource.Name    := 'dsLkp_' + uppercase( lkpTable );
                  LkpDataSource.DataSet := LkpQuery;

                  LkpDBEdit.DataSource     := LkpDataSource;

                  // verifica se tem campos de retorno do lookup ALEM do padrão( SetDS )
                  // v. 4.0.0.0 onlysearch
                  if not bOnlySearch then
                  begin
                     slLkpSetDS := rc_FindAllComponents( pFrame, LkpName + '_SetDS_' );
                     if slLkpSetDS <> nil then
                     begin
                        for f := 0 to slLkpSetDS.Count - 1 do
                        begin
                           LkpSetDS := TUniDBEdit( TComponent(pFrame).FindComponent( slLkpSetDS.Strings[ f ] ) );
                           if LkpSetDS <> nil then
                           begin
                              TUniDBEdit( LkpSetDS ).DataSource := LkpDataSource;
                              TUniDBEdit( LkpSetDS ).DataField  := Trim( Copy ( TUniDBEdit( LkpSetDS ).Name, Pos( '_setds_', lowercase( TUniDBEdit( LkpSetDS ).Name ) ) + 7, 100 ) );

                              cTemp3 := TUniDBEdit( LkpSetDS ).Name;
                              cTemp3 := Copy( cTemp3, 1, Pos( '_setds_', lowercase( TUniDBEdit( LkpSetDS ).Name ) ) - 1 );

                              cTemp4 := '';
                              if TUniControl( TComponent(pFrame).FindComponent( cTemp3 )) <> nil then
                              begin
                                 // Lkp: DS <> dsMaster ?
                                 cTemp4 := rc_GetHintProperty( 'ds:', TUniControl( TComponent(pFrame).FindComponent( cTemp3 )).Hint );
                                 // v. 3.3.0.1
                                 if cTemp4 = '' then
                                    cTemp4 := 'dsMaster';

                                 if cTemp4 <> '' then
                                 begin
                                     TUniDBEdit( LkpSetDS ).Hint := rc_SetHintProperty( cTemp4, 'ds:', TUniDBEdit( LkpSetDS ).Hint );
                                     TUniDBEdit( LkpSetDS ).OnChangeValue := DynamicOnChangeValueForSetDS;
                                 end;
                              end;
                           end
                           else
                           begin
                              LkpSetDS := TUniDBFormattedNumberEdit( TComponent(pFrame).FindComponent( slLkpSetDS.Strings[ f ] ) );
                              if LkpSetDS <> nil then
                              begin
                                 TUniDBFormattedNumberEdit( LkpSetDS ).DataSource := LkpDataSource;
                                 TUniDBFormattedNumberEdit( LkpSetDS ).DataField  := Trim( Copy ( TUniDBFormattedNumberEdit( LkpSetDS ).Name, Pos( '_setds_', lowercase( TUniDBFormattedNumberEdit( LkpSetDS ).Name ) ) + 7, 100 ) );

                                 cTemp3 := TUniDBFormattedNumberEdit( LkpSetDS ).Name;
                                 cTemp3 := Copy( cTemp3, 1, Pos( '_', cTemp3 ) - 1 );
                                 cTemp4 := '';

                                 if TUniControl( TComponent(pFrame).FindComponent( cTemp3 )) <> nil then
                                 begin
                                     // Lkp: DS <> dsMaster ?
                                     cTemp4 := rc_GetHintProperty( 'ds:', TUniControl( TComponent(pFrame).FindComponent( cTemp3 )).Hint );
                                     // v. 3.3.0.1
                                     if cTemp4 = '' then
                                        cTemp4 := 'dsMaster';

                                     if cTemp4 <> '' then
                                     begin
                                          TUniDBFormattedNumberEdit( LkpSetDS ).Hint := rc_SetHintProperty( cTemp4, 'ds:', TUniDBFormattedNumberEdit( LkpSetDS ).Hint );
                                          TUniDBFormattedNumberEdit( LkpSetDS ).OnChangeValue := DynamicOnChangeValueForSetDS;
                                     end;
                                 end;
                              end
                              else
                              begin
                                 LkpSetDS := TUniDBDateTimePicker( TComponent(pFrame).FindComponent( slLkpSetDS.Strings[ f ] ) );

                                 if LkpSetDS <> nil then
                                 begin
                                      TUniDBDateTimePicker( LkpSetDS ).DataSource := LkpDataSource;
                                      TUniDBDateTimePicker( LkpSetDS ).DataField  := Trim( Copy ( TUniDBDateTimePicker( LkpSetDS ).Name, Pos( '_setds_', lowercase( TUniDBDateTimePicker( LkpSetDS ).Name ) ) + 7, 100 ) );

                                      cTemp3 := TUniDBDateTimePicker( LkpSetDS ).Name;
                                      cTemp3 := Copy( cTemp3, 1, Pos( '_', cTemp3 ) - 1 );

                                      // Lkp: DS <> dsMaster ?
                                      cTemp4 := '';
                                      if TUniControl( TComponent(pFrame).FindComponent( cTemp3 )) <> nil then
                                      begin
                                         // Lkp: DS <> dsMaster ?
                                         cTemp4 := rc_GetHintProperty( 'ds:', TUniControl( TComponent(pFrame).FindComponent( cTemp3 )).Hint );
                                         // v. 3.3.0.1
                                         if cTemp4 = '' then
                                            cTemp4 := 'dsMaster';

                                         if cTemp4 <> '' then
                                         begin
                                              TUniDBDateTimePicker( LkpSetDS ).Hint := rc_SetHintProperty( cTemp4, 'ds:', TUniDBDateTimePicker( LkpSetDS ).Hint );
                                              TUniDBDateTimePicker( LkpSetDS ).OnChangeValue := DynamicOnChangeValueForSetDS;
                                         end;
                                      end;
                                 end;
                              end;
                           end;
                        end;
                        slLkpSetDS.Free;
                     end;
                  end;
             end;

             if Pos( '__' , LkpTable ) > 0 then
                LkpTable := Copy( LkpTable , 1, Pos( '__' , LkpTable ) -1 );

             // Criar a QUERY padrão pra seleção do LOOKUP baseado nos padrões do RadCORE
             //
             // A Ideia é JÁ QUE O NOME DA QUERY é o NOME DA TABELA, e TODAS as tabelas do RadCORE tem CAMPO 'CODIGO' ( mas será captura a PK da tabela )
             // o RadCORE vai criar dinamicamente e evitar um bom trabalho
             //
             // Pra maior parte dos CRUDs ganha-se tempo nao se preocupando em alterar o SQL da query
             // se estiver seguindo o padrão do RadCORE, claro.
             if LkpQuery = nil then
             begin
                 //UniSession.ResumeLayouts;
                 rc_ShowError( format( '<h2>LookUps Preparation failed!</h2><br>' +
                                       '<strong>MESSAGE</strong><br><hr>' + '<strong>LkpQuery: </strong>' + '%s ' + 'not declared!' + '<br><br>' +
                                       '<strong>TIP</strong><br><hr>Query with non-standard nomenclature %s' + '<br><br>' +
                                       mm.MSG_CONTACT_SUPPORT, [ '' , '( ' + LkpDBEdit.Name + ' ).' ] ) );

                 Abort;
             end
             else
             if Trim( LkpQuery.Sql.Text ) = '' then
             begin
                LkpQuery.close;

                if mm.CONFIG_DATABASE_FIREDAC = 'FIREBIRD' then
                begin
                   LkpTable     := Uppercase( LkpTable );
                   LkpJoinTable := Uppercase( LkpJoinTable );
                end
                else
                begin
                   LkpTable     := Lowercase( LkpTable );
                   LkpJoinTable := Lowercase( LkpJoinTable );
                end;

                LkpQuery.Sql.Text := ' Select ' + LkpSelectFields + ' from ' + LkpTable + ' where ' + rc_GetPrimaryKey( lkpTable.ToLower ) + ' = :table_pk ';

                if LkpJoinTable <> '' then
                begin
                     LkpQuery.Sql.Text := ' Select tab.*,  tbJoin.' + LkpDBEdit.DataField +
                                          ' from ' + LkpTable + ' tab ' +

                                          ' left join ' + LkpJoinTable + ' tbJoin ' +
                                          ' on tbJoin.' + rc_GetPrimaryKey( LkpJoinTable.ToLower ) + ' = tab.' + LkpJoinField +

                                          ' where tab.' + rc_GetPrimaryKey( lkpTable.ToLower ) + ' = :table_pk ';
                end;
             end;
          end;
       end
       else
       if ( pComponent is TUniDateTimePicker ) or ( pComponent is TUniDBDateTimePicker )  then   // stand by....
       begin


       end;
    end;

    // preencher o SELECT do CRUD( q vai ser EDITADO/INSERIDO etc ) com os campos PRESENTES no FORM/FRAME atual
    // caso tenha usado o CORINGA [[fields]], senao, assume o que vc escreveu manualmente
    if Pos( '[[fields]]' , pSQLMaster.Sql.Text ) > 0 then
    begin
        cFields := '';

        for I := 0 to TComponent(pFrame).ComponentCount - 1 do
        begin
           pComponent := TComponent(pFrame).Components[I];

           cTemp         := '';
           pDSSetDS_Orig := nil;
           LkpDataSource := nil;

           cSaveTo := '';
           // v. 4.0.0.0 onlysearch
           if not bOnlySearch then
           begin
              if ( Pos( '_setds', lowercase( TUniControl( pComponent ).Name ) ) > 0 ) then
              begin
                   cTemp3 := rc_GetHintProperty( 'ds:', TUniControl( pComponent ).Hint );

                   If cTemp3 <> '' then
                   begin
                        pDSSetDS_Orig := TDataSource( TComponent(pFrame).FindComponent( cTemp3 ));

                        if pDSSetDS_Orig <> nil then
                           if pDSSetDS_Orig = pDSMaster then
                           begin
                              cSaveTo := rc_GetHintProperty( 'saveto:', TUniControl( pComponent ).Hint );

                              if cSaveTo = '_default' then
                                 cSaveTo := TUniDBEdit( pComponent ).DataField;

                              if cSaveTo <> '' then
                              begin

                              end;
                           end;
                   end;
              end;
           end;
           // v. 3.3.2.0
           if ( pComponent is TUniDBEdit ) then
           begin
              // v. 3.3.2.0
              if TUniDBEdit( pComponent ).DataSource = nil then TUniDBEdit( pComponent ).DataSource := pDSMaster;

              if cSaveTo <> '' then
                 cTemp := cSaveTo
              else
              if TUniDBEdit( pComponent ).DataSource = pDSMaster then
                 cTemp := TUniDBEdit( pComponent ).DataField;
           end
           else
           if ( pComponent is TUniDBDateTimePicker ) then
           begin
              // v. 3.3.2.0
              if TUniDBDateTimePicker( pComponent ).DataSource = nil then TUniDBDateTimePicker( pComponent ).DataSource := pDSMaster;

              if pDSSetDS_Orig <> nil then
              begin
                 if pDSSetDS_Orig = pDSMaster then
                    cTemp := TUniDBDateTimePicker( pComponent ).DataField;
              end
              else
              if TUniDBDateTimePicker( pComponent ).DataSource = pDSMaster then
                 cTemp := TUniDBDateTimePicker( pComponent ).DataField
           end
           else
           if ( pComponent is TUniDBNumberEdit ) then
           begin
              // v. 3.3.2.0
              if TUniDBNumberEdit( pComponent ).DataSource = nil then TUniDBNumberEdit( pComponent ).DataSource := pDSMaster;

              if pDSSetDS_Orig <> nil then
              begin
                 if pDSSetDS_Orig = pDSMaster then
                    cTemp := TUniDBNumberEdit( pComponent ).DataField;
              end
              else
              if TUniDBNumberEdit( pComponent ).DataSource = pDSMaster then
                 cTemp := TUniDBNumberEdit( pComponent ).DataField
           end
           else
           if ( pComponent is TUniDBFormattedNumberEdit ) then
           begin
              // v. 3.3.2.0
              if TUniDBFormattedNumberEdit( pComponent ).DataSource = nil then TUniDBFormattedNumberEdit( pComponent ).DataSource := pDSMaster;

              if pDSSetDS_Orig <> nil then
              begin
                 if pDSSetDS_Orig = pDSMaster then
                    cTemp := TUniDBFormattedNumberEdit( pComponent ).DataField;
              end
              else
              if TUniDBFormattedNumberEdit( pComponent ).DataSource = pDSMaster then
                 cTemp := TUniDBFormattedNumberEdit( pComponent ).DataField
           end
           else
           if ( pComponent is TUniDBImage ) then
           begin
              // v. 3.3.2.0
              if TUniDBImage( pComponent ).DataSource = nil then TUniDBImage( pComponent ).DataSource := pDSMaster;

              if pDSSetDS_Orig <> nil then
              begin
                 if pDSSetDS_Orig = pDSMaster then
                    cTemp := TUniDBImage( pComponent ).DataField;
              end
              else
              if TUniDBImage( pComponent ).DataSource = pDSMaster then
                 cTemp := TUniDBImage( pComponent ).DataField
           end
           else
           if ( pComponent is TUniDBText ) then
           begin
              // v. 3.3.2.0
              if TUniDBText( pComponent ).DataSource = nil then TUniDBText( pComponent ).DataSource := pDSMaster;

              if pDSSetDS_Orig <> nil then
              begin
                 if pDSSetDS_Orig = pDSMaster then
                    cTemp := TUniDBText( pComponent ).DataField;
              end
              else
              if TUniDBText( pComponent ).DataSource = pDSMaster then
                 cTemp := TUniDBText( pComponent ).DataField
           end
           else
           if ( pComponent is TUniDBCheckBox ) then
           begin
              // v. 3.3.2.0
              if TUniDBCheckBox( pComponent ).DataSource = nil then TUniDBCheckBox( pComponent ).DataSource := pDSMaster;

              if pDSSetDS_Orig <> nil then
              begin
                 if pDSSetDS_Orig = pDSMaster then
                    cTemp := TUniDBCheckBox( pComponent ).DataField;
              end
              else
              if TUniDBCheckBox( pComponent ).DataSource = pDSMaster then
                 cTemp := TUniDBCheckBox( pComponent ).DataField
           end
           else
           if ( pComponent is TUniDBRadioGroup ) then
           begin
              // v. 3.3.2.0
              if TUniDBRadioGroup( pComponent ).DataSource = nil then TUniDBRadioGroup( pComponent ).DataSource := pDSMaster;

              if pDSSetDS_Orig <> nil then
              begin
                 if pDSSetDS_Orig = pDSMaster then
                    cTemp := TUniDBRadioGroup( pComponent ).DataField;
              end
              else
              if TUniDBRadioGroup( pComponent ).DataSource = pDSMaster then
                 cTemp := TUniDBRadioGroup( pComponent ).DataField
           end
           else
           if ( pComponent is TUniDBHTMLMemo ) then
           begin
              // v. 3.3.2.0
              if TUniDBHTMLMemo( pComponent ).DataSource = nil then TUniDBHTMLMemo( pComponent ).DataSource := pDSMaster;

              if pDSSetDS_Orig <> nil then
              begin
                 if pDSSetDS_Orig = pDSMaster then
                    cTemp := TUniDBHTMLMemo( pComponent ).DataField;
              end
              else
              if TUniDBHTMLMemo( pComponent ).DataSource = pDSMaster then
                 cTemp := TUniDBHTMLMemo( pComponent ).DataField
           end
           else
           if ( pComponent is TUniDBMemo ) then
           begin
              // v. 3.3.2.0
              if TUniDBMemo( pComponent ).DataSource = nil then TUniDBMemo( pComponent ).DataSource := pDSMaster;

              if pDSSetDS_Orig <> nil then
              begin
                 if pDSSetDS_Orig = pDSMaster then
                    cTemp := TUniDBMemo( pComponent ).DataField;
              end
              else
              if TUniDBMemo( pComponent ).DataSource = pDSMaster then
                 cTemp := TUniDBMemo( pComponent ).DataField
           end
           else
           if ( pComponent is TUniDBComboBox ) then
           begin
              // v. 3.3.2.0
              if TUniDBComboBox( pComponent ).DataSource = nil then TUniDBComboBox( pComponent ).DataSource := pDSMaster;

              if pDSSetDS_Orig <> nil then
              begin
                 if pDSSetDS_Orig = pDSMaster then
                    cTemp := TUniDBComboBox( pComponent ).DataField;
              end
              else
              if TUniDBComboBox( pComponent ).DataSource = pDSMaster then
                 cTemp := TUniDBComboBox( pComponent ).DataField;

              if ( Pos( 'cbbx:' , TUniDBComboBox( pComponent ).Hint ) = 0 ) and
                 ( Pos( '|' , TUniDBComboBox( pComponent ).Items.Text ) > 0 ) then
              begin
                   // v. 4.0.0.5
                   cTemp2 := '';
                   cTemp3 := '';
                   cTemp4 := '';
                   cTmp   := '';
                   cTmp2  := '';
                   for f := 0 to TUniDBComboBox( pComponent ).Count - 1 do
                   begin
                       cTemp2 := TUniDBComboBox( pComponent ).Items[f];
                       cTemp3 := Copy( cTemp2, 1, Pos( '|', cTemp2 ) - 1 ) ;
                       cTemp4 := Copy( cTemp2, Pos( '|', cTemp2 ) + 1, 10 ) ;
                       TUniDBComboBox( pComponent ).Items.Text := StringReplace( TUniDBComboBox( pComponent ).Items.Text, cTemp2, cTemp3 , [rfReplaceAll]);
                       cTmp  := cTmp + cTemp4 ;
                       cTmp2 := cTmp2+ cTemp3 + '=' + cTemp4 ;
                       if f+1 <= TUniDBComboBox( pComponent ).Count - 1 then
                       begin
                          cTmp  := cTmp  + ',' ;
                          cTmp2 := cTmp2 + ',' ;
                       end;
                   end;
                   if cTmp <> '' then
                   begin
                      TUniDBComboBox( pComponent ).Hint := rc_SetHintProperty( '{' + cTmp + '}', 'cbbx:', TUniDBComboBox( pComponent ).Hint, true );
                      TUniDBComboBox( pComponent ).Hint := rc_SetHintProperty( cTmp2 , 'cbbxdata:', TUniDBComboBox( pComponent ).Hint, true );
                   end;
              end;
           end
           else
           if ( pComponent is TUniDBLookupComboBox ) then
           begin
              // v. 3.3.2.0
              if TUniDBLookupComboBox( pComponent ).DataSource = nil then TUniDBLookupComboBox( pComponent ).DataSource := pDSMaster;

              if pDSSetDS_Orig <> nil then
              begin
                 if pDSSetDS_Orig = pDSMaster then
                    cTemp := TUniDBLookupComboBox( pComponent ).DataField;
              end
              else
              if TUniDBLookupComboBox( pComponent ).DataSource = pDSMaster then
                 cTemp := TUniDBLookupComboBox( pComponent ).DataField;
           end
           else  // bs_render
           if ( pComponent is TUniLabel ) and
              ( ( Pos( 'bschk' , TUniLabel( pComponent ).Hint.ToLower ) > 0 ) or
                ( Pos( 'bsswt' , TUniLabel( pComponent ).Hint.ToLower ) > 0 ) or
                ( Pos( 'bsrgp' , TUniLabel( pComponent ).Hint.ToLower ) > 0 ) or
                ( Copy( TUniLabel( pComponent ).Name , 1, 2 ) = 'bs' ) ) and
              ( ( Pos( '__' , TUniLabel( pComponent ).Hint ) > 0 ) or
                ( Pos( 'field:' , TUniLabel( pComponent ).Hint ) > 0 ) or
                ( Pos( '_db' , TUniLabel( pComponent ).Name ) > 1 ) ) then
           begin
               if ( Copy( TUniLabel( pComponent ).Name , 1, 2 ) = 'bs' ) and
                  ( Pos( '_db' , TUniLabel( pComponent ).Name ) > 0 ) then
               begin
                    // v. 3.3.3.0
                    if ( ( Pos( '[ds:' , TUniLabel( pComponent ).Hint ) > 0 ) or ( Pos( ' ds:' , TUniLabel( pComponent ).Hint ) > 0 ) ) and
                       ( Pos( ' ds:dsmaster' , TUniLabel( pComponent ).Hint ) = 0 ) then
                         cTemp := ''
                    else
                    begin
                      cTemp := rc_GetParamFromRGP( TUniLabel( pComponent ).Name, rptFIELD );
                    end;
               end
               else
               begin
                    cTemp := TUniLabel( pComponent ).Hint;

                    if Pos( 'field:' , TUniLabel( pComponent ).Hint ) > 0 then
                    begin
                       // v. 3.3.1.0
                       if ( Pos( ' ds:' , TUniLabel( pComponent ).Hint ) > 0 ) and
                          ( Pos( ' ds:dsmaster' , TUniLabel( pComponent ).Hint ) = 0 ) then
                            cTemp := ''
                       else
                       begin
                         cTemp := Copy( cTemp, Pos( 'field:' , cTemp ) + 6 , 100 );
                         cTemp := Trim( StringReplace( cTemp , ']]', '', [rfReplaceAll] ) ) + ' ' ;
                         cTemp := Copy( cTemp, 1, Pos( ' ' , cTemp ) -1 );
                       end;
                    end
                    else
                       cTemp := Copy( cTemp, Pos( '__' , cTemp ) + 2 , 100 );
               end;
           end;

           // quando o banco é FIREBIRD e o campo inicia com um número( Ex: 5_CARGO )
           // o FIREBIRD só aceita se estiver entre aspas e em maiúsculo.
           // Não sei se ocorre com outro SGBD
           //
           // when the bank is FIREBIRD and the field starts with a number (Ex: 5_CARGO)
           // FIREBIRD only accepts if it is enclosed in quotes and in capital letters.
           // I don't know if it occurs with another DBMS
           if ( cTemp <> '' ) and
              ( ( Pos( 'tab."' + uppercase( cTemp ) + '" ,', cFields ) = 0 ) and ( Pos( 'tab.' + lowercase( cTemp ) + ' ,', cFields ) = 0 ) ) then
           begin
              if ( mm.CONFIG_DATABASE_FIREDAC = 'FIREBIRD' ) AND
                 ( ReturnNumbers( copy( cTemp, 1, 1) ) <> '' ) then
                 cFields := cFields + 'tab."' + uppercase( cTemp ) + '" ,'
              else
                 cFields := cFields + 'tab.' + lowercase( cTemp ) + ' ,';
           end;
        end;

        // ed_CodMASTER: frmBaseCRUDDetail
        if TUniEdit( TComponent(pFrame).FindComponent( 'ed_CodMaster' )) <> nil then
        begin
            cTemp := TUniEdit( TComponent(pFrame).FindComponent( 'ed_CodMaster' )).Hint;
             // feedback by SAMET
            if ( cTemp <> '' ) and ( Pos( 'tab.' + lowercase( cTemp ) + ' ,', cFields ) = 0 ) then
               cFields := cFields + 'tab.' + lowercase( cTemp ) + ' ,';
        end;

        AllPKs := '';

        memPK.Filtered := false;
        memPK.Filter   := 'table=' + quotedStr(lowercase(trim( TUniEdit( TComponent(pFrame).FindComponent( 'ed_table_itemsel' )).text )) );
        memPK.Filtered := true;
        memPK.First;

        cSql := lowercase( sqlSearchMaster.sql.Text );
        cSql :=  Copy( cSql, 1, Pos( ' from ' , cSql ) );

        while not memPK.eof do
        begin
             memPK.tag := 0;

             cPk := trim(lowercase( memPK.FieldByName( 'pk' ).AsString ));

             // se alguma das PK´s ja estiver presente na query do on create do form( preenchida manualmente ) não adicionar...
             begin
                if ( Pos( 'tab.' + cPk + ' ,', cFields ) = 0 )then
                begin
                   AllPKs := AllPKs + 'tab.' + cPk + ' ,';
                end;
             end;

             memPK.Next;
        end;

        memPK.Filtered := false;

        if AllPKs <> '' then
        begin
             cFields := cFields + AllPKs;
        end;

        if cFields <> '' then
           cFields := Copy( cFields, 1, Length( cFields ) - 1 );

        pSQLMaster.Sql.Text := StringReplace( pSQLMaster.Sql.Text , '[[fields]]' , cFields, [rfReplaceAll] );
    end;

    // aplicar layout nos possiveis botoes criados no lookup
    // apply layout to possible buttons created in the lookup
    rc_RenderControls(pFrame);
end;
// v. 4.0.0.0
procedure tdm_rc.rc_LookUpUpdateData( pFrame: TObject; pLkp : TUniControl; pClearLkpOnlySearch : boolean ); // v. 4.0.0.0 onlysearch
// v. 3.2.0..7
var
   LkpDBCod,
   LkpDBEdit : TUniDBEdit;
   // v. 4.0.0.0
   pDM : TDataModule;

   pSQLMaster,
   pSQLDetail,
   LkpQuery : TFDQuery;

   LkpBtn : TUniSpeedButton;

   pDSDetail,
   LkpDataSource : TDataSource;

   cTemp, cTemp2, cTemp3, cTemp4,
   LkpName,
   LkpName_DataField_CodID,
   LkpName_DataField_Concat,
   LkpTable : string;

   bLkpOnlySearch : boolean; // v. 4.0.0.0
   iLkpPkValue, // v. 4.0.0.0
   iPos,
   I : integer;
begin
  inherited;

    pSQLMaster := TFDQuery( TComponent(pFrame).FindComponent( 'sqlMaster' ) );

    // ajustar cores de campos lookup e eventos pra pesquisa
    for I := 0 to TComponent(pFrame).ComponentCount - 1 do
    begin
      // to clean "valid:" red borders
      // para limpar as bordas vermelhas do "valid:"
      If GetPropInfo( TComponent(pFrame).Components[I].ClassInfo, 'Hint') <> nil then
      begin
         if Pos( {v. 4.0.0.5}'invalidate:true', TUniControl( TComponent(pFrame).Components[I] ).Hint ) > 0 then
         begin
            rc_RemoveCssClass( TUniControl( TComponent(pFrame).Components[I] ), 'rc-invalid' );
            rc_SetHintProperty( 'false' , {v. 4.0.0.5}'invalidate:', TUniControl( TComponent(pFrame).Components[I] ).Hint ); //para limpar ao cancelar o cadastro
         end;
      end;

      //cbx-fill:ufs descricao [where]
      if ( TComponent(pFrame).Components[I] is TUniComboBox ) or
         ( TComponent(pFrame).Components[I] is TUniDBComboBox ) then
      begin
         cTemp := rc_GetHintProperty( 'cbx-fill:', TUniComboBox( TComponent(pFrame).Components[I] ).Hint );
         if cTemp <> '' then
         begin
              // v. 4.0.0.0
              if Pos( 'folder:', cTemp ) = 0 then
              begin
                 cTemp2 := trim( Copy( cTemp, 1, Pos( ' ', cTemp ) ) );
                 cTemp  := trim( StringReplace( cTemp, cTemp2, '', [rfReplaceAll] ) ) + ' ';
                 cTemp3 := trim( Copy( cTemp, 1, Pos( ' ', cTemp ) ) );
                 cTemp  := trim( StringReplace( cTemp, cTemp3, '', [rfReplaceAll] ) ) + ' ';
                 cTemp4 := ' ' + trim( Copy( cTemp, 1, 1000 ) );
                 cTemp  := trim( StringReplace( cTemp, cTemp4, '', [rfReplaceAll] ) ) + ' ';

                 cTemp4 := StringReplace( cTemp4, '|', '', [rfReplaceAll] ) ;
                 cTemp4 := StringReplace( cTemp4, ']', '', [rfReplaceAll] ) ;

                 if cTemp2 = '' then
                 begin
                    rc_ShowError( '<h2>cbx-fill Failed !</h2><br>' +
                                  '<strong>MESSAGE</strong><br><hr>' +
                                  '<strong>' + TComponent(pFrame).Components[I].Name + '</strong>' +
                                  ' "table" undeclared or with invalid nomenclature !' + '<br><br>' +
                                  mm.MSG_CONTACT_SUPPORT);
                    Abort;
                 end
                 else
                 if cTemp3 = '' then
                 begin
                    rc_ShowError( '<h2>cbx-fill Failed !</h2><br>' +
                                  '<strong>MESSAGE</strong><br><hr>' +
                                  '<strong>' + TComponent(pFrame).Components[I].Name + '</strong>' +
                                  ' "field" undeclared or with invalid nomenclature !' + '<br><br>' +
                                  mm.MSG_CONTACT_SUPPORT);
                    Abort;
                 end;
                 dm_rc.rc_FillComboBox( TComponent(pFrame).Components[I] , cTemp2, cTemp3, cTemp4 );
              end
              else
              begin
                 cTemp4 := '';
                 cTemp := Copy( cTemp, Pos( 'folder:', cTemp ) + 7 ) + ' ';
                 if pos( 'filter:' , cTemp ) > 0 then
                 begin
                    cTemp4 := Copy( cTemp, Pos( 'filter:', cTemp ) + 7 );
                    cTemp4 := Trim( cTemp4 ) ;
                 end;
                 cTemp := Copy( cTemp, 1, Pos( ' ', cTemp ) -1 );
                 dm_rc.rc_FillComboBox( TComponent(pFrame).Components[I] , '','',cTemp4, cTemp );
              end;

         end;
      end;

      if ( TComponent(pFrame).Components[I] is TUniDBComboBox )  then
      begin
           TUniDBComboBox( TComponent(pFrame).Components[I] ).AutoEdit := false;
           // v. 3.2.0.2 // feedback by VITOR NATAN
           if TUniDBComboBox( TComponent(pFrame).Components[I]  ).DataSource <> nil then
              TUniDBComboBox( TComponent(pFrame).Components[I]  ).ReadOnly :=
                not ( TUniDBComboBox( TComponent(pFrame).Components[I]  ).DataSource.State in [ dsEdit, dsInsert] );
      end;

      if ( TComponent(pFrame).Components[I] is TUniDBLookupComboBox )  then
      begin
           TUniDBLookupComboBox( TComponent(pFrame).Components[I]  ).AutoEdit := false;
           // v. 3.2.0.2 // feedback by VITOR NATAN
           if TUniDBComboBox( TComponent(pFrame).Components[I]  ).DataSource <> nil then
              TUniDBLookupComboBox( TComponent(pFrame).Components[I]  ).ReadOnly :=
                 not ( TUniDBLookupComboBox( TComponent(pFrame).Components[I]  ).DataSource.State in [ dsEdit, dsInsert] );
      end;

      if TComponent(pFrame).Components[I] is TUniDBEdit then
      begin
         if ( lowercase( Copy( TUniDBEdit( TComponent(pFrame).Components[I] ).Name , 1, 5 ) ) = 'edlkp' ) and
            ( Pos( '_setds' , lowercase( TUniDBEdit( TComponent(pFrame).Components[I] ).Name ) ) = 0 ) and
            ( Pos( '_pesqextra' , lowercase( TUniDBEdit( TComponent(pFrame).Components[I] ).Name ) ) = 0 ) and
            ( Pos( '_codid' , lowercase( TUniDBEdit( TComponent(pFrame).Components[I] ).Name ) ) = 0 )then
         begin
            // nomenclatura padrao para capturar os dados necessários
            // para otimizar a pesquisa lookup
            //
            // Todo lookUp precisa ter um KEYFIELD( capturado dinamicamente sua PK[ integer] ) e LISTFIELD( padrao DESCRICAO )
            // uma QUERY e um DATASOURCE ( serão criados dinamicamente ) pra vincular a PESQUISA e suas respectivas informaçõese
            // poderem ser acessiveis para alguma parte do projeto
            if pLkp = nil then
                LkpDBEdit := TUniDBEdit( TComponent(pFrame).Components[I] )
            else
                LkpDBEdit := TUniDBEdit( pLkp );

            LkpName   := LkpDBEdit.Name;
            cTemp     := LkpDBEdit.DataField;

            // Tem CODID dinamico ?
            LkpName_DataField_CodID := '';

            LkpTable  := lowercase( Copy( LkpName, 6, 50 ) );
            LkpDBCod  := TUniDBEdit( TComponent(pFrame).FindComponent( 'edLkp' + lkpTable + '_CodID' ) );
            LkpQuery  := TFDQuery( TComponent(pFrame).FindComponent( lkpTable ) );

            // se nao encontou componente fisico, foi criada dinamicamente
            if LkpQuery = nil then
               LkpQuery  := TFDQuery( TComponent(pFrame).FindComponent( 'LKP_' + lkpTable ) );

            if LkpDBCod = nil then
            begin
               rc_ShowError( '<h2>LookUps Update Failed !</h2><br>' +
                             '<strong>MESSAGE</strong><br><hr>' + '<strong>LkpDBCod: </strong>' + '"edLkp' + lkpTable + '_CodID" undeclared or with invalid nomenclature !' + '<br><br>' +
                             mm.MSG_CONTACT_SUPPORT);
               Abort;
            end;

            LkpBtn := TUniSpeedButton( TComponent(pFrame).FindComponent( StringReplace( lowercase(LkpDBEdit.Name), 'edlkp' , 'btnlkp' , [rfReplaceAll] ) ) );

            if LkpBtn = nil then
            begin
               rc_ShowError( '<h2>LookUps Creation Failure !</h2><br>' +
                             '<strong>MESSAGE</strong><br><hr>' +
                             '<strong>' + '"btnLkp' + lkpTable + '"</strong> undeclared or with invalid nomenclature!' + '<br><br>' +
                             mm.MSG_CONTACT_SUPPORT);
               Abort;
            end;

            try

               // v. 4.0.0.0 onlysearch
               bLkpOnlySearch := Pos( 'lkponlysearch', LkpDBEdit.Hint ) > 0 ;

               // se nao tiver declarado o DATASOURCE, o RADCORE procura pelo PADRAO e ASSOCIA dinamicamente
               LkpDataSource := TDataSource( TComponent(pFrame).FindComponent( 'dsLkp' + lkpTable ) );

               // se nao criou em tempo de projeto, foi criado pelo proprio RADCORE
               if LkpDataSource = nil then
                  LkpDBEdit.DataSource := TDataSource( TComponent(pFrame).FindComponent( 'dsLkp_' + lkpTable ) )
               else
                  LkpDBEdit.DataSource := TDataSource( TComponent(pFrame).FindComponent( 'dsLkp' + lkpTable ) );

               TFDQuery( LkpDBEdit.DataSource.DataSet ).close;

               // sqlMaster or Detail ?
               pDSDetail   := nil;
               pSQLDetail  := nil;
               cTemp       := LkpDBEdit.Hint;   //'[[NOME+FONE1 CODICLIPAI @ +]]'

               if Pos( ' ds:', cTemp ) > 0 then // v. 3.3.1.0
               begin
                  cTemp := Trim( StringReplace( cTemp, '[[', '', [rfReplaceAll] ) );
                  cTemp := StringReplace( cTemp, ']]', '', [rfReplaceAll] ) + ' ';

                  cTemp     := Trim( Copy( cTemp, Pos( ' ds:', cTemp ) + 4, 200 ) ); // v. 3.3.1.0
                  // v. 4.0.0.0
                  If Pos( '.', cTemp ) > 0 then
                  begin
                      pDM := nil;
                      pDM := rc_FindDataModule( Copy( cTemp, 1, pos( '.', cTemp ) - 1 ) );
                      cTemp := Copy( cTemp, pos( '.', cTemp ) + 1 );
                  end;
                  if pDM <> nil then
                     pDSDetail  := TDataSource( pDM.FindComponent( cTemp ) )
                  else
                     pDSDetail  := TDataSource( TComponent(pFrame).FindComponent( cTemp ) );
                  if pDSDetail <> nil then
                  begin
                     if pDM <> nil then
                        pSQLDetail  := TFDQuery( pDM.FindComponent( pDSDetail.DataSet.Name ) )
                     else
                        pSQLDetail  := TFDQuery( TComponent(pFrame).FindComponent( pDSDetail.DataSet.Name ) );
                  end;
                  //pDSDetail  := TDataSource( TComponent(pFrame).FindComponent( cTemp ) );
                  //if pDSDetail <> nil then
                  //   pSQLDetail  := TFDQuery( TComponent(pFrame).FindComponent( pDSDetail.DataSet.Name ) );
               end;
               // v. 4.0.0.0 onlysearch
               if ( bLkpOnlySearch ) and ( pClearLkpOnlySearch ) then
               begin
                  LkpDBEdit.Tag := -1234567;
                  LkpDBEdit.Text := '';
               end;

               if pSQLDetail = nil then
               begin
                  // v. 4.0.0.0 onlysearch
                  if not bLkpOnlySearch then
                     iLkpPkValue := pSQLMaster.FieldByName( LkpDBCod.DataField ).AsInteger
                  else
                     iLkpPkValue := LkpDBEdit.Tag; //StrTointDef( rc_GetHintProperty( 'lkppkvalue:', LkpDBEdit.Hint ), -1234567 );//LkpDBCod.Tag;
                  TFDQuery( LkpDBEdit.DataSource.DataSet ).ParamByName( 'table_pk' ).AsInteger := iLkpPkValue;

                  dm_rc.rc_OpenQuery( TFDQuery( LkpDBEdit.DataSource.DataSet ) );
                  // v. 4.0.0.0 onlysearch
                  //if ( pSQLMaster.FieldByName( LkpDBCod.DataField ).AsInteger < 0 ) and ( pSQLMaster.state in [ dsEdit, dsInsert] ) then
                  if ( iLkpPkValue < 0 ) then
                  begin
                      if ( not bLkpOnlySearch ) then
                      begin
                         if ( pSQLMaster.state in [ dsEdit, dsInsert] ) then
                            pSQLMaster.FieldByName( LkpDBCod.DataField ).Clear;
                      end
                      else
                      begin
                         LkpDBEdit.Tag := -1234567;
                         LkpDBEdit.Text := '';
                      end;
                  end
                  else
                  begin
                      // v. 4.0.0.0
                      // getsearchfield
                      cTemp := rc_GetHintProperty( 'getsearchfield:', LkpDBEdit.Hint );
                      if ( cTemp <> '' ) then
                      begin
                           iPos := Pos( '+', cTemp);
                           if iPos > 0 then
                           begin
                              LkpName_DataField_Concat := Trim( Copy( cTemp, iPos + 1, 100 ) );
                              cTemp                    := Trim( Copy( cTemp, 1, iPos - 1 ) );
                              LkpDBEdit.Text :=
                                  VarToStrDef( TFDQuery( LkpDBEdit.DataSource.DataSet ).FieldByName( cTemp ).Value, '' ) + ' ' +
                                  VarToStrDef( TFDQuery( LkpDBEdit.DataSource.DataSet ).FieldByName( LkpName_DataField_Concat ).Value, '' );                           end
                           else
                           begin
                              LkpName_DataField_Concat := cTemp;
                              LkpDBEdit.Text :=
                                   VarToStrDef( TFDQuery( LkpDBEdit.DataSource.DataSet ).FieldByName( LkpName_DataField_Concat ).Value, '' );
                           end;
                      end
                      else
                      // concatenar campos
                      if ( strTokenCount( LkpDBEdit.Hint , '+' ) > 2 ) then
                      begin
                           iPos := Pos( '+', LkpDBEdit.Hint );
                           LkpName_DataField_Concat := Trim( Copy( LkpDBEdit.Hint, iPos + 1, 100 ) );
                           LkpName_DataField_Concat := Trim( Copy( LkpName_DataField_Concat, 1, Pos( ' ', LkpName_DataField_Concat ) ) );

                           LkpDBEdit.Text :=
                               VarToStrDef( TFDQuery( LkpDBEdit.DataSource.DataSet ).FieldByName( LkpDBEdit.DataField ).Value, '' ) + ' ' +
                               VarToStrDef( TFDQuery( LkpDBEdit.DataSource.DataSet ).FieldByName( LkpName_DataField_Concat ).Value, '' );
                      end;
                      // v. 3.3.0.3
                      if Pos( 'rcblock', lowercase( LkpDBEdit.Parent.Name ) ) = 0 then
                         LkpDBEdit.SetFocus;
                  end;
               end
               else
               begin
                  TFDQuery( LkpDBEdit.DataSource.DataSet ).ParamByName( 'table_pk' ).AsInteger := pSQLDetail.FieldByName( LkpDBCod.DataField ).AsInteger;
                  dm_rc.rc_OpenQuery( TFDQuery( LkpDBEdit.DataSource.DataSet ) );
                  // v. 3.2.0.1...
                  if ( pSQLDetail.FieldByName( LkpDBCod.DataField ).AsInteger < 0 ) and ( pSQLDetail.state in [ dsEdit, dsInsert] ) then
                      pSQLDetail.FieldByName( LkpDBCod.DataField ).Clear
                  else
                  begin
                      // v. 3.3.0.3
                      if Pos( 'rcblock', lowercase( LkpDBEdit.Parent.Name ) ) = 0 then
                         LkpDBEdit.SetFocus;
                  end;
               end;
            except on e:exception do
                   begin
                      cTemp := e.Message;

                      // o erro ocorreu no rc_OpenQuery...
                      if cTemp = 'Operation aborted' then
                         cTemp := mm.varC_LastErrorMsg;

                      if LkpDBCod.DataField = '' then
                      begin
                         rc_ShowError( '<h2>LookUps Update Failed !</h2><br>' +
                                       '<strong>MESSAGE</strong><br><hr>' +
                                       '<strong>Msg: </strong>' + cTemp +  '<br><br>' +
                                       '<strong>LkpDBCod: </strong>' + LkpDBCod.name + ' DATAFIELD not declared( LISTFIELD__DATAFIELD )!' + '<br><br>' +
                                       mm.MSG_CONTACT_SUPPORT);
                      end
                      else
                      if pSQLMaster.FieldByName( LkpDBCod.DataField ).DataType <> ftInteger then
                      begin
                         rc_ShowError( '<h2>LookUps Update Failed !</h2><br>' +
                                       '<strong>MESSAGE</strong><br><hr>' +
                                       '<strong>Msg: </strong>' + cTemp +  '<br><br>' +
                                       '<strong>LkpDBCod: </strong>' + LkpDBCod.name + ' ( keyfield ) is not INTEGER!' + '<br><br>' +
                                       mm.MSG_CONTACT_SUPPORT);
                      end
                      else
                         rc_ShowError( '<h2>LookUps Update Failed !</h2><br>' +
                                       '<strong>MESSAGE</strong><br><hr>' +
                                       '<strong>Msg: </strong>' + cTemp +  '<br><br>' +
                                       '<strong>LkpDBEdit: </strong>' + LkpDBEdit.name + ' possibly without linked DATASOURCE or DATAFIELD!' + '<br><br>' +
                                       mm.MSG_CONTACT_SUPPORT);
                   end;
            end;

            if pLkp <> nil then
               Break;
         end;
      end ;

    end;
end;

procedure tdm_rc.rc_SearchPostalCodeCEP( pCep, pType, pFormFrame : string ; pQry : TFDQuery );
begin
  pCep := Trim( ReturnNumbers( pCep ) );
  if pCep <> '' then
  begin
     UniSession.JSCode( '$.getJSON("https://viacep.com.br/ws/' + pCep + '/json/?callback=?", ' +
                        '       function(dados) {' +
                        '       if (!("erro" in dados)) {' +
                        '          ajaxRequest( ' + MainForm.htmlFrame.JSName + ' , "_DadosCep", ' +
                        '                       ["rua=" + dados.logradouro, ' +
                        '                       "bairro=" + dados.bairro, ' +
                        '                       "cidade=" + dados.localidade, ' +
                        '                       "uf=" + dados.uf, ' +
                        '                       "ibge=" + dados.ibge, ' +
                        '                       "gia=" + dados.gia ,' +
                        '                       "form=" + ' + QuotedStr( pFormFrame ) + ', ' +
                        '                       "qry=" + ' + QuotedStr( pQry.Name ) + ', ' +
                        '                       "tipocep=" + ' + QuotedStr( pType ) + // v. 3.0.0.0
                        '                       ]);' +
                        '       } ' +
                        '       else {' +
                        '           ajaxRequest( ' + MainForm.htmlFrame.JSName + ' , "_DadosCepErro", []);'+
                        '       }' +
                        '});' );
  end;
end;
// v. 3.0.0.0
// se clicar no OK de uma mensagem..o retorno perde o foco
procedure tdm_rc.rc_SetFocus(pObj: TObject);
begin
     try
        UniSession.AddJS('setTimeout(function(){' + TuniControl( pObj ).JSName + '.focus()}, 100)');
     except on e:exception do
            begin
                 rc_ShowError('rc_SetFocus failed. <br> See which component was used.');
            end;
     end;
end;
// v. 3.2.0.5
function tdm_rc.rc_PrepareDetailForm(pForm: TObject; pTable_Detail, pCode_ID_Field, pTitle: string): integer;
// v. 3.2.0..7
var
   pGrid : TUniDBGrid;
   pQry : TFDQuery;
   cTitle : string;
begin
  if Pos( '(', pTitle ) > 0 then
  begin
       cTitle := Copy( pTitle, Pos( '(', pTitle ) + 1, 200 );
       cTitle := CopY( ctitle, 1, length( cTitle ) - 1 );
  end;
  // 4.0.0.1
  If true then //dm_rc.rc_PermissionVerify( cTitle ,
               //                 Trim( pTable_Detail ) ,
               //                 PT_ACCESS ) then
  begin
     pQry      := TFDQuery( TComponent(pForm).FindComponent( 'sqlMaster' ) );
     pGrid     := TUniDBGrid( TComponent(pForm) .FindComponent( 'dbgSearchCRUD' ) );
     pGrid.Tag := StrToIntDef( pGrid.DataSource.DataSet.FieldByName( TUniEdit( TComponent(pForm).FindComponent( 'ed_PK' ) ).Text ).AsString , 0 ) ;

     Result    := pGrid.Tag;

     if Result > 0 then
     begin
         pQry.Cancel;
         pQry.close;
         // registro PAI( MESTRE )
         pQry.ParamByName( 'table_pk' ).AsInteger := pGrid.Tag;

         rc_OpenQuery( pQry );

         // para uso futuro do GERADOR de SELECTs..INSERTs...
         mm.varC_Table_Detail := pTable_Detail;

         // para uso no Form Filho ( ed_CodMASTER: frmBaseCRUDDetail )
         mm.varC_Code_ID      := pGrid.Tag.ToString;
         mm.varC_Code_ID_Field:= pCode_ID_Field;

         // para uso em: TfrmBaseCRUDDetail.UniFormCreate
         mm.varC_Frame_Master := TUniFrame(pForm);

         // preencher o titulo do form filho dinamicamente
         mm.varC_Selected_FormFrame_Detail := pTitle;
     end
     else
         rc_ShowMessage( mm.MSG_SELECT_VALID_RECORD ); // v. 3.0.0.0
  end
  else
      Result := 0;
end;
// v. 4.0.0.0
procedure tdm_rc.rc_FillComboBox( pCbx: TObject; pTable, pField, pWhere: String; pFiles : string );
var
   i, iIndex : integer;
   cText  : string;
   cTemp : string;
   vSR: TSearchRec;
begin
    if pFiles = '' then
    begin
       cText := TUniComboBox( pCbx ).Text;
       sqlGetDataSet.Close;
       sqlGetDataSet.sql.Text := ' select ' + pField + ' from ' + pTable + pWhere + ' order by ' + pField;
       rc_OpenQuery( sqlGetDataSet );

       i := 0;
       TUniComboBox( pCbx ).Clear;
       while not sqlGetDataSet.Eof do
       begin
             TUniComboBox( pCbx ).Items.Add( sqlGetDataSet.FieldByName( pField ).AsString );
             if cText = sqlGetDataSet.FieldByName( pField ).AsString then
             begin
                iIndex := i;
             end;
             sqlGetDataSet.Next;
             Inc( i );
       end;
       sqlGetDataSet.close;
    end
    else
    begin
       rc_ComboBoxGetFiles( TUniCombobox(pCbx), pFiles, pWhere );
    end;

    TUniComboBox( pCbx ).ItemIndex := iIndex;
end;
// v. 3.0.0.0
function tdm_rc.rc_SaveBlobImg(pImg: TUniImage; pPng : Boolean; pTable, pField, pWhere: string): Boolean;
var
   BlobStream: TStream;
   PngImage : TPngImage;
begin
   // v. 3.2.0..7
   PngImage := nil;

   Result := True;

   Try
      BlobStream := TMemoryStream.Create;
      Try
          if not pPng then
             //pImg.Picture.Savetostream( BlobStream )
             pImg.Picture.Graphic.SaveToStream( BlobStream )
          else
          begin
             PngImage := TPngImage.Create;
             PngImage.LoadFromFile( sm.CacheFolderPath + Copy( ExtractFileName( pImg.CurrImgUrl ), 2, 500 ) );//  Assign( pImg );
             PngImage.SaveToStream( BlobStream );
             //TGraphic( PngImage ).LoadFromStream(...)
          end;

          sqlDS.SQL.Text := ' Update ' + pTable +
                            ' Set ' + pField + ' = :pblob ' +
                            pWhere;

          sqlDS.Connection.StartTransaction;
          try
            sqlDS.ParamByName('pblob').SetStream( BlobStream, ftBlob, false);

            sqlDS.ExecSQL;
            sqlDS.Connection.Commit;
          except
            on E: Exception do
            begin
              sqlDS.Connection.Rollback;
              rc_ShowError( 'Failed to save image!' + sLineBreak + sLineBreak + E.Message  ); // v. 3.0.0.0
            end;
          end;

          sqlDS.close;
      Finally
             if pPng then
                PngImage.Free;

             BlobStream.Free;
      End;
   Except On e:exception do
          begin
               Result := False;
               rc_ShowError('Failed to Save BLOB:' + e.Message); // v. 3.0.0.0
          end;

   End;
end;

function tdm_rc.rc_LoadBlobImg(pImg: TUniImage; pPng: Boolean; pQuery : TFDQuery; pField : string): Boolean;
var
   JpegImage: TJPEGImage;
   PngImage: TPngImage;
   BlobStream: TStream;
begin
     Result := True;

     JpegImage := nil;
     PngImage  := nil;

     try
        if not( pQuery.FieldByName( pField ).IsNull ) then
        begin
            BlobStream := pQuery.CreateBlobStream( pQuery.FieldByName( pField ), bmRead );

            if not pPng then
            begin
               JpegImage := TJPEGImage.Create;
               try
                 JpegImage.LoadFromStream(BlobStream);
                 pImg.Picture.Assign( JpegImage );
               finally
                 JpegImage.Free;
               end;
            end
            else
            begin
               PngImage := TPngImage.Create;
               try
                 PngImage.LoadFromStream(BlobStream);
                 pImg.Picture.Assign( PngImage );
               finally
                 PngImage.Free;
               end;
            end;

            BlobStream.Free;
        end
        else
        begin
             pImg.Picture.Assign(nil);
        end;
     except on e:exception do
            begin
                 Result := False;
                 rc_ShowError('Failed to Load BLOB:' + e.Message ); // v. 3.0.0.0
            end;
     end;
end;
// v. 3.0.0.0
function tdm_rc.rc_LoadConfig : integer;
var
   varDefault : Variant;
   Inifile : TIniFile;
   pNum : integer;
begin
      // v. 3.2.0..7
      Inifile := nil;
      pNum    := 1;
      // Config FILE: "APP_NAME"_Cfg.ini   IniFile := TiniFile.Create( mm.APP_PATH_FILES_GLOBAL + StringReplace( StrTokenClear( APP_NAME ), ' ', '', [rfReplaceAll] ) + '_cfg.ini'  ); // renamed from '_lastaccess'
      try
        mm.varC_Temp1 := StringReplace( StrTokenClear( APP_NAME ), ' ', '', [rfReplaceAll] );
        mm.varC_Temp1 := sm.FilesFolderPath + mm.varC_Temp1 + '_cfg.ini'; // v. 3.1.0.60

        IniFile := TIniFile.Create( mm.varC_Temp1 );

        varDefault := IniFile.ReadString( 'App', 'session_log', '1' );
        // Generate LOG
        mm.CONFIG_SESSION_LOG := ( varDefault = '1' );
        // App
        mm.CONFIG_APP_TYPE            := lowercase( IniFile.ReadString( 'App', 'type', 'default') );
        mm.CONFIG_APP_SUBTYPE         := IniFile.ReadString( 'App', 'subtype', '');
        mm.CONFIG_LANGUAGE            := IniFile.ReadString( 'App', 'language', '');

        if ( mm.CONFIG_LANGUAGE = '' ) or ( mm.CONFIG_LANGUAGE = '[Auto]' ) or
           ( not AnsiMatchStr( mm.CONFIG_LANGUAGE , ARRAY_LANGUAGES ) ) then
        begin
           mm.CONFIG_LANGUAGE := sm.ExtLocale;
           if mm.CONFIG_LANGUAGE = '[Auto]' then
           begin
              mm.CONFIG_LANGUAGE := UniSession.Language;

              if mm.CONFIG_LANGUAGE = '' then
                 mm.CONFIG_LANGUAGE := 'pt_BR';
           end;
        end;
        // v. 3.3.3.2
        // Currency
        mm.CONFIG_CURRENCY_SYMBOL      := IniFile.ReadString( 'App', 'currency', 'R$');
        mm.CONFIG_CURRENCY_NAME        := IniFile.ReadString( 'App', 'currency', 'Real');
        mm.CONFIG_CURRENCY_NAME_PLURAL := IniFile.ReadString( 'App', 'currency', 'Reais');

        mm.varLT_Lang := TRCLanguagesType( dm_rc.rc_GetIndexFromArray( mm.CONFIG_LANGUAGE, ARRAY_LANGUAGES ) );
        //( feedback mohamed ammar )// v. 3.1.0.63
        mm.RTL := ( mm.varLT_Lang = ltar_SA );
        // Database
        mm.CONFIG_DATABASE_FIREDAC   := IniFile.ReadString( 'DataBase', 'dbms', 'FIREBIRD');
        mm.CONFIG_DATABASE_HOST_IP   := IniFile.ReadString( 'DataBase', 'ip', '127.0.0.1');
        mm.CONFIG_DATABASE_PORT      := StrToIntDef( IniFile.ReadString( 'DataBase', 'port', '3050'), 3050);
        mm.CONFIG_DATABASE_USERNAME  := IniFile.ReadString( 'DataBase', 'user', 'sysdba');
        mm.CONFIG_DATABASE_PASSWORD  := IniFile.ReadString( 'DataBase', 'password', 'masterkey');
        mm.CONFIG_DATABASE_NAME      := IniFile.ReadString( 'DataBase', 'dbname', 'rc_db.fdb'); // sqlite must have ".db" extension
        mm.DATABASE_ACTIVE           := '';
        // Email
        mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER              := IniFile.ReadString ( 'Email', 'email'    , SOFTWAREHOUSE_SUPPORT_EMAIL ); // v. 3.3.2.0
        mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_HOST         := IniFile.ReadString ( 'Email', 'host'     , 'smtp.gmail.com' );
        mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_SMTP_PORT    := IniFile.ReadString ( 'Email', 'smtpport' , '587' );
        mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_USER         := IniFile.ReadString ( 'Email', 'user'     , SOFTWAREHOUSE_SUPPORT_EMAIL ); // v. 3.3.2.0
        mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_PASS         := IniFile.ReadString ( 'Email', 'password' , '1234' );
        mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_CONFIRMATION := IniFile.ReadString ( 'Email', 'confirm'  , mm.VALUE_YES );
        mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_THREAD       := IniFile.ReadString ( 'Email', 'thread'   , mm.VALUE_NO );
        mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_TLS          := IniFile.ReadString ( 'Email', 'tls'      , '0' ); // v. 3.3.1.0 bug#1
        mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_SSL          := IniFile.ReadString ( 'Email', 'ssl'      , '0' ); // v. 3.3.1.0 bug#1
        // Layout
        mm.CONFIG_LAYOUT_ACTIVE_THEME                     := IniFile.ReadString( 'Layout', 'active', 'blue');

        pNum := StrToIntDef( IniFile.ReadString( 'App', 'loginBg', '1'), 1);
        Inc(pNum);
      finally
        IniFile.Free;
        Result := pNum;
      end;
end;
// v. 4.0.0.0
procedure tdm_rc.rc_LoadTheme(pName: String);
// v. 3.2.0..7
var
   Inifile : TIniFile;
   cGridLayout, // v. 4.0.0.0
   cLabelColor : string;
begin
      // v. 3.2.0..7
      Inifile := nil;
      try
        if pName = '' then
           pName := 'active'; // v. 3.2.0.0

        pName := pName.ToLower;

        IniFile := TiniFile.Create( sm.FilesFolderPath + 'themes' + BACKSLASH + 'theme_' + lowercase(pName) + '.ini'); // v. 3.1.0.60
        //controle de cores
        mm.CONFIG_LAYOUT_MENU_COLOR              := IniFile.ReadString('Colors' , 'menu_color'       , '$00373737') ;
        mm.CONFIG_LAYOUT_MENUFONT_COLOR          := IniFile.ReadString('Colors' , 'menufont_color'   , '$00FDFFFF') ;

        if mm.CONFIG_LAYOUT_MENUFONT_COLOR = 'clWhite' then
           mm.CONFIG_LAYOUT_MENUFONT_COLOR := '$00FDFFFF';

        mm.CONFIG_LAYOUT_MENU_LOGO_BG_COLOR      := IniFile.ReadString('Colors' , 'menu_logo_color_bg'       , '$00373737') ;
        mm.CONFIG_LAYOUT_MENU_LOGO_FONT_COLOR    := IniFile.ReadString('Colors' , 'menu_logo_color_font'   , '$00ADB3B8') ;

        mm.CONFIG_LAYOUT_LOGIN_COLOR             := IniFile.ReadString('Colors' , 'login_color'      , '$00373737') ;

        mm.CONFIG_LAYOUT_LABEL_COLOR             := IniFile.ReadString('Colors' , 'label_color'      , '$00000000') ;

        mm.CONFIG_LAYOUT_BUTTON_COLOR            := IniFile.ReadString('Colors' , 'button_color'     , '$00363636') ;
        mm.CONFIG_LAYOUT_BUTTON_COLOR_CRUD       := IniFile.ReadString('Colors' , 'button_color_crud', '$00363636') ;

        mm.CONFIG_LAYOUT_BUTTON_COLOR_HOVER      := IniFile.ReadString('Colors' , 'button_color_hover'     , '$00303030') ;
        mm.CONFIG_LAYOUT_BUTTON_COLOR_CRUD_HOVER := IniFile.ReadString('Colors' , 'button_color_crud_hover', '$00303030') ;

        mm.CONFIG_LAYOUT_EDIT_FOCUS_COLOR        := IniFile.ReadString('Colors' , 'edit_focus_color' , '$00FFFFE0') ;
        mm.CONFIG_LAYOUT_EDIT_COLOR              := IniFile.ReadString('Colors' , 'edit_color'      , '$00FFFFFF') ; // v. 4.0.0.0
        mm.CONFIG_LAYOUT_EDIT_FONT_COLOR         := IniFile.ReadString('Colors' , 'edit_font_color'      , '$00000000') ; // v. 4.0.0.0
        mm.CONFIG_LAYOUT_EDIT_COLOR_READONLY     := IniFile.ReadString('Colors' , 'edit_color_readonly'      , '$00D0D0D0') ; // v. 4.0.0.0
        mm.CONFIG_LAYOUT_EDIT_FONT_COLOR_READONLY:= IniFile.ReadString('Colors' , 'edit_font_color_readonly'      , '$00000000') ; // v. 4.0.0.0
        mm.CONFIG_LAYOUT_EDIT_COLOR_TRIGGER      := IniFile.ReadString('Colors' , 'edit_color_trigger'      , '$00FFFFFF') ; // v. 4.0.0.0
        mm.CONFIG_LAYOUT_EDIT_FONT_COLOR_TRIGGER := IniFile.ReadString('Colors' , 'edit_font_color_trigger' , '$00d0d0d0') ; // v. 4.0.0.0

        mm.CONFIG_LAYOUT_GRID_SEL_COLOR          := IniFile.ReadString('Colors' , 'grid_sel_color' , '$00FFFFE0') ;
        // v. 4.0.0.0
        mm.CONFIG_LAYOUT_GRID_TITLE_BG           := IniFile.ReadString('Colors' , 'grid_title_bg'  , '$00e8e3de' ) ;
        mm.CONFIG_LAYOUT_GRID_TITLE_COLOR        := IniFile.ReadString('Colors' , 'grid_title_color' ,'$00919191' ) ;
        mm.CONFIG_LAYOUT_GRID_TITLE_BG_OVER      := IniFile.ReadString('Colors' , 'grid_title_bg_over'  , '$00e8e3de' ) ;
        mm.CONFIG_LAYOUT_GRID_TITLE_COLOR_OVER   := IniFile.ReadString('Colors' , 'grid_title_color_over' ,'$00919191' ) ;//dee3e8
        mm.CONFIG_LAYOUT_GRID_TITLE_COLOR_ICON   := IniFile.ReadString('Colors' , 'grid_title_color_icon' ,'$00919191' ) ;

        mm.CONFIG_LAYOUT_EDLKP_COLOR             := IniFile.ReadString('Colors' , 'edlkp_color'      , '$00B5E4FF') ;
        mm.CONFIG_LAYOUT_EDLKP_FONT_COLOR        := IniFile.ReadString('Colors' , 'edlkp_font_color' , '$00000000') ;

        mm.CONFIG_LAYOUT_BG_COLOR                := IniFile.ReadString('Colors' , 'bg_color' , '$00EAEAEA') ;
        mm.CONFIG_LAYOUT_LINK_COLOR              := IniFile.ReadString('Colors' , 'link_color' , '$0051B5F7') ;
        mm.CONFIG_LAYOUT_LINKHOVER_COLOR         := IniFile.ReadString('Colors' , 'linkhover_color' , '$0051B5F7') ;
      finally
        IniFile.Free;
      end;
      // v. 4.0.0.0
      mm.varC_Temp1 := StringReplace( StrTokenClear( APP_NAME ), ' ', '', [rfReplaceAll] );
      mm.varC_Temp1 := sm.FilesFolderPath + mm.varC_Temp1 + '_cfg.ini'; // v. 3.1.0.60
      IniFile := TIniFile.Create( mm.varC_Temp1 );
        mm.CONFIG_LAYOUT_ROUND_FORM              := IniFile.ReadString('Layout' , 'round_form' , 'ON') ;
        mm.CONFIG_LAYOUT_ROUND_EDIT              := IniFile.ReadString('Layout' , 'round_edit' , 'ON') ;
        mm.CONFIG_LAYOUT_ROUND_EDIT_FACTOR       := IniFile.ReadString('Layout' , 'round_edit_factor' , '4') ;
        mm.CONFIG_LAYOUT_ROUND_PANEL_FACTOR      := IniFile.ReadString('Layout' , 'round_panel_factor' , '4') ;
        mm.CONFIG_LAYOUT_ROUND_BTN_FACTOR        := IniFile.ReadString('Layout' , 'round_btn_factor' , '4') ;

        mm.CONFIG_LAYOUT_USER_BG                 := IniFile.ReadString('Layout' , 'user_bg' , 'OFF') ;
        mm.CONFIG_LAYOUT_LABEL_WRAP              := IniFile.ReadString('Layout' , 'label_wrap' , 'ON') ;
        mm.CONFIG_LAYOUT_LABEL_WEIGHT            := IniFile.ReadString('Layout' , 'label_weight' , '300') ; // v. 4.0.0.0
        mm.CONFIG_LAYOUT_LABEL_FORMS_DEFAULT     := IniFile.ReadString('Layout' , 'label_forms_default' , 'ON') ;
        mm.CONFIG_LAYOUT_GRIDBLOCK_OFFSET        := IniFile.ReadString('Layout' , 'gridblock_offset' , '15') ;
        mm.CONFIG_LAYOUT_GRIDBLOCK_ANIM          := IniFile.ReadString('Layout' , 'gridblock_anim' , 'ON') ;
        mm.CONFIG_LAYOUT_MENUFONT_SIZE           := IniFile.ReadString('Layout' , 'menufont_size' , '12') ;
        // v. 4.0.0.6
        mm.CONFIG_LAYOUT_MENU_TYPE               := IniFile.ReadString('Layout' , 'menu_type' , '1') ;
        mm.CONFIG_LAYOUT_MENU_TYPE               := varIIF( mm.CONFIG_LAYOUT_MENU_TYPE = '1', '1', '3' );

        mm.CONFIG_LAYOUT_APP_FONT                := IniFile.ReadString('Font'   , 'app_font'   , 'Exo' ) ;
        mm.CONFIG_LAYOUT_APPLY_FONT_ALL          := IniFile.ReadString('Font' , 'font_all' , 'ON') ;

        mm.CONFIG_LAYOUT_TAB_BACKGROUND_DEFAULT  := '$00373737';
        mm.CONFIG_LAYOUT_TAB_COLOR_FOCUS         := varIIF( IniFile.ReadString('Colors' , 'tab_color_focus' , 'N') = 'S', mm.CONFIG_LAYOUT_BUTTON_COLOR_CRUD, '$00FFFFFF' ); // v. 3.3.3.0
        mm.CONFIG_LAYOUT_TAB_COLOR_HOVER         := '$00DDDDDD';
        mm.CONFIG_LAYOUT_TAB_MAX_OPENED          := IniFile.ReadString('Layout' , 'tabs_max_open' , '10') ; // v. 3.1.0.61
        mm.CONFIG_LAYOUT_TAB_OFF                 := IniFile.ReadString('Layout' , 'tabs_off' , 'OFF') ; // v. 3.2.0.4
        // v. 4.0.0.0
        mm.CONFIG_LAYOUT_LOADMASK_IMG            := IniFile.ReadString('Layout' , 'loadmaskfile' , 'files/images/loaders/dash-circle-2.svg') ;
        mm.CONFIG_LAYOUT_LOADMASK_TYPE           := IniFile.ReadString('Layout' , 'loadmasktype' , '') ;
        mm.CONFIG_LAYOUT_GRID_TITLE_BOLD         := IniFile.ReadString('Layout' , 'grids_title_bold' , 'ON') ;
        mm.CONFIG_LAYOUT_GRID_TITLE_UPPER        := IniFile.ReadString('Layout' , 'grids_title_upper' , 'OFF') ;
        mm.CONFIG_LAYOUT_SCROLLBAR_SIZE          := IniFile.ReadString('Layout' , 'scroll_bar_size' , '8') ;
        mm.CONFIG_LAYOUT_GRID_COLUMN_SEPARATOR   := IniFile.ReadString('Layout' , 'grid_column_separator' ,'OFF' ) ;
        mm.CONFIG_LAYOUT_GRID_ROW_HEIGHT         := IniFile.ReadString('Layout' , 'grid_row_height' ,'38' ) ;
        mm.CONFIG_LAYOUT_GRID_RC_PAGINATOR       := IniFile.ReadString('Layout' , 'grid_rc_paginator' ,'OFF' ) ;

      IniFile.Free;

      // configure your settings
      case mm.varLT_Lang of
           ltpt_BR : begin
                       sm.ConnectionFailureRecovery.ErrorMessage := 'Erro na Conexão';
                       sm.ConnectionFailureRecovery.RetryMessage := 'Tentando Novamente...';
                       mm.ServerMessages.InvalidSessionMessage   := 'Sessão Inválida ou tempo de sessão expirado';
                       //mm.ServerMessages.LoadingMessage          := 'Carregando...';
                       mm.ServerMessages.TerminateMessage        := 'Sessão Finalizada';
                       mm.ServerMessages.UnavailableErrMsg       := 'Erro de Comunicação';

                       PFmtSettings.DateSeparator                := '/';
                       PFmtSettings.CurrencyFormat               := 0;
                       PFmtSettings.CurrencyString               := 'R$';
                       PFmtSettings.ShortDateFormat              := 'dd/MM/yyyy';//'dd/mm/yyyy';
                       // v. 3.1.0.63
                       PFmtSettings.ThousandSeparator            := '.';
                       PFmtSettings.DecimalSeparator             := ',';
                       mm.varC_Mask_float                        := PFmtSettings.ThousandSeparator + '0' + PFmtSettings.DecimalSeparator + '0##'; // v. 3.2.0.0
                    end;
           lten_US: begin
                    sm.ConnectionFailureRecovery.ErrorMessage := 'Connection error';
                    sm.ConnectionFailureRecovery.RetryMessage := 'Retrying ...';
                    mm.ServerMessages.InvalidSessionMessage   := 'Invalid session or session time expired';
                    //mm.ServerMessages.LoadingMessage          := 'Loading ...';
                    mm.ServerMessages.TerminateMessage        := 'Session Ended';
                    mm.ServerMessages.UnavailableErrMsg       := 'Communication Error';

          //          PFmtSettings.DateSeparator             := '/';
          //          PFmtSettings.CurrencyFormat            := 0;
                    PFmtSettings.CurrencyString            := 'US$';
                    PFmtSettings.ShortDateFormat           := 'MM/dd/yyyy';
                    // v. 3.2.0.0
                    PFmtSettings.ThousandSeparator            := ',';
                    PFmtSettings.DecimalSeparator             := '.';
                    mm.varC_Mask_float                        := PFmtSettings.ThousandSeparator + '0' + PFmtSettings.DecimalSeparator + '00##';
                  end;
           // v. 3.3.0.0
           lten_GB: begin
                    sm.ConnectionFailureRecovery.ErrorMessage := 'Connection error';
                    sm.ConnectionFailureRecovery.RetryMessage := 'Retrying ...';
                    mm.ServerMessages.InvalidSessionMessage   := 'Invalid session or session time expired';
                    //mm.ServerMessages.LoadingMessage          := 'Loading ...';
                    mm.ServerMessages.TerminateMessage        := 'Session Ended';
                    mm.ServerMessages.UnavailableErrMsg       := 'Communication Error';

          //          PFmtSettings.DateSeparator             := '/';
          //          PFmtSettings.CurrencyFormat            := 0;
                    PFmtSettings.CurrencyString            := '£';
                    PFmtSettings.ShortDateFormat              := 'dd/MM/yyyy';//'dd/mm/yyyy';
                    // v. 3.1.0.63
                    PFmtSettings.ThousandSeparator            := '.';
                    PFmtSettings.DecimalSeparator             := ',';
                    mm.varC_Mask_float                        := PFmtSettings.ThousandSeparator + '0' + PFmtSettings.DecimalSeparator + '0##'; // v. 3.2.0.0
                  end;
           ltes_ES: begin
                    sm.ConnectionFailureRecovery.ErrorMessage := 'Error de conexión';
                    sm.ConnectionFailureRecovery.RetryMessage := 'Reintentando ...';
                    mm.ServerMessages.InvalidSessionMessage   := 'Sesión inválida o tiempo de sesión expirado';
                    //mm.ServerMessages.LoadingMessage          := 'Cargando ...';
                    mm.ServerMessages.TerminateMessage        := 'Sesión finalizada';
                    mm.ServerMessages.UnavailableErrMsg       := 'Error de comunicación';

          //         PFmtSettings.DateSeparator             := '/';
          //         PFmtSettings.CurrencyFormat            := 0;
          //         PFmtSettings.CurrencyString            := 'R$';
                    PFmtSettings.ShortDateFormat           := 'd/m/y';

                    PFmtSettings.ThousandSeparator            := ',';
                    PFmtSettings.DecimalSeparator             := '.';
                    mm.varC_Mask_float                        := PFmtSettings.ThousandSeparator + '0' + PFmtSettings.DecimalSeparator + '0##'; // v. 3.2.0.0
                  end;
           ltfr_FR: begin
                     sm.ConnectionFailureRecovery.ErrorMessage := 'Erreur de connexion';
                     sm.ConnectionFailureRecovery.RetryMessage := 'Réessayer...';
                     mm.ServerMessages.InvalidSessionMessage   := 'Session invalide pour la durée de session expirée';
                     //mm.ServerMessages.LoadingMessage          := 'Chargement...';
                     mm.ServerMessages.TerminateMessage        := 'Session terminée';
                     mm.ServerMessages.UnavailableErrMsg       := 'Erreur de communication';

          //         PFmtSettings.DateSeparator             := '/';
          //         PFmtSettings.CurrencyFormat            := 0;
          //         PFmtSettings.CurrencyString            := 'R$';
                    PFmtSettings.ShortDateFormat           := 'd/m/y';

                    PFmtSettings.ThousandSeparator            := ',';
                    PFmtSettings.DecimalSeparator             := '.';
                    mm.varC_Mask_float                        := PFmtSettings.ThousandSeparator + '0' + PFmtSettings.DecimalSeparator + '0##'; // v. 3.2.0.0
                  end;
           ltde_DE: begin
                     sm.ConnectionFailureRecovery.ErrorMessage := 'Verbindungsfehler';
                     sm.ConnectionFailureRecovery.RetryMessage := 'Wiederholen ...';
                     mm.ServerMessages.InvalidSessionMessage   := 'Ungültige Sitzung für abgelaufene Sitzungszeit';
                     //mm.ServerMessages.LoadingMessage          := 'Wird geladen ...';
                     mm.ServerMessages.TerminateMessage        := 'Sitzung beendet';
                     mm.ServerMessages.UnavailableErrMsg       := 'Kommunikationsfehler';

          //         PFmtSettings.DateSeparator             := '/';
          //         PFmtSettings.CurrencyFormat            := 0;
          //         PFmtSettings.CurrencyString            := 'R$';
                     PFmtSettings.ShortDateFormat           := 'd/m/y';

                     PFmtSettings.ThousandSeparator            := ',';
                     PFmtSettings.DecimalSeparator             := '.';
                     mm.varC_Mask_float                        := PFmtSettings.ThousandSeparator + '0' + PFmtSettings.DecimalSeparator + '0##'; // v. 3.2.0.0
                  end;
           ltit_IT: begin
                     sm.ConnectionFailureRecovery.ErrorMessage := 'Errore di connessione';
                     sm.ConnectionFailureRecovery.RetryMessage := 'Riprova in corso...';
                     mm.ServerMessages.InvalidSessionMessage   := 'Sessione non valida per sessione scaduta';
                     //mm.ServerMessages.LoadingMessage          := 'Caricamento in corso...';
                     mm.ServerMessages.TerminateMessage        := 'Sessione terminata';
                     mm.ServerMessages.UnavailableErrMsg       := 'Errore di comunicazione';

          //         PFmtSettings.DateSeparator             := '/';
          //         PFmtSettings.CurrencyFormat            := 0;
          //         PFmtSettings.CurrencyString            := 'R$';
                    PFmtSettings.ShortDateFormat           := 'd/m/y';

                     PFmtSettings.ShortDateFormat           := 'd/m/y';

                     PFmtSettings.ThousandSeparator            := ',';
                     PFmtSettings.DecimalSeparator             := '.';
                     mm.varC_Mask_float                        := PFmtSettings.ThousandSeparator + '0' + PFmtSettings.DecimalSeparator + '0##'; // v. 3.2.0.0
                  end;
           lttr_TR : begin
                     sm.ConnectionFailureRecovery.ErrorMessage := 'Bağlantı hatası';
                     sm.ConnectionFailureRecovery.RetryMessage := 'Yeniden deneniyor...';
                     mm.ServerMessages.InvalidSessionMessage   := 'Süresi dolmuş oturum süresi için geçersiz oturum';
                     //mm.ServerMessages.LoadingMessage          := 'Yükleniyor...';
                     mm.ServerMessages.TerminateMessage        := 'Oturum sonlandırıldı';
                     mm.ServerMessages.UnavailableErrMsg       := 'İletişim hatası';

          //         PFmtSettings.DateSeparator             := '/';
          //         PFmtSettings.CurrencyFormat            := 0;
          //         PFmtSettings.CurrencyString            := 'R$';
                    PFmtSettings.ShortDateFormat           := 'd/m/y';

                     PFmtSettings.ShortDateFormat           := 'd/m/y';

                     PFmtSettings.ThousandSeparator            := ',';
                     PFmtSettings.DecimalSeparator             := '.';
                     mm.varC_Mask_float                        := PFmtSettings.ThousandSeparator + '0' + PFmtSettings.DecimalSeparator + '0##'; // v. 3.2.0.0
                  end;
           ltru_RU : begin
                     sm.ConnectionFailureRecovery.ErrorMessage := 'Ошибка подключения';
                     sm.ConnectionFailureRecovery.RetryMessage := 'Повторная попытка ...';
                     mm.ServerMessages.InvalidSessionMessage   := 'Недействительный сеанс или время сеанса истекло';
                     //mm.ServerMessages.LoadingMessage          := 'Загрузка ...';
                     mm.ServerMessages.TerminateMessage        := 'Сеанс завершен';
                     mm.ServerMessages.UnavailableErrMsg       := 'Ошибка связи';

          //          PFmtSettings.DateSeparator             := '/';
          //          PFmtSettings.CurrencyFormat            := 0;
          //          PFmtSettings.CurrencyString            := 'US$';
                    PFmtSettings.ShortDateFormat           := 'd/m/y';

                     PFmtSettings.ShortDateFormat           := 'd/m/y';

                     PFmtSettings.ThousandSeparator            := ',';
                     PFmtSettings.DecimalSeparator             := '.';
                     mm.varC_Mask_float                        := PFmtSettings.ThousandSeparator + '0' + PFmtSettings.DecimalSeparator + '0##'; // v. 3.2.0.0
                  end;
          ltzn_CH : begin
                    sm.ConnectionFailureRecovery.ErrorMessage := 'Connection error';
                    sm.ConnectionFailureRecovery.RetryMessage := 'Retrying ...';
                    mm.ServerMessages.InvalidSessionMessage   := 'Invalid session or session time expired';
                    //mm.ServerMessages.LoadingMessage          := 'Loading ...';
                    mm.ServerMessages.TerminateMessage        := 'Session Ended';
                    mm.ServerMessages.UnavailableErrMsg       := 'Communication Error';

          //          PFmtSettings.DateSeparator             := '/';
          //          PFmtSettings.CurrencyFormat            := 0;
                    PFmtSettings.CurrencyString            := 'US$';
                    PFmtSettings.ShortDateFormat           := 'MM/dd/yyyy';
                    // v. 3.2.0.0
                    PFmtSettings.ThousandSeparator            := ',';
                    PFmtSettings.DecimalSeparator             := '.';
                    mm.varC_Mask_float                        := PFmtSettings.ThousandSeparator + '0' + PFmtSettings.DecimalSeparator + '00##';
                  end;
          ltin_ID : begin
                    sm.ConnectionFailureRecovery.ErrorMessage := 'Connection error';
                    sm.ConnectionFailureRecovery.RetryMessage := 'Retrying ...';
                    mm.ServerMessages.InvalidSessionMessage   := 'Invalid session or session time expired';
                    //mm.ServerMessages.LoadingMessage          := 'Loading ...';
                    mm.ServerMessages.TerminateMessage        := 'Session Ended';
                    mm.ServerMessages.UnavailableErrMsg       := 'Communication Error';

          //          PFmtSettings.DateSeparator             := '/';
          //          PFmtSettings.CurrencyFormat            := 0;
                    PFmtSettings.CurrencyString            := 'US$';
                    PFmtSettings.ShortDateFormat           := 'MM/dd/yyyy';
                    // v. 3.2.0.0
                    PFmtSettings.ThousandSeparator            := ',';
                    PFmtSettings.DecimalSeparator             := '.';
                    mm.varC_Mask_float                        := PFmtSettings.ThousandSeparator + '0' + PFmtSettings.DecimalSeparator + '00##';
                  end;
          ltth_TH : begin
                    sm.ConnectionFailureRecovery.ErrorMessage := 'Connection error';
                    sm.ConnectionFailureRecovery.RetryMessage := 'Retrying ...';
                    mm.ServerMessages.InvalidSessionMessage   := 'Invalid session or session time expired';
                    //mm.ServerMessages.LoadingMessage          := 'Loading ...';
                    mm.ServerMessages.TerminateMessage        := 'Session Ended';
                    mm.ServerMessages.UnavailableErrMsg       := 'Communication Error';

          //          PFmtSettings.DateSeparator             := '/';
          //          PFmtSettings.CurrencyFormat            := 0;
                    PFmtSettings.CurrencyString            := 'US$';
                    PFmtSettings.ShortDateFormat           := 'MM/dd/yyyy';
                    // v. 3.2.0.0
                    PFmtSettings.ThousandSeparator            := ',';
                    PFmtSettings.DecimalSeparator             := '.';
                    mm.varC_Mask_float                        := PFmtSettings.ThousandSeparator + '0' + PFmtSettings.DecimalSeparator + '00##';
                  end;
          lthi_IN : begin
                    sm.ConnectionFailureRecovery.ErrorMessage := 'Connection error';
                    sm.ConnectionFailureRecovery.RetryMessage := 'Retrying ...';
                    mm.ServerMessages.InvalidSessionMessage   := 'Invalid session or session time expired';
                    //mm.ServerMessages.LoadingMessage          := 'Loading ...';
                    mm.ServerMessages.TerminateMessage        := 'Session Ended';
                    mm.ServerMessages.UnavailableErrMsg       := 'Communication Error';

          //          PFmtSettings.DateSeparator             := '/';
          //          PFmtSettings.CurrencyFormat            := 0;
                    PFmtSettings.CurrencyString            := 'US$';
                    PFmtSettings.ShortDateFormat           := 'MM/dd/yyyy';
                    // v. 3.2.0.0
                    PFmtSettings.ThousandSeparator            := ',';
                    PFmtSettings.DecimalSeparator             := '.';
                    mm.varC_Mask_float                        := PFmtSettings.ThousandSeparator + '0' + PFmtSettings.DecimalSeparator + '00##';
                  end;
          ltar_SA : begin // v. 3.3.0.0
                     sm.ConnectionFailureRecovery.ErrorMessage := 'خطأ في الإتصال';
                     sm.ConnectionFailureRecovery.RetryMessage := 'حاول مجددا ...';
                     mm.ServerMessages.InvalidSessionMessage   := 'انتهت الجلسة أو وقت الجلسة غير صالح';
                     //mm.ServerMessages.LoadingMessage          := 'جار التحميل...';
                     mm.ServerMessages.TerminateMessage        := 'انتهت الجلسة';
                     mm.ServerMessages.UnavailableErrMsg       := 'خطأ في الاتصال';

          //         PFmtSettings.DateSeparator             := '/';
          //         PFmtSettings.CurrencyFormat            := 0;
          //         PFmtSettings.CurrencyString            := 'R$';
                    PFmtSettings.ShortDateFormat           := 'd/m/y';

                    PFmtSettings.ThousandSeparator            := ',';
                    PFmtSettings.DecimalSeparator             := '.';
                    mm.varC_Mask_float                        := PFmtSettings.ThousandSeparator + '0' + PFmtSettings.DecimalSeparator + '0##'; // v. 3.2.0.0
                  end;
      end;
      // v. 4.0.0.0
      //RadCORE - Terminate Template
      with sm.ServerMessages do
      begin
        TerminateTemplate.Text := StringReplace( TerminateTemplate.Text, '[[MSGAPPSESSIONOVER]]', APP_NAME + '-' + TerminateMessage, [rfReplaceAll] );
        TerminateTemplate.Text := StringReplace( TerminateTemplate.Text, '[[MSGSESSIONOVER]]', TerminateMessage, [rfReplaceAll] );
        TerminateTemplate.Text := StringReplace( TerminateTemplate.Text, '[[WEBSITE]]', SOFTWAREHOUSE_SITE, [rfReplaceAll] );
      end;
      // v. 3.3.0.0 - future features
      if Copy( PFmtSettings.ShortDateFormat.ToLower, 1, 1 ) = 'm' then
         mm.APP_SQL_DATE_FORMAT  := 'mm/dd/yyyy'
      else
         mm.APP_SQL_DATE_FORMAT  := 'dd/mm/yyyy';
      if mm.CONFIG_DATABASE_FIREDAC = 'FIREBIRD' then
         mm.APP_SQL_DATE_FORMAT := StringReplace( mm.APP_SQL_DATE_FORMAT, '/', '.', [rfReplaceAll] );

      //mm.varC_Mask_float := PFmtSettings.ThousandSeparator + '0' + PFmtSettings.DecimalSeparator + '0##'; // v. 3.2.0.0

      // CSS
      sm.CustomCSS.Clear;

      // don´t load radcore css if is acessing /server
      if sm.tag = 0 then
      begin
         // v. 4.0.0.0
         mm.varC_TempFile := '';
         if FileExists( sm.FilesFolderPath + 'css' + BACKSLASH + 'servermodule_customcss_userdef.css' ) then
         begin
            sm.CustomCSS.LoadFromFile( sm.FilesFolderPath + 'css' + BACKSLASH + 'servermodule_customcss_userdef.css' );
            mm.varC_TempFile := sm.CustomCSS.Text;
            sm.CustomCSS.Clear;
         end;
         // v. 4.0.0.0
         if FileExists( sm.FilesFolderPath + 'css' + BACKSLASH + 'servermodule_customcss.css' ) then
         begin
            sm.CustomCSS.LoadFromFile( sm.FilesFolderPath + 'css' + BACKSLASH + 'servermodule_customcss.css' );
            // v. 4.0.0.0
            if mm.varC_TempFile <> '' then
            begin
               sm.CustomCSS.Add( mm.varC_TempFile );
            end;
         end;
         // v. 4.0.0.0
         sm.CustomMETA.Clear;
         sm.CustomMETA.Add( '<link rel="preconnect" href="https://fonts.googleapis.com">');
         sm.CustomMETA.Add( '<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>');
         sm.CustomMETA.Add( '<link href="https://fonts.googleapis.com/css2?family=' + StringReplace( mm.CONFIG_LAYOUT_APP_FONT, ' ', '+', [rfReplaceAll] ) + ':ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap" rel="stylesheet">' );

         // v. 3.1.0.63 ammar / raafat feedback
         // RTL TreeMenu
         //     This was (or is) an attempt to apply css for when RTL is active.
         //     I don't understand anything about RTL, but I wanted to make this small attempt.
         //     Maybe it can be an IDEA for someone in need...
         //     I have no way of supporting RTL as it is not natural for me,
         //     I am just trying to help so that everyone can apply the rules correctly.
         if ( not mm.RTL ) then  // You can create an option in THEME CONTROL to ON / OFF.
         begin
             sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text ,
                                                 '[[TREEMENU-RTL]]' ,
                                                 '' ,
                                                 [rfReplaceAll] );
             // Feedbak ammar add Feedbak From Raafat
             sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text ,
                                                 '[[RTL-TEXTALIGN]]' ,
                                                 '' ,
                                                 [rfReplaceAll] );
             sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text ,
                                                 '[[RTL-EXPANDER]]' ,
                                                 '' ,
                                                 [rfReplaceAll] );
             // v. 3.3.0.2
             sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text ,
                                                 '[[RTL-ALIGN-BTN-CAPTION]]' ,
                                                 'margin-left: 5px !important;' ,
                                                 [rfReplaceAll] );
         end
         else
         begin
             // Put your CSS here
             sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text ,
                                                 '[[TREEMENU-RTL]]' ,
                                                 '.x-treelist-nav .x-treelist-item-expander {' +
                                                 '    right: 210px;' +
                                                 '}' +
                                                 '.x-treelist-nav {' +
                                                 '  text-aling: right;' +
                                                 '}' ,
                                                 [rfReplaceAll] );
            // Feedbak ammar add Feedbak From Raafat
            sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text ,
                                                '[[RTL-TEXTALIGN]]' ,
                                                'text-align: right;' ,
                                                [rfReplaceAll] );
            sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text ,
                                                '[[RTL-EXPANDER]]' ,
                                                'right: 210px;' ,
                                                [rfReplaceAll] );
            // v. 3.3.0.2
            sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text ,
                                                '[[RTL-ALIGN-BTN-CAPTION]]' ,
                                                'margin-right: 5px !important;' ,
                                                [rfReplaceAll] );
         end;

         if ( mm.CONFIG_LAYOUT_LABEL_FORMS_DEFAULT = 'ON' ) then
         begin
             cLabelColor := GetWebColor( mm.CONFIG_LAYOUT_LABEL_COLOR );

             sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text ,
                                                 '[[LABEL_FORMS_DEFAULT]]' ,
                                                 'label:not(.form-check-label):not(.custom-file-label):not(.rc-label-clear){ ' + // v. 4.0.0.0
                                                 '     font-weight: ' + mm.CONFIG_LAYOUT_LABEL_WEIGHT + ' !important;' + // v. 4.0.0.0
                                                 '     font-size:12px; ' +
                                                 '     color : ' + cLabelColor + ';' +
                                                 // v. 4.0.0.0
                                                 '   -moz-user-select: -moz-none;' +
                                                 '   -khtml-user-select: none;' +
                                                 '   -webkit-user-select: none;' +
                                                 '   -ms-user-select: none;' +
                                                 '   user-select: none;' +
                                                 //
                                                 '     [[LABEL_WRAP]]' +
                                                 ' }' ,
                                                 [rfReplaceAll] );
         end
         else
         begin
             sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text ,
                                                 '[[LABEL_FORMS_DEFAULT]]' ,
                                                 '' ,
                                                 [rfReplaceAll] );
         end;
         // v. 4.0.0.0
         if ( mm.CONFIG_LAYOUT_GRID_COLUMN_SEPARATOR = 'ON' ) then
         begin
             sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text ,
                                                 '[[GRID-COLUMN-SEPARATOR]]' ,
                                                 'border-left: 0px !important;'+
                                                 'border-right: 0px !important;',
                                                 [rfReplaceAll] );
         end
         else
         begin
             sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text ,
                                                 '[[GRID-COLUMN-SEPARATOR]]' ,
                                                 'border-left: 1px solid #FFF !important;'+
                                                 'border-right: 1px solid #FFF !important;',
                                                 [rfReplaceAll] );
         end;
         sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text ,
                                             '[[GRID-ROW-HEIGHT]]' ,
                                             mm.CONFIG_LAYOUT_GRID_ROW_HEIGHT,
                                             [rfReplaceAll] );

         if ( mm.CONFIG_LAYOUT_LABEL_WRAP = 'OFF' ) then
         begin
             sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text ,
                                                 '[[LABEL_WRAP]]' ,
                                                 'white-space: nowrap;' ,
                                                 [rfReplaceAll] );
         end
         else
         begin
             sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text ,
                                                 '[[LABEL_WRAP]]' ,
                                                 '' ,
                                                 [rfReplaceAll] );
         end;

         begin
              if ( mm.CONFIG_LAYOUT_ROUND_EDIT = 'ON' ) then
              begin
                 sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text ,
                                                     '[[BORDER_ROUNDED]]' ,
                                                     mm.CONFIG_LAYOUT_ROUND_PANEL_FACTOR + 'px',
                                                     [rfReplaceAll] );

                 sm.CustomCSS.Text :=
                    StringReplace( sm.CustomCSS.Text ,
                                   '[[BTN_BORDER_ROUNDED]]' ,
                                   '-moz-border-radius: ' + mm.CONFIG_LAYOUT_ROUND_BTN_FACTOR + 'px;-webkit-border-radius: ' + mm.CONFIG_LAYOUT_ROUND_EDIT + 'px;-ms-border-radius: ' + mm.CONFIG_LAYOUT_ROUND_BTN_FACTOR + 'px;-o-border-radius: ' + mm.CONFIG_LAYOUT_ROUND_BTN_FACTOR + 'px;border-radius: ' + mm.CONFIG_LAYOUT_ROUND_BTN_FACTOR + 'px;' ,
                                   [rfReplaceAll] );

                 sm.CustomCSS.Text :=
                    StringReplace( sm.CustomCSS.Text ,
                                   '[[EDIT_BORDER_ROUNDED]]' ,
                                   '-moz-border-radius: ' + mm.CONFIG_LAYOUT_ROUND_EDIT_FACTOR + 'px;-webkit-border-radius: ' + mm.CONFIG_LAYOUT_ROUND_EDIT_FACTOR + 'px;-ms-border-radius: ' + mm.CONFIG_LAYOUT_ROUND_EDIT_FACTOR + 'px;-o-border-radius: ' + mm.CONFIG_LAYOUT_ROUND_EDIT_FACTOR + 'px;border-radius: ' + mm.CONFIG_LAYOUT_ROUND_EDIT_FACTOR + 'px;' ,
                                   [rfReplaceAll] );


                 sm.CustomCSS.Text :=
                    StringReplace( sm.CustomCSS.Text ,
                                   '[[INPUTICON_BORDER_ROUNDED]]' ,
                                   'border-radius: ' + mm.CONFIG_LAYOUT_ROUND_EDIT_FACTOR + 'px 0 0 ' + mm.CONFIG_LAYOUT_ROUND_EDIT_FACTOR + 'px;'  ,
                                   [rfReplaceAll] );
              end
              else
              begin
                 sm.CustomCSS.Text :=
                    StringReplace( sm.CustomCSS.Text ,
                                   '[[BORDER_ROUNDED]]' ,
                                   '' ,
                                   [rfReplaceAll] );

                 sm.CustomCSS.Text :=
                    StringReplace( sm.CustomCSS.Text ,
                                   '[[BTN_BORDER_ROUNDED]]' ,
                                   '' ,
                                   [rfReplaceAll] );
                 sm.CustomCSS.Text :=
                    StringReplace( sm.CustomCSS.Text ,
                                   '[[EDIT_BORDER_ROUNDED]]' ,
                                   '' ,
                                   [rfReplaceAll] );


                 sm.CustomCSS.Text :=
                    StringReplace( sm.CustomCSS.Text ,
                                   '[[INPUTICON_BORDER_ROUNDED]]' ,
                                   ''  ,
                                   [rfReplaceAll] );
              end;
         end;

        if Pos( '[[LINK_COLOR]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[LINK_COLOR]]' , GetWebColor( mm.CONFIG_LAYOUT_LINK_COLOR ) , [rfReplaceAll] );
        if Pos( '[[LINKHOVER_COLOR]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[LINKHOVER_COLOR]]' , GetWebColor( mm.CONFIG_LAYOUT_LINKHOVER_COLOR ) , [rfReplaceAll] );
        // v. 4.0.0.0
        if Pos( '[[APP_FONT]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[APP_FONT]]' , mm.CONFIG_LAYOUT_APP_FONT , [rfReplaceAll] );
           //sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[APP_FONT]]' , mm.CONFIG_LAYOUT_APP_FONT + ',Helvetica Neue,Helvetica,Arial,sans-serif' , [rfReplaceAll] );

        if Pos( '[[MENU_COLOR]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[MENU_COLOR]]' , GetWebColor( mm.CONFIG_LAYOUT_MENU_COLOR ) , [rfReplaceAll] );

        if Pos( '[[MENUFONT_COLOR]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[MENUFONT_COLOR]]' , GetWebColor( mm.CONFIG_LAYOUT_MENUFONT_COLOR ) , [rfReplaceAll] );

        if Pos( '[[MENUFONT_SIZE]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[MENUFONT_SIZE]]' , mm.CONFIG_LAYOUT_MENUFONT_SIZE , [rfReplaceAll] );

        if Pos( '[[EDIT_COLOR]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[EDIT_COLOR]]' , GetWebColor( mm.CONFIG_LAYOUT_EDIT_COLOR ) , [rfReplaceAll] );

        if Pos( '[[EDIT_FONT_COLOR]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[EDIT_FONT_COLOR]]' , GetWebColor( mm.CONFIG_LAYOUT_EDIT_FONT_COLOR ) , [rfReplaceAll] );
        // v. 4.0.0.0
        if Pos( '[[EDIT_COLOR_TRIGGER]]' , sm.CustomCSS.Text ) > 0 then
             sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[EDIT_COLOR_TRIGGER]]' , GetWebColor( mm.CONFIG_LAYOUT_EDIT_COLOR_TRIGGER ) , [rfReplaceAll] );
        if Pos( '[[EDIT_FONT_COLOR_TRIGGER]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[EDIT_FONT_COLOR_TRIGGER]]' , GetWebColor( mm.CONFIG_LAYOUT_EDIT_FONT_COLOR_TRIGGER ) , [rfReplaceAll] );

        if Pos( '[[GRID_SEL_COLOR]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[GRID_SEL_COLOR]]' , GetWebColor( mm.CONFIG_LAYOUT_GRID_SEL_COLOR ) , [rfReplaceAll] );
        // v. 4.0.0.0
        if Pos( '[[GRID-TITLE-BG]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[GRID-TITLE-BG]]' , GetWebColor( mm.CONFIG_LAYOUT_GRID_TITLE_BG ) , [rfReplaceAll] );
        if Pos( '[[GRID-TITLE-COLOR]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[GRID-TITLE-COLOR]]' , GetWebColor( mm.CONFIG_LAYOUT_GRID_TITLE_COLOR ) , [rfReplaceAll] );
        if Pos( '[[GRID-TITLE-BG-OVER]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[GRID-TITLE-BG-OVER]]' , GetWebColor( mm.CONFIG_LAYOUT_GRID_TITLE_BG_OVER ) , [rfReplaceAll] );
        if Pos( '[[GRID-TITLE-COLOR-OVER]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[GRID-TITLE-COLOR-OVER]]' , GetWebColor( mm.CONFIG_LAYOUT_GRID_TITLE_COLOR_OVER ) , [rfReplaceAll] );
        if Pos( '[[GRID-TITLE-COLOR-ICON]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[GRID-TITLE-COLOR-ICON]]' , GetWebColor( mm.CONFIG_LAYOUT_GRID_TITLE_COLOR_ICON ) , [rfReplaceAll] );

        if Pos( '[[EDIT_FOCUS_COLOR]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[EDIT_FOCUS_COLOR]]' , GetWebColor( mm.CONFIG_LAYOUT_EDIT_FOCUS_COLOR ) , [rfReplaceAll] );

        if Pos( '[[TAB_COLOR_FOCUS]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[TAB_COLOR_FOCUS]]' , GetWebColor( mm.CONFIG_LAYOUT_TAB_COLOR_FOCUS ) , [rfReplaceAll] );

        if mm.CONFIG_LAYOUT_TAB_COLOR_FOCUS = '$00FFFFFF' then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[TAB_COLOR_FONT]]' , ( 'black' ) , [rfReplaceAll] )
        else
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[TAB_COLOR_FONT]]' , ( 'white' ) , [rfReplaceAll] );

        if Pos( '[[LOGIN_COLOR]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[LOGIN_COLOR]]' , GetWebColor( mm.CONFIG_LAYOUT_LOGIN_COLOR ) , [rfReplaceAll] );

        if Pos( '[[BUTTON_COLOR_HOVER]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[BUTTON_COLOR_HOVER]]' , GetWebColor( mm.CONFIG_LAYOUT_BUTTON_COLOR_HOVER ) , [rfReplaceAll] );

        if Pos( '[[BUTTON_COLOR_CRUD_HOVER]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[BUTTON_COLOR_CRUD_HOVER]]' , GetWebColor( mm.CONFIG_LAYOUT_BUTTON_COLOR_CRUD_HOVER ) , [rfReplaceAll] );

        if Pos( '[[BUTTON_COLOR_CRUD]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[BUTTON_COLOR_CRUD]]' , GetWebColor( mm.CONFIG_LAYOUT_BUTTON_COLOR_CRUD ) , [rfReplaceAll] );

        if Pos( '[[BUTTON_COLOR]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[BUTTON_COLOR]]' , GetWebColor( mm.CONFIG_LAYOUT_BUTTON_COLOR ) , [rfReplaceAll] );

        // novo seletor de MATIZES de cores padroes
        if Pos( '[[COLOR_RED]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[COLOR_RED]]' , ColorToHtml( COLOR_RED ) , [rfReplaceAll] );

        if Pos( '[[COLOR_BORDER_RED]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[COLOR_BORDER_RED]]' , ColorToHtml( COLOR_BORDER_RED ) , [rfReplaceAll] );

        if Pos( '[[COLOR_HOVER_RED]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[COLOR_HOVER_RED]]' , ColorToHtml( COLOR_HOVER_RED ) , [rfReplaceAll] );

        if Pos( '[[COLOR_GREEN]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[COLOR_GREEN]]' , ColorToHtml( COLOR_GREEN ) , [rfReplaceAll] );

        if Pos( '[[COLOR_BORDER_GREEN]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[COLOR_BORDER_GREEN]]' , ColorToHtml( COLOR_BORDER_GREEN ) , [rfReplaceAll] );

        if Pos( '[[COLOR_HOVER_GREEN]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[COLOR_HOVER_GREEN]]' , ColorToHtml( COLOR_HOVER_GREEN ) , [rfReplaceAll] );

        if Pos( '[[COLOR_BLUE]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[COLOR_BLUE]]' , ColorToHtml( COLOR_BLUE ) , [rfReplaceAll] );

        if Pos( '[[COLOR_BORDER_BLUE]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[COLOR_BORDER_BLUE]]' , ColorToHtml( COLOR_BORDER_BLUE ) , [rfReplaceAll] );

        if Pos( '[[COLOR_HOVER_BLUE]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[COLOR_HOVER_BLUE]]' , ColorToHtml( COLOR_HOVER_BLUE) , [rfReplaceAll] );

        if Pos( '[[COLOR_BLUEDARK]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[COLOR_BLUEDARK]]' , ColorToHtml( COLOR_BLUEDARK ) , [rfReplaceAll] );

        if Pos( '[[COLOR_BORDER_BLUEDARK]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[COLOR_BORDER_BLUEDARK]]' , ColorToHtml( COLOR_BORDER_BLUEDARK ) , [rfReplaceAll] );

        if Pos( '[[COLOR_HOVER_BLUEDARK]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[COLOR_HOVER_BLUEDARK]]' , ColorToHtml( COLOR_HOVER_BLUEDARK ) , [rfReplaceAll] );

        if Pos( '[[COLOR_ORANGE]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[COLOR_ORANGE]]' , ColorToHtml( COLOR_ORANGE ) , [rfReplaceAll] );

        if Pos( '[[COLOR_BORDER_ORANGE]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[COLOR_BORDER_ORANGE]]' , ColorToHtml( COLOR_BORDER_ORANGE ) , [rfReplaceAll] );

        if Pos( '[[COLOR_HOVER_ORANGE]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[COLOR_HOVER_ORANGE]]' , ColorToHtml( COLOR_HOVER_ORANGE ) , [rfReplaceAll] );

        if Pos( '[[COLOR_GRAY]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[COLOR_GRAY]]' , ColorToHtml( COLOR_GRAY ) , [rfReplaceAll] );

        if Pos( '[[COLOR_BORDER_GRAY]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[COLOR_BORDER_GRAY]]' , ColorToHtml( COLOR_BORDER_GRAY ) , [rfReplaceAll] );

        if Pos( '[[COLOR_HOVER_GRAY]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[COLOR_HOVER_GRAY]]' , ColorToHtml( COLOR_HOVER_GRAY ) , [rfReplaceAll] );

        if Pos( '[[COLOR_DARK]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[COLOR_DARK]]' , ColorToHtml( COLOR_DARK ) , [rfReplaceAll] );

        if Pos( '[[COLOR_BORDER_DARK]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[COLOR_BORDER_DARK]]' , ColorToHtml( COLOR_BORDER_DARK ), [rfReplaceAll] );

        if Pos( '[[COLOR_HOVER_GRAY]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[COLOR_HOVER_GRAY]]' , ColorToHtml( COLOR_HOVER_GRAY ) , [rfReplaceAll] );

        if Pos( '[[COLOR_SILVER]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[COLOR_SILVER]]' , ColorToHtml( COLOR_SILVER ) , [rfReplaceAll] );

        if Pos( '[[COLOR_BORDER_SILVER]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[COLOR_BORDER_SILVER]]' , ColorToHtml( COLOR_BORDER_SILVER ), [rfReplaceAll] );

        if Pos( '[[COLOR_HOVER_SILVER]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[COLOR_HOVER_SILVER]]' , ColorToHtml( COLOR_HOVER_SILVER ) , [rfReplaceAll] );
        // v. 3.3.3.0
        if Pos( '[[COLOR_PURPLE]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[COLOR_PURPLE]]' , ColorToHtml( COLOR_PURPLE ) , [rfReplaceAll] );
        // v. 3.3.3.0
        if Pos( '[[COLOR_BORDER_PURPLE]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[COLOR_BORDER_PURPLE]]' , ColorToHtml( COLOR_BORDER_PURPLE ) , [rfReplaceAll] );
        // v. 3.3.3.0
        if Pos( '[[COLOR_HOVER_PURPLE]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[COLOR_HOVER_PURPLE]]' , ColorToHtml( COLOR_HOVER_PURPLE ) , [rfReplaceAll] );
        // v. 4.0.0.0
        if mm.varB_Mobile_Screen then
           mm.CONFIG_LAYOUT_SCROLLBAR_SIZE       := '5';
        sm.CustomCSS.Text :=
           StringReplace( sm.CustomCSS.Text , '[[SCROLLBAR-SIZE]]' ,
                                              mm.CONFIG_LAYOUT_SCROLLBAR_SIZE,
                                              [rfReplaceAll] );
        cGridLayout := '';
        if mm.CONFIG_LAYOUT_GRID_TITLE_BOLD = 'ON' then
           cGridLayout := 'font-weight: 500;';
        sm.CustomCSS.Text :=
           StringReplace( sm.CustomCSS.Text , '[[GRID-TITLE-BOLD]]' ,
                                              cGridLayout,
                                              [rfReplaceAll] );
        if mm.CONFIG_LAYOUT_GRID_TITLE_UPPER = 'ON' then
           cGridLayout := 'text-transform: uppercase;'
        else
           cGridLayout := 'text-transform: capitalize;';
        sm.CustomCSS.Text :=
           StringReplace( sm.CustomCSS.Text , '[[GRID-TITLE-UPPER]]' ,
                                              cGridLayout,
                                              [rfReplaceAll] );
        if mm.CONFIG_LAYOUT_LOADMASK_TYPE = '' then
        begin
           sm.CustomCSS.Text :=
              StringReplace( sm.CustomCSS.Text , '[[RC-LOADMASK]]' ,
                                                 '#loading .loading-indicator {' +
                                                 '   border-width:0px;' +
                                                 '   color:white;' +
                                                 '   padding:50px;' +
                                                 '   background: rgba(0, 0, 0, 0);' +
                                                 '   background-image:url( ''files/images/loaders/' + Copy( mm.CONFIG_LAYOUT_LOADMASK_IMG, Pos( '|', mm.CONFIG_LAYOUT_LOADMASK_IMG ) + 1 ) + ''' );' +
                                                 '   background-repeat:no-repeat;' +
                                                 '   background-size: contain;' +
                                                 '}' +
                                                 '.x-mask-msg{' +
                                                 '   background:none;' +
                                                 '   border-width:0px;' +
                                                 '   animation: showSweetAlert .3s !important;' +
                                                 '   -webkit-animation: showSweetAlert .3s !important;' +
                                                 '}' +
                                                 '/* v. 4.0.0.0 */' +
                                                 '.x-mask-msg-inner{' +
                                                 '   border-width:0px;' +
                                                 '   color:none;' +
                                                 '   padding:50px;' +
                                                 '   background: rgba(0, 0, 0, 0);' +
                                                 '   background-image:url( ''files/images/loaders/' + Copy( mm.CONFIG_LAYOUT_LOADMASK_IMG, Pos( '|', mm.CONFIG_LAYOUT_LOADMASK_IMG ) + 1 ) + ''' );' +
                                                 '   background-repeat:no-repeat;' +
                                                 '   background-size: contain;' +
                                                 //'	background-size: 96px 96px !important;' +
                                                 '}' +
                                                 '.x-mask-msg-text{' +
                                                 '   display:none;' +
                                                 '   background-image:none;' +
                                                 '}'
                              , [rfReplaceAll] );

           if Pos( '[[LOADMASKFILE]]' , sm.CustomCSS.Text ) > 0 then
              sm.CustomCSS.Text :=
                 StringReplace( sm.CustomCSS.Text , '[[LOADMASKFILE]]' ,
                                Copy( mm.CONFIG_LAYOUT_LOADMASK_IMG, Pos( '|', mm.CONFIG_LAYOUT_LOADMASK_IMG ) + 1 ) , [rfReplaceAll] );
        end
        else
        begin
           sm.CustomCSS.Text :=
              StringReplace( sm.CustomCSS.Text , '[[RC-LOADMASK]]' ,
                                                 '#loading .loading-indicator {' +
                                                 '   border-width:0px;' +
                                                 '   color:white;' +
                                                 '   padding:50px;' +
                                                 '   background: rgba(0, 0, 0, 0);' +
                                                 '   background-image:url( ''files/images/loaders/' + Copy( mm.CONFIG_LAYOUT_LOADMASK_IMG, Pos( '|', mm.CONFIG_LAYOUT_LOADMASK_IMG ) + 1 ) + ''' );' +
                                                 '   background-repeat:no-repeat;' +
                                                 '	 background-size: 96px 96px !important;' +
                                                 '}' +
                                                 '.x-mask-msg {' +
                                                 '	position: fixed !important;' +
                                                 '	padding:10px !important;' +
                                                 '	-webkit-border-radius:5px !important;' +
                                                 '	-moz-border-radius:5px !important;' +
                                                 '	-ms-border-radius:5px !important;' +
                                                 '	-o-border-radius:5px !important;' +
                                                 '	border-radius:5px !important;' +
                                                 '	background:#fff !important;' +
                                                 '	animation: showSweetAlert .3s !important;' +
                                                 '	-webkit-animation: showSweetAlert .3s !important;' +
                                                 '}' +
                                                 '' +
                                                 '.x-mask-msg-inner {' +
                                                 '	font-weight: 600 !important;' +
                                                 '	color: #595959 !important;' +
                                                 '	font-size: 20px !important;' +
                                                 '	line-height: 35px !important;' +
                                                 '	font-family: ''Helvetica Neue'',Helvetica,Arial,sans-serif !important;' +
                                                 '}' +
                                                 '.x-mask-msg-text {' +
                                                 '	padding:100px 0 0 !important;' +
                                                 '  background-image:url( ''files/images/loaders/' + Copy( mm.CONFIG_LAYOUT_LOADMASK_IMG, Pos( '|', mm.CONFIG_LAYOUT_LOADMASK_IMG ) + 1 ) + ''' );' +
                                                 '	background-size: 96px 96px !important;' +
                                                 '}'
                              , [rfReplaceAll] );
        end;
      end;
end;
// v. 4.0.0.0
procedure tdm_rc.rc_SaveTheme(pName: String);
var
   Inifile : TIniFile;
begin
      // v. 3.2.0..7
      Inifile := nil;

      try
        if pName = '' then
           pName := 'default';

        pName := pName.ToLower;

        IniFile := TiniFile.Create( sm.FilesFolderPath + 'themes' + BACKSLASH + 'theme_' + pName + '.ini'); // v. 3.1.0.60

        if mm.CONFIG_LAYOUT_MENUFONT_COLOR = 'clWhite' then
           mm.CONFIG_LAYOUT_MENUFONT_COLOR := '$00FDFFFF';
        //controle de cores
        IniFile.WriteString('Colors' , 'menu_color'                 , mm.CONFIG_LAYOUT_MENU_COLOR) ;
        IniFile.WriteString('Colors' , 'menufont_color'             , mm.CONFIG_LAYOUT_MENUFONT_COLOR) ;

        IniFile.WriteString('Colors' , 'menu_logo_color_bg'         , mm.CONFIG_LAYOUT_MENU_LOGO_BG_COLOR) ;
        IniFile.WriteString('Colors' , 'menu_logo_color_font'       , mm.CONFIG_LAYOUT_MENU_LOGO_FONT_COLOR) ;

        IniFile.WriteString('Colors' , 'login_color'                , mm.CONFIG_LAYOUT_LOGIN_COLOR) ;

        IniFile.WriteString('Colors' , 'label_color'                , mm.CONFIG_LAYOUT_LABEL_COLOR) ;

        IniFile.WriteString('Colors' , 'button_color'               , mm.CONFIG_LAYOUT_BUTTON_COLOR ) ;
        IniFile.WriteString('Colors' , 'button_color_crud'          , mm.CONFIG_LAYOUT_BUTTON_COLOR_CRUD) ;

        IniFile.WriteString('Colors' , 'button_color_hover'         , mm.CONFIG_LAYOUT_BUTTON_COLOR_HOVER ) ;
        IniFile.WriteString('Colors' , 'button_color_crud_hover'    , mm.CONFIG_LAYOUT_BUTTON_COLOR_CRUD_HOVER ) ;

        IniFile.WriteString('Colors' , 'grid_sel_color'             , mm.CONFIG_LAYOUT_GRID_SEL_COLOR) ;
        // v. 4.0.0.0
        IniFile.WriteString('Colors' , 'grid_title_bg'              , mm.CONFIG_LAYOUT_GRID_TITLE_BG) ;
        IniFile.WriteString('Colors' , 'grid_title_color'           , mm.CONFIG_LAYOUT_GRID_TITLE_COLOR) ;
        IniFile.WriteString('Colors' , 'grid_title_bg_over'         , mm.CONFIG_LAYOUT_GRID_TITLE_BG_OVER) ;
        IniFile.WriteString('Colors' , 'grid_title_color_over'      , mm.CONFIG_LAYOUT_GRID_TITLE_COLOR_OVER) ;
        IniFile.WriteString('Colors' , 'grid_title_color_icon'      , mm.CONFIG_LAYOUT_GRID_TITLE_COLOR_ICON) ;

        IniFile.WriteString('Colors' , 'edit_color'                 , mm.CONFIG_LAYOUT_EDIT_COLOR) ;                // v. 4.0.0.0
        IniFile.WriteString('Colors' , 'edit_font_color'            , mm.CONFIG_LAYOUT_EDIT_FONT_COLOR) ;           // v. 4.0.0.0
        IniFile.WriteString('Colors' , 'edit_color_readonly'        , mm.CONFIG_LAYOUT_EDIT_COLOR_READONLY) ;       // v. 4.0.0.0
        IniFile.WriteString('Colors' , 'edit_font_color_readonly'   , mm.CONFIG_LAYOUT_EDIT_FONT_COLOR_READONLY) ;  // v. 4.0.0.0
        IniFile.WriteString('Colors' , 'edit_color_trigger'         , mm.CONFIG_LAYOUT_EDIT_COLOR_TRIGGER) ;        // v. 4.0.0.0
        IniFile.WriteString('Colors' , 'edit_font_color_trigger'    , mm.CONFIG_LAYOUT_EDIT_FONT_COLOR_TRIGGER) ;   // v. 4.0.0.0
        IniFile.WriteString('Colors' , 'edit_focus_color'           , mm.CONFIG_LAYOUT_EDIT_FOCUS_COLOR) ;
        IniFile.WriteString('Colors' , 'edlkp_color'                , mm.CONFIG_LAYOUT_EDLKP_COLOR) ;
        IniFile.WriteString('Colors' , 'edlkp_font_color'           , mm.CONFIG_LAYOUT_EDLKP_FONT_COLOR) ;
        IniFile.WriteString('Colors' , 'bg_color'                   , mm.CONFIG_LAYOUT_BG_COLOR) ;
        IniFile.WriteString('Colors' , 'link_color'                 , mm.CONFIG_LAYOUT_LINK_COLOR) ;
        IniFile.WriteString('Colors' , 'linkhover_color'            , mm.CONFIG_LAYOUT_LINKHOVER_COLOR) ;

        IniFile.WriteString('Colors' , 'tab_color_focus'            , varIIF( mm.CONFIG_LAYOUT_TAB_COLOR_FOCUS = '$00FFFFFF' , mm.VALUE_YES, mm.VALUE_NO ) ) ; // v. 3.0.0.0 2
      finally
        IniFile.Free;
      end;
      // v. 4.0.0.0
      mm.varC_Temp1 := StringReplace( StrTokenClear( APP_NAME ), ' ', '', [rfReplaceAll] );
      mm.varC_Temp1 := sm.FilesFolderPath + mm.varC_Temp1 + '_cfg.ini'; // v. 3.1.0.60
      IniFile := TIniFile.Create( mm.varC_Temp1 );
        IniFile.WriteString('Layout' , 'round_form'                 ,  mm.CONFIG_LAYOUT_ROUND_FORM) ;
        IniFile.WriteString('Layout' , 'round_edit'                 ,  mm.CONFIG_LAYOUT_ROUND_EDIT) ;
        IniFile.WriteString('Layout' , 'round_edit_factor'          ,  mm.CONFIG_LAYOUT_ROUND_EDIT_FACTOR) ;
        IniFile.WriteString('Layout' , 'round_panel_factor'         ,  mm.CONFIG_LAYOUT_ROUND_PANEL_FACTOR) ;
        IniFile.WriteString('Layout' , 'round_btn_factor'           ,  mm.CONFIG_LAYOUT_ROUND_BTN_FACTOR) ;

        IniFile.WriteString('Layout' , 'user_bg'                    ,  mm.CONFIG_LAYOUT_USER_BG) ;

        IniFile.WriteString('Layout' , 'label_wrap'                 ,  mm.CONFIG_LAYOUT_LABEL_WRAP) ;
        IniFile.WriteString('Layout' , 'label_weight'               ,  mm.CONFIG_LAYOUT_LABEL_WEIGHT) ; // v. 4.0.0.0
        IniFile.WriteString('Layout' , 'label_forms_default'        ,  mm.CONFIG_LAYOUT_LABEL_FORMS_DEFAULT) ;
        IniFile.WriteString('Layout' , 'gridblock_offset'           ,  mm.CONFIG_LAYOUT_GRIDBLOCK_OFFSET) ;
        IniFile.WriteString('Layout' , 'gridblock_anim'             ,  mm.CONFIG_LAYOUT_GRIDBLOCK_ANIM) ;
        IniFile.WriteString('Layout' , 'menufont_size'              ,  mm.CONFIG_LAYOUT_MENUFONT_SIZE) ;
        IniFile.WriteString('Layout' , 'menu_type'                  ,  mm.CONFIG_LAYOUT_MENU_TYPE) ; // v. 4.0.0.6

        IniFile.WriteString('Layout' , 'tabs_max_open'              ,  mm.CONFIG_LAYOUT_TAB_MAX_OPENED) ;   // v. 3.1.0.61
        IniFile.WriteString('Layout' , 'tabs_off'                   ,  mm.CONFIG_LAYOUT_TAB_OFF) ;  // v. 3.2.0.4
        // v. 4.0.0.0
        IniFile.WriteString('Layout' , 'loadmaskfile'               ,  mm.CONFIG_LAYOUT_LOADMASK_IMG);
        IniFile.WriteString('Layout' , 'loadmasktype'               ,  mm.CONFIG_LAYOUT_LOADMASK_TYPE) ;
        IniFile.WriteString('Layout' , 'grids_title_bold'           ,  mm.CONFIG_LAYOUT_GRID_TITLE_BOLD);
        IniFile.WriteString('Layout' , 'grids_title_upper'          ,  mm.CONFIG_LAYOUT_GRID_TITLE_UPPER) ;
        IniFile.WriteString('Layout' , 'scroll_bar_size'            ,  mm.CONFIG_LAYOUT_SCROLLBAR_SIZE) ;
        IniFile.WriteString('Layout' , 'grid_column_separator'      , mm.CONFIG_LAYOUT_GRID_COLUMN_SEPARATOR) ;
        IniFile.WriteString('Layout' , 'grid_row_height'            , mm.CONFIG_LAYOUT_GRID_ROW_HEIGHT) ;
        IniFile.WriteString('Layout' , 'grid_rc_paginator'          , mm.CONFIG_LAYOUT_GRID_RC_PAGINATOR) ;

        IniFile.WriteString('Font'   , 'app_font'                   , mm.CONFIG_LAYOUT_APP_FONT) ;
        IniFile.WriteString('Font'   , 'font_all'                   , mm.CONFIG_LAYOUT_APPLY_FONT_ALL) ;
      IniFile.Free;

end;
// v. 3.2.0.4
procedure tdm_rc.rc_ObjectEnabled(pFrame: TObject; pObj: TUniControl; pState: Boolean );
var
   pObj2 : TUniControl;
begin
     pObj2 := nil;

     if pObj <> nil then
        pObj2 := TUniControl( TComponent( pFrame ).FindComponent( pObj.Name ) );

     if pObj2 <> nil then
     begin
        pObj2.Enabled := pState;

        if pObj2.Enabled then
        begin
           rc_RemoveCssClass( pObj2, 'disabled' );
        end;
     end;
end;

function tdm_rc.rc_ObjectExists(pName: string): boolean;
var
   i : integer;
begin
     Result := false;
     for i := 0 to uniapplication.ComponentCount - 1 do
         if lowercase(uniapplication.components[i].name) = lowercase(pName) then
         begin
            Result := true;
            break;
         end;
end;

//deprecated
function tdm_rc.rc_OnResize( pFormName : string ; pCenter : boolean ) : string;
var
   oObj : TUniControl;
begin
     oObj := rc_FindControl( pFormName );

     if oObj.InheritsFrom( TUniframe ) then
        Result := 'window.addEventListener( "resize", resizeFrame, true);' +
                  'function resizeFrame() {' +
                  '  if (typeof ' + pFormName + ' !== ''undefined'') { ' +
                  '     var getSize = Ext.getBody().getViewSize(); ' +
                  '     winWidth = getSize.width; ' +
                  '     winHeight = getSize.height; ' +
//                  '     ajaxRequest( ' + MainForm.htmlFrame.JSName + ' , "_OnResize", ' +
//                  '       ["form=" + ' + QuotedStr( pFormName ) + ',' +
//                  '        "width=" + winWidth ,' +
//                  '        "height=" + winHeight ' +
//                  '       ]);}' +
                  '}'
    else
    if oObj.InheritsFrom(TUniForm) then
    begin

//       if ( mm.varB_Mobile_Screen ) then
//          oObj.Height := mm.varI_ScreenHeight - 5;

       if pCenter then
          Result := 'window.onresize = function(){ ' +
                    'if (typeof ' + pFormName + ' !== ''undefined'') { ' +
                    '   var getSize = Ext.getBody().getViewSize(), ' +
                    '   winWidth = getSize.width, ' +
                    '   winHeight = getSize.height, ' +
                    '   left = (winWidth - ' + pFormName + '.window.width) / 2, ' +
                    '   top = (winHeight - ' + pFormName + '.window.height) / 2; ' +
                    '   ' + pFormName + '.window.setPosition(left, top);}' +
                    //'   ' + pFormName + '.window.setWidth(winWidth);     ' +
      //            '   ' + pFormName + '.window.setHeight(winHeight);}' +
                    '   ajaxRequest( ' + MainForm.htmlFrame.JSName + ' , "_OnResize", ' +
   //                 '     ["form=" + ' + QuotedStr( pFormName ) + ']);' + ',' +
                    '     ["form=" + ' + QuotedStr( pFormName ) + ',' +
                    '      "width=" + winWidth ,' +
                    '      "height=" + winHeight ]);' +
                    '}'
       else
          Result := 'window.onresize = function(){ ' +
                    'if (typeof ' + pFormName + ' !== ''undefined'') { ' +
                    '   var getSize = Ext.getBody().getViewSize(), ' +
                    '   winWidth = getSize.width, ' +
                    '   winHeight = getSize.height;}' +
//                    '   ajaxRequest( ' + MainForm.htmlFrame.JSName + ' , "_OnResize", ' +
//                    '     ["form=" + ' + QuotedStr( pFormName ) + ',' +
//                    '      "width=" + winWidth ,' +
//                    '      "height=" + winHeight ]);}' +
                    '}';
    end;
end;
// v. 4.0.0.4 thanks to GaborB. from Malta
procedure tdm_rc.rc_OpenLink(pLink, pTarget: string);
begin
     if not mm.varB_iOS then
        pLink := 'window.open(' + QuotedStr(pLink) + ', ' + QuotedStr(pTarget) + ');'
     else
        pLink := 'setTimeout(() => { window.open(' + QuotedStr(pLink) + ', ' + QuotedStr(pTarget) + ');})';
     UniSession.AddJS( pLink );
end;
// v. 3.0.0.0
procedure tdm_rc.rc_FillSearchFieldsCRUD( pFrame: TObject; pName, pField, pDescription: String);
var
   pComboBox2,
   pComboBox : TUniComboBox;
   i : integer;
begin
    // v. 3.2.0..7
    pComboBox2 := nil;

    // veio de relatorio ou crud ?
    if lowercase(pName) = 'lbxreportoptions' then
    begin
        pComboBox := TUniComboBox( TComponent( pFrame ).FindComponent( pName ));
        if pField = '' then
        begin
            pComboBox.Clear;
            pComboBox.Items.Add( '' );
        end
        else
            pComboBox.Items.Add( pField );

        //fields...
        pComboBox := nil;
        pComboBox := TUniComboBox( TComponent( pFrame ).FindComponent( 'cbxModelReport_form' ));
        if pField = '' then
        begin
           pComboBox.Clear;
           pComboBox.Items.Add( '' );
        end
        else
            pComboBox.Items.Add( pDescription );
    end
    else
    begin
        pComboBox := TUniComboBox( TComponent( pFrame ).FindComponent( pName ));

        if pField = '' then
        begin
            pComboBox.Clear;
            pComboBox.Items.Add( '' );

            // limpar o 2o. combo de pesquisa
            if lowercase(pName) = 'cbxsearchcrudfield1' then
            begin
                 pComboBox2 := TUniComboBox( TComponent( pFrame ).FindComponent( 'cbxsearchcrudfield2' ));
                 pComboBox2.Clear;
                 pComboBox2.Items.Add( '' );

            end;
        end
        else
        begin
            pComboBox.Items.Add( pDescription );

            // limpar o 2o. combo de pesquisa
            if lowercase(pName) = 'cbxsearchcrudfield1' then
            begin
                 pComboBox2 := TUniComboBox( TComponent( pFrame ).FindComponent( 'cbxsearchcrudfield2' ));
                 pComboBox2.Items.Add( pDescription );
            end;
        end;

        // deixar padrao o 1o. item
        if lowercase(pName) = 'cbxsearchcrudfield1' then
        begin
           pComboBox.ItemIndex := varIIF( pComboBox.Items.Count > 1 , 1, 0 );
           i := pComboBox.ItemIndex;
           pComboBox := TUniComboBox( TComponent( pFrame ).FindComponent( 'cbxSearchCRUDField1_Fields' ));
           pComboBox.ItemIndex := i;

           // 2o. combo de pesquisa
           pComboBox2.ItemIndex := varIIF( pComboBox2.Items.Count > 1 , 1, 0 );
           i := pComboBox2.ItemIndex;
           pComboBox2 := TUniComboBox( TComponent( pFrame ).FindComponent( 'cbxSearchCRUDField2_Fields' ));
           pComboBox2.ItemIndex := i
        end;

        if TUniComboBox( TComponent( pFrame ).FindComponent( 'cbxsearchcrudopt1' )) <> nil then
        begin
           i := pComboBox.Items.Count;
           pComboBox := TUniComboBox( TComponent( pFrame ).FindComponent( 'cbxsearchcrudopt1' ));
           pComboBox.ItemIndex := 6;
        end;

        //fields...
        if lowercase(pName) = 'cbxsearchcrudfield1' then
        begin
          pComboBox := nil;
          pComboBox := TUniComboBox( TComponent( pFrame ).FindComponent( pName + '_fields' ));

          if pComboBox <> nil then
          begin
             if pField = '' then
             begin
                pComboBox.Clear;
                pComboBox.Items.Add( '' );
             end
             else
                 pComboBox.Items.Add( pField );
          end;

           pComboBox2 := nil;
           pComboBox2 := TUniComboBox( TComponent( pFrame ).FindComponent( 'cbxSearchCRUDField2_Fields' ));

           if pComboBox2 <> nil then
           begin
              if pField = '' then
              begin
                 pComboBox2.Clear;
                 pComboBox2.Items.Add( '' );
              end
              else
                  pComboBox2.Items.Add( pField );
           end;
        end
        else
        if lowercase(pName) = 'cbxsearchcrudfielddate' then
        begin
          pComboBox := nil;
          pComboBox := TUniComboBox( TComponent( pFrame ).FindComponent( pName + '_fields' ));

          if pComboBox <> nil then
          begin
             if pField = '' then
             begin
                pComboBox.Clear;
                pComboBox.Items.Add( '' );
             end
             else
                 pComboBox.Items.Add( pField );
          end;
        end;
    end;
end;
// v. 4.0.0.0
function tdm_rc.rc_FindDataModule(pName: string): TDataModule;
var
   f : integer;
begin
   Result := nil;
   for F := 0 to UniSession.DataModules.Count - 1 do
   begin
       if ( TDataModule(UniSession.DataModules[f]).Name = pName ) then
       begin
           Result := TDataModule( UniSession.DataModules[f] );
       end;
   end;
end;

// v. 3.1.0.63
function tdm_rc.rc_GetSQL( pDBType, pDefinition: string; pIni : integer ; pEnd : integer; pS1 : string ): string;
var
   cTmp, cTypes : string;
   i,t : integer;
begin
    if pDefinition = 'cmd_concat' then
    begin
         if Pos( ':', pS1 ) = 0 then
            t := 30
         else
         begin
              t := StrToIntDef( copy( ps1, pos( ':', ps1 ) + 1, 10 ), 30 );
              ps1 := copy( ps1, 1, pos( ':', ps1 ) - 1 );
         end;

         i := strTokenCount( pS1 , ',' );

         if ( pDBType = 'FIREBIRD' ) or ( pDBType = 'ORACLE' ) or ( pDBType = 'SQLITE' ) then
            Result := StringReplace( pS1, ',', '||', [rfReplaceAll] )
         else
         if ( pDBType = 'MYSQL' ) or ( pDBType = 'SQLSERVER' ) or ( pDBType = 'PGSQL' )then
         begin
            pS1 := pS1 + ',';
            Result := ' CAST( CONCAT(';
            repeat
                  cTmp   := Copy( pS1, 1, Pos( ',', pS1 ) - 1 );
                  pS1    := StringReplace( pS1, cTmp + ',', '', [rfReplaceAll] );
                  if i-1 > 0 then
                     Result := Result + cTmp + ','
                  else
                  begin
                     Result := Result + cTmp + ') as varchar(' + t.ToString + ') )' ;  //cast( concat( ddd1, fone1 ) as varchar(15) ) as fone1
                  end;

                  dec( i );
            until i = 0;
         end;
    end
    else
    // v. 3.1.0.63 end
    if pDefinition = 'cmd_paginate' then
    begin
         if pDBType = 'FIREBIRD' then
            Result := ' ROWS '
         else
         if pDBType = 'PGSQL' then
            Result := ' LIMIT '
         else
         if pDBType = 'MYSQL' then
            Result := ' LIMIT '
         else
         if pDBType = 'ORACLE' then
            Result := ' LIMIT '
         else
         if pDBType = 'SQLSERVER' then
            Result := ' OFFSET ' // feedback FABIO / GUS  // v. 3.1.0.63
         else
         if pDBType = 'SQLITE' then
            Result := ' LIMIT ';
    end
    else
    if pDefinition = 'defaultport' then
    begin
         if pDBType = 'FIREBIRD' then
            Result := '3050'
         else
         if pDBType = 'PGSQL' then
            Result := '5432'
         else
         if pDBType = 'MYSQL' then
            Result := '3306'
         else
         if pDBType = 'SQLSERVER' then
            Result := '1433'
         else
         if pDBType = 'ORACLE' then
            Result := '1521'
         else
         if pDBType = 'SQLITE' then
            Result := '0';
    end
    else
    if pDefinition = 'table_exists' then
    begin
         if pDBType = 'FIREBIRD' then
            Result := 'select rdb$relation_name from rdb$relations where rdb$relation_name = ''%s'' '
         else
         if pDBType = 'PGSQL' then
            Result := 'select table_name from information_schema.columns where table_name = ''%s'' limit 1'  //SELECT table_name FROM information_schema.tables WHERE table_schema = 'public';
         else
         if pDBType = 'MYSQL' then
            Result := 'show tables like ''%s'' '
         else
         if pDBType = 'ORACLE' then
            Result := '''%s'' '
         else
         if pDBType = 'SQLSERVER' then
            Result := 'select TOP 1 * from sysobjects where xtype = ''U'' and name = ''%s'' ' // dica FOLIVEIRA
         else
         if pDBType = 'SQLITE' then
            Result := ' select * from sqlite_master where type = ''table'' and name = ''%s'' limit 1'
    end
    else
    if pDefinition = 'fk_tables' then
    begin
         if pDBType = 'FIREBIRD' then
            Result := ' select table_name, field_name, foreign_key, reference_table, field_key ' +
                      ' from VIEW_DB_STRUCTURE ' +
                      ' where reference_table = upper(''%s'') ' +
                      ' and foreign_key = ''Y'' '
         else
         if pDBType = 'PGSQL' then
            Result :=
                 ' select c.constraint_name' +
                 '        , x.table_schema as schema_name' +
                 '        , x.table_name' +
                 '        , x.column_name as field_name' +
                 '        , y.table_schema as foreign_schema_name' +
                 '        , y.table_name as reference_table' +
                 '        , y.column_name as field_key' +

                 ' from information_schema.referential_constraints c' +

                 ' join information_schema.key_column_usage x' +
                 '      on x.constraint_name = c.constraint_name' +

                 ' join information_schema.key_column_usage y' +
                 '      on y.ordinal_position = x.position_in_unique_constraint' +
                 '      and y.constraint_name = c.unique_constraint_name' +
                 '      and y.table_name = ''%s'' ' +

                 ' order by c.constraint_name, x.ordinal_position '
         else
         if pDBType = 'MYSQL' then
            Result :=
                ' select' +
                '   CONSTRAINT_NAME as ''foreign_name'',' +
                '   table_name, column_name as field_name,' +
                '   referenced_table_name as reference_table, referenced_column_name as field_key' +
                ' from' +
                '   information_schema.key_column_usage' +
                ' where' +
                '   referenced_table_name is not null ' +
                '  and ' +
                '   referenced_table_name = ''%s'''
         else
         if pDBType = 'SQLSERVER' then // feedback by FABIO OLIVEIRA
             Result := ' select t.name as table_name, c.name as field_name ' +
                       ' from sys.foreign_key_columns as fk ' +
                       ' inner join sys.tables as t on fk.parent_object_id = t.object_id ' +
                       ' inner join sys.columns as c on fk.parent_object_id = c.object_id and fk.parent_column_id = c.column_id ' +
                       ' where fk.referenced_object_id = (select object_id from sys.tables where name = ''%s'' ) ' +
                       ' order by table_name '
         else
         if pDBType = 'ORACLE' then
            Result := ''
         else
         if pDBType = 'SQLITE' then
            Result := ''
    end
    else
    if pDefinition = 'field_exists' then
    begin
         if pDBType = 'FIREBIRD' then
            Result := 'select rdb$field_name from rdb$relation_fields where rdb$relation_fields.rdb$relation_name = ''%s'' and rdb$relation_fields.rdb$field_name = ''%s'' '
         else
         if pDBType = 'PGSQL' then
            Result := 'select table_name as tabela, column_name as campo from information_schema.columns where table_name = ''%s'' and column_name = ''%s'' '
         else
         if pDBType = 'MYSQL' then
            Result := 'show columns from %s where field = ''%s'' '
         else
         if pDBType = 'SQLSERVER' then
            Result := 'select column_name from information_schema.columns where table_name = ''%s'' and column_name = ''%s'' '   //select 1 from syscolumns where id = object_id('Tabela') and name = 'Coluna'
         else
         if pDBType = 'ORACLE' then
            Result := ''
         else
         if pDBType = 'SQLITE' then
            Result := '';
    end
    else
    if pDefinition = 'keyfield' then
    begin
         // pode melhorar... claro... mas como o objetivo é adequar-se a todos os bancos usados
         // ficou simples de obter a informacao necessária
         //
         // o SQLITE fica em standby...
         cTypes := '      CASE  ' +
                   '      WHEN data_type  = ''varying''   THEN  ''ftString'' ' +
                   '      WHEN data_type  = ''character varying''   THEN  ''ftString'' ' +
                   '      WHEN data_type  = ''character'' THEN  ''ftString'' ' +
                   '      WHEN data_type  = ''varchar''   THEN  ''ftString'' ' +
                   '      WHEN data_type  = ''char''      THEN  ''ftString'' ' +
                   '      WHEN data_type  = ''text''      THEN  ''ftString'' ' +
                   '      WHEN data_type  = ''longtext''  THEN  ''ftString''      ' +
                   '      WHEN data_type  = ''int''       THEN  ''ftInteger'' ' +
                   '      WHEN data_type  = ''smallint''  THEN  ''ftInteger'' ' +  // <- ajuda do RAI
                   '      WHEN data_type  = ''bytea''     THEN  ''ftInteger'' ' +
                   '      WHEN data_type  = ''integer''   THEN  ''ftInteger'' ' +
                   '      WHEN data_type  = ''decimal''   THEN  ''ftFloat'' ' +
                   '      WHEN data_type  = ''numeric''   THEN  ''ftFloat'' ' +
                   '      WHEN data_type  = ''double''    THEN  ''ftFloat'' ' +
                   '      WHEN data_type  = ''float''     THEN  ''ftFloat''  ' +
                   '      WHEN data_type  = ''date''      THEN  ''ftDate''  ' +
                   '      WHEN data_type  = ''time without time zone''      THEN  ''ftTime''  ' +
                   '      WHEN data_type  = ''time with time zone''      THEN  ''ftTime''  ' +
                   '      WHEN data_type  = ''time''      THEN  ''ftTime''  ' +
                   '      WHEN data_type  = ''timeestamp'' THEN  ''ftDateTime''   ' +
                   '      WHEN data_type  = ''timestamp without time zone'' THEN  ''ftDateTime''   ' +
                   '      WHEN data_type  = ''timestamp with time zone'' THEN  ''ftDateTime''   ' +
                   '      ELSE ''ftUnknown''  ' +
                   '      END AS type  ';

         if pDBType = 'FIREBIRD' then
            Result :=  ' select lower(field_name) as name, lower(field_type) as type ' +
                       ' from VIEW_DB_STRUCTURE ' + // ' from estrutura_view_basica '
                       ' where lower(table_name) = ''%s'' ' +
                       ' and primary_key = ''Y'' '
         else
         if pDBType = 'PGSQL' then
            Result := ' select ' +
                      '     c.column_name as name, ' + cTypes +
                      ' from ' +
                      '     information_schema.table_constraints tc' +
                      '     join information_schema.constraint_column_usage AS ccu USING (constraint_schema, constraint_name)' +
                      '     join information_schema.columns AS c ON c.table_schema = tc.constraint_schema' +
                      '          and tc.table_name = c.table_name AND ccu.column_name = c.column_name' +
                      ' where ' +
                      '     constraint_type = ''PRIMARY KEY'' and tc.table_name = ''%s'' '
         else
         if pDBType = 'MYSQL' then
            Result := ' select column_name as name, ' + cTypes +
                      ' from information_schema.columns ' +
                      ' where table_name = ''%s'' ' +
                      ' and table_schema = ' + quotedstr( mm.CONFIG_DATABASE_NAME ) + // <- ajuda do RAI com MySQL
                      ' and column_key = ''PRI'''
         else
         if pDBType = 'SQLSERVER' then  // dica FOLIVEIRA
           // FOLIVEIRA - Correção pois não estava retornando os campos corretos - 07-02-2020 17:14hs //WideView
            Result := ' Select ' +
                      ' KU.column_name as name, ' +
                      ' ISC.DATA_TYPE as type   ' +
                      ' FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS       AS TC ' +
                      ' INNER JOIN  INFORMATION_SCHEMA.KEY_COLUMN_USAGE AS KU  ON TC.CONSTRAINT_TYPE = '+QuotedStr('PRIMARY KEY')+' AND ' +
                      ' TC.CONSTRAINT_NAME = KU.CONSTRAINT_NAME AND KU.table_name = ' + QuotedStr('%s') +
                      ' INNER JOIN INFORMATION_SCHEMA.COLUMNS           AS ISC ON ISC.TABLE_NAME = KU.TABLE_NAME AND ISC.COLUMN_NAME = KU.COLUMN_NAME '
         else
         if pDBType = 'ORACLE' then
            Result := ''
         else
         if pDBType = 'SQLITE' then
            Result := 'pragma table_info(''%s'')' // apos trazer o resultado, filtra0se pelo "pk = 1"
    end;
end;
// v. 3.0.0.0
// retorna o primeiro campo PK da tabela, mas
// mantem em memoria o "memStructure" , caso mais de um campo
// forme a PK
function tdm_rc.rc_GetPrimaryKey(pTable: string): string;
// v. 3.2.0..7
var
   //cField_FK,
   cField_PK,
   cField_TYPE,
   cRDBMS,
   cSql : string;

   bEOF , bBOF : boolean;

   //vPK_List : TStrings;
   //i : integer;
begin
     Result := '';

     // tentativa de pegar o KEYFIELD..
     memStructure.Close;

     memPK.Filtered := false;
     memPK.First;

     // se já tiver criado a estrutura em memoria, pesquisa nela
     // pra otimizar o processo
     //
     // FDMemTable  para apoio a PK dinamica
     if not memPK.Locate( 'table' , trim(pTable) , [] ) then
     begin
        // por padrao, quando não é passado um order by, GetRegistro assume o primeiro campo ( q seria a PK padrão )
        // o pseudo parametro 'noorder.' avisa para não adicionar um order by no caso do retorno da PK( REMOVIDO )
        //
        if not mm.varB_Use_FireDac then
           cRDBMS := mm.CONFIG_DATABASE_RDW
        else
           cRDBMS := mm.CONFIG_DATABASE_FIREDAC;

        cSql := format( rc_GetSQL( cRDBMS , 'keyfield' ) , [ trim(pTable) ] );

        memStructure.Data := rc_GetRecord( mm.varB_Use_FireDac , true,  'noorder.' + cSql );

        if mm.varC_LastErrorMsg <> '' then
        begin
          raise Exception.Create( mm.varC_LastErrorMsg ); // v. 4.0.0.0
        end;

        // se nao pos o ORDER acrescenta para nao dar erro no ROWS / LIMIT
        // mas só se não tiver o PRAGMA( pra trazer a estrutura LOCAL do SQLITE )
        // ou nao vier do MySQL tb...
        //
        if ( Pos( 'pragma', lowercase( cSql ) ) > 0 ) then
        begin
             memStructure.Filtered := false;
             memStructure.Filter := 'pk=1';
             memStructure.Filtered := true;
        end;

        // caso a tabela não tenha uma chave primária( PK ),
        // vai assumir o campo padrão do RADCORE - "CODIGO"
        //
        // v. 3.2.0.5
        //if trim(pTable) = 'planocontas' then // <- essa é uma situação particular da tabela planocontas
        if AnsiMatchStr( trim(pTable) , ARRAY_PK_PRIOR ) then
        begin
            memStructure.Last;
        end;

        cField_PK   := trim(lowercase( memStructure.FieldByName( 'name' ).AsString ));
        cField_TYPE := trim(lowercase( memStructure.FieldByName( 'type' ).AsString ));

        if cField_PK = '' then
        begin
           if not rc_FieldExists( mm.varB_Use_FireDac , 'codigo' , trim(pTable) ) then
           begin
               rc_ShowSweetAlert( mm.MSG_ERROR, format( mm.MSG_TABLE_DO_NOT_EXIST, [ trim(pTable) ] )  , 'error' ); // v. 3.3.1.0
               Abort;
           end;
           cField_PK   := 'codigo';
           cField_TYPE := 'ftinteger';
        end;

        // Append data
        memPK.Filtered := false;
        memPK.Open;

        // montar lista de PK´s
        if AnsiMatchStr( trim(pTable) , ARRAY_PK_PRIOR ) then
        begin
            memStructure.Last;

            bBOF := false;

            while ( not bBOF ) or ( memPK.IsEmpty ) do
            begin
               memPK.AppendRecord( [  trim(pTable) ,
                                       cField_PK,
                                       cField_TYPE ] );

               memStructure.Prior;

               cField_PK   := trim(lowercase( memStructure.FieldByName( 'name' ).AsString ));
               cField_TYPE := trim(lowercase( memStructure.FieldByName( 'type' ).AsString ));

               bBOF := memStructure.bof;
            end;
        end
        else
        begin
            memStructure.First;

            bEOF := false; // ao entrar... o EOF ja vem TRUE... e precisamos gravr o primeiro....

            while ( not bEOF ) do
            begin
               memPK.AppendRecord( [  trim(pTable) ,
                                      cField_PK,
                                      cField_TYPE ] );

               memStructure.Next;

               cField_PK := trim(lowercase( memStructure.FieldByName( 'name' ).AsString ));
               cField_TYPE := trim(lowercase( memStructure.FieldByName( 'type' ).AsString ));

               bEOF := memStructure.eof;
            end;
        end;

        if not dm_rc.memGridPK.Locate( 'field' , cField_PK , [] ) then
           dm_rc.memGridPK.AppendRecord( [ cField_PK ] );

        memStructure.Filtered := false;
     end;

     memPK.Filtered := false;
     memPK.Filter   := 'table=' + QuotedStr( trim(pTable) );
     memPK.Filtered := true;
     memPK.First;
     Result := trim(lowercase( memPK.FieldByName( 'pk' ).AsString ));
end;
// v. 3.3.1.0
procedure Tdm_rc.rc_BuildMainMenu( pSearch: string; pTreeMenu : TUniTreeMenu );
Var
  aMenuLevels : Array [1..5] of TUniTreeNode;

  MainItem,
  MainItemSub1,
  MainItemSub2,
  MainItemSub3,
  MainItemSub4: TUniTreeNode;

  Item, cTemp : String;

  iPerm,
  c, I ,f1, f2, f3, iItemMenu     : integer;

  bAskNew,
  bGenID,
  bCloseBtn, // v. 3.2.0.6 //closebtn
  bHidden,
  bMaster, bNotShow, // v. 4.0.0.0
  bSubMenus,
  bShow : boolean;

  cIco, cFrm, cTbl, cFld, cMenuListItem,
  s1, s2,
  vItem_next,
  vItem_prior,
  vItem : string;
  // v. 4.0.0.4
  oObj : TUniControl;

    procedure rc_BuildMENUS( _pesquisa : string; pMenuList, pMenuListPermissions : array of string ) ;
    begin
      try
        vItem_prior := ' ';
        I := 1;

        MainItemSub1 := nil;
        MainItemSub2 := nil;
        MainItemSub3 := nil;
        MainItemSub4 := nil;

        while ( I <= High( pMenuList ) ) do
        begin
             vItem_prior := pMenuList[ i - 1 ];
             vItem := pMenuList[ i  ];

             if ( Pos( '@' , vItem_prior ) > 0 ) then
             begin
                vItem_prior := trim(Copy( vItem_prior , 1, Pos( '@' , vItem_prior ) -1 ));
             end
             else
             if ( Pos( 'ico:' , vItem_prior ) > 0 ) then
             begin
                vItem_prior := trim(Copy( vItem_prior , 1, Pos( 'ico:' , vItem_prior ) -1 ));
             end;

             f1 := strTokenCount( vItem , ']' ) - 1;

             Item := vItem;

             if f1<=0 then
                f1 := 0;

             if Pos( '@' , vItem ) > 0 then
             begin
                Item := trim(Copy( vItem , Pos( '@' , vItem ) + 1, 100 ));
                vItem := StringReplace( vItem , '@' + Item, '', [rfReplaceAll] );

                if Pos( ']', vItem ) > 0 then
                   Item := '<i class="rc-tree-align-icon ' + 'fa ' + Item + '"></i><span> ' + StringReplace( Trim( Copy( vItem , f1 , 100 ) ) , ']' , '', [rfReplaceAll] ) + ' </span> '
                else
                   Item := '<i class="rc-tree-align-icon ' + 'fa ' + Item + '"></i><span> ' + vItem + ' </span> ';
             end
             else
             if Pos( 'ico:' , vItem ) > 0 then
             begin
                // v. 3.2.0.6
                Item := trim(Copy( vItem , Pos( 'ico:' , vItem ) + 4, 200 )) ;
                vItem := Copy( vItem, 1, Pos( 'ico:', vItem ) - 1 );
                //vItem := StringReplace( vItem , 'ico:' + Item, '', [rfReplaceAll] );;

                // substituir fa- fas- far- etc..
                if Copy( Item , 1, 2 ) = 'fa' then
                begin
                   cIco := Copy( Item , 1, pos( '-', Item ) - 1 );
                   Item := cIco + ' fa-' + Copy( Item , pos( '-', Item ) + 1, 100 );
                end;

                if Pos( ']', vItem ) > 0 then
                   Item := '<i class="rc-tree-align-icon ' + Item + '"></i><span> ' + StringReplace( Trim( Copy( vItem , f1 , 100 ) ) , ']' , '', [rfReplaceAll] ) + ' </span> '
                else
                   Item := '<i class="rc-tree-align-icon ' + Item + '"></i><span> ' + vItem + ' </span> ';
             end
             else
             begin
                  // SubMenus ...
                  if Pos( ']', vItem ) > 0 then
                  begin
                     if f1 = 99 then
                        Item := '<i class="rc-treemenu-title" style="pointer-events: none;"></i><span> ' + StringReplace( Trim( Copy( vItem , f1 , 100 ) ) , ']' , '', [rfReplaceAll] ) + ' </span> '
                     else
                     if f1 > 0 then
                        Item := '<i class="rc-tree-align-icon"></i><span> ' + StringReplace( Trim( Copy( vItem , f1 , 100 ) ) , ']' , '', [rfReplaceAll] ) + ' </span> '
                     else
                        Item := StringReplace( Trim( Copy( vItem , f1 , 100 ) ) , ']' , '', [rfReplaceAll] );
                  end
                  else
                      Item := vItem;
             end;

             // montar o Array com as informacoes do MENU e sua respectiva TABELA
             if ( Item = '-1' ) then
                Inc( i )
             else
             if ( f1 >= 0 ) then
             begin
                  if f1 = 4  then
                  begin
                     MainItemSub3 := pTreeMenu.Items.AddChild( MainItemSub2, Item );
                  end
                  else
                  if f1 = 3  then
                  begin
                     MainItemSub2 := pTreeMenu.Items.AddChild( MainItemSub1, Item );
                  end
                  else
                  if f1 = 2  then
                  begin
                     MainItemSub1 := pTreeMenu.Items.AddChild( MainItem, Item );
                  end
                  else
                  if ( f1 = 1 ) then // v. 3.2.0.0
                  begin
                     MainItem := pTreeMenu.Items.AddChild( nil, Item );
                  end
                  else
                  if ( f1 = 99 ) then // v. 3.2.0.0
                  begin
                     MainItem := pTreeMenu.Items.AddChild( nil, Item );
                     //MainItem := pTreeMenu.Items.AddChild( nil, '<div class="rc-treemenu-title" style="font-size:10px; color:#888; text-transform:uppercase; left:-10px">' + Item + '</div>' );
                     //MainItem := pTreeMenu.Items.AddChild( nil, '<div class="rc-treemenu-title">' + Item + '</div>' );
                     //MainItem.Text := '<div class="rc-treemenu-title">' + Item + '</div>' ;
                     //rc_AddCssClass( MainItem, 'rc-treemenu-title' );
                     MainItem.Tag  := f1;
                     MainItem.Enabled := false;
                     MainItem.Text := '<div class="rc-treemenu-title unselectable" style="font-size:10px; background-color: transparent !important; color:#888; text-transform:uppercase; left:-10px">' + Item + '</div>';
                  end;

                  // se foi um grupo de nivel...reinicia o processo e não processa mais nada em seguida...
                  if ( f1 = 99 ) then
                  begin
                       Inc( I );
                  end
                  else
                  begin
                      vItem_prior := pMenuList[ i ];

                      // processa até o próximo SUBMENU ou até o fim
                      // processes until the next SUBMENU or until the end
                      Repeat
                         if f1 > 0 then
                            Inc( I );

                         if I = 50 then
                            f1 := f1;

                         if ( I <= High( pMenuList ) ) and ( pMenuList[ i ] <> '-1' ) then
                         begin
                            bShow := true;

                            if ( Trim( _pesquisa ) <> '' ) then
                               if ( Pos( lowercase( _pesquisa ) , lowercase( vItem ) ) > 0 ) then
                                  bShow := True
                               else
                                  bShow := False;

                            bSubMenus := ( Copy( pMenuList[ i ], 1, 1 ) = ']' );

                            if ( ( Pos( '|', pMenuList[ i ] ) > 0 ) or
                               ( Pos( 'frm:', pMenuList[ i ] ) > 0 ) or
                               ( Pos( 'tbl:', pMenuList[ i ] ) > 0 ) ) or
                               ( not bSubMenus ) then
                            begin
                                 // tests
                                 if Pos( 'rcblock' ,pMenuList[ i  ].ToLower ) > 0 then
                                    f1 := f1;

                                 if ( Pos( '|', pMenuList[ i ] ) > 0 ) then
                                    vItem := Trim( Copy( pMenuList[ i ] , 1, Pos( '|', pMenuList[ i ] ) - 1 ) )
                                 else
                                    vItem := pMenuList[ i ];

                                 if Pos( '@' , vItem ) > 0 then
                                 begin
                                    Item := trim(Copy( vItem , Pos( '@' , vItem ) + 1, 100 ));
                                    vItem := StringReplace( vItem , '@' + Item, '', [rfReplaceAll] );

                                    if Pos( ']', vItem ) > 0 then
                                       Item := '<i class="rc-tree-align-icon ' + 'fa ' + Item + '"></i><span> ' + StringReplace( Trim( Copy( vItem , f1 , 100 ) ) , ']' , '', [rfReplaceAll] ) + ' </span> '
                                    else
                                       Item := '<i class="rc-tree-align-icon ' + 'fa ' + Item + '"></i><span> ' + vItem + ' </span> ' ;

                                    // versao 1530 acima..traz FONTAWESOME 5
                                    mm.varA_FSideMenu[ mm.varI_NumMenu ].image := 'fa ' + Item;
                                 end
                                 else
                                 if Pos( 'ico:' , vItem ) > 0 then
                                 begin
                                    // v. 3.2.0.6
                                    Item := trim(Copy( vItem , Pos( 'ico:' , vItem ) + 4, 200 )) ;
                                    vItem := Copy( vItem, 1, Pos( 'ico:', vItem ) - 1 );
                                    //vItem := StringReplace( vItem , 'ico:' + Item, '', [rfReplaceAll] );;

                                    // substituir fa- fas- far- etc..
                                    if Copy( Item , 1, 2 ) = 'fa' then
                                    begin
                                       cIco := Copy( Item , 1, pos( '-', Item ) - 1 );
                                       Item := Trim( Copy( Item , pos( '-', Item ) + 1, pos( ' ', Item ) ) ) + ' ';
                                       Item := cIco + ' fa-' + Copy( Item , 1, pos( ' ', Item ) - 1 );
                                    end;

                                    if Pos( ']', vItem ) > 0 then
                                       Item := '<i class="rc-tree-align-icon ' + Item + '"></i><span> ' + StringReplace( Trim( Copy( vItem , f1 , 100 ) ) , ']' , '', [rfReplaceAll] ) + ' </span> '
                                    else
                                       Item := '<i class="rc-tree-align-icon ' + Item + '"></i><span> ' + vItem + ' </span> ' ;

                                    // versao 1530 acima..traz FONTAWESOME 5
                                    mm.varA_FSideMenu[ mm.varI_NumMenu ].image := Item;
                                 end
                                 else
                                 begin
                                      if Pos( ']', vItem ) > 0 then
                                      begin
                                         if f1 > 0 then
                                            Item := '<i class="rc-tree-align-icon"></i><span> ' + StringReplace( Trim( Copy( vItem , f1 , 100 ) ) , ']' , '', [rfReplaceAll] ) + ' </span> '
                                         else
                                            Item := StringReplace( Trim( Copy( vItem , f1 , 100 ) ) , ']' , '', [rfReplaceAll] );
                                      end
                                      else
                                          Item := vItem;

                                      Item := '<i style="color:#f99500" class="rc-tree-align-icon far fa-dot-circle"></i><span> ' + vItem + ' </span> ' ;

                                      // versao 1530 acima..traz FONTAWESOME 5
                                      mm.varA_FSideMenu[ mm.varI_NumMenu ].image := 'far fa-dot-circle';

                                      // v. 3.2.0.0
                                      if f1 = 99 then
                                         Item := '<i class="rc-treemenu-title"></i><span> ' + vItem + ' </span> ' ;
                                 end;

                                 //if bShow then
                                 begin
                                     cMenuListItem := pMenuList[ i ] + ' ';

                                     if Pos( 'rcblock', lowercase( cMenuListItem ) ) > 0 then
                                        cMenuListItem := cMenuListItem ;
                                     // v. 3.2.0.6 //closebtn
                                     bCloseBtn := true;
                                     if ( Pos( 'closebtn:', cMenuListItem ) > 0 ) then
                                     begin
                                        bCloseBtn := false;
                                        cMenuListItem := StringReplace( cMenuListItem, 'closebtn:' , '', [rfReplaceAll] );
                                        Item := StringReplace( Item , 'closebtn:' , '', [rfReplaceAll] );
                                     end;

                                     if ( Pos( 'ico:', cMenuListItem ) > 0 ) then
                                     begin
                                        cIco := Copy( cMenuListItem , Pos( 'ico:', cMenuListItem ) + 4, 100 );
                                        cIco := Trim( Copy( cIco , 1, Pos( ' ', cIco )) );
                                        cMenuListItem := StringReplace( cMenuListItem, 'ico:' + cIco, '', [rfReplaceAll] );

                                        Item := StringReplace( Item , 'ico:' + cIco, '', [rfReplaceAll] );
                                     end;

                                     cFrm := '';
                                     if ( Pos( 'frm:', cMenuListItem ) > 0 ) then
                                     begin
                                        cFrm := Copy( cMenuListItem , Pos( 'frm:', cMenuListItem ) + 4, 100 );
                                        cFrm := Trim( Copy( cFrm , 1, Pos( ' ', cFrm )) );
                                        cMenuListItem := StringReplace( cMenuListItem, 'frm:' + cFrm, '', [rfReplaceAll] );

                                        Item := StringReplace( Item , 'frm:' + cFrm, '', [rfReplaceAll] );
                                     end;

                                     cTbl := '';
                                     if ( Pos( 'tbl:', cMenuListItem ) > 0 ) then
                                     begin
                                        cTbl := Copy( cMenuListItem , Pos( 'tbl:', cMenuListItem ) + 4, 100 );
                                        cTbl := Trim( Copy( cTbl , 1, Pos( ' ', cTbl ) ) );
                                        cMenuListItem := StringReplace( cMenuListItem, 'tbl:' + cTbl, '', [rfReplaceAll] );
                                        Item := StringReplace( Item , 'tbl:' + cTbl, '', [rfReplaceAll] );
                                     end;

                                     cFld := '';
                                     if ( Pos( 'fld:', cMenuListItem ) > 0 ) then
                                     begin
                                        cFld := Copy( cMenuListItem , Pos( 'fld:', cMenuListItem ) + 4, 100 );
                                        cFld := Trim( Copy( cFld , 1, Pos( ' ', cFld ) ) );
                                        cMenuListItem := StringReplace( cMenuListItem, 'fld:' + cFld, '', [rfReplaceAll] );
                                        Item := StringReplace( Item , 'fld:' + cFld, '', [rfReplaceAll] );
                                     end;

                                     bHidden := false;
                                     if ( Pos( 'hide:', cMenuListItem ) > 0 ) then
                                     begin
                                        bHidden := True;
                                        cMenuListItem := StringReplace( cMenuListItem, 'hide:' , '', [rfReplaceAll] );
                                        Item := StringReplace( Item , 'hide:' , '', [rfReplaceAll] );
                                     end;
                                     // v. 4.0.0.0
                                     bNotShow := False;
                                     if ( Pos( 'notshow:', cMenuListItem ) > 0 ) then
                                     begin
                                        bNotShow := True;
                                        cMenuListItem := StringReplace( cMenuListItem, 'notshow:' , '', [rfReplaceAll] );
                                        Item := StringReplace( Item , 'notshow:' , '', [rfReplaceAll] );
                                     end;
                                     // v. 4.0.0.0
                                     bMaster := false;
                                     if ( Pos( ' m:', cMenuListItem ) > 0 ) then
                                     begin
                                        bMaster := True;
                                        cMenuListItem := StringReplace( cMenuListItem, ' m:' , '', [rfReplaceAll] );
                                        Item := StringReplace( Item , ' m:' , '', [rfReplaceAll] );
                                     end;

                                     bAskNew := false;
                                     if ( Pos( 'asknew:', cMenuListItem ) > 0 ) then
                                     begin
                                        bAskNew := True;
                                        cMenuListItem := StringReplace( cMenuListItem, 'asknew:' , '', [rfReplaceAll] );
                                        Item := StringReplace( Item , 'asknew:' , '', [rfReplaceAll] );
                                     end;

                                     bGenID := false;
                                     if ( Pos( 'genid:', cMenuListItem ) > 0 ) then
                                     begin
                                        bGenID := True;
                                        cMenuListItem := StringReplace( cMenuListItem, 'genid:' , '', [rfReplaceAll] );
                                        Item := StringReplace( Item , 'genid:' , '', [rfReplaceAll] );
                                     end;

                                     if ( cFrm <> '' ) and
                                        ( ( ( Pos( '|', cMenuListItem ) = 0 ) and ( cTbl = '' ) ) or
                                        ( ( Pos( '|', cMenuListItem ) = 0 ) and ( cTbl <> '' ) ) or
                                        ( Pos( 'reportmenu' , pMenuList[ i ].ToLower ) > 0  ) ) then
                                        cFrm := '__' + cFrm // retro-compatibilidade( FORM sem heraça )
                                     else
                                     if ( Pos( '|', cMenuListItem ) > 0 ) then
                                     begin
                                        cTbl := Trim( Copy( cMenuListItem , Pos( '|', cMenuListItem ) + 1, 100 ) );
                                        cMenuListItem := Copy( cMenuListItem, 1, Pos( '|', cMenuListItem ) - 1 );
                                     end;

                                     ctemp := '';
                                     if ( cFrm <> '' ) then
                                     begin
                                        cTbl := cTbl + cFrm;
                                     end;

                                     mm.varA_FSideMenu[ mm.varI_NumMenu ].option           := Trim( item );
                                     mm.varA_FSideMenu[ mm.varI_NumMenu ].table            := cTbl;
                                     mm.varA_FSideMenu[ mm.varI_NumMenu ].RestrictionField := cFld;
                                     mm.varA_FSideMenu[ mm.varI_NumMenu ].Hidden           := bHidden;
                                     mm.varA_FSideMenu[ mm.varI_NumMenu ].AskNew           := bAskNew;
                                     mm.varA_FSideMenu[ mm.varI_NumMenu ].GenID            := bGenID;
                                     mm.varA_FSideMenu[ mm.varI_NumMenu ].Modal            := Pos( '__modal_', cFrm ) > 0;
                                     mm.varA_FSideMenu[ mm.varI_NumMenu ].CloseBtn         := bCloseBtn; // v. 3.2.0.6 //closebtn
                                     mm.varA_FSideMenu[ mm.varI_NumMenu ].NotShow          := bNotShow; // v. 4.0.0.0
                                     mm.varA_FSideMenu[ mm.varI_NumMenu ].Master           := bMaster;  // v. 4.0.0.0

                                     if Pos( 'racing', lowercase(item) ) > 0 then
                                        cTbl := cTbl;

                                     mm.varA_FSideMenu[ mm.varI_NumMenu ].permission := '';
                                     iPerm := dm_rc.rc_GetIndexFromArray ( i.ToString + '.' , pMenuListPermissions ) - 1;
                                     if iPerm > 0 then
                                     begin
                                        mm.varA_FSideMenu[ mm.varI_NumMenu ].permission := iPerm.ToString;

                                        while ( iPerm <= High( pMenuListPermissions ) ) and ( Pos( i.ToString + '.',  pMenuListPermissions[ iPerm ] ) > 0 ) do
                                        begin
                                           mm.varA_FSideMenuPermissions[ mm.varI_NumMenuPermissions ] :=
                                              mm.varC_MenuGroup + '<|>' +  //group
                                              Trim( item ) + '<|>' +                     //option
                                              Trim( cTbl ) + '<|>' +                     //table -
                                              Trim( cFld ) + '<|>' +                     //field -
                                              pMenuListPermissions[ iPerm ];             //permission item

                                           inc( iPerm );

                                           Inc( mm.varI_NumMenuPermissions );
                                        end;
                                     end;
                                     // v. 4.0.0.0
                                     //==================================================================================
                                     // [PT]
                                     // verifica restricao do usuário ao parâmetros "HIDDEN" na função "rc_BuildMenuItem"
                                     // A opção só será exibida se nas permissões do cadastro desse usuário estiver marcado
                                     // que tem "ACESSO" ou se for ADMIN( MASTER USER )
                                     // [EN]
                                     // check user restriction to "HIDDEN" parameters in "rc_BuildMenuItem" function
                                     // The option only will be displayed if this user's registration permissions is checked
                                     // which has "ACCESS" or if it is ADMIN( MASTER USER )
                                     //==================================================================================
                                     mm.varB_Yes := false;
                                     //if Pos( 'racing', lowercase(item) ) > 0 then
                                     if ( not mm.varA_FSideMenu[ mm.varI_NumMenu ].NotShow ) then
                                     begin
                                        mm.varB_Yes :=  ( dm_rc.rc_PermissionVerify( 'showMenuOption' ,
                                                             varIIF( mm.varA_FSideMenu[ mm.varI_NumMenu ].RestrictionField = '',
                                                                     mm.varA_FSideMenu[ mm.varI_NumMenu ].table ,
                                                                     mm.varA_FSideMenu[ mm.varI_NumMenu ].RestrictionField ),
                                                             PT_ACCESS ) );
                                        // permission to see HIDDEN options
                                        if ( not mm.varA_FSideMenu[ mm.varI_NumMenu ].Hidden ) or
                                           ( ( mm.varA_FSideMenu[ mm.varI_NumMenu ].Hidden ) and ( mm.varB_Yes ) ) then
                                        begin
                                            if f1 = 4  then
                                               MainItemSub4 := pTreeMenu.Items.AddChild( MainItemSub3, mm.varA_FSideMenu[ mm.varI_NumMenu ].option )
                                            else
                                            if f1 = 3  then
                                               MainItemSub3 := pTreeMenu.Items.AddChild( MainItemSub2, mm.varA_FSideMenu[ mm.varI_NumMenu ].option )
                                            else
                                            if f1 = 2  then
                                               MainItemSub2 := pTreeMenu.Items.AddChild( MainItemSub1, mm.varA_FSideMenu[ mm.varI_NumMenu ].option )
                                            else
                                            if f1 = 1  then
                                               MainItemSub1 := pTreeMenu.Items.AddChild( MainItem, mm.varA_FSideMenu[ mm.varI_NumMenu ].option )
                                            else
                                            if f1 = 0  then
                                               MainItem := pTreeMenu.Items.AddChild( Nil, mm.varA_FSideMenu[ mm.varI_NumMenu ].option )
                                            else // v. 3.2.0.0
                                            if f1 = 99 then
                                            begin
                                               MainItem := pTreeMenu.Items.AddChild( Nil, mm.varA_FSideMenu[ mm.varI_NumMenu ].option );
                                               MainItem.Text := mm.varA_FSideMenu[ mm.varI_NumMenu ].option + 'fixo';
                                            end;

                                            Inc( mm.varI_NumMenu );
                                        end;
                                     end;
                                 end;
                            end;
                         end;

                         if f1 = 0 then
                            Inc( I );

                         if ( I <= High( pMenuList ) ) then
                            f3 := strTokenCount( pMenuList[ i ] , '>' ) ;

                      Until ( pMenuList[ i ] = '-1' ) or ( I > High( pMenuList ) ) or ( Copy( pMenuList[ i ] , 1, 1 ) = ']' ) ;
                  end;

             end;
        end;
      except on e:exception do
             begin
                 rc_ShowSweetAlertError( 'rcBuildMainMenu<br><br>' + e.Message );
             end;
      end;
    end;
begin
     //------------------------------------------------------------------------------------------------------------------------------
     // Variaveis de controle do menu lateral - PODEM MUDAR SE A ATUACAO FOR ALTERADA em TEMPO DE EXECUCAO
     // Montar a estrutura
     //------------------------------------------------------------------------------------------------------------------------------
     // Side menu control variables - MAY CHANGE IF ACTION IS CHANGED IN EXECUTION TIME
     // Assemble the structure
     //------------------------------------------------------------------------------------------------------------------------------
     rc_BuildMenu_BASICS;
     rc_BuildMenu_MOVEMENT;
     rc_BuildMenu_REPORTS;
     rc_BuildMenu_TOOLS;
     rc_BuildMenu_OTHERS;

     // para zerar o ARRAY de itens de menu a cada exibição do menu lateral

     mm.varI_Temp1 := Length( mm.varA_MenuBasicsPermissions ) +
                      Length( mm.varA_MenuMovementPermissions ) +
                      Length( mm.varA_MenuReportPermissions ) +
                      Length( mm.varA_MenuToolsPermissions ) +
                      Length( mm.varA_MenuOptionsPermissions ) ;

     SetLength( mm.varA_FSideMenuPermissions , mm.varI_Temp1 );

     mm.varI_Temp1 := Length( mm.varA_MenuBasics ) +
                                 Length( mm.varA_MenuMovement ) +
                                 Length( mm.varA_MenuReport ) +
                                 Length( mm.varA_MenuTools ) +
                                 Length( mm.varA_MenuOptions ) ;

     SetLength( mm.varA_FSideMenu , mm.varI_Temp1 );


     mm.varA_FSideMenu[ 0 ].option := '';
     mm.varA_FSideMenu[ 0 ].table  := '';
     mm.varA_FSideMenu[ 0 ].image  := '';
     mm.varA_FSideMenu[ 0 ].permission := '';

     mm.varI_NumMenu    := 1;
     mm.varI_NumMenuPermissions := 1;
     //_sideMenuOK := False;

    vItem_prior := ' ';
    I := 1;

    // para versoes antigas do uniGUI, descomente as linhas abaixo
    // caso sua pesquisa esteja duplicando os itens
    //for I := 0 to pTreeMenu.Items.Count - 1 do
    //begin
    //
    //  pTreeMenu.Items[I].Text := '';
    //
    //end;
    pTreeMenu.Items.Clear;

    // varC_MenuGroup it´s used to fill dynamic permissions in "frmCadUSUARIOS"( USERS )
    mm.varC_MenuGroup := lowercase( mm.MNU_BASICS );// 'basicos';
    rc_BuildMENUS ( pSearch, mm.varA_MenuBasics, mm.varA_MenuBasicsPermissions );

    mm.varC_MenuGroup := lowercase( mm.MNU_MOVEMENT );//'movimento';
    rc_BuildMENUS ( pSearch, mm.varA_MenuMovement, mm.varA_MenuMovementPermissions );

    mm.varC_MenuGroup := lowercase( mm.MNU_REPORT );//'relatorios';
    rc_BuildMENUS ( pSearch, mm.varA_MenuReport, mm.varA_MenuReportPermissions );

    mm.varC_MenuGroup := lowercase( mm.MNU_TOOLS );//'ferramentas';
    rc_BuildMENUS ( pSearch, mm.varA_MenuTools, mm.varA_MenuToolsPermissions );

    mm.varC_MenuGroup := lowercase( mm.MNU_OTHERS );//'outros';
    rc_BuildMENUS ( pSearch, mm.varA_MenuOptions, mm.varA_MenuOptionsPermissions );

    if pSearch <> '' then
    begin
        for I := 0 to pTreeMenu.Items.Count - 1 do
        begin
          s1 := LowerCase( pTreeMenu.Items[I].Text);
          s2 := LowerCase( pSearch );

          pTreeMenu.Items[I].Visible := (Length(s2) = 0) or (Pos(s2, s1 )>0);
          pTreeMenu.Items[I].Expanded := true;
        end;
    end;
end;

initialization
  RegisterModuleClass(tdm_rc);

end.
