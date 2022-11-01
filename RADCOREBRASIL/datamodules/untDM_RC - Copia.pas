﻿unit untDM_RC;

interface

uses
  SysUtils, Classes, Controls,  TypInfo,
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
  uniHTMLFrame, uniURLFrame,
  uMenu_BASICS, uMenu_TOOLS, uMenu_MOVEMENT, uMenu_OTHERS, uMenu_REPORTS, mkm_menus,
  IdHashMessageDigest, uniDBGrid, Graphics,StrUtils,
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
    UniSweetAlert: TUniSweetAlert;
    sqlLookUpSearch: TFDQuery;
    dsLookUpSearch: TDataSource;
    UniGridExcelExporter1: TUniGridExcelExporter;
    UniGridXMLExporter1: TUniGridXMLExporter;
    UniGridHTMLExporter1: TUniGridHTMLExporter;
    UniGridCSVExporter1: TUniGridCSVExporter;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    var  C : TUniClientInfoRec;
  public
    { Public declarations }
    cMSG_SEARCH_RECORD,
    // v. 3.1.0.60
    // this variables were sent to mainmodule
//    mm.MSG_ACCESS_TO,
//    mm.MSG_ACCESS_INSERT_TO,
//    mm.MSG_ACCESS_EDIT_TO,
//    mm.MSG_ACCESS_DELETE_TO,
//    mm.MSG_ACCESS_SEARCH_TO,
//    mm.MSG_ACCESS_MOVE_TO,
    cMSG_BUGERROR_DATABASE_CONN : string; //'Falha ao conectar com o Banco de Dados '
    // pCloseALL: fecha todos datasets em todos datamodules
    // pCloseConnection: fecha os FDConnections( será usado quando for encerrar a aplicação )
    procedure rc_CloseQuerys( pRoot : TComponent; pCloseALL, pCloseConnections : boolean);
    function  rc_OpenQuery( pQry : TFDQuery; pSW : boolean = false ) : Boolean;
    // deleta o reg. clicado no GRID DE PESQUISA PADRAO
    function  rc_DeleteActiveRecord( pTable : string; pQryMaster, pQrySearchMaster : TFDQuery; pId : integer; pShowMsgAfterDel : boolean = true ):boolean; // v. 3.1.0.60
    function  rc_DeleteRecord( pTable : String = ''; pWhere : string = ''):boolean;
    function  rc_HasCodeRegistered( pTable : string; pId: string): string;
    // retorna o conteudo de um campo qualquer
    // deixei informacao do TIPO como parametro para diminuir o acesso ao BD( principalmente ON LINE )
    function  rc_GetSQL( pDBType, pDefinition: string; pIni : integer = 0; pEnd : integer = 0 ; pS1 : string = ''): string; // v. 3.1.0.63
    //----------[[RESTDATAWARE
