unit Login; // v. 4.0.0.0
//[PT]
//adicionado componente "rcSweetAlert"
//adicionado validação no ato do registro de novo usuário
//adicionado animação na digitação do código para cadastro de usuário
//[EN]
//added component "rcSweetAlert"
//added validation when registering a new user
//added animation when typing the code for user registration
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, // v. 4.0.0.0
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniLabel, uniEdit, uniCheckBox,
  Vcl.Imaging.pngimage, uniImage, uniGUIBaseClasses,
  uniGUIApplication, System.Types, System.StrUtils, inifiles, System.DateUtils,
  mkm_translate, mkm_layout, mkm_anim, uconsts,
  uniButton, uniBitBtn, uniPanel, uniMultiItem, uniComboBox, uniDBComboBox, uniDBLookupComboBox,
  Data.DB, uniScrollBox, uniHTMLFrame, uniPageControl,
  uniProgressBar, uniBasicGrid, uniDBGrid, uniMemo, uniDBMemo, uniSweetAlert; // v. 4.0.0.0

type

  //TCallbackProcedure = procedure(LoginSuccessful: Boolean) of object;

  TfrmLogin = class(TUniLoginForm)
    paBackground: TUniContainerPanel;
    paCompanies: TUniPanel;
    dbgCompanies: TUniDBGrid;
    paBtns: TUniContainerPanel;
    btnEnter: TUniBitBtn;
    btnLogin: TUniBitBtn;
    paNewRegister: TUniPanel;
    edUserNameReg: TUniEdit;
    edPasswordReg: TUniEdit;
    edNameReg: TUniEdit;
    UniLabel2: TUniLabel;
    UniLabel4: TUniLabel;
    paBackgroundLogin: TUniPanel;
    btnLog_In: TUniBitBtn;
    cbRemember: TUniCheckBox;
    edPassword: TUniEdit;
    edUserName: TUniEdit;
    labReset: TUniLabel;
    btnCancelReg: TUniBitBtn;
    labRegister: TUniLabel;
    UniLabel3: TUniLabel;
    UniContainerPanel1: TUniContainerPanel;
    btnRegisterUser: TUniBitBtn;
    btnBack: TUniBitBtn;
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
    btnConfirmEmail: TUniBitBtn;
    paLogo: TUniContainerPanel;
    labWelcome: TUniLabel;
    labLogin: TUniLabel;
    imgLogo: TUniImage;
    labAppVersion: TUniLabel;
    labCopyright: TUniLabel;
    htmlFrame: TUniHTMLFrame;
    cbLanguage: TUniComboBox;
    paFlag: TUniContainerPanel;
    labFlag: TUniLabel;
    paTitleSelectCompanyTitle: TUniContainerPanel;
    labSelectCompanyTitle: TUniLabel;
    rcSweetAlert: TUniSweetAlert;
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
    procedure dbgCompaniesDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
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
  // v. 3.3.0.1
  private
      vEmailCode : integer; // v. 3.4.0.0
      procedure rc_SortNumbers;
      procedure rc_SendEmailCode( Sender : TObject; pType, pEmail, pUser, pPassword : string );
      procedure rc_SendProvisionalPassword( pNewRegister : Boolean );
  public

  end;

function frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, ServerModule,
  mkm_func_web, untdm_rc, uVersion, Main, str_func, mkm_email, mkm_login, mkm_validate; // v. 3.4.0.0

function frmLogin: TfrmLogin;
begin
  Result := TfrmLogin(mm.GetFormInstance(TfrmLogin));
end;
// v. 3.3.0.2
procedure TfrmLogin.btnLog_InClick(Sender: TObject);
begin
  mm.varB_LoginProcessed := false;
  dm_rc.rc_ProcessLogin( edUserName.Text, edPassword.Text, false );
  if mm.varB_LoginProcessed then
  begin
      // se tiver acima de uma empresa cadastrada, exibe a seleção de empresas
      // if you have above a registered company, displays the selection of companies
      if dm_rc.sqlCompanies.RecordCount > 1 then
      begin
         paCompanies.Top     := 4;
         paCompanies.Height  := paBackground.Height;
         paCompanies.Width   := paBackground.Width;
         paCompanies.Visible := true;

         if not mm.rtl then
         begin
            paCompanies.Left   := paBackground.Width + 4;
            rc_jQueryAnimate( paBackgroundLogin , 'left'  , '-' + IntToStr( paBackground.Width ), '350' );
            rc_jQueryAnimate( paCompanies       , 'left'  , '2', '350' );
         end
         else
         begin
            paCompanies.Left   := -4;//paBackground.Width + 4;
            rc_jQueryAnimate( paBackgroundLogin , 'right'  , '-' + IntToStr( paBackground.Width ), '350' );
            rc_jQueryAnimate( paCompanies       , 'right'  , '2', '350' );
         end;

         dm_rc.rc_SetFocus( btnEnter );
      end
      else
          btnEnterClick( self );
  end;
