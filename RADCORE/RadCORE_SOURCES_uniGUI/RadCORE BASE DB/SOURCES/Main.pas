unit Main;// v. 4.0.0.0

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
  uniHTMLFrame, uniTreeView, uniTreeMenu, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Vcl.Dialogs, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  //----------[[RESTDATAWARE
//  uDWConstsData,
//  uRESTDWPoolerDB,
  //----------RESTDATAWARE]]
  IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  IdFTP, uniMultiItem, uniListBox, uniImageList, uniImage, Vcl.Imaging.pngimage,
  uniLabel, uniComboBox, uniEdit, uniPageControl, uniChart, uniScrollBox,
  uniButton, uniThreadTimer, uniURLFrame, uniBitBtn, uniBasicGrid,
  uniDBGrid, uniCanvas, uniMemo, uniDBMemo, Vcl.Menus, uniMainMenu; // v. 4.0.0.0

type
  TMainForm = class(TUniForm)
    sboxMain: TUniScrollBox;
    OpenImageDialog: TOpenDialog;
    htmlFrame: TUniHTMLFrame;
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
    labAdm: TUniLabel;
    labAppVersion: TUniLabel;
    labFullScr: TUniLabel;
    labFullScrExit: TUniLabel;
    paSearchTop: TUniContainerPanel;
    btnSearch: TUniLabel;
    paSearchEdit: TUniContainerPanel;
    SearchEdit: TUniEdit;
    paLayoutBgUser: TUniPanel;
    labUser: TUniLabel;
    paImgLoadMask: TUniContainerPanel;
    imgUser: TUniLabel;
    UniTreeMainMenu: TUniTreeMenu;
    procedure UniFormCreate(Sender: TObject);
    procedure UniTreeMainMenuClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure TabSheetClose(Sender: TObject; var AllowClose: Boolean);
    procedure labbtnExitClick(Sender: TObject);
    // v. 4.0.0.0
    //procedure paLayoutMainMenuResize(Sender: TUniControl; OldWidth,
    //  OldHeight: Integer);
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
    procedure labCompanyNameClick(Sender: TObject);
  // v. 3.3.0.1
  private
    { Private declarations }
    cLatitude, cLongitude : string;
    PSString : string;
    // v. 4.1.0.2
    cMSG_MOBILE_KB_ANYPLACE,
    cMSG_MENU_TRIGGER_ERROR,
    cMSG_MENU_TRIGGER_ERROR2,
    cMSG_MENU_CREATE_ERROR : string;
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
                                    pParent         : TComponent = nil ;
                                    pSync           : Boolean = true ; // v. 4.0.0.0
                                    pCloseMenu      : Boolean = false ); // v. 4.0.0.0

    procedure rc_GetGeoPosition;
    procedure rc_GetMyIP;

    //procedure rc_UpdateCharts; // v. 4.0.0.0
    procedure rc_UpdateNotifications;
    procedure rc_UpdateFloatButton;
    // v. 3.2.0.0
    procedure rc_UpdateMainControls;
    // v. 4.1.0.2
    procedure rc_MainMenuClick( sender : TObject );
  end;

function MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication,
  uMenu_BASICS, uMenu_TOOLS, uMenu_MOVEMENT, uMenu_OTHERS, uMenu_REPORTS,
  mkm_menus, untdm_rc,
  ServerModule, uVersion, mkm_func_web, //untFrmMensagemTour, // v. 3.0.0.0
  untFrmTHEMES, untFrmLookUp_Lite, mkm_graphs,
  mkm_gridblock, mkm_layout, mkm_anim, mkm_translate,untFrmBaseCRUD; // v. 4.1.0.0

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
// v. 4.1.0.0   ( in development )
procedure TMainForm.labCompanyNameClick(Sender: TObject);
begin
//     dm_rc.rc_ShowHideObject( labCompanyName,
//                              paCompanies,
//                              paLayoutMainMenu.Width + paLayoutTopo.Left + labCompanyName.Left ,//- paCompanies.width + 40
//                              ( labCompanyName.Height + 20 ),
//                              1,
//                              false,
//                              ( paCompanies.Tag = 0 ) );

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
// v. 4.0.0.6
procedure TMainForm.UniFormCreate(Sender: TObject);
begin
  // v. 4.1.0.2
  // translate messages
  case mm.varLT_Lang of

       ltpt_BR : begin
                   cMSG_MOBILE_KB_ANYPLACE := 'Click fora do campo de edição para fechar o teclado !';
                   cMSG_MENU_CREATE_ERROR  := 'Falha na criação do menu:';
                   cMSG_MENU_TRIGGER_ERROR  := 'Falha ao acionar uma opção do menu( índice:';
                   cMSG_MENU_TRIGGER_ERROR2 := '<h2 style="color: gray;text-align: center;">' + Copy( cMSG_MENU_TRIGGER_ERROR, 1, Pos( '(', cMSG_MENU_TRIGGER_ERROR ) - 1 ) + '</h2><br>' +
                                               '<strong>MENSAGEM</strong><br><hr>Classe do formulário não registrada<br><strong>' ;

                 end;
       lten_US, lten_GB   : begin
                   cMSG_MOBILE_KB_ANYPLACE := 'Click outside the edit field to close the keyboard !';
                   cMSG_MENU_CREATE_ERROR  := 'Failed to create the menu:';
                   cMSG_MENU_TRIGGER_ERROR  := 'Failed to trigger option in menu( index:';
                   cMSG_MENU_TRIGGER_ERROR2 := '<h2 style="color: gray;text-align: center;">' + Copy( cMSG_MENU_TRIGGER_ERROR, 1, Pos( '(', cMSG_MENU_TRIGGER_ERROR ) - 1 ) + '</h2><br>' +
                                               '<strong>MESSAGE</strong><br><hr>Unregistered form class<br><strong>' ;
                 end;
       ltes_ES   : begin
                   cMSG_MOBILE_KB_ANYPLACE := '¡Haz clic fuera del campo de edición para cerrar el teclado!';
                   cMSG_MENU_CREATE_ERROR  := 'Error al crear el menú:';
                   cMSG_MENU_TRIGGER_ERROR  := 'Error al activar una opción de menú (índice:';
                   cMSG_MENU_TRIGGER_ERROR2 := '<h2 style="color: gray;text-align: center;">' + Copy( cMSG_MENU_TRIGGER_ERROR, 1, Pos( '(', cMSG_MENU_TRIGGER_ERROR ) - 1 ) + '</h2><br>' +
                                               '<strong>MENSAJE</strong><br><hr>Clase de formulario no registrada<br><strong>' ;
                 end;
       ltfr_FR   : begin
                   cMSG_MOBILE_KB_ANYPLACE := 'Cliquez en dehors du champ d''édition pour fermer le clavier !';
                   cMSG_MENU_CREATE_ERROR  := 'Échec de la création du menu :';
                   cMSG_MENU_TRIGGER_ERROR  := 'Échec de l''activation d''une option de menu (index :';
                   cMSG_MENU_TRIGGER_ERROR2 := '<h2 style="color: gray;text-align: center;">' + Copy( cMSG_MENU_TRIGGER_ERROR, 1, Pos( '(', cMSG_MENU_TRIGGER_ERROR ) - 1 ) + '</h2><br>' +
                                               '<strong>MESSAGE</strong><br><hr>Classe de formulaire non enregistrée<br><strong>' ;
                 end;
       ltde_DE   : begin
                   cMSG_MOBILE_KB_ANYPLACE := 'Klicken Sie außerhalb des Bearbeitungsfeldes, um die Tastatur zu schließen!';
                   cMSG_MENU_CREATE_ERROR  := 'Das Menü konnte nicht erstellt werden:';
                   cMSG_MENU_TRIGGER_ERROR  := 'Fehler beim Aktivieren einer Menüoption ( index:';
                   cMSG_MENU_TRIGGER_ERROR2 := '<h2 style="color: gray;text-align: center;">' + Copy( cMSG_MENU_TRIGGER_ERROR, 1, Pos( '(', cMSG_MENU_TRIGGER_ERROR ) - 1 ) + '</h2><br>' +
                                               '<strong>BOTSCHAFT</strong><br><hr>Formularklasse nicht registriert<br><strong>' ;
                 end;
       ltit_IT   : begin
                   cMSG_MOBILE_KB_ANYPLACE := 'Clicca fuori dal campo di modifica per chiudere la tastiera!';
                   cMSG_MENU_CREATE_ERROR  := 'Impossibile creare il menu:';
                   cMSG_MENU_TRIGGER_ERROR  := 'Impossibile attivare un''opzione di menu ( index:';
                   cMSG_MENU_TRIGGER_ERROR2 := '<h2 style="color: gray;text-align: center;">' + Copy( cMSG_MENU_TRIGGER_ERROR, 1, Pos( '(', cMSG_MENU_TRIGGER_ERROR ) - 1 ) + '</h2><br>' +
                                               '<strong>MESSAGGIO</strong><br><hr>Classe modulo non registrata<br><strong>' ;
                 end;
       lttr_TR    : begin
                   cMSG_MOBILE_KB_ANYPLACE := 'Klavyeyi kapatmak için düzenleme alanının dışına tıklayın!';
                   cMSG_MENU_CREATE_ERROR  := 'Menü oluşturulamadı:';
                   cMSG_MENU_TRIGGER_ERROR  := 'Bir menü seçeneği etkinleştirilemedi ( index:';
                   cMSG_MENU_TRIGGER_ERROR2 := '<h2 style="color: gray;text-align: center;">' + Copy( cMSG_MENU_TRIGGER_ERROR, 1, Pos( '(', cMSG_MENU_TRIGGER_ERROR ) - 1 ) + '</h2><br>' +
                                               '<strong>İLETİ</strong><br><hr>Form sınıfı kayıtlı değil<br><strong>' ;
                 end;
       ltru_RU    : begin
                   cMSG_MOBILE_KB_ANYPLACE := 'Click outside the edit field to close the keyboard !';
                   cMSG_MENU_CREATE_ERROR  := 'Failed to create the menu:';
                   cMSG_MENU_TRIGGER_ERROR  := 'Failed to trigger option in menu( index:';
                   cMSG_MENU_TRIGGER_ERROR2 := '<h2 style="color: gray;text-align: center;">' + Copy( cMSG_MENU_TRIGGER_ERROR, 1, Pos( '(', cMSG_MENU_TRIGGER_ERROR ) - 1 ) + '</h2><br>' +
                                               '<strong>MESSAGE</strong><br><hr>Unregistered form class<br><strong>' ;
                 end;
       ltzn_CH : begin
                   cMSG_MOBILE_KB_ANYPLACE := 'Click outside the edit field to close the keyboard !';
                   cMSG_MENU_CREATE_ERROR  := 'Failed to create the menu:';
                   cMSG_MENU_TRIGGER_ERROR  := 'Failed to trigger option in menu( index:';
                   cMSG_MENU_TRIGGER_ERROR2 := '<h2 style="color: gray;text-align: center;">' + Copy( cMSG_MENU_TRIGGER_ERROR, 1, Pos( '(', cMSG_MENU_TRIGGER_ERROR ) - 1 ) + '</h2><br>' +
                                               '<strong>MESSAGE</strong><br><hr>Unregistered form class<br><strong>' ;
                 end;
       ltin_ID : begin
                   cMSG_MOBILE_KB_ANYPLACE := 'Click outside the edit field to close the keyboard !';
                   cMSG_MENU_CREATE_ERROR  := 'Failed to create the menu:';
                   cMSG_MENU_TRIGGER_ERROR  := 'Failed to trigger option in menu( index:';
                   cMSG_MENU_TRIGGER_ERROR2 := '<h2 style="color: gray;text-align: center;">' + Copy( cMSG_MENU_TRIGGER_ERROR, 1, Pos( '(', cMSG_MENU_TRIGGER_ERROR ) - 1 ) + '</h2><br>' +
                                               '<strong>MESSAGE</strong><br><hr>Unregistered form class<br><strong>' ;
                 end;
       ltth_TH : begin
                   cMSG_MOBILE_KB_ANYPLACE := 'Click outside the edit field to close the keyboard !';
                   cMSG_MENU_CREATE_ERROR  := 'Failed to create the menu:';
                   cMSG_MENU_TRIGGER_ERROR  := 'Failed to trigger option in menu( index:';
                   cMSG_MENU_TRIGGER_ERROR2 := '<h2 style="color: gray;text-align: center;">' + Copy( cMSG_MENU_TRIGGER_ERROR, 1, Pos( '(', cMSG_MENU_TRIGGER_ERROR ) - 1 ) + '</h2><br>' +
                                               '<strong>MESSAGE</strong><br><hr>Unregistered form class<br><strong>' ;
                 end;
       lthi_IN : begin
                   cMSG_MOBILE_KB_ANYPLACE := 'Click outside the edit field to close the keyboard !';
                   cMSG_MENU_CREATE_ERROR  := 'Failed to create the menu:';
                   cMSG_MENU_TRIGGER_ERROR  := 'Failed to trigger option in menu( index:';
                   cMSG_MENU_TRIGGER_ERROR2 := '<h2 style="color: gray;text-align: center;">' + Copy( cMSG_MENU_TRIGGER_ERROR, 1, Pos( '(', cMSG_MENU_TRIGGER_ERROR ) - 1 ) + '</h2><br>' +
                                               '<strong>MESSAGE</strong><br><hr>Unregistered form class<br><strong>' ;
                 end;
       ltar_SA : begin
                   cMSG_MOBILE_KB_ANYPLACE := 'Click outside the edit field to close the keyboard !';
                   cMSG_MENU_CREATE_ERROR  := 'Failed to create the menu:';
                   cMSG_MENU_TRIGGER_ERROR  := 'Failed to trigger option in menu( index:';
                   cMSG_MENU_TRIGGER_ERROR2 := '<h2 style="color: gray;text-align: center;">' + Copy( cMSG_MENU_TRIGGER_ERROR, 1, Pos( '(', cMSG_MENU_TRIGGER_ERROR ) - 1 ) + '</h2><br>' +
                                               '<strong>MESSAGE</strong><br><hr>Unregistered form class<br><strong>' ;
                 end;
  end;

  rc_BringToFront( paLayoutMainMenu ); // v. 4.0.0.4

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

  // v. 4.0.0.6
  //mm.CONFIG_LAYOUT_MENU_TYPE := '3';
  if mm.CONFIG_LAYOUT_MENU_TYPE = '1' then
  begin
     btnMenu.Hint :=
        '[[' +
        'ico:fas-bars 1x |' +
        'cls:rc-hover-zoom-1-2|' +
        'align:paLayoutMainMenu r:w-26 |' +
        ']]';
     // v. 4.0.0.0
     // [PT] Iniciar menu fechado
     // [EN] Start menu closed
     paLayoutMainMenu.Align := alNone;
     paLayoutMainMenu.Left := -paLayoutMainMenu.Width;
     paLayoutMainMenu.tag  := 0;
     //btnMenu.Left          := 44; // v. 4.0.0.5
     // [PT] Iniciar menu aberto
     // [EN] Start menu opened
     //paLayoutMainMenu.Left := 0;
     //paLayoutMainMenu.tag  := -1;
  end
  else
  if mm.CONFIG_LAYOUT_MENU_TYPE = '2' then
  begin
     btnMenu.Hint :=
        '[[' +
        'ico:fas-bars 1x |' +
        'cls:rc-hover-zoom-1-2|' +
        //'align:paLayoutMainMenu r:w-26 |' +
        ']]';
     // v. 4.0.0.0
     // [PT] Iniciar menu fechado
     // [EN] Start menu closed
     paLayoutMainMenu.Align := alLeft;
     paLayoutMainMenu.Left  := 0;//-paLayoutMainMenu.Width;
     paLayoutMainMenu.Width := 40;
     paLayoutMainMenu.tag   := 0;
     UniTreeMainMenu.Micro  := True;
     paBackGround.Align     := alClient;
     //btnMenu.Left           := 44;
     // [PT] Iniciar menu aberto
     // [EN] Start menu opened
     //paLayoutMainMenu.Left := 0;
     //paLayoutMainMenu.tag  := -1;
  end
  else
  if mm.CONFIG_LAYOUT_MENU_TYPE = '3' then
  begin
     btnMenu.Hint :=
        '[[' +
        'ico:fas-bars 1x |' +
        'cls:rc-hover-zoom-1-2|' +
        //'align:paLayoutMainMenu r:w-26 |' +
        ']]';

     // v. 4.0.0.0
     // [PT] Iniciar menu fechado
     // [EN] Start menu closed
     //paLayoutMainMenu.Align := alLeft;
     paLayoutMainMenu.Left  := 0;//-paLayoutMainMenu.Width;
     paLayoutMainMenu.tag   := 0;
     //paBackGround.Align     := alClient;
     //UniTreeMainMenu.Micro  := True;
     //btnMenu.Left           := 0;
     // [PT] Iniciar menu aberto
     // [EN] Start menu opened
     //paLayoutMainMenu.Left := 0;
     //paLayoutMainMenu.tag  := -1;
  end;
  mm.MNU_STATE  := paLayoutMainMenu.tag.ToString;

  labAppName.Caption     := APP_NAME;
  labAppVersion.Caption  := 'v.' + FileVersion + ' [ ' + mm.CONFIG_APP_TYPE + ' ]';
  labUser.Caption        := mm.vUserName ;
  labCompanyName.Caption := mm.varC_CompanyName;
  (*<prj-nousersform>*)labAdm.Visible := dm_rc.memUsers.FieldByName('master').AsString = mm.VALUE_YES; // v. 4.0.0.0
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

     // v. 4.0.0.0
     rc_AddCssClass( labUser   , 'shadow-text unselectable' );
     rc_AddCssClass( labAppName, 'shadow-text unselectable' );
     rc_AddCssClass( labAppName, 'rc-font-light' );
