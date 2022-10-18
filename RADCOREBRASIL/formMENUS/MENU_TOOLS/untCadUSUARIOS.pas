unit untCadUSUARIOS; // v. 4.0.0.0
(*
rcBlock25 ENABLED = TRUE
*)

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, untfrmBaseCRUD, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniEdit,
  uniDateTimePicker, uniCheckBox, uniMultiItem, uniComboBox, uniBasicGrid,
  uniDBGrid, uniPanel, uniPageControl, uniButton, uniBitBtn, uniLabel,
  uniGUIBaseClasses, uniDBComboBox, uniDBDateTimePicker, uniDBEdit,
  uniDBCheckBox, uniSpeedButton, uniScrollBox, Vcl.Menus, uniMainMenu,
  uniHTMLFrame, uniImage, uniFileUpload, uniMemo, uniSweetAlert, uniDBNavigator;

type
  TfrmCadUSUARIOS = class(TfrmBaseCRUD)
    pgComplementData: TUniPageControl;
    tabGeral: TUniTabSheet;
    sboxTab1: TUniScrollBox;
    Tab2: TUniTabSheet;
    uniFileUp: TUniFileUpload;
    UniDBEdit3: TUniDBEdit;
    USUARIOS_EMPRESA: TFDQuery;
    dsUSUARIOS_EMPRESA: TDataSource;
    EMPRESAS: TFDQuery;
    dsEMPRESAS: TDataSource;
    rcBlock120: TUniContainerPanel;
    rcBlock10: TUniContainerPanel;
    edCodigo: TUniDBEdit;
    UniLabel3: TUniLabel;
    rcBlock20: TUniContainerPanel;
    rcBlock60: TUniContainerPanel;
    UniDBCheckBox1: TUniDBCheckBox;
    rcBlock30: TUniContainerPanel;
    UniLabel36: TUniLabel;
    rcBlock80: TUniContainerPanel;
    UniLabel56: TUniLabel;
    rcBlock110: TUniContainerPanel;
    labAlert: TUniLabel;
    rcBlock40: TUniContainerPanel;
    UniLabel4: TUniLabel;
    edLogin: TUniDBEdit;
    rcBlock90: TUniContainerPanel;
    UniLabel51: TUniLabel;
    edLkpFUNCIONARIOS: TUniDBEdit;
    rcBlock50: TUniContainerPanel;
    UniLabel20: TUniLabel;
    edEmail: TUniDBEdit;
    UniLabel33: TUniLabel;
    edPassword: TUniDBEdit;
    rcBlock70: TUniContainerPanel;
    UniLabel34: TUniLabel;
    edNewPassword: TUniEdit;
    chkSalesMan: TUniDBCheckBox;
    rcBlock100: TUniContainerPanel;
    rcBlock105: TUniContainerPanel;
    UniDBEdit1: TUniDBEdit;
    UniContainerPanel4: TUniContainerPanel;
    imgUser: TUniImage;
    btnLoadImg: TUniBitBtn;
    sboxTab2: TUniScrollBox;
    rcBlock190: TUniContainerPanel;
    UniLabel35: TUniLabel;
    edLkpUSUARIOS: TUniDBEdit;
    rcBlock200: TUniContainerPanel;
    btnUncheck: TUniBitBtn;
    rcBlock210: TUniContainerPanel;
    btnTotal: TUniBitBtn;
    rcBlock220: TUniContainerPanel;
    btnBasic: TUniBitBtn;
    rcBlock230: TUniContainerPanel;
    btnMaster: TUniBitBtn;
    rcBlock240: TUniContainerPanel;
    UniPageControl1: TUniPageControl;
    tabEmpresas: TUniTabSheet;
    sboxTab7: TUniScrollBox;
    rcBlock310: TUniContainerPanel;
    btnAddCompany: TUniButton;
    btnDelCompany: TUniButton;
    tabPermissions: TUniTabSheet;
    sboxPermissions: TUniScrollBox;
    rcBlock25: TUniContainerPanel;
    cbLanguage: TUniComboBox;
    paFlag: TUniContainerPanel;
    rcBlock308: TUniContainerPanel;
    dbgUsersCompany_Access: TUniDBGrid;
    rcBlock318: TUniContainerPanel;
    dbgCompanies: TUniDBGrid;
    procedure UniFrameCreate(Sender: TObject);
    procedure btnUncheckClick(Sender: TObject);
    procedure btnTotalClick(Sender: TObject);
    procedure btnBasicClick(Sender: TObject);
    procedure edChk_Menus01Click(Sender: TObject);
    procedure dbgSearchCRUDDblClick(Sender: TObject);
    procedure btnLoadImgClick(Sender: TObject);
    procedure uniFileUpCompleted(Sender: TObject; AStream: TFileStream);
    procedure dsMasterStateChange(Sender: TObject);
    procedure edLkpUSUARIOSClick(Sender: TObject);
    procedure btnNewRegClick(Sender: TObject);
    procedure btnEditRegClick(Sender: TObject);
    procedure btnDeleteRegClick(Sender: TObject);
    procedure btnSaveRegClick(Sender: TObject);
    procedure btnMasterClick(Sender: TObject);
    procedure dbgUsersCompany_AccessDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure dbgCompaniesDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure btnAddCompanyClick(Sender: TObject);
    procedure btnDelCompanyClick(Sender: TObject);
    procedure edLkpUSUARIOSChangeValue(Sender: TObject);
    procedure sqlMasterAfterOpen(DataSet: TDataSet);
  // v. 3.3.0.1
  private
    { Private declarations }
    varC_Object_Name,
    varC_SQL_Insert_Values,
    varC_SQL_Update,
    // translate messages
    cMSG_COMPANY_DELETE,
    cMSG_MASTER_PERMISSION,
    cMSG_RELEASE_PASSWORD,
    cMSG_USER_NAME_CHANGED,
    cMSG_BUGERROR_PERMISSION_REGISTER,
    cMSG_BUGERROR_RESTRICTION_TABLE : string;
    // search and replace: i_NumCamposPermissao   to   i_NumPermissionFields
    i_NumPermissionFields,
    // search and replace: i_Posicao   to   i_Pos
    i_Pos : integer;
    // search and replace: c_NomeUser   to   c_UserName
    c_UserName,
    c_String,
    c_Edit,
    // search and replace: c_Campo   to   c_Field
    c_Field   : string;
    comp_Edit   : TUniEdit;
    comp_ChkBox : TUniCheckBox;
    comp_SwtBtn : TUniLabel;
    // search and replace: varA_Permissions   to   varA_Permissions
    varA_Permissions: Array of String;  // controle de usuários
    // search and replace: a_parametros   to   a_parameters
    // numero de tabelas pra permissionar
    a_parameters : array of Variant;
    // search and replace: Atualiza_CheckBoxes   to   Update_Swt
  public
    { Public declarations }
    procedure Update_Swt( pCode : string );
    procedure Click_ChkBox( Sender : TUniCheckBox );
    function rc_GetInsertUpdateSQL( pState : string ) : string;
    procedure Click_Swt(Sender: TObject );

  end;

implementation

{$R *.dfm}

uses untdm_rc, MainModule, untFrmLookUp,// untDM_LOOKUPs,

  uconsts,
  //uconsts_msgs_portuguese,
  str_func, system.strutils,
  mkm_func_web, Main, ServerModule, mkm_layout;

procedure TfrmCadUSUARIOS.btnBasicClick(Sender: TObject);
begin
  inherited;

  dm_rc.rc_ShowMessage( 'In Development...' );

end;
// v. 3.2.0.7
procedure TfrmCadUSUARIOS.btnLoadImgClick(Sender: TObject);
begin
  inherited;

  uniFileUp.Filter := '*.png';
  uniFileUp.TargetFolder := 'uploads' + BACKSLASH + trim(ed_Table_ItemSel.Text) ;

  if dm_rc.rc_ForceDirectories( uniFileUp.TargetFolder ) then
     uniFileUp.Execute;

end;


procedure TfrmCadUSUARIOS.btnDeleteRegClick(Sender: TObject);
var
   cMSG_COMPANY_DELETE : string;