end;
// v. 3.4.0.0
procedure TfrmLogin.btnRecPassword1Click(Sender: TObject);
var
 oLabel : TUniLabel;
 i,iOffSet : integer;
begin
     // v. 3.4.0.0
     oLabel  := TUniLabel( FindComponent( 'rc__lab' + vEmailCode.ToString ) );
     if oLabel = nil then
     begin
        oLabel              := TUniLabel.Create( frmLogin );
        oLabel.Parent       := paNewRegister;
        oLabel.Font.Color   := clBlack;
        oLabel.Font.Size    := 22;
        oLabel.Font.Style   := [fsBold];
     end
     else
         oLabel.Visible     := true;
     oLabel.Caption      := ReturnNumbers( TUniBitBtn( sender ).Caption );
     oLabel.TextConversion:= txtHTML;
     oLabel.Left         := vEmailCode;
     oLabel.Name         := 'rc__lab' + oLabel.Left.ToString;
     oLabel.Top          := paKeyBoard.Top + 5 ;
     rc_jQueryAnimate( oLabel , 'top'  , IntToStr( oLabel.Top - 40 ) , '350' );
     vEmailCode          := oLabel.Left + ( btnRecPassword1.Width div 2 );

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
               // v. 3.4.0.0
               ShowMask('');
               UniSession.Synchronize();
               // resetando senha ou novo cadastro ?
               if btnConfirmEmail.tag = 1 then
               begin
                    rc_SendProvisionalPassword( False );
               end
               else
               if btnRegisterUser.tag = 1 then
               begin
                   rc_SendProvisionalPassword( True );
               end;
               vEmailCode := btnRecPassword2.Left + 12;
               for I := 1 to 5 do
               begin
                  oLabel  := TUniLabel( FindComponent( 'rc__lab' + vEmailCode.ToString ) );
                  if oLabel <> nil then
                  begin
                       vEmailCode := oLabel.Left + ( btnRecPassword1.Width div 2 );
                       oLabel.Visible := false;
                       rc_jQueryAnimate( oLabel , 'top'  , IntToStr( oLabel.Top + 40 ) , '5' );
                  end;
               end;
               vEmailCode := btnRecPassword2.Left + 12;
               HideMask;
               // v. 3.3.3.1
               //if mm.varB_OperationProcessed then
               //   dm_rc.rc_ShowSweetAlert( 'Email', 'New User Registered !', 'success' ) ;
               // v. 3.3.3.1
               if mm.varB_OperationProcessed then
                  if btnConfirmEmail.tag = 1 then
                     dm_rc.rc_ShowSweetAlert( 'Email', mm.MSG_PASSWORD_TEMP_SENT, 'success' )
                  else
                     dm_rc.rc_ShowSweetAlert( 'Email', mm.MSG_NEW_USER_REGISTERED, 'success' ) ;
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
     // v. 3.2.0.5
     mm.varB_OperationProcessed := dm_rc.rc_ProcessFirstConnection;

     rc_SendEmailCode( TUniBitBtn( sender ) , mm.MSG_PASSWORD_RESET , edUserNameReg.Text, '', '' );
     paKeyBoard.Visible := True;
end;

procedure TfrmLogin.btnEnterClick(Sender: TObject);
var
  iCodiSistema : integer; // v. 3.2.0..7
