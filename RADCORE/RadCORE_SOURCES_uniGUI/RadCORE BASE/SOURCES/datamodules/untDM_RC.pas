unit untDM_RC; // v. 4.0.0.0

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
  IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdExplicitTLSClientServerBase, IdFTP, uniFileUpload,
  //ACBrPosPrinter, ACBrConsultaCNPJ, ACBrSocket, ACBrCEP, ACBrBase, ACBrMail, // v. 3.0.0.0
  uniSweetAlert, uniGridExporters, uniBasicGrid ;

type
  TExUniCustomDBGrid = class (TUniCustomDBGrid)
  end;

type
  tdm_rc = class(TDataModule)
    IdFTP1: TIdFTP;
    uniFileUp: TUniFileUpload;
    UniSweetAlert: TUniSweetAlert;
    UniGridExcelExporter1: TUniGridExcelExporter;
    UniGridXMLExporter1: TUniGridXMLExporter;
    UniGridHTMLExporter1: TUniGridHTMLExporter;
    UniGridCSVExporter1: TUniGridCSVExporter;
    procedure DataModuleCreate(Sender: TObject);
    procedure UniSweetAlertConfirm(Sender: TObject);
    procedure UniSweetAlertDismiss(Sender: TObject; const Reason: TDismissType);
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
    function  rc_GetMD5(const pText:string ):string; // v. 3.0.0.0
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
    procedure rc_ReportDateInterval( pPeriod: string ); // v. 3.0.0.0
    procedure rc_ResizeBlocks( pFrame : TObject; pRunBSRender : boolean = true; pRunAlignment : boolean = true; pScrollTop : boolean = true ); // v. 4.0.0.0
    procedure rc_BootStrapRender( pForm : TObject ; pUpdateDBFields : Boolean = False ; pOnlyThisObj : TObject = nil );
    procedure rc_AdjustEditColors( pForm : TObject );
    procedure rc_RenderControls(pForm: TObject; pOnlyThisObj : TUniControl = nil ); // v. 4.0.0.0
    procedure DynamicOnClickLink( sender :TObject ); // v. 3.0.0.0
    procedure DynamicOnClickDial( sender :TObject ); // v. 3.0.0.0
    procedure DynamicOnClickMail( sender :TObject ); // v. 3.0.0.0( in development )
    // enabled on / off controls
    procedure rc_ObjectEnabled( pFrame: TObject; pObj : TUniControl; pState: Boolean);
    procedure rc_MaskAdjust( pDbEdit : TObject; pMaskType : TRCMaskType; pCustomMask : string = '' ); // v. 3.0.0.0
    // retorna o componente pai para retornar a posição absoluta ( x, y )
    procedure rc_GetObjParent( pForm:TObject; pObj : TUniControl; out iLeft, iTop : integer; pParentComp : TComponent );
    procedure rc_ShowTour( pForm:TObject );
    procedure rc_NextTour(Sender: TObject; pForm:TObject );
    // centraliza um modal via JS
    function  rc_OnResize( pFormName : string ; pCenter : boolean = true ) : string;
    // abre um LINK
    procedure rc_OpenLink( pLink : string; pTarget : string = '_blank' );
    procedure rc_SetFocus( pObj : TObject );
    function  rc_ObjectExists( pName: string): boolean;
    // experimental
    function  rc_GetURLContent(pURL: string): string;
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
    function rc_ExtractFieldNameFromSearchItem( pItem : string; pAlias : boolean = false ) : string;
    // v. 3.0.0.0
    procedure rc_BitmapClear( pImgObj : TUniImage ); // windows and linux
    procedure rc_ProtectForm( sender : TObject );
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
    // v. 4.1.0.1
    procedure rc_ShowHideObject( pSender : TObject; pObj : TObject; pLeft, pTop : integer; pAnimType : Integer; pGetParent : boolean = false; pShowHide : Boolean = True; pCenter : Boolean = False; pTopDown : Boolean = true );//; pModal : Boolean = false );
  end;

function dm_rc: tdm_rc;

implementation

{$R *.dfm}