begin
  // no frmBaseCRUD já tem a critica de MOVIMENTACAO pra o registro que
  // esta sendo deletado...
  //
  // dm_rc.rc_HasCodeRegistered
  //
  // criticas antes da exclusao
  //

  inherited;

  if mm.varB_OperationProcessed then
  begin
       // procedimentos pós-exclusao
       //
       // como um ajuste de saldo...etc...
       if not dm_rc.rc_DeleteRecord( 'usuarios_empresa', ' where codiuser = ' + ed_OldPKValue.Text ) then
       begin
            dm_rc.rc_ShowError( mm.MSG_CONTACT_SUPPORT + sLineBreak + sLineBreak +
                                cMSG_COMPANY_DELETE + sLineBreak + sLineBreak +
                                mm.varC_LastErrorMsg );
       end;
  end;
end;

procedure TfrmCadUSUARIOS.btnUncheckClick(Sender: TObject);
var
   f : integer;
begin
  inherited;

     sqlMaster.FieldByName( 'master' ).AsString := mm.VALUE_NO; // v. 3.4.0.0
     for f := 0 to ComponentCount - 1 do
     begin

          if Self.Components[ f ].ClassName = 'TUniCheckBox' then
          begin

             if lowercase( Copy( Self.Components[ f ].Name, 1, 6 ) ) = 'edchk_' then
             begin

                // formação do nome dos maskedit
                //
                comp_ChkBox := TUniCheckBox( Self.Components[ f ] ) ;
                comp_ChkBox.Checked := False;

             end;

          end
          else
          if Self.Components[ f ].ClassName = 'TUniLabel' then
          begin

             if lowercase( Copy( Self.Components[ f ].Name, 1, 6 ) ) = 'edswt_' then
             begin

                // formação do nome dos maskedit
                //
                comp_SwtBtn := TUniLabel( Self.Components[ f ] ) ;
                comp_SwtBtn.Tag := 0;

             end;

          end
          else
          if Self.Components[ f ].ClassName = 'TUniEdit' then
          begin

             if Pos( 'edpermission_' , lowercase( Self.Components[ f ].Name ) ) > 0 then
             begin

                // formação do nome dos maskedit
                //
                comp_Edit := TUniEdit( Self.Components[ f ] ) ;

                comp_Edit.Text := Replicate( '0' , 50 );

             end;

          end;


     end;

     dm_rc.rc_BootStrapRender( self );

end;

procedure TfrmCadUSUARIOS.btnEditRegClick(Sender: TObject);
begin
  inherited;
     edNewPassword.Text := '';

     Update_Swt( edCodigo.Text );
     // v. 3.1.0.60
     edEmail.Enabled := False;
end;

procedure TfrmCadUSUARIOS.btnTotalClick(Sender: TObject);
// v. 3.2.0.7
var
   f : integer;
begin
  inherited;

// v. 3.2.0.1
//     mm.varB_Processed := dm_rc.memUsers.FieldByName('master').AsString = 'S';
//
//
//     if not mm.varB_Processed then
//     begin
//
//        dm_rc.rc_ShowInputBox( mm.MSG_USER_SUPERIOR_PERMISSION , mm.MSG_USER, '', cMSG_RELEASE_PASSWORD, '', True );
//
//        // é email, pra prevenir erro de digitacao( maiuscula )
//        mm.varC_InputBox_Result1 := lowercase( mm.varC_InputBox_Result1 );
//
//
//        mm.varB_Processed := ( ( dm_rc.rc_GetMD5( mm.varC_InputBox_Result2 ) = mm.varC_UserPassAdmin ) ) and
//                                        ( mm.varC_InputBox_Result1 <> '' ) ;
//
//     end;
//
//     if mm.varB_Processed then
     begin

         for f := 0 to ComponentCount - 1 do
         begin

              if Self.Components[ f ].ClassName = 'TUniCheckBox' then
              begin

                 if lowercase( Copy( Self.Components[ f ].Name, 1, 6 ) ) = 'edchk_' then
                 begin

                    // formação do nome dos maskedit
                    //
                    comp_ChkBox := TUniCheckBox( Self.Components[ f ] ) ;

                    comp_ChkBox.Checked := True;

                 end;

              end
              else
              if Self.Components[ f ].ClassName = 'TUniLabel' then
              begin

                 if lowercase( Copy( Self.Components[ f ].Name, 1, 6 ) ) = 'edswt_' then
                 begin

                    // formação do nome dos maskedit
                    //
                    comp_SwtBtn := TUniLabel( Self.Components[ f ] ) ;
                    comp_SwtBtn.Tag := 1;

                 end;

              end
              else
              if Self.Components[ f ].ClassName = 'TUniEdit' then
              begin

                 if Pos( 'edpermission_' , lowercase( Self.Components[ f ].Name ) ) > 0 then
                 begin

                    // formação do nome dos maskedit
                    //
                    comp_Edit := TUniEdit( Self.Components[ f ] ) ;

                    comp_Edit.Text := Replicate( '1' , 50 );

                 end;

              end;

         end;
     end;

     dm_rc.rc_BootStrapRender( self );

end;

procedure TfrmCadUSUARIOS.btnNewRegClick(Sender: TObject);
begin
  inherited;
     edNewPassword.Text := '';

     Update_Swt( edCodigo.Text );

     // v. 3.1.0.60
     sqlMaster.FieldByName('codiemp').AsInteger := mm.varI_Code_Company;
     USUARIOS_EMPRESA.Close;
     USUARIOS_EMPRESA.ParamByName( 'codiuser' ).AsInteger := sqlMaster.FieldByName( 'codigo' ).AsInteger; // v. 3.1.0.63
     dm_rc.rc_OpenQuery( USUARIOS_EMPRESA );
     //inserir a empresa padrão
     // v. 3.2.0.1
     EMPRESAS.Locate('codigo', mm.varI_Code_Company);
     btnAddCompanyClick( self );
     edEmail.Enabled := True;
end;

procedure TfrmCadUSUARIOS.btnSaveRegClick(Sender: TObject);
// v. 3.2.0.7
var
   cStr,
   cState : string;
   f : integer;
begin
     // se alterou o nome do usuario, tem que redigitar a senha
     // pois a senha é vinculada
     if ( ed_Table_Status.Text <> 'I' ) and
        ( edLogin.Text <> c_UserName ) and
        ( edLogin.Text <> '' )  then
     begin
        sqlMaster.FieldByName( 'Senha' ).AsString  := '';
        edNewPassword.Text := '';

        // para criticar se alterou o nome do usuario
        c_UserName := edLogin.Text;

        dm_rc.rc_ShowMessage( cMSG_USER_NAME_CHANGED ) ;

        edNewPassword.SetFocus;
        Abort;
     end;
     // v. 3.1.0.60
     // removido para demonstrar a VALIDAÇÃO DINÂMICA
     if ( edPassword.Text + edNewPassword.Text = '' ) or
        ( ( ed_Table_Status.Text = 'I' ) and ( edNewPassword.Text = '' ) ) then
     begin
          edNewPassword.Hint := '[[valid:pass]]';
//          dm_rc.rc_ShowMessage( 'Informe a senha do usuário !'  ) ;
//          pgComplementData.ActivePage  := tabGeral;
//          edNovaSenha.SetFocus;
//          Abort;
     end
     else
         edNewPassword.Hint := '';

     if edNewPassword.Text <> '' then
     begin
        mm.varC_TempString := dm_rc.rc_GetMD5( edLogin.Text + edNewPassword.Text );

        if edPassword.Text <> mm.varC_TempString then
           sqlMaster.FieldByName( 'Senha' ).AsString := mm.varC_TempString;
     end;

     // após o inherited, a situação é alterada
     cState := ed_Table_Status.Text;

  inherited;

  // se ocorreu tudo bem, atualizar RESTRICOES
  if mm.varI_ApplyUpdateErrors = 0 then
  begin
       // como não uso campo autoincremento, atualizo o codigo do MASTER nos respectivos registros DETAIL após a gravação
       dm_rc.rc_UpdateDetailField( mm.varI_ApplyUpdateErrors,
                                   ed_Table_Status_OLD.Text,
                                   USUARIOS_EMPRESA,
                                   'codiuser',
                                   sqlMaster.FieldByName('codigo').AsInteger );

       //mm.SQLConn.StartTransaction;
