unit Login; // v. 3.0.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniLabel, uniEdit, uniCheckBox,
  Vcl.Imaging.pngimage, uniImage, uniGUIBaseClasses,

  uniGUIApplication, System.Types, System.StrUtils, inifiles, System.DateUtils,
  mkm_translate, mkm_layout, mkm_anim, uconsts,
  //uconsts_msgs_portuguese, // v. 3.0.0.0
  uniButton, uniBitBtn, uniPanel, uniMultiItem, uniComboBox, uniDBComboBox, uniDBLookupComboBox,
  Data.DB, uniScrollBox, uniHTMLFrame, uniPageControl, unimemo, unidbmemo, // v. 4.0.0.0
  uniProgressBar, uniBasicGrid, uniDBGrid; // v. 3.0.0.0
  //ACBrBase, ACBrMail ;                   // v. 3.0.0.0

type

  //TCallbackProcedure = procedure(LoginSuccessful: Boolean) of object;

  TfrmLogin = class(TUniLoginForm)
    paBackground: TUniContainerPanel;
    paBackgroundLogin: TUniPanel;
    btnLog_In: TUniBitBtn;
    cbRemember: TUniCheckBox;
    edPassword: TUniEdit;
    edUserName: TUniEdit;
    btnCancelReg: TUniBitBtn;
    paLogo: TUniContainerPanel;
    labWelcome: TUniLabel;
    labLogin: TUniLabel;
    imgLogo: TUniImage;
    labAppVersion: TUniLabel;
    labCopyright: TUniLabel;
    htmlFrame: TUniHTMLFrame;
    labReset: TUniLabel;
    labRegister: TUniLabel;
    cbLanguage: TUniComboBox;
    paFlag: TUniContainerPanel;
    labFlag: TUniLabel;
    paCompanies: TUniPanel;
    dbgCompanies: TUniDBGrid;
    paBtns: TUniContainerPanel;
    btnEnter: TUniBitBtn;
    btnLogin: TUniBitBtn;
    paTitleSelectCompanyTitle: TUniContainerPanel;
    labSelectCompanyTitle: TUniLabel;
    paNewRegister: TUniPanel;
    edUserNameReg: TUniEdit;
    edPasswordReg: TUniEdit;
    edNameReg: TUniEdit;
    UniLabel2: TUniLabel;
    UniLabel4: TUniLabel;
    UniLabel3: TUniLabel;
    UniContainerPanel1: TUniContainerPanel;
    btnRegisterUser: TUniBitBtn;
    btnBack: TUniBitBtn;
    btnConfirmEmail: TUniBitBtn;
    paKeyBoard: TUniContainerPanel;
    btnRecPassword1: TUniBitBtn;
    btnRecPassword2: TUniBitBtn;
    btnRecPassword3: TUniBitBtn;
    btnRecPassword5: TUniBitBtn;
    btnRecPassword4: TUniBitBtn;
    btnRecPassword6: TUniBitBtn;
    btnRecPassword7: TUniBitBtn;
    btnRecPassword8: TUniBitBtn;
    btnRecPassword9: TUniBitBtn;
    btnRecPassword0: TUniBitBtn;
    procedure UniLoginFormShow(Sender: TObject);
    procedure btnLog_InClick(Sender: TObject);
    procedure btnEnterClick(Sender: TObject);
    procedure UniLoginFormScreenResize(Sender: TObject; AWidth,
      AHeight: Integer);
    procedure UniLoginFormCreate(Sender: TObject);
    procedure btnRegisterUserClick(Sender: TObject);
    procedure btnRecPassword1Click(Sender: TObject);
    procedure btnConfirmEmailClick(Sender: TObject);
    procedure labResetClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure labRegisterClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure dbgCompaniesDblClick(Sender: TObject);
    procedure dbgCompaniesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure UniLoginFormReady(Sender: TObject);
    procedure htmlFrameAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
    procedure edUserNameEnter(Sender: TObject);
    procedure edPasswordEnter(Sender: TObject);
    procedure edPasswordExit(Sender: TObject);
    procedure cbLanguageChange(Sender: TObject);
    procedure imgLogoClick(Sender: TObject);

  private


  public

        procedure rc_SortNumbers;
  end;

function frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, ServerModule, //untDM_LOOKUPs,  // v. 3.0.0.0
  mkm_func_web, untdm_rc, uVersion, Main, str_func, mkm_login;

function frmLogin: TfrmLogin;
begin
  Result := TfrmLogin(mm.GetFormInstance(TfrmLogin));
end;
// v. 3.0.0.0
procedure TfrmLogin.btnLog_InClick(Sender: TObject);
begin
  // indica que está ALIMENTANDO o BD da própria softwarehouse
  mm.varB_APP_SoftwareHouse := False;

  mm.varB_Processed := True;////dm_rc.rc_ProcessLogin( edUserName.Text, edPassword.Text, false );

  if mm.varB_Processed  then
  begin
      // se tiver acima de uma empresa cadastrada, exibe a seleção de empresas
      // if you have above a registered company, displays the selection of companies
//      if True then //dm_rc.sqlCompanies.RecordCount > 1 then
//      begin
//         paCompanies.Top    := 4;
//         paCompanies.Left   := paBackground.Width + 4;
//         paCompanies.Height := paBackground.Height;
//         paCompanies.Width  := paBackground.Width;
//         paCompanies.Visible := true;
//
//         rc_jQueryAnimate( paBackgroundLogin , 'left'  , '-' + IntToStr( paBackground.Width ), '350' );
//         rc_jQueryAnimate( paCompanies   , 'left'  , '2', '350' );
//
//         dm_rc.rc_SetFocus( btnEnter );
//      end
//      else
          btnEnterClick( self );
  end;
end;

procedure TfrmLogin.btnRecPassword1Click(Sender: TObject);
begin
     mm.varC_TempString := mm.varC_TempString + ReturnNumbers( TUniBitBtn( sender ).Caption );

     mm.varB_OperationProcessed := False;

     btnRecPassword1.ScreenMask.Enabled := ( Length( mm.varC_TempString ) = 5 );

     if ( btnRecPassword1.ScreenMask.Enabled ) and ( btnRecPassword1.tag <= 3 ) then
     begin
          btnRecPassword1.tag := btnRecPassword1.tag + 1;

          mm.varB_OperationProcessed    := ( mm.varC_TempString = mm.varC_Temp1 + mm.varC_Temp2 + mm.varC_Temp3 + mm.varC_Temp4 + mm.varC_Temp5 );

          btnConfirmEmail.Enabled := True;

          if not mm.varB_OperationProcessed then
          begin
               // resetando senha ou novo cadastro ?
               if btnConfirmEmail.tag = 1 then
               begin
                    btnConfirmEmail.Click;
               end
               else
               if btnRegisterUser.tag = 1 then
               begin
                   btnRegisterUser.Click;
               end;
          end
          else
          begin
               // resetando senha ou novo cadastro ?
               if btnConfirmEmail.tag = 1 then
               begin
                    //rc_SendProvisionalPassword( False );
               end
               else
               if btnRegisterUser.tag = 1 then
               begin
                   //rc_SendProvisionalPassword( True );
               end;
          end;
     end;

     TUniBitBtn( sender ).ModalResult := mrNone;
end;

procedure TfrmLogin.rc_SortNumbers;
var
   I, num : integer;
   numeros : string;
begin
       numeros := '';

       for I := 0 to Self.ComponentCount - 1 do
       begin
         if Self.Components[I] is TUniBitBtn then
         begin
              if lowercase( ReturnLetters( TUniBitBtn( Self.Components[I] ).Name ) ) = 'btnrecpassword' then
              begin
                   repeat
                         num := Random( 10 );
                   until Pos ( num.ToString , numeros ) = 0;

                   TUniBitBtn( Self.Components[I] ).Caption := num.ToString;
                   TUniBitBtn( Self.Components[I] ).Enabled := ( btnConfirmEmail.Tag = 1) or ( btnRegisterUser.Tag = 1) ;

                   numeros := numeros + num.ToString;
              end;
         end;
       end;