begin
     // caso ocorra alguma exceção, evita a SAIDA da aplicação
     if ( dbgCompanies.DataSource.DataSet.FieldByName( 'descricao' ).AsString = '' ) and ( dm_rc.sqlCompanies.RecordCount > 1 ) then // v. 3.2.0.0
     begin
          dm_rc.rc_ShowMessage( mm.MSG_COMPANY_SELECT , 'warning' );
          btnEnter.ModalResult := mrNone;

          Exit;
     end
     else
     begin
          // v. 3.2.0.0
          // SELECIONAR EMPRESA
          mm.varI_Code_Company     := dm_rc.sqlCompanies.FieldByName('codigo').AsInteger;
          mm.varC_CompanyName      := dm_rc.sqlCompanies.FieldByName('descricao').AsString;
          mm.varI_Code_CompanyMain := dm_rc.sqlCompanies.FieldByName('Codigo').AsInteger;
          // criticar o acesso se o usuario for de outra empresa
          if ( ( dm_rc.memUsers.FieldByName('codiemp').AsInteger <> mm.varI_Code_Company ) and
             ( dm_rc.memUsers.FieldByName('master').AsString <> mm.VALUE_YES ) and // v. 3.2.0.5
             ( dm_rc.rc_GetTotRecords( mm.varB_Use_FireDac,
                                       'usuarios_empresa',
                                       'codiemp = ' + dm_rc.rc_IntToString( dm_rc.sqlCompanies.FieldByName('codigo').AsInteger ) +
                                       ' and codiuser = ' + dm_rc.rc_IntToString( dm_rc.memUsers.FieldByName('codigo').AsInteger ) ) = 0 ) ) then
          begin
               dm_rc.rc_ShowSweetAlert( mm.MSG_WARNING, mm.MSG_COMPANY_USER_OTHER, 'warning'  );
               ModalResult := mrNone;
               btnEnter.ModalResult := mrNone;
               Exit;
          end
          else
          begin
             // Aqui capturamos o DOCUMENTO DA EMPRESA selecionada no LOGIN para controle de licença.
             // No Brasil usamos o CNPJ, você poderá ajustar de acordo com seu controle ou até mesmo remover e fazer seu próprio controle de licença.
             //
             // Here we capture the COMPANY DOCUMENT selected in the LOGIN for license control.
             // In Brazil we use the CNPJ, you can adjust according to your control or even remove and make your own license control.
             mm.varC_Doc_Customer := dm_rc.sqlCompanies.FieldByName('cnpj').AsString;

             // RADCORE ERP    = 1
             // RADCORE MOBILE = 2
             //
             // você pode ter sua tabela de SISTEMAS( produtos q licencia )
             // aqui deixei FIXO a titulo de desenvolvimento
             iCodiSistema := 1;


             // removido para aumentar compatibilidade com outros usuários e facilitar mais o uso do RadCORE
             // removed to increase compatibility with other users and make it easier to use RadCORE
             //
             // Aqui é o INICIO do controle de LICENCAS de USO que VOCÊ vai fazer para SEUS CLIENTES
             // O IDEAL é q suas aplicacoes( RADCORE e SOFTWAREHOUSE - veja o TUTORIAL ) estejam no mesmo servidor
             // mas nada impede de usa-los separados acessando direto ou via RESTDATAWARE / HORSE / DMVC etc.
             //
             // checar LICENCAS ( BD localizado em inetpub/wwwroot/softwarehouse
             //
             // Este será o BD da SUA EMPRESA
             //
             // caso não queira usar o controle de licenças ou adaptar ao seu projeto, basta remover todas
             // as referências a query CUSTOMER_LICENCE"
             //
             //if mm.CONFIG_SESSION_LOG then UniSession.Log( '>>> ' + Copy( Self.name + StringOfChar( ' ', 15 ) , 1, 15 ) + ':  371' );
//             dm_rc.CUSTOMER_LICENCE.close;
//             dm_rc.CUSTOMER_LICENCE.sql.Text :=
//                 ' SELECT ' +
//                 '       tab.codigo , tab.bloqueado, tab.travado , tab.licencas, tab.cnpj_cpf, tab.codisistema ' +
//                 ' FROM  clientes tab ' +
//                 ' WHERE tab.cnpj_cpf = :cnpj_cpf ' +
//                 ' AND   tab.codisistema = :codisistema ';
//             dm_rc.CUSTOMER_LICENCE.ParamByName( 'cnpj_cpf').AsString     := mm.varC_Doc_Customer;
//             dm_rc.CUSTOMER_LICENCE.ParamByName( 'codisistema').AsInteger := iCodiSistema;
//             dm_rc.rc_OpenQuery( dm_rc.CUSTOMER_LICENCE );

             // as variáveis abaixo serão criticadas no ACESSO as telas/forms, ao CADASTRAR, ALTERAR, EXCLUIR etc
             // the variables below will be criticized in ACCESS the screens / forms, when REGISTERING, CHANGING, DELETING etc.
             mm.varC_Blocked         := mm.VALUE_NO;  //dm_rc.CUSTOMER_LICENCE.FieldByName( 'bloqueado').AsString;
             mm.varC_Locked          := mm.VALUE_NO;  //dm_rc.CUSTOMER_LICENCE.FieldByName( 'travado').AsString;
             mm.varI_Device_Licences := 3;            //dm_rc.CUSTOMER_LICENCE.FieldByName( 'licencas').AsInteger;

             if mm.varC_Locked = mm.VALUE_YES then
             begin
                  dm_rc.rc_ShowSweetAlert( mm.MSG_INFO, mm.MSG_APP_LOCKED, 'warning' ); // v. 3.3.1.0
             end;

             // v. 3.2.0.0
             // aqui são criadas pastas que serão usadas na aplicação
             // algumas pastas são específicas para documentos usados no Brasil
             rc_GetDefaultPaths( true, mm.varC_Doc_Customer );

             // manter a query com os dados da empresa ATUAL
             //
             //dm_lookups.EMPRESAS.close;

             // v. 3.2.0.5
             // pra atualizar o cod. de func. do cad. de usuario pela empresa q logou SE NAO FOR O MASTER
             if dm_rc.memUsers.FieldByName('master').AsString <> mm.VALUE_YES then
             begin
                 dm_rc.memTemp.Close;
                 dm_rc.memTemp.filtered := false;
                 dm_rc.memTemp.Data := dm_rc.rc_GetRecord( mm.varB_Use_FireDac ,
                                                            True,
                                                            ' select codigo,codiemp,nome,email,senha,master,codifunc,avatar ' +
                                                            ' from usuarios ' +
                                                            ' where email = ' + QuotedStr( edUserName.Text ) +
                                                            ' and codiemp = ' + IntToStr( mm.varI_Code_Company ) +
                                                            ' order by codigo' );
                 if mm.varC_LastErrorMsg <> '' then
                 begin
                     dm_rc.rc_ShowError( mm.varC_LastErrorMsg );
                     Exit;
                 end;

                 if not dm_rc.memTemp.IsEmpty then
                 begin
                   dm_rc.memUsers.Close;
                   dm_rc.memUsers.filtered := false;
                   dm_rc.memUsers.Data := dm_rc.memTemp.Data;
                   // abre a tabela USUARIOS_RESTRICOES. Esta tabela contém a lista de permissões definidas para cada usuário
                   // opens the RESTRICTION table. This table contains the list of permissions defined for each user
                   dm_rc.memUsersPermissions.Close;
                   dm_rc.memUsersPermissions.Data := dm_rc.rc_GetRecord(
                                                        mm.varB_Use_FireDac ,
                                                        False,
                                                        ' select * ' +
                                                        ' from usuarios_restricoes ' +
                                                        ' where codiuser = ' + dm_rc.memUsers.FieldByName('codigo').AsString );
                   if mm.varC_LastErrorMsg <> '' then
                   begin
                       dm_rc.rc_ShowError( mm.varC_LastErrorMsg );
                       Exit;
                   end;

                   mm.vUserEmail          := edUserName.Text;
                   mm.vUserName           := dm_rc.memUsers.FieldByName('nome').AsString;
                   //mm.vPass               := pPassWord;
                   mm.vUserLoginTimeStamp := Now;
                   // v. 3.2.0.0
                   mm.varC_User_Avatar    := dm_rc.memUsers.FieldByName('avatar').AsString;
                   mm.varI_User           := dm_rc.memUsers.FieldByName('Codigo').AsInteger;
                   mm.varC_NameSalesMan   := mm.vUserName;
                   mm.varI_CodeSalesMan   := dm_rc.memUsers.FieldByName('Codifunc').AsInteger;
                 end;
             end;

             tag := 1;

             btnEnter.ModalResult := mrOk;

             ModalResult := mrOK;
             close;
          end;
     end;
