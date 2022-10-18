unit MainModule; // v. 4.0.0.0

interface

uses
  uniGUIMainModule,
  uniGUIBaseClasses, uniGUIClasses, uniGUITypes, uniGUIJSUtils, UniEdit, UniDBGrid,
  RTTI,
  SysUtils, Classes, System.Types, System.StrUtils,
  uconsts, System.IniFiles, uniGUIFrame, Vcl.Graphics, // untClsEnderecoCompleto,
  uniGUIForm, uniPageControl,

  FireDAC.UI.Intf, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.UI, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.DApt, FireDAC.Phys.PGDef, FireDAC.Phys.MySQLDef, FireDAC.Phys.MySQL,
  FireDAC.Phys.PG, FireDAC.Phys.IBBase,
  FireDAC.Comp.DataSet,
  FireDAC.VCLUI.Error, Vcl.AppEvnts,

  //----------[[RESTDATAWARE
//  uRESTDWServerEvents,
//  uRESTDWBase,
//  uDWConstsData,
//  uRESTDWPoolerDB,
//  uDWAbout,
  //----------RESTDATAWARE]]

  uniTimer;

type
    tpPermissions = ( tpAccess, tpRegister, tpEdit, tpDelete );
    TUniPlatforms = set of TUniPlatform;

type
  // opções do menu que serão clicadas e suas respectivas tabelas no banco de dados
  // menu options that will be clicked and their respective tables in the database
  rgSide_Menu = record
                  Option : string;
                  Table  : string;
                  Image  : string;
                  Permission  : string;
                  RestrictionField  : string;
                  Hidden  : Boolean;
                  AskNew  : Boolean;
                  GenID  : Boolean;
                  Modal  : Boolean;
                  CloseBtn         : Boolean; // v. 3.2.0.6
                  NotShow          : Boolean; // v. 4.0.0.0
                  Master           : Boolean; // v. 4.0.0.0
                end;

  Tmm = class(TUniGUIMainModule)
    SQLConn: TFDConnection;
    procedure UniGUIMainModuleCreate(Sender: TObject);
    procedure UniGUIMainModuleBrowserClose(Sender: TObject);
    procedure UniGUIMainModuleSessionTimeout(ASession: TObject;
      var ExtendTimeOut: Integer);
    procedure SQLConnRecover(ASender, AInitiator: TObject;
      AException: Exception; var AAction: TFDPhysConnectionRecoverAction);
    procedure UniGUIMainModuleBeforeLogin(Sender: TObject;
      var Handled: Boolean);
    procedure UniGUIMainModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }


    // update ALL variables
    //
    // variaveis para gravar informações do usuário ao logar
    // variables to record user information when logging in
    vUserLoginTimeStamp:TDateTime;
    vUserBrowserType,
    vUserBrowserVersion,
    vUSer_SO,
    vUserEmail,
    //vPass, // v. 3.2.0.5
    vUserName:String;
    // vDeviceType: String; // v. 3.3.0.0
    vLatitude,
    vLongitude : Double;
    uPlat: TUniPlatforms;
    // a escolha de usar GLOBAIS se deu por 2 motivos:
    // 1 - Fica compatível para todos( nao dependendo de DBX, FireDac etc( devido as versões do RadCORE BASE e STARTER que não usam Banco de Dados
    // 2 - VELOCIDADE no acesso as informações
    //
    // the choice to use GLOBALS was made for 2 reasons:
    // 1 - It is compatible for everyone (not depending on DBX, FireDac etc (due to the versions of RadCORE BASE and STARTER that do not use Database
    // 2 - SPEED when accessing information
    //
    varLT_Lang : TRCLanguagesType;
    // rc_Anim TimeLine
    varC_RCAnimTimeLine,
    // email config
    CONFIG_EMAIL_SOFTWAREHOUSE_SENDER              ,
    CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_HOST         ,
    CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_SMTP_PORT    ,
    CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_USER         ,
    CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_PASS         ,
    CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_CONFIRMATION ,
    CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_THREAD       ,
    CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_TLS          ,
    CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_SSL          ,
    // Theme / Config / Translate Control
    CONFIG_LANGUAGE,         // active language
    //CONFIG_LANGUAGE_COUNTRY, // active language country
    //CONFIG_LANGUAGE_AUTO,
    // rc_translate messages
    // config bschk / bsswt.. ou qualquer situação de retorno
    // config bschk / bsswt .. or any return situation
    //
    // Pode mudar para Y ou N, mas lembre, utilizo "domínios" no banco de dados
    // que usam S ou N, então, caso mude, tem que ajustar no banco de dados também para evitar conflitos
    //
    // Can change to Y or N, but remember, I use "domains" in the database
    // using Y or N, so if you change, you have to adjust it in the database too to avoid conflicts
    //
    VALUE_YES,  // Y   S
    VALUE_NO,   // N   N
    // internal messages
    LAB_STATE_I, // v. 3.2.0.7
    LAB_STATE_E, // v. 3.2.0.7
    LAB_STATE_B, // v. 3.2.0.7
    MSG_CONTACT_SUPPORT,
    MSG_APP_LOCKED,
    MSG_UPLOAD_FAIL,
    MSG_CONFIRM_DELETE,
    MSG_CONFIRM_DELETE_ALL,
    MSG_CONTINUE_REGISTERING,
    MSG_SUCCESS_POST,
    MSG_SUCCESS_DELETE,
    MSG_USER_DO_NOT_HAVE_ACCESS,
    MSG_USER_SUPERIOR_PERMISSION,
    MSG_USER_MASTER_PERMISSION,
    MSG_USER_RELEASE_PASSWORD,
    MSG_NEW_USER_REGISTERED, // v. 3.2.0.0
    MSG_RESOURCE_IN_DEVELOPMENT,
    MSG_PASSWORD_RESET,
    MSG_PASSWORD_TEMP,
    MSG_PASSWORD_TEMP_SENT,
    MSG_REGISTER_NEW,
    MSG_CONFIRMATION_CODE, // v. 3.3.3.1
    MSG_EMAIL_DO_NOT_REPLY,
    // frmBaseCRUD
    ARRAY_BASICS_FLD_ID_NAME              ,
    ARRAY_BASICS_FLD_DESCRIPTION_NAME     ,
    ARRAY_BASICS_FLD_ID_ALIAS             ,
    ARRAY_BASICS_FLD_DESCRIPTION_ALIAS    ,
    ARRAY_BASICS_FLD_ID_LABEL             ,
    ARRAY_BASICS_FLD_DESCRIPTION_LABEL    ,
    MSG_FIELD_NAME_CODE,
    MSG_FIELD_NAME_DESCRIPTION,
    //
    MSG_RECORDS,
    MSG_RECORD_NOT_FOUND,
    MSG_SEARCH_CONDICIONAL_AND,
    MSG_SEARCH_CONDICIONAL_OR,
    // translate menu group names
    MNU_STATE , // v. 4.0.0.4
    MNU_BASICS,
    MNU_MOVEMENT,
    MNU_REPORT,
    MNU_TOOLS,
    MNU_TOOLS_USERS   ,  // v. 3.3.0.0
    MNU_TOOLS_SETTINGS,  // v. 3.3.0.0
    MNU_TOOLS_VERSIONS,  // v. 3.3.0.0
    MNU_TOOLS_UPDATE  ,  // v. 3.3.0.0
    // translate menu options
    MNU_OTHERS,
    MNU_OTHERS_TRAINNING,
    MNU_OTHERS_SUPPORT,
    MNU_OTHERS_VIDEOS,
    MNU_OTHERS_GENERAL_INFO,
    MNU_OTHERS_OPEN_TICKET,
    // translate error messages
    // translate bsAlert..Message types
    MSG_INFO,
    MSG_WARNING,
    MSG_DANGER,
    MSG_SUCCESS,
    MSG_ERROR,
    MSG_YES,
    MSG_NO,
    MSG_RESTART,     // v. 3.2.0.5
    MSG_OPEN_TICKET, // v. 3.2.0.5
    MSG_CANCEL,
    MSG_CONTINUE,
    MSG_OK,
    MSG_CONFIRM,
    MSG_INVALID,
    MSG_DATETYPE,
    MSG_WELCOME,
    MSG_DELETE,
    MSG_USER,
    // date periodo search option( in frmBaseCRUD and frmBaseReportMenu )
    MSG_DATE_INTERVALS_TODAY            ,
    MSG_DATE_INTERVALS_YESTERDAY        ,
    MSG_DATE_INTERVALS_BEFORE_YESTERDAY ,
    MSG_DATE_INTERVALS_TOMORROW         ,
    MSG_DATE_INTERVALS_AFTER_TOMORROW   ,
    MSG_DATE_INTERVALS_THIS_WEEK        ,
    MSG_DATE_INTERVALS_LAST_WEEK        ,
    MSG_DATE_INTERVALS_NEXT_WEEK        ,
    MSG_DATE_INTERVALS_THIS_FORTNIGHT   ,
    MSG_DATE_INTERVALS_LAST_FORTNIGHT   ,
    MSG_DATE_INTERVALS_NEXT_FORTNIGHT   ,
    MSG_DATE_INTERVALS_THIS_MONTH       ,
    MSG_DATE_INTERVALS_LAST_MONTH       ,
    MSG_DATE_INTERVALS_NEXT_MONTH       ,
    MSG_DATE_INTERVALS_THIS_BIMESTER    ,
    MSG_DATE_INTERVALS_THIS_QUARTER     ,
    MSG_DATE_INTERVALS_THIS_SEMESTER    ,
    MSG_DATE_INTERVALS_THIS_YEAR        ,
    MSG_DATE_INTERVALS_LAST_YEAR        ,
    MSG_DATE_INTERVALS_ALL              ,
    MSG_DATE_INTERVALS_ALL_UNTIL_TODAY  ,
    // mkm_validate messages
    MSG_VALIDATE_INVALID_EXISTS, // v. 4.0.0.5
    MSG_VALIDATE_INVALID_VALUE, // v. 3.3.1.0
    MSG_VALIDATE_BLANK_FIELD,
    MSG_VALIDATE_OR_BLANK_CONTENT,
    MSG_VALIDATE_PASSWORD,
    MSG_VALIDATE_LENGTH_MIN,
    MSG_VALIDATE_LENGTH_MAX,
    // error / warning messages
    MSG_SELECT_VALID_RECORD,
    MSG_COMPANY_SELECT,
    MSG_COMPANY_USER_OTHER,
    MSG_BUGERROR_REGISTER_REQUEST,
    MSG_INVALID_LOGIN,
    MSG_INVALID_USER,
    MSG_INVALID_EMAIL,
    MSG_INVALID_PASSWORD,
    MSG_TABLE_DO_NOT_EXIST,
    MSG_BUGERROR_REGISTER_CAN_NOT_DELETE,
    MSG_BUGERROR_REGISTER_IN_USE,
    MSG_BUGERROR_COM_SERVER_FAIL,
    MSG_BUGERROR_MENU_DO_NOT_EXIST,
    MSG_BUGERROR_MAX_TAB_OPENED, // v. 4.0.0.0
    MSG_BUGERROR_POST,
    MSG_BUGERROR_INVALID_CONTENT,
    MSG_BUGERROR_PK_SEQUENCE,
    MSG_BUGERROR_OPEN_QUERY,
    MSG_BUGERROR_CLOSE_QUERY,
    MSG_BUGERROR_DEFAULT_SQL_STATMENT,
    MSG_BUGERROR_CONTENT_MUST_BE_NUMERIC,
    MSG_BUGERROR_INVALID_SEARCH_OPERATOR,
    MSG_BUGERROR_INCOMPATIBLE_SGBD,
    MSG_BUGERROR_FOREIGN_KEY_DELETE,
    //MSG_BUGERROR_LOOKUP_BTN,
    //MSG_BUGERROR_LOOKUP_BTN_QUERY,
    // v. 3.1.0.60
    MSG_ACCESS_TO,
    MSG_ACCESS_INSERT_TO,
    MSG_ACCESS_EDIT_TO,
    MSG_ACCESS_DELETE_TO,
    MSG_ACCESS_SEARCH_TO,
    MSG_ACCESS_MOVE_TO,
    // layout config
    CONFIG_LAYOUT_GRID_TITLE_BOLD, // v. 4.0.0.0
    CONFIG_LAYOUT_GRID_TITLE_UPPER, // v. 4.0.0.0
    CONFIG_LAYOUT_GRID_COLUMN_SEPARATOR, // v. 4.0.0.0
    CONFIG_LAYOUT_GRID_RC_PAGINATOR, // v. 4.0.0.0
    CONFIG_LAYOUT_GRID_ROW_HEIGHT, // v. 4.0.0.0
    CONFIG_LAYOUT_GRID_TITLE_BG, // v. 4.0.0.0
    CONFIG_LAYOUT_GRID_TITLE_COLOR, // v. 4.0.0.0
    CONFIG_LAYOUT_GRID_TITLE_BG_OVER, // v. 4.0.0.0
    CONFIG_LAYOUT_GRID_TITLE_COLOR_OVER, // v. 4.0.0.0
    CONFIG_LAYOUT_GRID_TITLE_COLOR_ICON, // v. 4.0.0.0
    CONFIG_LAYOUT_LOADMASK_TYPE, // v. 4.0.0.0
    CONFIG_LAYOUT_LOADMASK_IMG, // v. 4.0.0.0
    CONFIG_LAYOUT_SCROLLBAR_SIZE, // v. 4.0.0.0
    CONFIG_LAYOUT_ACTIVE_THEME,
    CONFIG_LAYOUT_USER_BG,
    CONFIG_LAYOUT_LINK_COLOR,
    CONFIG_LAYOUT_LINKHOVER_COLOR,
    CONFIG_LAYOUT_BG_COLOR,
    CONFIG_LAYOUT_LABEL_COLOR,
    CONFIG_LAYOUT_LABEL_WRAP,
    CONFIG_LAYOUT_LABEL_WEIGHT, // v. 4.0.0.0
    CONFIG_LAYOUT_LABEL_FORMS_DEFAULT ,
    CONFIG_LAYOUT_GRIDBLOCK_OFFSET,
    CONFIG_LAYOUT_GRIDBLOCK_ANIM,
    CONFIG_LAYOUT_MENUFONT_SIZE,
    CONFIG_LAYOUT_MENU_LOGO_BG_COLOR       ,
    CONFIG_LAYOUT_MENU_LOGO_FONT_COLOR       ,
    CONFIG_LAYOUT_MENU_TYPE       , // v. 4.0.0.4
    CONFIG_LAYOUT_ROUND_FORM,
    CONFIG_LAYOUT_ROUND_EDIT,
    CONFIG_LAYOUT_ROUND_EDIT_FACTOR,
    CONFIG_LAYOUT_ROUND_PANEL_FACTOR,
    CONFIG_LAYOUT_ROUND_BTN_FACTOR,
    CONFIG_LAYOUT_TAB_BACKGROUND_DEFAULT,
    CONFIG_LAYOUT_TAB_COLOR_FOCUS       ,
    CONFIG_LAYOUT_TAB_COLOR_HOVER       ,
    CONFIG_LAYOUT_TAB_MAX_OPENED        , // v. 3.1.0.61
    CONFIG_LAYOUT_TAB_OFF               , // v. 3.2.0.4
    CONFIG_LAYOUT_APP_FONT       ,
    CONFIG_LAYOUT_APPLY_FONT_ALL,
    CONFIG_LAYOUT_MENU_COLOR       ,
    CONFIG_LAYOUT_MENUFONT_COLOR   ,
    CONFIG_LAYOUT_LOGIN_COLOR      ,
    CONFIG_LAYOUT_BUTTON_COLOR,
    CONFIG_LAYOUT_BUTTON_COLOR_CRUD,
    CONFIG_LAYOUT_BUTTON_COLOR_HOVER,
    CONFIG_LAYOUT_BUTTON_COLOR_CRUD_HOVER,
    CONFIG_LAYOUT_GRID_SEL_COLOR ,
    CONFIG_LAYOUT_EDIT_COLOR       ,
    CONFIG_LAYOUT_EDIT_FONT_COLOR  ,
    CONFIG_LAYOUT_EDIT_COLOR_READONLY       , // v. 4.0.0.0
    CONFIG_LAYOUT_EDIT_FONT_COLOR_READONLY  , // v. 4.0.0.0
    CONFIG_LAYOUT_EDIT_COLOR_TRIGGER       , // v. 4.0.0.0
    CONFIG_LAYOUT_EDIT_FONT_COLOR_TRIGGER  , // v. 4.0.0.0
    CONFIG_LAYOUT_EDIT_FOCUS_COLOR ,
    CONFIG_LAYOUT_EDLKP_COLOR ,
    CONFIG_LAYOUT_EDLKP_FOCUS_COLOR,
    CONFIG_LAYOUT_EDLKP_FONT_COLOR     : string ;
    // arrays
    ARRAY_MONTH_NAMES   : Array [1 .. 12] of String ;
    ARRAY_WEEKEND_NAMES : Array [1 .. 7]  of String ;

    // general config
    CONFIG_SESSION_LOG : boolean;
    // app general config
    CONFIG_APP_TYPE, CONFIG_APP_SUBTYPE: string;
    // currency config
    CONFIG_CURRENCY_SYMBOL, // v. 3.3.3.2
    CONFIG_CURRENCY_NAME,   // v. 3.3.3.2
    CONFIG_CURRENCY_NAME_PLURAL,   // v. 3.3.3.2
    // database config
    CONFIG_DATABASE_RDW          ,
    CONFIG_DATABASE_FIREDAC      ,
    DATABASE_ACTIVE,
    CONFIG_DATABASE_HOST_IP      , // Conexao SERVIDOR - Empresa do Cliente
    CONFIG_DATABASE_PASSWORD     ,
    CONFIG_DATABASE_USERNAME     ,
    CONFIG_DATABASE_HOST_IP_RDW  , // Conexao SERVIDOR RDW - Empresa do Cliente
    CONFIG_DATABASE_PASSWORD_RDW ,
    CONFIG_DATABASE_USERNAME_RDW ,
    CONFIG_DATABASE_NAME_RDW     ,
    CONFIG_DATABASE_NAME : string;
    CONFIG_DATABASE_PORT,
    CONFIG_DATABASE_PORT_RDW : Integer ;
    // ------------------------------
    // calcular tempo
    // calculate time
    varDW_LastTick: DWORD;
    // para o retorno InputBOX
    // for the return of InputBOX
    varC_InputBox_Result1,
    varC_InputBox_Result2,
    varC_InputBox_Result3: String;

    varC_GridColName,
    varC_UserPassAdmin : String;

    varC_MenuGroup : string;

    // opções do menu que serão clicadas e suas respectivas tabelas no banco de dados
    // menu options that will be clicked and their respective tables in the database
    varA_MenuBasics,
    varA_MenuMovement,
    varA_MenuReport,
    varA_MenuTools,
    varA_MenuOptions : array of String;

    varA_MenuBasicsPermissions,
    varA_MenuMovementPermissions,
    varA_MenuReportPermissions,
    varA_MenuToolsPermissions,
    varA_MenuOptionsPermissions,
    varA_FSideMenuPermissions  : array of String;

    varA_FSideMenu   : array of rgSide_Menu;

    varI_NumMenu     : integer;
    varI_NumMenuPermissions : integer;

    varC_CustomMsg : string ;

    oPgGeneral : TUniPageControl;
    varB_LoginProcessed, // v. 3.3.0.1
    varB_RCFoldersMissing, // v. 4.0.0.0
    varB_DefaulPageBar,
    varB_iOS,
    varB_Android,
    varB_Desktop,
    varB_Tablet,
    varB_Screen_LandScape,
    varB_Mobile_Screen,
    varB_Mobile_Screen_Portrait,
    varB_Mobile_Screen_Landscape,
    varB_Resizing : Boolean;

    varI_BlockWidth,
    varI_ScreenWidth,
    varI_ScreenHeight : Integer;

    varSL_TagParams,
    varSL_HtmlMenu,
    varSL_HtmlPage : TStringList;

    varB_Yes,
    varB_No,

    // Indica que o acesso ao Banco de Dados:
    // Indicates that access to the Database
    // true : FireDac
    // false: RestDataWare
    //
    varB_Use_FireDac,

    // indica que está ALIMENTANDO o BD da própria softwarehouse
    varB_APP_SoftwareHouse,

    varB_APP_Locked,
    varB_APP_Blocked,
    varB_APP_Demo     : Boolean;

    //sinalizar processos efetuados de gravacao / alteracao / exclusao
    //signal recording / alteration / deletion processes
    varB_Processed,
    varB_OperationProcessed : Boolean;

    varD_DtIni,
    varD_DtEnd : TDateTime;

    // CURRENCYs/Floats
    varF_TempFloat1,
    varF_TempFloat2,
    varF_TempFloat3,
    varF_TempFloat4,
    varF_TempFloat: Extended;

    // DATAS
    varI_Month1,
    varI_Day1,
    varI_Year1,
    varI_Month2,
    varI_Day2,
    varI_Year2: Word;

    // WORDS
    varW_Year,
    varW_Month,
    varW_Day: Word;

    varI_Day,
    varI_Month,
    varI_Year,

    varI_Temp1,
    varI_Temp2,
    varI_Temp3,
    varI_Temp4,
    varI_Temp5,

    // controlar o fluxo de abas pra nao estourar os linmites da tela
    // control the flow of tabs so as not to overflow the screen boundaries
    varI_TabIni,
    varI_TabEnd : Integer ;
    varC_FormsInParent, // v. 3.4.0.0
    varC_Temp1,
    varC_Temp2,
    varC_Temp3,
    varC_Temp4,
    varC_Temp5,
    varC_TempLink,
    varC_TempString,

    varC_JSNAME_HTMLFRAME,
    APP_SQL_DATE_FORMAT,

    varC_TempFile,

    APP_PATH_FILES_GLOBAL,
    APP_PATH_IMAGES_GLOBAL,
    APP_PATH_CSS_GLOBAL,
    APP_PATH_JS_GLOBAL,

    APP_PATH_COMPANY,
    APP_PATH_APPS,
    APP_PATH_SYSTEM,
    APP_PATH_HELP,
    APP_PATH_DATA,

    APP_PATH_CERTIFICATES,
    APP_PATH_BD,
    APP_PATH_BUGERRORS,
    APP_PATH_UPLOADS,
    APP_PATH_DOWNLOADS,
    APP_PATH_CONTROL,
    APP_PATH_MENUS,
    APP_PATH_IMAGES,

    varC_Blocked,
    varC_Locked,
    varC_Password,
    varC_Doc_Customer,

    varC_LastProcFuncError,
    varC_UltSQLErro,
    varC_LastErrorMsg : string;

    varI_PosX, varI_PosY , varI_PosH, varI_PosW, // v. 3.2.0.0
    varI_Device_Licences,
    varI_ApplyUpdateErrors : Integer;

    // usuarios
    varC_User_Permissions : string;

    //máscaras para MaskEdit
    varC_Mask_Date,
    varC_Mask_Time,
    varC_Mask_Phone,
    varC_Mask_Phone8,
    varC_Mask_Phone_ddd10,
    varC_Mask_Phone_ddd11,
    varC_Mask_cnpj,
    varC_Mask_cpf,
    varC_Mask_cep,
    varC_Mask_float,
    varC_Mask_Integer : string;

    //controle de erros
    varC_SQLERROR,

    //ref. a tabelas
    varC_User,
    varC_User_Avatar,
    varC_CompanyName : string;

    varI_CodeSalesMan : integer;

    // STRINGS
    varC_SourceForm,
    //varC_User_CodeSalesMan, // v. 3.2.0.0
    varC_NameSalesMan : string;

    varC_FrmLookUpTag : integer;
    varC_SelectedItem_LookUp,
    varC_SelectedItem_FSideMenu : string ;

    varA_FormOrigin       : Array [1..10] of String;
    varA_Table_Search  : Array [1..50] of String;
    varA_Table_ItemSel   : array [1..50] of String;
    varA_FormOrigin_Aba   : Array [1..50] of String;

    // tabela / campo FILHA atual
    //
    // esses campos sao atualizados na funcao ATUALIZA_DetailS dos forms MESTRE/DETALHE
    varC_Table_Detail,
    varC_LinkedFormFrame : string;

    varI_Code_Company,        // old varI_Empresa
    varI_Code_CompanyMain,    // old varI_EmpresaMain
    varI_User : Integer;

    varC_Where,
    varC_WhereExtra,
    varC_Order,

    varC_FieldMasks,

    //FORM( frame padrao/PAI )
    varC_SearchWhere,
    varC_SearchOrder,
    varC_FormSource_Search,
    varC_Selected_FormFrame,
    varC_StatusSearch,

    //FORM( FILHO )
    varC_SearchWhere_Detail,
    varC_SearchOrder_Detail,
    varC_FormSource_Search_Detail,
    varC_Selected_FormFrame_Detail,
    varC_StatusSearch_Detail,

    // novo controle captura chave dinamica
    varC_PK_MasterTable ,
    varC_PK_DetailTable,

    varC_Field_PK,
    varC_Table_Search,
    varC_Search_Fields : String;

    varC_Code_ID_Field : string ;
    varC_Form_Master   : TUniForm;

    varC_Frame_ReportMenu ,
    varC_Frame_Master  : TUniFrame;
    varC_Form_Modal,
    varC_Form_Detail   : TUniForm;

    varI_Form_Detail_Left,
    varI_Form_Detail_Top : integer;

    varC_SQL_GENERIC,
    varC_SQL_Default_LookUps,

    varC_ContentField,
    varC_FieldName,
    varC_FieldType : String;

    varC_ErrorMsg,
    varC_Lookup_Code,
    varC_Code_ID : string;

    Active_Component : TComponent;

    // para o guia das telas
    varI_GuideTourSeq : Integer;

  end;