end;

procedure TfrmLogin.btnConfirmEmailClick(Sender: TObject);
begin
     //rc_SendEmailCode( TUniBitBtn( sender ) , mm.MSG_PASSWORD_RESET , edUserNameReg.Text, '', '' ); // v. 3.0.0.0
     paKeyBoard.Visible := True;
end;

procedure TfrmLogin.btnEnterClick(Sender: TObject);
var
  i, r, iCodiSistema : integer;
begin
     // SELECIONAR EMPRESA
     mm.varI_Code_Company := 1;//dm_rc.sqlCompanies.FieldByName('codigo').AsInteger;
     mm.varC_CompanyName  := 'COMPANY DEMO'; //dm_rc.sqlCompanies.FieldByName('nome').AsString; // v. 3.0.0.0

     // criticar o acesso se o usuario for de outra empresa
     begin
        // Aqui capturamos o DOCUMENTO DA EMPRESA selecionada no LOGIN para controle de licença.
        // No Brasil usamos o CNPJ, você poderá ajustar de acordo com seu controle ou até mesmo remover e fazer seu próprio controle de licença.
        //
        // Here we capture the COMPANY DOCUMENT selected in the LOGIN for license control.
        // In Brazil we use the CNPJ, you can adjust according to your control or even remove and make your own license control.
        mm.varC_Doc_Customer := '08817253000164';//dm_rc.sqlCompanies.FieldByName('cnpj').AsString;

        // RADCORE ERP    = 1
        // RADCORE MOBILE = 2
        //
        // você pode ter sua tabela de SISTEMAS( produtos q licencia )
        // aqui deixei FIXO a titulo de desenvolvimento
        iCodiSistema := 1;

        // as variáveis abaixo serão criticadas no ACESSO as telas/forms, ao CADASTRAR, ALTERAR, EXCLUIR etc
        // the variables below will be criticized in ACCESS the screens / forms, when REGISTERING, CHANGING, DELETING etc.
        mm.varC_Blocked         := mm.VALUE_NO;  //dm_rc.CUSTOMER_LICENCE.FieldByName( 'bloqueado').AsString;
        mm.varC_Locked          := mm.VALUE_NO;  //dm_rc.CUSTOMER_LICENCE.FieldByName( 'travado').AsString;
        mm.varI_Device_Licences := 3;    //dm_rc.CUSTOMER_LICENCE.FieldByName( 'licencas').AsInteger;

        if mm.varC_Locked = mm.VALUE_YES then
        begin
             dm_rc.rc_ShowSweetAlert( mm.MSG_INFO, mm.MSG_APP_LOCKED, 'warning' ); // v. 3.3.1.0
        end;

        // v. 3.2.0.0
        // aqui são criadas pastas que serão usadas na aplicação
        // algumas pastas são específicas para documentos usados no Brasil
        rc_GetDefaultPaths( true, mm.varC_Doc_Customer );

        tag := 1;

        btnEnter.ModalResult := mrOk;
        ModalResult := mrOK;
        close;
     end;
end;

procedure TfrmLogin.btnRegisterUserClick(Sender: TObject);
begin
     //rc_SendEmailCode( TUniBitBtn( sender ) , mm.MSG_REGISTER_NEW , edUserNameReg.Text, edNameReg.Text, edPasswordReg.Text); // v. 3.0.0.0

     paKeyBoard.Visible := True;
     paKeyBoard.Enabled := True;
     btnRegisterUser.Enabled := False;

     edNameReg.SetFocus;
