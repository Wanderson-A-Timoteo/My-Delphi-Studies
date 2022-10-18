﻿unit MainOLD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, System.TypInfo,
  Controls,
  // feedback: Mesut from Turkey
  {$ifdef LINUX}
  System.UIConsts,
  {$endif}
  Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIBaseClasses, uniPanel,
  uniGUIFrame, uniGUIJSUtils , StrUtils, IniFiles, uconsts,   str_func,
  //uconsts_msgs_portuguese, // v. 3.0.0.0
  uniHTMLFrame, uniTreeView, uniTreeMenu,
  Vcl.Dialogs,
  //----------[[RESTDATAWARE
//  uDWConstsData,
//  uRESTDWPoolerDB,
  //----------RESTDATAWARE]]
  IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  IdFTP, uniMultiItem, uniListBox, uniImageList, uniImage, Vcl.Imaging.pngimage,
  uniLabel, uniComboBox, uniEdit, uniPageControl, uniChart, uniScrollBox,
  uniButton, uniThreadTimer, uniURLFrame, uniBitBtn, uniBasicGrid,
  uniDBGrid, uniCanvas, uniMemo;                           // v. 3.0.0.0
  //ACBrMail, ACBrConsultaCNPJ, ACBrSocket,                // v. 3.0.0.0
  //ACBrCEP, ACBrBase, ACBrPosPrinter, uniCalendarPanel  ; // v. 3.0.0.0

