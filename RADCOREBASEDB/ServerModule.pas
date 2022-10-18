unit ServerModule;

interface

uses
  Classes, SysUtils, uniGUIServer, uniGUIMainModule, uniGUIApplication, uIdCustomHTTPServer,
  uniGUITypes,   inifiles, Graphics,
  Vcl.Consts, // Traduzir algumas mensagens de erro do Delphi
  Vcl.VdbConsts, Windows, //  tem que declarar a Unit VdbConsts e Windows.
  uniGUIClasses,
  // feedback: Mesut from Turkey
  {$ifdef MSWINDOWS}
  shellapi,
  //Forms, // v. 3.3.1.0
  {$endif}
  uniGUIDialogs, //dialogs, // v. 3.3.1.0
  FireDAC.UI.Intf, FireDAC.Phys.FBDef,
  FireDAC.Phys.PGDef, FireDAC.Phys.MySQLDef, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Stan.Def, FireDAC.Phys, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Phys.MySQL, FireDAC.Phys.PG,
  FireDAC.Phys.IBBase, FireDAC.Phys.FB, FireDAC.Comp.UI, FireDAC.ConsoleUI.Wait;

type
  Tsm = class(TUniGUIServerModule)
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
    FDPhysFBDriverLink: TFDPhysFBDriverLink;
    FDPhysPgDriverLink: TFDPhysPgDriverLink;
    FDPhysMySQLDriverLink: TFDPhysMySQLDriverLink;
    FDMetaInfoQuery: TFDMetaInfoQuery;
    FDManager: TFDManager;
    procedure UniGUIServerModuleCreate(Sender: TObject);
    procedure UniGUIServerModuleDestroy(Sender: TObject);
    procedure UniGUIServerModuleControlPanelLogin(ASession: TUniGUISession;
      const Auser, APassword: string; var LoginValid: Boolean;
      LoginAttempt: Integer);
    procedure UniGUIServerModuleBeforeInit(Sender: TObject);
    procedure UniGUIServerModuleException(Sender: TUniGUIMainModule;
      AException: Exception; var Handled: Boolean);
    procedure UniGUIServerModuleHTTPCommand(ARequestInfo: TIdHTTPRequestInfo;
      AResponseInfo: TIdHTTPResponseInfo; var Handled: Boolean);
    procedure UniGUIServerModuleBeforeShutdown(Sender: TObject);
  private
    { Private declarations }
    FBrowserCaption: string; // Sherzod from forum... // v. 3.1.0.60
    // v. 4.0.0.0
    FUniGUIServerModuleStarted,
    FUniGUIServerModuleError : boolean;
  protected
    procedure FirstInit; override;
  public
    { Public declarations }
    
    procedure rc_Exception( pE : Exception );

  end;

function sm: Tsm;


// feedback: Mesut from Turkey
{$ifdef MSWINDOWS}
Procedure ExploreWeb(page:PChar);
{$endif}

implementation

{$R *.dfm}

uses
  UniGUIVars, uconsts, MainModule, untdm_rc, str_func, mkm_func_web, uVersion; // v. 3.1.0.60


// feedback: Mesut from Turkey
{$ifdef MSWINDOWS}
procedure HookResourceString(rs: PResStringRec; newStr: PChar);
var
  oldprotect: DWORD;
begin
  VirtualProtect(rs, SizeOf(rs^), PAGE_EXECUTE_READWRITE, @oldprotect);
  rs^.Identifier := Integer(newStr);
  VirtualProtect(rs, SizeOf(rs^), oldprotect, @oldprotect);
end;

procedure ExploreWeb(page:PChar);
var
   Returnvalue: integer;
begin
    ReturnValue := ShellExecute(0, 'open', page, nil, nil, 1);

    if ReturnValue <= 32 then
    begin
        case Returnvalue of
            0 : Showmessage('Error: Out of memory');
            2 : Showmessage('Error: File not found');
            3 : Showmessage('Error: Folder not found');
            11: Showmessage('Error: Corrupt or invalid file');
        else
            Showmessage(PChar('Error Nr: '+IntToStr(Returnvalue)+' When running the server application.'))
        end;
    end;
end;
{$endif}

function sm: Tsm;
begin
  Result:=Tsm(UniGUIServerInstance);
end;

procedure Tsm.FirstInit;
begin
  InitServerModule(Self);
end;
// v. 4.0.0.0
procedure Tsm.UniGUIServerModuleBeforeInit(Sender: TObject);
var
   Inifile : TIniFile;
   cTemp : string;