end;
// v. 3.2.0.0
procedure TfrmLogin.cbLanguageChange(Sender: TObject);
var
i : integer;
IniFile : TIniFile;
begin
     cbLanguage.Text := dm_rc.rc_StripHtmlTags( cbLanguage.Text );

     i := dm_rc.rc_GetIndexFromArray( cbLanguage.Text, ARRAY_LANGUAGES ) ;
     mm.CONFIG_LANGUAGE := ARRAY_LANGUAGES[ i ];
     // v. 3.2.0.5
     //if bRemember then
     begin
        UniApplication.Cookies.SetCookie('_language' + APP_NAME + edUserNameReg.Text, mm.CONFIG_LANGUAGE, 0);
        UniApplication.Cookies.SetCookie('_language_login' + APP_NAME, edUserNameReg.Text, 0);
     end;

     // v. 3.1.0.60
     if i > 0 then
        if ( mm.CONFIG_LANGUAGE <> 'ar' ) then
           sm.ExtLocale  := mm.CONFIG_LANGUAGE;

     try
       IniFile := TiniFile.Create( sm.FilesFolderPath + StringReplace( StrTokenClear( APP_NAME ), ' ', '', [rfReplaceAll] ) + '_cfg.ini' ); // v. 3.1.0.60
       IniFile.WriteString( 'App', 'language'    , mm.CONFIG_LANGUAGE);
     finally
       IniFile.Free;
     end;

     UniApplication.Restart;
end;
// v. 3.3.0.2
procedure TfrmLogin.btnLoginClick(Sender: TObject);
begin
     if not mm.rtl then
     begin
        rc_jQueryAnimate( paBackgroundLogin , 'left'  , '0' , '350' );
        rc_jQueryAnimate( paCompanies       , 'left'  , intToStr( paCompanies.Width + 5 ), '200' );
     end
     else
     begin
        rc_jQueryAnimate( paBackgroundLogin , 'right'  , '0' , '350' );
        rc_jQueryAnimate( paCompanies       , 'right'  , intToStr( paCompanies.Width + 5 ), '200' );
     end;
end;
// v. 3.3.0.2
procedure TfrmLogin.btnBackClick(Sender: TObject);
begin
     btnRegisterUser.Enabled     := True;
     btnConfirmEmail.Enabled := true;
     if not mm.rtl then
     begin
        rc_jQueryAnimate( paBackgroundLogin , 'left'  , '0' , '350' );
        rc_jQueryAnimate( paNewRegister     , 'left'  , '-' + intToStr( paNewRegister.Width + 5 ), '200' );
     end
     else
     begin
        rc_jQueryAnimate( paBackgroundLogin , 'right'  , '0' , '350' );
        rc_jQueryAnimate( paNewRegister     , 'right'  , '-' + intToStr( paNewRegister.Width + 5 ), '200' );
     end
end;

procedure TfrmLogin.dbgCompaniesDblClick(Sender: TObject);
begin
     btnEnterClick( self );
end;

procedure TfrmLogin.dbgCompaniesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if key = 13 then
     begin
        Key := 0;
        btnEnterClick( self );
     end;
end;
// v. 3.0.0.0
procedure TfrmLogin.edPasswordEnter(Sender: TObject);
begin
     //rc_ScreenAdjustMobileKeyboard( Self, 40 );
end;
procedure TfrmLogin.edPasswordExit(Sender: TObject);
begin
     //rc_ScreenAdjustMobileKeyboard( Self, -40 );
end;
// v. 3.0.0.0
procedure TfrmLogin.edUserNameEnter(Sender: TObject);
begin
     //if ( mm.varB_Mobile_Screen ) then
     //   Self.Top := Self.Top - 40;
end;
// v. 4.0.0.0
procedure TfrmLogin.htmlFrameAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
var
   pObj : TUniControl;
   oHfRequired : TUniHTMLFrame; // v. 3.4.0.0
   oLabel : TUniLabel; // v. 3.4.0.0
   oSBox : TUniScrollBox; // v. 3.3.3.2
   oScrollBlock : TObject; // v. 4.0.0.0
   FClassName: string;
   pFrame, pFrame2 : TObject;
begin
      if (EventName = '_onFocus') then
      begin
           pFrame := Self;