function mm: Tmm;


const
     // v. 3.2.0.2 // bugfix
     BS_COMPONENTS = 'bslabel bschk bsswt bsrgp bstabs bspills bsh1 bsh2 bsh3 bsh4 bsh5 bsh6 bsqrcode bscarousel bsvideo bsimg bshint bsalert rcalert rcfeature' +
                     'bsbnt bsedit bsdate bsemail bspassword bsmemo bsbtngroup bscardtabs bscard bscardheader bscardfooter';

implementation

{$R *.dfm}

uses
  UniGUIVars, ServerModule, uniGUIApplication, mkm_func_web, str_func,
  untdm_rc,
  Main, Login;//untDM_LOOKUPs,  untDM_TOTALS;

function mm: Tmm;
begin
  Result := Tmm(UniApplication.UniMainModule)
end;

procedure Tmm.SQLConnRecover(ASender, AInitiator: TObject;
  AException: Exception; var AAction: TFDPhysConnectionRecoverAction);
begin
     // cancelar conexões
     //
     // AAction := faOfflineAbort;
end;

procedure Tmm.UniGUIMainModuleBeforeLogin(Sender: TObject;
  var Handled: Boolean);
begin
    // Handled := True;
end;

procedure Tmm.UniGUIMainModuleBrowserClose(Sender: TObject);
begin
     UniSession.Log( '>>> mm.UniGUIMainModuleBrowserClose' );

     dm_rc.rc_CloseQuerys( dm_rc, True, False );
     dm_rc.rc_CloseQuerys( Self, True, True );