//     labUser.JSInterface.JSCall( 'addCls' , ['shadow-text']);
//     labAppName.JSInterface.JSCall( 'addCls' , ['shadow-text']);
//     // remove BOLD
//     labAppName.JSInterface.JSCall( 'addCls' , ['rc-font-light']);

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
     mm.varA_FSideMenu[ 0 ].GenID        := false;
     mm.varA_FSideMenu[ 0 ].NotShow      := false; // v. 4.0.0.0
     mm.varA_FSideMenu[ 0 ].Master       := false; // v. 4.0.0.0
     // v. 3.2.0.0
     rc_Translate( Self, nil , '' , mm.CONFIG_LANGUAGE );
     rc_ConfigTranslateMessages;
     mm.varI_NumMenu    := 1;
     // v. 4.1.0.2
     try
        dm_rc.rc_BuildMainMenu( '', UniTreeMainMenu );
     except on e:exception do
            begin
              dm_rc.rc_ShowError( cMSG_MENU_CREATE_ERROR + e.Message ); // v. 4.1.0.2
            end;
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
// v. 4.0.0.0
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

            if ( mm.varC_Form_Detail = nil ) and ( mm.varC_Form_Modal = nil ) then
               dm_rc.rc_DBGridUpdateAll( oObj ) //, true, true, true )
            else
            if ( mm.varC_Form_Modal = nil ) then
               dm_rc.rc_DBGridUpdateAll( mm.varC_Form_Detail ) //, true, true, true )
            else
            if rc_FindControl( mm.varC_Form_Modal.Name ) <> nil then
               dm_rc.rc_DBGridUpdateAll( mm.varC_Form_Modal );//, false, true, false );
        end
        else
        begin
            rc_AdjustFormsSize( pMainMenu ) ;
            dm_rc.rc_ResizeBlocks( Self );

            if ( mm.varC_Form_Detail = nil ) and ( mm.varC_Form_Modal = nil ) then
               dm_rc.rc_DBGridUpdateAll( oObj) //, true, true, true )
            else
            if ( mm.varC_Form_Modal = nil ) then
               dm_rc.rc_DBGridUpdateAll( mm.varC_Form_Detail) //, true, true, true )
            else
            if rc_FindControl( mm.varC_Form_Modal.Name ) <> nil then
               dm_rc.rc_DBGridUpdateAll( mm.varC_Form_Modal) //, true, true, true  );
        end;
        // v. 4.0.0.0
        // [PT] existe form/frame adicionado em um objeto ?
        // [EN] is there a form/frame added to an object?
        rc_UpdateFormsInsideContainers;
        // v. 4.0.0.0
        //rc_UpdateCharts;  - in tests
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
// v. 3.3.1.0
procedure TMainForm.btnCfgClick(Sender: TObject);
begin
     // v. 3.3.1.0
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
     // with PERMISSION CONTROL
//     if dm_rc.rc_PermissionVerify( 'System Configuration' ,
//                                   Trim( 'system_config' ) ,
//                                   PT_ACCESS ) then
//     begin
//       rc_AddCssClass( frmThemes, 'form-noborder' );
//       frmThemes.Show( procedure(Sender: TComponent; Result:Integer)
//                              begin
//                                //callback....nesse caso, não é necessário tratar o retorno
//                              end
//                            );
//     end;
end;
// v. 4.1.0.2
procedure TMainForm.btnMenuClick(Sender: TObject);
begin
     rc_MainMenuClick( sender );
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
// v. 4.0.0.0
procedure TMainForm.htmlFrameAjaxEvent(Sender: TComponent; EventName: string;  Params: TUniStrings);
var
   pQryMaster : TFDQuery;
   pDsMaster  : TDataSource;

   pFrame, pFrame2 : TObject;

   pLabel : TUniLabel;
   cFrameFormInParent, // v. 4.0.0.0
   pVariacaoCep, cTemp, cTemp2, cTemp3, cDataSource, cQuery,
   FClassName: string;
   oHfRequired : TUniHTMLFrame; // v. 3.4.0.0
   oLabel      : TUniLabel; // v. 3.4.0.0
   pObj : TUniControl;
   oSBox : TUniScrollBox; // v. 3.3.3.2
   oScrollBlock : TObject; // v. 4.0.0.0
   // v. 3.1.0.61
   bAbort       : boolean;
   pPageControl : TUniPageControl;

   i, x, y : integer; // v. 4.0.0.0
   pt : tPoint;// v. 4.0.0.0