end;
// v. 3.4.0.0
procedure TfrmLogin.btnRegisterUserClick(Sender: TObject);
begin
     btnRegisterUser.ModalResult := mrNone;

     if not rc_FormValidate( Self ) then
     begin
        edUserNameReg.SetFocus;
     end
     else
     begin
        // v. 3.2.0.5
        mm.varB_OperationProcessed := dm_rc.rc_ProcessFirstConnection;
        // v. 3.4.0.0
        if mm.varB_OperationProcessed then
        begin
           dm_rc.memUsers.Close;
           dm_rc.memUsers.filtered := false;
           dm_rc.memUsers.Data := dm_rc.rc_GetRecord( mm.varB_Use_FireDac ,
                                                      false,
                                                      ' select codigo,codiemp,nome,email,senha,master,codifunc,avatar ' +
                                                      ' from usuarios ' +
                                                      ' where email = ' + QuotedStr( edUserNameReg.Text ) +
                                                      ' and codiemp = 1' + // verificar a partir da MATRIZ
                                                      ' order by codigo' );
           if mm.varC_LastErrorMsg <> '' then
           begin
               dm_rc.rc_ShowError( mm.varC_LastErrorMsg );
               mm.varB_OperationProcessed := false;
               Exit;
           end;
           if not dm_rc.memUsers.IsEmpty then
           begin
               dm_rc.rc_ShowError( 'Email já cadastrado!' );
               mm.varB_OperationProcessed := false;
               Exit;
           end;
        end;
        if mm.varB_OperationProcessed then
        begin
           rc_SendEmailCode( TUniBitBtn( sender ) , mm.MSG_REGISTER_NEW , edUserNameReg.Text, edNameReg.Text, edPasswordReg.Text);

           if mm.varB_OperationProcessed then
           begin
              paKeyBoard.Visible := True;
              paKeyBoard.Enabled := True;
              btnRegisterUser.Enabled := False;

              edNameReg.SetFocus;
           end
           else
               btnRegisterUser.Enabled := true;
        end
        else
            edUserNameReg.SetFocus;
     end;
end;
// v. 3.2.0.0
procedure TfrmLogin.cbLanguageChange(Sender: TObject);
var
i : integer;
IniFile : TIniFile;
begin
     iniFile := nil; // v. 3.2.0..7
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