//       if FDSchemaAdapter1.ChangeCount > 0 then
//       begin
//         mm.varI_ApplyUpdateErrors := FDSchemaAdapter1.ApplyUpdates(-1);
//       end;

       // se for o usuario atual, atualiza avatar
       if mm.varI_User = sqlMaster.FieldByName( 'codigo' ).AsInteger then
       begin
          MainForm.imgUSer.Caption := '<img id="userimg" class="avatar img-thumbnail" src="uploads\usuarios\' + ExtractFileName( sqlMaster.FieldByName( 'avatar' ).AsString ) + '" alt="User Img">';
       end;
       // saber se a opercao foi concluida( alteracao / cadastro / exclusao )
       mm.varB_OperationProcessed := True;
       // gerar INSERT / UPDATE
       mm.varC_SQL_GENERIC := rc_GetInsertUpdateSQL( cState );

       if mm.varC_SQL_GENERIC <> '' then
       begin
          mm.varC_LastErrorMsg := dm_rc.rc_ExecuteQuery( mm.varB_Use_FireDac,
                                                         mm.varC_SQL_GENERIC,
                                                         a_parameters );
          if mm.varC_LastErrorMsg <> '' then
          begin
               dm_rc.rc_ShowError( mm.MSG_CONTACT_SUPPORT + sLineBreak + sLineBreak +
                                     cMSG_BUGERROR_PERMISSION_REGISTER + sLineBreak + sLineBreak +
                                     mm.varC_LastErrorMsg );
               Exit;
          end;
       end;
       //Atualiza RESTRICAO do usuario que sofreu alteração( se for o mesmo que está logado )
       if ( dm_rc.memUsersPermissions.FieldByName('codiuser').AsString = edCodigo.Text ) then
       begin
          dm_rc.memUsersPermissions.Close;
          dm_rc.memUsersPermissions.Data := dm_rc.rc_GetRecord( mm.varB_Use_FireDac ,
                                                           false,
                                                           ' select * ' +
                                                           ' from usuarios_restricoes ' +
                                                           ' where codiuser = ' + edCodigo.Text );
          if mm.varC_LastErrorMsg <> '' then
          begin
             dm_rc.rc_ShowError( mm.MSG_CONTACT_SUPPORT + sLineBreak + sLineBreak +
                                      cMSG_BUGERROR_PERMISSION_REGISTER + sLineBreak + sLineBreak +
                                      mm.varC_LastErrorMsg );
             Abort;
          end;
       end;

       //Atualiza RESTRICAO de todos usuários que estão VINCULADOS
       //
       dm_rc.sqlGetDataSet.Close;

       dm_rc.sqlGetDataSet.SQL.Text := ' select usuarios_restricoes.*, u.id_grupo ' +
                                       ' from usuarios_restricoes ' +
                                       ' left join usuarios u' +
                                       ' on u.codigo = usuarios_restricoes.codiuser ' +
                                       ' where u.id_grupo = ' + edCodigo.Text ;

       dm_rc.rc_OpenQuery( dm_rc.sqlGetDataSet );

       While not dm_rc.sqlGetDataSet.eof do
       begin
          dm_rc.sqlGetDataSet.Edit;

          for f := 0 to i_NumPermissionFields do
          begin
              comp_Edit := nil;
              comp_Edit := TUniEdit( Self.FindComponent( 'edpermission_' + varA_Permissions[ f ] ) );

              cStr := Crypta( comp_Edit.Text , dm_rc.sqlGetDataSet.FieldByName( 'codiuser' ).AsString + varA_Permissions[ f ] );

              dm_rc.sqlGetDataSet.FieldByName( varA_Permissions[ f ] ).AsString := cStr;
          end;

          dm_rc.sqlGetDataSet.Post;

          dm_rc.sqlGetDataSet.Next;
       end;

       // v. 3.1.0.60
       mm.varI_ApplyUpdateErrors := dm_rc.sqlGetDataSet.ApplyUpdates(-1);
       if mm.varI_ApplyUpdateErrors > 0 then
       begin
          dm_rc.rc_ApplyUpdatesError( dm_rc.sqlGetDataSet, mm.varI_ApplyUpdateErrors, mm.MSG_BUGERROR_POST );
       end;

       dm_rc.sqlGetDataSet.Close;

       // v. 3.1.0.60
       // para manter cadastrando...
       // não tem como fazermos isso aqui, pois, o código do botão SALVAR é herdado no seu formulário para poder
       // executar processos específicos após o usuário clicar em SALVAR( veja o exemplo no "frmCadUsuarios" )
       // então, para conseguir esse recurso, será necessário adicionar um código no final do evento do "btnSaveReg" do
       // seu respectivo form herdado de "frmBaseCRUD"
       //
       // to keep registering ...
       // there is no way we can do that here, because the SAVE button code is inherited in your form to be able to
       // execute specific processes after the user clicks SAVE (see the example in "frmCadUsuarios")
       // so, to get this feature, you will need to add a code at the end of the "btnSaveReg" event
       // its respective form inherited from "frmBaseCRUD"
       if ( ed_AskNewRec_AfterPost.Text = 'true' ) and ( cState = 'I' ) then
       begin
         dm_rc.rc_ShowYesNo( mm.MSG_CONTINUE_REGISTERING );
         if mm.varB_Yes then
            btnNewReg.Click
         else
            pgBaseCadControl.ActivePage := tabSearch;
       end
       else
           pgBaseCadControl.ActivePage := tabSearch;
  end;
end;

procedure TfrmCadUSUARIOS.Update_Swt( pCode : string );
var
   f , i : integer;
begin
     inherited;
     //if StrToIntDef( pCode, 0 ) > 0 then
     begin
       // para criticar se alterou o nome do usuario
       //
       c_UserName := edLogin.Text;

       //preencher informações de permissionamento
       dm_rc.memUsersPermissionsEdit.Close;
       dm_rc.memUsersPermissionsEdit.Data := dm_rc.rc_GetRecord( mm.varB_Use_FireDac ,
                                                               false,
                                                               ' select * ' +
                                                               ' from usuarios_restricoes ' +
                                                               ' where codiuser=' + pCode );
       if mm.varC_LastErrorMsg <> '' then
       begin
           dm_rc.rc_ShowSweetAlert( mm.MSG_INFO, mm.varC_LastErrorMsg, 'warning' ); // v. 3.3.1.0
           Abort;
       end;
       //----------------------------------------------------------------------------
       // controle de permissionamento
       //
       // saber quantos campos de permissionamento existem pra montar tudo dinâmico( prefixo: edpermission_ )
       SetLength( varA_Permissions , 500 );

       i_NumPermissionFields := -1;

       for f := 0 to ComponentCount - 1 do
       begin
            if Self.Components[ f ].ClassName = 'TUniEdit' then
            begin
               if Pos( 'edpermission_' , lowercase( Self.Components[ f ].Name ) ) > 0 then
               begin
                  // formação do nome dos maskedit
                  comp_Edit := nil;
                  comp_Edit := TUniEdit( Self.Components[ f ] ) ;

                  Inc( i_NumPermissionFields );
                  varA_Permissions[ i_NumPermissionFields ] := Lowercase( Trim( StringReplace( lowercase(comp_Edit.Name), 'edpermission_', '', [rfReplaceAll] ) ) );
               end;
            end;
       end;

       SetLength( varA_Permissions , i_NumPermissionFields + 1 );

       for f := 0 to i_NumPermissionFields do
       begin
            // formação do nome dos maskedit
            comp_Edit := nil;
            comp_Edit := TUniEdit( Self.FindComponent( 'edpermission_' + varA_Permissions[ f ] ) );

            // se existir o componente, processa...
            if comp_Edit <> nil then
            begin
               If dm_rc.memUsersPermissionsEdit.FieldList.IndexOf ( varA_Permissions[ f ] ) > 0 then
               begin
                  if ( dm_rc.memUsersPermissionsEdit.IsEmpty ) or ( Length( dm_rc.memUsersPermissionsEdit.FieldByName( varA_Permissions[ f ] ).AsString ) < 50 ) then
                  begin
                       comp_Edit.Text := Replicate( '0' , 50 );
                  end
                  else
                  begin
                     comp_Edit.Text := dm_rc.memUsersPermissionsEdit.FieldByName( varA_Permissions[ f ] ).AsString ;
                     comp_Edit.Text := DeCrypta( comp_Edit.Text , pCode + varA_Permissions[ f ]  );
                  end;

                  for i := 1 to 50 do  // 111111111111111111111111111111
                  begin
                       comp_SwtBtn := nil;
                       comp_SwtBtn := TUniLabel( Self.FindComponent( 'edswt_' + varA_Permissions[ f ] + StrZero( i, 2 ) ) );

                       if comp_SwtBtn <> nil then
                       begin
                          comp_SwtBtn.Tag := StrToIntDef( Copy( comp_Edit.Text , i, 1 ), 0 );
                          dm_rc.rc_SwtCheck( Self, comp_SwtBtn.Name, ( comp_SwtBtn.Tag = 1 ), true );
                          //comp_SwtBtn.Checked := ( comp_ChkBox.tag = 1 );

                       end
                       else
                           Break;
                  end;
               end
               else
               begin
                   dm_rc.rc_ShowError( format( cMSG_BUGERROR_RESTRICTION_TABLE, [ varA_Permissions[ f ] ] ) );
                   Abort; // v. 3.1.0.61
               end;
            end
            else
                Break;
       end;
     end;