begin
   // v. 4.0.0.0
   if EventName <> '' then
   begin
      //if dm_rc.rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close; // v. 4.0.0.0

      pQryMaster  := nil;
      pDsMaster   := nil;
      cDataSource := '';
      cQuery      := '';
      // v. 4.0.0.0
      if (EventName = '_actionCol') then
      begin
          FClassName := Params.Values['form'];
          cTemp      := Params.Values['btn'];
          x          := StrToIntDef( Params.Values['x'], 0 );
          y          := StrToIntDef( Params.Values['y'], 0 );
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
              pObj := TUniControl( TComponent( pFrame ).FindComponent( cTemp ) );
              if pObj <> nil then
              begin
                 if pObj is TUniBitBtn then
                    TUniBitBtn( pObj ).Click
                 else
                 begin
                    pt := Mouse.CursorPos;
                    if mm.varB_Mobile_Screen then
                       TUniPopupMenu( pObj ).Popup( pt.x , pt.y - 190, nil )
                    else
                    if mm.varC_Form_Detail <> nil then
                       TUniPopupMenu( pObj ).Popup( pt.x , pt.y - 170, nil )
                    else
                       TUniPopupMenu( pObj ).Popup( pt.x , pt.y - 120, nil );
                 end;
              end;
          end;
      end
      else
      // v. 4.0.0.0
      if (EventName = '_CopyToClipBoard') then
      begin
          cTemp := Params.Values['content'];
          // based on: https://qawithexperts.com/article/javascript/creating-copy-to-clipboard-using-javascript-or-jquery/364
          UniSession.AddJS( 'function copyToClipboard(text) {' +
                            'var sampleTextarea = document.createElement("textarea");'+
                            'document.body.appendChild(sampleTextarea);'+
                            'sampleTextarea.value = text;' +
                            'sampleTextarea.select();' +
                            'document.execCommand("copy");' +
                            'document.body.removeChild(sampleTextarea);' +
                            '}' +
                            'copyToClipboard(' + QuotedStr( cTemp ) + ');' );
          dm_rc.rc_ShowToaster( 'info', 'Copied to clipboard: ' + cTemp + ' !', false, 'pinItUp' );
      end
      else
      if (EventName = '_onFocus') then
      begin
          FClassName := Params.Values['pform'];
          // v. 4.0.0.0
          if FClassName <> 'frmLookUp_Lite' then
          begin
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
                // v. 4.0.0.0
                if FClassName <> 'frmLookUp_Lite' then
                   if dm_rc.rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;

                pObj := rc_FindControl( Params.Values[ 'pobj' ], pFrame );// v. 3.3.1.0 // TUniControl( TComponent(pFrame).FindComponent( Params.Values[ 'pobj' ] ) ); // v. 3.3.0.1

                if pObj <> nil then
                begin
                    // v. 4.0.0.0
                    If Pos( 'inputico:', pObj.Hint ) > 0 then
                    begin
                       rc_RemoveCssClass( pObj , 'inputWithIcon' + varIIF( mm.RTL, '-rtl', '' ) + ' inputIconBg' + varIIF( mm.RTL, '-rtl', '' ) );
                       rc_AddCssClass( pObj , 'inputWithIconFocus' + varIIF( mm.RTL, '-rtl', '' ) + ' inputIconBg' + varIIF( mm.RTL, '-rtl', '' ) );
                    end;
                end;
             end;
             // v. 4.0.0.0
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
                // v. 4.0.0.0
                if ( pos( 'form-label:', pObj.hint ) > 0 ) then
                begin
                   oLabel := TUniLabel( TComponent(pFrame).FindComponent('rc__FormLabel' + pObj.Name) );
                   if ( oLabel <> nil ) then //and ( TUniEdit(pObj).Text = '' ) then
                   begin
                        if ( pos( 'form-label:top-in', pObj.hint ) > 0 ) then
   //                        rc_jQueryAnimate( oLabel , 'top'  , IntToStr( oLabel.Top - 18 ) , '350' )
                           if ( pObj is TUniMemo ) or ( pObj is TUniDBMemo ) then
                              rc_jQueryAnimate( oLabel , 'top'  , IntToStr( oLabel.Top - 18 ) , '350' )
                           else
                              rc_jQueryAnimate( oLabel , 'top'  , IntToStr( oLabel.Top - ( ( pObj.Height div 2 ) + 3 ) ) , '350' )
                        else
                        if ( pos( 'form-label:top', pObj.hint ) > 0 ) then
   //                        rc_jQueryAnimate( oLabel , 'top'  , IntToStr( oLabel.Top - 26 ) , '350' );
                           if ( pObj is TUniMemo ) or ( pObj is TUniDBMemo ) then
                              rc_jQueryAnimate( oLabel , 'top'  , IntToStr( oLabel.Top - 26 ) , '350' )
                           else
                              rc_jQueryAnimate( oLabel , 'top'  , IntToStr( oLabel.Top - ( pObj.Height - 4 ) ) , '350' );
                   end;
                end;
             end;
             // v. 4.0.0.0
             if ( mm.varB_Mobile_Screen ) and ( ( mm.varB_Android ) or ( mm.varB_Tablet ) or ( mm.varB_iOS ) ) and ( ( pFrame <> nil ) or ( lowercase( fClassName ) = 'mainform' ) ) then
             begin
                 // v. 4.0.0.1( thanks to ExtJS: ISRAEL PORTILLO from Mexico )
                 cTemp3 := ( rc_GetHintProperty( 'keyboard:', pObj.Hint ) );
                 if cTemp3 = '' then
                 begin
                    oScrollBlock := rc_GetScrollBoxForMobileKeyboard( pObj );
                    if oScrollBlock <> nil then
                    begin
                       oSBox := TUniScrollBox( oScrollBlock );
                       if oSBox <> nil then
                       begin
                          if mm.varB_Mobile_Screen_Portrait then
                             x := 310
                          else
                             x := 190;

                          oSBox.Align := alNone;
                          oSBox.Top   := 0;
                          oSBox.Left  := 0;
                          oSBox.Height := oSBox.Parent.Height - x;//260;
                          //oSBox.Height := oSBox.Parent.Height - 260;
                          oSBox.Width  := oSBox.Parent.Width;
                          //oSBox.Tag    := -99999;
                          dm_rc.rc_ShowToaster( 'warning', cMSG_MOBILE_KB_ANYPLACE, false, 'pinItUp' ); // v. 4.1.0.2
                       end;
                    end;
                 end;
             end;
          end;
      end
      else
      if (EventName = '_onBlur') then
      begin
          FClassName := Params.Values['pform'];
          // v. 4.0.0.0
          if FClassName <> 'frmLookUp_Lite' then
          begin

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
                    // v. 4.0.0.0
                    If Pos( 'inputico:', pObj.Hint ) > 0 then
                    begin
                       rc_RemoveCssClass( pObj , 'inputWithIconFocus' + varIIF( mm.RTL, '-rtl', '' ) + ' inputIconBg' + varIIF( mm.RTL, '-rtl', '' ) );
                       rc_AddCssClass( pObj , 'inputWithIcon' + varIIF( mm.RTL, '-rtl', '' ) + ' inputIconBg' + varIIF( mm.RTL, '-rtl', '' ) );
                    end;
                end;
             end;
             // v. 4.0.0.0
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
             // v. 4.0.0.0
             if ( mm.varB_Mobile_Screen ) and ( ( mm.varB_Android ) or ( mm.varB_Tablet ) or ( mm.varB_iOS ) ) and ( ( pFrame <> nil ) or ( lowercase( fClassName ) = 'mainform' ) ) then
             begin
                 // v. 4.0.0.1( thanks to ExtJS: ISRAEL PORTILLO from Mexico )
                 cTemp3 := ( rc_GetHintProperty( 'keyboard:', pObj.Hint ) );
                 if cTemp3 = '' then
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
          bAbort := false; // v. 3.2.0..7
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
                                      if ( cTemp <> 'tabDashBoard' ) then
                                      begin
                                         bAbort := dm_rc.rc_CloseTab( MainForm, Params.Values['pgcontrol'], cTemp );
                                      end;
                                 end;
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
                                      bAbort := dm_rc.rc_CloseTab( pFrame, Params.Values['pgcontrol'], cTemp );
                                 end;
                              Dec( i );
                         end;
                    end;
                 end;
              end;
              // v. 4.0.0.0
              if UniApplication.FindComponent('MainForm' ) <> nil then
                 if mm.oPgGeneral <> nil then
                    if mm.oPgGeneral.ActivePageIndex = 0 then
                    begin
                       dm_rc.rc_ResizeBlocks( MainForm );
                       rc_UpdateFormsInsideContainers;
                       // v. 4.0.0.0  - in tests
                       //rc_UpdateCharts;
                    end;

              pFrame2 := rc_FindControl( Copy( FClassName, 5, 100 ) );

              if pFrame2 <> nil then
              begin
                 dm_rc.rc_ResizeBlocks( pFrame2, true, true, false ); // v. 4.0.0.0
              end
              else // bsPill dentro de outros forms/frames
              begin
                   FClassName := Params.Values['form'];
                   pFrame2 := rc_FindControl( FClassName );
                   if FClassName <> 'MainForm' then
                   begin
                      pFrame2 := rc_FindControl( FClassName );
                      if pFrame2 <> nil then
                         dm_rc.rc_ResizeBlocks( pFrame2, true, true, false ); // v. 4.0.0.0
                   end;
              end;