end;

// v. 3.1.0.60
procedure Tmm.UniGUIMainModuleCreate(Sender: TObject);
// v. 3.2.0..7
Var
   pNum         : Integer;
   pImgBgLogin : string;
   Inifile : TIniFile;
begin
     // v. 3.2.0..7
     Inifile := nil;

     // caminhos dos arquivos
     APP_PATH_FILES_GLOBAL   := sm.FilesFolderPath;//'files/' ;//mm.APP_PATH_FILES_GLOBAL;
     APP_PATH_IMAGES_GLOBAL  := APP_PATH_FILES_GLOBAL + 'images' + BACKSLASH;
     APP_PATH_CSS_GLOBAL     := APP_PATH_FILES_GLOBAL + 'css' + BACKSLASH;
     APP_PATH_JS_GLOBAL      := APP_PATH_FILES_GLOBAL + 'js' + BACKSLASH;
     // v. 4.0.0.0
     varB_RCFoldersMissing   := false;
     // v. 3.3.0.0
     //saber o tipo de dispositivo que está acessando o sistema
     // vDeviceType    := dm_rc.rc_GetDeviceType;

     SQLConn.Connected := False;

     // faz a aplicacao se comportar "como uma VCL"
     EnableSynchronousOperations  := True;

     // para melhorar 'responsividade' com mobile
     DesktopViewport.UserScalable := False;
     DesktopViewport.InitialScale := 1;
     DesktopViewport.MaximumScale := 1;

     // Desabilitar F5 pra impedir REFRESH do usuario
     // MainModule.mm.DocumentKeyOptions := [dkDisableF5];

     // Desabilitar Button direito do mouse para impedir a visualizacao do 'fonte'

         //[PT] Desabilitar Button direito do mouse para impedir a visualizacao do 'fonte'
         //[EN] Disable Right-click to prevent 'source' view
         // v. 4.0.0.6
         {$IFDEF RELEASE}
         // in DESIGNTIME, just...
         BrowserOptions := [boDisableMouseRightClick, boDisableChromeRefresh]; // v. 3.3.2.0
         // in RUNTIME without compiler directives( $IFDEF RELEASE )...
         //if mm.BrowserOptions = [] then