end;

procedure TfrmCadUSUARIOS.Click_Swt(Sender: TObject);
var
    // search and replace: cPosicaoClicada   to   cClickedPos
   cClickedPos : string;
begin
   // montar a string de permissionamento pra cada TABELA( que referencia um CAMPO na tabela USUARIOS_RESTRICOES )
   //
   // formato: ed_shpchk_usuarios01
   //
   //          ed_shpchk_ : prefixo que indica pro RadCORE um CHECKBOX( pra responder os eventos de marcação )
   //          usuarios01 : usuarios indica a TABELA que essa sequencia faz parte e 01 a posição de crítica
   //
   // ( 50 posicoes / recursos q podem ser criticados por tela )
   // pra cada checkbox é formada uma string, esta vai ser bi-criptografada por segurança no banco de dados
   // ( pode parecer desnecessário, mas tem uma galera 'do mal' que desenrola fácil essas coisas, melhor prevenir )
   //
   // string:   11101111111111111111111111111111111111111111111111
   //
   // posições: 1 - Critica o ACESSO    ( 0 - nao tem  , 1 - tem )
   //           2 - Critica o CADASTRO  ( 0 - nao pode , 1 - pode )
   //           3 - Critica o ALTERAÇÃO ( 0 - nao pode , 1 - pode )
   //           4 - Critica o EXCLUSÃO  ( 0 - nao pode , 1 - pode )

   //           Dessa forma as posições de 1 a 4 SEMPRE serão padrões e poderão ser criadas permissoes
   //           ESPECÍFICAS pra cada TELA, por exemplo:
   //
   //           CLIENTES: posição 5 - poderia ser: Criticar BLOQUEIO do cliente
   //
   //           CONTAS A RECEBER: posição 5 - poderia ser: Criticar alteração da data de vencimento
   //
   varC_Object_Name := Lowercase( TComponent( Sender ).Name );

   i_Pos := StrToIntDef( AnsiRightStr( varC_Object_Name , 2 ), 0 );
   c_Field   := Copy( varC_Object_Name , 7, Length( varC_Object_Name ) );
   c_Field   := Copy( c_Field , 1, Length( c_Field ) - 2 );
   c_Edit    := 'edpermission_' + c_Field;

   comp_Edit := TUniEdit( Self.FindComponent( c_Edit ) );

   // se cliquei no checkbox padrao RadCore...
   if comp_Edit <> nil then
   begin
        c_String := comp_Edit.Text;

        comp_SwtBtn := TUniLabel( Self.FindComponent( varC_Object_Name ) );

        if comp_SwtBtn <> nil then
        begin
           cClickedPos := IntToStr( comp_SwtBtn.Tag );

           comp_Edit.Text := Trim( Copy( c_String , 1 , i_Pos - 1 ) + cClickedPos + Copy( c_String , i_Pos + 1 , 100 ) );
        end;
   end;
end;

procedure TfrmCadUSUARIOS.Click_ChkBox(Sender: TUniCheckBox);
var
   cClickedPos : string;
begin

   // montar a string de permissionamento pra cada TABELA( que referencia um CAMPO na tabela USUARIOS_RESTRICOES )
   //
   // formato: ed_shpchk_usuarios01
   //
   //          ed_shpchk_ : prefixo que indica pro RadCORE um CHECKBOX( pra responder os eventos de marcação )
   //          usuarios01 : usuarios indica a TABELA que essa sequencia faz parte e 01 a posição de crítica
   //
   // ( 50 posicoes / recursos q podem ser criticados por tela )
   // pra cada checkbox é formada uma string, esta vai ser bi-criptografada por segurança no banco de dados
   // ( pode parecer desnecessário, mas tem uma galera 'do mal' que desenrola fácil essas coisas, melhor prevenir )
   //
   // string:   11101111111111111111111111111111111111111111111111
   //
   // posições: 1 - Critica o ACESSO    ( 0 - nao tem  , 1 - tem )
   //           2 - Critica o CADASTRO  ( 0 - nao pode , 1 - pode )
   //           3 - Critica o ALTERAÇÃO ( 0 - nao pode , 1 - pode )
   //           4 - Critica o EXCLUSÃO  ( 0 - nao pode , 1 - pode )

   //           Dessa forma as posições de 1 a 4 SEMPRE serão padrões e poderão ser criadas permissoes
   //           ESPECÍFICAS pra cada TELA, por exemplo:
   //
   //           CLIENTES: posição 5 - poderia ser: Criticar BLOQUEIO do cliente
   //
   //           CONTAS A RECEBER: posição 5 - poderia ser: Criticar alteração da data de vencimento
   //

   varC_Object_Name := Lowercase( TComponent( Sender ).Name );

   i_Pos := StrToIntDef( AnsiRightStr( varC_Object_Name , 2 ), 0 );
   c_Field   := Copy( varC_Object_Name , 7, Length( varC_Object_Name ) );
   c_Field   := Copy( c_Field , 1, Length( c_Field ) - 2 );
   c_Edit    := 'edpermission_' + c_Field;

   comp_Edit := TUniEdit( Self.FindComponent( c_Edit ) );

   // se cliquei no checkbox padrao RadCore...
   //
   if comp_Edit <> nil then
   begin

        c_String := comp_Edit.Text;

        comp_ChkBox := TuniCheckBox( Self.FindComponent( varC_Object_Name ) );

        if comp_ChkBox <> nil then
        begin

           cClickedPos := Copy( c_String , 1 , i_Pos );

           if comp_ChkBox.Checked then
              cClickedPos := '1'
           else
               cClickedPos := '0';

           comp_Edit.Text := Trim( Copy( c_String , 1 , i_Pos - 1 ) + cClickedPos + Copy( c_String , i_Pos + 1 , 100 ) );

        end;
   end;

end;

procedure TfrmCadUSUARIOS.dbgUsersCompany_AccessDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  inherited;
   //mm.varC_Table_Search := ed_Table_ItemSel.Text;
   //mm.varC_FieldMasks   := ed_FieldMasks.Text;

   dm_rc.rc_GridDrawCell( TUniDBGrid( sender ) , ACol, ARow, Column, Attribs ) ;

end;


procedure TfrmCadUSUARIOS.dbgCompaniesDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  inherited;
   //mm.varC_Table_Search := ed_Table_ItemSel.Text;
   //mm.varC_FieldMasks   := ed_FieldMasks.Text;

   dm_rc.rc_GridDrawCell( TUniDBGrid( sender ) , ACol, ARow, Column, Attribs ) ;

end;

procedure TfrmCadUSUARIOS.dbgSearchCRUDDblClick(Sender: TObject);
begin
  inherited;
     edNewPassword.Text := '';

end;

procedure TfrmCadUSUARIOS.edChk_Menus01Click(Sender: TObject);
begin
  inherited;
  Click_ChkBox( TUniCheckBox( Sender ) );
end;

// feedback by JR PIRES
procedure TfrmCadUSUARIOS.edLkpUSUARIOSChangeValue(Sender: TObject);
begin
  inherited;
  if sqlMaster.State in [dsEdit, dsInsert] then
     Update_Swt( dm_rc.rc_IntToString( sqlMaster.FieldByName( 'id_grupo' ).AsInteger ) );
end;