//              rc_UpdateCharts; // v. 4.0.0.0
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
                    pQryMaster := TFDQuery( TComponent( pFrame ).FindComponent( cQuery ) );

                    if pQryMaster <> nil then
                       if ( pQryMaster.State in [dsInsert, dsEdit ] ) and ( Params.Values[ 'field' ] <> '' ) then
                       begin
                            try
                               if DataTypeIsNumber( pQryMaster.FieldByName( Params.Values[ 'field' ] ).DataType ) then
                                  pQryMaster.FieldByName( Params.Values[ 'field' ] ).Value := pObj.tag
                               else
                                  if pObj.tag = 0 then
                                     pQryMaster.FieldByName( Params.Values[ 'field' ] ).Value := mm.VALUE_NO
                                  else
                                     pQryMaster.FieldByName( Params.Values[ 'field' ] ).Value := mm.VALUE_YES;
                            except on e:exception do
                                   begin
                                        dm_rc.rc_ShowError( 'Field: ' + Params.Values[ 'field' ] + ' ' + e.Message )
                                   end;
                            end;
                       end;
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

                            if lowercase( TComponent(pFrame).Name ) = 'mainform' then
                               dm_rc.rc_BootStrapRender( MainForm , ( pQryMaster <> nil ), TUniLabel( TComponent(pFrame).Components[i] ) )
                            else
                               dm_rc.rc_BootStrapRender( pFrame , ( pQryMaster <> nil ) , TUniLabel( TComponent(pFrame).Components[i] ) );
                         end;
                      end;
                  end;
              end;

              pLabel := TUniLabel( TComponent(pFrame).FindComponent( Params.Values[ EventName ] ) );

              // set tag = 1 to Item Selected
              pLabel.Tag := 1;

              cQuery     := Params.Values[ lowercase( 'query' ) ];
              pQryMaster := TFDQuery( TComponent( pFrame ).FindComponent( cQuery ) );

              if pQryMaster <> nil then
                 if ( pQryMaster.State in [dsInsert, dsEdit ] ) and ( Params.Values[ 'field' ] <> '' ) then
                 begin
                      try
                         if DataTypeIsNumber( pQryMaster.FieldByName( Params.Values[ 'field' ] ).DataType ) then
                         begin
                            pQryMaster.FieldByName( Params.Values[ 'field' ] ).Value := Params.Values[ 'value' ].ToInteger;
                         end
                         else
                         begin
                            if pLabel.tag = 0 then
                               pQryMaster.FieldByName( Params.Values[ 'field' ] ).Value := ''
                            else
                               pQryMaster.FieldByName( Params.Values[ 'field' ] ).Value := Params.Values[ 'value' ];
                         end;
                      except on e:exception do
                             begin
                                  dm_rc.rc_ShowError( 'Field: ' + Params.Values[ 'field' ] + ' ' + e.Message )
                             end;
                      end;
                 end;

              if lowercase( TComponent(pFrame).Name ) = 'mainform' then
                 dm_rc.rc_BootStrapRender( MainForm , ( pQryMaster <> nil ), pLabel )
              else
                 dm_rc.rc_BootStrapRender( pFrame , ( pQryMaster <> nil ) , pLabel );
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
           // pegar a referencia do FRAME ATUAL
           FClassName := Params.Values['form'];

           pVariacaoCep := Params.Values['tipocep'];

           pFrame := rc_FindControl( FClassName );

           if pFrame <> nil then
           begin
               pQryMaster := TFDQuery( TComponent( pFrame ).FindComponent( Params.Values['qry'] ) );

               if pQryMaster <> nil then
                  if pQryMaster.State in [dsInsert, dsEdit ] then
                  begin
                       if pQryMaster.FieldList.IndexOf ( 'endereco' + pVariacaoCep ) >= 0 then
                          pQryMaster.FieldByName( 'endereco' + pVariacaoCep ).AsString  := Params.Values['rua'];

                       if pQryMaster.FieldList.IndexOf ( 'bairro' + pVariacaoCep ) >= 0 then
                          pQryMaster.FieldByName( 'bairro' + pVariacaoCep ).AsString    := Params.Values['bairro'];

                       // no cad. que tem CEP...UF e CIDADE sao vinculadas a um CODIGO e nao a DESCRICAO LIVRE
                       if pQryMaster.FieldList.IndexOf ( 'codiuf' + pVariacaoCep ) >= 0 then
                       begin
                          dm_rc.memTemp.Close;
                          dm_rc.memTemp.Data := dm_rc.rc_GetRecord( mm.varB_Use_FireDac ,
                                                                     false,
                                                                     ' select codigo, descricao ' +
                                                                     ' from ufs ' +
                                                                     ' where descricao = ' + QuotedStr( Params.Values['uf'] ) );
                          if mm.varC_LastErrorMsg <> '' then
                          begin
                              dm_rc.rc_ShowError( mm.varC_LastErrorMsg );
                              Exit;
                          end
                          else
                              pQryMaster.FieldByName( 'codiuf' + pVariacaoCep ).AsString    := dm_rc.memTemp.FieldByName('codigo').AsString;
                       end
                       else
                          pQryMaster.FieldByName( 'uf' + pVariacaoCep ).AsString    := Params.Values['uf'];

                       if pQryMaster.FieldList.IndexOf ( 'codicidade' + pVariacaoCep ) >= 0 then
                       begin
                          dm_rc.memTemp.Close;
                          dm_rc.memTemp.Data := dm_rc.rc_GetRecord( mm.varB_Use_FireDac ,
                                                                     false,
                                                                     ' select codigo, descricao ' +
                                                                     ' from cidades ' +
                                                                     ' where descricao = ' + QuotedStr( ansiuppercase( Params.Values['cidade']  ) ) );
                          if mm.varC_LastErrorMsg <> '' then
                          begin
                              dm_rc.rc_ShowError( mm.varC_LastErrorMsg );
                              Exit;
                          end
                          else
                              pQryMaster.FieldByName( 'codicidade' + pVariacaoCep ).AsString    := dm_rc.memTemp.FieldByName('codigo').AsString;
                       end
                       else
                          pQryMaster.FieldByName( 'cidade' + pVariacaoCep ).AsString := Params.Values['cidade'];

                       // codiibge nao vai existir em todas telas q tem pesquisa de cep
                       if pQryMaster.FieldList.IndexOf ( 'codiibge' + pVariacaoCep ) >= 0 then
                          pQryMaster.FieldByName( 'codiibge' + pVariacaoCep ).AsInteger := StrToIntDef( Params.Values['ibge'], 0 );

                       dm_rc.rc_LookUpUpdateData( pFrame );
                  end;
           end;
      end
      else
      if EventName = '_DadosCepErro'  then
      begin
          dm_rc.rc_ShowError( 'Falha na consulta do CEP ou CEP Inválido' );
      end
      else
      if EventName = '_PositionXY'  then
      begin
          //dm_rc.rc_ShowMessage( 'obj tour:' + Params.Values['PosX'] + ' - ' + Params.Values['PosY'] );

    //      ed_X.Text := Params.Values['PosX'];
    //      ed_Y.Text := Params.Values['PosY'];

    //      pForm     := TUniForm( Params.Values['Form'] );
    //
    //      paObjTour := TUniControl( pForm.FindComponent( Params.Values['ObjetoAtual'] ));
    //
    //      paObj2 := TUniContainerPanel( MainForm.FindComponent( 'paObjFeatured' ) );
    //      paObj2.Top    := StrToIntDef( MainForm.ed_Y.Text, 0 );
    //      paObj2.Left   := StrToIntDef( MainForm.ed_X.Text, 0 );
    //      paObj2.Width  := TUniControl( paObjTour ).Width;
    //      paObj2.Height := TUniControl( paObjTour ).Height;
    //
    //      paObj3 := TUniContainerPanel( pForm.FindComponent( 'paMessage' ) );
    //
    //      paObj3.Top  := StrToIntDef( MainForm.ed_Y.Text, 0 );
    //      paObj3.Left := StrToIntDef( MainForm.ed_X.Text, 0 );
      end;
   end;