uses
  UniGUIVars, uniGUIMainModule, ServerModule,
  mkm_func_web,  str_func,
  Main, untFrmInputBox, untFrmMessage,
  mkm_layout, mkm_gridblock, mkm_login; // 3.2.0.0

function dm_rc: tdm_rc;
begin
  Result := tdm_rc(mm.GetModuleInstance(tdm_rc));
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
// v. 3.2.0.3
function tdm_rc.rc_CloseTab( pForm : TObject; pPgCtrlName, pTabName: string): boolean;
var
   pFrame, pFrame2 : TObject;
   FClassName      : string;
   //pQryMaster      : TFDQuery;
   pDsMaster       : TDataSource;
   bAbort          : boolean;
begin
     if TComponent( pForm ) <> nil then
       If TuniTabSheet( TComponent( pForm ).FindComponent( pTabName ) ) <> nil then
       begin
          FClassName := Copy( TuniTabSheet( TComponent( pForm ).FindComponent( pTabName ) ).Name, 5, 100 );
          pFrame     := rc_FindControl( FClassName );

          if pFrame <> nil then
          begin
             //pQryMaster := TFDQuery( TComponent( pFrame ).FindComponent( 'sqlMaster' ) );

             bAbort  := false;
//             if pQryMaster <> nil then
//             begin
//                // no modelo de menu de relatorio..uso a tabela temporaria: tb_reports
//                // ela fica em edição enquanto estamos usando o menu de impressão
//                if Pos( 'tb_reports', pQryMaster.SQL.Text ) = 0 then
//                   if ( pQryMaster.State in [dsInsert, dsEdit ] ) then
//                   begin
//                        dm_rc.rc_ShowSweetAlertSimple( mm.MSG_BUGERROR_REGISTER_IN_USE );
//                        bAbort := true;
//                   end;
//             end;

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
           // v. 4.0.0.1
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
// v. 3.3.0.1
procedure tdm_rc.rc_ConsoleLog(pText: string);
begin
     UniSession.AddJS( 'console.log("'+ pText +'")' );
end;

procedure tdm_rc.DataModuleCreate(Sender: TObject);
begin
     // v. 3.2.0.0
     rc_GetDefaultUserInfo;
     rc_GetDefaultBrowserInfo;
     rc_GetDefaultPaths( true, mm.varC_Doc_Customer );
     uniFileUp.TargetFolder := sm.StartPath + 'uploads';
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

procedure tdm_rc.rc_ErrorLog(E: Exception);
begin
  mm.varC_LastErrorMsg := E.ClassName + ': ' + E.Message;

  // para checar algo no errado na excucao dentro do servidor
  UniSession.Log( ' ');
  UniSession.Log( '>>>[EXCEPTION] ' + mm.varC_LastErrorMsg );
  UniSession.Log( ' ');
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
                 if UniApplication.FindComponent('MainForm' ) <> nil then MainForm.HideMask; // v. 3.0.0.0
                 rc_ShowSweetAlert( 'bsrgp( rc_GetValueFromRgp )', 'Invalid / nonexistent item', 'error' ); // v. 3.0.0.0
                 Abort;
            end;
     End;
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
// v. 3.2.0.7
procedure tdm_rc.DynamicCollapse( Sender: TObject );
begin
     rc_Collapse( Sender, TComponent( Sender ).Owner, TUniControl( sender ) );
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
      rc_ShowSweetAlertError( pMessage )
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
// v. 4.1.0.1
procedure tdm_rc.rc_ShowHideObject(pSender : TObject;pObj: TObject; pLeft, pTop : integer; pAnimType: Integer; pGetParent : boolean ; pShowHide : Boolean ; pCenter : Boolean ; pTopDown : Boolean );//; pModal : Boolean );
var
   oBlock : TUniContainer;
begin
    if pShowHide then// TUniControl( pObj ).Tag = 0 then
    begin
         TUniControl( pObj ).Visible := True;
         TUniControl( pObj ).Tag     := 1;

         if pGetParent then
            TUniControl( pObj ).Parent := TUniControl( psender ).Parent;