//         begin
//           mm.BrowserOptions := [boDisableMouseRightClick, boDisableChromeRefresh];
//           UniSession.AddJS('document.oncontextmenu = document.body.oncontextmenu = function () { return false; }');
////         end
////         else
////         begin
////           mm.BrowserOptions := [];
////           UniSession.AddJS('document.oncontextmenu = document.body.oncontextmenu = function () { return true; }');
//         end;
         dm_rc.rc_ProtectForm( Self );
         {$ENDIF}
     // datamodules serao criados apenas quando ACIONADOS
     ApplicationDataModuleOptions.CreateOnDemand := False;

     varI_GuideTourSeq := 0;

     // máscaras dos edits
     varC_Mask_Date               := '!99/99/9999;1; ';
     varC_Mask_Time               := '!99:99;1; ';
     varC_Mask_Phone              := '99999\-9999;0; ';
     varC_Mask_Phone8             := '9999\-9999;0; ';
     varC_Mask_Phone_ddd10        := '\(99\)9999\-9999;0; ';
     varC_Mask_Phone_ddd11        := '\(99\)99999\-9999;0; ';
     varC_Mask_cnpj               := '99\.999\.999\/9999\-99;0; ';
     varC_Mask_cpf                := '999\.999\.999\-99;0; ';
     varC_Mask_cep                := '99\.999\-999;0; ';
     //varC_Mask_float              := '999.999.999,9999;0; ';
     varC_Mask_Integer            := '99999999999;0; ';

     // default  - DEFAULT
     // ofc      - CENTRO AUTOMOTIVO | AUTOMOTIVE CENTER
     // otc      - ÓTICAS | OPTICS
     // confec   - CONFECÇÕES | CLOTHES STORE
     // pet      - PET SHOP
     // distrib  - DISTRIBUIDORAS | DISTRIBUTORS
     // glp      - REVENDAS DE GLP/ÁGUA  | LPG/WATER RESALE
     // body     - CLÍNICA DE ESTÉTICA | AESTHETIC CLINIC
     // food     - BAR E RESTAURANTE | BAR AND RESTAURANT
     // info     - INFORMÁTICA / ASSIST. TÉCNICA  | COMPUTER TECHNOLOGY / SERVICES
     // hair     - SALÃO DE BELEZA | BEAUTY SALON
     CONFIG_APP_TYPE           := 'default';
     CONFIG_APP_SUBTYPE        := '';

     pNum := dm_rc.rc_LoadConfig;
     // v. 4.0.0.0
     //dm_rc.rc_LoadTheme( '' );
     // v. 3.4.0.0
     dm_rc.rc_GetDeviceType;
     // v. 4.0.0.0
     dm_rc.rc_LoadTheme( '' );

     if not varB_Mobile_Screen then
        pImgBgLogin := APP_PATH_IMAGES_GLOBAL + CONFIG_APP_TYPE.ToLower + BACKSLASH + pNum.ToString + '.jpg'
     else
        pImgBgLogin := APP_PATH_IMAGES_GLOBAL + 'mobile' + BACKSLASH + CONFIG_APP_TYPE.ToLower + BACKSLASH + pNum.ToString + '.jpg';
     // v. 3.4.0.0
     if CONFIG_APP_SUBTYPE <> '' then
        if not varB_Mobile_Screen then
           pImgBgLogin := APP_PATH_IMAGES_GLOBAL + CONFIG_APP_TYPE.ToLower + BACKSLASH + CONFIG_APP_SUBTYPE.ToLower + BACKSLASH + pNum.ToString + '.jpg'
        else
           pImgBgLogin := APP_PATH_IMAGES_GLOBAL + 'mobile' + BACKSLASH + CONFIG_APP_TYPE.ToLower + BACKSLASH + CONFIG_APP_SUBTYPE.ToLower + BACKSLASH + pNum.ToString + '.jpg';

     if not FileExists(pImgBgLogin) then
     begin
       pNum := 1;
       // v. 3.4.0.0
       if not varB_Mobile_Screen then
          pImgBgLogin := APP_PATH_IMAGES_GLOBAL + CONFIG_APP_TYPE.ToLower + BACKSLASH + pNum.ToString + '.jpg'
       else
          pImgBgLogin := APP_PATH_IMAGES_GLOBAL + 'mobile' + BACKSLASH + CONFIG_APP_TYPE.ToLower + BACKSLASH + pNum.ToString + '.jpg';
       // v. 3.4.0.0
       if CONFIG_APP_SUBTYPE <> '' then
          if not varB_Mobile_Screen then
             pImgBgLogin := APP_PATH_IMAGES_GLOBAL + CONFIG_APP_TYPE.ToLower + BACKSLASH + CONFIG_APP_SUBTYPE.ToLower + BACKSLASH + pNum.ToString + '.jpg'
          else
             pImgBgLogin := APP_PATH_IMAGES_GLOBAL + 'mobile' + BACKSLASH + CONFIG_APP_TYPE.ToLower + BACKSLASH + CONFIG_APP_SUBTYPE.ToLower + BACKSLASH + pNum.ToString + '.jpg';