procedure TfrmLogin.dbgCompaniesDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
   dm_rc.rc_GridDrawCell( dbgCompanies , ACol, ARow, Column, Attribs ) ;
end;

procedure TfrmLogin.dbgCompaniesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if key = 13 then
     begin
        Key := 0;
        btnEnterClick( self );
     end;
end;

procedure TfrmLogin.edPasswordEnter(Sender: TObject);
begin
     //rc_ScreenAdjustMobileKeyboard( Self, 40 );
end;
procedure TfrmLogin.edPasswordExit(Sender: TObject);
begin
     //rc_ScreenAdjustMobileKeyboard( Self, -40 );
end;

procedure TfrmLogin.edUserNameEnter(Sender: TObject);
begin
     //if ( mm.varB_Mobile_Screen ) then
     //   Self.Top := Self.Top - 40;
end;
// v. 4.0.0.0
// em testes( para RTL )
// in tests( for RTL )
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

procedure TfrmLogin.rc_SendEmailCode(Sender: TObject; pType, pEmail, pUser, pPassword: string);
// v. 3.2.0..7
var
   cMessage: Tstrings;
begin
       TUniBitBtn( sender ).Enabled := False;
       TUniBitBtn( sender ).Tag := 1;

       rc_SortNumbers;

       if pEmail = '' then
       begin
            dm_rc.rc_ShowMessage( 'Email:' + mm.MSG_VALIDATE_OR_BLANK_CONTENT );
            Exit;
       end
       else
       begin
           // email cadastrado ?
           if TUniBitBtn( sender ).Name = 'btnConfirmEmail' then
           begin
               begin
                  dm_rc.memUsers.Close;
                  dm_rc.memUsers.Data := dm_rc.rc_GetRecord( mm.varB_Use_FireDac ,
                                                             false,
                                                             ' select codigo,codiemp,nome,email,senha,master,codifunc,avatar ' + // v. 3.2.0.0...
                                                             ' from usuarios ' +
                                                             ' where email = ' + QuotedStr( edUserNameReg.Text ) );

                  if ( mm.varC_LastErrorMsg <> '' ) or ( dm_rc.memUsers.IsEmpty ) then
                  begin
                      if ( mm.varC_LastErrorMsg <> '' ) then
                         dm_rc.rc_ShowError( mm.varC_LastErrorMsg )
                      else
                        dm_rc.rc_ShowSweetAlert( mm.MSG_INFO, mm.MSG_INVALID_EMAIL, 'warning' ); // v. 3.3.1.0

                      edUserNameReg.SetFocus;
                      Abort;
                  end;
               end;
           end;

           mm.varC_TempString := '';

           mm.varC_Temp1  := IntToStr( Random( 9 ) );
           mm.varC_Temp2  := IntToStr( Random( 9 ) );
           mm.varC_Temp3  := IntToStr( Random( 9 ) );
           mm.varC_Temp4  := IntToStr( Random( 9 ) );
           mm.varC_Temp5  := IntToStr( Random( 9 ) );

           cMessage := TstringList.Create;

           cMessage.Add( ' ' );
           cMessage.Add( pType + ': ' + APP_NAME );

           cMessage.Add( StringOfChar( '-' , 26 ) );
           cMessage.Add( 'Code: ' + mm.varC_Temp1 + ' ' + mm.varC_Temp2 + ' ' +  mm.varC_Temp3 + ' ' +  mm.varC_Temp4 + ' ' +  mm.varC_Temp5 ) ;
           cMessage.Add( StringOfChar( '-' , 26 ) );
           cMessage.Add( ' ' );
           cMessage.Add( ' ' );
           cMessage.Add( ' ' );
           cMessage.Add( SOFTWAREHOUSE_NAME );
           cMessage.Add( ' ' );
           cMessage.Add( SOFTWAREHOUSE_COMMERCIAL_PHONE );
           cMessage.Add( StringOfChar( '-' , 26 ) );
           cMessage.Add( mm.MSG_EMAIL_DO_NOT_REPLY );
           cMessage.Add( StringOfChar( '-' , 26 ) );

//           CC := TstringList.Create;
//           CC.Add( mm.varC_TempString ) ;

           Sleep(100);

           // v. 3.3.1.0
           mm.varB_OperationProcessed := rc_MailSend( mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_USER ,
                                                      mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_PASS ,
                                                      mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_HOST ,
                                                      mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_SMTP_PORT,
                                                      SOFTWAREHOUSE_NAME,
                                                      mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER ,
                                                      pEmail,
                                                      '',
                                                      '[' + pType + '] ' + APP_NAME,
                                                      cMessage,
                                                      mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_TLS = '1',
                                                      mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_SSL = '1'
                                                      );
           // v. 3.3.3.1
           if mm.varB_OperationProcessed then
           begin
              if pType = mm.MSG_PASSWORD_RESET then
              begin
                 dm_rc.rc_ShowSweetAlert( 'Email', mm.MSG_PASSWORD_TEMP_SENT , 'success' );
              end
              else
              begin
                 dm_rc.rc_ShowSweetAlert( 'Email', mm.MSG_CONFIRMATION_CODE, 'success' ) ;
              end;
           end;

           TUniBitBtn( sender ).ModalResult := mrNone;
       end;