type
  TMainForm = class(TUniForm)
    sboxMain: TUniScrollBox;
    paBackGround: TUniContainerPanel;
    pgGeneral: TUniPageControl;
    tabDashBoard: TUniTabSheet;
    paGeral: TUniContainerPanel;
    sboxGridBlock: TUniScrollBox;
    paLayoutTopo: TUniContainerPanel;
    btnMenu: TUniLabel;
    labbtnExit: TUniLabel;
    btnCfg: TUniLabel;
    labCompanyName: TUniLabel;
    paBS_Tabs: TUniContainerPanel;
    bsTabs_Main: TUniLabel;
    paLayoutMainMenu: TUniContainerPanel;
    paLayoutMenuCfgVersion: TUniContainerPanel;
    paLayoutLogo: TUniContainerPanel;
    imgAppIcon: TUniImage;
    labAppName: TUniLabel;
    paLayoutBottom: TUniContainerPanel;
    labAppVersion: TUniLabel;
    labFullScr: TUniLabel;
    labFullScrExit: TUniLabel;
    paSearchTop: TUniContainerPanel;
    btnSearch: TUniLabel;
    paSearchEdit: TUniContainerPanel;
    SearchEdit: TUniEdit;
    paLayoutBgUser: TUniPanel;
    labUser: TUniLabel;
    paImgUser: TUniContainerPanel;
    imgUser: TUniLabel;
    UniTreeMainMenu: TUniTreeMenu;
    OpenImageDialog: TOpenDialog;
    btnFloatingFAB: TUniHTMLFrame;
    htmlFrame: TUniHTMLFrame;
    procedure UniFormCreate(Sender: TObject);
    procedure UniTreeMainMenuClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure TabSheetClose(Sender: TObject; var AllowClose: Boolean);
    procedure labbtnExitClick(Sender: TObject);
    procedure paLayoutMainMenuResize(Sender: TUniControl; OldWidth,
      OldHeight: Integer);
    procedure htmlFrameAjaxEvent(Sender: TComponent; EventName: string;
      Params: TUniStrings);
    procedure btnGMapsClick(Sender: TObject);
    procedure btnMenuClick(Sender: TObject);
    procedure SearchEditChange(Sender: TObject);
    procedure SearchEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCfgClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure SearchEditExit(Sender: TObject);
    procedure pgGeneralChangeValue(Sender: TObject);
    procedure UniFormScreenResize(Sender: TObject; AWidth, AHeight: Integer);
    procedure labFullScrClick(Sender: TObject);
    procedure UniFormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure UniFormReady(Sender: TObject);
    procedure labAppVersionClick(Sender: TObject);
    procedure UniFormAfterShow(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
  // v. 3.3.0.1
  private
    { Private declarations }
    cLatitude, cLongitude : string;
    PSString : string;
    procedure rc_SearchTree(const AText: string);
  public
    { Public declarations }
    procedure rc_TrimAppMemorySize;

    // se for a partir do CLICK do MENU PRINCIPAL, apenas o parametro "pMenu" deve ser passado,
    // v. 3.3.0.1
    procedure rc_AddFormFrameInTab( pMenu           : TUniTreeMenu ;
                                    pFormFrameTitle : string = '';
                                    pTableName      : string = '';
                                    pFormFrameName  : string = '';
                                    pIsMenuReport   : Boolean = false;
                                    pIsModal        : Boolean = false;
                                    pCallFormOp     : TRCAddFormParamType = aftNone;
                                    pRecord         : integer = 0 ;
                                    pParent         : TComponent = nil );

    procedure rc_GetGeoPosition;
    procedure rc_GetMyIP;

    procedure rc_UpdateCharts;
    procedure rc_UpdateNotifications;
    procedure rc_UpdateFloatButton;
    // v. 3.2.0.0
    procedure rc_UpdateMainControls;
  end;

function MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication,
  uMenu_BASICS, uMenu_TOOLS, uMenu_MOVEMENT, uMenu_OTHERS, uMenu_REPORTS,
  mkm_menus, untdm_rc,
  ServerModule, uVersion, mkm_func_web, //untFrmMensagemTour, // v. 3.0.0.0
  untFrmTHEMES,  mkm_graphs,
  mkm_gridblock, mkm_layout, mkm_anim, mkm_translate;

function MainForm: TMainForm;
begin
  Result := TMainForm(mm.GetFormInstance(TMainForm));
end;

procedure TMainForm.SearchEditChange(Sender: TObject);
begin
     if Trim( SearchEdit.Text ) = '' then
     begin
          dm_rc.rc_BuildMainMenu( SearchEdit.Text, UniTreeMainMenu );
     end;
end;

procedure TMainForm.btnSearchClick(Sender: TObject);
begin
    paSearchEdit.tag := btnSearch.Left;

    rc_jQueryAnimate( paSearchEdit, 'width' , '95%', '200' );
    rc_Anim( btnSearch, 'left', '-200', '0.8', gsEaseBack, '0.8', gsEaseTypeOut );

    dm_rc.rc_SetFocus( SearchEdit );
end;

procedure TMainForm.SearchEditExit(Sender: TObject);
begin
     rc_jQueryAnimate( paSearchEdit, 'width' , '', '250' );
     rc_Anim( btnSearch, 'left', inttostr( paSearchEdit.tag ), '0.8', gsEaseBack, '0.8', gsEaseTypeOut );

     UniTreeMainMenu.SingleExpand := True;
end;

procedure TMainForm.SearchEditKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if key = 13 then
     begin
          // para versoes antigas do uniGUI, comente a linha abaixo
          // caso sua pesquisa esteja duplicando os itens
          UniTreeMainMenu.SingleExpand := False;

          dm_rc.rc_BuildMainMenu( SearchEdit.Text, UniTreeMainMenu );
     end;
end;
// v. 3.0.0.0
procedure TMainForm.labAppVersionClick(Sender: TObject);
begin
     rc_RemoveCssClass( labAppVersion, 'rc-pulse' );
end;
// v. 3.0.0.0
procedure TMainForm.labbtnExitClick(Sender: TObject);
begin
    Close;
    UniApplication.Restart;
end;

procedure TMainForm.labFullScrClick(Sender: TObject);
begin
     Self.Tag := varIIF( Self.Tag = 0, 1, 0 );

     if Self.Tag = 1 then
     begin
          labFullScr.Visible := false;
          labFullScrExit.Left := labFullScr.Left;
          labFullScrExit.Visible := true;
     end
     else
     begin
          labFullScrExit.Visible := false;
          labFullScr.Visible := true;
     end;
end;

procedure TMainForm.rc_SearchTree(const AText: string);
var
  S, SString : string;
  I : Integer;
  aExpand : Boolean;
begin
  SString := Trim(AText);

  if SString<>PSString then
  begin
    PSString := LowerCase(SString);

    if (Length(PSString) > 1) or (PSString = '') then
    begin
      aExpand := PSString<>'';
      UniTreeMainMenu.BeginUpdate;

      try
        UniTreeMainMenu.ResetData;

        for I := 0 to UniTreeMainMenu.Items.Count - 1 do
        begin
          S := LowerCase( UniTreeMainMenu.Items[I].Text);

          UniTreeMainMenu.Items[I].Visible := (Length(PSString) = 0) or (Pos(PSString, S)>0);
          UniTreeMainMenu.Items[I].Expanded := aExpand;
        end;
      finally
        UniTreeMainMenu.EndUpdate;
      end;
    end;
  end;
end;

procedure TMainForm.btnGMapsClick(Sender: TObject);
var
   pLink : String;
begin
     //https://maps.google.com/?q=-3.7626815568369025,-38.54677452224053
     pLink := 'window.open(''https://maps.google.com/?q=%s,%s'', ''_blank'');';
     pLink := format( pLink, [ cLatitude , cLongitude ] );

     UniSession.AddJS( pLink );
end;
// v. 3.3.2.0
procedure TMainForm.UniFormBeforeShow(Sender: TObject);
begin
     rc_RenderLayout( Self, true, true, true );
end;
// v. 3.3.2.0
procedure TMainForm.UniFormAfterShow(Sender: TObject);
begin
     sboxGridBlock.ScrollTo(0,0);
end;
// v. 3.0.0.0
procedure TMainForm.UniFormCreate(Sender: TObject);
begin
  //inherited; // v. 3.3.0.1
  // v. 3.2.0.4
  // Descomente as linhas abaixo para gerar o arquivo de informações dos blocos do formulário/frame informado( self )
  // Uncomment the lines below to generate the block information file of the informed form/frame ( self )
  //if DebugHook <> 0 then
  //   rc_GenerateRuntimeDebugBlocksFile( Self );

  RTL:= mm.RTL; // v. 3.1.0.63
  {$IFDEF RELEASE}
  dm_rc.rc_ProtectForm( Self );
  {$ENDIF}
  // pgGeneral controls Frames/Forms Opened in Tabs
  mm.oPgGeneral := TUnipagecontrol( FindComponent( 'pgGeneral' ) );
  // v. 3.2.0.4
  if FindComponent( 'paBS_Tabs' ) <> nil then
     if FindComponent( 'paBS_Tabs' ) <> nil then
        TUniControl( FindComponent( 'paBS_Tabs' ) ).Visible := ( mm.CONFIG_LAYOUT_TAB_OFF = 'OFF' ) ;
  // Controls the border focus
  mm.varC_JSNAME_HTMLFRAME := htmlFrame.JSName;
  // v. 3.3.2.0
  // screenwidth está disponivel apenas no screenresize mas precismos tratar mm.varB_MobileScreen no dm_rc.rc_GetDeviceType( STARTER / MINIMAL )...
  // screenwidth is only available in screenresize but we need to handle mm.varB_MobileScreen in dm_rc.rc_GetDeviceType( STARTER / MINIMAL )...
  mm.varI_ScreenWidth := UniApplication.ScreenWidth;
  mm.varI_ScreenHeight := UniApplication.ScreenHeight;
  if mm.varI_ScreenWidth = 0 then
     mm.varI_ScreenWidth := Self.Width;
  if mm.varI_ScreenHeight = 0 then
     mm.varI_ScreenHeight := Self.Height;
  dm_rc.rc_GetDeviceType;

  labAppName.Caption     := APP_NAME;
  labAppVersion.Caption  := 'v.' + FileVersion + ' [ ' + mm.CONFIG_APP_TYPE + ' ]';
  labUser.Caption        := mm.vUserName ;
  labCompanyName.Caption := mm.varC_CompanyName;
  // v. 3.2.0.0
  //labCompanyName.JSInterface.JSCall('addCls', ['align-label-left-center']);
  if mm.RTL then
     labCompanyName.JSInterface.JSCall('addCls', ['align-label-right-center'])
  else
     labCompanyName.JSInterface.JSCall('addCls', ['align-label-left-center']);

  rc_AddCssClass( labAppVersion, 'rc-pulse' );

  Self.Script.Text :=
      'Ext.QuickTips.init();' +
      'function launchIntoFullscreen(element) {' +
      '    if (element.requestFullscreen) {' +
      '        element.requestFullscreen();' +
      '    } else if (element.mozRequestFullScreen) {' +
      '        element.mozRequestFullScreen();' +
      '    } else if (element.webkitRequestFullscreen) {' +
      '        element.webkitRequestFullscreen();' +
      '    } else if (element.msRequestFullscreen) {' +
      '        element.msRequestFullscreen();' +
      '    }' +
      (*<prj-orientation*)'    screen.orientation.lock("portrait");' + // v. 3.2.0.0
      '}' +
      'function exitFullscreen() {' +
      '    if (document.exitFullscreen) {' +
      '        document.exitFullscreen();' +
      '    } else if (document.mozCancelFullScreen) {' +
      '        document.mozCancelFullScreen();' +
      '    } else if (document.webkitExitFullscreen) {' +
      '        document.webkitExitFullscreen();' +
      '    }' +
      '}' ;

     // controlar o fluxo de abas pra nao estourar os linmites da tela
     mm.varI_TabIni := 0;
     mm.varI_TabEnd := 1;

     UniTreeMainMenu.JSInterface.JSCall( 'addCls' , ['treemenufullwidth']);

     btnFloatingFAB.JSInterface.JSCall( 'addCls' , ['bringtofront']);

     if mm.CONFIG_LAYOUT_USER_BG = 'ON' then
     begin
       paLayoutBgUser.Margins.Top := 0;
     end
     else
     begin
       paLayoutBgUser.Background.Picture.Bitmap := nil;
       paLayoutBgUser.Margins.Top := 20;
     end;

     //rc_RenderLayout( Self ); // v. 3.3.2.0

     // v. 3.2.0.0
     //bsTabs_Main.JSInterface.JSCall('addCls', ['align-label-left-center']);
     if mm.RTL then
        bsTabs_Main.JSInterface.JSCall('addCls', ['align-label-right-center'])
     else
        bsTabs_Main.JSInterface.JSCall('addCls', ['align-label-left-center']);

     // geolocalization
     try
        // descomente a linha pra capturar posicao gps
        // rc_GetGeoPosition;
     except
     end;

     // o componente img padrao não consegui deixa-lo arredondado( algum conflito com CSS, talvez )
     // então usei uma forma alternativa com html
     try
        //carregar imagens
        imgAppIcon.Picture.LoadFromFile( sm.FilesFolderPath +  'images' + BACKSLASH + 'icon_mainmenu.png' );
        imgUSer.Caption := '<img id="userimg" class="avatar img-thumbnail" src="uploads/usuarios/' + ExtractFileName( mm.varC_User_Avatar ) + '" alt="User Img">';
     except

     end;

     labUser.JSInterface.JSCall( 'addCls' , ['shadow-text']);
     labAppName.JSInterface.JSCall( 'addCls' , ['shadow-text']);
     // remove BOLD
     labAppName.JSInterface.JSCall( 'addCls' , ['rc-font-light']);

     // Variaveis de controle do menu lateral - PODEM MUDAR SE A ATUACAO FOR ALTERADA em TEMPO DE EXECUCAO
     // DECLARAR VARIAVEIS DOS MENU BASICOS, MOVIMENTO, RELATORIOS e FERRAMENTAS
     //------------------------------------------------------------------------------------------------------------------------------
     // para zerar o ARRAY de itens de menu a cada exibição do menu lateral
     SetLength( mm.varA_FSideMenu , 200 );

     mm.varA_FSideMenu[ 0 ].option     := '';
     mm.varA_FSideMenu[ 0 ].table      := '';
     mm.varA_FSideMenu[ 0 ].image      := '';
     mm.varA_FSideMenu[ 0 ].permission := '';
     mm.varA_FSideMenu[ 0 ].Hidden     := false;
     mm.varA_FSideMenu[ 0 ].AskNew     := false;
     mm.varA_FSideMenu[ 0 ].GenID      := false;
     // v. 3.2.0.0
     rc_Translate( Self, nil , '' , mm.CONFIG_LANGUAGE );
     rc_ConfigTranslateMessages;
     mm.varI_NumMenu    := 1;
     try
        dm_rc.rc_BuildMainMenu( '', UniTreeMainMenu );
     except
        dm_rc.rc_ShowError( 'Failed to create menus' );
     end;
     dm_rc.rc_ShowToaster( 'info', mm.MSG_WELCOME + mm.vUserName + ' !', false, 'pinItUp' );

     Color                 := StringToColor( mm.CONFIG_LAYOUT_BG_COLOR ); // v. 3.2.0.6 //Self.Color            := StringToColor( mm.CONFIG_LAYOUT_BG_COLOR );
     paBS_Tabs.Color       := Self.Color ;
     sboxGridBlock.Color   := Self.Color ;
     paLayoutLogo.Color    := StringToColor( mm.CONFIG_LAYOUT_MENU_LOGO_BG_COLOR );
     labAppName.font.Color := StringToColor( mm.CONFIG_LAYOUT_MENU_LOGO_FONT_COLOR );

     rc_UpdateNotifications;
     rc_UpdateFloatButton;
end;

// Este recurso está em análise.
// Quando o FOCO está em algum campo, não responde mais o KEYDOWN
procedure TMainForm.UniFormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
//var
//   fClassName : string;
//   pFrame     : TObject;
//   pBtn       : TUniButton;
begin

//  if ( ssCtrl in Shift ) and ( ssShift in Shift ) then
//  begin
//     fClassName := pgGeneral.ActivePage.Name;
//
//     pFrame     := rc_FindControl( Copy( FClassName, 5, 100 ) );
//
//     if pFrame <> nil then
//     begin
//        case Key of
//          VK_F1 : begin
//                       //pBtn := TUniButton( TComponent(pFrame).FindComponent( 'btnNewReg' ) );
//                       //if pBtn <> nil then
//                       //   pBtn.Click;
//                  end;
//          VK_F2 : begin
//                       pBtn := TUniButton( TComponent(pFrame).FindComponent( 'btnNewReg' ) );
//                       if pBtn <> nil then
//                          pBtn.Click;
//                  end;
//          VK_F3 : begin
//                       pBtn := TUniButton( TComponent(pFrame).FindComponent( 'btnEditReg' ) );
//                       if pBtn <> nil then
//                          pBtn.Click;
//                  end;
//          VK_F4 : begin
//                       pBtn := TUniButton( TComponent(pFrame).FindComponent( 'btnDeleteReg' ) );
//                       if pBtn <> nil then
//                          pBtn.Click;
//                  end;
//          VK_F5 : begin
//                       pBtn := TUniButton( TComponent(pFrame).FindComponent( 'btnSaveReg' ) );
//                       if pBtn <> nil then
//                          pBtn.Click;
//                  end;
//          VK_F6 : begin
//                       pBtn := TUniButton( TComponent(pFrame).FindComponent( 'btnCancelReg' ) );
//                       if pBtn <> nil then
//                          pBtn.Click;
//                  end;
//        end;
//     end;
//  end;

end;
// v. 3.3.2.0
procedure TMainForm.UniFormReady(Sender: TObject);
begin
  //rc_RenderLayout( Self );
end;
// v. 3.4.0.0
procedure TMainForm.UniFormScreenResize(Sender: TObject; AWidth, AHeight: Integer);
var
   pMainMenu ,
   oObj : TUniControl;
   oFrameFormInParent : TObject; // v. 3.4.0.0
   cFrameFormInParent : string; // v. 3.4.0.0
begin
     oObj := nil;
     try
        //if dm_rc.rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;

        mm.varI_ScreenWidth  := AWidth;
        mm.varI_ScreenHeight := AHeight;
        pMainMenu := TUniControl( dm_rc.rc_ScreenUpdate( true ) );

        // expande a altura além do espaço físico quando dispositivo estiver deitado
        if ( mm.varB_Mobile_Screen_Landscape ) and ( mm.varI_ScreenHeight < 480 )  then
           Self.Height := 480
        else
          Self.Height := mm.varI_ScreenHeight;
        // v. 3.3.3.0
        if mm.varB_Mobile_Screen_Landscape then
           Self.Width  := mm.varI_ScreenWidth - 5
        else
           Self.Width  := mm.varI_ScreenWidth;
        Self.Left   := ( mm.varI_ScreenWidth div 2 ) - (  Self.Width div 2 );
        Self.Top    := ( mm.varI_ScreenHeight div 2 ) - (  Self.Height div 2 );
        // v. 3.2.0.0
        rc_UpdateMainControls;

        if mm.oPgGeneral <> nil then
        begin
            oObj := rc_FindControl( dm_rc.rc_GetActiveFormFrameNameInMainTab );// v. 3.3.3.0 //oObj := rc_FindControl( Copy( mm.oPgGeneral.ActivePage.Name, 5, 100 ) ); // TFRMCAD

            rc_AdjustFormsSize( pMainMenu ) ;
            dm_rc.rc_ResizeBlocks( oObj );

//            if ( mm.varC_Form_Detail = nil ) and ( mm.varC_Form_Modal = nil ) then
//               dm_rc.rc_DBGridUpdateAll( oObj )
//            else
//            if ( mm.varC_Form_Modal = nil ) then
//               dm_rc.rc_DBGridUpdateAll( mm.varC_Form_Detail )
//            else
//            if rc_FindControl( mm.varC_Form_Modal.Name ) <> nil then
//               dm_rc.rc_DBGridUpdateAll( mm.varC_Form_Modal );
        end
        else
        begin
            rc_AdjustFormsSize( pMainMenu ) ;
            dm_rc.rc_ResizeBlocks( Self );

//            if ( mm.varC_Form_Detail = nil ) and ( mm.varC_Form_Modal = nil ) then
//               dm_rc.rc_DBGridUpdateAll( oObj )
//            else
//            if ( mm.varC_Form_Modal = nil ) then
//               dm_rc.rc_DBGridUpdateAll( mm.varC_Form_Detail )
//            else
//            if rc_FindControl( mm.varC_Form_Modal.Name ) <> nil then
//               dm_rc.rc_DBGridUpdateAll( mm.varC_Form_Modal );
        end;
        // v. 3.4.0.0
        // [PT] existe form/frame adicionado em um objeto ?
        // [EN] is there a form/frame added to an object?
        cFrameFormInParent := mm.varC_FormsInParent;
        while Length( trim(cFrameFormInParent) ) > 0 do
        begin
           cFrameFormInParent := Copy( cFrameFormInParent, 2 ) + ' ';
           cFrameFormInParent := Copy( cFrameFormInParent, 1, Pos( ' ', cFrameFormInParent )-1 );
           oObj := rc_FindControl( cFrameFormInParent );
           if oObj <> nil then
           begin
              dm_rc.rc_ResizeBlocks( oObj );
//              if ( mm.varC_Form_Detail = nil ) and ( mm.varC_Form_Modal = nil ) then
//                 dm_rc.rc_DBGridUpdateAll( oObj )
//              else
//              if ( mm.varC_Form_Modal = nil ) then
//                 dm_rc.rc_DBGridUpdateAll( mm.varC_Form_Detail )
//              else
//              if rc_FindControl( mm.varC_Form_Modal.Name ) <> nil then
//                 dm_rc.rc_DBGridUpdateAll( mm.varC_Form_Modal );
           end;
           cFrameFormInParent := mm.varC_FormsInParent;
           cFrameFormInParent := StringReplace( cFrameFormInParent, ';' + oObj.Name, '', [rfReplaceAll] ) ;
        end;

        rc_UpdateCharts;
     except on e:exception do
            begin
                 dm_rc.rc_ShowError( 'ScreenResize ' + sLineBreak + sLineBreak + e.Message );
            end;
     end;
end;
// v. 3.2.0.0
procedure TMainForm.UniFormShow(Sender: TObject);
begin
     mm.varDW_LastTick := GetTickCount;
     // comente / descomente para ativar / desativar o GUIDE TOUR
     // comment / uncomment to activate / deactivate the GUIDE TOUR
     //dm_rc.rc_ShowTour( Self );
     mm.varI_GuideTourSeq := 0;
end;
// v. 3.3.2.0
procedure TMainForm.btnCfgClick(Sender: TObject);
begin
     dm_rc.rc_ShowInputBox( 'Admin Access', 'Admin Password', '', '', '', true );
     if dm_rc.rc_GetMD5( mm.varC_InputBox_Result1 ) = USER_ADMIN_PASS then
     begin
       //rc_AddCssClass( frmThemes, 'form-noborder' ); // v. 3.3.2.0
       frmThemes.Show( procedure(Sender: TComponent; Result:Integer)
                              begin
                                //callback....nesse caso, não é necessário tratar o retorno
                              end
                            );
     end
     else
       dm_rc.rc_ShowWarning( mm.MSG_INVALID_PASSWORD );
end;
// v. 3.4.0.0
procedure TMainForm.btnMenuClick(Sender: TObject);
var
   oObj : TUniControl;
   oFrameFormInParent : TObject; // v. 3.4.0.0
   cFrameFormInParent : string; // v. 3.4.0.0
begin
     if paLayoutMainMenu.Width > 0 then
        paLayoutMainMenu.Width := 0
     else
        paLayoutMainMenu.Width := 260;
     //clicou no MENU
     paLayoutMainMenu.tag := 1;
     // v. 3.2.0.0
     rc_UpdateMainControls;

     rc_AdjustFormsSize( paLayoutMainMenu );

     sboxMain.DoAlignControls; // Feedback from Farshad

     if mm.oPgGeneral <> nil then
        dm_rc.rc_ResizeBlocks( rc_FindControl( dm_rc.rc_GetActiveFormFrameNameInMainTab ) );// v. 3.3.3.0 //   Copy( mm.oPgGeneral.ActivePage.Name , 5, 100 ) ) );
     // v. 3.4.0.0
     // [PT] existe form/frame adicionado em um objeto ?
     // [EN] is there a form/frame added to an object?
     cFrameFormInParent := mm.varC_FormsInParent;
     while Length( trim(cFrameFormInParent) ) > 0 do
     begin
        cFrameFormInParent := Copy( cFrameFormInParent, 2 ) + ' ';
        cFrameFormInParent := Copy( cFrameFormInParent, 1, Pos( ' ', cFrameFormInParent )-1 );
        oObj := rc_FindControl( cFrameFormInParent );
        if oObj <> nil then
        begin
           dm_rc.rc_ResizeBlocks( oObj );
//           if ( mm.varC_Form_Detail = nil ) and ( mm.varC_Form_Modal = nil ) then
//              dm_rc.rc_DBGridUpdateAll( oObj )
//           else
//           if ( mm.varC_Form_Modal = nil ) then
//              dm_rc.rc_DBGridUpdateAll( mm.varC_Form_Detail )
//           else
//           if rc_FindControl( mm.varC_Form_Modal.Name ) <> nil then
//              dm_rc.rc_DBGridUpdateAll( mm.varC_Form_Modal );
        end;
        cFrameFormInParent := mm.varC_FormsInParent;
        cFrameFormInParent := StringReplace( cFrameFormInParent, ';' + oObj.Name, '', [rfReplaceAll] ) ;
     end;

     rc_UpdateCharts;
end;

procedure TMainForm.rc_GetMyIP;
Begin
  //Reference: https://www.ipify.org/
  UniSession.AddJS(
    '$(function() {'+
    '  $.getJSON("https://api.ipify.org?format=jsonp&callback=?",'+
    '    function(json) {'+
    '      ajaxRequest(' + self.WebForm.JSName + ', "ClientIPAddr", ["ip="+json.ip]);'+
    '    }'+
    '  );'+
    '});'
    );
End;
// v. 3.2.0.3
procedure TMainForm.htmlFrameAjaxEvent(Sender: TComponent; EventName: string;  Params: TUniStrings);
var
   //pQryMaster : TFDQuery;
   pDsMaster  : TDataSource;

   FrC : TUniFrameClass;
   Fr  : TUniFrame;

   fClass : TClass;

   FrmC : TUniFormClass;
   Frm  : TUniForm;

   pFrame, pFrame2 : TObject;

   pLabel : TUniLabel;

   pVariacaoCep, cTemp, cTemp2, cTemp3, cDataSource, cQuery,
   FClassName, Path: string;

   oHfRequired : TUniHTMLFrame; // v. 3.4.0.0
   oLabel      : TUniLabel; // v. 3.4.0.0
   pObj : TUniControl;
   oSBox : TUniScrollBox; // v. 3.3.3.2
   oScrollBlock : TObject; // v. 3.5.0.0
   // v. 3.1.0.61
   bAbort       : boolean;
   pPageControl : TUniPageControl;

   paObj1, paObj2, paObj3,
   paTourTransp,
   paObjFeatured : TUniContainerPanel;

   pForm : TUniForm;

   w, h,
   i , f: integer;
begin
//   if dm_rc.rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;

   //pQryMaster  := nil;
   pDsMaster   := nil;
   cDataSource := '';
   cQuery      := '';
   // v. 3.3.1.0
   if (EventName = '_CopyToClipBoard') then
   begin
       mm.varC_TempString := Params.Values['content'];
       // based on: https://qawithexperts.com/article/javascript/creating-copy-to-clipboard-using-javascript-or-jquery/364
       UniSession.AddJS( 'function copyToClipboard(text) {' +
                         'var sampleTextarea = document.createElement("textarea");'+
                         'document.body.appendChild(sampleTextarea);'+
                         'sampleTextarea.value = text;' +
                         'sampleTextarea.select();' +
                         'document.execCommand("copy");' +
                         'document.body.removeChild(sampleTextarea);' +
                         '}' +
                         'copyToClipboard(' + QuotedStr( mm.varC_TempString ) + ');' );
       dm_rc.rc_ShowToaster( 'info', 'Copied to clipboard: ' + mm.varC_TempString + ' !', false, 'pinItUp' );
   end
   else
   if (EventName = '_onFocus') then
   begin
       FClassName := Params.Values['pform'];

       pFrame := rc_FindControl( FClassName );

       if pFrame = nil then
       begin
            if mm.oPgGeneral <> nil then
            begin
              fClassName := dm_rc.rc_GetActiveFormFrameNameInMainTab;// v. 3.3.3.0 //Copy( mm.oPgGeneral.ActivePage.Name, 5, 100 );
              pFrame     := rc_FindControl( FClassName );
            end;
       end;

       if pFrame <> nil then
       begin
          pObj := rc_FindControl( Params.Values[ 'pobj' ], pFrame );// v. 3.3.1.0 // TUniControl( TComponent(pFrame).FindComponent( Params.Values[ 'pobj' ] ) ); // v. 3.3.0.1

          if pObj <> nil then
          begin
              rc_RemoveCssClass( pObj , 'inputWithIcon' + varIIF( mm.RTL, '-rtl', '' ) + ' inputIconBg' + varIIF( mm.RTL, '-rtl', '' ) );
              // v. 3.5.0.0
              If Pos( 'focus-color:off', pObj.Hint ) = 0 then
                 rc_AddCssClass( pObj , 'inputWithIconFocus' + varIIF( mm.RTL, '-rtl', '' ) + ' inputIconBg' + varIIF( mm.RTL, '-rtl', '' ) );
          end;
       end;
       // v. 3.4.0.1
       if pObj <> nil then
       begin
          if ( pos( 'valid-required:', pObj.hint ) > 0 ) then
          begin
             oHfRequired := TUniHTMLFrame( TComponent(pFrame).FindComponent('rc__Required' + pObj.Name) );
             if oHfRequired <> nil then
             begin
                  oHfRequired.Visible := False;
             end;
          end;
          // v. 3.4.0.0
          if ( pos( 'form-label:', pObj.hint ) > 0 ) then
          begin
             oLabel := TUniLabel( TComponent(pFrame).FindComponent('rc__FormLabel' + pObj.Name) );
             if ( oLabel <> nil ) then //and ( TUniEdit(pObj).Text = '' ) then
             begin
                  if ( pos( 'form-label:top-in', pObj.hint ) > 0 ) then
                     rc_jQueryAnimate( oLabel , 'top'  , IntToStr( oLabel.Top - 18 ) , '350' )
                  else
                  if ( pos( 'form-label:top', pObj.hint ) > 0 ) then
                     rc_jQueryAnimate( oLabel , 'top'  , IntToStr( oLabel.Top - 26 ) , '350' );
             end;
          end;
       end;
       // v. 3.5.0.0
       if ( mm.varB_Mobile_Screen ) and ( ( mm.varB_Android ) or ( mm.varB_Tablet ) or ( mm.varB_iOS ) ) and ( ( pFrame <> nil ) or ( lowercase( fClassName ) = 'mainform' ) ) then
       begin
           oScrollBlock := rc_GetScrollBoxForMobileKeyboard( pObj );
           if oScrollBlock <> nil then
           begin
              oSBox := TUniScrollBox( oScrollBlock );
              if oSBox <> nil then
              begin
                 oSBox.Align := alNone;
                 oSBox.Top   := 0;
                 oSBox.Left  := 0;
                 oSBox.Height := oSBox.Parent.Height - 260;
                 oSBox.Width  := oSBox.Parent.Width;
              end;
           end;
       end;
   end
   else
   if (EventName = '_onBlur') then
   begin
       FClassName := Params.Values['pform'];

       pFrame := rc_FindControl( FClassName );

       if pFrame = nil then
       begin
            if mm.oPgGeneral <> nil then
            begin
              fClassName := dm_rc.rc_GetActiveFormFrameNameInMainTab;// v. 3.3.3.0 //Copy( mm.oPgGeneral.ActivePage.Name, 5, 100 );
              pFrame     := rc_FindControl( FClassName );
            end;
       end;

       if pFrame <> nil then
       begin
          pObj := rc_FindControl( Params.Values[ 'pobj' ], pFrame );// v. 3.3.1.0 // TUniControl( TComponent(pFrame).FindComponent( Params.Values[ 'pobj' ] ) ); // v. 3.3.0.1

          if pObj <> nil then
          begin
              rc_RemoveCssClass( pObj , 'inputWithIconFocus' + varIIF( mm.RTL, '-rtl', '' ) + ' inputIconBg' + varIIF( mm.RTL, '-rtl', '' ) );
              // v. 3.5.0.0
              If Pos( 'focus-color:off', pObj.Hint ) = 0 then
                 rc_AddCssClass( pObj , 'inputWithIcon' + varIIF( mm.RTL, '-rtl', '' ) + ' inputIconBg' + varIIF( mm.RTL, '-rtl', '' ) );
          end;
       end;
       // v. 3.4.0.1
       if pObj <> nil then
       begin
          if ( pos( 'valid-required:', pObj.hint ) > 0 ) then
          begin
             oHfRequired := TUniHTMLFrame( TComponent(pFrame).FindComponent('rc__Required' + pObj.Name) );
             if ( oHfRequired <> nil ) then
             begin
                  oHfRequired.Visible := TUniEdit(pObj).Text = '' ;
             end;
          end;
          // v. 3.4.0.0
          if ( pos( 'form-label:', pObj.hint ) > 0 ) then
          begin
             oLabel := TUniLabel( TComponent(pFrame).FindComponent('rc__FormLabel' + pObj.Name) );
             if ( oLabel <> nil ) and ( TUniEdit(pObj).Text = '' ) then
             begin
                  rc_jQueryAnimate( oLabel , 'top'  , IntToStr( oLabel.Top ) , '350' );
             end;
          end;
       end;
       // v. 3.5.0.0
       if ( mm.varB_Mobile_Screen ) and ( ( mm.varB_Android ) or ( mm.varB_Tablet ) or ( mm.varB_iOS ) ) and ( ( pFrame <> nil ) or ( lowercase( fClassName ) = 'mainform' ) ) then
       begin
           oScrollBlock := rc_GetScrollBoxForMobileKeyboard( pObj );
           if oScrollBlock <> nil then
           begin
              oSBox := TUniScrollBox( oScrollBlock );
              if oSBox <> nil then
              begin
                 oSBox.Align := alClient;
              end;
           end;
       end;
   end
   else
   if EventName = '_dashboard' then
   begin
        //if Params.Values['obj'] = 'produto 1' then
           dm_rc.rc_ShowMessage( Params.Values['item'] );
   end
   else
   if EventName = '_notifications' then
   begin
        //if Params.Values['obj'] = 'produto 1' then
           dm_rc.rc_ShowMessage( Params.Values['tipo'] );
   end
   else
   if EventName = '_mainFloatButton' then
   begin
        if Params.Values['tipo'] = 'off' then
           close
        else
           dm_rc.rc_ShowMessage( Params.Values['tipo'] );
   end
   else
   if EventName = '_CloseForm' then
   begin
        if Params.Values['form'] <> '' then
        begin
             FClassName := Params.Values['form'];

             pFrame := rc_FindControl( FClassName );

             if pFrame <> nil then
             begin
                  TUniForm( pFrame ).Close;
             end;
        end;
   end
   else
   if EventName = '_getXY' then
   begin
        mm.varI_PosX := StrToIntDef( Params.Values['x'] , 0 );
        mm.varI_PosY := StrToIntDef( Params.Values['y'] , 0 );
        mm.varI_PosH := StrToIntDef( Params.Values['h'] , 0 );
        mm.varI_PosW := StrToIntDef( Params.Values['w'] , 0 );
   end
   else
   if EventName = '_SetFormLeft' then
   begin
        if Params.Values['form'] <> '' then
        begin
             FClassName := Params.Values['form'];

             pFrame := rc_FindControl( FClassName );

             if pFrame <> nil then
             begin
                  TUniForm( pFrame ).Left := StrToIntDef( Params.Values['value'], TUniForm( pFrame ).Left );
             end;
        end;
   end
   else
   // EVENTOS rc_BootStrapRender
   //
   // bsPill MAINMENU hint -> [[bsPills:light cls:btn-sm pgc:pgGeneral]]
   // v. 3.1.0.61
   if ( EventName.ToLower = 'bstabs' ) or ( EventName.ToLower = 'bscardtabs' ) or ( EventName.ToLower = 'bspills' ) then
   begin
       FClassName := Params.Values['form'];

       if ( Params.Values['tab'] = 'TabLeft' ) or ( Params.Values['tab'] = 'TabRight' ) then
       begin
              mm.varI_TabIni := mm.varI_TabIni + varIIF( Params.Values['tab'] = 'TabRight', varIIF( mm.varB_Mobile_Screen, 1, 6 ), varIIF( mm.varB_Mobile_Screen, -1, -6 ) );

              if Params.Values['tab'] = 'TabRight' then
                 if ( mm.varI_TabEnd - mm.varI_TabIni > varIIF( mm.varB_Mobile_Screen, 1, 6 ) ) then
                    mm.varI_TabIni := mm.varI_TabEnd - varIIF( mm.varB_Mobile_Screen, 1, 6 );

              if mm.varI_TabIni < 0 then
                 mm.varI_TabIni := 0;
       end;

       pFrame := rc_FindControl( FClassName );

       if pFrame <> nil then
       begin
           if lowercase( TComponent(pFrame).Name ) = 'mainform' then
           begin
              pObj := TUniPageControl( FindComponent( Params.Values['pgcontrol'] ) );

              if ( Params.Values['tab'] <> '_closeTab' ) and ( Params.Values['tab'] <> '_closeAllTabs' ) then
              begin
                 TUniPageControl( FindComponent( Params.Values['pgcontrol'] ) ).ActivePage := TuniTabSheet( FindComponent( Params.Values[lowercase(EventName)] ) );
                 fClassName := TUniPageControl( FindComponent( Params.Values['pgcontrol'] ) ).ActivePage.Name;
              end
              else
              begin
                 if ( Params.Values['tab'] = '_closeTab' ) then
                    dm_rc.rc_CloseTab( MainForm, Params.Values['pgcontrol'], Params.Values[lowercase(EventName)] )
                 else
                 if ( Params.Values['tab'] = '_closeAllTabs' ) then
                 begin
                      pPageControl := TUniPageControl( FindComponent( Params.Values['pgcontrol'] ) );

                      i := pPageControl.PageCount-1;
                      while ( i > 0 ) do
                      begin
                           if pPageControl.Pages[ i ] <> nil then
                              if pPageControl.Pages[ i ].TabVisible then
                              begin
                                   cTemp := trim( TUniTabSheet( pPageControl.Pages[ i ] ).Name );
                                   // v. 3.2.0.6
                                   if ( cTemp <> 'tabDashBoard' ) then
                                   begin
                                      // v. 3.3.3.0
                                      //if ( Pos( 'closebtn:false', TUniTabSheet( pPageControl.Pages[ i ] ).Hint ) = 0 ) then
                                         bAbort := dm_rc.rc_CloseTab( MainForm, Params.Values['pgcontrol'], cTemp );
                                      //else
                                      //   bAbort := true;
                                   end;
                              end;
                           // v. 3.3.3.0
//                           if not bAbort then
//                              i := pPageControl.PageCount-1
//                           else
//                              i := 0;
                           Dec( i );
                      end;
                 end;
              end;
           end
           else
           begin
              pObj := TUniPageControl( TComponent(pFrame).FindComponent( Params.Values['pgcontrol'] ) );

              if Params.Values['tab'] <> '_closeTab' then
              begin
                 TUniPageControl( TComponent(pFrame).FindComponent( Params.Values['pgcontrol'] ) ).ActivePage := TuniTabSheet( TComponent(pFrame).FindComponent( Params.Values[lowercase(EventName)] ) );
                 fClassName := TUniPageControl( TComponent(pFrame).FindComponent( Params.Values['pgcontrol'] ) ).ActivePage.Name;
              end
              else
              begin
                 if ( Params.Values['tab'] = '_closeTab' ) then
                    dm_rc.rc_CloseTab( pFrame, Params.Values['pgcontrol'], Params.Values[lowercase(EventName)] )
                 else
                 if ( Params.Values['tab'] = '_closeAllTabs' ) then
                 begin
                      pPageControl := TUniPageControl( FindComponent( Params.Values['pgcontrol'] ) );

                      i := pPageControl.PageCount-1;
                      while i > 0 do
                      begin
                           if pPageControl.Pages[ i ] <> nil then
                              if pPageControl.Pages[ i ].TabVisible then
                              begin
                                   cTemp := trim( TUniTabSheet( pPageControl.Pages[ i ] ).Name );
                                   // v. 3.3.3.0
                                   //if ( Pos( 'closebtn:false', TUniTabSheet( pPageControl.Pages[ i ] ).Hint ) = 0 ) then
                                      bAbort := dm_rc.rc_CloseTab( pFrame, Params.Values['pgcontrol'], cTemp );
                                   //else
                                   //   bAbort := true;
                              end;
                           // v. 3.3.3.0
//                           if not bAbort then
//                              i := pPageControl.PageCount-1
//                           else
//                              i := 0;
                           Dec( i );
                      end;
                 end;

                 //dm_rc.rc_CloseTab( pFrame, Params.Values['pgcontrol'], Params.Values[lowercase(EventName)] );
              end;
           end;
           // v. 3.2.0.7
           // update TABSHEET colors
           //if UniApplication.FindComponent('MainForm' ) <> nil then
           //   dm_rc.rc_ResizeBlocks( MainForm );
           if UniApplication.FindComponent('MainForm' ) <> nil then
              if mm.oPgGeneral <> nil then
                 if mm.oPgGeneral.ActivePageIndex = 0 then
                    dm_rc.rc_ResizeBlocks( MainForm );

           pFrame2 := rc_FindControl( Copy( FClassName, 5, 100 ) );

           if pFrame2 <> nil then
           begin
              dm_rc.rc_ResizeBlocks( pFrame2 );
           end
           else // bsPill dentro de outros forms/frames
           begin
                FClassName := Params.Values['form'];
                pFrame2 := rc_FindControl( FClassName );
                if pFrame2 <> nil then
                   dm_rc.rc_ResizeBlocks( pFrame2 );
           end;

           rc_UpdateCharts;
       end;
   end
   else
   if ( EventName = 'bsswt' ) or ( EventName = 'bschk' ) then
   begin
       EventName := Copy( EventName, 3, 3 );

       FClassName := Params.Values['form'];

       pFrame := rc_FindControl( FClassName );

       if ( pFrame <> nil ) then
       begin
           if lowercase( TComponent(pFrame).Name ) = 'mainform' then
           begin
              pObj := TUniLabel( FindComponent( Params.Values[ EventName ] ) );
              pObj.tag := varIIF( pObj.tag = 0, 1, 0 );

              cTemp := pObj.Hint;
              cTemp := rc_GetHintProperty( 'field:', cTemp );

           end
           else
           begin
              pObj := TUniLabel( TComponent(pFrame).FindComponent( Params.Values[ EventName ] ) );
              pObj.tag := varIIF( pObj.tag = 0, 1, 0 );

              cTemp := pObj.Hint;
              cTemp := rc_GetHintProperty( 'field:', cTemp , True );

              if cTemp <> '' then
              begin
                 cQuery     := Params.Values[ lowercase( 'query' ) ];
              end;
           end;

           if lowercase( TComponent(pFrame).Name ) = 'mainform' then
              dm_rc.rc_BootStrapRender( MainForm, ( cTemp <> '' ) , pObj )
           else
              dm_rc.rc_BootStrapRender( pFrame , ( cTemp <> '' ) , pObj ) ;

           if lowercase( pObj.name ) = 'swtcamera' then
              UniSession.AddJS( varIIF( pObj.tag = 1 , 'rc_cameraOn();' , 'rc_cameraOff();' )  );
       end;
   end
   else
   if ( EventName = 'bsrgp' ) then
   begin
       FClassName := Params.Values['form'];

       pFrame := rc_FindControl( FClassName );

       if pFrame <> nil then
       begin
           pLabel := TUniLabel( TComponent(pFrame).FindComponent( Params.Values[ EventName ] ) );
           cTemp3 := lowercase( dm_rc.rc_GetParamFromRGP( pLabel.Name, rptFIELD ) );

           // all itemn set tag = 0
           for I := 0 to TComponent(pFrame).ComponentCount - 1 do
           begin
               if TComponent(pFrame).Components[i] is TUniLabel then
               begin
                   cTemp  := lowercase( TComponent(pFrame).Components[i].Name ); // bsrgp1_M_Tipo

                   if ( Copy( cTemp, 1, 5 ) = 'bsrgp' ) then
                   begin
                      cTemp2 := lowercase( dm_rc.rc_GetParamFromRGP( cTemp, rptFIELD ) );

                      if cTemp2 = cTemp3 then
                      begin
                         TUniLabel( TComponent(pFrame).Components[i] ).Tag := 0;
                         // v. 3.2.0.3
                         if lowercase( TComponent(pFrame).Name ) = 'mainform' then
                            dm_rc.rc_BootStrapRender( MainForm , false, TUniLabel( TComponent(pFrame).Components[i] ) )
                         else
                            dm_rc.rc_BootStrapRender( pFrame , false , TUniLabel( TComponent(pFrame).Components[i] ) );
                      end;
                   end;
               end;
           end;

           pLabel := TUniLabel( TComponent(pFrame).FindComponent( Params.Values[ EventName ] ) );

           // set tag = 1 to Item Selected
           pLabel.Tag := 1;

           cQuery     := Params.Values[ lowercase( 'query' ) ];

           if lowercase( TComponent(pFrame).Name ) = 'mainform' then
              dm_rc.rc_BootStrapRender( MainForm , false, pLabel )
           else
              dm_rc.rc_BootStrapRender( pFrame , false , pLabel );
       end;
   end
   else
   if SameText( EventName, '_GeoLocation' ) then
   begin
      if (Params.Values['lat'] <> '') then
      begin
        cLatitude  := Params.Values['lat'];
        cLongitude := Params.Values['lng'];
      end;
   end
   else
   if EventName = '_DadosCep' then   // específico para Brasil
   begin
   end
   else
   if EventName = '_DadosCepErro'  then
   begin
   end
   else
   if EventName = '_PositionXY'  then
   begin
   end;
end;

procedure TMainForm.rc_GetGeoPosition;
begin
   UniSession.AddJS(
                 'navigator.geolocation.getCurrentPosition'+
                 '( '+
                   'function(position)'+
                   '{ '+
                   '    ajaxRequest( MainForm.htmlFrame, "_GeoLocation" ,' +
                   '      ["lat=" + position.coords.latitude, ' +
                   '       "lng=" + position.coords.longitude, ' +
                   '       "acc=" + position.coords.accuracy, ' +
                   '       "alt=" + position.coords.altitude, ' +
                   '       "altacc=" + position.coords.altitudeAccuracy, ' +
                   '       "head=" + position.coords.heading, ' +
                   '       "ts=" + position.coords.timestamp ' +
                   '      ]);' +
                   '} '+
                   ', '+

                   'function(error)'+
                   '{ '+
                  '  switch(error.code) '+
                  '  { '+
                '    case 0: '+ // UnKnown
                    '      alert(error.message); '+
                '      break; '+
                '    case 1: '+ // Denied
                    '      alert(error.message); '+
                    '      break; '+
                '    case 2: '+ // UnAvailable
                    '      alert(error.message); '+
                    '      break; '+
                '    case 3: '+ // TimeOut
                    '      alert(error.message); '+
                    '      break; '+
                    '  } '+
                    '} '+
                 ') '
                );
end;
// v. 3.0.0.0
procedure TMainForm.paLayoutMainMenuResize(Sender: TUniControl; OldWidth,
  OldHeight: Integer);
begin
     if mm.oPgGeneral <> nil then
        dm_rc.rc_ResizeBlocks( rc_FindControl( dm_rc.rc_GetActiveFormFrameNameInMainTab ) );// v. 3.3.3.0 //Copy( mm.oPgGeneral.ActivePage.Name , 5, 100 ) ) );

     rc_UpdateCharts;
end;
// v. 3.3.3.0
procedure TMainForm.pgGeneralChangeValue(Sender: TObject);
var
  Ts : TUniTabSheet;
  Nd : TUniTreeNode;
begin
  try
     Ts := mm.oPgGeneral.ActivePage;

     if Ts.Tag > 0 then
     begin
        Nd := Pointer(Ts.Tag);
        UniTreeMainMenu.Selected := Nd;
     end;
     paBackGround.Color := StringToColor( mm.CONFIG_LAYOUT_BG_COLOR ) ;
  except on e:exception do
      dm_rc.rc_ShowSweetAlertError('pgGeneralChangeValue<br><br>' + e.message );
  end;
end;
// v. 3.3.1.0
procedure TMainForm.TabSheetClose(Sender: TObject; var AllowClose: Boolean);
var
  Ts : TUniTabSheet;
  Nd : TUniTreeNode;
begin
  try
     Ts := Sender as TUniTabSheet;
     Nd := Pointer(Ts.Tag);

     if Assigned(Nd) then
     begin
       if Ts.Tag > 0 then
          Nd.Data := nil;
       // para o rc_BootStrapRender não exibir( podia usar o .Data, mas o VISIBLE´já usado pras ABAS que são
       // específicas a determinadas atuações...
       Ts.TabVisible := false;

       if UniTreeMainMenu.Selected = Nd then
          UniTreeMainMenu.Selected := nil;
     end;
     if mm.oPgGeneral <> nil then
        dm_rc.rc_ResizeBlocks( rc_FindControl( dm_rc.rc_GetActiveFormFrameNameInMainTab ) );// v. 3.3.3.0 //Copy( mm.oPgGeneral.ActivePage.Name , 5, 100 ) ) );
  except on e:exception do
      dm_rc.rc_ShowSweetAlertError('TabSheetClose<br><br>' + e.message );
  end;
end;

// feedback: Mesut from Turkey
{$ifdef MSWINDOWS}
procedure TMainForm.rc_TrimAppMemorySize;
var
  MainHandle : THandle;
begin
  try
    MainHandle := OpenProcess(PROCESS_ALL_ACCESS, false, GetCurrentProcessID) ;
    SetProcessWorkingSetSize(MainHandle, $FFFFFFFF, $FFFFFFFF) ;
    CloseHandle(MainHandle) ;
  except
  end;
  Application.ProcessMessages;
end;
{$endif}
{$ifdef LINUX}
procedure TMainForm.rc_TrimAppMemorySize;
begin
  //mesut
end;
{$endif}

procedure TMainForm.UniTreeMainMenuClick(Sender: TObject);
begin
     rc_AddFormFrameInTab( UniTreeMainMenu );
end;
// v. 3.3.3.2
procedure TMainForm.rc_AddFormFrameInTab(
             pMenu : TUniTreeMenu ;
             pFormFrameTitle, pTableName, pFormFrameName : string ;
             pIsMenuReport, pIsModal : Boolean ;
             pCallFormOp : TRCAddFormParamType ;
             pRecord : integer;
             pParent : TComponent );
var
   oObj : TUniControl;
   nodeMenu : TUniTreeNode;
   nodeMenuItem : string;

   pNewIndex, iMenuItemIndex,
   f, i, t :  integer;

   Nd  : TUniTreeNode;
   Ts  : TUniTabSheet;

   FrC : TUniFrameClass;
   Fr  : TUniFrame;

   fClass : TClass;

   FrmC : TUniFormClass;
   Frm  : TUniForm;

   cTmp1, cTmp2, cFormName,
   FClassName, Path: string;

   sAccessControl : string;

   bFormDoNotExists,
   bFormWithoutCRUD,
   bAddBtn,
   bModal : Boolean;
   // v. 3.2.0.7
   procedure rc_SetOptionParams( pOption, pTable, pRestrictionField : string ); overload;
   begin
        bModal                                    := false;

        mm.varC_Table_Search           := ' ' + pTable + ' ';
        mm.varC_SelectedItem_FSideMenu := pOption;

        // montar NOME DO FORM baseado no nome da TABELA contida no item do menu SELECIONADO
        // mount FORM NAME based on the TABLE name contained in the SELECTED menu item
        FClassName := '';

        path := pFormFrameTitle;

        if trim( pTable ) <> '' then
        begin
           // Ex. opcao do Menu: Imagens | cli_imagens__imagens
           //
           if Pos( '__' , mm.varC_Table_Search ) = 0 then
           begin
              mm.varC_LinkedFormFrame := Trim(mm.varC_Table_Search);

              FClassName              := FRM_CLASS_CRUD_PREFIX + mm.varC_LinkedFormFrame;
              sAccessControl          := mm.varC_LinkedFormFrame;//mm.varC_Table_Search; // v. 3.1.0.60
           end
           else
           //
           // it´s a report ?
           //
           if Pos( '__report' , mm.varC_Table_Search ) > 0 then
           begin
              // it´s a report ?
              //
              bFormWithoutCRUD        := ( Pos( '__report' , Trim( mm.varC_Table_Search ) ) > 0 );

              mm.varC_LinkedFormFrame := Trim(Copy( mm.varC_Table_Search, Pos( '__' , mm.varC_Table_Search ) + 2, 100 ));

              FClassName              := FRM_CLASS_PREFIX + mm.varC_LinkedFormFrame;
              sAccessControl          := mm.varC_LinkedFormFrame;//mm.varC_Table_Search; // v. 3.1.0.60
           end
           else
           //
           // FORM name <> table name or
           // FORM without CRUD ( inherited of frmBaseCRUD )
           //
           begin
              bModal                  := ( Pos( '__modal_' , mm.varC_Table_Search ) > 0 );

              mm.varC_LinkedFormFrame := Trim(Copy( mm.varC_Table_Search, Pos( '__' , mm.varC_Table_Search ) + 2, 100 ));
              mm.varC_Table_Search    := Trim(Copy( mm.varC_Table_Search, 1, Pos( '__' , mm.varC_Table_Search ) - 1 ));

              // FORM name <> table name
              if mm.varC_Table_Search <> '' then
              begin
                   FClassName        := FRM_CLASS_CRUD_PREFIX + mm.varC_LinkedFormFrame;
                   sAccessControl    := mm.varC_LinkedFormFrame;//mm.varC_Table_Search; // v. 3.1.0.60
              end
              else
              // FORM without CRUD ( inherited of frmBaseCRUD )
              begin
                 if bModal then
                    mm.varC_LinkedFormFrame := StringReplace( pTable, '__modal_' , '' , [rfReplaceAll] );

                 bFormWithoutCRUD  := True;

                 FClassName        := FRM_CLASS_PREFIX + mm.varC_LinkedFormFrame;
                 sAccessControl    := mm.varC_LinkedFormFrame;//mm.varC_Table_Search; // v. 3.1.0.60
              end;
           end;
           // v. 3.2.0.7
           if pRestrictionField <> '' then
              sAccessControl    := pRestrictionField;
           // captura chave dinamica( PK )
           // o duplo '__' indica q a opcao não tem vinculo com Banco de Dados, ou seja,
           // só capturar PK se for opção vinculada a Banco de Dados
           //
           // dynamic key capture (PK)
           // the double '__' indicates that the option is not linked to a database, that is,
           // only capture PK if option linked to Database
           if ( Pos( '__' , mm.varC_Table_Search ) = 0 ) and ( mm.varC_Table_Search <> '' ) then
           begin
                // mm.varC_PK_MasterTable := dm_rc.rc_GetPrimaryKey( mm.varC_Table_Search.ToLower );
           end;
        end;
   end;

   procedure rc_SetOptionParams; overload;
   var
      cT, nodeMenuItemGeneric,
      cMenuOpt : string;
   begin
        bModal                                    := pIsModal;

        // Free Frame ico:fas-circle tbl: frm:FreeFrame

        cMenuOpt := mm.varC_SelectedItem_FSideMenu;

        if trim( pTableName ) <> '' then
           mm.varC_Table_Search           := ' ' + pTableName + ' ';

        if ( trim( pTableName ) <> '' ) and ( pFormFrameTitle = '' ) then
        begin
           mm.varC_SelectedItem_FSideMenu := rc_StrCaptalize( pTableName );

           mm.varC_LinkedFormFrame        := ansilowercase( mm.varC_SelectedItem_FSideMenu );
        end
        else
           mm.varC_SelectedItem_FSideMenu := pFormFrameTitle;

        // montar NOME DO FORM baseado no nome da TABELA contida no item do menu SELECIONADO
        // mount FORM NAME based on the TABLE name contained in the SELECTED menu item
        FClassName := '';

        // Ex. opcao do Menu: Imagens | cli_imagens__imagens
        //
        if pFormFrameName = '' then
        begin
           mm.varC_LinkedFormFrame := Trim( mm.varC_Table_Search );

           FClassName              := FRM_CLASS_CRUD_PREFIX + mm.varC_LinkedFormFrame;
           sAccessControl          := mm.varC_LinkedFormFrame;//mm.varC_Table_Search; // v. 3.1.0.60
        end
        else
        //
        // it´s a report ?
        //
        if pIsMenuReport then
        begin
           // it´s a report ?
           //
           bFormWithoutCRUD                       := false;

           mm.varC_LinkedFormFrame := Trim( Copy( mm.varC_Table_Search, Pos( '__' , mm.varC_Table_Search ) + 2, 100 ));


           FClassName              := FRM_CLASS_PREFIX + mm.varC_LinkedFormFrame;
           sAccessControl          := mm.varC_LinkedFormFrame;//mm.varC_Table_Search; // v. 3.1.0.60
        end
        else
        //
        // FORM name <> table name or
        // FORM without CRUD ( inherited of frmBaseCRUD )
        //
        begin
           cT := mm.varC_Table_Search;

           mm.varC_LinkedFormFrame := Trim(Copy( mm.varC_Table_Search, Pos( '__' , mm.varC_Table_Search ) + 2, 100 ));
           mm.varC_Table_Search    := Trim(Copy( mm.varC_Table_Search, 1, Pos( '__' , mm.varC_Table_Search ) - 1 ));

           // FORM name <> table name
           if pFormFrameName = '' then
           begin
                FClassName        := FRM_CLASS_CRUD_PREFIX + mm.varC_LinkedFormFrame;
                sAccessControl    := mm.varC_LinkedFormFrame;//mm.varC_Table_Search; // v. 3.1.0.60
           end
           else
           // FORM without CRUD ( inherited of frmBaseCRUD )
           begin
              cT := pTableName;

              if ( bModal ) then
              begin
                 mm.varC_LinkedFormFrame := pFormFrameName;
                 FClassName        := FRM_CLASS_PREFIX + mm.varC_LinkedFormFrame;
              end
              else
              if ( pFormFrameName <> '' ) then
              begin
                 mm.varC_LinkedFormFrame := pFormFrameName;

                 FClassName        := FRM_CLASS_CRUD_PREFIX + mm.varC_LinkedFormFrame;
                 fClass            := FindAnyClass( FClassName );

                 if fClass = nil then
                 begin
                    FClassName     := FRM_CLASS_PREFIX + mm.varC_LinkedFormFrame;

                    fClass := FindAnyClass( FClassName );
                    if fClass = nil then
                    begin
                       FClassName     := FRM_CLASS_PREFIX + mm.varC_LinkedFormFrame;

                       if fClass = nil then
                       begin
                            fClass     := FindAnyClass( FClassName );
                       end;
                    end;
                 end;

                 mm.varC_Table_Search := cT;
                 mm.varC_SelectedItem_FSideMenu := cMenuOpt;
              end;

              bFormWithoutCRUD      := True;

              sAccessControl := mm.varC_LinkedFormFrame;

              nodeMenuItem      := pFormFrameTitle;
              nodeMenuItemGeneric := nodeMenuItem;
              cTmp1             := pFormFrameTitle;
           end;
        end;

        // captura chave dinamica( PK )
        // o duplo '__' indica q a opcao não tem vinculo com Banco de Dados, ou seja,
        // só capturar PK se for opção vinculada a Banco de Dados
        //
        // dynamic key capture (PK)
        // the double '__' indicates that the option is not linked to a database, that is,
        // only capture PK if option linked to Database
        if ( Pos( '__' , mm.varC_Table_Search ) = 0 ) and ( mm.varC_Table_Search <> '' ) then
        begin
              //mm.varC_PK_MasterTable := dm_rc.rc_GetPrimaryKey( mm.varC_Table_Search.ToLower );
        end;
   end;
begin
     // v. 3.2.0.8
     //if dm_rc.rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;

     Fr       := nil;
     FrC      := nil;
     FrmC     := nil;
     nodeMenu := nil;
     Ts       := nil; // Linux Issue ( feedback by mesut )
     f        := 0;   // Linux Issue ( feedback by mesut )

     mm.varC_FieldMasks             := '';
     mm.varC_SelectedItem_FSideMenu := '';
     mm.varC_PK_MasterTable         := '';
     mm.varC_LinkedFormFrame        := '';
     cTmp1                                     := '';

     iMenuItemIndex := -1; // v. 3.3.3.2
     // chamada externa, não veio do uniTreeMenu
     // external call, not from uniTreeMenu
     bAddBtn := Pos( '_ADD' , pTableName ) > 0;
     if ( bAddBtn ) or ( pRecord > 0 ) then
     begin
          pTableName := StringReplace( pTableName , '_ADD' , '' , [rfReplaceAll] );

          // Veio de um LookUp com Apelido adicional
          if Pos( '__' , pTableName ) > 0 then
          begin
             pTableName := Copy( pTableName , 1, Pos( '__' , pTableName ) -1 );
             cTmp1 := pTableName;
          end;

          cTmp1 := pTableName;

          cFormName := '';
          if Pos( '-' , pTableName ) > 0 then
          begin
             cFormName  := Copy( pTableName , Pos( '-' , pTableName ) +1, 100 );
             pTableName := Copy( pTableName , 1, Pos( '-' , pTableName ) -1 );
             // v. 3.1.0.60
             // chamada dinâmica
             if cFormName <> '' then
                cTmp1      := pTableName + '__' + cFormName
             else
                cTmp1 := StringReplace( cTmp1, '-', '', [rfReplaceAll] );

          end;

          mm.varI_NumMenu      := Length( mm.varA_FSideMenu );
          mm.varC_Table_Search := pTableName;

          // procurar se foi definido uma opção na(s) unit(s) de formação de MENU DINAMICO( uMenu_BASICS, uMenu_MOVEMENT... )
          // search if an option has been defined in the DYNAMIC MENU training unit (s) (uMenu_BASICS, uMenu_MOVEMENT ...)
          mm.varB_Processed := False;

          for f  := 1 to mm.varI_NumMenu - 1 do
          begin
               if ansilowercase( mm.varA_FSideMenu[ f ].Table ) = Trim( cTmp1 ) then
               begin
                    mm.varC_SelectedItem_FSideMenu := mm.varA_FSideMenu[ f ].option;
                    mm.varB_Processed := True;
                    iMenuItemIndex := f; // v. 3.3.3.2
                    Break;
               end;
          end;
     end;

     //iMenuItemIndex := -1; // v. 3.3.3.2
     if pMenu <> nil then
     begin
        nodeMenu     := pMenu.Selected;
        nodeMenuItem := Ansilowercase( Trim( nodeMenu.Text ) );

        if Pos( '<span>', nodeMenuItem ) > 0 then
        begin
           cTmp1 := Copy( nodeMenuItem, Pos( '<span>', nodeMenuItem ) + 6 );
           cTmp1 := Trim( Copy( cTmp1, 1, Pos( '<', cTmp1 ) -1 ) );
        end;

        // O Nome da maioria dos FORMs coincide com o nome da TABELA, criticar apenas os que não coincidem
        // The name of most FORMs matches the TABLE name, criticize only those that do not match
        mm.varI_NumMenu      := Length( mm.varA_FSideMenu );
        mm.varC_Table_Search := '';

        // procurar se foi definido uma opção na(s) unit(s) de formação de MENU DINAMICO( uMenu_BASICS, uMenu_MOVEMENT... )
        // search if an option has been defined in the DYNAMIC MENU training unit (s) (uMenu_BASICS, uMenu_MOVEMENT ...)
        mm.varB_Processed := False;
        for f  := 1 to mm.varI_NumMenu - 1 do
        begin
             // v. 3.1.0.63
             try
                if ansilowercase( mm.varA_FSideMenu[ f ].option ) = Trim( nodeMenuItem ) then
                begin
                     rc_SetOptionParams( mm.varA_FSideMenu[ f ].option, mm.varA_FSideMenu[ f ].table, mm.varA_FSideMenu[ f ].RestrictionField ); // v. 3.2.0.7
                     iMenuItemIndex := f;
                     mm.varB_Processed := True;
                     Break;
                end;
             except on e:exception do
                    begin
                         mm.varC_LastErrorMsg := mm.varC_LastErrorMsg + ' ' + mm.MSG_ERROR + ': ' + e.Message;
                         dm_rc.rc_ShowError( '<h2 style="color: gray;text-align: center;">Failed to trigger option in menu( index:' + f.ToString + ') !</h2><br>' +
                                             mm.varC_LastErrorMsg + '<br><br>' +
                                             mm.MSG_CONTACT_SUPPORT);
                         Abort;
                    end;
             end;
        end;

        Ts := nodeMenu.Data;
     end
     else
     // se não encontrou uma opção definida na(s) unit(s) de formação de MENU DINAMICO..então é um FORM ISOLADO
     // if you did not find an option defined in the DYNAMIC MENU training unit (s) ... then it is an ISOLATED FORM
     begin
         cTmp1 := '';
         if mm.varB_Processed  then
            cTmp1 := mm.varC_SelectedItem_FSideMenu;

         //  nil, pFormFrameTitle, pTableName, pFormFrameName, pIsMenuReport, pIsModal
         rc_SetOptionParams;

         nodeMenuItem := Ansilowercase( Trim( mm.varC_SelectedItem_FSideMenu ) );
         // issue feedback by JOSAURO
         if ( cTmp1 <> '' ) and ( ( mm.varC_SelectedItem_FSideMenu = '' ) or ( mm.varB_Processed ) )then //if ( cTmp1 <> '' ) and ( mm.varC_SelectedItem_FSideMenu = '' ) then
         begin
            mm.varC_SelectedItem_FSideMenu := cTmp1;
            nodeMenuItem := cTmp1;
         end
         else
            cTmp1 := mm.varC_SelectedItem_FSideMenu;
     end;

     // se nao tem uma CLASSE de FORM/FRAME associada, clicou num submenu, então não tem o q processar
     // if you don't have an FORM / FRAME CLASS associated, clicked on a submenu, then you don't have to process it
     if FClassName <> '' then
     begin
         if UniApplication.FindComponent('MainForm' ) <> nil then
         begin
            MainForm.ShowMask;
            UniSession.Synchronize();
         end;

         mm.varC_FormSource_Search     := FClassName;

         // v. 3.1.0.63 ini
         // FORMs que sao BASICOS( apenas campos CODIGO e DESCRICAO ) - herdados de "frmCadBASICS"
         // FORMs that are BASIC (only CODE and DESCRIPTION fields) - inherited from "frmCadBASICS"
         if AnsiMatchStr( mm.varC_LinkedFormFrame , ARRAY_BASICS ) then
            FClassName := 'TfrmCadBasics';
         //else
         // v. 3.1.0.63 end
         begin
            if mm.oPgGeneral <> nil then
            begin
               for I := 0 to mm.oPgGeneral.PageCount - 1 do
               begin
                   with mm.oPgGeneral do
                   begin
                       // v. 3.2.0.7
                       if Pos( '<span>', cTmp1 ) > 0 then
                       begin
                          cTmp1 := Copy( cTmp1, Pos( '<span>', cTmp1 ) + 6 );
                          cTmp1 := Trim( Copy( cTmp1, 1, Pos( '<', cTmp1 ) -1 ) );
                       end;

                       cTmp2 := Trim( mm.oPgGeneral.Pages[I].Caption );

                       if Pos( '<span>', Pages[I].Caption ) > 0 then
                       begin
                          cTmp2 := Copy( Pages[I].Caption, Pos( '<span>', Pages[I].Caption ) + 6 );
                          cTmp2 := Trim( Copy( cTmp2, 1, Pos( '<', cTmp2 ) -1 ) );
                       end;

                       if ansilowercase(cTmp1) = ansilowercase(cTmp2) then // nodeMenu.Text then
                       begin
                         mm.oPgGeneral.ActivePageIndex := I;
                         dm_rc.rc_BootStrapRender( self );  // feedback by CENK VAROL( Turkey )
                         // v. 3.2.0.7
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
                         if pCallFormOp <> aftNone then
                         begin
                            FClassName := Copy( trim( TUniTabSheet( mm.oPgGeneral.Pages[ i ] ).Name ), 5, 100 ); //tabTFRMCADclientes__2
                            Fr := TUniFrame( rc_FindControl( FClassName ) );
                            oObj := TUniControl( Fr.FindComponent('ed_codmaster') );
                            if oObj <> nil then
                            begin
                                 //TUniEdit( Fr.FindComponent('ed_codmaster') ).Hint := intToStr( pRecord );
                                 oObj.Hint := intToStr( pRecord );
                                 // v. 3.4.0.0
                                 case pCallFormOp of
                                   aftNone    : oObj.Tag  := 0;
                                   aftShow    : oObj.Tag  := -1;
                                   aftShowReg : oObj.Tag  := -3;
                                   aftEdit    : oObj.Tag  := -2;
                                   aftInsert  : Fr.Tag := 1;
                                 end;
                                 t := StrToIntDef( oObj.Hint, 0 );
                                 if t <> 0 then
                                 begin
                                      if TUniComboBox( Fr.FindComponent('cbxSearchCRUDField1') ) <> nil then
                                         TUniComboBox( Fr.FindComponent('cbxSearchCRUDField1') ).ItemIndex := 0;
                                      if TUniEdit( Fr.FindComponent('edSearchCRUD1') ) <> nil then
                                         TUniEdit( Fr.FindComponent('edSearchCRUD1') ).Text := IntToStr( t );
                                      if TUniBitBtn( Fr.FindComponent('btnSearchCRUD') ) <> nil then
                                         TUniBitBtn( Fr.FindComponent('btnSearchCRUD') ).Click;

                                      //case oObj.Tag of
                                           //-1 : dbgSearchCRUDDblClick( dbgSearchCRUD );
                                           //-2 : btnEditRegClick( btnEditReg );
                                           //-3 : btnNewRegClick( btnNewReg );
                                      //end;
                                      if TUniEdit( Fr.FindComponent('edSearchCRUD1') ) <> nil then
                                         TUniEdit( Fr.FindComponent('edSearchCRUD1') ).Text := '';
                                 end
                                 else
                                 begin
                                      if TUniBitBtn( Fr.FindComponent('btnSearchCRUD') ) <> nil then
                                         TUniBitBtn( Fr.FindComponent('btnSearchCRUD') ).Click;
                                    // contar quantos campos tem pra ativar ou nao o FORCEFIT
                                    // FORCEFIT fica melhor com poucos campos, mas nao funciona bem quando o LOCKED está ativo
                                    //dm_rc.rc_DBGridUpdateAll( Fr , false); // v. 3.3.3.0
                                 end;
                            end;
                         end;

                         if UniApplication.FindComponent('MainForm' ) <> nil then MainForm.HideMask;

                         Exit;
                       end;
                   end;
               end;
            end;
         end;

         if not Assigned(Ts) then
         begin
            // v. 3.4.0.0
            pNewIndex := -1;
            if mm.oPgGeneral <> nil then
               pNewIndex  := mm.oPgGeneral.PageCount;

            mm.varC_SearchWhere        := '';
            mm.varC_SearchOrder        := '';
            mm.varC_Selected_FormFrame := nodeMenuItem;
            mm.varC_StatusSearch       := '';
            mm.varC_FieldMasks         := '';

            bFormDoNotExists                        := True;

            if ( mm.CONFIG_LAYOUT_TAB_OFF = 'ON' ) then
            begin
               if mm.oPgGeneral <> nil then
                  if mm.oPgGeneral.ActivePage.PageIndex > 0 then
                     mm.oPgGeneral.ActivePage.Close;
            end;
            // v. 3.1.0.61
            // verifica restricao do usuário - ACESSO
//            If not dm_rc.rc_PermissionVerify( mm.varC_Selected_FormFrame ,
//                                              Trim( sAccessControl ) ,
//                                              PT_ACCESS ) then
//            begin
//               FrC := nil;
//               if UniApplication.FindComponent('MainForm' ) <> nil then MainForm.HideMask;
//               Abort;
//            end
//            else
            // v. 3.4.0.0 ( thanks to MOHAMED EROL for the feedback )
            //if ( mm.oPgGeneral.PageCount.ToString = mm.CONFIG_LAYOUT_TAB_MAX_OPENED ) then
            if pNewIndex.ToString = mm.CONFIG_LAYOUT_TAB_MAX_OPENED then
            begin
               FrC := nil;
               if UniApplication.FindComponent('MainForm' ) <> nil then MainForm.HideMask;
               dm_rc.rc_ShowSweetAlertSimple( 'Max Tabs opened!' );
               Abort;
            end
            else
            // end 3.1.0.61
            begin
                 mm.varC_LastErrorMsg := mm.MSG_BUGERROR_MENU_DO_NOT_EXIST;
                 try
                   // evitar mensagem ANTES da EXCEPTION ( block showmodal ... )
                   fClass := FindAnyClass( FClassName );
                   bFormDoNotExists := False;
                   if fClass <> nil then
                   begin
                         FrC  := TUniFrameClass( FindAnyClass( FClassName ) );
                         FrmC := TUniFormClass( FindAnyClass( FClassName ) );
                   end
                   else  // link:
                   begin
                        If Pos( 'link:' , FClassName ) > 0 then
                        begin
                             bFormDoNotExists := False;
                             cTmp1 := trim( Copy( FClassName, Pos( 'link:' , FClassName ) + 5 , 200 ) );
                             dm_rc.rc_OpenLink( cTmp1 );
                             mm.varC_LastErrorMsg := ''; // v. 3.3.3.2
                        end
                        else
                        begin
                           bFormDoNotExists := True;
                        end;
                   end;

                   if FrC <> nil then
                   begin
                      bFormDoNotExists     := False;
                      //UniSession.SuspendLayouts;
                      if not bModal then
                      begin
                         // v.3.3.0.1
                         if pParent = nil then
                         begin
                            Ts               := TUniTabSheet.Create(Self);

                            if mm.oPgGeneral <> nil then
                               Ts.PageControl   := mm.oPgGeneral;
                            // v. 3.2.0.6 //closebtn
                            Ts.Closable      := True;
                            if not mm.varA_FSideMenu[ iMenuItemIndex ].CloseBtn then
                               Ts.Hint := '[[closebtn:false]]';

                            Ts.OnClose       := TabSheetClose;

                            if pMenu <> nil then
                            begin
                               Ts.Tag        := NativeInt( nodeMenu );
                               Ts.ImageIndex := nodeMenu.ImageIndex;
                            end
                            else
                               Ts.Tag        := (-1) * ( ( Random( 100 ) + 1 ) + ( Random( 200 ) + 1 ) );

                            Ts.Caption := rc_CamelCase( dm_rc.rc_StripHtmlTags( nodeMenuItem ) );
                            Ts.Name    := 'tab' + mm.varC_FormSource_Search + '__' + pNewIndex.ToString;

                            if mm.oPgGeneral <> nil then
                               mm.oPgGeneral.ActivePage := Ts;

                            rc_AddCssClass( ts, 'slide_in' ); // v. 3.2.0.0
                         end;

                      end;

                      dm_rc.rc_ScreenUpdate;

                      if fClass.InheritsFrom(TUniFrame) then
                      begin
                         // v. 3.3.0.1
                         if pParent <> nil then
                         begin
                            Fr := TUniFrame( rc_FindControl( Copy( FClassName, 2 ), TUniControl( pParent ) ) );
                         end;

                         if Fr = nil then
                         begin
                            try
                               Fr := FrC.Create( self );
                            except on e:exception do
                                   begin
                                      if Pos( 'Unregistered', e.Message ) > 0 then
                                         mm.varC_LastErrorMsg := mm.MSG_BUGERROR_MENU_DO_NOT_EXIST + ' ' + mm.MSG_ERROR + ': ' + e.Message
                                      else
                                         mm.varC_LastErrorMsg := mm.MSG_ERROR + ': ' + e.Message;
                                   end;
                            end;
                         end;

                         if fClassName.ToLower = 'tfrmcadbasics' then
                            Fr.Name  := 'frmCad' + mm.varC_LinkedFormFrame
                         else
                            Fr.Name  := Fr.Name ;

                         Fr.Align    := alClient;
                         // v. 3.3.0.1
                         if pParent = nil then
                         begin
                            Fr.Name   := Fr.Name + '__' + pNewIndex.ToString;
                            Fr.Parent := Ts;
                         end
                         else
                         begin
                            Fr.Name   := Fr.Name;
                            Fr.Parent := TUniControl( pParent );
                            // v. 3.4.0.0
                            if Pos( Fr.Name, mm.varC_FormsInParent ) = 0  then
                               mm.varC_FormsInParent := mm.varC_FormsInParent + ';' + Fr.Name + ' ';
                         end;

                         Fr.Tag := varIIF( bAddBtn , 1, 0 );

                         mm.varC_FormSource_Search := fr.Name;

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
                         if pCallFormOp <> aftNone then
                         begin
                            oObj := TUniControl( Fr.FindComponent('ed_codmaster') );
                            if oObj <> nil then
                            begin
                                 oObj.Hint := intToStr( pRecord );
                                 case pCallFormOp of
                                   aftNone  : oObj.Tag  := 0;
                                   aftShow  : oObj.Tag  := -1;
                                   aftEdit  : oObj.Tag  := -2;
                                   aftInsert: Fr.Tag := 1;
                                 end;
                            end;
                         end;

                         if ( iMenuItemIndex >= 0 ) and ( Fr.FindComponent('ed_GenNextID_OnNew') <> nil ) then
                         begin
                              TUniEdit( Fr.FindComponent('ed_GenNextID_OnNew') ).Text := varIIF( mm.varA_FSideMenu[ iMenuItemIndex ].GenID, 'true', 'false' );
                         end;
                         if ( iMenuItemIndex >= 0 ) and ( Fr.FindComponent('ed_AskNewRec_AfterPost') <> nil ) then
                         begin
                              TUniEdit( Fr.FindComponent('ed_AskNewRec_AfterPost') ).Text := varIIF( mm.varA_FSideMenu[ iMenuItemIndex ].AskNew, 'true', 'false' );
                         end;
                         // v. 3.2.0.5
                         if ( bAddBtn ) and ( Fr.FindComponent('ed_Table_ItemSel') <> nil ) then
                         begin
                              TUniEdit( Fr.FindComponent('ed_Table_ItemSel') ).Hint := 'add;';
                         end;
                      end
                      else
                      if not bModal then
                      begin
                         Frm                 := FrmC.Create( uniSession.uniapplication );
                         Frm.Name            := Frm.Name + '__' + pNewIndex.ToString;
                         // v. 3.3.0.1
                         if pParent = nil then
                            Frm.Parent := Ts
                         else
                            Frm.Parent := TUniControl(pParent);

                         Frm.Align           := alClient;

                         mm.varC_FormSource_Search := frm.Name;
                      end
                      else
                      begin
                           // para usar MODAL centralizado, adicione o atributo [[modal:]] no seu formulário.
                           // o evento OnCreate é chamado antes de atribuir dinamicamente( usando bModal )
                           Frm                 := FrmC.Create( uniSession.uniapplication );
                           Frm.Name            := Frm.Name ;
                           mm.varC_FormSource_Search := frm.Name;

                           if rc_GetHintProperty( 'modal:', Frm.Hint ) = '' then
                              Frm.Hint := rc_SetHintProperty( '' , 'modal:', Frm.Hint, True );

                           Frm.ShowModal( procedure(Sender: TComponent; Result:Integer)
                                          begin
                                             // para quando um FORM MODAL estiver ativo, não executar o "dbGridUpdate" no
                                             // que estiver "abaixo" do MODAL
                                             mm.varC_Form_Modal := nil;
                                          end
                                        );
                      end;

                      // para exibir a ultima aba adicionada
                      if mm.oPgGeneral <> nil then
                         mm.varI_TabIni := ( mm.oPgGeneral.PageCount - 1 ) - varIIF( mm.varB_Mobile_Screen, 1, 6 )
                      else
                         mm.varI_TabIni := -1;

                      if mm.varI_TabIni < 0 then
                         mm.varI_TabIni := 0;

                      if ( not bFormWithoutCRUD ) or ( Pos( '__report' , Trim( mm.varC_Table_Search ) ) > 0 ) then
                      begin
                         if TUniLabel( Fr.FindComponent( 'labTitleForm' ) ) <> nil then
                            TUniLabel( Fr.FindComponent( 'labTitleForm' ) ).Caption   := dm_rc.rc_StripHtmlTags( mm.varC_SelectedItem_FSideMenu );
                      end;
                      // v. 3.3.0.1
                      if ( pMenu <> nil ) and ( pParent = nil ) then
                         nodeMenu.Data := Ts;
                      // v. 3.2.0.0
                      // 'fechar' o menu pra liberar espaço horizontal
                      if mm.varB_Mobile_Screen_Portrait then
                         if rc_FindControl( 'paLayoutMainMenu' ) <> nil then
                         begin
                            TUniControl( rc_FindControl( 'paLayoutMainMenu' ) ).Width := 0;
                            rc_UpdateMainControls;
                         end;

                      rc_UpdateCharts;
                      mm.varC_LastErrorMsg := ''; // v. 3.2.0.7
                   end;
                 except on e:exception do
                        begin
                             mm.varC_LastErrorMsg := mm.varC_LastErrorMsg + ' ' + mm.MSG_ERROR + ': ' + e.Message;
                        end;
                 end;

                 if UniApplication.FindComponent('MainForm' ) <> nil then MainForm.HideMask;
            end;
            // v. 3.2.0.7                     r
            if mm.varC_LastErrorMsg <> '' then
            begin
                 if ( bFormDoNotExists ) then
                    mm.varC_LastErrorMsg := '<h2 style="color: gray;text-align: center;">Failed to trigger option in menu !</h2><br>' +
                                            '<strong>MESSAGE</strong><br><hr>Unregistered Class<strong>' + FClassName + '</strong><br><br>' + mm.varC_LastErrorMsg;

                    dm_rc.rc_ShowError( mm.varC_LastErrorMsg + '<br><br>' +
                                        mm.MSG_CONTACT_SUPPORT)
            end;
         end;
     end
     else
     begin
          if Pos( '<span>', nodeMenuItem ) > 0 then
          begin
             nodeMenuItem := Copy( nodeMenuItem, Pos( '<span>', nodeMenuItem ) + 6 );
             nodeMenuItem := Trim( Copy( nodeMenuItem, 1, Pos( '<', nodeMenuItem ) -1 ) );
             nodeMenuItem := nodeMenuItem;
          end;
          // verificar se é uma opção que não está vinculada a um form e executá-la...
          // esta opção foi adicionada no novo parâmetro "link:" mas foi mantida aqui
          // a título de demonstração
          if nodeMenuItem = ansilowercase( mm.MNU_OTHERS_OPEN_TICKET ) then
          begin
               dm_rc.rc_OpenLink( 'https://app.radticket.com.br' );
          end;
     end;
end;

procedure TMainForm.rc_UpdateCharts;
begin
     //
end;

// v. 3.0.0.0
procedure TMainForm.rc_UpdateFloatButton;
begin
     //
end;
// v. 3.2.0.3
// resolver o conflito com "DELPHI align" e "UNIGUI alignClient"
// to solve a conflict with "DELPHI align" and "UNIGUI alignClient"
procedure TMainForm.rc_UpdateMainControls;
var
   oObj1, oObj2 : TObject;
begin
    oObj1 := rc_FindControl( 'paLayoutMainMenu' );
    if oObj1 <> nil then
    begin
       TUnicontrol( oObj1 ).Left  := 0;
       TUnicontrol( oObj1 ).Height:= Self.Height;
       oObj2 := rc_FindControl( 'paBackGround' );
       if oObj2 <> nil then
       begin
          TUnicontrol( oObj2 ).Left      := TUnicontrol( oObj1 ).Width;
          TUnicontrol( oObj2 ).Height    := Self.Height;
          TUnicontrol( oObj2 ).Width     := Self.Width - TUnicontrol( oObj1 ).Width;
       end;
    end
    else
    begin
       oObj1 := rc_FindControl( 'paBackGround' );
       if oObj1 <> nil then
       begin
          TUnicontrol( oObj1 ).Left      := 0;
          TUnicontrol( oObj1 ).Top       := 0;
          TUnicontrol( oObj1 ).Height    := Self.Height;
          TUnicontrol( oObj1 ).Width     := Self.Width;
       end;
    end;
end;

procedure TMainForm.rc_UpdateNotifications;
begin
     //
end;

initialization
  RegisterAppFormClass(TMainForm);

  UniAddCSSLibrary( 'css/flags/flags.css', False, [upoFolderFiles, upoPlatformBoth]);

  UniAddCSSLibrary( 'bootstrap-4.6.0/dist/css/bootstrap.min.css', False, [upoFolderFiles, upoPlatformBoth]);
  UniAddJSLibrary( 'bootstrap-4.6.0/dist/js/bootstrap.min.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);

//  UniAddJSLibrary( 'js/jquery-3.5.1/jquery.min.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);
//  UniAddJSLibrary( 'js/jquery-3.5.1/jquery-3.5.1.min.map', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);

//  UniAddCSSLibrary( 'js/jquery-ui-1.12.1/jquery-ui.min.css', False, [upoFolderFiles, upoPlatformBoth]);
//  UniAddJSLibrary( 'js/jquery-ui-1.12.1/jquery-ui.min.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);
//  UniAddJSLibrary( 'js/jquery-inputmask/jquery.inputmask.min.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);

//  UniAddJSLibrary( 'js/SweetAlert2/sweetalert2.min.css', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);
//  UniAddJSLibrary( 'js/SweetAlert2/sweetalert2.min.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);

  // gauges and graphs
  UniAddJSLibrary( 'js/tarefas/raphael-2.1.4.min.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);
  UniAddJSLibrary( 'js/tarefas/justgage.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);

  UniAddCSSLibrary( 'js/chart-js/dist/Chart.min.css', False, [upoFolderFiles, upoPlatformBoth]);
  UniAddJSLibrary( 'js/chart-js/dist/Chart.min.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);
  UniAddJSLibrary( 'js/chart-js/dist/utils.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);

  UniAddCSSLibrary( 'js/toasty/dist/toasty.css', False, [upoFolderFiles, upoPlatformBoth]);
  UniAddJSLibrary( 'js/toasty/dist/toasty.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);

  // v. 3.0.0.0
  UniAddCSSLibrary( 'js/chart-apex/dist/apexcharts.css', False, [upoFolderFiles, upoPlatformBoth]);
  UniAddJSLibrary( 'js/chart-apex/dist/apexcharts.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);
  UniAddJSLibrary( 'js/chart-apex/samples/assets/stock-prices.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);
  // v. 3.0.0.0( qrcode bug fix to solve )
  //UniAddJSLibrary( 'js/rc_qrcode/qrcode.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);
  //UniAddJSLibrary( 'js/rc_qrcode/html5-qrcode.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);
  //UniAddJSLibrary( 'js/rc_qrcode/rc-qrcode.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);

  // GSAP está em fase de testes pra testar a total compatibilidade.
  // Como cada usuário pode ter uma versão do uniGUI diferente, não tem como eu realizar todos os testes.
  //
  // GSAP is in the testing phase to test full compatibility.
  // As each user can have a different version of uniGUI, there is no way for me to perform all the tests.
  UniAddJSLibrary( 'js/gsap/gsap.min.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);
  UniAddJSLibrary( 'js/gsap/CSSRulePlugin.min.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);
  UniAddJSLibrary( 'js/gsap/CSSRulePlugin.min.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);
  UniAddJSLibrary( 'js/gsap/Draggable.min.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);
  UniAddJSLibrary( 'js/gsap/EaselPlugin.min.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);
  UniAddJSLibrary( 'js/gsap/EasePack.min.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);
  UniAddJSLibrary( 'js/gsap/MotionPathPlugin.min.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);
  UniAddJSLibrary( 'js/gsap/PixiPlugin.min.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);
  UniAddJSLibrary( 'js/gsap/ScrollToPlugin.min.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);
  UniAddJSLibrary( 'js/gsap/ScrollTrigger.min.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);
  UniAddJSLibrary( 'js/gsap/TextPlugin.min.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);
  // v. 3.4.0.0
  // callout
  UniAddJSLibrary( 'js/callout/callout.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);
  UniAddCSSLibrary( 'css/callout/theme/cartoon.css', False, [upoFolderFiles, upoPlatformBoth]);
  UniAddCSSLibrary( 'css/callout/theme/default.css', False, [upoFolderFiles, upoPlatformBoth]);
  UniAddCSSLibrary( 'css/callout/theme/fancy-info.css', False, [upoFolderFiles, upoPlatformBoth]);
  UniAddCSSLibrary( 'css/callout/theme/gray.css', False, [upoFolderFiles, upoPlatformBoth]);
  UniAddCSSLibrary( 'css/callout/theme/yellow.css', False, [upoFolderFiles, upoPlatformBoth]);
  UniAddCSSLibrary( 'css/callout/theme/danger.css', False, [upoFolderFiles, upoPlatformBoth]);
  UniAddCSSLibrary( 'css/callout/theme/warning.css', False, [upoFolderFiles, upoPlatformBoth]);
  UniAddCSSLibrary( 'css/callout/theme/info.css', False, [upoFolderFiles, upoPlatformBoth]);
  UniAddCSSLibrary( 'css/callout/theme/success.css', False, [upoFolderFiles, upoPlatformBoth]);
  //qrcode reader
  UniAddJSLibrary( 'js/rc_webcam/beep.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);
  UniAddJSLibrary( 'js/rc_webcam/jsQR.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);
  //barcode reader
  //UniAddJSLibrary( 'js/rc_barcode/zxing.min.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]); // v. 3.4.0.1
  //UniAddJSLibrary( 'js/rc_barcode/zxing.min.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);
  //UniAddJSLibrary( 'js/rc_barcode/rc_barcode.js', False, [upoFolderFiles, upoPlatformBoth, upoDefer]);
end.