begin
   // v. 4.0.0.0
   if FUniGUIServerModuleError then
   begin
      ShowMessage('UniGUIServerModuleBeforeInit error! Check your DELPHI COMPILER FOLDER / ADM PERMISSIONS.');
   end
   else
   begin
      // v. 3.2.0..7
      Inifile := nil;
      // v. 4.0.0.0
      FUniGUIServerModuleStarted := false;
      // Config FILE: "APP_NAME"_Cfg.ini
      try
         try
           cTemp := StringReplace( StrTokenClear( APP_NAME ), ' ', '', [rfReplaceAll] );
           cTemp := FilesFolderPath + cTemp + '_cfg.ini' ;

           IniFile := TiniFile.Create( cTemp );

           if Not FileExists( cTemp ) then
           begin
              IniFile.WriteString( 'App', 'app_port'   , APP_PORT) ;
              IniFile.WriteString( 'App', 'session_log', 's') ;
           end;

           Port := StrToIntDef( IniFile.ReadString( 'App', 'app_port', APP_PORT ), StrToIntDef( APP_PORT, 8075 ) );

         finally
           IniFile.Free;
         end;
      except on e:exception do
             begin
               FUniGUIServerModuleError := True;
               //LogException( Self, E, 'UniGUIServerModuleBeforeInit' );
               ShowMessage('error: radcore defaul CFG file! Check your DELPHI COMPILER FOLDER / ADM PERMISSIONS.');
             end;
      end;

      FBrowserCaption := APP_NAME;
      Title := APP_NAME + ' ' + FileVersion + ' [' + Port.ToString + ']';

      AjaxTimeout := 60000;

      // feedback: Mesut from Turkey
      {$ifdef LINUX}
        ExtRoot     := '/radcore/ext-7.0.0';        // <-- your version
        UniRoot     := '/radcore/uni-1.90.0.1537';  // <-- your version
        FilesFolder := '/radcore/files';
      {$endif}

      // se quiser fazer teste de STRESS..Descomente:
      // if you want to test STRESS..uncomment:
      // sm.Options := [soAllowSessionRecording];

      // passando parametros pra aplicacao
      // passing parameters to the application
      //
      //http://seuIP_ou_dominio/nomeapp/nomeexeoudll.exe?p1=99&p2=999  NORMAL
      //
      //http://seuIP_ou_dominio/nomeapp/nomeexeoudll.exe/m?p1=99&p2=999  MOBILE
      //
      //no app
      //
      //vP1 := UniApplication.Parameters.Values['p1'];
      //vP2 := UniApplication.Parameters.Values['p2'];
      // v. 4.0.0.0
      FUniGUIServerModuleStarted := true;
   end;
end;

procedure Tsm.UniGUIServerModuleBeforeShutdown(Sender: TObject);
begin
     UniSession.Log( '>>> sm.UniGUIServerModuleBeforeShutdown' );
end;

procedure Tsm.UniGUIServerModuleControlPanelLogin(
  ASession: TUniGUISession; const Auser, APassword: string;
  var LoginValid: Boolean; LoginAttempt: Integer);
begin
     // acesso as estatisticas de uso do servidor
     // access to server usage statistics
     mm.varC_UserPassAdmin := USER_ADMIN_PASS; // v. 2.0.0.127

     LoginValid := False;
     if ( Auser = 'radcoreadmin' ) and ( dm_rc.rc_GetMD5( APassword ) = mm.varC_UserPassAdmin ) then
        LoginValid := True;
end;
// v. 3.1.0.60
procedure Tsm.UniGUIServerModuleCreate(Sender: TObject);
var
  //NotifyIconData : TNotifyIconData;
  //vForm: TForm;
  //iForm: Integer;
   oFDManager : TFDManager;
begin
    // v. 4.0.0.0
    FUniGUIServerModuleError := false;
    FUniGUIServerModuleStarted := false;
     // future implementation
