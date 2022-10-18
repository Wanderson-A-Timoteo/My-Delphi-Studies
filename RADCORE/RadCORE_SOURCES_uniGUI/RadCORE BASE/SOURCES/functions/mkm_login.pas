unit mkm_login; // v. 3.2.0.0

interface

uses
    System.SysUtils, System.Classes , System.TypInfo, JSON, DBXJSON, DBXJSONReflect,
    System.DateUtils,
    // feedback: Mesut from Turkey
    {$ifdef MSWINDOWS}
    Winapi.Windows,
    {$endif}
    math, System.Rtti, System.StrUtils, Vcl.Graphics, Data.Db,
    UniGuiClasses, uniGUIApplication;

procedure rc_GetDefaultUserInfo;
procedure rc_GetDefaultBrowserInfo;
procedure rc_GetDefaultPaths( pCreate:boolean; pDoc:string );

implementation

uses uconsts, untdm_rc, str_func, MainModule, ServerModule;

procedure rc_GetDefaultUserInfo;
begin
   mm.vUserEmail            := 'mikromundo@gmail.com';
   mm.vUserName             := 'radcoreadmin';
   //mm.vPass                 := mm.varC_UserPassAdmin; // v. 3.2.0.5
   mm.vUserLoginTimeStamp   := Now;
   mm.varC_User_Avatar      := 'C:\inetpub\wwwroot\radcore\uploads\usuarios\avatar_4.png';
   mm.varI_User             := 1;
   mm.varC_NameSalesMan     := mm.varC_USer;
   mm.varI_CodeSalesMan     := 0;;
   // default company info
   mm.varI_Code_Company     := 1;
   mm.varI_Code_CompanyMain := 1;
   mm.varC_CompanyName      := SOFTWAREHOUSE_NAME;
   // Aqui capturamos o DOCUMENTO DA EMPRESA selecionada no LOGIN para controle de licença.
   // No Brasil usamos o CNPJ, você poderá ajustar de acordo com seu controle ou até mesmo remover e fazer seu próprio controle de licença.
   //
   // Here we capture the COMPANY DOCUMENT selected in the LOGIN for license control.
   // In Brazil we use the CNPJ, you can adjust according to your control or even remove and make your own license control.
   mm.varC_Doc_Customer := SOFTWAREHOUSE_CNPJ;
   // as variáveis abaixo serão criticadas no ACESSO as telas/forms, ao CADASTRAR, ALTERAR, EXCLUIR etc
   // the variables below will be criticized in ACCESS the screens / forms, when REGISTERING, CHANGING, DELETING etc.
   mm.varC_Blocked         := mm.VALUE_NO;
   mm.varC_Locked          := mm.VALUE_NO;
   mm.varI_Device_Licences := 3;

   mm.varB_Processed := True;
end;

procedure rc_GetDefaultBrowserInfo;
var
  CI : TUniClientInfoRec;
begin
   // get browser info
   CI := UniApplication.ClientInfoRec;
   mm.vUserBrowserType    := CI.BrowserType;
   mm.vUserBrowserVersion := IntToStr( CI.BrowserVersion );
   mm.vUSer_SO            := CI.OSType;
end;

procedure rc_GetDefaultPaths( pCreate:boolean; pDoc:string );
var
   i,r : integer;
begin
   // aqui são criadas pastas que serão usadas na aplicação
   // algumas pastas são específicas para documentos usados no Brasil
   mm.APP_PATH_COMPANY      := sm.FilesFolderPath + pDoc + BACKSLASH ;
   mm.APP_PATH_APPS         := mm.APP_PATH_COMPANY;
   mm.APP_PATH_SYSTEM       := mm.APP_PATH_COMPANY;
   mm.APP_PATH_HELP         := mm.APP_PATH_COMPANY + 'help' + BACKSLASH ;
   mm.APP_PATH_DATA         := mm.APP_PATH_SYSTEM + 'data' + BACKSLASH ;
   mm.APP_PATH_CERTIFICATES := mm.APP_PATH_DATA + 'certificates' + BACKSLASH ;
   mm.APP_PATH_BUGERRORS    := mm.APP_PATH_DATA + 'errors' + BACKSLASH ;
   mm.APP_PATH_UPLOADS      := mm.APP_PATH_DATA + 'uploads' + BACKSLASH ;
   mm.APP_PATH_DOWNLOADS    := mm.APP_PATH_DATA + 'downloads' + BACKSLASH ;
   mm.APP_PATH_CONTROL      := mm.APP_PATH_DATA + 'cfg' + BACKSLASH ;
   mm.APP_PATH_MENUS        := mm.APP_PATH_DATA + 'menus' + BACKSLASH ;
   mm.APP_PATH_IMAGES       := mm.APP_PATH_DATA + 'images' + BACKSLASH ;

   if pCreate then
   begin
      If not DirectoryExists ( lowercase( mm.APP_PATH_COMPANY ) ) then
         MkDir( mm.APP_PATH_COMPANY );

      If not DirectoryExists ( lowercase( mm.APP_PATH_APPS ) ) then
         MkDir( mm.APP_PATH_APPS );

      If not DirectoryExists ( lowercase( mm.APP_PATH_SYSTEM ) ) then
         MkDir( mm.APP_PATH_SYSTEM );

      If not DirectoryExists ( lowercase( mm.APP_PATH_HELP ) ) then
         MkDir( mm.APP_PATH_HELP );

      If not DirectoryExists ( lowercase( mm.APP_PATH_DATA ) ) then
         MkDir( mm.APP_PATH_DATA );

      If not DirectoryExists ( lowercase( mm.APP_PATH_CERTIFICATES ) ) then
         MkDir( mm.APP_PATH_CERTIFICATES );

      If not DirectoryExists ( lowercase( mm.APP_PATH_BUGERRORS ) ) then
         MkDir( mm.APP_PATH_BUGERRORS );

      If not DirectoryExists ( lowercase( mm.APP_PATH_UPLOADS ) ) then
         MkDir( mm.APP_PATH_UPLOADS );

      If not DirectoryExists ( lowercase( mm.APP_PATH_DOWNLOADS ) ) then
         MkDir( mm.APP_PATH_DOWNLOADS );

      If not DirectoryExists ( lowercase( mm.APP_PATH_CONTROL ) ) then
         MkDir( mm.APP_PATH_CONTROL );

      If not DirectoryExists ( lowercase( mm.APP_PATH_MENUS ) ) then
         MkDir( mm.APP_PATH_MENUS );

      If not DirectoryExists ( lowercase( mm.APP_PATH_IMAGES ) ) then
         MkDir( mm.APP_PATH_IMAGES );

      I := Length( ARRAY_COMPANY_TYPE );
      for r := 1 to I do
          If not DirectoryExists ( lowercase( mm.APP_PATH_IMAGES + Copy( ARRAY_COMPANY_TYPE[ r ] , 1 , Pos( '-' , ARRAY_COMPANY_TYPE[ r ] ) - 1 ) ) ) then
             MkDir( lowercase(mm.APP_PATH_IMAGES + Copy( ARRAY_COMPANY_TYPE[ r ] , 1 , Pos( '-' , ARRAY_COMPANY_TYPE[ r ] ) - 1 ) ) );

   end;
end;

end.