end;
// v. 3.2.0.0...
procedure TfrmLogin.rc_SendProvisionalPassword( pNewRegister : Boolean );
// v. 3.2.0..7
var
   cMens,
   cFields, cParams, cPermissions, // v. 3.4.0.0
   _nova_senha : string;
   cMessage: Tstrings;
   f, i, t : integer; // v. 3.4.0.0
   aArrayPermissions : array of Variant; // v. 3.4.0.0
begin
  //carregar usuario( ficara aberto durante todo o uso )
  edNameReg.Text := AnsiUpperCase( edNameReg.Text );

  if not pNewRegister then
  begin
     cMens := mm.MSG_PASSWORD_RESET;

     _nova_senha := GetRandomPassword( 8, 2 ) ;

     dm_rc.memUsers.Close;
     dm_rc.memUsers.Data := dm_rc.rc_GetRecord( mm.varB_Use_FireDac ,
                                                false,
                                                ' select codigo,codiemp,nome,email,senha,master,codifunc,avatar ' + // v. 3.2.0.0...
                                                ' from usuarios ' +
                                                ' where email = ' + QuotedStr( edUserNameReg.Text ) );

     if mm.varC_LastErrorMsg <> '' then
     begin
         dm_rc.rc_ShowError( mm.varC_LastErrorMsg );
         Exit;
     end;
  end
  else
  begin
       cMens := mm.MSG_REGISTER_NEW;
  end;

  mm.varC_TempString := '';
  mm.varC_Temp1  := IntToStr( Random( 9 ) );
  mm.varC_Temp2  := IntToStr( Random( 9 ) );
  mm.varC_Temp3  := IntToStr( Random( 9 ) );
  mm.varC_Temp4  := IntToStr( Random( 9 ) );
  mm.varC_Temp5  := IntToStr( Random( 9 ) );

  cMessage := TstringList.Create;
  cMessage.Add( ' ' );
  cMessage.Add( cMens + ' : ' + APP_NAME );

  if not pNewRegister then
  begin
     cMessage.Add( StringOfChar( '-' , 45 ) );
     cMessage.Add( mm.MSG_PASSWORD_TEMP + _nova_senha ) ;
     cMessage.Add( StringOfChar( '-' , 45 ) );
     cMessage.Add( ' ' );
  end;

  cMessage.Add( ' ' );
  cMessage.Add( SOFTWAREHOUSE_NAME );
  cMessage.Add( ' ' );
  cMessage.Add( SOFTWAREHOUSE_COMMERCIAL_PHONE );
  cMessage.Add( StringOfChar( '-' , 45 ) );
  cMessage.Add( mm.MSG_EMAIL_DO_NOT_REPLY );
  cMessage.Add( StringOfChar( '-' , 45 ) );