//     TrayIcon1.Visible := false;
//     TrayIcon1.Visible := not ModuleIsLib;
//     if TrayIcon1.Visible then
//     begin
//         TrayIcon1.Hint    := Title ;
//         TrayIcon1.Visible := True;
//         for iForm := 0 to Screen.FormCount - 1 do
//         begin
//           vForm := Screen.Forms[iForm];
//           if vForm.Handle <> Application.MainForm.Handle then
//             break;
//         end;
//
//         FillChar( NotifyIconData, System.SizeOf(TNotifyIconData), 0 );
//         NotifyIconData.cbSize := SizeOf(TNotifyIconData);
//         NotifyIconData.Wnd := Application.MainForm.Handle;
//         NotifyIconData.uID := 1002;
//         Shell_NotifyIcon( NIM_DELETE, @NotifyIconData );
//     end;

     Title := FBrowserCaption;//APP_NAME; // v. 3.1.0.60

     // http://www.unigui.com/doc/online_help/api/uniGUIServer_TUniServerOption.html
     //
     // verifique as configurações corretas para sua aplicação
     // check the correct settings for your application
     //
     // HOUVE ERRO NA COMPILAÇÃO ?   /   DO YOU HAVE A COMPILE ERROR ?
     //
     // in unigui old versions, maybe need to comment this lines below
     // em versões antigas do unigui, comente as linhas abaixo
     Options                                := [ //soDontLoadJQueryLib,
                                                 soAutoPlatformSwitch,
                                                 soRestartSessionOnTimeout,
                                                 //soDontCompressDownloads, // algumas ocasiões que o FireFox não reconhece corretamente o arquivo gzip, então, deve-se habilitar
                                                 {$ifndef DEBUG}soWipeShadowSessions,{$endif}
                                                 soEnableSessionMonitor,
                                                 soEnableSessionMonitorAdmin];

     MimeTable.AddMimeType('xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', False);
     MimeTable.AddMimeType('woff', 'application/font', False);
     MimeTable.AddMimeType('woff2', 'application/font', False);
     MimeTable.AddMimeType('ttf', 'application/font', False);
     // feedback: Mesut from Turkey
     MimeTable.AddMimeType('map', 'application/map', False); // to bootstrap map files( and others )

     // v. 3.1.0.60
     oFDManager := TFDManager( FindComponent( 'FDManager' ) );
     if oFDManager <> nil then
     begin
       oFDManager.Active := false;
       //FDManager.ConnectionDefFileName := 'radcore'; // problema com versões anteriores a SydNey // v. 3.0.0.47
       //oFDManager.ResourceOptions.BackupFolder := StartPath + 'files/database';
       //FDPhysMySQLDriverLink.Release;
       //oFDManager.Active := True;
     end;

     // se quiser abrir o projeto ao executar, descomente a linha
     {$ifdef MSWINDOWS}
     //ExploreWeb( PChar( 'http://localhost:' + Port.ToString ) );
     {$endif}
end;
// v. 3.0.0.0
procedure Tsm.UniGUIServerModuleDestroy(Sender: TObject);
var
   oFDManager : TFDManager;
begin
     //UniSession.Log( '>>> sm.UniGUIServerModuleDestroy' );
     oFDManager := TFDManager( FindComponent( 'FDManager' ) );
     if oFDManager <> nil then
        oFDManager.Active := False;
end;
   // v. 4.0.0.0
procedure Tsm.rc_Exception( pE : Exception );
var
  oCmp : TComponent;
  cErr,
  cCls, cCmp, cFrm,
  cMsg  : string;
begin
   // v. 4.0.0.0
   if FUniGUIServerModuleStarted then
   begin
      cCls := '';
      cMsg := '';
      cCmp := '';
      cFrm := '';
      cErr := '';

      if pE <> nil then
      begin
        cCls := pE.ClassName;
        cMsg := pE.Message;
        cErr := '<strong>Class:</strong> ' + cCls + '<br>' +
                '<strong>Msg:</strong> ' + cMsg + '<br>' +
                '<strong>SysUser:</strong> ' + UniSession.GetSystemUser + '<br>' +
                '<strong>Ip:</strong> ' + UniSession.RemoteIP + '<br><br>' ;
      end;

      oCmp := TUniGUIApplication(UniApplication).UniSession.CurrentComponent;
      if Assigned(oCmp) then
      begin
        cCmp := oCmp.Name + ' (' + oCmp.ClassName + ')';
        cErr := cErr + '<strong>Obj:</strong> ' + cCmp + '<br>';
      end;

      if oCmp is TUniControl then
        cFrm := TUniControl( oCmp ).OwnerForm.Name
      else
      if oCmp is TUniComponent then
        cFrm := TUniComponent( oCmp ).OwnerForm.Name;

      if cFrm <> EmptyStr then
         cErr := cErr + '<strong>Form:</strong> ' + cFrm + '<br>';

      UniSession.Log( cErr );

      if ( dm_rc <> nil ) then
         dm_rc.rc_ShowError( cErr + '<br><hr>' + mm.MSG_CONTACT_SUPPORT);
   end;
end;

procedure Tsm.UniGUIServerModuleException(
  Sender: TUniGUIMainModule; AException: Exception; var Handled: Boolean);
var
  CurSession : TUniGUISession;