//         if pModal then
//         begin
//            oBlock := rc_CreateContainer( TUniControl( pObj ).OwnerForm , TUniControl( pObj ).OwnerForm, 'paShowObjBg' , 0, 4, 0, 0, '' );
//            oBlock.Left := 0;
//            oBlock.Top  := 0;
//            oBlock.Align := alClient;
//            oBlock.Color := clGray;
//            TUniControl( pObj ).Parent := oBlock;
//         end;

         if not pCenter then
         begin
            TUniControl( pObj ).top  := TUniControl( psender ).Height + pTop * (-1);
            TUniControl( pObj ).Left := pLeft ;
         end
         else
         begin
            //TUniControl( pObj ).top  := pTop * ( -1 );
            TUniControl( pObj ).Left := ( ( mm.varI_ScreenWidth div 2 ) - ( TUniControl( pObj ).Width div 2 ) ) ;
            if pTopDown then
               TUniControl( pObj ).Top  := TUniControl( pObj ).Height *(-1)
            else
               TUniControl( pObj ).Top  := ( mm.varI_ScreenHeight div 2 ) - ( TUniControl( pObj ).Height div 2 ) * (-1);
         end;

         if not pCenter then
            UniSession.AddJS( TUniControl( pObj ).JSName +
                            '.animate({ duration: ' + inttostr( 400 ) +
                            ', to: { y:' + inttostr( TUniControl( psender ).Top + TUniControl( psender ).Height + 6  ) +            // vertical
                            ', opacity: ' + inttostr( 1  ) + ' } } );')
         else
            UniSession.AddJS( TUniControl( pObj ).JSName +
                            '.animate({ duration: ' + inttostr( 400 ) +
                            ', to: { y:' + inttostr( ( ( mm.varI_ScreenHeight div 2 ) - ( TUniControl( pObj ).Height div 2 ) ) ) +            // vertical
                            ', opacity: ' + inttostr( 1  ) + ' } } );')
    end
    else
    begin
         TUniControl( pObj ).Tag := 0;
         if not pCenter then
            UniSession.AddJS( TUniControl( pObj ).JSName +
                            '.animate({ duration: ' + inttostr( 400 ) +
                            ', to: { y:' + inttostr( TUniControl( psender ).Top + 20 ) +            // vertical
                            ', opacity: ' + inttostr( 0  ) + ' } } );')
         else
            UniSession.AddJS( TUniControl( pObj ).JSName +
                            '.animate({ duration: ' + inttostr( 400 ) +
                            varIIF( pTopDown, ', to: { y:' + inttostr( TUniControl( pObj ).Height *(-1) ),
                                              ', to: { y:' + inttostr( ( mm.varI_ScreenHeight div 2 ) - ( TUniControl( pObj ).Height div 2 ) * (-1) ) ) +
                            ', opacity: ' + inttostr( 0  ) + ' } } );')
    end;
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
   //pText := StringReplace( pText, '''' , '' , [rfReplaceAll]); // v. 4.1.0.0
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
// v. 4.1.0.0
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
        // v. 4.1.0.0
        // Currency
        //mm.CONFIG_CURRENCY_SYMBOL      := IniFile.ReadString( 'App', 'currency', 'R$');
        //mm.CONFIG_CURRENCY_NAME        := IniFile.ReadString( 'App', 'currency', 'Real');
        //mm.CONFIG_CURRENCY_NAME_PLURAL := IniFile.ReadString( 'App', 'currency', 'Reais');

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
// v. 4.1.0.0
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
        // v. 4.1.0.0
        // Currency
        mm.CONFIG_CURRENCY_SYMBOL      := IniFile.ReadString( 'App', 'currency_symbol', '');
        mm.CONFIG_CURRENCY_NAME        := IniFile.ReadString( 'App', 'currency_name', '');
        mm.CONFIG_CURRENCY_NAME_PLURAL := IniFile.ReadString( 'App', 'currency_name_plural', '');

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
                       PFmtSettings.CurrencyString               := varIIF( mm.CONFIG_CURRENCY_SYMBOL = '', 'R$', mm.CONFIG_CURRENCY_SYMBOL ); // v. 4.1.0.0
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
                    PFmtSettings.CurrencyString            := varIIF( mm.CONFIG_CURRENCY_SYMBOL = '', 'US$', mm.CONFIG_CURRENCY_SYMBOL ); // v. 4.1.0.0
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
                    PFmtSettings.CurrencyString               := varIIF( mm.CONFIG_CURRENCY_SYMBOL = '', '£', mm.CONFIG_CURRENCY_SYMBOL ); // v. 4.1.0.0
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
                    PFmtSettings.CurrencyString            := varIIF( mm.CONFIG_CURRENCY_SYMBOL = '', '£', mm.CONFIG_CURRENCY_SYMBOL ); // v. 4.1.0.0
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
                    PFmtSettings.CurrencyString            := varIIF( mm.CONFIG_CURRENCY_SYMBOL = '', '£', mm.CONFIG_CURRENCY_SYMBOL ); // v. 4.1.0.0;
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
                     PFmtSettings.CurrencyString            := varIIF( mm.CONFIG_CURRENCY_SYMBOL = '', '£', mm.CONFIG_CURRENCY_SYMBOL ); // v. 4.1.0.0
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
                     PFmtSettings.CurrencyString            := varIIF( mm.CONFIG_CURRENCY_SYMBOL = '', '£', mm.CONFIG_CURRENCY_SYMBOL ); // v. 4.1.0.0
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
                     PFmtSettings.CurrencyString            := varIIF( mm.CONFIG_CURRENCY_SYMBOL = '', 'TRY', mm.CONFIG_CURRENCY_SYMBOL ); // v. 4.1.0.0
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
                     PFmtSettings.CurrencyString            := varIIF( mm.CONFIG_CURRENCY_SYMBOL = '', 'RUB', mm.CONFIG_CURRENCY_SYMBOL ); // v. 4.1.0.0;
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
                    PFmtSettings.CurrencyString            := varIIF( mm.CONFIG_CURRENCY_SYMBOL = '', '¥', mm.CONFIG_CURRENCY_SYMBOL ); // v. 4.1.0.0;
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
                    PFmtSettings.CurrencyString            := varIIF( mm.CONFIG_CURRENCY_SYMBOL = '', 'Rp', mm.CONFIG_CURRENCY_SYMBOL ); // v. 4.1.0.0;
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
                    PFmtSettings.CurrencyString            := varIIF( mm.CONFIG_CURRENCY_SYMBOL = '', 'US$', mm.CONFIG_CURRENCY_SYMBOL ); // v. 4.1.0.0;
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
                    PFmtSettings.CurrencyString            := varIIF( mm.CONFIG_CURRENCY_SYMBOL = '', 'US$', mm.CONFIG_CURRENCY_SYMBOL ); // v. 4.1.0.0;
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
                    PFmtSettings.CurrencyString            := varIIF( mm.CONFIG_CURRENCY_SYMBOL = '', 'US$', mm.CONFIG_CURRENCY_SYMBOL ); // v. 4.1.0.0;
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

procedure tdm_rc.rc_OpenLink(pLink, pTarget: string);
begin
     pLink := 'window.open(' + QuotedStr(pLink) + ', ' + QuotedStr(pTarget) + ');';

     UniSession.AddJS( pLink );
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
                     MainItem.Text := '<div class="rc-treemenu-title" style="font-size:10px; background-color: transparent !important; color:#888; text-transform:uppercase; left:-10px">' + Item + '</div>';
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

                                     if Pos( 'freeframe', lowercase( cMenuListItem ) ) > 0 then
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

                                     if Pos( 'usu', lowercase(item) ) > 0 then
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
                                        mm.varB_Yes := true;// ( dm_rc.rc_PermissionVerify( 'showMenuOption' ,
                                                            // varIIF( mm.varA_FSideMenu[ mm.varI_NumMenu ].RestrictionField = '',
                                                            //         mm.varA_FSideMenu[ mm.varI_NumMenu ].table ,
                                                            //         mm.varA_FSideMenu[ mm.varI_NumMenu ].RestrictionField ),
                                                            // PT_ACCESS ) );
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