//          FClassName := Params.Values['pform'];
//
//          pFrame := rc_FindControl( FClassName );
//
//          if pFrame = nil then
//          begin
//               if mm.oPgGeneral <> nil then
//               begin
//                 fClassName := dm_rc.rc_GetActiveFormFrameNameInMainTab;// v. 3.3.3.0 //Copy( mm.oPgGeneral.ActivePage.Name, 5, 100 );
//                 pFrame     := rc_FindControl( FClassName );
//               end;
//          end;
//
//          if pFrame <> nil then
          begin
             // v. 4.0.0.0
             //if FClassName <> 'frmLookUp_Lite' then
             //   if dm_rc.rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;

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
             // v. 4.0.0.0
             if ( pos( 'form-label:', pObj.hint ) > 0 ) then
             begin
                oLabel := TUniLabel( TComponent(pFrame).FindComponent('rc__FormLabel' + pObj.Name) );
                if ( oLabel <> nil ) then //and ( TUniEdit(pObj).Text = '' ) then
                begin
                     if ( pos( 'form-label:top-in', pObj.hint ) > 0 ) then
                        if ( pObj is TUniMemo ) or ( pObj is TUniDBMemo ) then
                           rc_jQueryAnimate( oLabel , 'top'  , IntToStr( oLabel.Top - 18 ) , '350' )
                        else
                           rc_jQueryAnimate( oLabel , 'top'  , IntToStr( oLabel.Top - ( ( pObj.Height div 2 ) + 3 ) ) , '350' )
                     else
                     if ( pos( 'form-label:top', pObj.hint ) > 0 ) then
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
           pFrame := Self;
//          FClassName := Params.Values['pform'];
//
//          pFrame := rc_FindControl( FClassName );
//
//          if pFrame = nil then
//          begin
//               if mm.oPgGeneral <> nil then
//               begin
//                 fClassName := dm_rc.rc_GetActiveFormFrameNameInMainTab;// v. 3.3.3.0 //Copy( mm.oPgGeneral.ActivePage.Name, 5, 100 );
//                 pFrame     := rc_FindControl( FClassName );
//               end;
//          end;
//
//          if pFrame <> nil then
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
          // v. 4.0.0.0
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
      end;
end;
// v. 3.3.0.2
procedure TfrmLogin.imgLogoClick(Sender: TObject);
begin
     dm_rc.rc_OpenLink( SOFTWAREHOUSE_SITE );
end;
// v. 3.3.0.2
procedure TfrmLogin.labResetClick(Sender: TObject);
begin
     btnRecPassword1.tag      := 0;
     btnConfirmEmail.Tag      := 0;
     paKeyBoard.Visible       := False;

     rc_SortNumbers;

     paNewRegister.Top        := 4;
     paNewRegister.Height     := paBackground.Height ;
     paNewRegister.Width      := paBackground.Width;
     paNewRegister.Visible    := True;
     edNameReg.Visible        := False;
     edPasswordReg.Visible    := False;
     btnConfirmEmail.Visible  := True;
     btnRegisterUser.Visible  := False;

     edUserNameReg.SetFocus;
     if not mm.RTL then
     begin
        paNewRegister.Left    := 0 - paBackground.Width ;
        rc_jQueryAnimate( paBackgroundLogin , 'left'  , IntToStr( paBackground.Width ), '350' );
        rc_jQueryAnimate( paNewRegister     , 'left'  , '2', '350' );
     end
     else
     begin
        paNewRegister.Left    := paBackground.Width ;
        rc_jQueryAnimate( paBackgroundLogin , 'right'  , IntToStr( paBackground.Width ), '350' );
        rc_jQueryAnimate( paNewRegister     , 'right'  , '2', '350' );
     end;