end;
// v. 4.1.0.2
procedure TMainForm.rc_MainMenuClick( sender : TObject );
var
   iMenuW : integer;
   oObj : TUniControl;
   oFrameFormInParent : TObject; // v. 3.4.0.0
   cFrameFormInParent : string; // v. 3.4.0.0
begin
(*
mm.CONFIG_LAYOUT_MENU_TYPE
1 botão menu apenas
2 botão menu e os ícones principais
3 modelo acoplado
4 modelo horizontal
*)
     if mm.CONFIG_LAYOUT_MENU_TYPE = '1' then
        iMenuW := paLayoutMainMenu.Width;
//     else
//        iMenuW := paLayoutMainMenu.Width - 36;

     // v. 4.0.0.4 // future implementation...
     if mm.CONFIG_LAYOUT_MENU_TYPE = '1' then
     begin
           if paLayoutMainMenu.tag = 0 then
           begin
              paLayoutMainMenu.tag := -1;
              if not mm.RTL then
              begin
                 rc_Anim( paLayoutMainMenu, 'left', '0', '0.4', gsEasePower1, '0.4', gsEaseTypeOut );
                 rc_Anim( btnMenu, 'left', ( paLayoutMainMenu.Width ).ToString, '0.4', gsEasePower1, '0.4', gsEaseTypeOut );
              end
              else
              begin
                 rc_Anim( paLayoutMainMenu, 'right', ( 0 ).ToString , '0.4', gsEasePower1, '0.4', gsEaseTypeOut );
                 rc_Anim( btnMenu, 'right', ( paLayoutMainMenu.Width ).ToString , '0.4', gsEasePower1, '0.4', gsEaseTypeOut );
              end;
           end
           else
           if paLayoutMainMenu.tag = -1 then
           begin
              paLayoutMainMenu.tag := 0;
              if not mm.RTL then
              begin
                 rc_Anim( paLayoutMainMenu, 'left', '-' + paLayoutMainMenu.Width.ToString, '0.4', gsEasePower1, '0.4', gsEaseTypeOut );
                 rc_Anim( btnMenu, 'left', '4' , '0.4', gsEasePower1, '0.4', gsEaseTypeOut );
              end
              else
              begin
                 rc_Anim( paLayoutMainMenu, 'right', ( paLayoutMainMenu.left ).ToString , '0.4', gsEasePower1, '0.4', gsEaseTypeOut );
                 rc_Anim( btnMenu, 'right', ( btnMenu.left ).ToString , '0.4', gsEasePower1, '0.4', gsEaseTypeOut );
              end;
           end;
     end
     else
     if mm.CONFIG_LAYOUT_MENU_TYPE = '2' then
     begin
        if paLayoutMainMenu.tag = 0 then
        begin
           paLayoutMainMenu.tag := -1;
           rc_jQueryAnimate( paLayoutMainMenu, 'width' , '100%', '200' );
           rc_Anim( btnMenu, 'left', ( paLayoutMainMenu.Width ).ToString, '0.4', gsEasePower1, '0.4', gsEaseTypeOut );
        end
        else
        if paLayoutMainMenu.tag = -1 then
        begin
           paLayoutMainMenu.tag := 0;
           rc_jQueryAnimate( paLayoutMainMenu, 'width' , '15%', '250' );
           rc_Anim( btnMenu, 'left', '4' , '0.4', gsEasePower1, '0.4', gsEaseTypeOut );
        end;
     end
     else
     if mm.CONFIG_LAYOUT_MENU_TYPE = '3' then
     begin
        // v. 4.1.0.2
        if TUniControl( sender ).Name = 'btnMenu' then
        begin
           if paLayoutMainMenu.Width > 0 then
              paLayoutMainMenu.Width := 0
           else
              paLayoutMainMenu.Width := 260;
        end;
        //clicou no MENU
        paLayoutMainMenu.tag := 1;
        // v. 3.2.0.0
        rc_UpdateMainControls;

        rc_AdjustFormsSize( paLayoutMainMenu );

        sboxMain.DoAlignControls; // Feedback from Farshad

        if mm.oPgGeneral <> nil then
           dm_rc.rc_ResizeBlocks( rc_FindControl( dm_rc.rc_GetActiveFormFrameNameInMainTab ) );// v. 3.3.3.0 //   Copy( mm.oPgGeneral.ActivePage.Name , 5, 100 ) ) );
        // [PT] existe form/frame adicionado em um objeto ?
        // [EN] is there a form/frame added to an object?
        rc_UpdateFormsInsideContainers;
     end;
     mm.MNU_STATE  := paLayoutMainMenu.tag.ToString; // v. 4.0.0.4
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
// v. 4.0.0.0
//procedure TMainForm.paLayoutMainMenuResize(Sender: TUniControl; OldWidth,
//  OldHeight: Integer);
//begin
//     if mm.oPgGeneral <> nil then
//        dm_rc.rc_ResizeBlocks( rc_FindControl( dm_rc.rc_GetActiveFormFrameNameInMainTab ) );// v. 3.3.3.0 //Copy( mm.oPgGeneral.ActivePage.Name , 5, 100 ) ) );