//       pImgBgLogin := APP_PATH_IMAGES_GLOBAL + CONFIG_APP_TYPE.ToLower + BACKSLASH + pNum.ToString + '.jpg';
//
//       if CONFIG_APP_SUBTYPE <> '' then
//         pImgBgLogin := APP_PATH_IMAGES_GLOBAL + CONFIG_APP_TYPE.ToLower + BACKSLASH + CONFIG_APP_SUBTYPE.ToLower + BACKSLASH + pNum.ToString + '.jpg';
     end;

     LoginBackground.Fit := true;// mm.varB_Mobile_Screen;// False; // v. 4.0.0.0

     if FileExists( pImgBgLogin ) then
        LoginBackground.Picture.LoadFromFile( pImgBgLogin );

     // Ult. Seq. de Imagem
     try
       IniFile := TiniFile.Create( sm.FilesFolderPath + StringReplace( StrTokenClear( APP_NAME ), ' ', '', [rfReplaceAll] ) + '_cfg.ini' );
       IniFile.WriteString( 'App', 'loginBg', pNum.ToString);
     finally
       IniFile.Free;
     end;

     (*<prj-nologin>*)//mm.varB_OperationProcessed := dm_rc.rc_ProcessFirstConnection;
end;

procedure Tmm.UniGUIMainModuleDestroy(Sender: TObject);
begin
     UniSession.Log( '>>> mm.UniGUIMainModuleDestroy' );
end;

procedure Tmm.UniGUIMainModuleSessionTimeout(ASession: TObject;
  var ExtendTimeOut: Integer);
begin
     UniSession.Log( '>>> mm.UniGUIMainModuleSessionTimeout' );
     ExtendTimeOut := 1800000;// 600000;
end;

initialization
  RegisterMainModuleClass(Tmm);

end.