//         CC := TstringList.Create;
//         CC.Add( mm.varC_TempString ) ;

  Sleep(100);

  // v. 3.3.1.0
  rc_MailSend( mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_USER ,
               mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_PASS ,
               mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_HOST ,
               mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_SMTP_PORT,
               SOFTWAREHOUSE_NAME,
               mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER ,
               edUserNameReg.Text ,
               '',
               '[' + APP_NAME + '] ' + cMens,
               cMessage,
               mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_TLS = '1',
               mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_SSL = '1'
               );

  dm_rc.sqlGeneric.Close;

  if not pNewRegister then
  begin
     _nova_senha := dm_rc.rc_GetMD5( dm_rc.memUsers.FieldByName('nome').AsString + _nova_senha ) ;

     mm.varC_SQL_GENERIC := ' Update usuarios ' +
                            ' Set senha = ' + QuotedStr( _nova_senha ) +
                            ' Where codigo = ' + dm_rc.memUsers.FieldByName( 'codigo' ).AsString;

     mm.varC_ErrorMsg := dm_rc.rc_ExecuteQuery( mm.varB_Use_FireDac, mm.varC_SQL_GENERIC , [] );
  end
  else
  begin
     mm.varB_OperationProcessed := dm_rc.rc_ProcessFirstConnection;

     if mm.varB_OperationProcessed then
     begin
        i := dm_rc.rc_GetNextID( mm.varB_Use_FireDac , 'usuarios' , 'codigo' , '' );

        mm.varC_SQL_GENERIC := ' Insert into usuarios ( codigo, codiemp, nome, senha , email , dtcadastro, avatar )' +
                               ' Values ( :table_pk , :codiemp, :nome, :senha, :email , :dtcadastro, :avatar )' ;

        mm.varC_ErrorMsg := dm_rc.rc_ExecuteQuery( mm.varB_Use_FireDac,
                                          mm.varC_SQL_GENERIC,
                                          [ i,
                                            1,
                                            AnsiUpperCase( edNameReg.Text ),
                                            dm_rc.rc_GetMD5( AnsiUpperCase( edNameReg.Text ) + edPasswordReg.Text ),
                                            AnsiLowerCase( edUserNameReg.Text ),
                                            now,
                                            'avatar_4.png'
                                          ] );
     end;
  end;

  if mm.varC_ErrorMsg <> '' then
  begin
      mm.varC_SQLERROR := '';
      mm.varC_LastProcFuncError := 'Error saving temporary password' ;
      dm_rc.rc_ShowError( mm.varC_LastProcFuncError );
      Abort;
  end;

  dm_rc.sqlGeneric.Close;

  if not pNewRegister then
     dm_rc.rc_ShowSweetAlert( cMens , mm.MSG_PASSWORD_TEMP_SENT , 'success' ) // v. 3.3.1.0
  else
  begin
     // insert the user permission
     // v. 3.4.0.0
     cFields := '';
     cParams := '';
     cPermissions := '';
     t := 0;
     dm_rc.memUsersPermissions.Close;
     dm_rc.memUsersPermissions.Data := dm_rc.rc_GetRecord(
                                          mm.varB_Use_FireDac ,
                                          False,
                                          ' select * ' +
                                          ' from usuarios_restricoes ' +
                                          ' where 1 <> 1' );
     SetLength( aArrayPermissions, dm_rc.memUsersPermissions.FieldList.Count - 1 );
     aArrayPermissions[t] := i;
     for f := 0 to dm_rc.memUsersPermissions.FieldList.Count - 1 do
     begin
        if DataTypeIsString( dm_rc.memUsersPermissions.FieldList.Fields[f].DataType ) then
        begin
            Inc(t);
            cFields := cFields + dm_rc.memUsersPermissions.FieldList.Fields[f].FieldName ;
            if f < dm_rc.memUsersPermissions.FieldList.Count - 1 then
               cFields := cFields + ',';
            cParams := cParams + ':' + dm_rc.memUsersPermissions.FieldList.Fields[f].FieldName ;
            if f < dm_rc.memUsersPermissions.FieldList.Count - 1 then
               cParams := cParams + ',';

            aArrayPermissions[t] := Crypta( StringOfChar( '0', 50 ) , i.ToString + dm_rc.memUsersPermissions.FieldList.Fields[f].FieldName );
        end;
     end;
     mm.varC_SQL_GENERIC := ' Insert into usuarios_restricoes ( codiuser, ' + cFields ;
     mm.varC_SQL_GENERIC := mm.varC_SQL_GENERIC + ')';
     mm.varC_SQL_GENERIC := mm.varC_SQL_GENERIC  + ' Values ( :codiuser, ' + cParams ;
     mm.varC_SQL_GENERIC := mm.varC_SQL_GENERIC + ')';
     mm.varC_ErrorMsg := dm_rc.rc_ExecuteQuery( mm.varB_Use_FireDac,
                                                mm.varC_SQL_GENERIC,
                                                aArrayPermissions
                                                );
//     mm.varC_SQL_GENERIC := ' Insert into usuarios_restricoes ( codiuser, menus, usuarios, clientes, funcionarios )' +
//                            ' Values( :codiuser, :menus, :usuarios, :clientes, :funcionarios )' ;
//
//     mm.varC_ErrorMsg := dm_rc.rc_ExecuteQuery( mm.varB_Use_FireDac,
//                                                mm.varC_SQL_GENERIC,
//                                                [
//                                                  i,
//                                                  Crypta( StringOfChar( '1', 50 ) , i.ToString + 'menus' ),
//                                                  Crypta( StringOfChar( '0', 50 ) , i.ToString + 'usuarios' ),
//                                                  Crypta( StringOfChar( '0', 50 ) , i.ToString + 'clientes' ),
//                                                  Crypta( StringOfChar( '0', 50 ) , i.ToString + 'funcionarios' )
//                                                ] );
     if mm.varC_ErrorMsg <> '' then
     begin
         mm.varC_SQLERROR := '';
         mm.varC_LastProcFuncError := 'Error saving access restrictions' ;
         dm_rc.rc_ShowError( mm.varC_LastProcFuncError );
         Abort;
     end;
     //insert user access to default company
     mm.varC_SQL_GENERIC := ' Insert into usuarios_empresa ( codiuser, codiemp )' +
                            ' Values( :codiuser, :codiemp )' ;

     mm.varC_ErrorMsg := dm_rc.rc_ExecuteQuery( mm.varB_Use_FireDac,
                                                mm.varC_SQL_GENERIC,
                                                [
                                                  i,
                                                  1
                                                ] );
     if mm.varC_ErrorMsg <> '' then
     begin
         mm.varC_SQLERROR := '';
         mm.varC_LastProcFuncError := 'Error saving access company' ;
         dm_rc.rc_ShowError( mm.varC_LastProcFuncError );
         Abort;
     end;
  end;
  btnBackClick( self );
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
// v. 3.4.0.0
procedure TfrmLogin.UniLoginFormScreenResize(Sender: TObject; AWidth,
  AHeight: Integer);