//     rc_UpdateCharts;
//end;
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
      //dm_rc.rc_ShowSweetAlertError('pgGeneralChangeValue<br><br>' + e.message ); // v. 4.0.0.6
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
     // v. 4.0.0.0
     if mm.oPgGeneral <> nil then
     begin
        dm_rc.rc_ResizeBlocks( rc_FindControl( dm_rc.rc_GetActiveFormFrameNameInMainTab ) );// v. 3.3.3.0 //Copy( mm.oPgGeneral.ActivePage.Name , 5, 100 ) ) );
        rc_UpdateFormsInsideContainers;
     end;
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
     rc_AddFormFrameInTab( UniTreeMainMenu, '', '', '', false, false, aftNone, 0, nil, true, true ); // v. 4.0.0.0
end;
// v. 4.1.0.0
procedure TMainForm.rc_AddFormFrameInTab(
             pMenu : TUniTreeMenu ;
             pFormFrameTitle, pTableName, pFormFrameName : string ;
             pIsMenuReport, pIsModal : Boolean ;
             pCallFormOp : TRCAddFormParamType ;
             pRecord : integer;
             pParent : TComponent ;
             pSync: Boolean  ; // v. 4.0.0.0
             pCloseMenu   : Boolean  ); // v. 4.0.0.0
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
        bFormWithoutCRUD                          := false; // v. 4.1.0.0
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
                 mm.varC_PK_MasterTable := dm_rc.rc_GetPrimaryKey( mm.varC_Table_Search.ToLower );
           end;
        end;
   end;

   procedure rc_SetOptionParams; overload;
   var
      cT, nodeMenuItemGeneric,
      cMenuOpt : string;
   begin
        bModal                                    := pIsModal;
        bFormWithoutCRUD                          := false; // v. 4.1.0.0
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
              mm.varC_PK_MasterTable := dm_rc.rc_GetPrimaryKey( mm.varC_Table_Search.ToLower );
        end;
   end;