procedure TfrmCadUSUARIOS.edLkpUSUARIOSClick(Sender: TObject);
begin
  inherited;

  if sqlMaster.State in [dsEdit, dsInsert] then
     dm_rc.rc_LookUpSearchFilter( Sender, ed_PK.Text + ' <> ' + sqlMaster.FieldByName( 'codigo' ).AsString, '', '' );
end;

function TfrmCadUSUARIOS.rc_GetInsertUpdateSQL( pState : string ) : string;
// v. 3.2.0.7
var
   i : integer;
   cSqlTemp : string;
begin
     // cadastro ou alteração ?
     //
     varC_SQL_Insert_Values := '';
     varC_SQL_Update := '';

     SetLength( a_parameters, 500 );

     if i_NumPermissionFields > 0 then
        for i := 0 to i_NumPermissionFields do
        begin

//            cBinaryEdit := '';
//            for f := 1 to 114 do
//            begin
//
//               comp_SwtBtn := TUniLabel( Self.FindComponent( 'edSwt_' + varA_Permissions[ i ] + StrZero( f, 2 ) ) );
//
//               if comp_SwtBtn <> nil then
//               begin
//
//                  cClickedPos := IntToStr( comp_SwtBtn.Tag );
//
//                  cBinaryEdit := cBinaryEdit + cClickedPos;
//
//               end
//               else
//               begin
//                   cBinaryEdit := cBinaryEdit + StringOfChar( '0', 144 );
//                   cBinaryEdit := Copy( cBinaryEdit , 1, 50 );
//                   Break;
//               end;
//            end;


           // EM PRODUCAO, remova o trecho abaixo: or ( dm.memUsersPermissionsEdit.IsEmpty )
           //
           // ele INSERE um permissionamento se estiver VAZIO( pra fins de teste )
           //
           if ( pState = 'I' ) or ( dm_rc.memUsersPermissionsEdit.IsEmpty ) then
           begin

              // formação do nome dos maskedit
              //
              comp_Edit := nil;
              comp_Edit := TUniEdit( Self.FindComponent( 'edpermission_' + varA_Permissions[ i ] ) );

              if comp_Edit <> nil then
              begin
                 a_parameters[ i + 2 ] := Crypta( comp_Edit.Text , edCodigo.Text + varA_Permissions[ i ] );

                 varC_SQL_Insert_Values := varC_SQL_Insert_Values + ':' + varA_Permissions[ i ] + ' , ';
              end;


           end
           else
           begin

              // formação do nome dos maskedit
              //
              comp_Edit := nil;
              comp_Edit := TUniEdit( Self.FindComponent( 'edpermission_' + varA_Permissions[ i ] ) );

              if comp_Edit <> nil then
              begin
                 a_parameters[ i ] := Crypta( comp_Edit.Text , edCodigo.Text + varA_Permissions[ i ] );

                 varC_SQL_Update := varC_SQL_Update + varA_Permissions[ i ] + ' = :' + varA_Permissions[ i ] + ' , ';
              end;

           end;

        end;

     //remover a ultima ','
     varC_SQL_Insert_Values := Trim( Copy( varC_SQL_Insert_Values, 1, Length( varC_SQL_Insert_Values ) - 2 ) );
     varC_SQL_Update        := Trim( Copy( varC_SQL_Update, 1, Length( varC_SQL_Update ) - 2 ) );


     if varC_SQL_Insert_Values <> '' then
     begin

        a_parameters[ 00 ] := StrToIntDef( edCodigo.Text, 0 );
        a_parameters[ 01 ] := mm.varI_Code_Company;

        SetLength( a_parameters , i_NumPermissionFields + 3 );
        //campos fora do padrao( edpermission_ )
        varC_SQL_Insert_Values := ':codiuser , :codiemp , ' + varC_SQL_Insert_Values;

        cSqlTemp := ' Insert Into usuarios_restricoes ' +
                    ' ( ' + StringReplace( varC_SQL_Insert_Values, ':', '', [rfReplaceAll] ) + ' ) ' +
                    ' Values ' +
                    ' ( ' + varC_SQL_Insert_Values + ' ) ' ;

     end
     else
     if varC_SQL_Update <> '' then
     begin

           SetLength( a_parameters , i_NumPermissionFields + 1 );

           cSqlTemp := ' Update usuarios_restricoes ' +
                       ' Set ' + varC_SQL_Update +
                       ' Where codiuser = ' + edCodigo.Text;


     end;

     Result := cSqlTemp ;

end;

procedure TfrmCadUSUARIOS.sqlMasterAfterOpen(DataSet: TDataSet);
begin
  inherited;
  USUARIOS_EMPRESA.close;
  USUARIOS_EMPRESA.ParamByName('codiuser').AsInteger := sqlMaster.FieldByName( 'codigo' ).AsInteger; // v. 3.1.0.63
  dm_rc.rc_OpenQuery( USUARIOS_EMPRESA );
end;

procedure TfrmCadUSUARIOS.btnDelCompanyClick(Sender: TObject);
begin
  inherited;

  // v. 3.2.0.0 ( thanks Mohamed Ammar )
  if USUARIOS_EMPRESA.RecordCount = 1 then
  begin
       dm_rc.rc_ShowSweetAlert( mm.MSG_WARNING, 'Almost one company must be registered!', 'warning'  );
       Exit;
  end;

  USUARIOS_EMPRESA.Delete;

  mm.varI_ApplyUpdateErrors := USUARIOS_EMPRESA.ApplyUpdates(-1);

  if mm.varI_ApplyUpdateErrors > 0 then
  begin
     dm_rc.rc_ApplyUpdatesError( sqlMaster, mm.varI_ApplyUpdateErrors, mm.MSG_BUGERROR_POST );
  end;

  USUARIOS_EMPRESA.Close;
  USUARIOS_EMPRESA.ParamByName( 'codiuser' ).AsInteger := sqlMaster.FieldByName( 'codigo' ).AsInteger; // v. 3.1.0.63
  USUARIOS_EMPRESA.Open;
end;

procedure TfrmCadUSUARIOS.btnAddCompanyClick(Sender: TObject);
begin
  inherited;
  USUARIOS_EMPRESA.Insert;
  USUARIOS_EMPRESA.FieldByName( 'codiuser' ).AsInteger := sqlMaster.FieldByName( 'codigo' ).AsInteger;
  USUARIOS_EMPRESA.FieldByName( 'codiemp' ).AsInteger  := EMPRESAS.FieldByName( 'codigo' ).AsInteger;
  // v. 3.1.0.63
  // por favor...me deem um feedback se isso gera um erro com SQLSERVER
  // please...give me feedback if this generates an error with SQLSERVER
  USUARIOS_EMPRESA.FieldByName( 'empresa' ).ReadOnly   := False;
  USUARIOS_EMPRESA.FieldByName( 'empresa' ).AsString   := EMPRESAS.FieldByName('empresa').AsString;
  USUARIOS_EMPRESA.Post;

  if ( ed_Table_Status.Text = 'E' ) then
  begin
     mm.varI_ApplyUpdateErrors := USUARIOS_EMPRESA.ApplyUpdates(-1);

     if mm.varI_ApplyUpdateErrors > 0 then
     begin
        dm_rc.rc_ApplyUpdatesError( sqlMaster, mm.varI_ApplyUpdateErrors, mm.MSG_BUGERROR_POST );
     end;

     dm_rc.rc_OpenQuery( USUARIOS_EMPRESA );
  end;
end;

procedure TfrmCadUSUARIOS.btnMasterClick(Sender: TObject);
begin
  inherited;
// v. 3.2.0.1
//     mm.varB_Processed := dm_rc.memUsers.FieldByName('master').AsString = 'S';
//
//     if not mm.varB_Processed then
//     begin
//
//        dm_rc.rc_ShowInputBox( mm.MSG_USER_SUPERIOR_PERMISSION , mm.MSG_USER, '', mm.MSG_USER_RELEASE_PASSWORD, '', True );
//
//        // é email, pra prevenir erro de digitacao( maiuscula )
//        mm.varC_InputBox_Result1 := lowercase( mm.varC_InputBox_Result1 );
//
//
//        mm.varB_Processed := ( ( dm_rc.rc_GetMD5( mm.varC_InputBox_Result2 ) = mm.varC_UserPassAdmin ) ) and
//                             ( mm.varC_InputBox_Result1 <> '' ) ;
//     end;
//
//     if mm.varB_Processed then
     begin
         sqlMaster.FieldByName( 'master' ).AsString := mm.VALUE_YES; // v. 3.4.0.0
         btnTotalClick( self ); // v. 4.0.0.0
         dm_rc.rc_ShowSweetAlert( mm.MSG_SUCCESS , cMSG_MASTER_PERMISSION , 'success' );
     end;