var
 pX : integer;
 pTop : integer;
begin
     // v. 4.0.0.0
     if not mm.varB_RCFoldersMissing then
     begin
        mm.varI_ScreenWidth := UniApplication.ScreenWidth;
        mm.varI_ScreenHeight := UniApplication.ScreenHeight;
        mm.varI_ScreenWidth  := AWidth;
        mm.varI_ScreenHeight := AHeight;

        // v. 3.4.0.0
        //dm_rc.rc_GetDeviceType;
        dm_rc.rc_ScreenUpdate;

        // Só RECENTRALIZA se houver uma mudança significativa na dimensão da tela
        // no MOBILE, o ACELEROMETRO, fica variando...
        pX := mm.varI_ScreenWidth - Self.Tag;

        if Px < 0 then
           pX := pX *(-1);
        // v. 3.4.0.0
        if mm.varB_Mobile_Screen_Portrait then
        begin
           //   imgLogo.Picture.LoadFromFile( sm.FilesFolderPath +  'images' + BACKSLASH + 'logo_login.png' );
           labLogin.Caption := '<img id="userimg" class="avatar img-thumbnail" src="files/images/logo_loginM.png" alt="Logo Img">';
           labLogin.hint    := '';
        end
        else
        begin
           labLogin.Caption := '';
           labLogin.hint    := '[[' +
                               'ico:fas-user-circle 3x|'+
                               'cls:rc-obj-float'+
                               ']]';
           rc_RenderControlsExecute( Self , '');
        end;
        //if UniApplication.ScreenWidth >= 660 then
        if ( ( mm.varB_Mobile_Screen_Landscape ) or ( not mm.varB_Mobile_Screen ) ) and ( mm.varI_ScreenWidth >= 650 ) then
        begin
           Self.Width := 650;
           Self.Height := 370;
        end
        else
        if ( mm.varB_Mobile_Screen ) then
        begin
           Self.Width := 330;
           Self.Height := 370;
        end;

        Self.Left := ( mm.varI_ScreenWidth div 2 ) - (  Self.Width div 2 );
        // v. 3.4.0.0
        //Self.Top  := 0;
        if mm.varB_Mobile_Screen_Landscape then
           pTop := 0
        else
        if ( mm.varB_Mobile_Screen ) and ( mm.varI_ScreenWidth < mm.varI_ScreenHeight ) then
           pTop := 90
        else
           pTop := ( mm.varI_ScreenHeight div 2 ) - ( self.Height div 2  );
        if pX > 100  then
        begin
           // v. 3.4.0.0
           rc_MoveAnimationForm( self,
                                 self.left,
                                 self.left,
                                 self.top,
                                 pTop,
                                 400,
                                 1 ) ;
           // v. 3.1.0.63
           UniSession.AddJS( 'gsapAnimFormShow( ' + Self.Name + '.' + paLogo.Name + '.id' + ' );' );
           UniSession.AddJS( 'gsapAnimFormShow( ' + Self.Name + '.' + imgLogo.Name + '.id' + ' );' );

           Self.Tag := mm.varI_ScreenWidth;//UniApplication.ScreenWidth;
        end
        else
          Self.Top  := pTop;
     end;
end;
// v. 3.2.0.5
procedure TfrmLogin.UniLoginFormCreate(Sender: TObject);
// v. 3.2.0..7
var
   f,i : integer;
   sString : String;
   sStringSeparada: TStringDynArray;
begin
     // v. 4.0.0.0
     btnLog_In.Enabled   := not mm.varB_RCFoldersMissing;
     labRegister.Enabled := btnLog_In.Enabled;
     labReset.Enabled    := btnLog_In.Enabled;
     cbLanguage.Enabled  := btnLog_In.Enabled;
     if not mm.varB_RCFoldersMissing then
     begin
         // v. 3.4.0.0
         vEmailCode := btnRecPassword2.Left + 12;
         f := 0;// v. 3.2.0..7
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
        // v. 4.0.0.0
        if mm.CONFIG_LAYOUT_ROUND_FORM = 'ON' then
           rc_AddCssClass( Self, 'form-rounded' )
        else
           rc_AddCssClass( Self, 'form-noborder' );


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
end;

procedure TfrmLogin.UniLoginFormReady(Sender: TObject);
begin
     // in development
     rc_Translate( Self, nil , '' , mm.CONFIG_LANGUAGE );
     rc_ConfigTranslateMessages;
end;

initialization
  RegisterAppFormClass(TfrmLogin);

end.