begin
     // v. 3.2.0.8
     if dm_rc.rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;

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
                         dm_rc.rc_ShowError( '<h2 style="color: gray;text-align: center;">' + cMSG_MENU_TRIGGER_ERROR + f.ToString + ') !</h2><br>' + // v. 4.1.0.2
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
            // v. 4.0.0.0
            if pSync then
               UniSession.Synchronize();
         end;

         mm.varC_FormSource_Search     := FClassName;
         // v. 4.1.0.1
         // [PT] Se desejar manter o menu aberto quando clicar em uma opção que já está sendo executada,
         //      descomente as linhas que estão comentadas abaixo
         // [EN] If you want to keep the menu open when clicking on an option that is already running,
         //       uncomment the lines that are commented out below
         uniTreeMainMenu.tag := 0;
         //if not Assigned(Ts) then
         //begin
            if pMenu <> nil then
               rc_MainMenuClick( Self ); // v. 4.1.0.2
         //end
         //else
         //   uniTreeMainMenu.tag := 1;

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
                         // v. 4.1.0.1
                         if uniTreeMainMenu.tag = 0 then
                            dm_rc.rc_BootStrapRender( self )  // feedback by CENK VAROL( Turkey )
                         else
                         begin
                             if mm.CONFIG_LAYOUT_MENU_TYPE = '3' then
                             begin
                                //clicou no MENU
                                paLayoutMainMenu.tag := 0;//1;
                                rc_UpdateMainControls;

                                rc_AdjustFormsSize( paLayoutMainMenu );

                                sboxMain.DoAlignControls; // Feedback from Farshad

                                if mm.oPgGeneral <> nil then
                                   dm_rc.rc_ResizeBlocks( rc_FindControl( dm_rc.rc_GetActiveFormFrameNameInMainTab ) );// v. 3.3.3.0 //   Copy( mm.oPgGeneral.ActivePage.Name , 5, 100 ) ) );
                                // [PT] existe form/frame adicionado em um objeto ?
                                // [EN] is there a form/frame added to an object?
                                rc_UpdateFormsInsideContainers;
                             end;
                         end;
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
                                   aftInsert  : Fr.Tag    := 1;
                                 end;
                                 t := StrToIntDef( oObj.Hint, 0 );
                                 if t <> 0 then
                                 begin
                                      if TUniComboBox( Fr.FindComponent('cbxSearchCRUDField1') ) <> nil then
                                         TUniComboBox( Fr.FindComponent('cbxSearchCRUDField1') ).ItemIndex := 0;
                                      // v. 4.0.0.0
                                      //if TUniEdit( Fr.FindComponent('edSearchCRUD1') ) <> nil then
                                      //   TUniEdit( Fr.FindComponent('edSearchCRUD1') ).Text := IntToStr( t );
                                      //if TUniBitBtn( Fr.FindComponent('btnSearchCRUD') ) <> nil then
                                      //   TUniBitBtn( Fr.FindComponent('btnSearchCRUD') ).Click;
                                      if Pos( 'model-crud:1', TUniDBGrid( Fr.FindComponent('dbgSearchCRUD') ).Hint ) > 0 then
                                      begin
                                         if TUniEdit( Fr.FindComponent('edQuickSearch') ) <> nil then
                                            TUniEdit( Fr.FindComponent('edQuickSearch') ).Text := IntToStr( t );

                                         TUniBitBtn( Fr.FindComponent('btnQuickSearch') ).Click;
                                      end
                                      else
                                      begin
                                         if TUniEdit( Fr.FindComponent('edSearchCRUD1') ) <> nil then
                                            TUniEdit( Fr.FindComponent('edSearchCRUD1') ).Text := IntToStr( t );

                                         TUniBitBtn( Fr.FindComponent('btnSearchCRUD') ).Click;
                                      end;

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
            //UniSession.Log('p1');
            if ( mm.CONFIG_LAYOUT_TAB_OFF = 'ON' ) then
            begin
               if mm.oPgGeneral <> nil then
                  if mm.oPgGeneral.ActivePage.PageIndex > 0 then
                     mm.oPgGeneral.ActivePage.Close;
            end;
            // v. 4.0.0.4
            // obrigatorio Senha MASTER( USER_ADMIN_PASS )
            if ( f > 0 ) and ( mm.varA_FSideMenu[ f ].Master ) then
            begin
               dm_rc.rc_ShowInputBox( 'Admin Access', 'Admin Password', '', '', '', true );
               if dm_rc.rc_GetMD5( mm.varC_InputBox_Result1 ) <> USER_ADMIN_PASS then
               begin
                  dm_rc.rc_ShowWarning( mm.MSG_INVALID_PASSWORD );
                  if UniApplication.FindComponent('MainForm' ) <> nil then MainForm.HideMask;
                  Abort;
               end;
            end;
            // v. 3.1.0.61
            // verifica restricao do usuário - ACESSO
            If not dm_rc.rc_PermissionVerify( mm.varC_Selected_FormFrame ,
                                              Trim( sAccessControl ) ,
                                              PT_ACCESS ) then
            begin
               FrC := nil;
               if UniApplication.FindComponent('MainForm' ) <> nil then MainForm.HideMask;
               Abort;
            end
            else
            // v. 3.4.0.0 ( thanks to MOHAMED EROL for the feedback )
            //if ( mm.oPgGeneral.PageCount.ToString = mm.CONFIG_LAYOUT_TAB_MAX_OPENED ) then
            if pNewIndex > StrToIntDef( mm.CONFIG_LAYOUT_TAB_MAX_OPENED, 5 ) then // v. 4.0.0.1
            begin
               FrC := nil;
               if UniApplication.FindComponent('MainForm' ) <> nil then MainForm.HideMask;
               dm_rc.rc_ShowSweetAlertSimple( format( mm.MSG_BUGERROR_MAX_TAB_OPENED, [ mm.CONFIG_LAYOUT_TAB_MAX_OPENED ] ) ); // v. 4.0.0.0
               Abort;
            end
            else
            // end 3.1.0.61
            begin
                 //UniSession.Log('p2');
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
                            //UniSession.Log('p3');
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
                               //Ts.ImageIndex := nodeMenu.ImageIndex; // v. 4.0.0.5
                            end
                            else
                               Ts.Tag        := (-1) * ( ( Random( 100 ) + 1 ) + ( Random( 200 ) + 1 ) );

                            Ts.Caption := rc_CamelCase( dm_rc.rc_StripHtmlTags( nodeMenuItem ) );
                            Ts.Name    := 'tab' + mm.varC_FormSource_Search + '__' + pNewIndex.ToString;
                            //UniSession.Log('p4');
                            if mm.oPgGeneral <> nil then
                               mm.oPgGeneral.ActivePage := Ts;
                            //UniSession.Log('p5');
                            rc_AddCssClass( ts, 'slide_in' ); // v. 3.2.0.0
                         end;

                      end;
                      //UniSession.Log('p6:' + FClassName);
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
                         //UniSession.Log('p7:' + FClassName);
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
                            // v. 4.0.0.0
                            Fr.Width  := Fr.Parent.Width;
                            Fr.Height := Fr.Parent.Height;

                            // v. 3.4.0.0
                            if Pos( Fr.Name, mm.varC_FormsInParent ) = 0  then
                               mm.varC_FormsInParent := mm.varC_FormsInParent + ';' + Fr.Name + ' ';
                         end;
                         //UniSession.Log('p8( Fr.Name ):' + Fr.Name);
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
                                   aftShowReg : oObj.Tag  := -3; // v. 4.0.0.0
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
                      //UniSession.Log('p9');
                      // para exibir a ultima aba adicionada
                      if mm.oPgGeneral <> nil then
                         mm.varI_TabIni := ( mm.oPgGeneral.PageCount - 1 ) - varIIF( mm.varB_Mobile_Screen, 1, 6 )
                      else
                         mm.varI_TabIni := -1;

                      if mm.varI_TabIni < 0 then
                         mm.varI_TabIni := 0;
                      // v. 4.1.0.0
                      if ( fClass.InheritsFrom( TfrmBaseCRUD ) ) or ( not bFormWithoutCRUD ) or ( Pos( '__report' , Trim( mm.varC_Table_Search ) ) > 0 ) then
                      begin
                         if TUniLabel( Fr.FindComponent( 'labTitleForm' ) ) <> nil then
                            TUniLabel( Fr.FindComponent( 'labTitleForm' ) ).Caption   := dm_rc.rc_StripHtmlTags( mm.varC_SelectedItem_FSideMenu );
                      end;
                      // v. 3.3.0.1
                      if ( pMenu <> nil ) and ( pParent = nil ) then
                         nodeMenu.Data := Ts;
                      // v. 3.2.0.0
                      // 'fechar' o menu pra liberar espaço horizontal
                      // v. 4.0.0.0
                      //if mm.varB_Mobile_Screen_Portrait then
                      if pCloseMenu then
                         if rc_FindControl( 'paLayoutMainMenu' ) <> nil then
                         begin
                            //TUniControl( rc_FindControl( 'paLayoutMainMenu' ) ).Width := 0;
                            //rc_MainMenuClick; // v. 4.0.0.3
                            rc_UpdateMainControls;

                         end;

                      // v. 4.0.0.0  - in tests
                      //rc_UpdateCharts;
                      mm.varC_LastErrorMsg := ''; // v. 3.2.0.7
                   end;
                 except on e:exception do
                        begin
                             mm.varC_LastErrorMsg := mm.varC_LastErrorMsg + ' ' + mm.MSG_ERROR + ': ' + e.Message;
                        end;
                 end;

                 if UniApplication.FindComponent('MainForm' ) <> nil then MainForm.HideMask;
            end;
            //UniSession.Log('p10');
            // v. 3.2.0.7
            if mm.varC_LastErrorMsg <> '' then
            begin
                 if ( bFormDoNotExists ) then
                    mm.varC_LastErrorMsg := cMSG_MENU_TRIGGER_ERROR2 + FClassName + '</strong><br><br>' + mm.varC_LastErrorMsg; ;// v. 4.1.0.2

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
// v. 4.0.0.0
//procedure TMainForm.rc_UpdateCharts;
//
//end;
// v. 3.0.0.0
procedure TMainForm.rc_UpdateFloatButton;
begin
//
end;
// v. 4.0.0.4
// resolver o conflito com "DELPHI align" e "UNIGUI alignClient"
// to solve a conflict with "DELPHI align" and "UNIGUI alignClient"
procedure TMainForm.rc_UpdateMainControls;
var
   oObj1, oObj2 : TObject;
begin
    oObj1 := rc_FindControl( 'paLayoutMainMenu' );
    if oObj1 <> nil then
    begin
       //TUnicontrol( oObj1 ).Left  := 0; // v. 4.0.0.0
       TUnicontrol( oObj1 ).Height:= Self.Height;
       oObj2 := rc_FindControl( 'paBackGround' );
       if oObj2 <> nil then
       begin
          (*
          mm.CONFIG_LAYOUT_MENU_TYPE
          1 botão menu apenas
          2 botão menu e os ícones principais
          3 modelo acoplado
          4 modelo horizontal
          *)
          // v. 4.0.0.4 // future implementation...
          if mm.CONFIG_LAYOUT_MENU_TYPE = '1' then
          begin
             TUnicontrol( oObj2 ).Left      := 0;
             TUnicontrol( oObj2 ).Height    := Self.Height;
             TUnicontrol( oObj2 ).Width     := Self.Width;
          end
          else
          if mm.CONFIG_LAYOUT_MENU_TYPE = '2' then
          begin
             TUnicontrol( oObj2 ).Left      := 40;
             TUnicontrol( oObj2 ).Height    := Self.Height;
             TUnicontrol( oObj2 ).Width     := Self.Width - 40;
          end
          else
          if mm.CONFIG_LAYOUT_MENU_TYPE = '3' then
          begin
             TUnicontrol( oObj2 ).Left      := TUnicontrol( oObj1 ).Width;
             TUnicontrol( oObj2 ).Height    := Self.Height;
             TUnicontrol( oObj2 ).Width     := Self.Width - TUnicontrol( oObj1 ).Width;
          end;
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