end;

// v. 3.1.0.60
procedure TfrmCadUSUARIOS.dsMasterStateChange(Sender: TObject);
var
   i,f : integer;
begin
  inherited;

  imgUser.Picture.Bitmap := nil;

  if ( sqlMaster.FieldByName( 'avatar' ).AsString <> '' ) and
     ( FileExists( sqlMaster.FieldByName( 'avatar' ).AsString ) ) then
     imgUser.Picture.LoadFromFile( sqlMaster.FieldByName( 'avatar' ).AsString );

  // v. 3.2.0.1
  dm_rc.rc_ObjectEnabled( Self, btnUncheck, ( dsMaster.State in [dsInsert, dsEdit] ) );
//  dm_rc.rc_ObjectEnabled( Self, btnTotal, btnUncheck.Enabled );
//  dm_rc.rc_ObjectEnabled( Self, btnMaster, btnUncheck.Enabled );
  dm_rc.rc_ObjectEnabled( Self, btnBasic, btnUncheck.Enabled );
  dm_rc.rc_ObjectEnabled( Self, btnAddCompany, btnUncheck.Enabled );
  dm_rc.rc_ObjectEnabled( Self, btnDelCompany, btnUncheck.Enabled );
  dm_rc.rc_ObjectEnabled( Self, btnLoadImg, btnUncheck.Enabled );
  btnMaster.Enabled := dm_rc.rc_PermissionVerify( ed_FormOrigin_Tab.Text ,
                                                 Trim( ed_Table_ItemSel.Text ) ,
                                                 6 , true, false ) ;
  btnTotal.Enabled := dm_rc.rc_PermissionVerify( ed_FormOrigin_Tab.Text ,
                                                 Trim( ed_Table_ItemSel.Text ) ,
                                                 7 , true, false) ;
  dm_rc.rc_ObjectEnabled( Self, btnTotal, btnUncheck.Enabled and btnTotal.Enabled);
  dm_rc.rc_ObjectEnabled( Self, btnMaster, btnUncheck.Enabled and btnMaster.Enabled );

  f := 0;
  for I := 1 to ComponentCount - 1 do
  begin

       if Pos( 'reportmenuclientes' , lowercase( Components[ i ].Name ) ) > 0 then
          f := f;

       if ( Pos( 'edswt_', Components[ i ].Name ) > 0 ) then
          dm_rc.rc_SwtEnabled( Self, Components[ i ].Name, ( dsMaster.State in [dsInsert, dsEdit] ) );
  end;

  // caso utilize algum 'componente BS_COMPONENTS' utilize as instruções abaixo
  // para renderização correta
  //if dsMaster.State <> dsInactive then
  //   dm_rc.rc_BootStrapRender( self, True );
end;
// v. 3.2.0.7
procedure TfrmCadUSUARIOS.uniFileUpCompleted(Sender: TObject;
  AStream: TFileStream);
begin
  inherited;

  imgUser.Picture.LoadFromFile( AStream.FileName );

  if sqlMaster.State in [dsEdit, dsInsert] then
  begin
     sqlMaster.FieldByName( 'avatar' ).AsString := AStream.FileName;
  end;
end;
// v. 3.3.0.0
procedure TfrmCadUSUARIOS.UniFrameCreate(Sender: TObject);
var
   b, iLastF, iLastB, iAccordion, // v. 3.3.3.0
   p, f, i, t, seq : integer;

   cGroup,
   cOption,
   cTable,
   cFrm,
   cTemp, cTmp, cTmpOld : string; // v. 3.0.0.155

   pBlock,
   pBlock2 : TUniContainerPanel;
   pLabel  : TUniLabel;
   pEdit   : TUniEdit;