end;
// v. 3.3.0.2
procedure TfrmLogin.labRegisterClick(Sender: TObject);
begin
     btnRecPassword1.tag       := 0;
     btnRegisterUser.Tag       := 0;
     paKeyBoard.Visible        := False;
     btnConfirmEmail.Align     := alLeft;
     btnConfirmEmail.Visible   := False;
     btnRegisterUser.Visible   := True;
     edUserNameReg.Visible     := True;
     edNameReg.Visible         := True;
     edPasswordReg.Visible     := True;
     paNewRegister.Top         := 4;
     paNewRegister.Height      := paBackground.Height ;
     paNewRegister.Width       := paBackground.Width;
     paNewRegister.Visible     := True;
     if not mm.RTL then
     begin
        paNewRegister.Left        := 0 - paBackground.Width;
        rc_jQueryAnimate( paBackgroundLogin , 'left'  , IntToStr( paBackground.Width ), '350' );
        rc_jQueryAnimate( paNewRegister     , 'left'  , '2', '350' );
     end
     else
     begin
        paNewRegister.Left        := paBackground.Width ;
        rc_jQueryAnimate( paBackgroundLogin , 'right'  , IntToStr( paBackground.Width ), '350' );
        rc_jQueryAnimate( paNewRegister     , 'right'  , '2', '350' );
     end;
end;
// v. 3.0.0.0
procedure TfrmLogin.UniLoginFormScreenResize(Sender: TObject; AWidth,
  AHeight: Integer);
var
 pX : integer;
begin
     mm.varI_ScreenWidth := UniApplication.ScreenWidth;
     mm.varI_ScreenHeight := UniApplication.ScreenHeight;

     dm_rc.rc_GetDeviceType;

     // Só RECENTRALIZA se houver uma mudança significativa na dimensão da tela
     // no MOBILE, o ACELEROMETRO, fica variando...
     pX := UniApplication.ScreenWidth - Self.Tag;

     if Px < 0 then
        pX := pX *(-1);

     if UniApplication.ScreenWidth >= 660 then
     begin
        Self.Width := 650;
        Self.Height := 370;
     end
     else
     if ( mm.varB_Mobile_Screen ) then
     begin
        Self.Width := 330;
        Self.Height := 370;
     end
     else
     begin
        Self.Width := 330;
        Self.Height := 370;
     end;

     Self.Left := ( UniSession.UniApplication.ScreenWidth div 2 ) - (  Self.Width div 2 );
     Self.Top  := 0;

     if pX > 100  then
     begin
        rc_MoveAnimationForm( self,
                                    self.left,
                                    self.left,
                                    self.top,
                                    ( UniSession.UniApplication.ScreenHeight div 2 ) - ( self.Height div 2  ),
                                    400,
                                    1 ) ;
        // v. 3.1.0.63
        UniSession.AddJS( 'gsapAnimFormShow( ' + Self.Name + '.' + paLogo.Name + '.id' + ' );' );
        UniSession.AddJS( 'gsapAnimFormShow( ' + Self.Name + '.' + imgLogo.Name + '.id' + ' );' );

        Self.Tag := UniApplication.ScreenWidth;
     end;
end;
// v. 3.2.0.5
procedure TfrmLogin.UniLoginFormCreate(Sender: TObject);
var
   pTypeButton : string;
   f,i : integer;
   sString : String;
   sStringSeparada: TStringDynArray;