//    function  rc_ConnectRestDATAWARE( pDataBase: TRestDWDataBase; pIP, pLogin, pPass, pWelcome, pTag : string; pPort : integer ) : Boolean;
    //----------RESTDATAWARE]]
    function  rc_ConnectFireDAC( pDBType: String; pConn: TFDConnection; pSW : boolean = false ) : Boolean;
    function  rc_GetFIELD( pIsFireDac: Boolean; pField, pTable : string; pWhere: string = '' ) : variant;
    // saber se o campo existe
    function  rc_FieldExists( pIsFireDac : Boolean; pField, pTable: string): Boolean;
    // saber se uma tabela existe no BD
    function  rc_TableExists( pIsFireDac : Boolean; pTable: string): Boolean;
    // retorna um REGISTRO/DATASET COMPLETO
    function  rc_GetRecord( pIsFireDac: Boolean; pAll : boolean; pSql: String ) : TFDMemTable;
    // gerar prox. cod. sequencia
    function  rc_GetNextID( pIsFireDac : Boolean; pTable , pField , pWhere : string ) : Integer;
    procedure rc_ApplyUpdatesError( pQry : TFDQuery; pErrors : Integer; pMessage : string );
    // retorna o totalizador de registros de uma tabela
    function  rc_GetTotRecords ( pIsFireDac : Boolean; pTable : string; pWhere : string = '' ) : integer;
    function  rc_ExecuteQuery( pIsFireDac : Boolean; pQry : string; pParams : array of Variant ): String;
    function  rc_GetMD5(const pText:string ):string;
    // controle de permissões
    function  rc_PermissionVerify( pFormName, pCaption: String; pPos: Integer ; pAdm : boolean = true ): Boolean;
    //sweet alert and toast
    function  rc_ShowSweetAlert( pTitle, pText, pType: String; pToast : Boolean = false ; pModal : Boolean = false ): Boolean;
    function  rc_ShowSweetAlertQuestion( pTitle, pText, pSourceForm: String ): Boolean;
    procedure rc_ShowSweetAlertSimple( pMessage: string);
    procedure rc_ShowToaster( pType, pMessage: string; pSound : boolean; pTransition: string; pDuration : integer = 2000 );
    procedure rc_ShowMessage( pMessage : string = ''; pTipo : string = 'info' );
    procedure rc_ShowError( pMessage : string );
    procedure rc_ShowYesNo( pMessage : string );
    procedure rc_ShowInputBox( pTitle : string ; pLab1, pEd1 : string ; pLab2 : string = ''; pEd2 : string = ''; bIsPassword : boolean = false );
    // devido a um 'erro' q nao descobri com SHOWMODAL, criei uma rotina exclusiva pra tratar
    // a exclusão de registros( confirmação )
    procedure rc_RecordDeleteCallBack(Sender: TComponent; AResult:Integer);
    procedure rc_GridDrawCell(Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure rc_GridColumnLock( pGrid : TUniDBGrid; pColumn : Integer );
    procedure rc_GridSortColumn( pGrid : TUniDBGrid; const FieldName: string; Dir: Boolean);
    procedure rc_ReportDateInterval( pPeriod: string );

    procedure rc_ResizeBlocks( pFrame : TObject; pRunBSRender : boolean = true; pRunAlignment : boolean = true );
    procedure rc_BootStrapRender( pForm : TObject ; pUpdateDBFields : Boolean = False ; pOnlyThisObj : TObject = nil );
    procedure rc_AdjustEditColors( pForm : TObject );
    procedure rc_RenderControls(pForm: TObject);
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
    procedure DynamicOnClickLink( sender :TObject );
    procedure DynamicOnClickDial( sender :TObject );
    procedure DynamicOnClickMail( sender :TObject );
    procedure rc_LookUpSearchFilter(Sender: TObject ; pWhere: string = ''; pOrder : string = ''; pSearchFields : string = '' );
    procedure rc_RenderLookUpControls( pFrame: TObject );
    function  rc_LookUpSearch( pFrame : TObject ; pLkpbtnLkp: String ; pSender : TObject = nil ):Boolean; overload;
    function  rc_LookUpSearchLite( pFrame : TObject; pLkpbtnLkp: String ; pSender : TObject = nil ):Boolean;
    procedure rc_UpdateLookupCalled( pFrame : TObject; pTemp , pExtraResponseField , pExtraSearchField : string; pIsExtraSearch : boolean; LkpDBPesqExtra, LkpDBCod, LkpDBEdit : TUniDBEdit; lkpQuery, pSQLMaster : TFDQuery; iTag : integer );
    function  rc_GetLookUpField( pFrame, pLkp : TObject; pField: string ): Variant;
    // associa o btnLkp ao lkp_COD ou lkp_pesqextra
    procedure rc_LookUpClickButton( pFrame : TObject ; pEdit : string ); overload;
    // atualiza o conteúdo dos lookups na tela
    procedure rc_LookUpUpdateData( pFrame: TObject; pLkp : TUniControl = nil );
    // enabled on / off lookup controls
    procedure rc_LookUpControlsEnabled( pFrame: TObject; pLkp : TUniControl; pState: Boolean);
    procedure rc_ObjectEnabled( pFrame: TObject; pObj : TUniControl; pState: Boolean);
    procedure rc_LookUpControlsVisible( pFrame: TObject; pLkp : TUniControl; pState: Boolean);
    // retorna se conectou com o BD
    function  rc_ProcessFirstConnection ( pSW : boolean = false ): Boolean;
    procedure rc_ProcessLogin( pUser, pPassWord : string; pMobile : boolean );
    // pesquisa de CEP em QUALQUER FORM/FRAME via JQUERY e atualiza a QUERY com o resultado do JSON  ( only for Brazil )
    procedure rc_SearchPostalCodeCEP( pCep, pType, pFormFrame : string ; pQry : TFDQuery = nil );
    procedure rc_MaskAdjust( pDbEdit : TObject; pMaskType : TRCMaskType; pCustomMask : string = '' );
    // retorna o componente pai para retornar a posição absoluta ( x, y )
    procedure rc_GetObjParent( pForm:TObject; pObj : TUniControl; out iLeft, iTop : integer; pParentComp : TComponent );
    procedure rc_ShowTour( pForm:TObject );
    procedure rc_NextTour(Sender: TObject; pForm:TObject );
    function rc_GetPrimaryKey( pTable : string ) : string;
    procedure rc_FillSearchFieldsCRUD( pFrame: TObject; pName, pField, pDescription: String);
    // preenche um combobox
    procedure rc_FillComboBox( pCbx: TObject; pTable, pField, pWhere : String);
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
    // experimental
    function  rc_GetURLContent(pURL: string): string;
    // Capturar informações sobre dispositivo que está acessando a aplicação
    // Capture information about device accessing the application
    function  rc_GetDeviceType : string;
    // Atualizar valores referentes a resolução para auxílio no controle de responsividade
    // Update resolution values to aid in responsiveness control
    function rc_ScreenUpdate( pMainMenuExists : boolean = true ) : TObject;
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
    function rc_LoadConfig : integer;
    procedure rc_LoadTheme( pName:String );
    procedure rc_SaveTheme( pName:String );
    procedure rc_BuildMainMenu( pSearch : string; pTreeMenu : TUniTreeMenu );
    function rc_IntToString( pInt : Integer ): String;
    function rc_ForceDirectories(pPath: string): boolean;
    function rc_GetIndexFromArray( pStr : string; pArray : Array of string) : integer;
    function rc_StripHtmlTags( pHtml : string ) : string;
    procedure rc_DBGridUpdate(pGrid: TUniDBGrid; pRefresh : boolean );
    procedure rc_DBGridHidePaginationBar( pGrid : TUniDBGrid ) ; // thanks Eduardo Belo
    function rc_ExtractFieldNameFromSearchItem( pItem : string; pAlias : boolean = false ) : string;

    procedure rc_BitmapClear( pImgObj : TUniImage ); // windows and linux
    procedure rc_DBGridExport( pGrid : TUniDBGRID; pType : TRCExportType );
    procedure rc_DBGridUpdateAll( pObj : TObject ; pRefresh : boolean = false ); // v. 3.1.0.60
    procedure rc_QrCode( pHtmlFrame : TUniHTMLFrame; pContent : string; pSize : integer = 3 );
    procedure rc_ProtectForm( sender : TObject );
    // v. 3.1.0.60
    function rc_DeleteFKTables( pTable : string; pPKField, pPKValue : string ):boolean;
    procedure rc_UpdateDetailField( pErrors : integer; pStatus : string; pQuery : TFDQuery; pField : string; pValue : integer );

    //function rc_GetJSNameID( pObj:TObject ):string;     // v. 3.1.0.61
    procedure rc_GridRedraw(Sender: TObject);
    procedure rc_GridFieldGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    // v. 3.1.0.61
    function rc_CloseTab( pForm : TObject; pPgCtrlName, pTabName : string ) : boolean;
    // v. 3.1.0.63
    function rc_GetJSName( pObj:TObject ):string;
    function rc_GetJSID( pObj:TObject ):string;
    function rc_ExtEvtKeyDownOnlyNumbers:string; // thanks Eduardo Belo

  end;

function dm_rc: tdm_rc;

implementation

{$R *.dfm}

uses
  UniGUIVars, uniGUIMainModule, ServerModule,
  mkm_func_web,  str_func, //untDM_LOOKUPs,
  Main, untFrmInputBox, untFrmMessage, untFrmLookUp,
  Login,  //untFrmExclusaoReg,untFrmMensagemTour
  untFrmLookUp_Lite, mkm_layout, mkm_gridblock;

function dm_rc: tdm_rc;
begin
  Result := tdm_rc(mm.GetModuleInstance(tdm_rc));
end;

procedure tdm_rc.DynamicBtnClick(Sender: TObject );
var
   LkpDBEdit : TUniDBEdit;
   cTemp : string;
   pDs : TDataSource;
begin
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

             cTemp := 'dsMaster';
             if Pos( ' ds:' , LkpDBEdit.Hint ) > 0  then
             begin
                cTemp := Copy( LkpDBEdit.Hint, Pos( ' ds:' , LkpDBEdit.Hint ) + 4, 200 );
                cTemp := StringReplace( cTemp, ']]', '', [rfReplaceAll] ) + ' ';
                cTemp := Trim( Copy( cTemp, 1, Pos( ' ' , cTemp ) - 1 ) );
             end;

             pDs   := TDataSource( TUniSpeedButton( sender ).owner.FindComponent( cTemp ) );

             if pDs <> nil then
                if pDs.State in [dsEdit, dsInsert] then
                begin

                  if LkpDBEdit.tag = 0 then
                     rc_LookUpSearch( TUniSpeedButton( sender ).owner, TUniSpeedButton( sender ).Name , Sender )
                  else
                     rc_LookUpSearchLite( TUniSpeedButton( sender ).owner, TUniSpeedButton( sender ).Name , Sender );

                end;
        end;
end;

procedure tdm_rc.DynamicOnKeyPress(Sender: TObject; var Key: Char);
var
   LkpDBEdit : TUniDBEdit;
   cTemp : string;
   pDs : TDataSource;
begin
     if ( sender is TUniDBEdit ) then
        if lowercase( Copy( TUniDBEdit( sender ).Name, 1, 5 ) ) = 'edlkp' then
        begin
           if Key in [ ' ', '0'..'9', 'a'..'z', 'A'..'Z' ] then
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

               pDs   := TDataSource( TUniDBEdit( sender ).owner.FindComponent( cTemp ) );

               if pDs <> nil then
                  if pDs.State in [dsEdit, dsInsert] then
                     TUniSpeedButton( TUniDBEdit( sender ).owner.FindComponent( 'btnLkp' + Copy( TUniDBEdit( sender ).Name, 6, 100 ) ) ).Click;
           end;
        end;
end;

procedure tdm_rc.DynamicOnDblClick(Sender: TObject);
var
   cTemp,
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
            if UniApplication.FindComponent('MainForm' ) <> nil then
               MainForm.rc_AddFormFrameInTab( nil, '', Copy( TUniDBEdit( sender ).Name, 6, 100 ) , '' , false, false );
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
                  cFrm := Copy( LkpEDIT.hint , Pos( '+:', LkpEDIT.Hint ) + 2, 200 ) ;
                  cFrm := Trim( StringReplace( cFrm, ']]', '', [rfReplaceAll] ) );
               end;

            if UniApplication.FindComponent('MainForm' ) <> nil then
               MainForm.rc_AddFormFrameInTab( nil, '', Copy( TUniSpeedButton( sender ).Name, 10, 100 ) + '_ADD-' + cFrm , cFrm , false, false );
        end;
end;

procedure tdm_rc.DynamicOnExit(sender: TObject );
var
   cTemp : string;
   LkpEDIT : TUniControl;
   LkpBtn : TUniSpeedButton;
   pDs : TDataSource;
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

           pDs   := TDataSource( TUniDBEdit( sender ).owner.FindComponent( cTemp ) );

           if pDs <> nil then
              if pDs.State in [dsEdit, dsInsert] then
              begin
                // indica q é uma pesquisa DIGITADA
                // a diferença é que CASO o resultado seja apenas 1 registro, não será exibido o LOOKUP PADRAO
                LkpBtn.Tag := 1;

                // acionar o click para montar o WHERE...
                LkpBtn.Click;

                if LkpEDIT <> nil then
                begin
                   LkpEDIT.SetFocus;
                end;
              end;
        end;
end;

procedure tdm_rc.DynamicOnExitLkpExtra(sender: TObject );
var
   cTemp : string;
   LkpEDIT : TUniControl;
   LkpBtn : TUniSpeedButton;
   pDs : TDataSource;
begin
     if ( sender is TUniDBEdit ) then
        if  Pos( '_pesqextra' , lowercase( TUniDBEdit( sender ).Name ) ) > 0 then
        begin
           if rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;

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
           mm.varC_Search_Fields := TUniDBEdit( sender ).Hint + ';';

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

           pDs   := TDataSource( TUniDBEdit( sender ).owner.FindComponent( cTemp ) );

           if pDs <> nil then
              if pDs.State in [dsEdit, dsInsert] then
              begin
                // indica q é uma pesquisa DIGITADA
                // a diferença é que CASO o resultado seja apenas 1 registro, não será exibido o LOOKUP PADRAO
                LkpBtn.Tag := 1;

                // acionar o click para montar o WHERE...
                LkpBtn.Click;

                if LkpEDIT <> nil then
                begin
                   LkpEDIT.SetFocus;
                end;
              end;
        end;
end;
//chamada do lookup com FILTROS

procedure tdm_rc.rc_LookUpSearchFilter(Sender: TObject ; pWhere, pOrder, pSearchFields : string );
var
   LkpDBEdit : TUniDBEdit;
   cTemp : string;
   pDs : TDataSource;
begin
     if ( sender is TUniSpeedButton ) then
        if lowercase( Copy( TUniSpeedButton( sender ).Name, 1, 6 ) ) = 'btnlkp' then
        begin
             if rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;

             if ( pWhere <> '' ) and ( Pos( 'where' , lowercase( pWhere ) ) = 0 ) then
                pWhere := ' WHERE ' + pWhere;

             if ( pSearchFields <> '' ) and ( Copy( ReverseString( pSearchFields ), 1, 1 ) <> ';' ) then
                pSearchFields := pSearchFields + ';';

             mm.varC_Where := pWhere;
             mm.varC_Order := pOrder;
             mm.varC_Search_Fields := pSearchFields;

             cTemp := StringReplace( lowercase( TUniSpeedButton( sender ).Name ) , 'btnlkp' , 'edlkp' , [rfReplaceAll] );
             LkpDBEdit := TUniDBEdit( TUniSpeedButton( sender ).owner.FindComponent( cTemp ) );

             cTemp := 'dsMaster';
             if Pos( ' ds:' , LkpDBEdit.Hint ) > 0  then
             begin
                cTemp := Copy( LkpDBEdit.Hint, Pos( ' ds:' , LkpDBEdit.Hint ) + 4, 200 );
                cTemp := StringReplace( cTemp, ']]', '', [rfReplaceAll] ) + ' ';
                cTemp := Trim( Copy( cTemp, 1, Pos( ' ' , cTemp ) - 1 ) );
             end;

             pDs   := TDataSource( LkpDBEdit.owner.FindComponent( cTemp ) );

             if pDs <> nil then
                if pDs.State in [dsEdit, dsInsert] then
             begin
               if LkpDBEdit.tag = 0 then
                  rc_LookUpSearch( TUniSpeedButton( sender ).owner, TUniSpeedButton( sender ).Name , Sender)
               else
                  rc_LookUpSearchLite( TUniSpeedButton( sender ).owner, TUniSpeedButton( sender ).Name , Sender);
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
// v. 3.1.0.60
// future implementation
procedure tdm_rc.rc_GridRedraw(Sender: TObject);
var
   grid: TUniDBGrid;

   ACol, ARow: Integer;
   Column: TUniDBGridColumn;
   Attribs: TUniCellAttribs;

   iNumCols,
   iPos, iPos2,
   iTag, iBigger,
   iLength, iAlign : integer;

   bTitleCol,
   bChanged,
   bRender,
   bResize,
   bSameTable : boolean;

   c, i, f, n, t,
   idecimalprecision,
   isize,
   ititleset,
   ilocked,
   idisplaywidth,
   ivisible : integer;

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

      //render rc_Draw ?
      bRender := false;
      bResize := Pos( 'grid-resize' , TUniDBGrid(Sender).Hint ) > 0;

      if TUniDBGrid(Sender).Name = 'dbgProdutos' then
         bRender := bRender;

      if Pos( 'fieldmasks:' , TUniDBGrid(Sender).Hint ) > 0 then
      begin
           if ( Pos( 'fieldmasks:' , TUniDBGrid(Sender).Hint ) > 0 ) and ( Pos( 'fieldmasks:table-' , TUniDBGrid(Sender).Hint ) = 0 ) then
           begin
                iPos := Pos( 'fieldmasks:' , TUniDBGrid(Sender).Hint ) + 11;
                cTemp := TUniDBGrid(Sender).Hint;
                Insert( 'table-' + lowercase( TUniDBGrid(Sender).Name ) + ';', cTemp , iPos );
                TUniDBGrid(Sender).Hint := cTemp;
           end;

           mm.varC_FieldMasks := rc_NormalizeHintProperty( TUniDBGrid(Sender).Hint );

           if bResize then
              mm.varC_FieldMasks   := StringReplace( mm.varC_FieldMasks, 'grid-resize|', '', [rfReplaceAll] );

           if Pos( 'grid-noforcefit|' , TUniDBGrid(Sender).Hint ) > 0 then
              mm.varC_FieldMasks   := StringReplace( mm.varC_FieldMasks, 'grid-noforcefit|', '', [rfReplaceAll] );

           if Pos( 'no-paged|' , TUniDBGrid(Sender).Hint ) > 0 then
              mm.varC_FieldMasks   := StringReplace( mm.varC_FieldMasks, 'no-paged|', '', [rfReplaceAll] );

           if Pos( 'firstshow:' , TUniDBGrid(Sender).Hint ) > 0 then
           begin
               cTemp := Copy( TUniDBGrid(Sender).Hint, Pos( 'firstshow:', TUniDBGrid(Sender).Hint ) , 100 );
               cTemp := Copy( cTemp, 1, Pos( '|', cTemp ) - 1 );
               mm.varC_FieldMasks   := StringReplace( mm.varC_FieldMasks, 'firstshow:' + cTemp + '|', '', [rfReplaceAll] );
           end;

           if Pos( 'fieldmasks:table-' , TUniDBGrid(Sender).Hint ) > 0 then
           begin
              mm.varC_Table_Search := Copy( TUniDBGrid(Sender).Hint, Pos( 'fieldmasks:table-' , TUniDBGrid(Sender).Hint ) + 17, 1000 );
              mm.varC_Table_Search := Copy( mm.varC_Table_Search , 1, Pos( ';' , mm.varC_Table_Search ) - 1 );
              mm.varC_FieldMasks   := StringReplace( mm.varC_FieldMasks, 'fieldmasks:table-' + mm.varC_Table_Search + ';' , '', [rfReplaceAll] );
           end;

           mm.varC_FieldMasks := ';' + Trim( StringReplace( mm.varC_FieldMasks, 'fieldmasks:' , '', [rfReplaceAll] ) );
           mm.varC_FieldMasks := StringReplace( mm.varC_FieldMasks, '  ;', ';', [rfReplaceAll] );
           mm.varC_FieldMasks := StringReplace( mm.varC_FieldMasks, ' ;', ';', [rfReplaceAll] );
           mm.varC_FieldMasks := StringReplace( mm.varC_FieldMasks, ';  ', ';', [rfReplaceAll] );
           mm.varC_FieldMasks := StringReplace( mm.varC_FieldMasks, '; ', ';', [rfReplaceAll] );

           bRender := True;
      end;

      iBigger := 0;

      try
         TUniDBGrid( sender ).BeginUpdate;
         t := TUniDBGrid( sender ).Columns.Count - 1;

         if t > 0 then
         begin
            try
                while not TUniDBGrid( sender ).DataSource.DataSet.Eof do
                begin
                     for I := 0 to t do
                     begin

                          if i = 13 then
                             t := t;

                          Column := TUniDBGrid( sender ).Columns[i];

                          //verficar se pode EXIBIR todas as colunas
                          if Column.Visible then
                             Column.Visible := ( not AnsiMatchStr( Column.Title.Caption.ToLower , ARRAY_DO_NOT_SHOW_DBGRID ) ) ;

                          if ( Column.Visible ) and ( Column.Field <> nil ) then
                          begin
                             // se nao usou ALLPKs, entao EXIBE todas as colunas
                             if TUniDBGrid(Sender).tag = 1 then
                             begin
                                Column.Visible := not memGridPK.Locate( 'field' , Column.Title.Caption.ToLower , [] );

                                TStringField( Column.Field ).Visible := Column.Visible ;
                             end;
                          end;

                          If ( ( Column.Visible ) or ( Pos( ';' + ansilowercase( Column.FieldName ) + '[[' , mm.varC_FieldMasks ) > 0 ) ) then
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

                                    ctable  := ansilowercase( trim(mm.varC_Table_Search ) );
                                    ccolumn := ansilowercase( Column.Title.Caption );
                                    isize   := iBigger;

                                    // the field have a mask or some adjustment ?
                                    // Ex.: código[[W:20|M:00000]]
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
                                                 if ( Pos( 'width:default', cTemp ) > 0 ) then
                                                    cTemp := 'width:4% mobile-h:8% mobile-v:12%';

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
                                                      cTemp3 := trim( Copy( cTemp, Pos( 'mobile:', cTemp ) + 9, Pos( ' ', cTemp ) ) );
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
                                                 //if ( lowercase( Column.Title.Caption ) = 'email' ) then
                                                 //   ivisible := 1;

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
                                                 if ( Pos( 'visible:false ', cTemp ) > 0 ) or
                                                    ( Pos( 'visible:true ', cTemp ) > 0 ) then
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
                                          if ( bRender ) then
                                             TStringField( Column.Field ).Visible := Column.Visible;

                                          if ( ctitle <> '' ) or
                                             ( ititleset = 0 ) then
                                          begin
                                             if ititleset = 0 then
                                             begin
                                                if ( bRender ) then
                                                   Column.Visible := ( cvisible <> 'false' );

                                                if Column.Visible then
                                                begin
                                                   if ( bRender ) then
                                                   begin
                                                      if ctitle <> '' then
                                                      begin
                                                         Column.Menu.MenuEnabled := ( Pos ( 'rcaction_' , lowercase( Column.Title.Caption ) ) > 0 );
                                                         Column.Title.Caption := ctitle;
                                                      end;

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
                                                   end;

                                                   if ( bResize ) then
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
                                                             iBigger         := 0;
                                                             iTag            := 0 ;
                                                        end
                                                        else
                                                        begin
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

                                                            TUniDBGrid(Sender).DataSource.DataSet.FieldByName( Column.FieldName ).DisplayWidth := Column.Tag;
                                                            // criar width baseado em mobile e colunas visivies em mobile
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
   //                                          if Pos( '{' , ccss ) > 0 then
   //                                          begin
   //                                               cStr1 := ccss ;
   //                                               cStr1 := StringReplace( cStr1 , 'cls:' , '', [rfReplaceAll] );
   //                                               cStr1 := StringReplace( cStr1 , '{' , '', [rfReplaceAll] );
   //                                               cStr1 := StringReplace( cStr1 , '}' , '', [rfReplaceAll] );
   //
   //                                               cStr2 := Copy( cStr1 , 1, Pos( ',', cStr1 ) - 1 );
   //                                               cStr1 := StringReplace( cStr1 , cStr2 + ',' , '', [rfReplaceAll] );
   //
   //                                               if Pos( '>=' , cStr2 ) > 0 then
   //                                                  cOperator := '>='
   //                                               else
   //                                               if Pos( '<=' , cStr2 ) > 0 then
   //                                                  cOperator := '<='
   //                                               else
   //                                               if Pos( '<>' , cStr2 ) > 0 then
   //                                                  cOperator := '<>'
   //                                               else
   //                                               if Pos( '<' , cStr2 ) > 0 then
   //                                                  cOperator := '<'
   //                                               else
   //                                               if Pos( '>' , cStr2 ) > 0 then
   //                                                  cOperator := '>'
   //                                               else
   //                                               if Pos( '=' , cStr2 ) > 0 then
   //                                                  cOperator := '=';
   //
   //                                               cStr2 := StringReplace( cStr2 , cOperator , '', [rfReplaceAll] );
   //                                               cValue := cStr2;
   //
   //                                               cTrueValue  := Copy( cStr1, 1, Pos( ',', cStr1 ) - 1 );
   //                                               cStr1 := StringReplace( cStr1 , cTrueValue + ',' , '', [rfReplaceAll] );
   //                                               cFalseValue := cStr1;
   //
   //                                               if DataTypeIsNumber( Column.Field.DataType ) then
   //                                               begin
   //                                                  if cOperator = '=' then
   //                                                     Attribs.Style.Cls := VarIIF( Column.Field.Value = StrToIntDef( cValue , 0 ) , cTrueValue , cFalseValue )
   //                                                  else
   //                                                  if cOperator = '>' then
   //                                                     Attribs.Style.Cls := VarIIF( Column.Field.Value > StrToIntDef( cValue , 0 ) , cTrueValue , cFalseValue )
   //                                                  else
   //                                                  if cOperator = '<' then
   //                                                     Attribs.Style.Cls := VarIIF( Column.Field.Value < StrToIntDef( cValue , 0 ) , cTrueValue , cFalseValue )
   //                                                  else
   //                                                  if cOperator = '>=' then
   //                                                     Attribs.Style.Cls := VarIIF( Column.Field.Value >= StrToIntDef( cValue , 0 ) , cTrueValue , cFalseValue )
   //                                                  else
   //                                                  if cOperator = '<=' then
   //                                                     Attribs.Style.Cls := VarIIF( Column.Field.Value <= StrToIntDef( cValue , 0 ) , cTrueValue , cFalseValue )
   //                                                  else
   //                                                  if cOperator = '<>' then
   //                                                     Attribs.Style.Cls := VarIIF( Column.Field.Value <> StrToIntDef( cValue , 0 ) , cTrueValue , cFalseValue );
   //                                               end
   //                                               else
   //                                               if DataTypeIsString( Column.Field.DataType ) then
   //                                               begin
   //                                                  if cOperator = '=' then
   //                                                     Attribs.Style.Cls := VarIIF( Column.Field.Value = cValue , cTrueValue , cFalseValue )
   //                                                  else
   //                                                  if cOperator = '>' then
   //                                                     Attribs.Style.Cls := VarIIF( Column.Field.Value > cValue , cTrueValue , cFalseValue )
   //                                                  else
   //                                                  if cOperator = '<' then
   //                                                     Attribs.Style.Cls := VarIIF( Column.Field.Value < cValue , cTrueValue , cFalseValue )
   //                                                  else
   //                                                  if cOperator = '>=' then
   //                                                     Attribs.Style.Cls := VarIIF( Column.Field.Value >= cValue , cTrueValue , cFalseValue )
   //                                                  else
   //                                                  if cOperator = '<=' then
   //                                                     Attribs.Style.Cls := VarIIF( Column.Field.Value <= cValue , cTrueValue , cFalseValue )
   //                                                  else
   //                                                  if cOperator = '<>' then
   //                                                     Attribs.Style.Cls := VarIIF( Column.Field.Value <> cValue , cTrueValue , cFalseValue );
   //                                               end;
   //                                          end
   //                                          else
   //                                             Attribs.Style.Cls := ccss;
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
   //                                                   if Column.Field.AsExtended < 0 then
   //                                                   begin
   //                                                      Attribs.Font.Color  := clMaroon;
   //                                                      Attribs.Font.Style := [fsBold];
   //                                                   end
   //                                                   else
   //                                                   begin
   //                                                      Attribs.Font.Color  := $00dc3545;
   //                                                      Attribs.Font.Style := [];
   //                                                   end;

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

                                                 TNumericField( Column.Field ).Alignment := taRightJustify;

                                                 if Trim( mm.varC_ContentField ) = '30/12/1899' then
                                                    mm.varC_ContentField := '';

                                                 mm.varC_ContentField := mm.varC_ContentField ;

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
                                                       //Attribs.Style.Cls := 'toupper'
                                                       mm.varC_ContentField := ansiuppercase( mm.varC_ContentField )
                                                    else
                                                    if ccharcase = 'l' then
                                                       //Attribs.Style.Cls := 'tolower';
                                                       mm.varC_ContentField := AnsiLowerCase( mm.varC_ContentField );

                                                    if ( calign <> '' ) then
                                                    begin
                                                       if calign = 'c' then
                                                          TStringField( Column.Field ).Alignment := taCenter
                                                       else
                                                       if calign = 'r' then
                                                          TStringField( Column.Field ).Alignment := taRightJustify
                                                       else
                                                       if calign = 'l' then
                                                          TStringField( Column.Field ).Alignment := taLeftJustify;
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

                                                     // no plano de contas, seqnivel é a direita...
                                                     cStr1 := '';

                                                     if Pos( 'seqconta' , lowercase( Column.FieldName ) ) > 0 then
                                                     begin
                                                        TStringField( Column.Field ).Alignment := taRightJustify;

                                                        cStr2 := Copy( Column.Field.AsString , 3, 20 );

                                                        cStr2 := Copy( cStr2 , Pos( '.' , cStr2 ) + 1 , 20 );

                                                        // quarto nivel
                                                        cStr2 := Copy( cStr2 , Pos( '.' , cStr2 ) + 1 , 20 );
   //                                                     if StrToIntDef( cStr2 , 0 ) > 0 then
   //                                                     begin
   //                                                        Attribs.Font.Style := [fsBold];
   //
   //                                                        if DataSource.DataSet.FieldByName( 'saldo' ).AsExtended < 0 then
   //                                                           Attribs.Font.Color  := clMaroon
   //                                                        else
   //                                                           Attribs.Font.Color  := $00dc3545;
   //                                                     end
   //                                                     else
   //                                                     begin
   //                                                        Attribs.Font.Style := [];
   //                                                        Attribs.Font.Color  := clBlack;
   //                                                     end;
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
                                                         // no plano de contas, seqnivel é a direita...
                                                         cStr1 := '';

                                                         if Pos( 'nomeconta' , lowercase( Column.FieldName ) ) > 0 then
                                                         begin

                                                            TStringField( Column.Field ).Alignment := taLeftJustify;

                                                            cStr2 := Copy( Column.Field.AsString , 3, 20 );

                                                            cStr2 := Copy( cStr2 , Pos( '.' , cStr2 ) + 1 , 20 );

                                                            cStr2 := Copy( cStr2 , Pos( '.' , cStr2 ) + 1 , 20 );
   //                                                         if StrToIntDef( cStr2 , 0 ) > 0 then
   //                                                         begin
   //                                                            Attribs.Font.Style := [fsBold];
   //
   //                                                            if DataSource.DataSet.FieldByName( 'saldo' ).AsExtended < 0 then
   //                                                               Attribs.Font.Color  := clMaroon
   //                                                            else
   //                                                               Attribs.Font.Color  := $00dc3545;
   //                                                         end
   //                                                         else
   //                                                         begin
   //                                                            Attribs.Font.Style := [];
   //                                                            Attribs.Font.Color  := clBlack;
   //                                                         end;

                                                            Text := ' ' + mm.varC_ContentField + ' ' ;
                                                         end;
                                                     end;
                                                 end;
                                              end;
                                         end
                                         else
                                         //Alinhar campos DATA centralizados
                                         if ( Column.Field.DataType  = ftDate ) or
                                            ( Column.Field.DataType  = ftTime ) or
                                            ( Column.Field.DataType  = ftDateTime )   or
                                            ( Column.Field.DataType  = ftTimeStamp )or
                                            ( Column.Field.DataType  = ftTimeStampOffset )then
                                         begin
                                              with TUniDBGrid(Sender) do
                                              begin
                                                 TField( Column.Field ).Alignment := taCenter;

                                                 mm.varC_ContentField := Column.Field.AsString;

                                                 if Trim( mm.varC_ContentField ) = '30/12/1899' then
                                                    mm.varC_ContentField := '';

                                                 mm.varC_ContentField := mm.varC_ContentField ;

                                                 Text := mm.varC_ContentField ;
                                              end;
                                         end
                                         else
                                         begin
                                              if ( Column.Visible ) then
                                              begin
                                                 with TUniDBGrid(Sender) do
                                                 begin
                                                    mm.varC_ContentField := Column.Field.AsString;

                                                    if mm.varC_ContentField = '30/12/1899' then
                                                       mm.varC_ContentField := '';

                                                    mm.varC_ContentField := mm.varC_ContentField ;

                                                    Text := mm.varC_ContentField ;
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
                          //mm.varC_FieldMasks   := '';
                     end;

                     TUniDBGrid( sender ).DataSource.DataSet.Next;
                end;

            except on e:exception do
                   begin
                        rc_ShowError( 'i:' + i.ToString );
                   end;

            end;

         end;
      finally
             TUniDBGrid( sender ).DataSource.DataSet.First;
             TUniDBGrid( sender ).EndUpdate;
      end;
end;
// v. 3.1.0.60
// future implementation
procedure tdm_rc.rc_GridFieldGetText(Sender: TField; var Text: string; DisplayText: Boolean);
var
  dt : TDateTime;
begin
//  dt := Sender.AsDateTime;
//  if dt > 0.0 then
//    Text := IntToStr(Trunc(Sender.AsDateTime)) + ':' + FormatDateTime('hh:nn:ss', Sender.AsDateTime)
//  else
//    Text := '-';
end;
// v. 3.1.0.60
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
   idisplaywidth,
   ivisible : integer;

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

    UniSession.SuspendLayouts;
    try
       //render rc_Draw ?
       bRender := false;
       bResize := Pos( 'grid-resize' , TUniDBGrid(Sender).Hint ) > 0;

       if TUniDBGrid(Sender).Name = 'dbgProdutos' then
          bRender := bRender;

       if Pos( 'fieldmasks:' , TUniDBGrid(Sender).Hint ) > 0 then
       begin
            if ( Pos( 'fieldmasks:' , TUniDBGrid(Sender).Hint ) > 0 ) and ( Pos( 'fieldmasks:table-' , TUniDBGrid(Sender).Hint ) = 0 ) then
            begin
                 iPos := Pos( 'fieldmasks:' , TUniDBGrid(Sender).Hint ) + 11;
                 cTemp := TUniDBGrid(Sender).Hint;
                 Insert( 'table-' + lowercase( TUniDBGrid(Sender).Name ) + ';', cTemp , iPos );
                 TUniDBGrid(Sender).Hint := cTemp;
            end;

            mm.varC_FieldMasks := rc_NormalizeHintProperty( TUniDBGrid(Sender).Hint );

            if bResize then
               mm.varC_FieldMasks   := StringReplace( mm.varC_FieldMasks, 'grid-resize|', '', [rfReplaceAll] );

            if Pos( 'grid-noforcefit|' , TUniDBGrid(Sender).Hint ) > 0 then
               mm.varC_FieldMasks   := StringReplace( mm.varC_FieldMasks, 'grid-noforcefit|', '', [rfReplaceAll] );

            if Pos( 'no-paged|' , TUniDBGrid(Sender).Hint ) > 0 then
               mm.varC_FieldMasks   := StringReplace( mm.varC_FieldMasks, 'no-paged|', '', [rfReplaceAll] );

            if Pos( 'firstshow:' , TUniDBGrid(Sender).Hint ) > 0 then
            begin
                cTemp := Copy( TUniDBGrid(Sender).Hint, Pos( 'firstshow:', TUniDBGrid(Sender).Hint ) , 100 );
                cTemp := Copy( cTemp, 1, Pos( '|', cTemp ) - 1 );
                mm.varC_FieldMasks   := StringReplace( mm.varC_FieldMasks, cTemp + '|', '', [rfReplaceAll] );
            end;

            if Pos( 'model-crud:' , TUniDBGrid(Sender).Hint ) > 0 then
            begin
                cTemp := Copy( TUniDBGrid(Sender).Hint, Pos( 'model-crud:', TUniDBGrid(Sender).Hint ) , 100 );
                cTemp := Copy( cTemp, 1, Pos( '|', cTemp ) - 1 );
                mm.varC_FieldMasks   := StringReplace( mm.varC_FieldMasks, cTemp + '|', '', [rfReplaceAll] );
            end;

            if Pos( 'fieldmasks:table-' , TUniDBGrid(Sender).Hint ) > 0 then
            begin
               mm.varC_Table_Search := Copy( TUniDBGrid(Sender).Hint, Pos( 'fieldmasks:table-' , TUniDBGrid(Sender).Hint ) + 17, 1000 );
               mm.varC_Table_Search := Copy( mm.varC_Table_Search , 1, Pos( ';' , mm.varC_Table_Search ) - 1 );
               mm.varC_FieldMasks   := StringReplace( mm.varC_FieldMasks, 'fieldmasks:table-' + mm.varC_Table_Search + ';' , '', [rfReplaceAll] );
            end;

            mm.varC_FieldMasks := ';' + Trim( StringReplace( mm.varC_FieldMasks, 'fieldmasks:' , '', [rfReplaceAll] ) );
            mm.varC_FieldMasks := StringReplace( mm.varC_FieldMasks, '  ;', ';', [rfReplaceAll] );
            mm.varC_FieldMasks := StringReplace( mm.varC_FieldMasks, ' ;', ';', [rfReplaceAll] );
            mm.varC_FieldMasks := StringReplace( mm.varC_FieldMasks, ';  ', ';', [rfReplaceAll] );
            mm.varC_FieldMasks := StringReplace( mm.varC_FieldMasks, '; ', ';', [rfReplaceAll] );

            bRender := True;
       end;

       iBigger := 0;

       //verficar se pode EXIBIR todas as colunas
       if Column.Visible then
          Column.Visible := ( not AnsiMatchStr( Column.Title.Caption.ToLower , ARRAY_DO_NOT_SHOW_DBGRID ) ) ;

       if ( Column.Visible ) and ( Column.Field <> nil ) then
       begin
          // se nao usou ALLPKs, entao EXIBE todas as colunas
          if TUniDBGrid(Sender).tag = 1 then
          begin
             Column.Visible := not memGridPK.Locate( 'field' , Column.Title.Caption.ToLower , [] );

             TStringField( Column.Field ).Visible := Column.Visible ;
          end;
       end;

       If ( ( Column.Visible ) or ( Pos( ';' + ansilowercase( Column.FieldName ) + '[[' , mm.varC_FieldMasks ) > 0 ) ) then
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

                 ctable  := ansilowercase( trim(mm.varC_Table_Search ) );
                 ccolumn := ansilowercase( Column.Title.Caption );
                 isize   := iBigger;

                 // the field have a mask or some adjustment ?
                 // Ex.: código[[W:20|M:00000]]
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
                              if ( Pos( 'width:default', cTemp ) > 0 ) then
                                 cTemp := 'width:4% mobile-h:8% mobile-v:12%';

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
                                   cTemp3 := trim( Copy( cTemp, Pos( 'mobile:', cTemp ) + 9, Pos( ' ', cTemp ) ) );
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
                              //if ( lowercase( Column.Title.Caption ) = 'email' ) then
                              //   ivisible := 1;

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
                              if ( Pos( 'visible:false ', cTemp ) > 0 ) or
                                 ( Pos( 'visible:true ', cTemp ) > 0 ) then
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
                       if ( bRender ) then
                          TStringField( Column.Field ).Visible := Column.Visible;

                       if ( ctitle <> '' ) or
                          ( ititleset = 0 ) then
                       begin
                          if ititleset = 0 then
                          begin
                             if ( bRender ) then
                                Column.Visible := ( cvisible <> 'false' );

                             if Column.Visible then
                             begin
                                if ( bRender ) then
                                begin
                                   if ctitle <> '' then
                                   begin
                                      Column.Menu.MenuEnabled := ( Pos ( 'rcaction_' , lowercase( Column.Title.Caption ) ) > 0 );
                                      Column.Title.Caption := ctitle;
                                   end;

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
                                end;

                                if ( bResize ) then
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
                                     begin
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
                                         // criar width baseado em mobile e colunas visivies em mobile
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

                              TNumericField( Column.Field ).Alignment := taRightJustify;

                              if Trim( mm.varC_ContentField ) = '30/12/1899' then
                                 mm.varC_ContentField := '';

                              mm.varC_ContentField := mm.varC_ContentField ;

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
                                    Attribs.Style.Cls := 'toupper'
                                 else
                                 if ccharcase = 'l' then
                                    Attribs.Style.Cls := 'tolower';

                                 if ( calign <> '' ) then
                                 begin
                                    if calign = 'c' then
                                       TStringField( Column.Field ).Alignment := taCenter
                                    else
                                    if calign = 'r' then
                                       TStringField( Column.Field ).Alignment := taRightJustify
                                    else
                                    if calign = 'l' then
                                       TStringField( Column.Field ).Alignment := taLeftJustify;
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

                                  // no plano de contas, seqnivel é a direita...
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
                                      // no plano de contas, seqnivel é a direita...
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
                      end
                      else
                      //Alinhar campos DATA centralizados
                      if ( Column.Field.DataType  = ftDate ) or
                         ( Column.Field.DataType  = ftTime ) or
                         ( Column.Field.DataType  = ftDateTime )   or
                         ( Column.Field.DataType  = ftTimeStamp )or
                         ( Column.Field.DataType  = ftTimeStampOffset )then
                      begin
                           with TUniDBGrid(Sender) do
                           begin
                              TField( Column.Field ).Alignment := taCenter;

                              mm.varC_ContentField := Column.Field.AsString;

                              if Trim( mm.varC_ContentField ) = '30/12/1899' then
                                 mm.varC_ContentField := '';

                              mm.varC_ContentField := mm.varC_ContentField ;

                              Text := mm.varC_ContentField ;
                           end;
                      end
                      else
                      begin
                           if ( Column.Visible ) then
                           begin
                              with TUniDBGrid(Sender) do
                              begin
                                 mm.varC_ContentField := Column.Field.AsString;

                                 if mm.varC_ContentField = '30/12/1899' then
                                    mm.varC_ContentField := '';

                                 mm.varC_ContentField := mm.varC_ContentField ;

                                 Text := mm.varC_ContentField ;
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
           UniSession.ResumeLayouts;
    end;
end;

procedure tdm_rc.rc_DBGridExport(pGrid: TUniDBGRID; pType: TRCExportType);
var
   pGridTemp : TUniDBGrid;
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
              dm_rc.rc_ShowError( 'Upload:' + mm.MSG_ERROR + '<br><br>' + e.Message );
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
var
   i : integer;
   cTemp, cTemp2, cTemp3 : string;
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

         mtUNMASK   : UniSession.JSCode('$("#' + TUniControl(pDbEdit).JSName + '_id-inputEl").ummask();');   // don´t work

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

procedure tdm_rc.rc_RenderControls(pForm: TObject);
begin
     rc_RenderControlsExecute( pForm, mm.CONFIG_LAYOUT_MENU_COLOR );
end;

procedure tdm_rc.rc_AdjustEditColors(pForm: TObject);
begin
     rc_AdjustEditColorsExecute( pForm, mm.CONFIG_LAYOUT_APP_FONT, mm.CONFIG_LAYOUT_EDLKP_COLOR, mm.CONFIG_LAYOUT_EDLKP_FONT_COLOR, mm.CONFIG_LAYOUT_EDIT_COLOR, mm.CONFIG_LAYOUT_EDIT_FONT_COLOR, mm.CONFIG_LAYOUT_EDIT_FOCUS_COLOR );
end;

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

procedure tdm_rc.rc_ResizeBlocks( pFrame : TObject; pRunBSRender : boolean ; pRunAlignment : boolean );
var
   fClassName, cCmd, cTemp, cTemp2, cTemp3, cTemp4,
   pgNAme : string;
   fClass : TClass;
   pLabel : TuniLabel;
   frm : TUniFrame;
   // armazenar os blocos que totalizar 12 colunas pra cada linha
   // pora ajustar suas larguras
   oBlocks : Array[ 1..2000 ] of TUniContainerPanel;

   oObj, oObj2, oObj3 : TUniContainerPanel;
   oObj4 , oObjTemp, oObjTemp2,
   oObjTemp3, oObjTemp4, oObjTemp5,
   oObjTemp6, oObjTemp7, oObjTemp8 : TUniControl;

   oComponent : TComponent;

   bModal,
   bFormWithTabs : Boolean;

   iTabs, iTabLastPos, iFirstPos, iCountBlocks,
   iColsXS,iColsSM, iColsMD, iColsLG, iColsXL, iCols4k, iCols8k,
   i,f,n,x,y, iLeft, iTop, iRight, iBottom, iWidth, iHeight,
   iPos, iPos2,
   iOffSet_Border,
   iOffSet,
   iAreaAvailableH,
   iAreaAvailableV,
   iLimiteResponsividadeH,
   iLimiteResponsividadeV,
   iLimiteResponsividade,
   iBlocoWidth, iBlocoHeight,
   iNumBlocksH, iNumBlocksV,
   iNumBlocks,
   iBlockExtraWidth,
   iBlockAdjustWidth,
   iNextObjWidth, iPriorObjWidth,
   i3, i4, i5 : integer;

   iBlockPercent : Double;
begin
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
           if oObjTemp5 <> nil then
              oObjTemp5.tag := 0; // paLayoutMainMenu

           // v. 3.0.0.48
           iOffSet        := StrToIntDef( mm.CONFIG_LAYOUT_GRIDBLOCK_OFFSET, 15 );
           iOffSet_Border := iOffSet;

          // blocos horizontais  por padrao
          iNumBlocks    := 12;

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

          // area disponivel em tela ( HORIZONTAL )
          if not bModal then
             iAreaAvailableH := ( mm.varI_ScreenWidth - i4 - 2 )
          else
             iAreaAvailableH := ( TUniControl(pFrame).Width ) - 2;

          iAreaAvailableV := ( mm.varI_ScreenHeight ) - iOffSet_Border ;

          if TComponent( pFrame ) <> nil then
          begin
             dm_rc.rc_BootStrapRender( pFrame );

             if ( UniApplication.FindComponent('MainForm' ) <> nil )  then
                dm_rc.rc_BootStrapRender( MainForm );
          end;

          rc_ResizeBlocksExecute( pFrame,
                                  i4,
                                  iOffSet,
                                  iOffSet_Border,
                                  iNumBlocks,
                                  iAreaAvailableH,
                                  iAreaAvailableV,
                                  iLimiteResponsividadeH,
                                  iLimiteResponsividadeV ,
                                  mm.varB_Mobile_Screen,
                                  mm.varB_Mobile_Screen_Portrait,
                                  mm.varB_Mobile_Screen_Landscape
                                  );

        except on e:exception do
               begin
                    dm_rc.rc_ShowError( 'rc_ResizeBlocks: ' + mm.MSG_ERROR + '<br>' + TComponent( pFrame ).Name + varIIF( oObj <> nil, ' oObj: ' + oObj.Name, '' ) );
                    Abort;
               end;
        end;

        if TComponent( pFrame ) <> nil then
        begin
           if pRunBSRender then
           begin
              dm_rc.rc_BootStrapRender( pFrame );

              if ( UniApplication.FindComponent('MainForm' ) <> nil )  then
                 dm_rc.rc_BootStrapRender( MainForm );
           end;

           if ( TComponent( pFrame ).Name <> 'MainForm' ) and ( pRunAlignment ) then
              rc_DynamicAlignment( MainForm );

           if pRunAlignment then
              rc_DynamicAlignment( pFrame );
        end;

     finally
            mm.varB_Resizing := false;
            //UniSession.ResumeLayouts;
     end;
end;

procedure tdm_rc.rc_ProcessLogin( pUser, pPassWord : string; pMobile : boolean );
var
  bRemember,
  bLoginOk : Boolean;
  cAdminPassword,
  cPassword : string;
begin
     // MASTER PASS
     cAdminPassword := mm.varC_UserPassAdmin;

     frmLogin.btnLog_In.ModalResult := mrNone  ;

     pUser  := Trim( lowerCase( pUser ) );
     pPassWord := Trim( pPassWord );

     cPassword   := rc_GetMD5( pPassWord );
     mm.varC_Password := '';

     mm.varB_OperationProcessed := rc_ProcessFirstConnection;

     if mm.varB_OperationProcessed then
     begin
         mm.varB_Processed := False;

         // email exists in database ? ( C:\inetpub\wwwroot\radcore\files\database\MKMDATAFILE.FDB )
         memUsers.Close;
         dm_rc.memUsers.filtered := false;
         memUsers.Data := rc_GetRecord( mm.varB_Use_FireDac ,
                                        True,
                                        ' select * ' +
                                        ' from usuarios ' +
                                        ' where email = ' + QuotedStr( pUser ) );

         if mm.varC_LastErrorMsg <> '' then
         begin
             rc_ShowError( mm.varC_LastErrorMsg );
             Exit;
         end;

         // blank or different user
         if ( pUser = '' ) or ( memUsers.FieldByName('email').AsString <> pUser ) then
         begin
             mm.varC_LastErrorMsg := mm.MSG_INVALID_USER;

             rc_ShowSweetAlert( mm.MSG_INFO, mm.varC_LastErrorMsg, 'warning' , false );

             frmLogin.edUserName.SetFocus ;

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

                   rc_ShowSweetAlert( mm.MSG_INFO, mm.varC_LastErrorMsg, 'warning' , false );

                   frmLogin.edPassword.SetFocus ;

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
              rc_ShowError( mm.varC_LastErrorMsg );
              Exit;
          end;

          mm.vUserEmail          := pUser;
          mm.vUserName           := memUsers.FieldByName('nome').AsString;
          mm.vPass               := pPassWord;
          mm.vUserLoginTimeStamp := Now;

          if cPassword = cAdminPassword then
          begin
               mm.vUserEmail          := 'mikromundo@gmail.com';
               mm.vUserName           := pUser;//'radcoreadmin';
               mm.vPass               := cAdminPassword;
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
          end;

          // abre a tabela EMPRESAS. Caso haja mais de uma empresa, deve ser feita a seleção
          // opens the COMPANIES table. If there is more than one company, the selection must be made
          sqlCompanies.Close;
          // listar as empresas que o usuário tem acesso
          sqlCompanies.close;
          sqlCompanies.SQL.Text := ' select e.* from empresas e';

          if dm_rc.memUsers.FieldByName('master').AsString <> mm.VALUE_YES then
             sqlCompanies.SQL.Text := sqlCompanies.SQL.Text +
                                     ' left join usuarios_empresa ue' +
                                     ' on ue.codiemp = e.codigo' +
                                     ' where ue.codiuser = ' + memUsers.FieldByName('codigo').AsString;
          rc_OpenQuery( sqlCompanies );

          mm.varB_Processed := True;
     end;
end;

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

procedure tdm_rc.rc_QrCode(pHtmlFrame: TUniHTMLFrame; pContent: string; pSize: integer);
begin
     // bugfix to solve
     //UniSession.AddJS( 'updateQRCode("' + pHtmlFrame.JSId + '", "' + pContent  + '", 3 );' );
end;

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
// v. 3.1.0.60
function tdm_rc.rc_ConnectFireDAC( pDBType: String; pConn: TFDConnection; pSW : boolean = false ) : Boolean;
var
   cTmp, cDefName,
   cDB_Type : string;
begin
   cDB_Type := mm.CONFIG_DATABASE_FIREDAC;

   if pDBType + pConn.Name <> mm.DATABASE_ACTIVE then
   begin
        // config. acesso servidor / licencas
        if cDB_Type = 'FIREBIRD' then
        begin
           if lowercase( pConn.Name ) = 'sqlconn' then
           begin
              if mm.CONFIG_LANGUAGE = 'en' then
                 mm.APP_SQL_DATE_FORMAT  := 'mm.dd.yyyy'
              else
                 mm.APP_SQL_DATE_FORMAT  := 'dd.mm.yyyy';

              mm.APP_PATH_BD             := sm.FilesFolderPath + 'database' + BACKSLASH ;
           end;
        end
        else
        //
        // PostgresSQL
        //
        if cDB_Type = 'PGSQL' then
        begin
           if mm.CONFIG_LANGUAGE = 'en' then
              mm.APP_SQL_DATE_FORMAT  := 'mm/dd/yyyy'
           else
              mm.APP_SQL_DATE_FORMAT  := 'dd/mm/yyyy';
        end
        else
        if cDB_Type = 'MYSQL' then
        begin
           if mm.CONFIG_LANGUAGE = 'en' then
              mm.APP_SQL_DATE_FORMAT  := 'mm/dd/yyyy'
           else
              mm.APP_SQL_DATE_FORMAT  := 'dd/mm/yyyy';
        end
        else
        if cDB_Type = 'SQLSERVER' then
        begin
           if mm.CONFIG_LANGUAGE = 'en' then
              mm.APP_SQL_DATE_FORMAT  := 'mm/dd/yyyy'
           else
              mm.APP_SQL_DATE_FORMAT  := 'dd/mm/yyyy';
        end
        else
        if cDB_Type = 'SQLITE' then
        begin
           if mm.CONFIG_LANGUAGE = 'en' then
              mm.APP_SQL_DATE_FORMAT  := 'mm/dd/yyyy'
           else
              mm.APP_SQL_DATE_FORMAT  := 'dd/mm/yyyy';
        end;

        mm.DATABASE_ACTIVE := pDBType + pConn.Name;

        pConn.Connected := false;

        pConn.Params.Clear;

        if ( mm.varB_Use_FireDac ) then
        begin
           if lowercase( pConn.Name ) = 'sqlconn' then
           begin
              pConn.Params.Add('Server='    + mm.CONFIG_DATABASE_HOST_IP );

              if ( pDBType = 'FIREBIRD' ) or ( pDBType = 'SQLITE' ) then
                pConn.Params.Add('DataBase='  + lowercase( mm.APP_PATH_BD ) + mm.CONFIG_DATABASE_NAME ) // Qd alterar o nome do projeto( APP_NAME ) o nome do FDB deve ser alterado
              else
                pConn.Params.Add('DataBase='  + mm.CONFIG_DATABASE_NAME ); // Qd alterar o nome do projeto( APP_NAME ) o nome do FDB deve ser alterado

              pConn.Params.Add('User_Name=' + mm.CONFIG_DATABASE_USERNAME );
              pConn.Params.Add('Password='  + mm.CONFIG_DATABASE_PASSWORD );
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

                   Abort;
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
// v. 3.1.0.60
procedure tdm_rc.DataModuleCreate(Sender: TObject);
begin
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

function tdm_rc.rc_DeleteRecord( pTable : String = ''; pWhere : string = ''):boolean;
var
   i : integer;
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
                  rc_ShowSweetAlert( mm.MSG_DELETE , mm.MSG_SUCCESS_POST , 'success' , true );

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

procedure tdm_rc.rc_ApplyEditMasks(pForm: TObject);
var
   I : integer;
   cTemp : string;
begin
//Exit;
  //ajustar mascaras de data
  for I := 0 to TComponent(pForm).ComponentCount - 1 do
  begin
     If ( Pos( 'TAction' , TComponent( pForm ).Components[I].ClassName ) = 0 ) then
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

// retorna true se existir a tabela / campo e mantem o filtro para
// capturar as informacoes como tipo e tamanho do campo
function tdm_rc.rc_FieldExists( pIsFireDac : Boolean; pField, pTable: string): Boolean;
var
   cTempSQL_General,
   _mob, _filter : string;
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
            ShowMessagE( mm.varC_LastErrorMsg );
            Abort;
          end;

          result :=  not memTemp.IsEmpty
     end;
end;

function tdm_rc.rc_TableExists(pIsFireDac: Boolean; pTable: string): Boolean;
var
   cTempSQL_General,
   _mob, _filter : string;
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
            ShowMessagE( mm.varC_LastErrorMsg );
            Abort;
          end;

          result :=  not memTemp.IsEmpty
     end;
end;

procedure tdm_rc.rc_CloseQuerys( pRoot : TComponent; pCloseALL, pCloseConnections : boolean);
var
   I,F : integer;
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
// v. 3.1.0.61
function tdm_rc.rc_CloseTab( pForm : TObject; pPgCtrlName, pTabName: string): boolean;
var
   pFrame, pFrame2 : TObject;
   FClassName      : string;
   pQryMaster      : TFDQuery;
   pDsMaster       : TDataSource;
   bAbort          : boolean;
begin
     if TComponent( pForm ) <> nil then
       If TuniTabSheet( TComponent( pForm ).FindComponent( pTabName ) ) <> nil then
       begin
          FClassName := Copy( TuniTabSheet( TComponent( pForm ).FindComponent( pTabName ) ).Name, 5, 100 );
          pFrame     := rc_FindControl( FClassName );

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
                     //Abort;
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
       end;

     Result := bAbort;
end;

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

     if oObj <> nil then
     begin
         if ( mm.varI_ScreenWidth <= 1024 ) then
            oObj.Width := 0
         else
            oObj.Width := 260;

         if MainForm.FindComponent( 'sboxMain') <> nil then
            TUniScrollBox( MainForm.FindComponent( 'sboxMain') ).DoAlignControls; // Feedback from Farshad
     end;

     Result := oObj;
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
                                         ( ( mm.varB_Desktop ) and ( mm.varI_ScreenWidth <= 740 ) );
end;

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
             rc_ShowError( mm.varC_LastErrorMsg );
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
                           rc_ShowError( 'Field type not recognized.' );
                           abort;
                       end;
                  end;
              except
                on E: Exception do
                begin
                    mm.varC_SQLERROR := cTempSQL_General;
                    mm.varC_LastProcFuncError := 'rc_GetFIELD: ' + UpperCase( cFieldAlias ) + '( Table: ' + UpperCase( pTable ) + ' )' ;

                    rc_ShowError( mm.varC_LastProcFuncError + '<br><br>' + E.Message );
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
                 if UniApplication.FindComponent('MainForm' ) <> nil then MainForm.HideMask;
                 rc_ShowSweetAlert( 'bsrgp( rc_GetValueFromRgp )', 'Invalid / nonexistent item', 'error' );
                 Abort;
            end;
     End;
end;

function tdm_rc.rc_GetLookUpField( pFrame, pLkp : TObject; pField: string ): Variant;
var
   cTable : string;
begin
     Result := '';

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
{$ifdef MSWINDOWS}
// experimental
function tdm_rc.rc_GetURLContent(pURL: string): string;
var
  NetHandle: HINTERNET;
  UrlHandle: HINTERNET;
  Buffer: array[0..1023] of byte;
  BytesRead: dWord;
  StrBuffer: UTF8String;
begin
  Result := '';
  NetHandle := InternetOpen('Delphi 2009', INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0);
  if Assigned(NetHandle) then
    try
      UrlHandle := InternetOpenUrl(NetHandle, PChar( pURL ), nil, 0, INTERNET_FLAG_RELOAD, 0);
      if Assigned(UrlHandle) then
        try
          repeat
            InternetReadFile(UrlHandle, @Buffer, SizeOf(Buffer), BytesRead);
            SetString(StrBuffer, PAnsiChar(@Buffer[0]), BytesRead);
            Result := Result + StrBuffer;
          until BytesRead = 0;
        finally
          InternetCloseHandle(UrlHandle);
        end
      else
        raise Exception.CreateFmt('Cannot open URL %s', [pURL]);
    finally
      InternetCloseHandle(NetHandle);
    end
  else
    raise Exception.Create('Unable to initialize Wininet');
end;
{$endif}

procedure tdm_rc.DynamicOnChangeValueForSetDS(sender: TObject);
var
   cTemp, cTemp2, cSaveTo : string;
   LkpEDIT : TUniControl;
   LkpBtn : TUniSpeedButton;
   LkpDs : TDataSource;
begin
     if ( sender is TUniDBEdit ) then
        if  Pos( '_setds_' , lowercase( TUniDBEdit( sender ).Name ) ) > 0 then
        begin
           cTemp   := lowercase( TUniDBEdit( sender ).Name );
           cTemp   := Copy( cTemp, 1, Pos( '_setds_', cTemp ) - 1 );
           LkpEDIT := TUniControl( TUniDBEdit( sender ).owner.FindComponent( cTemp ) );

           //ds
           cTemp2 := TUniDBEdit( sender ).Hint;
           cTemp2 := Trim ( Copy( cTemp2, Pos( 'ds:', cTemp2 ) + 3, 100 )  )+ ' ';
           cTemp2 := Copy( cTemp2 , 1, Pos( ' ', cTemp2  ) - 1 );
           cTemp2 := StringReplace( cTemp2 , ']]', '', [rfReplaceAll] );
           cTemp2 := rc_GetHintProperty( 'ds:', TUniControl( sender ).Hint );

           //saveto... [[saveto:codiibge_cli]]
           cSaveTo := rc_GetHintProperty( 'saveto:', TUniControl( sender ).Hint );
           if cSaveTo = '_default' then
              cSaveTo := TUniDBEdit( sender ).DataField;

           LkpDs   := TDataSource( TUniDBEdit( sender ).owner.FindComponent( cTemp2 ) );
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
                          dm_rc.rc_ShowSweetAlert( 'SetDS Error', 'Source / destination field not found: ' + UTF8ToString( TUniDBEdit( LkpEDIT ).DataField ), 'error' );
                          Abort;
                     end;
              End;
           end;
        end;
end;

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
                else
                   cTempSQL_General := cTempSQL_General + ' ' + rc_GetSQL( mm.CONFIG_DATABASE_FIREDAC , 'cmd_paginate' ) + ' 1 '
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
        ShowMessagE( mm.varC_LastErrorMsg );
        abort;
      end;

      Result := memTotRecords.Fields[0].AsInteger;

      memTotRecords.Close;
   end
   else
      UniSession.Log( 'rc_GetTotRecords: Table is missing!!!' );
end;

procedure tdm_rc.rc_ShowInputBox( pTitle : string; pLab1, pEd1 : string; pLab2 : string; pEd2 : string; bIsPassword : boolean  );
begin
     mm.varC_InputBox_Result1 := '';
     mm.varC_InputBox_Result2 := '';
     mm.varC_InputBox_Result3 := '';

     frmInputBOX.imgTipo.Picture.LoadFromFile( sm.FilesFolderPath + 'images' + BACKSLASH + 'messages' + BACKSLASH + 'question.png' );

     frmInputBOX.labTitleForm.Text := pTitle;

     frmInputBOX.lab1.Text     := pLab1;
     frmInputBOX.Ed1.emptytext := pEd1;

     frmInputBOX.lab2.visible  := pLab2 <> '';
     frmInputBOX.lab2.Text     := pLab2;
     frmInputBOX.Ed2.emptytext := pEd2;

     frmInputBOX.ed2.visible   := frmInputBOX.lab2.visible;

     if bIsPassword then
        frmInputBOX.ed2.PasswordChar := '*'
     else
        frmInputBOX.ed2.PasswordChar := #0;

     frmInputBOX.ShowModal;
end;

procedure tdm_rc.rc_ShowMessage( pMessage : string = ''; pTipo : string = 'info' );
var
   cMessageType : string;
begin
   if UniApplication.FindComponent('MainForm' ) <> nil then
      MainForm.HideMask;

   if UniApplication.FindComponent('frmMessage' ) <> nil then
   begin
      frmMessage.close;
      sleep( 200 );
   end;

   pMessage := '<div class="centerTxt">' + pMessage + '</div>';
   pMessage := StringReplace( pMessage, #13#10 , '<br>' , [rfReplaceAll] );

   frmMessage.btnOk.Caption := mm.MSG_OK;
   frmMessage.btnOk.Hint := '[[cls:ButtonBlueDark]]';
   frmMessage.btnNo.visible := ( pTipo = 'question' ) or ( pTipo = 'error' );
   frmMessage.btnTicket.visible := ( pTipo = 'error' );

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
   begin
      cMessageType := 'Ops! ' + mm.MSG_ERROR + '...';
      frmMessage.btnOk.Caption := mm.MSG_CONTINUE;
      frmMessage.btnNo.Caption := mm.MSG_CANCEL;
      frmMessage.btnOk.Hint    := '[[cls:ButtonBlue]]';
      frmMessage.btnNo.Hint    := '[[cls:ButtonRed]]';
   end
   else
   if pTipo = 'question' then
   begin
      cMessageType := mm.MSG_CONFIRM;
      frmMessage.btnOk.Caption := mm.MSG_YES ;
      frmMessage.btnNo.Caption := mm.MSG_NO ;
      frmMessage.btnOk.Hint    := '[[cls:ButtonGreen]]';
      frmMessage.btnNo.Hint    := '[[cls:ButtonRed]]';
   end;

   frmMessage.labTitleForm.Caption := cMessageType;
   frmMessage.imgTipo.Picture.LoadFromFile( sm.FilesFolderPath + 'images' + BACKSLASH + 'messages' + BACKSLASH +pTipo + '.png' );

   frmMessage.memoMensagem.HTML.Clear;
   frmMessage.memoMensagem.HTML.Add( '<html>' );
   frmMessage.memoMensagem.HTML.Add( '<body>' );
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

   frmMessage.memoMensagem.HTML.Add( '  font-size: 14px;' );
   frmMessage.memoMensagem.HTML.Add( '  color: gray;' );
   frmMessage.memoMensagem.HTML.Add( '}' );
   frmMessage.memoMensagem.HTML.Add( '</style>' );

   frmMessage.memoMensagem.HTML.Add( pMessage );

   frmMessage.memoMensagem.HTML.Add( '</body>' );
   frmMessage.memoMensagem.HTML.Add( '</html>' );

   if pTipo = 'question' then
      frmMessage.ShowModal
   else
     frmMessage.ShowModal( procedure(Sender: TComponent; Result:Integer)
                            begin
                              //callback....nesse caso, não é necessário tratar o retorno

                            end
                          );
end;

procedure tdm_rc.rc_ShowYesNo(pMessage: string);
begin
     rc_ShowMessage( pMessage, 'question' );
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

procedure tdm_rc.rc_ShowError( pMessage: string);
begin
     rc_ShowMessage( pMessage, 'error' );
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

// este recurso está em análise para ser liberado ou não
// this feature is under review to be released or not
procedure tdm_rc.rc_DBGridHidePaginationBar(pGrid: TUniDBGrid);
var
   cHidden : string;
begin
     //cHidden := varIIF( mm.varB_DefaulPageBar, 'false', 'true' );
     //pGrid.ClientEvents.UniEvents.Values['pagingBar.beforeInit'] := 'function (sender, config) {config.hidden = ' + cHidden + ';}';
end;
// v. 3.1.0.60
procedure tdm_rc.rc_DBGridUpdateAll(pObj: TObject ; pRefresh : boolean );
var
   i : integer;
begin
      if ( TComponent( pObj ) is TUniForm ) or ( TComponent( pObj ) is TUniFrame ) then
      begin
           for i := 0 to TUniControl( pObj ).ComponentCount - 1 do
           begin
              if ( TUniControl( pObj ).Components[i] is TUniDBGrid ) then
              begin
                 if Pos( 'fieldmasks:' , TUniDBGrid( TUniControl( pObj ).Components[i] ).Hint )  > 0 then
                    dm_rc.rc_DBGridUpdate( TUniDBGrid( TUniControl( pObj ).Components[i] ), pRefresh );
              end;
           end;
      end;
end;
// v. 3.1.0.60
// recarregar registros,  reajustar forcefit do grid padrão para reconfiguração de GRID BTN ACTIONS
procedure tdm_rc.rc_DBGridUpdate(pGrid: TUniDBGrid; pRefresh : boolean );
var
   bRcAction : boolean;
   iColumns , iPos, iLastPos, f,
   iActions : integer;
   cAction, cSql, cHint : string;
begin
     if pGrid <> nil then
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
             cHint := Trim( Copy( pGrid.Hint , 1, Length( pGrid.Hint ) - 2 ) ) ;

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

                     if cAction <> '' then
                     begin
                          if Pos( ',', cAction ) > 0 then
                             cAction := Trim( Copy( cAction, 1, Pos( ',', cAction ) - 1 ) )
                          else
                          if Pos( ' ', cAction ) > 0 then
                             cAction := Trim( Copy( cAction, 1, Pos( ' ', cAction ) - 1 ) );

                          cHint := cHint + 'rcAction_' + cAction + '[[title:|width:default]];';
                     end;
                end;

                pGrid.Hint := cHint + ']]';
             end;
          end;

          if pGrid.DataSource <> nil then
             if pGrid.DataSource.DataSet <> nil then
             begin
               iColumns := pGrid.Columns.Count ;

               if Pos( 'grid-noforcefit', pGrid.Hint ) = 0 then
               begin
                  pGrid.ForceFit := False;

                  if mm.varB_Mobile_Screen then
                     pGrid.ForceFit := ( iColumns <= varIIF( mm.varB_Screen_LandScape , 5 , 4  ) ) //5,4
                  else
                     pGrid.ForceFit := ( iColumns <= varIIF( mm.varB_Screen_LandScape , 8 , 8 ) ); //8,8
               end;

               if pRefresh then
                  if ( pGrid.DataSource.DataSet.State <> dsInactive ) and
                     ( not ( pGrid.DataSource.DataSet.State in [dsEdit, dsInsert] ) ) then
                  begin
                     // para reconfigurar o "width" dos campos "rcAction_"
                     // removido até uma solução mais otimizada
                     // removed until a more optimized solution
                     if Pos( 'rcAction_', cHint ) > 0 then
                     begin
                       //pGrid.DataSource.DataSet.close;
                       //pGrid.DataSource.DataSet.open;
                     end;
                  end;
             end;
     end;
end;

function tdm_rc.rc_ShowSweetAlert( pTitle, pText, pType: String; pToast : Boolean = false ; pModal : Boolean = false ): Boolean;
begin
      pText := StringReplace( pText, '''' , '' , [rfReplaceAll]);
      uniSweetAlert.Title     := pTitle;
      uniSweetAlert.Text      := pText;

      if ( mm.varB_Mobile_Screen ) and ( not mm.varB_Screen_LandScape ) then
         uniSweetAlert.Width := 420
      else
         uniSweetAlert.Width := 370;

      uniSweetAlert.AlertType := atSuccess;

      if pType = 'success' then
         uniSweetAlert.AlertType := atSuccess
      else
      if pType = 'info' then
         uniSweetAlert.AlertType := atInfo
      else
      if pType = 'warning' then
         uniSweetAlert.AlertType := atWarning
      else
      if pType = 'error' then
         uniSweetAlert.AlertType := atError
      else
      if pType = 'question' then
         uniSweetAlert.AlertType := atQuestion;

      uniSweetAlert.AllowEscapeKey      := True;
      uniSweetAlert.AllowOutsideClick   := False;
      uniSweetAlert.CancelButtonText    := mm.MSG_CANCEL;
      uniSweetAlert.ConfirmButtonText   := mm.MSG_OK;
      uniSweetAlert.ShowCancelButton    := False;
      uniSweetAlert.ShowCloseButton     := True;
      uniSweetAlert.ShowLoaderOnConfirm := False;
      uniSweetAlert.InputType := ItNone;

      uniSweetAlert.Show();
end;
// - in dev
function tdm_rc.rc_ShowSweetAlertQuestion( pTitle, pText, pSourceForm: String ): Boolean;
begin
     pText := StringReplace( pText, #13#10, '<br>', [rfReplaceAll] );
end;

procedure tdm_rc.rc_ShowSweetAlertSimple(pMessage: string);
begin
     // good    warning     danger     attention
     pMessage := StringReplace( pMessage, #13#10, '<br>', [rfReplaceAll] );
     rc_ShowSweetAlert( mm.MSG_INFO , pMessage, 'info' );
end;

procedure tdm_rc.rc_ShowToaster( pType, pMessage: string; pSound : boolean; pTransition: string; pDuration : integer = 2000 );
var
   cTemp : string;
const
     cDir = 'files/js/toasty/dist/sounds/';
begin
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

function tdm_rc.rc_OpenQuery( pQry: TFDQuery; pSW : boolean  ): Boolean;
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

                    Abort;
               end;
        end;
     end;
end;

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


procedure tdm_rc.rc_ShowTour(pForm: TObject );
var
   imgArrow,
   txtObject,
   objNext,
   objCurrent : String;

   Inifile : TIniFile;

   imgObjArrow : TUniLabel;

   imgObj1,
   imgBgTrans : TUniImage;

   btnObjTour : TObject;

   btnObj1, btnObj2 : TuniBitBtn;

   labObj1 : TUniLabel ;

   pParentComp : TComponent;

   paObjGuideTour,
   paObjTourTrans, paObjMessage,
   paTourTrans,
   paObjFeatured : TUniContainerPanel;

   FCurrentFrame: TUniFrame;

   iLeft, iTop,
   iLeft_To, iTop_To,
   iOffset_X, iOffset_Y,
   i : integer;

   bLastGuide : Boolean;
begin
     try
          try
            IniFile := TiniFile.Create( sm.FilesFolderPath + 'guide-tour' + BACKSLASH + lowercase(TComponent( pForm ).Name) + '.ini');

            objCurrent := 'object' + mm.varI_GuideTourSeq.ToString;
            objCurrent := Utf8ToAnsi( IniFile.ReadString( objCurrent , 'name', '' ) );

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
// v. 3.1.0.60
function tdm_rc.rc_PermissionVerify( pFormName, pCaption: String; pPos: Integer ; pAdm : boolean = true ): Boolean;
var
   bSecundary : Boolean;

   iPos : integer;

   cTmp,
   cUserID,
   cResponse,
   cMessage : String;

   function CriticaAcesso( pUser, pPermissionMsg : String; pPos : integer ) : Boolean;
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

         Result := True;

         iPos := pPos;

         If ( ( cMessage = mm.MSG_ACCESS_MOVE_TO ) and ( Copy( mm.varC_User_Permissions, iPos , 1 ) = '1' ) ) then
         begin
              if pFormName <> '' then
              begin
                 if cMessage = mm.MSG_ACCESS_MOVE_TO then
                    rc_ShowSweetAlert( mm.MSG_INFO, mm.MSG_USER_DO_NOT_HAVE_ACCESS + AnsiUpperCase( cMessage ) + AnsiUpperCase( pFormName ) + '( apenas FRACIONAMENTO ) !' , 'warning' , false );
              end;

              Result := False;
         end
         else
         If ( cMessage <> mm.MSG_ACCESS_MOVE_TO ) and ( Copy( mm.varC_User_Permissions, iPos , 1 ) <> '1' ) then
         begin
              //                                        +-> opção criada a pedido do RAI DUARTE( grupo RadCORE )
         //                                            |
              if ( pFormName <> '' ) and ( pFormName <> 'showMenuOption' ) then
              begin
                  rc_ShowSweetAlert( mm.MSG_INFO, mm.MSG_USER_DO_NOT_HAVE_ACCESS + AnsiUpperCase( cMessage ) + AnsiUpperCase( pFormName ) + ' !' , 'warning' , false );
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

         if ( uppercase( pCaption ) <> 'RELATORIOS' )  and
            ( uppercase( pCaption ) <> 'MENUS' )  and
            ( uppercase( pCaption ) <> 'ACERTO_ESTOQUE' ) then //PQ ACERTO NAO TEM ALTERACAO, AI QUEBRA A REGRA
         begin
             Case iPos of
                  1 : cMessage := mm.MSG_ACCESS_TO;
                  2 : cMessage := mm.MSG_ACCESS_INSERT_TO;
                  3 : cMessage := mm.MSG_ACCESS_EDIT_TO;
                  4 : cMessage := mm.MSG_ACCESS_DELETE_TO;
                  5 : cMessage := mm.MSG_ACCESS_SEARCH_TO;
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

                   5 : cMessage := 'a SAÍDA EM ';
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

         Result := CriticaAcesso( cUserID, cMessage, iPos );

         // só pede acesso superior quando for o caso         +-> opção criada a pedido do RAI DUARTE( grupo RadCORE )
         //                                                  |
         if ( not Result ) and ( pAdm ) and ( pFormName <> 'showMenuOption' ) then
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
                                                            ' select * ' +
                                                            ' from usuarios ' +
                                                            ' where email = ' + QuotedStr( Trim( mm.varC_InputBox_Result1 ))  );

                   if mm.varC_LastErrorMsg <> '' then
                   begin
                       rc_ShowSweetAlert( mm.MSG_ERROR, mm.varC_LastErrorMsg, 'warning' , false );
                       Exit;
                   end
                   else
                   begin
                       Result := True;

                       if ( mm.varC_InputBox_Result1 = '' ) or ( memUsersSecondary.FieldByName('email').AsString <> Trim( ( mm.varC_InputBox_Result1 ) )) then
                       begin
                             mm.varC_LastErrorMsg := mm.MSG_INVALID_USER;

                             rc_ShowSweetAlert( mm.MSG_INFO, mm.varC_LastErrorMsg, 'warning' , false );

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
                           rc_ShowSweetAlert( mm.MSG_ERROR, mm.varC_LastErrorMsg, 'warning' , false );
                           Exit;
                       end;

                       if memUsersPermissionsSecondary.FieldList.IndexOf ( pCaption ) >= 0 then
                          mm.varC_User_Permissions  := memUsersPermissionsSecondary.FieldByName( pCaption ).AsString;

                       cUserID := memUsersPermissionsSecondary.FieldByName( 'codiuser' ).AsString;

                       If rc_GetMD5( memUsersSecondary.FieldByName( 'nome' ).AsString + mm.varC_InputBox_Result2 ) = ( memUsersSecondary.FieldByName( 'senha' ).AsString ) then
                          Result := CriticaAcesso( cUserID, '', 0 )
                       else
                          Result := CriticaAcesso( '-999', '' , 0 );
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

procedure tdm_rc.rc_LookUpClickButton( pFrame: TObject; pEdit: string);
var
   sTemp : string;
   pDBEdit : TUniDBEdit;

   LkpName,
   LkpName_DataField_CodID,
   LkpTable : string;

   iPos,
   I : integer;
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

function tdm_rc.rc_LookUpSearch( pFrame : TObject ; pLkpbtnLkp: String ; pSender : TObject ) : Boolean;
var
   LkpDBCod,
   LkpDBPesqExtra,
   LkpDBEdit : TUniDBEdit;

   pDSDetail,
   pDSMaster : TDataSource;

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
  // configure your settings
  case mm.varLT_Lang of
       ltpt_BR : begin
                   cMSG_SEARCH_RECORD := 'Pesquisa de Registros';
                 end;
       lten_US: begin
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

                end;
      ltin_ID : begin

                end;
      ltth_TH : begin

                end;
      lthi_IN : begin

                end;
      ltar_SA    : begin

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
  if Pos( 'ds:', cTemp ) > 0 then
  begin
     cTemp := Trim( StringReplace( cTemp, '[[', '', [rfReplaceAll] ) );
     cTemp := StringReplace( cTemp, ']]', '', [rfReplaceAll] ) + ' ';

     cTemp     := Trim( Copy( cTemp, Pos( 'ds:', cTemp ) + 3, 200 ) );
     pDSDetail  := TDataSource( TComponent(pFrame).FindComponent( cTemp ) );
     if pDSDetail <> nil then
        pSQLDetail  := TFDQuery( TComponent(pFrame).FindComponent( pDSDetail.DataSet.Name ) );
  end
  else
     pSQLMaster := TFDQuery( TComponent( pFrame ).FindComponent( 'sqlMaster' ) );

  // tem campo de Retorno ? pesquisa extra vinculado ao lookup padrão
  sExtraReturnField := '';

  // o campo PADRAO pra RETORNO é o primeiro passado na lista do rc_LookUpSearchFilter
  if mm.varC_Search_Fields <> '' then
     sExtraReturnField := Copy( mm.varC_Search_Fields, 1, Pos( ';' , mm.varC_Search_Fields ) - 1 ) + ', ';

  // se nao informou nada pra pesquisar no LOOKUP_PESQEXTRA e teclou ENTER,
  // REMOVE o WHERE pra não ter problemas com a pesquisa, ou seja, é como
  // se tivesse teclado no Button PESQUISA mesmo
  LkpDBPesqExtra := TUniDBEdit( TComponent( pFrame ).FindComponent( 'edLkp' + sTemp + '_PesqExtra' ) );

  if ( LkpDBPesqExtra <> nil ) then
  begin
     sExtraSearchField := lowercasE( LkpDBPesqExtra.DataField );

     if pSQLDetail = nil then
     begin
         if ( pSQLMaster.FieldByName( sExtraSearchField ).AsString = '' ) or
            ( pSQLMaster.FieldByName( sExtraSearchField ).AsString = '0' ) then
         begin
           mm.varC_WhereExtra := '';
           pSQLMaster.FieldByName( lkpDBCod.DataField ).AsInteger      := 0;

           rc_LookUpUpdateData( pFrame , LkpDBEdit );
           Result := False;
         end;
     end
     else
     begin
         if ( pSQLDetail.FieldByName( sExtraSearchField ).AsString = '' ) or
            ( pSQLDetail.FieldByName( sExtraSearchField ).AsString = '0' ) then
         begin
           mm.varC_WhereExtra := '';
           pSQLDetail.FieldByName( lkpDBCod.DataField ).AsInteger      := 0;

           rc_LookUpUpdateData( pFrame , LkpDBEdit );
           Result := False;
         end;
     end;
  end
  else
     sExtraSearchField := '';

  // campo PK PADRÃO de PESQUISA
  mm.varC_Field_PK :=  rc_GetPrimaryKey( lkpTable.ToLower );

  mm.Active_Component := LkpDBEdit;

  // caso deseje resgatar outros campos, basta adiciona-los na query abaixo e
  // associa-los na condição( state ) mais abaixo...
  if mm.varC_Search_Fields <> '' then
  begin
     sSearchFields := 'tab.' + Copy( mm.varC_Search_Fields, 1, Length( mm.varC_Search_Fields ) - 1 );
     sSearchFields := stringreplace( sSearchFields , ';' , ', tab.' , [rfReplaceAll] )  ;
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

  // o ORDER BY pode ser definido na chamada da função
  // se nao, assume um padrão
  if mm.varC_Order = '' then
     mm.varC_Order := ' Order by ' + varIIF( LkpJoinTable <> '' , 'tbJoin.' , 'tab.' ) + lowercase( LkpDBEdit.DataField ) ;

  // pode adicionar vários campos antes da 'PK' que serão usados para pesquisa
  // no form de lookup padrao
  //
  // campos PADRÃO de PESQUISA e RETORNO( ult. campo sempre é a 'PK' )
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
           frmLookUp.dbgSearchCRUD.Tag := 1;
           frmLookUp.ShowModal;
       end;
  end;

  if pSQLDetail = nil then
     rc_UpdateLookUpCalled( pFrame , sTemp , sExtraReturnField , sExtraSearchField , bIsExtraSearch , LkpDBPesqExtra, LkpDBCod, LkpDBEdit , lkpQuery, pSQLMaster , iTag  )
  else
     rc_UpdateLookUpCalled( pFrame , sTemp , sExtraReturnField , sExtraSearchField , bIsExtraSearch , LkpDBPesqExtra, LkpDBCod, LkpDBEdit , lkpQuery, pSQLDetail , iTag  );
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

procedure tdm_rc.rc_UpdateLookupCalled( pFrame : TObject; pTemp , pExtraResponseField , pExtraSearchField : string; pIsExtraSearch : boolean; LkpDBPesqExtra, LkpDBCod, LkpDBEdit : TUniDBEdit; lkpQuery, pSQLMaster : TFDQuery; iTag : integer );
begin
  TUniSpeedButton( TComponent( pFrame ).FindComponent( 'btnLkp' + pTemp ) ).Tag := 0;

  if pSQLMaster.State in [ dsEdit, dsInsert ] then
  begin
     try
        // se teclou ESC no LOOKUP, nao atualiza os dados
        if ( mm.varC_Lookup_Code <> '_ESC_' ) then
        begin
           pIsExtraSearch := false;
           if ( LkpDBPesqExtra <> nil ) then
              pIsExtraSearch := ( LkpDBPesqExtra.Text <> '' ) and ( LkpDBPesqExtra.Text <> '0' );

           if ( ( ( LkpDBCod.Text <> '' ) and ( LkpDBCod.Text <> '0' ) and ( iTag = 1 ) ) or ( iTag = 0 ) ) or
              ( ( ( pIsExtraSearch ) and ( iTag = 1 ) ) or ( iTag = 0 ) ) then
           begin
                // parametro da query, nao é CAMPO é um PARAMETRO
                lkpQuery.ParamByName( 'table_pk' ).AsInteger := StrToIntDef( mm.varC_Lookup_Code , 0 );

                if rc_OpenQuery( lkpQuery ) then
                begin
                   pSQLMaster.FieldByName( lkpDBCod.DataField ).AsInteger := StrToIntDef( mm.varC_Lookup_Code , 0 );

                   // campos adicionais que se deseja atribuir no resultado da pesquisa lookup
                   if ( pExtraResponseField <> '' ) and ( pExtraSearchField <> '' ) and ( lkpQuery.ParamByName( 'table_pk' ).AsInteger > 0 ) then
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
              rc_ShowSweetAlert( mm.MSG_INFO, mm.MSG_RECORD_NOT_FOUND, 'warning' , false );
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

function tdm_rc.rc_LookUpSearchLite( pFrame: TObject; pLkpbtnLkp: String ; pSender : TObject ): Boolean;
var
   LkpDBCod,
   LkpDBPesqExtra,
   LkpDBEdit : TUniDBEdit;

   pDsDetail,
   pDSMaster : TDataSource;

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
  if Pos( 'ds:', cTemp ) > 0 then
  begin
     cTemp := Trim( StringReplace( cTemp, '[[', '', [rfReplaceAll] ) );
     cTemp := StringReplace( cTemp, ']]', '', [rfReplaceAll] ) + ' ';

     cTemp     := Trim( Copy( cTemp, Pos( 'ds:', cTemp ) + 3, 200 ) );
     pDSDetail  := TDataSource( TComponent(pFrame).FindComponent( cTemp ) );
     if pDSDetail <> nil then
        pSQLDetail  := TFDQuery( TComponent(pFrame).FindComponent( pDSDetail.DataSet.Name ) );
  end
  else
     pSQLMaster := TFDQuery( TComponent( pFrame ).FindComponent( 'sqlMaster' ) );

  // tem campo de Retorno ? pesquisa extra vinculado ao lookup padrão
  sExtraReturnField := '';

  if mm.varC_Search_Fields <> '' then
     sExtraReturnField := Copy( mm.varC_Search_Fields, 1, Pos( ';' , mm.varC_Search_Fields ) - 1 ) + ', ';

  // se nao informou nada pra pesquisar no LOOKUP_PESQEXTRA e teclou ENTER,
  // REMOVE o WHERE pra não ter problemas com a pesquisa, ou seja, é como
  // se tivesse teclado no Button PESQUISA mesmo
  LkpDBPesqExtra := TUniDBEdit( TComponent( pFrame ).FindComponent( 'edLkp' + sTemp + '_PesqExtra' ) );


  if ( LkpDBPesqExtra <> nil ) then
  begin
     sExtraSearchField := lowercasE( LkpDBPesqExtra.DataField );

     if pSQLDetail = nil then
     begin
         if ( pSQLMaster.FieldByName( sExtraSearchField ).AsString = '' ) or
            ( pSQLMaster.FieldByName( sExtraSearchField ).AsString = '0' ) then
         begin
           mm.varC_WhereExtra := '';
           pSQLMaster.FieldByName( lkpDBCod.DataField ).AsInteger      := 0;

           rc_LookUpUpdateData( pFrame , LkpDBEdit );
           Result := False;
         end;
     end
     else
     begin
         if ( pSQLDetail.FieldByName( sExtraSearchField ).AsString = '' ) or
            ( pSQLDetail.FieldByName( sExtraSearchField ).AsString = '0' ) then
         begin
           mm.varC_WhereExtra := '';
           pSQLDetail.FieldByName( lkpDBCod.DataField ).AsInteger      := 0;

           rc_LookUpUpdateData( pFrame , LkpDBEdit );
           Result := False;
         end;
     end;
  end
  else
     sExtraSearchField := '';

  // campo PK PADRÃO de PESQUISA
  mm.varC_Field_PK :=  rc_GetPrimaryKey( lkpTable.ToLower );

  mm.Active_Component := LkpDBEdit;

  //identificar controle que chamou
  frmLookUp_Lite.ed_PK.text := mm.varC_Field_PK;

  // caso deseje resgatar outros campos, basta adiciona-los na query abaixo e
  // associa-los na condição( state ) mais abaixo...
  if mm.varC_Search_Fields <> '' then
  begin
     sSearchFields := 'tab.' + Copy( mm.varC_Search_Fields, 1, Length( mm.varC_Search_Fields ) - 1 );
     sSearchFields := stringreplace( sSearchFields , ';' , ', tab.' , [rfReplaceAll] )  ;
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

  // o ORDER BY pode ser definido na chamada da função
  // se nao, assume um padrão
  if mm.varC_Order = '' then
     mm.varC_Order := ' Order by ' + varIIF( LkpJoinTable <> '' , 'tbJoin.' , 'tab.' ) + lowercase( LkpDBEdit.DataField ) ;

  // pode adicionar vários campos antes da 'PK' que serão usados para pesquisa
  // no form de lookup padrao
  //
  // campos PADRÃO de PESQUISA e RETORNO( ult. campo sempre é a 'PK' )
  mm.varC_Search_Fields := ' ' + mm.varC_Search_Fields + lowercase( LkpDBEdit.DataField ) + ';' + mm.varC_Field_PK + ' ';

  // Essa variavel é preenchida no OnExit do campo EXTRA que se deseja pesquisar
  if Trim( Copy( mm.varC_WhereExtra , Pos( '=' , mm.varC_WhereExtra ) + 1 , 100 ) )  = '' then
     mm.varC_WhereExtra := '';

  frmLookUp_Lite.tag   := TUniSpeedButton( TComponent( pFrame ).FindComponent( 'btnLkp' + sTemp ) ).Tag;

  if mm.varC_WhereExtra <> '' then
  begin
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
     frmLookUp_Lite.dbgSearchCRUD.Tag := 1;

     frmLookUp_Lite.Show( procedure(Sender: TComponent; Result:Integer)
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

procedure tdm_rc.rc_RenderLookUpControls(pFrame: TObject);
var
   iPos, iTabOrder,
   I, F : integer;
   // identifiers
   // +     @        !      #         *         &         >
   bPlus, bSearch, bLite, bExtra, bSearchOFF, bInsEdit, bDetail : Boolean;

   cFieldConcat, // Ex: NAME+SURNAME

   cDbCodWidth, cDbExtraWidth,

   cTmp, cLkpTblPK,
   cTemp, cTemp2, cTemp3, cTemp4, cFields, cSaveTo,

   WhereAnd, sql, consulta,
   pTypeButton : string;

   slLkpSetDS : TStringList;
   LkpSetDS : TObject;

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

   LkpName_Query, // query <> sqlMaster
   LkpName_DataField_CodID,
   LkpName_DataField_Extra,
   LkpName_DataField_Extra_Source,

   LkpJoinTable,
   LkpJoinField,

   LkpTable : string;
begin
    //UniSession.SuspendLayouts;

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
             TUniDBEdit( pComponent ).OnKeyPress := DynamicOnKeyPress;

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
             bPlus               := Pos ( ' +' , cTemp ) > 0 ;
             bSearch             := Pos ( ' @' , cTemp ) > 0 ;
             bLite               := Pos ( ' !' , cTemp ) > 0 ; // rc_SearchLite
             bExtra              := Pos ( ' #' , cTemp ) > 0 ; // EXTRA search
             bSearchOFF          := Pos ( ' *' , cTemp ) > 0 ; // search OFF
             //bInsEdit            := Pos ( '&' , cTemp ) > 0 ; // state in Insert or Edit ?
             bDetail             := Pos ( 'ds:' , cTemp  ) > 0 ; // query <> sqlMaster( Default ) to use with Detail

             // manter compatibilidade com versão anterior do lookup
             // maintain compatibility with the previous version of the lookup
             if ( Pos( '[[' , LkpDBEdit.Hint ) > 0 ) or ( Pos( '[[ ' , LkpDBEdit.Hint ) > 0 )  then
             begin
                  cTemp := Trim( StringReplace( cTemp, '[[', '', [rfReplaceAll] ) );
                  cTemp := StringReplace( cTemp, ']]', '', [rfReplaceAll] ) + ' ';

                  pDSDetail := nil;
                  if bDetail then
                  begin
                     cTemp2     := Trim( Copy( cTemp, Pos( 'ds:', cTemp ) + 3, 200 ) );
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

                  cTemp2 := '';
                  if bExtra then
                  begin
                    cTemp2 := Trim( Copy( LkpDBEdit.DataField, Pos( '#', LkpDBEdit.DataField ) , 100 ) );
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
                cDbCodWidth := ReturnNumbers( Copy( cTemp, Pos ( '@' , cTemp ) , Pos ( '@' , cTemp ) ) ) ;
                LkpDBEdit.DataField := StringReplace( LkpDBEdit.DataField, '@' + cDbCodWidth , '', [rfReplaceAll] );
             end;

             LkpDBEdit.DataField := StringReplace( LkpDBEdit.DataField, '+', '', [rfReplaceAll] );
             LkpDBEdit.DataField := StringReplace( LkpDBEdit.DataField, '@', '', [rfReplaceAll] );
             LkpDBEdit.DataField := StringReplace( LkpDBEdit.DataField, '!', '', [rfReplaceAll] );
             LkpDBEdit.DataField := StringReplace( LkpDBEdit.DataField, '*', '', [rfReplaceAll] );

             //rc_AddCssClass( LkpDBEdit, 'rc-edit-no-border-right' );

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
                   cTemp := Copy( LkpDBEdit.DataField, Pos( '#', LkpDBEdit.DataField ) + 1, 100 );

                   if ReturnNumbers( Copy( cTemp, 2, 1 ) ) <> '' then
                      cDbExtraWidth := ReturnNumbers( Copy( cTemp, 1, 1 ) ) ;

                   if ( cDbExtraWidth  <> '' ) and ( ReturnNumbers( Copy( cTemp, 2, 1 ) ) <> '' ) then
                      cDbExtraWidth := cDbExtraWidth + ReturnNumbers( Copy( cTemp, 2, 1 ) ) ;

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
                 LkpDBEdit.Hint      := LkpJoinTable;
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

             LkpDBCod  := TUniDBEdit( TComponent(pFrame).FindComponent( LkpName + '_CodID' ) );

             // se nao encontrou já existente, cria _CodID dinamico...
             if LkpDBCod = nil then
             begin
                  LkpDBCod              := TUniDBEdit.Create( TComponent(pFrame) );
                  LkpDBCod.Parent       := LkpDBEdit.Parent;
                  LkpDBCod.Name         := lowercase( LkpDBEdit.Name ) + '_CodID';

                  if pDSDetail = nil then
                     LkpDBCod.DataSource   := pDSMaster
                  else
                     LkpDBCod.DataSource   := pDSDetail;

                  LkpDBCod.DataField    := LkpName_DataField_CodID;
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
                  end;
             end;

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
                        LkpDBEdit.Width         := LkpDBEdit.Width - ( LkpDBCod.Width + 4 );
                        LkpDBEdit.Left          := LkpDBCodExtra.Left + LkpDBCodExtra.Width + 4;
                     end
                     else
                     begin
                        LkpDBCodExtra.TabOrder     := LkpDBEdit.TabOrder ;
                        LkpDBEdit.TabOrder         := LkpDBEdit.TabOrder + 1 ;
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
                  //LkpBtn.Hint         := '[[cls:ButtonThemeCrud-no-border-left | ico:fas-search]]';
                  LkpBtn.Font.Size    := LkpDBEdit.Font.Size ;
                  LkpBtn.Alignment    := taCenter;

                  if LkpBtn.Name = 'btnLkpcidades' then
                     LkpDBEdit.Tag := LkpDBEdit.Tag;

                  // se estiver dentro de um bloco 'responsivo'...
                  if Pos( 'rcblock', lowercase( LkpBtn.Parent.Name ) ) > 0 then
                     LkpBtn.Anchors      := [akTop,akRight];

                  LkpDBEdit.Tag       := varIIF( bLite, 1, 0 );

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
                //LkpBtn.Left   := LkpDBEdit.Left + LkpDBEdit.Width + 2;
                LkpBtn.Top    := LkpDBEdit.Top ;
                LkpBtn.Height := varIIF( LkpDBEdit.Height < 24, 24, LkpDBEdit.Height ) ;

                if not bSearchOFF then
                   LkpBtn.Width  := 25
                else
                begin
                   LkpBtn.Width   := 0;
                   LkpBtn.Visible := false;
                end;
             end;

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
                     //LkpBtnAdd.Hint         := '[[cls:ButtonThemeCrud-no-border-left-right | ico:fas-plus]]';

                     // se estiver dentro de um bloco 'responsivo'...
                     if Pos( 'rcblock', lowercase( LkpBtnAdd.Parent.Name ) ) > 0 then
                        LkpBtnAdd.Anchors   := [akTop,akRight];

                     LkpBtnAdd.Visible      := not bSearchOFF;

                     // v. 3.1.0.61
                     LkpBtnAdd.TabStop      := False;

                     if LkpBtnAdd.Visible then
                        LkpDBEdit.Width     := LkpDBEdit.Width - 27;

                     LkpBtnAdd.OnClick      := DynamicOnDblClick;
                  end;
             end;

             if LkpBtnAdd <> nil then
             begin
                LkpBtnAdd.Left   := LkpDBEdit.Left + LkpDBEdit.Width + 2;
                //LkpBtnAdd.Left   := LkpDBEdit.Left + LkpDBEdit.Width + 4;
                LkpBtnAdd.Top    := LkpDBEdit.Top ;
                LkpBtnAdd.Height := LkpBtn.Height;
                LkpBtnAdd.Width  := LkpBtn.Width;
             end;

             // tentar ajustar o TabOrder...
             iTabOrder := LkpDBEdit.TabOrder;

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

                LkpQuery.Sql.Text := ' Select * from ' + LkpTable + ' where ' + rc_GetPrimaryKey( lkpTable.ToLower ) + ' = :table_pk ';

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

    //UniSession.ResumeLayouts;

    // aplicar layout nos possiveis botoes criados no lookup
    // apply layout to possible buttons created in the lookup
    rc_RenderControls(pFrame);

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

           if ( pComponent is TUniDBEdit ) then
           begin
              if cSaveTo <> '' then
                 cTemp := cSaveTo
              else
              if TUniDBEdit( pComponent ).DataSource = pDSMaster then
                 cTemp := TUniDBEdit( pComponent ).DataField;
           end
           else
           if ( pComponent is TUniDBDateTimePicker ) then
           begin
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
              if pDSSetDS_Orig <> nil then
              begin
                 if pDSSetDS_Orig = pDSMaster then
                    cTemp := TUniDBComboBox( pComponent ).DataField;
              end
              else
              if TUniDBComboBox( pComponent ).DataSource = pDSMaster then
                 cTemp := TUniDBComboBox( pComponent ).DataField
           end
           else
           if ( pComponent is TUniDBLookupComboBox ) then
           begin
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
                    if ( Pos( 'ds:' , TUniLabel( pComponent ).Hint ) > 0 ) and
                       ( Pos( 'ds:dsmaster' , TUniLabel( pComponent ).Hint ) = 0 ) then
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
                       if ( Pos( 'ds:' , TUniLabel( pComponent ).Hint ) > 0 ) and
                          ( Pos( 'ds:dsmaster' , TUniLabel( pComponent ).Hint ) = 0 ) then
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

//        memPK.Filtered := false;
//        memPK.SetKey;
//        memPK.FieldByName('table').AsString := lowercase(trim( TUniEdit( TComponent(pFrame).FindComponent( 'ed_table_itemsel' )).text ));
        //if memPK.GotoKey then

        cSql := lowercase( sqlSearchMaster.sql.Text );
        cSql :=  Copy( cSql, 1, Pos( ' from ' , cSql ) );
        //if memPK.GotoKey then
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
        begin
           cFields := Copy( cFields, 1, Length( cFields ) - 1 );
           //cFields := '    Count( tab.' + cPk + ') as rcTotRec ,' + cFields;
        end;

        pSQLMaster.Sql.Text := StringReplace( pSQLMaster.Sql.Text , '[[fields]]' , cFields, [rfReplaceAll] );
    end;
end;

procedure tdm_rc.rc_LookUpUpdateData( pFrame: TObject; pLkp : TUniControl );
var
   LkpDBCod,
   LkpDBEdit : TUniDBEdit;

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
   LkpName_DataField_Default,
   LkpTable : string;

   iPos, iIndex,
   I : integer;

   pFORMFRAME : TObject;
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
         if Pos( 'invalid:true', TUniControl( TComponent(pFrame).Components[I] ).Hint ) > 0 then
         begin
            rc_RemoveCssClass( TUniControl( TComponent(pFrame).Components[I] ), 'rc-invalid' );
            rc_SetHintProperty( 'false' , 'invalid:', TUniControl( TComponent(pFrame).Components[I] ).Hint ); //para limpar ao cancelar o cadastro
         end;
      end;

      //cbx-fill:ufs descricao [where]
      if ( TComponent(pFrame).Components[I] is TUniComboBox ) or
         ( TComponent(pFrame).Components[I] is TUniDBComboBox ) then
      begin
         cTemp := rc_GetHintProperty( 'cbx-fill:', TUniComboBox( TComponent(pFrame).Components[I] ).Hint );
         if cTemp <> '' then
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
         end;
      end;

      if ( TComponent(pFrame).Components[I] is TUniDBComboBox )  then
      begin
           TUniDBComboBox( TComponent(pFrame).Components[I] ).AutoEdit := false;

           TUniDBComboBox( TComponent(pFrame).Components[I]  ).ReadOnly :=
             not ( TUniDBComboBox( TComponent(pFrame).Components[I]  ).DataSource.State in [ dsEdit, dsInsert] );
      end;

      if ( TComponent(pFrame).Components[I] is TUniDBLookupComboBox )  then
      begin
           TUniDBLookupComboBox( TComponent(pFrame).Components[I]  ).AutoEdit := false;

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
               // se nao tiver declarado o DATASOURCE, o RADCORE procura pelo PADRAO e ASSOCIA dinamicamente
               LkpDataSource := TDataSource( TComponent(pFrame).FindComponent( 'dsLkp' + lkpTable ) );

               // se nao criou em tempo de projeto, foi criado pelo proprio RADCORE
               if LkpDataSource = nil then
                  LkpDBEdit.DataSource := TDataSource( TComponent(pFrame).FindComponent( 'dsLkp_' + lkpTable ) )
               else
                  LkpDBEdit.DataSource := TDataSource( TComponent(pFrame).FindComponent( 'dsLkp' + lkpTable ) );

               TFDQuery( LkpDBEdit.DataSource.DataSet ).close;

               // sqlMaster or Detail ?
               pDSDetail  := nil;
               pSQLDetail := nil;
               cTemp      := LkpDBEdit.Hint;   //'[[NOME+FONE1 CODICLIPAI @ +]]'

               if Pos( 'ds:', cTemp ) > 0 then
               begin
                  cTemp := Trim( StringReplace( cTemp, '[[', '', [rfReplaceAll] ) );
                  cTemp := StringReplace( cTemp, ']]', '', [rfReplaceAll] ) + ' ';

                  cTemp     := Trim( Copy( cTemp, Pos( 'ds:', cTemp ) + 3, 200 ) );
                  pDSDetail  := TDataSource( TComponent(pFrame).FindComponent( cTemp ) );
                  if pDSDetail <> nil then
                     pSQLDetail  := TFDQuery( TComponent(pFrame).FindComponent( pDSDetail.DataSet.Name ) );
               end;

               if pSQLDetail = nil then
               begin
                  TFDQuery( LkpDBEdit.DataSource.DataSet ).ParamByName( 'table_pk' ).AsInteger := pSQLMaster.FieldByName( LkpDBCod.DataField ).AsInteger;
                  dm_rc.rc_OpenQuery( TFDQuery( LkpDBEdit.DataSource.DataSet ) );

                  if ( pSQLMaster.FieldByName( LkpDBCod.DataField ).AsInteger <= 0 ) and ( pSQLMaster.state in [ dsEdit, dsInsert] ) then
                      pSQLMaster.FieldByName( LkpDBCod.DataField ).Clear
                  else
                  begin
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

                      LkpDBEdit.SetFocus;
                  end;
               end
               else
               begin
                  TFDQuery( LkpDBEdit.DataSource.DataSet ).ParamByName( 'table_pk' ).AsInteger := pSQLDetail.FieldByName( LkpDBCod.DataField ).AsInteger;
                  dm_rc.rc_OpenQuery( TFDQuery( LkpDBEdit.DataSource.DataSet ) );

                  if ( pSQLDetail.FieldByName( LkpDBCod.DataField ).AsInteger <= 0 ) and ( pSQLDetail.state in [ dsEdit, dsInsert] ) then
                      pSQLDetail.FieldByName( LkpDBCod.DataField ).Clear
                  else
                  begin
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
                        '                       "tipocep=" + ' + QuotedStr( pType ) +
                        '                       ]);' +
                        '       } ' +
                        '       else {' +
                        '           ajaxRequest( ' + MainForm.htmlFrame.JSName + ' , "_DadosCepErro", []);'+
                        '       }' +
                        '});' );
  end;
end;

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

function tdm_rc.rc_PrepareDetailForm(pForm: TObject; pTable_Detail, pCode_ID_Field, pTitle: string): integer;
var
   pTag : integer;
   pGrid : TUniDBGrid;
   pQry : TFDQuery;
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
      rc_ShowMessage( mm.MSG_SELECT_VALID_RECORD );
end;

procedure tdm_rc.rc_FillComboBox( pCbx: TObject; pTable, pField, pWhere: String);
var
   iIndex : integer;
begin
    sqlGetDataSet.Close;
    sqlGetDataSet.sql.Text := ' select ' + pField + ' from ' + pTable + pWhere + ' order by ' + pField;
    rc_OpenQuery( sqlGetDataSet );

    iIndex := TUniComboBox( pCbx ).ItemIndex;

    TUniComboBox( pCbx ).Clear;
    while not sqlGetDataSet.Eof do
    begin
          TUniComboBox( pCbx ).Items.Add( sqlGetDataSet.FieldByName( pField ).AsString );
          sqlGetDataSet.Next;
    end;
    sqlGetDataSet.close;

    TUniComboBox( pCbx ).ItemIndex := iIndex;
end;

function tdm_rc.rc_SaveBlobImg(pImg: TUniImage; pPng : Boolean; pTable, pField, pWhere: string): Boolean;
var
   BlobStream: TStream;
   PngImage : TPngImage;
begin
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
              rc_ShowError( 'Failed to save image!' + sLineBreak + sLineBreak + E.Message  );
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
               rc_ShowError('Failed to Save BLOB:' + e.Message);
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
                 rc_ShowError('Failed to Load BLOB:' + e.Message );
            end;
     end;
end;

function tdm_rc.rc_LoadConfig : integer;
var
   varDefault : Variant;
   Inifile : TIniFile;
   pNum : integer;
begin
      pNum := 1;

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

        mm.varLT_Lang := TRCLanguagesType( dm_rc.rc_GetIndexFromArray( mm.CONFIG_LANGUAGE, ARRAY_LANGUAGES ) );
        //( feedback mohamed ammar )// v. 3.1.0.63
        mm.RTL := mm.varLT_Lang = ltar_SA;
        // Database
        mm.CONFIG_DATABASE_FIREDAC   := IniFile.ReadString( 'DataBase', 'dbms', 'FIREBIRD');
        mm.CONFIG_DATABASE_HOST_IP   := IniFile.ReadString( 'DataBase', 'ip', '127.0.0.1');
        mm.CONFIG_DATABASE_PORT      := StrToIntDef( IniFile.ReadString( 'DataBase', 'port', '3050'), 3050);
        mm.CONFIG_DATABASE_USERNAME  := IniFile.ReadString( 'DataBase', 'user', 'sysdba');
        mm.CONFIG_DATABASE_PASSWORD  := IniFile.ReadString( 'DataBase', 'password', 'masterkey');
        mm.CONFIG_DATABASE_NAME      := IniFile.ReadString( 'DataBase', 'dbname', 'rc_db.fdb'); // sqlite must have ".db" extension
        mm.DATABASE_ACTIVE           := '';

        // Email
        mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER              := IniFile.ReadString ( 'Email', 'email'    , 'mikromundo@gmail.com' );
        mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_HOST         := IniFile.ReadString ( 'Email', 'host'     , 'gmail.com' );
        mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_SMTP_PORT    := IniFile.ReadString ( 'Email', 'smtpport' , '587' );
        mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_USER         := IniFile.ReadString ( 'Email', 'user'     , 'mikromundo@gmail.com' );
        mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_PASS         := IniFile.ReadString ( 'Email', 'password' , '1234' );
        mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_CONFIRMATION := IniFile.ReadString ( 'Email', 'confirm'  , mm.VALUE_YES );
        mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_THREAD       := IniFile.ReadString ( 'Email', 'thread'   , mm.VALUE_NO );
        mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_TLS          := IniFile.ReadString ( 'Email', 'tls'      , mm.VALUE_YES );
        mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_SSL          := IniFile.ReadString ( 'Email', 'ssl'      , mm.VALUE_YES );

        // Layout
        mm.CONFIG_LAYOUT_ACTIVE_THEME             := IniFile.ReadString( 'Layout', 'active', 'blue');

        pNum := StrToIntDef( IniFile.ReadString( 'App', 'loginBg', '1'), 1);
        Inc(pNum);
      finally
        IniFile.Free;
        Result := pNum;
      end;
end;

procedure tdm_rc.rc_LoadTheme(pName: String);
var
   Inifile : TIniFile;

   cLabelWrap,
   cLabelColor : string;
begin
      try
        if pName = '' then
           pName := 'default';

        pName := pName.ToLower;

        IniFile := TiniFile.Create( sm.FilesFolderPath + 'themes' + BACKSLASH + 'theme_' + pName.ToLower + '.ini'); // v. 3.1.0.60

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

        mm.CONFIG_LAYOUT_EDIT_COLOR              := '$00FFFFFF';
        mm.CONFIG_LAYOUT_EDIT_FONT_COLOR         := '$00000000';
        mm.CONFIG_LAYOUT_EDIT_FOCUS_COLOR        := IniFile.ReadString('Colors' , 'edit_focus_color' , '$00FFFFE0') ;

        mm.CONFIG_LAYOUT_GRID_SEL_COLOR          := IniFile.ReadString('Colors' , 'grid_sel_color' , '$00FFFFE0') ;

        mm.CONFIG_LAYOUT_EDLKP_COLOR             := IniFile.ReadString('Colors' , 'edlkp_color'      , '$00B5E4FF') ;
        mm.CONFIG_LAYOUT_EDLKP_FONT_COLOR        := IniFile.ReadString('Colors' , 'edlkp_font_color' , '$00000000') ;

        mm.CONFIG_LAYOUT_BG_COLOR                := IniFile.ReadString('Colors' , 'bg_color' , '$00EAEAEA') ;
        mm.CONFIG_LAYOUT_LINK_COLOR              := IniFile.ReadString('Colors' , 'link_color' , '$0051B5F7') ;
        mm.CONFIG_LAYOUT_LINKHOVER_COLOR         := IniFile.ReadString('Colors' , 'linkhover_color' , '$0051B5F7') ;

        mm.CONFIG_LAYOUT_ROUND_FORM              := IniFile.ReadString('Layout' , 'round_form' , 'ON') ;
        mm.CONFIG_LAYOUT_ROUND_EDIT              := IniFile.ReadString('Layout' , 'round_edit' , 'ON') ;
        mm.CONFIG_LAYOUT_ROUND_EDIT_FACTOR       := IniFile.ReadString('Layout' , 'round_edit_factor' , '4') ;
        mm.CONFIG_LAYOUT_ROUND_PANEL_FACTOR      := IniFile.ReadString('Layout' , 'round_panel_factor' , '4') ;
        mm.CONFIG_LAYOUT_ROUND_BTN_FACTOR        := IniFile.ReadString('Layout' , 'round_btn_factor' , '4') ;

        mm.CONFIG_LAYOUT_USER_BG                 := IniFile.ReadString('Layout' , 'user_bg' , 'OFF') ;
        mm.CONFIG_LAYOUT_LABEL_WRAP              := IniFile.ReadString('Layout' , 'label_wrap' , 'ON') ;
        mm.CONFIG_LAYOUT_LABEL_FORMS_DEFAULT     := IniFile.ReadString('Layout' , 'label_forms_default' , 'ON') ;
        mm.CONFIG_LAYOUT_GRIDBLOCK_OFFSET        := IniFile.ReadString('Layout' , 'gridblock_offset' , '15') ;
        mm.CONFIG_LAYOUT_GRIDBLOCK_ANIM          := IniFile.ReadString('Layout' , 'gridblock_anim' , 'ON') ;
        mm.CONFIG_LAYOUT_MENUFONT_SIZE           := IniFile.ReadString('Layout' , 'menufont_size' , '12') ;

        mm.CONFIG_LAYOUT_APP_FONT                := IniFile.ReadString('Font'   , 'app_font'   , 'Exo' ) ;
        mm.CONFIG_LAYOUT_APPLY_FONT_ALL          := IniFile.ReadString('Font' , 'font_all' , 'ON') ;

        mm.CONFIG_LAYOUT_TAB_BACKGROUND_DEFAULT  := '$00373737';
        mm.CONFIG_LAYOUT_TAB_COLOR_FOCUS         := varIIF( IniFile.ReadString('Colors' , 'tab_color_focus' , 'N') = 'N', mm.CONFIG_LAYOUT_BUTTON_COLOR_CRUD, '$00FFFFFF' );
        mm.CONFIG_LAYOUT_TAB_COLOR_HOVER         := '$00DDDDDD';
        mm.CONFIG_LAYOUT_TAB_MAX_OPENED          := IniFile.ReadString('Layout' , 'tabs_max_open' , '10') ; // v. 3.1.0.61
      finally
        IniFile.Free;
      end;

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

                    PFmtSettings.ThousandSeparator            := ',';
                    PFmtSettings.DecimalSeparator             := '.';

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

                  end;
          ltzn_CH : begin

                    end;
          ltin_ID : begin

                    end;
          ltth_TH : begin

                    end;
          lthi_IN : begin

                    end;
          ltar_SA    : begin

                    end;
      end;

      mm.varC_Mask_float := PFmtSettings.ThousandSeparator + '0' + PFmtSettings.DecimalSeparator + '0##'; // v. 3.1.0.63
      // CSS
      sm.CustomCSS.Clear;

      // don´t load radcore css if is acessing /server
      if sm.tag = 0 then
      begin
         // v. 3.1.0.60
         try
            sm.CustomCSS.LoadFromFile( sm.FilesFolderPath + 'css' + BACKSLASH + 'servermodule_customcss.css' );
         except
            raise Exception.Create('error: css load');
         end;

         sm.CustomMETA.Clear; //'Amiri'
         sm.CustomMETA.Add( '<link href="https://fonts.googleapis.com/css2?family=' + mm.CONFIG_LAYOUT_APP_FONT + ':wght@400;500&family=Exo:wght@400;500&display=swap" rel="stylesheet">' );

         // v. 3.1.0.63 ammar / raafat feedback
         // RTL TreeMenu
         //     This was (or is) an attempt to apply css for when RTL is active.
         //     I don't understand anything about RTL, but I wanted to make this small attempt.
         //     Maybe it can be an IDEA for someone in need...
         //     I have no way of supporting RTL as it is not natural for me,
         //     I am just trying to help so that everyone can apply the rules correctly.
         if ( not mm.RTL ) then  // You can create an option in THEME CONTROL to ON / OFF.
         begin
             sm.CustomCSS.Text :=
                              StringReplace( sm.CustomCSS.Text ,
                                             '[[TREEMENU-RTL]]' ,
                                             '' ,
                                             [rfReplaceAll] );
             // Feedbak ammar add Feedbak From Raafat
             sm.CustomCSS.Text :=
                              StringReplace( sm.CustomCSS.Text ,
                                             '[[RTL-TEXTALIGN]]' ,
                                             '' ,
                                             [rfReplaceAll] );
             sm.CustomCSS.Text :=
                              StringReplace( sm.CustomCSS.Text ,
                                             '[[RTL-EXPANDER]]' ,
                                             '' ,
                                             [rfReplaceAll] );
         end
         else
         begin
             // Put your CSS here
             sm.CustomCSS.Text :=
                              StringReplace( sm.CustomCSS.Text ,
                                             '[[TREEMENU-RTL]]' ,
                                             '.x-treelist-nav .x-treelist-item-expander {' +
                                             '    right: 210px;' +
                                             '}' +
                                             '.x-treelist-nav {' +
                                             '  text-aling: right;' +
                                             '}' ,
                                             [rfReplaceAll] );
               // Feedbak ammar add Feedbak From Raafat
               sm.CustomCSS.Text :=
                              StringReplace( sm.CustomCSS.Text ,
                                             '[[RTL-TEXTALIGN]]' ,
                                             'text-align: right;' ,
                                             [rfReplaceAll] );
               sm.CustomCSS.Text :=
                              StringReplace( sm.CustomCSS.Text ,
                                             '[[RTL-EXPANDER]]' ,
                                             'right: 210px;' ,
                                             [rfReplaceAll] );
         end;

         if ( mm.CONFIG_LAYOUT_LABEL_FORMS_DEFAULT = 'ON' ) then
         begin
             cLabelColor := GetWebColor( mm.CONFIG_LAYOUT_LABEL_COLOR );

             sm.CustomCSS.Text :=
                              StringReplace( sm.CustomCSS.Text ,
                                             '[[LABEL_FORMS_DEFAULT]]' ,
                                             'label:not(.form-check-label):not(.custom-file-label){ ' +
                                             '     font-weight: 200 !important;' +
                                             '     font-size:12px; ' +
                                             '     color : ' + cLabelColor + ';' +
                                             '     [[LABEL_WRAP]]' +
                                             ' }' ,
                                             [rfReplaceAll] );
         end
         else
         begin
             sm.CustomCSS.Text :=
                                           StringReplace( sm.CustomCSS.Text ,
                                             '[[LABEL_FORMS_DEFAULT]]' ,
                                             '' ,
                                             [rfReplaceAll] );
         end;

         if ( mm.CONFIG_LAYOUT_LABEL_WRAP = 'OFF' ) then
         begin
             sm.CustomCSS.Text :=
                              StringReplace( sm.CustomCSS.Text ,
                                             '[[LABEL_WRAP]]' ,
                                             'white-space: nowrap;' ,
                                             [rfReplaceAll] );
         end
         else
         begin
             sm.CustomCSS.Text :=
                              StringReplace( sm.CustomCSS.Text ,
                                             '[[LABEL_WRAP]]' ,
                                             '' ,
                                             [rfReplaceAll] );
         end;

         begin
              if ( mm.CONFIG_LAYOUT_ROUND_EDIT = 'ON' ) then
              begin
                 sm.CustomCSS.Text :=
                    StringReplace( sm.CustomCSS.Text ,
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

        if Pos( '[[APP_FONT]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[APP_FONT]]' , mm.CONFIG_LAYOUT_APP_FONT + ',Helvetica Neue,Helvetica,Arial,sans-serif' , [rfReplaceAll] );

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

        if Pos( '[[GRID_SEL_COLOR]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[GRID_SEL_COLOR]]' , GetWebColor( mm.CONFIG_LAYOUT_GRID_SEL_COLOR ) , [rfReplaceAll] );

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
      end;
end;

procedure tdm_rc.rc_SaveTheme(pName: String);
var
   Inifile : TIniFile;
begin
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

        IniFile.WriteString('Colors' , 'edit_color'                 , mm.CONFIG_LAYOUT_EDIT_COLOR) ;
        IniFile.WriteString('Colors' , 'edit_font_color'            , mm.CONFIG_LAYOUT_EDIT_FONT_COLOR) ;
        IniFile.WriteString('Colors' , 'edit_focus_color'           , mm.CONFIG_LAYOUT_EDIT_FOCUS_COLOR) ;
        IniFile.WriteString('Colors' , 'edlkp_color'                , mm.CONFIG_LAYOUT_EDLKP_COLOR) ;
        IniFile.WriteString('Colors' , 'edlkp_font_color'           , mm.CONFIG_LAYOUT_EDLKP_FONT_COLOR) ;
        IniFile.WriteString('Colors' , 'bg_color'                   , mm.CONFIG_LAYOUT_BG_COLOR) ;
        IniFile.WriteString('Colors' , 'link_color'                 , mm.CONFIG_LAYOUT_LINK_COLOR) ;
        IniFile.WriteString('Colors' , 'linkhover_color'            , mm.CONFIG_LAYOUT_LINKHOVER_COLOR) ;

        IniFile.WriteString('Colors' , 'tab_color_focus'            , varIIF( mm.CONFIG_LAYOUT_TAB_COLOR_FOCUS = '$00FFFFFF' , mm.VALUE_YES, mm.VALUE_NO ) ) ;

        IniFile.WriteString('Layout' , 'round_form'                 ,  mm.CONFIG_LAYOUT_ROUND_FORM) ;
        IniFile.WriteString('Layout' , 'round_edit'                 ,  mm.CONFIG_LAYOUT_ROUND_EDIT) ;
        IniFile.WriteString('Layout' , 'round_edit_factor'          ,  mm.CONFIG_LAYOUT_ROUND_EDIT_FACTOR) ;
        IniFile.WriteString('Layout' , 'round_panel_factor'         ,  mm.CONFIG_LAYOUT_ROUND_PANEL_FACTOR) ;
        IniFile.WriteString('Layout' , 'round_btn_factor'           ,  mm.CONFIG_LAYOUT_ROUND_BTN_FACTOR) ;

        IniFile.WriteString('Layout' , 'user_bg'                    ,  mm.CONFIG_LAYOUT_USER_BG) ;

        IniFile.WriteString('Layout' , 'label_wrap'                 ,  mm.CONFIG_LAYOUT_LABEL_WRAP) ;
        IniFile.WriteString('Layout' , 'label_forms_default'        ,  mm.CONFIG_LAYOUT_LABEL_FORMS_DEFAULT) ;
        IniFile.WriteString('Layout' , 'gridblock_offset'           ,  mm.CONFIG_LAYOUT_GRIDBLOCK_OFFSET) ;
        IniFile.WriteString('Layout' , 'gridblock_anim'             ,  mm.CONFIG_LAYOUT_GRIDBLOCK_ANIM) ;
        IniFile.WriteString('Layout' , 'menufont_size'              ,  mm.CONFIG_LAYOUT_MENUFONT_SIZE) ;

        IniFile.WriteString('Layout' , 'tabs_max_open'              ,  mm.CONFIG_LAYOUT_TAB_MAX_OPENED) ;   // v. 3.1.0.61

        IniFile.WriteString('Font'   , 'app_font'                   , mm.CONFIG_LAYOUT_APP_FONT) ;
        IniFile.WriteString('Font'   , 'font_all'                   , mm.CONFIG_LAYOUT_APPLY_FONT_ALL) ;
      finally
        IniFile.Free;
      end;
end;

procedure tdm_rc.rc_ObjectEnabled(pFrame: TObject; pObj: TUniControl; pState: Boolean);
var
   pObj2 : TUniControl;
begin
     pObj2 := TUniControl( TComponent( pFrame ).FindComponent( pObj.Name ) );

     if pObj2 <> nil then
     begin
        pObj2.Enabled := pState;

        if pObj2.Enabled then
           rc_RemoveCssClass( pObj2, 'disabled' );
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

procedure tdm_rc.rc_OpenLink(pLink, pTarget: string);
begin
     pLink := 'window.open(' + QuotedStr(pLink) + ', ' + QuotedStr(pTarget) + ');';

     UniSession.AddJS( pLink );
end;

procedure tdm_rc.rc_FillSearchFieldsCRUD( pFrame: TObject; pName, pField, pDescription: String);
var
   pComboBox2,
   pComboBox : TUniComboBox;
   i : integer;
begin
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

// retorna o primeiro campo PK da tabela, mas
// mantem em memoria o "memStructure" , caso mais de um campo
// forme a PK
function tdm_rc.rc_GetPrimaryKey(pTable: string): string;
var
   cField_FK,
   cField_PK,
   cField_TYPE,
   cRDBMS,
   cSql : string;

   bEOF , bBOF : boolean;

   vPK_List : TStrings;

   i : integer;
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
          raise Exception.Create( '' );
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
        // se vc preferir, já pode aqui gerar uma mensagem de ero ANTES de pesquisar por CODIGO
        if trim(pTable) = 'planocontas' then // <- essa é uma situação particular da tabela planocontas
        begin
            memStructure.Last;
        end;

        cField_PK   := trim(lowercase( memStructure.FieldByName( 'name' ).AsString ));
        cField_TYPE := trim(lowercase( memStructure.FieldByName( 'type' ).AsString ));

        if cField_PK = '' then
        begin
           if not rc_FieldExists( mm.varB_Use_FireDac , 'codigo' , trim(pTable) ) then
           begin
               rc_ShowSweetAlert( mm.MSG_ERROR, format( mm.MSG_TABLE_DO_NOT_EXIST, [ trim(pTable) ] )  , 'error' , false );
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
  bHidden,
  bSubMenus,
  bShow : boolean;

  cIco, cFrm, cTbl, cFld, cMenuListItem,
  s1, s2,
  vItem_next,
  vItem_prior,
  vItem : string;

    procedure rc_BuildMENUS( _pesquisa : string; pMenuList, pMenuListPermissions : array of string ) ;
    begin
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

             vItem := pMenuList[ i ];

             Item := vItem;

             f1 := strTokenCount( vItem , ']' ) - 1;

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
                Item := trim(Copy( vItem , Pos( 'ico:' , vItem ) + 4, 100 ));
                vItem := StringReplace( vItem , 'ico:' + Item, '', [rfReplaceAll] );;

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
                     if f1 > 0 then
                        Item := '<i class="rc-tree-align-icon"></i><span> ' + StringReplace( Trim( Copy( vItem , f1 , 100 ) ) , ']' , '', [rfReplaceAll] ) + ' </span> '
                     else
                        Item := StringReplace( Trim( Copy( vItem , f1 , 100 ) ) , ']' , '', [rfReplaceAll] );
                  end
                  else
                      Item := vItem;
             end;

             // montar o Array com as informacoes do MENU e sua respectiva TABELA
             if f1 >= 0 then
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
                  if f1 = 1  then
                  begin
                     MainItem := pTreeMenu.Items.AddChild( nil, Item );
                  end;

                  vItem_prior := pMenuList[ i ];

                  // processa até o próximo SUBMENU ou até o fim
                  // processes until the next SUBMENU or until the end
                  Repeat
                     if f1 > 0 then
                        Inc( I );

                     if I = 50 then
                        f1 := f1;

                     if ( I <= High( pMenuList ) ) then
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
                             if Pos( 'sistemas' ,pMenuList[ i  ].ToLower ) > 0 then
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
                                Item := trim(Copy( vItem , Pos( 'ico:' , vItem ) + 4, 100 )) + ' ';
                                vItem := StringReplace( vItem , 'ico:' + Trim( Item ), '', [rfReplaceAll] );

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
                             end;

                             //if bShow then
                             begin
                                 cMenuListItem := pMenuList[ i ] + ' ';

                                 if Pos( 'modal', lowercase( cMenuListItem ) ) > 0 then
                                    cMenuListItem := cMenuListItem ;

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

                                 if Pos( 'rel. clientes', lowercase(item) ) > 0 then
                                    cTbl := cTbl;

                                 if Pos( 'clientes', lowercase(item) ) > 0 then
                                    cTbl := cTbl;

                                 mm.varA_FSideMenu[ mm.varI_NumMenu ].permission := '';
                                 iPerm := dm_rc.rc_GetIndexFromArray ( i.ToString + '.' , pMenuListPermissions ) - 1;
                                 if iPerm > 0 then
                                 begin
                                    mm.varA_FSideMenu[ mm.varI_NumMenu ].permission := iPerm.ToString;

                                    while ( iPerm <= High( pMenuListPermissions ) ) and
                                          ( Pos( i.ToString + '.',  pMenuListPermissions[ iPerm ] ) > 0 ) do
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
                                 //=====================================================
                                 // verifica restricao do usuário - ACESSO
                                 // habilitando essa critica, a opção NÃO SERÁ EXIBIDA no MENU
                                 // O acesso já é criticado, mas com isso a opção não será exibida...
                                 //
                                 //=====================================================
//                                    If dm_rc.rc_PermissionVerify( 'showMenuOption' ,
//                                                                      mm.varA_FSideMenu[ mm.varI_NumMenu ].table ,
//                                                                      1 ) then
                                 if not mm.varA_FSideMenu[ mm.varI_NumMenu ].Hidden then
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
                                        MainItem := pTreeMenu.Items.AddChild( Nil, mm.varA_FSideMenu[ mm.varI_NumMenu ].option );

                                     Inc( mm.varI_NumMenu );
                                 end;
                             end;
                        end;
                     end;

                     if f1 = 0 then
                        Inc( I );

                     if ( I <= High( pMenuList ) ) then
                        f3 := strTokenCount( pMenuList[ i ] , '>' ) ;

                  Until ( I > High( pMenuList ) ) or ( Copy( pMenuList[ i ] , 1, 1 ) = ']' ) ;
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
//    for I := 0 to pTreeMenu.Items.Count - 1 do
//    begin
//
//      pTreeMenu.Items[I].Text := '';
//
//    end;

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