begin

  //inherited;

  // -----------------------------------------------------------------
  //
  //
  // tab.codigo por tab.[[pk]]
  //
  // O objetivo foi facilitar deixando o 'coringa' [[pk]]' ser substituido no frmBaseCRUD pela respectiva
  // chave primaria da tabela atual que foi vinculada no click do menu principal
  //
  // haverá situações que precisarão de alteraçao, mas seguindo a estrutura proposta, já ajuda
  //
  sqlMaster.close;
  sqlMaster.SQL.Text := ' SELECT [[fields]]  ' +
                        '   FROM [[table]] tab ' +
                        '  WHERE tab.[[pk]] = :table_pk ' +  // Apenas cadastro MESTRE é necessário o WHERE( por enquanto )

                        ' [grid] ' + // este 'coringa' indica ao RadCORE o início da query usada na pesquisa padrão

                        ' SELECT ' +

                        '   tab.[[pk]] as "CÓDIGO", ' +
                        '   tab.Nome , ' +
                        '   tab.Email as Login, ' +
                        //'   tab.Externo as Vendedor , ' +
                        '        [[allpks]] ' +   // só é necessário o [[allpks]] aqui se estiver usando ALIAS em um campo CHAVE PRIMARIA

                        ' FROM  [[table]] tab ' ;

  ed_Where_Search.Text := ' tab.codiemp = ' + IntToStr( mm.varI_Code_Company );
  ed_Order_Search.Text := '';

  // v. 4.0.0.0
  dbgSearchCRUD.Hint := '[[' +
                        'fieldmasks:' +
                        //'grid-noforcefit|' +
                        //'model-crud:1|' +
                        //'grid-forcefit:3|' +
                        'grid-resize|' ;
  dbgSearchCRUD.Hint := dbgSearchCRUD.Hint +
                        'Código[[' +
                        //'      locked|' +
                        '    width:20% mobile-h:20% mobile-v:30%]];' + // v. 3.3.3.0

                        'Nome[[' +
                        '    width:50% mobile-h:50% mobile-v:40%]];' + // v. 3.3.3.0
                        // v. 3.3.0.0
                        'Login[[' +
                        '    width:30% mobile-h:30% mobile-v:30%]];' +

                        'Vendedor[[' +
                        '    visible:false]];';
  dbgSearchCRUD.Hint := dbgSearchCRUD.Hint +
                        ']]' ;

  mm.varI_NumMenu      := Length( mm.varA_FSideMenu );

  sboxPermissions.ScrollTo( 0,0 );

  t          := 10;
  seq        := 0;
  cTmpOld    := '.';
  cTmp       := '';
  b          := 0;
  cFrm       := '';
  iAccordion := 0; // v. 3.3.3.0

  // v. 3.2.0.7
  pBlock := nil;
  i      := 0;

  try
     UniSession.SuspendLayouts();

     for f  := 1 to mm.varI_NumMenuPermissions - 1 do
     begin
          if Trim( mm.varA_FSideMenuPermissions[ f ] ) = '' then break;

          cGroup  := Copy( mm.varA_FSideMenuPermissions[ f ], 1, Pos( '<|>', mm.varA_FSideMenuPermissions[ f ] ) - 1 );
          cTmp    := StringReplace( mm.varA_FSideMenuPermissions[ f ], cGroup + '<|>', '', [rfReplaceAll] );

          cOption := Copy( cTmp, 1, Pos( '<|>', cTmp ) - 1 );
          cTmp    := StringReplace( cTmp, cOption + '<|>', '', [rfReplaceAll] );

          cTable  := Copy( cTmp, 1, Pos( '<|>', cTmp ) - 1 );
          cTmp    := StringReplace( cTmp, cTable + '<|>', '', [rfReplaceAll] );

          cFrm    := Copy( cTmp, 1, Pos( '<|>', cTmp ) - 1 );
          cTmp    := StringReplace( cTmp, cFrm + '<|>', '', [rfReplaceAll] );

          p := Pos( '__', cTable ) ;
          if p > 1 then
          begin
             cTemp  := cTable;
             cTable := Copy( cTemp, 1, p-1 );
             cFrm   := Copy( cTemp, p+2, 200 );
             cTmp    := StringReplace( cTmp, cTable + '<|>', '', [rfReplaceAll] );
          end
          else
          begin

             if cFrm = '' then
             begin
                cFrm    := Copy( cTmp, 1, Pos( '<|>', cTmp ) - 1 );
                cTmp    := StringReplace( cTmp, cFrm + '<|>', '', [rfReplaceAll] );

                if Copy ( cFrm, 1, 2 ) = '__' then
                   cFrm := Copy( cFrm, 3, 200 );

                if cFrm = '' then
                   If Copy( cTable, 1, 2 ) = '__' then
                      cFrm := Trim( Copy( cTable, 3, 100 ) )
                   else
                      cFrm := cTable;
             end;
          end;
          // v. 3.2.0.7
          //cTmp    := ReturnLetters( cTmp );
          cTmp    := Copy( cTmp, Pos( '.', cTmp ) + 1, 100 );
          // v. 4.0.0.0
          if ( ( cTmp <> 'RCMaster' ) and ( cTmp <> 'RCMasterHidden' ) ) then
          begin
             if ( cOption <> cTmpOld ) then
             begin
                  seq := 0;
                  t := 10;

                  Inc( b );

                  pBlock        := TUniContainerPanel.Create( Self );
                  pBlock.AlignmentControl := uniAlignmentClient;
                  pBlock.name   := 'rcBlock' + IntToStr( 400 + b);
                  pBlock.Parent := sboxPermissions;
                  pBlock.Tag    := 0;
                  pBlock.Visible:= True;
                  pBlock.Width  := 300;
                  pBlock.Height := 170;
                  pBlock.Left   := 20;
                  if f = 1 then
                     pBlock.Top    := 20
                  else
                     pBlock.Top    := 190 * ( ( f  ) );
                  pBlock.Color  := clWhite;
                  //pBlock.Caption:= cTemp;
                  pBlock.Hint   := '[[cols:xs-12 sm-12 md-12]]';
                  rc_AddCssClass( pBlock , 'card-info-box-white-noshadow rc-z-index-2' ); // v. 3.3.0.0

                  pBlock2        := TUniContainerPanel.Create( Self );
                  pBlock2.AlignmentControl := uniAlignmentClient;
                  Inc( b );
                  pBlock2.name   := 'rcBlock' + IntToStr( 400 + b ) ;// f ); // v. 3.3.0.0
                  pBlock2.Parent := pBlock;
                  //pBlock2.Anchors := [akRight];//[akLeft, akRight, akTop]; // v. 3.3.0.0
                  pBlock2.Tag    := 0;
                  pBlock2.Visible:= True;
                  pBlock2.Width  := 300;
                  pBlock2.Height := 42;
                  pBlock2.Left   := 00;
                  pBlock2.Align  := alTop; // v. 3.3.0.0
                  pBlock2.Hint   := '[[round:t | cls:card-light |noborder-top |noborder-left ]]'; // v. 3.3.0.0
                  //rc_AddCssClass( pBlock , 'card-light' );

                  // titulo da opção
                  pLabel         := TUniLabel.Create( Self );
                  pLabel.name    := 'lb_perm' + IntToStr( f);
                  pLabel.Parent  := pBlock2;
                  pLabel.Visible := True;
                  pLabel.Width   := 200;
                  pLabel.Height  := 24;
                  pLabel.Left    := 10;
                  pLabel.Top     := 10;
                  pLabel.Tag     := 0;
                  pLabel.Font.Color := clBlack;
                  pLabel.AlignWithMargins := True;
                  pLabel.Margins.Left   := 6;
                  pLabel.Margins.Top    := 0;
                  pLabel.Margins.Right  := 0;
                  pLabel.Margins.Bottom := 0;
                  pLabel.Align   := alLeft;
                  pLabel.Hint    := '[[bsh5: | cls:left-center]]';
                  i              := pLabel.Top;
                  pLabel.TextConversion := txtHTML;
                  pLabel.Caption := StringReplace( cOption, '<br>', '', [rfReplaceAll] );
                  // v. 3.3.0.0
                  // collapse
                  Inc( iAccordion ); // v. 3.3.3.0
                  pLabel         := TUniLabel.Create( Self );
                  pLabel.name    := 'lb_rccollapse_' + Zeros( IntToStr( iAccordion ), 2 ); // v. 3.3.3.0
                  pLabel.Parent  := pBlock2;
                  pLabel.Anchors := [akRight];
                  pLabel.Visible := True;
                  pLabel.Width   := 15;
                  pLabel.Height  := 25;
                  pLabel.Left    := pBlock2.Left + pBlock2.Width - 28;
                  pLabel.Top     := 10;
                  pLabel.Tag     := 0;
                  pLabel.Font.Color := clBlack;
                  pLabel.AlignWithMargins := True;
                  pLabel.Margins.Left   := 6;
                  pLabel.Margins.Top    := 0;
                  pLabel.Margins.Right  := 0;
                  pLabel.Margins.Bottom := 0;
                  pLabel.Hint    := '[[collapse:' + pBlock.name + ' off-30 collapsed]]';  // v. 4.0.0.0 icons:fas-plus fas-minus
                  i              := pLabel.Top;
                  pLabel.TextConversion := txtHTML;

                  // permission edit
                  try
                     pEdit         := TUniEdit.Create( Self );
                     pEdit.name    := 'edpermission_' + cFrm.ToLower;
                     pEdit.Parent  := pBlock;
                     pEdit.Tag     := 0;
                     pEdit.Visible := False;
                     pEdit.Width   := 200;
                     pEdit.Height  := 24;
                     pEdit.Font.Color := clBlue;
                     pEdit.Left    := 120;
                     pEdit.Top     := i + t + 2;
                  except on e:exception do
                         begin
                              dm_rc.rc_ShowSweetAlert( 'RC User Control', 'Generation failed', 'error');
                         end;
                  end;
             end;

             cTmpOld := cOption;

             t := t + 30;
             Inc( seq );
             pBlock.Height := t + 50;

             pLabel         := TUniLabel.Create( Self );
             pLabel.name    := 'lb_' + ReturnLetters( cTmp ) + IntToStr( f); // v. 3.2.0.7
             pLabel.Parent  := pBlock;
             pLabel.Tag     := 0;
             pLabel.Visible := True;
             pLabel.Width   := 200;
             pLabel.Height  := 24;
             pLabel.Left    := 60;
             pLabel.Top     := i + t + 5;
             pLabel.Font.Size := 10;
             pLabel.TextConversion := txtHTML;
             pLabel.Caption := cTmp;//'Insert';

             // switch permission itens
             pLabel         := TUniLabel.Create( Self );
             pLabel.name    := 'edswt_' + cFrm.ToLower + StrZero( seq , 2 );
             pLabel.Parent  := pBlock; //3
             pLabel.Tag     := 0;
             pLabel.Visible := True;
             pLabel.Enabled := False;
             pLabel.Hint    := '[[bsswt:0]]';
             pLabel.Width   := 200;
             pLabel.Height  := 24;
             pLabel.Left    := 20;
             pLabel.Top     := i + t + 2;
             pLabel.TextConversion := txtHTML;
             pLabel.OnClick := Click_Swt;
          end;
     end;

     // criar ultimo bloco para dar espaço no rodape
     pBlock        := TUniContainerPanel.Create( Self );
     pBlock.AlignmentControl := uniAlignmentClient;
     Inc( b );
     pBlock.name   := 'rcBlock' + IntToStr( 400 + b + 1 );
     pBlock.Parent := sboxPermissions;
     pBlock.Tag    := 0;
     pBlock.Visible:= True;
     pBlock.Width  := 300;
     pBlock.Height := 15;
     pBlock.Left   := 20;
     pBlock.Top    := 190 * ( ( f ) );
     pBlock.Color  := clWhite;
     pBlock.Hint   := '[[cols:xs-12 sm-12 md-12]]';

  finally
         UniSession.ResumeLayouts;
  end;

  inherited;
  // parametros de pesquisa padrao - DEPOIS DO INHERITED
  dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDField1.name   , 'tab.' + ed_PK.Text + ' as "CÓDIGO"' , 'CÓDIGO' );
  dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDField1.name   , 'tab.Nome'             , 'NOME' );
  dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDField1.name   , 'tab.Email as Login'   , 'LOGIN' );

  // particularidades do form
  EMPRESAS.Close;
  EMPRESAS.Open;

  // translate messages
  case mm.varLT_Lang of

       ltpt_BR : begin
                   uniFileUp.Title                   := 'Foto do Usuário';
                   cMSG_COMPANY_DELETE               := 'Exclusão de Empresas vinculadas.';
                   cMSG_USER_NAME_CHANGED            := 'O nome do usuário foi alterado, uma nova senha ( ou a mesma ) deve ser (re)digitada !';
                   cMSG_BUGERROR_PERMISSION_REGISTER := 'CADASTRO DE PERMISSIONAMENTO DE USUÁRIO';
                   cMSG_BUGERROR_RESTRICTION_TABLE   := 'O campo %s não existe na tabela USUARIOS_RESTRICOES !';
                 end;
       lten_US, lten_GB   : begin
                   uniFileUp.Title                   := 'User photo';
                   cMSG_COMPANY_DELETE               := 'Exclusion of Related Companies.';
                   cMSG_USER_NAME_CHANGED            := 'The username has been changed, a new password (or the same one) must be (re) entered!' ;
                   cMSG_BUGERROR_PERMISSION_REGISTER := 'USER PERMISSIONING REGISTRATION';
                   cMSG_BUGERROR_RESTRICTION_TABLE   := 'The field %s does not exist in the RESTRICTES table!';
                 end;
       ltes_ES   : begin
                   uniFileUp.Title                   := 'Foto de usuario';
                   cMSG_COMPANY_DELETE               := 'Exclusión de Empresas Vinculadas';
                   cMSG_USER_NAME_CHANGED            := '¡El nombre de usuario ha sido cambiado, se debe (re) ingresar una nueva contraseña (o la misma)!' ;
                   cMSG_BUGERROR_PERMISSION_REGISTER := 'REGISTRO DE PERMISO DE USUARIO';
                   cMSG_BUGERROR_RESTRICTION_TABLE   := '¡El campo %s no existe en la tabla RESTRICTES!';
                 end;
       ltfr_FR   : begin
                    uniFileUp.Title                   := 'Photo de l''utilisateur';
                    cMSG_COMPANY_DELETE               := 'Suppression des sociétés liées.';
                    cMSG_USER_NAME_CHANGED            := 'Le nom d''utilisateur a été modifié, un nouveau (ou le même) mot de passe doit être (ré)entré !';
                    cMSG_BUGERROR_PERMISSION_REGISTER := 'ENREGISTREMENT D''AUTORISATION D''UTILISATEUR';
                    cMSG_BUGERROR_RESTRICTION_TABLE   := 'Le champ %s n''existe pas dans la table USUARIOS_RESTRICOES !';
                 end;
       ltde_DE   : begin
                   uniFileUp.Title                   := 'Benutzerfoto';
                   cMSG_COMPANY_DELETE               := 'Löschen von verknüpften Firmen.';
                   cMSG_USER_NAME_CHANGED            := 'Der Benutzername wurde geändert, ein neues (oder gleiches) Passwort muss (erneut) eingegeben werden !';
                   cMSG_BUGERROR_PERMISSION_REGISTER := 'BENUTZERBERECHTIGUNG REGISTRIERUNG';
                   cMSG_BUGERROR_RESTRICTION_TABLE   := 'Das Feld %s existiert nicht in der Tabelle USUARIOS_RESTRICOES !';
                 end;
       ltit_IT   : begin
                   uniFileUp.Title                   := 'Foto utente';
                   cMSG_COMPANY_DELETE               := 'Cancellazione aziende collegate.';
                   cMSG_USER_NAME_CHANGED            := 'Il nome utente è stato modificato, una nuova (o la stessa) password deve essere (ri)inserita!';
                   cMSG_BUGERROR_PERMISSION_REGISTER := 'REGISTRAZIONE AUTORIZZAZIONE UTENTE';
                   cMSG_BUGERROR_RESTRICTION_TABLE   := 'Il campo %s non esiste nella tabella USUARIOS_RESTRICOES!';
                 end;
       lttr_TR    : begin
                   uniFileUp.Title                   := 'Kullanıcı Fotoğrafı';
                   cMSG_COMPANY_DELETE               := 'Bağlı şirketlerin silinmesi.';
                   cMSG_USER_NAME_CHANGED            := 'Kullanıcı adı değiştirildi, yeni (veya aynı) şifre (yeniden) girilmelidir!';
                   cMSG_BUGERROR_PERMISSION_REGISTER := 'KULLANICI İZNİ KAYDI';
                   cMSG_BUGERROR_RESTRICTION_TABLE   := '%s alanı USUARIOS_RESTRICOES tablosunda mevcut değil!';
                 end;
       ltru_RU    : begin
                    uniFileUp.Title                   := 'Фотография пользователя';
                    cMSG_COMPANY_DELETE               := 'Исключение связанных компаний.';
                    cMSG_USER_NAME_CHANGED            := 'Имя пользователя было изменено, необходимо (повторно) ввести новый пароль (или тот же самый)!' ;
                    cMSG_BUGERROR_PERMISSION_REGISTER := 'РЕГИСТРАЦИЯ РАЗРЕШЕНИЯ ПОЛЬЗОВАТЕЛЯ';
                    cMSG_BUGERROR_RESTRICTION_TABLE   := 'Поле %s не существует в таблице RESTRICTES!'; // v. 3.3.0.0 ( thanks Mr. Zilav )
                 end;
       ltzn_CH : begin
                   uniFileUp.Title                   := 'User photo';
                   cMSG_COMPANY_DELETE               := 'Exclusion of Related Companies.';
                   cMSG_USER_NAME_CHANGED            := 'The username has been changed, a new password (or the same one) must be (re) entered!' ;
                   cMSG_BUGERROR_PERMISSION_REGISTER := 'USER PERMISSIONING REGISTRATION';
                   cMSG_BUGERROR_RESTRICTION_TABLE   := 'The field %s does not exist in the RESTRICTES table!';
                 end;
       ltin_ID : begin
                   uniFileUp.Title                   := 'User photo';
                   cMSG_COMPANY_DELETE               := 'Exclusion of Related Companies.';
                   cMSG_USER_NAME_CHANGED            := 'The username has been changed, a new password (or the same one) must be (re) entered!' ;
                   cMSG_BUGERROR_PERMISSION_REGISTER := 'USER PERMISSIONING REGISTRATION';
                   cMSG_BUGERROR_RESTRICTION_TABLE   := 'The field %s does not exist in the RESTRICTES table!';
                 end;
       ltth_TH : begin
                   uniFileUp.Title                   := 'User photo';
                   cMSG_COMPANY_DELETE               := 'Exclusion of Related Companies.';
                   cMSG_USER_NAME_CHANGED            := 'The username has been changed, a new password (or the same one) must be (re) entered!' ;
                   cMSG_BUGERROR_PERMISSION_REGISTER := 'USER PERMISSIONING REGISTRATION';
                   cMSG_BUGERROR_RESTRICTION_TABLE   := 'The field %s does not exist in the RESTRICTES table!';
                 end;
       lthi_IN : begin
                   uniFileUp.Title                   := 'User photo';
                   cMSG_COMPANY_DELETE               := 'Exclusion of Related Companies.';
                   cMSG_USER_NAME_CHANGED            := 'The username has been changed, a new password (or the same one) must be (re) entered!' ;
                   cMSG_BUGERROR_PERMISSION_REGISTER := 'USER PERMISSIONING REGISTRATION';
                   cMSG_BUGERROR_RESTRICTION_TABLE   := 'The field %s does not exist in the RESTRICTES table!';
                 end;
       ltar_SA : begin // v. 3.3.0.0
                   uniFileUp.Title                   := 'صورة المستخدم';
                   cMSG_COMPANY_DELETE               := 'استبعاد الشركات ذات الصلة.';
                   cMSG_USER_NAME_CHANGED            := 'تم تغيير اسم المستخدم ، يجب إدخال (إعادة) كلمة المرور الجديدة (أو نفس كلمة المرور)!' ;
                   cMSG_BUGERROR_PERMISSION_REGISTER := 'تسجيل تفويض المستخدم';
                   cMSG_BUGERROR_RESTRICTION_TABLE   := 'الحقل  غير موجود في الجدول ال%sمقيّد';
                 end;
  end;
end;

initialization
  RegisterClass(TfrmCadUSUARIOS);

end.