begin
   // v. 4.0.0.0
   if FUniGUIServerModuleStarted then
   begin
      if not (AException is EAbort) then
      begin
        if not (AException is UniErrorException) and
           not (AException is EUniSessionException) then
        begin

          CurSession := UniSession;

          if Assigned(CurSession) then CurSession.AlertDisabled := True;
          try
            rc_Exception( AException );
            Handled := True;
          finally
            if Assigned(CurSession) then CurSession.AlertDisabled := False;
          end;
        end;
      end;
   end;
end;
// v. 3.1.0.60
procedure Tsm.UniGUIServerModuleHTTPCommand(
  ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo;
  var Handled: Boolean);
var
  s , cHost, cURI: string;
begin
  // Para bloquear totalmente o acesso ao SERVER do uniGUI ou liberar para determinado IP
  // tag será usado para não carregar o css padrão do RadCORE
  // To completely block access to the uniGUI SERVER or release to a specific IP
  // tag will be used to not load the default RadCORE css
  s := ARequestInfo.Document.ToLower;

  Tag := 0;
  if (s.StartsWith('/server') ) then // and (ARequestInfo.RemoteIP = '127.0.0.1')) then
  begin
       Tag := 1;
//    AResponseInfo.ResponseNo := 401;
//    AResponseInfo.ContentText := 'Access denied!';
//    Handled := True;

  end;

  if Tag = 0 then
  begin
    // Check if trying to access sub-directories from the outside (not within unigui)
    // uncomment the code below if the app is STANDALONE
    // descomente as linhas abaixo se a aplicação for STANDALONE
//    if ( (ARequestInfo.URI <> '/') and (ARequestInfo.Referer = '') ) then
//    begin
//      cHost := LowerCase( ARequestInfo.Host );
//      cURI  := LowerCase( ARequestInfo.URI );
//
//      if strTokenCount( cHost + cURI, '/' ) > 1 then
//      begin
//        // Save log
//        Logger.AddLog( APP_NAME, 'REJECTED - '+
//                       DateTimeToStr( now() ) + ' - ' +
//                       'IP: ' + ARequestInfo.RemoteIP + ', ' +
//                       'URI: ' + cURI + ', ' +
//                       'DOCUMENT: ' + ARequestInfo.Document );
//        // Reject
//        Handled := True;
//        AResponseInfo.ResponseNo      := 405;
//        AResponseInfo.CloseConnection := True;
//        AResponseInfo.CloseSession;
//      end; // Occurences
//    end;
  end;
end;

initialization
  RegisterServerModuleClass(Tsm);

  // v. 3.2.0.4 // feedback by Walter Fordham for GLOBAL VERSION
  // Descomente o block abaixo ( [[TRANSLATE ) se desejar traduzir para o português
  // Uncomment the block below ( [[TRANSLATE ) if you want to translate to Portuguese
  //
  // Dica do FÓRUM - Eduardo Belo / Marlon / Dimas
  //
  // Translate Messages in Vcl.VdbConsts.pas Unit ( English to Portuguese Br )
  // resourcestring { DBCtrls }
  // UniDBNavigator
  // feedback: Mesut from Turkey
{$ifdef MSWINDOWS}
  //----------[[TRANSLATE
//  HookResourceString( @SFirstRecord    , PChar('Primeiro Registro'));
//  HookResourceString( @SPriorRecord    , PChar('Registro Anterior'));
//  HookResourceString( @SNextRecord     , PChar('Próximo Registro'));
//  HookResourceString( @SLastRecord     , PChar('Último Registro'));
//  HookResourceString( @SInsertRecord   , PChar('Inserir'));
//  HookResourceString( @SDeleteRecord   , PChar('Excluir'));
//  HookResourceString( @SEditRecord     , PChar('Editar'));
//  HookResourceString( @SPostEdit       , PChar('Confirmar'));
//  HookResourceString( @SCancelEdit     , PChar('Cancelar'));
//  HookResourceString( @SRefreshRecord  , PChar('Atualizar Dados'));
//  HookResourceString( @SApplyUpdates   , PChar('Aplicar Atualizações'));
//  HookResourceString( @SCancelUpdates  , PChar('Cancelar Atualizações'));
//  HookResourceString( @SDeleteRecordQuestion, PChar('Excluir Registro?'));
//  // Vcl.Consts, // Traduzir algumas mensagens de erro do Delphi
//  HookResourceString( @SMsgDlgWarning     , pchar('Atenção')) ;
//  HookResourceString( @SMsgDlgInformation , pchar('Informação')) ;
//  HookResourceString( @SMsgDlgConfirm     , pchar('Confirma')) ;
//  HookResourceString( @SMsgDlgError       , pchar('Erro')) ;
  //----------TRANSLATE]]
{$endif}


end.