begin
      if UniApplication.Cookies.Count > 0 then
      begin
            for I := 0 to UniApplication.Cookies.Count - 1 do
            begin
                 sString := UniApplication.Cookies[I];
                 sStringSeparada := SplitString(sString, '=');

                 if sStringSeparada[0] = '_login' + APP_NAME then   // FeedBack from FOLVEIRA
                 begin
                    edUserName.Text := sStringSeparada[1];
                    edUserNameReg.Text := edUserName.Text;
                 end;
                 // v. 3.2.0.5
                 if sStringSeparada[0] = '_language' + APP_NAME + edUserName.Text then
                 begin
                    mm.CONFIG_LANGUAGE := sStringSeparada[1] ;
                 end;

                 if UniApplication.Cookies[I] = '_remember' + APP_NAME + '=' + mm.VALUE_YES then
                    cbRemember.Checked := true;
            end;
      end;
     dm_rc.rc_SetFocus( edUserName );

     // v. 3.1.0.63
     rc_LoadGSAPAnimFunctions( Self );
     //( feedback mohamed ammar )
     RTL := mm.RTL;

     {$IFDEF RELEASE}
     dm_rc.rc_ProtectForm( Self );
     {$ENDIF}

     if mm.CONFIG_LAYOUT_ROUND_FORM = 'ON' then
        rc_AddCssClass( Self, 'form-rounded' );

     mm.varC_JSNAME_HTMLFRAME := htmlFrame.JSName;
     mm.varB_DefaulPageBar    := True;

     Self.Tag := UniApplication.ScreenWidth;

     rc_AddCssClass( self, 'rc-form-shadow' );

     // alinhar os panels fora da visao do usuario
     paCompanies.Top    := -400;
     paCompanies.Left   := paBackground.Width + 4;
     paNewRegister.Top  := -400;
     paNewRegister.Left := 0 - paBackground.Width ;

     // copy paFlag and cbLanguage to your project
     cbLanguage.Items.Clear;
     for I := 1 to High( ARRAY_LANGUAGES ) do
     begin
          cbLanguage.Items.Add( '<a><span class="flag-icon flag-icon-' + ARRAY_LANGUAGES_FLAGS[i] + '"></span>' + ' ' + ARRAY_LANGUAGES[i] + '</a>' );

          if ( ARRAY_LANGUAGES[i] = mm.CONFIG_LANGUAGE ) then
             f := i;
     end;
     cbLanguage.ItemIndex := f-1;
     cbLanguage.Text := dm_rc.rc_StripHtmlTags( cbLanguage.Text );
     labFlag.Hint     := '[[cls:flag-icon flag-icon-' + ARRAY_LANGUAGES_FLAGS[f] + ']]';

     rc_RenderLayout( Self, true, false, false );

     // ajustar cores
     paLogo.Color   := StringToColor( mm.CONFIG_LAYOUT_LOGIN_COLOR );
     paLogo.JSInterface.JSCall( 'addCls' , ['rc-gradient-dark-to-color-crud']);

     labAppVersion.Caption := 'v.' + FileVersion + ' [ ' + mm.CONFIG_APP_TYPE + ' ]';
     labCopyright.Caption  := 'Copyright (C) 2019-' +  YearOf( date ).ToString + ' by ' + SOFTWAREHOUSE_NAME; // v. 3.3.0.2

     if FileExists( sm.FilesFolderPath + 'images' + BACKSLASH + 'logo_login.png' ) then
        imgLogo.Picture.LoadFromFile( sm.FilesFolderPath +  'images' + BACKSLASH + 'logo_login.png' );
end;

procedure TfrmLogin.UniLoginFormReady(Sender: TObject);
begin
     // in development
     rc_Translate( Self, nil , '' , mm.CONFIG_LANGUAGE );
     rc_ConfigTranslateMessages;
end;
// v. 3.2.0.5
procedure TfrmLogin.UniLoginFormShow(Sender: TObject);
//var
//  I : Integer;
//  sString : String;
//  sStringSeparada: TStringDynArray;
begin
//      if UniApplication.Cookies.Count > 0 then
//      begin
//            for I := 0 to UniApplication.Cookies.Count - 1 do
//            begin
//                 sString := UniApplication.Cookies[I];
//                 sStringSeparada := SplitString(sString, '=');
//
//                 if sStringSeparada[0] = '_login' + APP_NAME then   // FeedBack from FOLVEIRA
//                 begin
//                    edUserName.Text := sStringSeparada[1];
//                    edUserNameReg.Text := edUserName.Text;
//                 end;
//
//                 if UniApplication.Cookies[I] = '_remember' + APP_NAME + '=' + mm.VALUE_YES then
//                    cbRemember.Checked := true;
//            end;
//      end;
//     dm_rc.rc_SetFocus( edUserName );
end;

initialization
  RegisterAppFormClass(TfrmLogin);

end.
