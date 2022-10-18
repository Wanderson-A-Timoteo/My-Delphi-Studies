﻿unit mkm_translate; // v. 4.0.0.0

interface

uses
    System.SysUtils, System.Classes ,       System.TypInfo, JSON, DBXJSON, DBXJSONReflect, // v. 4.0.0.0
    System.DateUtils, math, System.Rtti, System.StrUtils, Vcl.Graphics,
    // feedback: Mesut from Turkey
    {$ifdef LINUX}
    System.UIConsts,
    {$endif}
    uconsts,
    uniGUIBaseClasses, uniGUIClasses, uniGUITypes, uniGUIJSUtils, Vcl.forms,
    Vcl.Menus, uniMainMenu,
    uniTreeMenu, uniComboBox, uniDBComboBox,uniDBLookupComboBox, uniDateTimePicker, uniDBDateTimePicker,  uniListBox,
    uniBitBtn, uniButton, uniEdit, UniDBEdit, UniSpeedButton, uniGUIFrame, uniGUIForm,  uniGUIDialogs, Messages,
    uniGUIAbstractClasses,  uniGUIApplication, uniPanel, IniFiles, UniImage, uniLabel,  Unipagecontrol,
    uniMemo, uniDBMemo, uniGUIRegClasses, uniDBNavigator, uniScrollBox, uniDBGrid, // v. 3.3.0.0
    UniDBRadioGroup, uniDBCheckBox, uniDBImage, uniDBText, uniHTMLFrame;

    procedure rc_Translate( pForm, pObj : TObject; pProp, pLang : string );
    procedure rc_ConfigTranslateMessages;

implementation


uses untdm_rc, str_func, mkm_func_web, MainModule, mkm_layout, ServerModule;

// I'm trying to make rc_translate accessible to everyone. I cannot guarantee that the translations are perfect.
// I appreciate your help in possible corrections of the text and / or additional translations.

// Você poderá fazer a tradução especificamente de um formulário e não usar VARIAVEIS GLOBAIS.
// Veja um exemplo em "frmCadUsuários": MSG_COMPANY_DELETE

// You will be able to translate a form specifically and not use GLOBAL VARIABLES.
// See an example in "frmCadUsUsers": MSG_COMPANY_DELETE

procedure rc_ConfigTranslateMessages;
begin
     mm.varLT_Lang := TRCLanguagesType( dm_rc.rc_GetIndexFromArray( mm.CONFIG_LANGUAGE, ARRAY_LANGUAGES ) );

     //MSG STRINGS
     case mm.varLT_Lang of
          ltpt_BR : begin
                      mm.LAB_STATE_I := ' [cadastro]';
                      mm.LAB_STATE_E := ' [edição]';
                      mm.LAB_STATE_B := ' [pesquisa]';

                      mm.MSG_CONFIRM_DELETE           := 'Confirma exclusão do Registro?';
                      mm.MSG_CONFIRM_DELETE_ALL       := 'Confirma Exclusão de Todos os Registros ?';
                      mm.MSG_CONTINUE_REGISTERING     := 'Deseja fazer um novo cadastro ?';
                      mm.MSG_SUCCESS_POST             := 'Registro Gravado com sucesso!';
                      mm.MSG_SUCCESS_DELETE           := 'Registro Deletado com sucesso!';
                      mm.MSG_PASSWORD_RESET           := 'RESETAR SENHA';
                      mm.MSG_PASSWORD_TEMP            := 'Sua senha provisória:';
                      mm.MSG_PASSWORD_TEMP_SENT       := 'Sua senha provisória foi enviada para o email informado.';
                      mm.MSG_EMAIL_DO_NOT_REPLY       := 'Não responda esse email.';
                      mm.MSG_REGISTER_NEW             := 'NOVO CADASTRO';
                      mm.MSG_CONFIRMATION_CODE        := 'Um código foi enviado para seu email'; // v.3.3.3.1
                      mm.MSG_COMPANY_SELECT           := 'Selecione uma empresa!';
                      mm.MSG_COMPANY_USER_OTHER       := 'Usuário não tem acesso a empresa selecionada!';
                      mm.MSG_USER_DO_NOT_HAVE_ACCESS  := 'Você não tem acesso ';
                      mm.MSG_USER_SUPERIOR_PERMISSION := 'Permissão Superior';
                      mm.MSG_USER                     := 'Usuário';
                      mm.MSG_USER_RELEASE_PASSWORD    := 'Senha para Liberação';
                      mm.MSG_NEW_USER_REGISTERED      := 'Novo Usuário Cadastrado !' ;// v. 3.2.0.0...

                      // frmCadBASICS
                      // ------------
                      // Na tabelas que acompanham o RADCORE eu utilizo por padrão os campos
                      // CODIGO( para chave primária ) e DESCRICAO( para descrever o conteúdo )
                      // para formação do ARRAY para uso com "Cadastros Básicos" ( ARRAY_BASICS )
                      // Você pode alterar de acordo com a sua estrutura como descrito no comentário ao lado
                      // das duas variáveis logo abaixo
                      mm.ARRAY_BASICS_FLD_ID_NAME           := 'CODIGO';    // CODIGO, ID, SEQ...
                      mm.ARRAY_BASICS_FLD_DESCRIPTION_NAME  := 'DESCRICAO'; // DESCRICAO, DESCRIPTION, TEXT...
                      // aliases / grid columns
                      mm.ARRAY_BASICS_FLD_ID_ALIAS          := 'CÓDIGO';
                      mm.ARRAY_BASICS_FLD_DESCRIPTION_ALIAS := 'DESCRIÇÃO';
                      mm.ARRAY_BASICS_FLD_ID_LABEL          := 'CÓDIGO';
                      mm.ARRAY_BASICS_FLD_DESCRIPTION_LABEL := 'DESCRIÇÃO';
                      mm.MSG_FIELD_NAME_CODE                := 'Código';
                      mm.MSG_FIELD_NAME_DESCRIPTION         := 'Descrição';

                      mm.MSG_RECORDS                        := 'reg(s)';
                      mm.MSG_RECORD_NOT_FOUND               := 'Registro não encontrado!';
                      mm.MSG_SELECT_VALID_RECORD            := 'Selecione um registro válido.';

                      mm.MSG_TABLE_DO_NOT_EXIST             := 'Tabela "%s" não existe <br>ou não tem Primary Key ( integer ) !';

                      mm.MSG_SEARCH_CONDICIONAL_AND         := 'Pesq. Condição: E';
                      mm.MSG_SEARCH_CONDICIONAL_OR          := 'Pesq. Condição: OU';

                    end;
          lten_US, lten_GB: begin
                   mm.LAB_STATE_I := ' [insert]';
                   mm.LAB_STATE_E := ' [edit]';
                   mm.LAB_STATE_B := ' [search]';

                   mm.MSG_CONFIRM_DELETE           := 'Confirm Deletion of Current Record ?';
                   mm.MSG_CONFIRM_DELETE_ALL       := 'Do you confirm deletion of all records?';
                   mm.MSG_CONTINUE_REGISTERING     := 'Do you want to make a new registration?';
                   mm.MSG_SUCCESS_POST             := 'Record successfully saved!';
                   mm.MSG_SUCCESS_DELETE           := 'Record successfully deleted! ';
                   mm.MSG_PASSWORD_RESET           := 'PASSWORD RESET';
                   mm.MSG_PASSWORD_TEMP            := 'Your temporary password:';
                   mm.MSG_PASSWORD_TEMP_SENT       := 'Your provisional password has been sent to the email provided.';
                   mm.MSG_EMAIL_DO_NOT_REPLY       := 'Do not reply to that email.';
                   mm.MSG_REGISTER_NEW             := 'NEW REGISTER';
                   mm.MSG_COMPANY_SELECT           := 'Select a company!';
                   mm.MSG_COMPANY_USER_OTHER       := 'User does not have access to selected company!';
                   mm.MSG_USER_DO_NOT_HAVE_ACCESS  := 'You do not have access';
                   mm.MSG_USER_SUPERIOR_PERMISSION := 'Superior Permission';
                   mm.MSG_USER                     := 'User';
                   mm.MSG_USER_RELEASE_PASSWORD    := 'Password for Release';
                   mm.MSG_NEW_USER_REGISTERED      := 'New User Registered !' ;// v. 3.2.0.0...

                   // frmCadBASICS
                   // ------------
                   // In the tables that come with RADCORE I use the fields by default
                   // CODE( for primary key ) and DESCRIPTION( for describing the content )
                   // for ARRAY formation for use with "Basic Records" ( ARRAY_BASICS )
                   // You can change it according to its structure as described in the comment opposite
                   // of the two variables below
                   mm.ARRAY_BASICS_FLD_ID_NAME           := 'CODIGO';    // CODIGO, ID, SEQ...
                   mm.ARRAY_BASICS_FLD_DESCRIPTION_NAME  := 'DESCRICAO'; // DESCRICAO, DESCRIPTION, TEXT...
                   // aliases / grid columns
                   mm.ARRAY_BASICS_FLD_ID_ALIAS          := 'CODE';
                   mm.ARRAY_BASICS_FLD_DESCRIPTION_ALIAS := 'DESCRIPTION';
                   mm.ARRAY_BASICS_FLD_ID_LABEL          := 'CODE';
                   mm.ARRAY_BASICS_FLD_DESCRIPTION_LABEL := 'DESCRIPTION';
                   mm.MSG_FIELD_NAME_CODE                := 'ID';
                   mm.MSG_FIELD_NAME_DESCRIPTION         := 'Description';

                   mm.MSG_RECORDS                  := 'rec(s)';
                   mm.MSG_RECORD_NOT_FOUND         := 'Record not found!';
                   mm.MSG_SELECT_VALID_RECORD      := 'Select a valid record.';

                   mm.MSG_TABLE_DO_NOT_EXIST       := 'Table "%s" does not exist or does not have a Primary Key (integer)!';

                   mm.MSG_SEARCH_CONDICIONAL_AND   := 'Search Condition: AND';
                   mm.MSG_SEARCH_CONDICIONAL_OR    := 'Search Condition: OR';

                 end;
          ltes_ES: begin
                   mm.LAB_STATE_I := ' [insert]';
                   mm.LAB_STATE_E := ' [edit]';
                   mm.LAB_STATE_B := ' [search]';

                   mm.MSG_CONFIRM_DELETE           := '¿Confirmar eliminación de registro?';
                   mm.MSG_CONFIRM_DELETE_ALL       := '¿Confirma la eliminación de todos los registros?';
                   mm.MSG_CONTINUE_REGISTERING     := '¿Quiere hacer un nuevo registro?';
                   mm.MSG_SUCCESS_POST             := '¡Registro guardado con éxito!';
                   mm.MSG_SUCCESS_DELETE           := '¡Registro eliminado correctamente! ';
                   mm.MSG_PASSWORD_RESET           := 'RESTABLECER LA CONTRASEÑA';
                   mm.MSG_PASSWORD_TEMP            := 'Su contraseña temporal:';
                   mm.MSG_PASSWORD_TEMP_SENT       := 'Su contraseña provisional ha sido enviada al correo electrónico proporcionado.';
                   mm.MSG_EMAIL_DO_NOT_REPLY       := 'No responda a ese correo electrónico.';
                   mm.MSG_REGISTER_NEW             := 'NUEVO REGISTRO';
                   mm.MSG_COMPANY_SELECT           := '¡Seleccione una empresa!';
                   mm.MSG_COMPANY_USER_OTHER       := 'El usuario no tiene acceso a la empresa seleccionada!';
                   mm.MSG_FIELD_NAME_CODE          := 'Código';
                   mm.MSG_FIELD_NAME_DESCRIPTION   := 'Descripción';
                   mm.MSG_USER_DO_NOT_HAVE_ACCESS  := 'No tienes acceso';
                   mm.MSG_USER_SUPERIOR_PERMISSION := 'Permiso superior';
                   mm.MSG_USER                     := 'Usuario';
                   mm.MSG_USER_RELEASE_PASSWORD    := 'Contraseña para liberación';
                   mm.MSG_NEW_USER_REGISTERED      := '¡Nuevo usuario registrado!' ; // v. 3.2.0.0 ...

                   // frmCadBASICS
                   // ------------
                   // In the tables that come with RADCORE I use the fields by default
                   // CODE( for primary key ) and DESCRIPTION( for describing the content )
                   // for ARRAY formation for use with "Basic Records" ( ARRAY_BASICS )
                   // You can change it according to its structure as described in the comment opposite
                   // of the two variables below
                   mm.ARRAY_BASICS_FLD_ID_NAME           := 'CODIGO';    // CODIGO, ID, SEQ...
                   mm.ARRAY_BASICS_FLD_DESCRIPTION_NAME  := 'DESCRICAO'; // DESCRICAO, DESCRIPTION, TEXT...
                   // aliases / grid columns
                   mm.ARRAY_BASICS_FLD_ID_ALIAS          := 'CÓDIGO';
                   mm.ARRAY_BASICS_FLD_DESCRIPTION_ALIAS := 'DESCRIÇÃO';
                   mm.ARRAY_BASICS_FLD_ID_LABEL          := 'CÓDIGO';
                   mm.ARRAY_BASICS_FLD_DESCRIPTION_LABEL := 'DESCRIÇÃO';
                   mm.MSG_FIELD_NAME_CODE                := 'Código';
                   mm.MSG_FIELD_NAME_DESCRIPTION         := 'Descrição';

                   mm.MSG_RECORDS                  := 'reg(s)';
                   mm.MSG_RECORD_NOT_FOUND         := '¡Registro no encontrado!';
                   mm.MSG_SELECT_VALID_RECORD      := 'Seleccione un registro válido.';

                   mm.MSG_TABLE_DO_NOT_EXIST       := '¡La tabla "%s" no existe o no tiene una clave primaria (entero)!';

                   mm.MSG_SEARCH_CONDICIONAL_AND   := 'Condición de búsqueda: Y';
                   mm.MSG_SEARCH_CONDICIONAL_OR    := 'Condición de búsqueda: O';

                 end;
        ltfr_FR: begin
                 mm.LAB_STATE_I := ' [insert]';
                 mm.LAB_STATE_E := ' [edit]';
                 mm.LAB_STATE_B := ' [search]';

                 mm.MSG_CONFIRM_DELETE                 := 'Confirmer la suppression du registre ?';
                 mm.MSG_CONFIRM_DELETE_ALL             := 'Confirmer la suppression de tous les enregistrements ?';
                 mm.MSG_CONTINUE_REGISTERING           := 'Voulez-vous faire une nouvelle inscription ?';
                 mm.MSG_SUCCESS_POST                   := 'Enregistrement enregistré avec succès !';
                 mm.MSG_SUCCESS_DELETE                 := 'Enregistrement supprimé avec succès !';
                 mm.MSG_PASSWORD_RESET                 := 'RÉINITIALISER LE MOT DE PASSE';
                 mm.MSG_PASSWORD_TEMP                  := 'Votre mot de passe temporaire :';
                 mm.MSG_PASSWORD_TEMP_SENT             := 'Votre mot de passe temporaire a été envoyé à l''email que vous avez entré.';
                 mm.MSG_EMAIL_DO_NOT_REPLY             := 'Ne pas répondre à cet e-mail.';
                 mm.MSG_REGISTER_NEW                   := 'NOUVELLE INSCRIPTION';
                 mm.MSG_COMPANY_SELECT                 := 'Veuillez sélectionner une entreprise !';
                 mm.MSG_COMPANY_USER_OTHER             := 'L''utilisateur n''a pas accès à l''entreprise sélectionnée!';
                 mm.MSG_USER_DO_NOT_HAVE_ACCESS        := 'Vous n''avez pas accès';
                 mm.MSG_USER_SUPERIOR_PERMISSION       := 'Autorisation supérieure';
                 mm.MSG_USER                           := 'Utilisateur';
                 mm.MSG_USER_RELEASE_PASSWORD          := 'Libérer le mot de passe';
                 mm.MSG_NEW_USER_REGISTERED            := 'Nouvel utilisateur enregistré !' ; // v. 3.2.0.0...

                 // frmCadBASICS
                 // ------------
                 // In the tables that come with RADCORE I use the fields by default
                 // CODE( for primary key ) and DESCRIPTION( for describing the content )
                 // for ARRAY formation for use with "Basic Records" ( ARRAY_BASICS )
                 // You can change it according to its structure as described in the comment opposite
                 // of the two variables below
                 mm.ARRAY_BASICS_FLD_ID_NAME           := 'CODIGO';    // CODIGO, ID, SEQ...
                 mm.ARRAY_BASICS_FLD_DESCRIPTION_NAME  := 'DESCRICAO'; // DESCRICAO, DESCRIPTION, TEXT...
                 // aliases / grid columns
                 mm.ARRAY_BASICS_FLD_ID_ALIAS          := 'CODE';
                 mm.ARRAY_BASICS_FLD_DESCRIPTION_ALIAS := 'DESCRIPTION';
                 mm.ARRAY_BASICS_FLD_ID_LABEL          := 'CODE';
                 mm.ARRAY_BASICS_FLD_DESCRIPTION_LABEL := 'DESCRIPTION';
                 mm.MSG_FIELD_NAME_CODE                := 'Code';
                 mm.MSG_FIELD_NAME_DESCRIPTION         := 'Description';

                 // frmCadBASICS
                 // ------------
                 // In the tables that come with RADCORE I use the fields by default
                 // CODE( for primary key ) and DESCRIPTION( for describing the content )
                 // for ARRAY formation for use with "Basic Records" ( ARRAY_BASICS )
                 // You can change it according to its structure as described in the comment opposite
                 // of the two variables below
                 mm.ARRAY_BASICS_FLD_ID_NAME           := 'CODIGO';    // CODIGO, ID, SEQ...
                 mm.ARRAY_BASICS_FLD_DESCRIPTION_NAME  := 'DESCRICAO'; // DESCRICAO, DESCRIPTION, TEXT...
                 // aliases / grid columns
                 mm.ARRAY_BASICS_FLD_ID_ALIAS          := 'CÓDIGO';
                 mm.ARRAY_BASICS_FLD_DESCRIPTION_ALIAS := 'DESCRIPCIÓN';
                 mm.ARRAY_BASICS_FLD_ID_LABEL          := 'CÓDIGO';
                 mm.ARRAY_BASICS_FLD_DESCRIPTION_LABEL := 'DESCRIPCIÓN';
                 mm.MSG_FIELD_NAME_CODE                := 'Código';
                 mm.MSG_FIELD_NAME_DESCRIPTION         := 'Descripción';

                 mm.MSG_RECORDS                        := 'rec(s)';
                 mm.MSG_RECORD_NOT_FOUND               := 'Enregistrement non trouvé !';
                 mm.MSG_SELECT_VALID_RECORD            := 'Veuillez sélectionner un enregistrement valide.';

                 mm.MSG_TABLE_DO_NOT_EXIST             := 'La table "%s" n''existe pas <br>ou n''a pas de clé primaire ( entier ) !';

                 mm.MSG_SEARCH_CONDICIONAL_AND         := 'Recherche. Condition E' ;
                 mm.MSG_SEARCH_CONDICIONAL_OR          := 'Recherche. OU condition';
            end;
        ltde_DE: begin  // germany
                 mm.LAB_STATE_I := ' [insert]';
                 mm.LAB_STATE_E := ' [edit]';
                 mm.LAB_STATE_B := ' [search]';

                 mm.MSG_CONFIRM_DELETE                 := 'Löschen der Registrierung bestätigen?';
                 mm.MSG_CONFIRM_DELETE_ALL             := 'Löschen aller Datensätze bestätigen ?';
                 mm.MSG_CONTINUE_REGISTERING           := 'Möchten Sie sich neu registrieren ?';
                 mm.MSG_SUCCESS_POST                   := 'Eintrag erfolgreich gespeichert!';
                 mm.MSG_SUCCESS_DELETE                 := 'Registrierung erfolgreich gelöscht!';
                 mm.MSG_PASSWORD_RESET                 := 'RESET PASSWORT';
                 mm.MSG_PASSWORD_TEMP                  := 'Ihr temporäres Passwort:';
                 mm.MSG_PASSWORD_TEMP_SENT             := 'Ihr temporäres Passwort wurde an die von Ihnen eingegebene E-Mail gesendet.';
                 mm.MSG_EMAIL_DO_NOT_REPLY             := 'Nicht auf diese E-Mail antworten.';
                 mm.MSG_REGISTER_NEW                   := 'NEUE REGISTRIERUNG';
                 mm.MSG_COMPANY_SELECT                 := 'Bitte wählen Sie eine Firma aus!';
                 mm.MSG_COMPANY_USER_OTHER             := 'Der Benutzer hat keinen Zugriff auf das ausgewählte Unternehmen!';
                 mm.MSG_USER_DO_NOT_HAVE_ACCESS        := 'Sie haben keinen Zugriff ';
                 mm.MSG_USER_SUPERIOR_PERMISSION       := 'Übergeordnete Berechtigung';
                 mm.MSG_USER                           := 'Benutzer';
                 mm.MSG_USER_RELEASE_PASSWORD          := 'Passwort freigeben';
                 mm.MSG_NEW_USER_REGISTERED            := 'Neuer Benutzer registriert !' ; // V. 3.2.0.0...

                 // frmCadBASICS
                 // ------------
                 // In the tables that come with RADCORE I use the fields by default
                 // CODE( for primary key ) and DESCRIPTION( for describing the content )
                 // for ARRAY formation for use with "Basic Records" ( ARRAY_BASICS )
                 // You can change it according to its structure as described in the comment opposite
                 // of the two variables below
                 mm.ARRAY_BASICS_FLD_ID_NAME           := 'CODIGO';    // CODIGO, ID, SEQ...
                 mm.ARRAY_BASICS_FLD_DESCRIPTION_NAME  := 'DESCRICAO'; // DESCRICAO, DESCRIPTION, TEXT...
                 // aliases / grid columns
                 mm.ARRAY_BASICS_FLD_ID_ALIAS          := 'CODE';
                 mm.ARRAY_BASICS_FLD_DESCRIPTION_ALIAS := 'BESCHREIBUNG';
                 mm.ARRAY_BASICS_FLD_ID_LABEL          := 'CODE';
                 mm.ARRAY_BASICS_FLD_DESCRIPTION_LABEL := 'BESCHREIBUNG';
                 mm.MSG_FIELD_NAME_CODE                := 'Code';
                 mm.MSG_FIELD_NAME_DESCRIPTION         := 'Beschreibung';
//                 mm.ARRAY_BASICS_FLD_ID_ALIAS          := 'CODE';
//                 mm.ARRAY_BASICS_FLD_DESCRIPTION_ALIAS := 'DESCRIPTION';
//                 mm.ARRAY_BASICS_FLD_ID_LABEL          := 'CODE';
//                 mm.ARRAY_BASICS_FLD_DESCRIPTION_LABEL := 'DESCRIPTION';
//                 mm.MSG_FIELD_NAME_CODE                := 'ID';
//                 mm.MSG_FIELD_NAME_DESCRIPTION         := 'Description';

                 mm.MSG_RECORDS                        := 'rec(s)';
                 mm.MSG_RECORD_NOT_FOUND               := 'Datensatz nicht gefunden!';
                 mm.MSG_SELECT_VALID_RECORD            := 'Bitte wählen Sie einen gültigen Datensatz aus.';

                 mm.MSG_TABLE_DO_NOT_EXIST             := 'Tabelle "%s" existiert nicht <br>oder hat keinen Primärschlüssel ( Ganzzahl ) !';

                 mm.MSG_SEARCH_CONDICIONAL_AND         := 'Suche. Bedingung E';
                 mm.MSG_SEARCH_CONDICIONAL_OR          := 'Suche. ODER-Bedingung';
            end;
        ltit_IT: begin  // Italian
                 mm.LAB_STATE_I := ' [insert]';
                 mm.LAB_STATE_E := ' [edit]';
                 mm.LAB_STATE_B := ' [search]';

                 mm.MSG_CONFIRM_DELETE                 := 'Conferma eliminazione registro?';
                 mm.MSG_CONFIRM_DELETE_ALL             := 'Conferma Elimina tutti i record ?';
                 mm.MSG_CONTINUE_REGISTERING           := 'Vuoi effettuare una nuova registrazione ?';
                 mm.MSG_SUCCESS_POST                   := 'Registro salvato con successo!';
                 mm.MSG_SUCCESS_DELETE                 := 'Registrazione cancellata con successo!';
                 mm.MSG_PASSWORD_RESET                 := 'RESET PASSWORD';
                 mm.MSG_PASSWORD_TEMP                  := 'La tua password temporanea:';
                 mm.MSG_PASSWORD_TEMP_SENT             := 'La tua password temporanea è stata inviata all\''email che hai inserito.';
                 mm.MSG_EMAIL_DO_NOT_REPLY             := 'Non rispondere a questa email.';
                 mm.MSG_REGISTER_NEW                   := 'NUOVA REGISTRAZIONE';
                 mm.MSG_COMPANY_SELECT                 := 'Seleziona un''azienda!';
                 mm.MSG_COMPANY_USER_OTHER             := 'L''utente non ha accesso all''azienda selezionata';
                 mm.MSG_USER_DO_NOT_HAVE_ACCESS        := 'Non hai accesso';
                 mm.MSG_USER_SUPERIOR_PERMISSION       := 'Autorizzazione superiore';
                 mm.MSG_USER                           := 'Utente';
                 mm.MSG_USER_RELEASE_PASSWORD          := 'Rilascia password';
                 mm.MSG_NEW_USER_REGISTERED            := 'Nuovo utente registrato!' ; // v. 3.2.0.0...

                 // frmCadBASICS
                 // ------------
                 // In the tables that come with RADCORE I use the fields by default
                 // CODE( for primary key ) and DESCRIPTION( for describing the content )
                 // for ARRAY formation for use with "Basic Records" ( ARRAY_BASICS )
                 // You can change it according to its structure as described in the comment opposite
                 // of the two variables below
                 mm.ARRAY_BASICS_FLD_ID_NAME           := 'CODIGO';    // CODIGO, ID, SEQ...
                 mm.ARRAY_BASICS_FLD_DESCRIPTION_NAME  := 'DESCRICAO'; // DESCRICAO, DESCRIPTION, TEXT...
                 // aliases / grid columns
                 mm.ARRAY_BASICS_FLD_ID_ALIAS          := 'CODICE';
                 mm.ARRAY_BASICS_FLD_DESCRIPTION_ALIAS := 'DESCRIPTION';
                 mm.ARRAY_BASICS_FLD_ID_LABEL          := 'CODICE';
                 mm.ARRAY_BASICS_FLD_DESCRIPTION_LABEL := 'DESCRIPTION';
                 mm.MSG_FIELD_NAME_CODE                := 'Codice';
                 mm.MSG_FIELD_NAME_DESCRIPTION         := 'Descrizione';

                 mm.MSG_RECORDS                        := 'rec(s)';
                 mm.MSG_RECORD_NOT_FOUND               := 'Record non trovato!';
                 mm.MSG_SELECT_VALID_RECORD            := 'Seleziona un record valido.';

                 mm.MSG_TABLE_DO_NOT_EXIST             := 'La tabella "%s" non esiste <br>o non ha la chiave primaria ( intera ) !';

                 mm.MSG_SEARCH_CONDICIONAL_AND         := 'Cerca. Condizione E';
                 mm.MSG_SEARCH_CONDICIONAL_OR          := 'Cerca. O condizione';
            end;
        lttr_TR : begin  // Turkish
                 mm.LAB_STATE_I := ' [insert]';
                 mm.LAB_STATE_E := ' [edit]';
                 mm.LAB_STATE_B := ' [search]';

                 mm.MSG_CONFIRM_DELETE                 := 'Kayıt Silmeyi Onaylayın?';
                 mm.MSG_CONFIRM_DELETE_ALL             := 'Tüm Kayıtları Silmeyi Onayla?';
                 mm.MSG_CONTINUE_REGISTERING           := 'Yeni bir kayıt yapmak istiyor musunuz?';
                 mm.MSG_SUCCESS_POST                   := 'Kayıt Başarıyla Kaydedildi!';
                 mm.MSG_SUCCESS_DELETE                 := 'Kayıt Başarıyla Silindi!';
                 mm.MSG_PASSWORD_RESET                 := 'ŞİFREYİ SIFIRLA';
                 mm.MSG_PASSWORD_TEMP                  := 'Geçici parolanız:';
                 mm.MSG_PASSWORD_TEMP_SENT             := 'Geçici şifreniz girdiğiniz e-posta adresine gönderildi.';
                 mm.MSG_EMAIL_DO_NOT_REPLY             := 'Bu e-postayı yanıtlamayın.';
                 mm.MSG_REGISTER_NEW                   := 'YENİ KAYIT';
                 mm.MSG_COMPANY_SELECT                 := 'Lütfen bir şirket seçin!';
                 mm.MSG_COMPANY_USER_OTHER             := 'Kullanıcının seçilen şirkete erişimi yok';
                 mm.MSG_USER_DO_NOT_HAVE_ACCESS        := 'Erişiminiz yok';
                 mm.MSG_USER_SUPERIOR_PERMISSION       := 'Üstün İzin';
                 mm.MSG_USER                           := 'Kullanıcı';
                 mm.MSG_USER_RELEASE_PASSWORD          := 'Şifreyi Serbest Bırak';
                 mm.MSG_NEW_USER_REGISTERED            := 'Yeni Kullanıcı Kayıtlı!' ; // v. 3.2.0.0...

                 // frmCadBASICS
                 // ------------
                 // In the tables that come with RADCORE I use the fields by default
                 // CODE( for primary key ) and DESCRIPTION( for describing the content )
                 // for ARRAY formation for use with "Basic Records" ( ARRAY_BASICS )
                 // You can change it according to its structure as described in the comment opposite
                 // of the two variables below
                 mm.ARRAY_BASICS_FLD_ID_NAME           := 'CODIGO';    // CODIGO, ID, SEQ...
                 mm.ARRAY_BASICS_FLD_DESCRIPTION_NAME  := 'DESCRICAO'; // DESCRICAO, DESCRIPTION, TEXT...
                 // aliases / grid columns
                 mm.ARRAY_BASICS_FLD_ID_ALIAS          := 'KOD';
                 mm.ARRAY_BASICS_FLD_DESCRIPTION_ALIAS := 'TANIM';
                 mm.ARRAY_BASICS_FLD_ID_LABEL          := 'KOD';
                 mm.ARRAY_BASICS_FLD_DESCRIPTION_LABEL := 'TANIM';
                 mm.MSG_FIELD_NAME_CODE                := 'Kod';
                 mm.MSG_FIELD_NAME_DESCRIPTION         := 'Açıklama';
//                 mm.ARRAY_BASICS_FLD_ID_ALIAS          := 'CODE';
//                 mm.ARRAY_BASICS_FLD_DESCRIPTION_ALIAS := 'DESCRIPTION';
//                 mm.ARRAY_BASICS_FLD_ID_LABEL          := 'CODE';
//                 mm.ARRAY_BASICS_FLD_DESCRIPTION_LABEL := 'DESCRIPTION';
//                 mm.MSG_FIELD_NAME_CODE                := 'ID';
//                 mm.MSG_FIELD_NAME_DESCRIPTION         := 'Description';

                 mm.MSG_RECORDS                        := 'kayıt(lar)';
                 mm.MSG_RECORD_NOT_FOUND               := 'Kayıt bulunamadı!';
                 mm.MSG_SELECT_VALID_RECORD            := 'Lütfen geçerli bir kayıt seçin.';

                 mm.MSG_TABLE_DO_NOT_EXIST             := '"%s" tablosu mevcut değil <br>veya Birincil Anahtara (integer) sahip değil!';

                 mm.MSG_SEARCH_CONDICIONAL_AND         := 'Ara. Koşul E';
                 mm.MSG_SEARCH_CONDICIONAL_OR          := 'Ara. VEYA koşul';
            end;
        ltru_RU : begin  // Russian
                 mm.LAB_STATE_I := ' [insert]';
                 mm.LAB_STATE_E := ' [edit]';
                 mm.LAB_STATE_B := ' [search]';

                 mm.MSG_CONFIRM_DELETE           := 'Подтвердить удаление текущей записи?';
                 mm.MSG_CONFIRM_DELETE_ALL       := 'Подтверждаете ли вы удаление всех записей?';
                 mm.MSG_CONTINUE_REGISTERING     := 'Вы хотите произвести новую регистрацию?';
                 mm.MSG_SUCCESS_POST             := 'Запись успешно сохранена!';
                 mm.MSG_SUCCESS_DELETE           := 'Запись успешно удалена! ';
                 mm.MSG_PASSWORD_RESET           := 'СБРОС ПАРОЛЯ';
                 mm.MSG_PASSWORD_TEMP            := 'Ваш временный пароль:';
                 mm.MSG_PASSWORD_TEMP_SENT       := 'Ваш временный пароль был отправлен на указанный адрес электронной почты.';
                 mm.MSG_EMAIL_DO_NOT_REPLY       := 'Не отвечать на это письмо.';
                 mm.MSG_REGISTER_NEW             := 'НОВЫЙ РЕГИСТР';
                 mm.MSG_COMPANY_SELECT           := 'Выберите компанию!';
                 mm.MSG_COMPANY_USER_OTHER       := 'У пользователя нет доступа к выбранной компании';
                 mm.MSG_USER_DO_NOT_HAVE_ACCESS  := 'У вас нет доступа';
                 mm.MSG_USER_SUPERIOR_PERMISSION := 'Высшее разрешение';
                 mm.MSG_USER                     := 'Пользователь';
                 mm.MSG_USER_RELEASE_PASSWORD    := 'Пароль для выпуска';
                 mm.MSG_NEW_USER_REGISTERED      := 'Зарегистрирован новый пользователь!' ; // v. 3.2.0.0 ...

                 // frmCadBASICS
                 // ------------
                 // In the tables that come with RADCORE I use the fields by default
                 // CODE( for primary key ) and DESCRIPTION( for describing the content )
                 // for ARRAY formation for use with "Basic Records" ( ARRAY_BASICS )
                 // You can change it according to its structure as described in the comment opposite
                 // of the two variables below
                 mm.ARRAY_BASICS_FLD_ID_NAME           := 'CODIGO';    // CODIGO, ID, SEQ...
                 mm.ARRAY_BASICS_FLD_DESCRIPTION_NAME  := 'DESCRICAO'; // DESCRICAO, DESCRIPTION, TEXT...
                 // aliases / grid columns
                 mm.ARRAY_BASICS_FLD_ID_ALIAS          := 'КОД';
                 mm.ARRAY_BASICS_FLD_DESCRIPTION_ALIAS := 'ОПИСАНИЕ';
                 mm.ARRAY_BASICS_FLD_ID_LABEL          := 'КОД';
                 mm.ARRAY_BASICS_FLD_DESCRIPTION_LABEL := 'ОПИСАНИЕ';
                 mm.MSG_FIELD_NAME_CODE                := 'ID';
                 mm.MSG_FIELD_NAME_DESCRIPTION         := 'Описание';
//                 mm.ARRAY_BASICS_FLD_ID_ALIAS          := 'CODE';
//                 mm.ARRAY_BASICS_FLD_DESCRIPTION_ALIAS := 'DESCRIPTION';
//                 mm.ARRAY_BASICS_FLD_ID_LABEL          := 'CODE';
//                 mm.ARRAY_BASICS_FLD_DESCRIPTION_LABEL := 'DESCRIPTION';
//                 mm.MSG_FIELD_NAME_CODE                := 'ID';
//                 mm.MSG_FIELD_NAME_DESCRIPTION         := 'Description';

                 mm.MSG_RECORDS                  := 'rec(s)';
                 mm.MSG_RECORD_NOT_FOUND         := 'Запись не найдена!';
                 mm.MSG_SELECT_VALID_RECORD      := 'Выбрать действительную запись.';

                 mm.MSG_TABLE_DO_NOT_EXIST       := 'Таблица "%s" не существует или не имеет первичного ключа (целого числа)!';

                 mm.MSG_SEARCH_CONDICIONAL_AND   := 'Условие поиска: И';
                 mm.MSG_SEARCH_CONDICIONAL_OR    := 'Условие поиска: ИЛИ';
            end;
       ltzn_CH : begin
                   mm.LAB_STATE_I := ' [insert]';
                   mm.LAB_STATE_E := ' [edit]';
                   mm.LAB_STATE_B := ' [search]';

                   mm.MSG_CONFIRM_DELETE           := 'Confirm Deletion of Current Record ?';
                   mm.MSG_CONFIRM_DELETE_ALL       := 'Do you confirm deletion of all records?';
                   mm.MSG_CONTINUE_REGISTERING     := 'Do you want to make a new registration?';
                   mm.MSG_SUCCESS_POST             := 'Record successfully saved!';
                   mm.MSG_SUCCESS_DELETE           := 'Record successfully deleted! ';
                   mm.MSG_PASSWORD_RESET           := 'PASSWORD RESET';
                   mm.MSG_PASSWORD_TEMP            := 'Your temporary password:';
                   mm.MSG_PASSWORD_TEMP_SENT       := 'Your provisional password has been sent to the email provided.';
                   mm.MSG_EMAIL_DO_NOT_REPLY       := 'Do not reply to that email.';
                   mm.MSG_REGISTER_NEW             := 'NEW REGISTER';
                   mm.MSG_COMPANY_SELECT           := 'Select a company!';
                   mm.MSG_COMPANY_USER_OTHER       := 'User does not have access to selected company!';
                   mm.MSG_USER_DO_NOT_HAVE_ACCESS  := 'You do not have access';
                   mm.MSG_USER_SUPERIOR_PERMISSION := 'Superior Permission';
                   mm.MSG_USER                     := 'User';
                   mm.MSG_USER_RELEASE_PASSWORD    := 'Password for Release';
                   mm.MSG_NEW_USER_REGISTERED      := 'New User Registered !' ;// v. 3.2.0.0...

                   // frmCadBASICS
                   // ------------
                   // In the tables that come with RADCORE I use the fields by default
                   // CODE( for primary key ) and DESCRIPTION( for describing the content )
                   // for ARRAY formation for use with "Basic Records" ( ARRAY_BASICS )
                   // You can change it according to its structure as described in the comment opposite
                   // of the two variables below
                   mm.ARRAY_BASICS_FLD_ID_NAME           := 'CODIGO';    // CODIGO, ID, SEQ...
                   mm.ARRAY_BASICS_FLD_DESCRIPTION_NAME  := 'DESCRICAO'; // DESCRICAO, DESCRIPTION, TEXT...
                   // aliases / grid columns
                   mm.ARRAY_BASICS_FLD_ID_ALIAS          := 'CODE';
                   mm.ARRAY_BASICS_FLD_DESCRIPTION_ALIAS := 'DESCRIPTION';
                   mm.ARRAY_BASICS_FLD_ID_LABEL          := 'CODE';
                   mm.ARRAY_BASICS_FLD_DESCRIPTION_LABEL := 'DESCRIPTION';
                   mm.MSG_FIELD_NAME_CODE                := 'ID';
                   mm.MSG_FIELD_NAME_DESCRIPTION         := 'Description';

                   mm.MSG_RECORDS                  := 'rec(s)';
                   mm.MSG_RECORD_NOT_FOUND         := 'Record not found!';
                   mm.MSG_SELECT_VALID_RECORD      := 'Select a valid record.';

                   mm.MSG_TABLE_DO_NOT_EXIST       := 'Table "%s" does not exist or does not have a Primary Key (integer)!';

                   mm.MSG_SEARCH_CONDICIONAL_AND   := 'Search Condition: AND';
                   mm.MSG_SEARCH_CONDICIONAL_OR    := 'Search Condition: OR';

                 end;
       ltin_ID : begin
                   mm.LAB_STATE_I := ' [insert]';
                   mm.LAB_STATE_E := ' [edit]';
                   mm.LAB_STATE_B := ' [search]';

                   mm.MSG_CONFIRM_DELETE           := 'Confirm Deletion of Current Record ?';
                   mm.MSG_CONFIRM_DELETE_ALL       := 'Do you confirm deletion of all records?';
                   mm.MSG_CONTINUE_REGISTERING     := 'Do you want to make a new registration?';
                   mm.MSG_SUCCESS_POST             := 'Record successfully saved!';
                   mm.MSG_SUCCESS_DELETE           := 'Record successfully deleted! ';
                   mm.MSG_PASSWORD_RESET           := 'PASSWORD RESET';
                   mm.MSG_PASSWORD_TEMP            := 'Your temporary password:';
                   mm.MSG_PASSWORD_TEMP_SENT       := 'Your provisional password has been sent to the email provided.';
                   mm.MSG_EMAIL_DO_NOT_REPLY       := 'Do not reply to that email.';
                   mm.MSG_REGISTER_NEW             := 'NEW REGISTER';
                   mm.MSG_COMPANY_SELECT           := 'Select a company!';
                   mm.MSG_COMPANY_USER_OTHER       := 'User does not have access to selected company!';
                   mm.MSG_USER_DO_NOT_HAVE_ACCESS  := 'You do not have access';
                   mm.MSG_USER_SUPERIOR_PERMISSION := 'Superior Permission';
                   mm.MSG_USER                     := 'User';
                   mm.MSG_USER_RELEASE_PASSWORD    := 'Password for Release';
                   mm.MSG_NEW_USER_REGISTERED      := 'New User Registered !' ;// v. 3.2.0.0...

                   // frmCadBASICS
                   // ------------
                   // In the tables that come with RADCORE I use the fields by default
                   // CODE( for primary key ) and DESCRIPTION( for describing the content )
                   // for ARRAY formation for use with "Basic Records" ( ARRAY_BASICS )
                   // You can change it according to its structure as described in the comment opposite
                   // of the two variables below
                   mm.ARRAY_BASICS_FLD_ID_NAME           := 'CODIGO';    // CODIGO, ID, SEQ...
                   mm.ARRAY_BASICS_FLD_DESCRIPTION_NAME  := 'DESCRICAO'; // DESCRICAO, DESCRIPTION, TEXT...
                   // aliases / grid columns
                   mm.ARRAY_BASICS_FLD_ID_ALIAS          := 'CODE';
                   mm.ARRAY_BASICS_FLD_DESCRIPTION_ALIAS := 'DESCRIPTION';
                   mm.ARRAY_BASICS_FLD_ID_LABEL          := 'CODE';
                   mm.ARRAY_BASICS_FLD_DESCRIPTION_LABEL := 'DESCRIPTION';
                   mm.MSG_FIELD_NAME_CODE                := 'ID';
                   mm.MSG_FIELD_NAME_DESCRIPTION         := 'Description';

                   mm.MSG_RECORDS                  := 'rec(s)';
                   mm.MSG_RECORD_NOT_FOUND         := 'Record not found!';
                   mm.MSG_SELECT_VALID_RECORD      := 'Select a valid record.';

                   mm.MSG_TABLE_DO_NOT_EXIST       := 'Table "%s" does not exist or does not have a Primary Key (integer)!';

                   mm.MSG_SEARCH_CONDICIONAL_AND   := 'Search Condition: AND';
                   mm.MSG_SEARCH_CONDICIONAL_OR    := 'Search Condition: OR';

                 end;
       ltth_TH : begin
                   mm.LAB_STATE_I := ' [insert]';
                   mm.LAB_STATE_E := ' [edit]';
                   mm.LAB_STATE_B := ' [search]';

                   mm.MSG_CONFIRM_DELETE           := 'Confirm Deletion of Current Record ?';
                   mm.MSG_CONFIRM_DELETE_ALL       := 'Do you confirm deletion of all records?';
                   mm.MSG_CONTINUE_REGISTERING     := 'Do you want to make a new registration?';
                   mm.MSG_SUCCESS_POST             := 'Record successfully saved!';
                   mm.MSG_SUCCESS_DELETE           := 'Record successfully deleted! ';
                   mm.MSG_PASSWORD_RESET           := 'PASSWORD RESET';
                   mm.MSG_PASSWORD_TEMP            := 'Your temporary password:';
                   mm.MSG_PASSWORD_TEMP_SENT       := 'Your provisional password has been sent to the email provided.';
                   mm.MSG_EMAIL_DO_NOT_REPLY       := 'Do not reply to that email.';
                   mm.MSG_REGISTER_NEW             := 'NEW REGISTER';
                   mm.MSG_COMPANY_SELECT           := 'Select a company!';
                   mm.MSG_COMPANY_USER_OTHER       := 'User does not have access to selected company!';
                   mm.MSG_USER_DO_NOT_HAVE_ACCESS  := 'You do not have access';
                   mm.MSG_USER_SUPERIOR_PERMISSION := 'Superior Permission';
                   mm.MSG_USER                     := 'User';
                   mm.MSG_USER_RELEASE_PASSWORD    := 'Password for Release';
                   mm.MSG_NEW_USER_REGISTERED      := 'New User Registered !' ;// v. 3.2.0.0...

                   // frmCadBASICS
                   // ------------
                   // In the tables that come with RADCORE I use the fields by default
                   // CODE( for primary key ) and DESCRIPTION( for describing the content )
                   // for ARRAY formation for use with "Basic Records" ( ARRAY_BASICS )
                   // You can change it according to its structure as described in the comment opposite
                   // of the two variables below
                   mm.ARRAY_BASICS_FLD_ID_NAME           := 'CODIGO';    // CODIGO, ID, SEQ...
                   mm.ARRAY_BASICS_FLD_DESCRIPTION_NAME  := 'DESCRICAO'; // DESCRICAO, DESCRIPTION, TEXT...
                   // aliases / grid columns
                   mm.ARRAY_BASICS_FLD_ID_ALIAS          := 'CODE';
                   mm.ARRAY_BASICS_FLD_DESCRIPTION_ALIAS := 'DESCRIPTION';
                   mm.ARRAY_BASICS_FLD_ID_LABEL          := 'CODE';
                   mm.ARRAY_BASICS_FLD_DESCRIPTION_LABEL := 'DESCRIPTION';
                   mm.MSG_FIELD_NAME_CODE                := 'ID';
                   mm.MSG_FIELD_NAME_DESCRIPTION         := 'Description';

                   mm.MSG_RECORDS                  := 'rec(s)';
                   mm.MSG_RECORD_NOT_FOUND         := 'Record not found!';
                   mm.MSG_SELECT_VALID_RECORD      := 'Select a valid record.';

                   mm.MSG_TABLE_DO_NOT_EXIST       := 'Table "%s" does not exist or does not have a Primary Key (integer)!';

                   mm.MSG_SEARCH_CONDICIONAL_AND   := 'Search Condition: AND';
                   mm.MSG_SEARCH_CONDICIONAL_OR    := 'Search Condition: OR';

                 end;
       lthi_IN : begin
                   mm.LAB_STATE_I := ' [insert]';
                   mm.LAB_STATE_E := ' [edit]';
                   mm.LAB_STATE_B := ' [search]';

                   mm.MSG_CONFIRM_DELETE           := 'Confirm Deletion of Current Record ?';
                   mm.MSG_CONFIRM_DELETE_ALL       := 'Do you confirm deletion of all records?';
                   mm.MSG_CONTINUE_REGISTERING     := 'Do you want to make a new registration?';
                   mm.MSG_SUCCESS_POST             := 'Record successfully saved!';
                   mm.MSG_SUCCESS_DELETE           := 'Record successfully deleted! ';
                   mm.MSG_PASSWORD_RESET           := 'PASSWORD RESET';
                   mm.MSG_PASSWORD_TEMP            := 'Your temporary password:';
                   mm.MSG_PASSWORD_TEMP_SENT       := 'Your provisional password has been sent to the email provided.';
                   mm.MSG_EMAIL_DO_NOT_REPLY       := 'Do not reply to that email.';
                   mm.MSG_REGISTER_NEW             := 'NEW REGISTER';
                   mm.MSG_COMPANY_SELECT           := 'Select a company!';
                   mm.MSG_COMPANY_USER_OTHER       := 'User does not have access to selected company!';
                   mm.MSG_USER_DO_NOT_HAVE_ACCESS  := 'You do not have access';
                   mm.MSG_USER_SUPERIOR_PERMISSION := 'Superior Permission';
                   mm.MSG_USER                     := 'User';
                   mm.MSG_USER_RELEASE_PASSWORD    := 'Password for Release';
                   mm.MSG_NEW_USER_REGISTERED      := 'New User Registered !' ;// v. 3.2.0.0...

                   // frmCadBASICS
                   // ------------
                   // In the tables that come with RADCORE I use the fields by default
                   // CODE( for primary key ) and DESCRIPTION( for describing the content )
                   // for ARRAY formation for use with "Basic Records" ( ARRAY_BASICS )
                   // You can change it according to its structure as described in the comment opposite
                   // of the two variables below
                   mm.ARRAY_BASICS_FLD_ID_NAME           := 'CODIGO';    // CODIGO, ID, SEQ...
                   mm.ARRAY_BASICS_FLD_DESCRIPTION_NAME  := 'DESCRICAO'; // DESCRICAO, DESCRIPTION, TEXT...
                   // aliases / grid columns
                   mm.ARRAY_BASICS_FLD_ID_ALIAS          := 'CODE';
                   mm.ARRAY_BASICS_FLD_DESCRIPTION_ALIAS := 'DESCRIPTION';
                   mm.ARRAY_BASICS_FLD_ID_LABEL          := 'CODE';
                   mm.ARRAY_BASICS_FLD_DESCRIPTION_LABEL := 'DESCRIPTION';
                   mm.MSG_FIELD_NAME_CODE                := 'ID';
                   mm.MSG_FIELD_NAME_DESCRIPTION         := 'Description';

                   mm.MSG_RECORDS                  := 'rec(s)';
                   mm.MSG_RECORD_NOT_FOUND         := 'Record not found!';
                   mm.MSG_SELECT_VALID_RECORD      := 'Select a valid record.';

                   mm.MSG_TABLE_DO_NOT_EXIST       := 'Table "%s" does not exist or does not have a Primary Key (integer)!';

                   mm.MSG_SEARCH_CONDICIONAL_AND   := 'Search Condition: AND';
                   mm.MSG_SEARCH_CONDICIONAL_OR    := 'Search Condition: OR';

                 end;
       ltar_SA    : begin
                   mm.LAB_STATE_I := ' [أدخل]';
                   mm.LAB_STATE_E := ' [تعديل]';
                   mm.LAB_STATE_B := ' [بحث]';

                   mm.MSG_CONFIRM_DELETE           := 'تأكيد حذف السجل الحالي؟';
                   mm.MSG_CONFIRM_DELETE_ALL       := 'هل تؤكد حذف جميع السجلات؟';
                   mm.MSG_CONTINUE_REGISTERING     := 'هل تريد عمل تسجيل جديد؟';
                   mm.MSG_SUCCESS_POST             := 'سجل تم حفظه بنجاح!';
                   mm.MSG_SUCCESS_DELETE           := 'تم حذف التسجيل بنجاح!';
                   mm.MSG_PASSWORD_RESET           := 'إعادة تعيين كلمة المرور';
                   mm.MSG_PASSWORD_TEMP            := ':كلمة السر المؤقتة الخاصة بك';
                   mm.MSG_PASSWORD_TEMP_SENT       := 'تم إرسال كلمة المرور المؤقتة الخاصة بك إلى البريد الإلكتروني المقدم.';
                   mm.MSG_EMAIL_DO_NOT_REPLY       := 'لا ترد على هذا البريد الإلكتروني.';
                   mm.MSG_REGISTER_NEW             := 'تسجيل جديد';
                   mm.MSG_COMPANY_SELECT           := 'اختر الشركة!';
                   mm.MSG_COMPANY_USER_OTHER       := 'المستخدم ليس لديه حق الوصول إلى الشركة المختارة!';
                   mm.MSG_USER_DO_NOT_HAVE_ACCESS  := 'ليس لديك حق الوصول';
                   mm.MSG_USER_SUPERIOR_PERMISSION := 'إذن أعلى';
                   mm.MSG_USER                     := 'مستخدم';
                   mm.MSG_USER_RELEASE_PASSWORD    := 'كلمة المرور للإفراج';
                   mm.MSG_NEW_USER_REGISTERED      := 'مستخدم جديد مسجل!' ;// v. 3.2.0.0...

                   // frmCadBASICS
                   // ------------
                   // In the tables that come with RADCORE I use the fields by default
                   // CODE( for primary key ) and DESCRIPTION( for describing the content )
                   // for ARRAY formation for use with "Basic Records" ( ARRAY_BASICS )
                   // You can change it according to its structure as described in the comment opposite
                   // of the two variables below
                   mm.ARRAY_BASICS_FLD_ID_NAME           := 'CODIGO';    // CODIGO, ID, SEQ...
                   mm.ARRAY_BASICS_FLD_DESCRIPTION_NAME  := 'DESCRICAO'; // DESCRICAO, DESCRIPTION, TEXT...
                   // aliases / grid columns
                   mm.ARRAY_BASICS_FLD_ID_ALIAS          := 'CODE';
                   mm.ARRAY_BASICS_FLD_DESCRIPTION_ALIAS := 'DESCRIPTION';
                   mm.ARRAY_BASICS_FLD_ID_LABEL          := 'CODE';
                   mm.ARRAY_BASICS_FLD_DESCRIPTION_LABEL := 'DESCRIPTION';
                   mm.MSG_FIELD_NAME_CODE                := 'ID';
                   mm.MSG_FIELD_NAME_DESCRIPTION         := 'Description';

                   mm.MSG_RECORDS                  := 'سجل (سجلات)';
                   mm.MSG_RECORD_NOT_FOUND         := 'لم يتم العثور على السجل!';
                   mm.MSG_SELECT_VALID_RECORD      := 'اختر سجلاً صالحًا.';

                   mm.MSG_TABLE_DO_NOT_EXIST       := ' غير موجود أو لا يحتوي على مفتاح أساسي (عدد صحيح)! "%s" الجدول';

                   mm.MSG_SEARCH_CONDICIONAL_AND   := 'شرط البحث: و';
                   mm.MSG_SEARCH_CONDICIONAL_OR    := 'شرط البحث: أو';

                 end;
     end;

     case mm.varLT_Lang of
          ltpt_BR : mm.MSG_CONFIRM_DELETE := 'Confirma exclusão do Registro?';
          lten_US, lten_GB : mm.MSG_CONFIRM_DELETE := 'Confirm Deletion of Current Record ?';
          ltes_ES : mm.MSG_CONFIRM_DELETE := '¿Confirmar eliminación de registro?';
          ltfr_FR : mm.MSG_CONFIRM_DELETE := 'Confirmer la suppression du registre ?';
          ltde_DE : mm.MSG_CONFIRM_DELETE := 'Löschen der Registrierung bestätigen?';
          ltit_IT : mm.MSG_CONFIRM_DELETE := 'Conferma eliminazione registro?';
          lttr_TR : mm.MSG_CONFIRM_DELETE := 'Kayıt Silmeyi Onaylayın?';
          ltru_RU : mm.MSG_CONFIRM_DELETE := 'Подтвердить удаление текущей записи?';
          ltzn_CH : mm.MSG_CONFIRM_DELETE := 'Confirm Deletion of Current Record ?';
          ltin_ID : mm.MSG_CONFIRM_DELETE := 'Confirm Deletion of Current Record ?';
          ltth_TH : mm.MSG_CONFIRM_DELETE := 'Confirm Deletion of Current Record ?';
          lthi_IN : mm.MSG_CONFIRM_DELETE := 'Confirm Deletion of Current Record ?';
          ltar_SA : mm.MSG_CONFIRM_DELETE := 'تأكيد حذف السجل الحالي؟';
     end;

     case mm.varLT_Lang of
          ltpt_BR : mm.MSG_RESOURCE_IN_DEVELOPMENT := 'Recurso em Desenvolvimento.';
          lten_US, lten_GB : mm.MSG_RESOURCE_IN_DEVELOPMENT := 'Resource in Development.';
          ltes_ES : mm.MSG_RESOURCE_IN_DEVELOPMENT := 'Recurso en desarrollo.';
          ltfr_FR : mm.MSG_RESOURCE_IN_DEVELOPMENT := 'Ressource en développement.';
          ltde_DE : mm.MSG_RESOURCE_IN_DEVELOPMENT := 'Ressource in Entwicklung.';
          ltit_IT : mm.MSG_RESOURCE_IN_DEVELOPMENT := 'Risorsa in sviluppo.';
          lttr_TR : mm.MSG_RESOURCE_IN_DEVELOPMENT := 'Geliştirmede Kaynak.';
          ltru_RU : mm.MSG_RESOURCE_IN_DEVELOPMENT := 'Ресурс в разработке.';
          ltzn_CH : mm.MSG_RESOURCE_IN_DEVELOPMENT := 'Resource in Development.';
          ltin_ID : mm.MSG_RESOURCE_IN_DEVELOPMENT := 'Resource in Development.';
          ltth_TH : mm.MSG_RESOURCE_IN_DEVELOPMENT := 'Resource in Development.';
          lthi_IN : mm.MSG_RESOURCE_IN_DEVELOPMENT := 'Resource in Development.';
          ltar_SA : mm.MSG_RESOURCE_IN_DEVELOPMENT := 'المورد قيد التطوير';
     end;

     case mm.varLT_Lang of
          ltpt_BR : mm.MSG_CONTACT_SUPPORT := 'Entre em contato com a ' + SOFTWAREHOUSE_NAME;
          lten_US, lten_GB : mm.MSG_CONTACT_SUPPORT := 'Please contact ' + SOFTWAREHOUSE_NAME;
          ltes_ES : mm.MSG_CONTACT_SUPPORT := 'Por favor contactar ' + SOFTWAREHOUSE_NAME;
          ltfr_FR : mm.MSG_CONTACT_SUPPORT := 'Veuillez contacter ' + SOFTWAREHOUSE_NAME;
          ltde_DE : mm.MSG_CONTACT_SUPPORT := 'Bitte kontaktieren Sie ' + SOFTWAREHOUSE_NAME;
          ltit_IT : mm.MSG_CONTACT_SUPPORT := 'Contatta ' + SOFTWAREHOUSE_NAME;
          lttr_TR : mm.MSG_CONTACT_SUPPORT := 'Lütfen iletişim kurun' + SOFTWAREHOUSE_NAME;
          ltru_RU : mm.MSG_CONTACT_SUPPORT := 'Свяжитесь с ' + SOFTWAREHOUSE_NAME;
          ltzn_CH : mm.MSG_CONTACT_SUPPORT := 'Please contact ' + SOFTWAREHOUSE_NAME;
          ltin_ID : mm.MSG_CONTACT_SUPPORT := 'Please contact ' + SOFTWAREHOUSE_NAME;
          ltth_TH : mm.MSG_CONTACT_SUPPORT := 'Please contact ' + SOFTWAREHOUSE_NAME;
          lthi_IN : mm.MSG_CONTACT_SUPPORT := 'Please contact ' + SOFTWAREHOUSE_NAME;
          ltar_SA : mm.MSG_CONTACT_SUPPORT := 'الرجاء الاتصال ب ' + SOFTWAREHOUSE_NAME;
     end;

     // -----------------------------------------------------------------------------------
     // ERROR STRINGS
     case mm.varLT_Lang of
          ltpt_BR : begin
                      mm.MSG_INVALID_LOGIN                    := 'Usuário / Senha inválido(a)';
                      mm.MSG_INVALID_USER                     := 'Usuário inválido / Não Cadastrado';
                      mm.MSG_INVALID_EMAIL                    := 'Email inválido / Não Cadastrado';
                      mm.MSG_INVALID_PASSWORD                 := 'Senha inválida';
                      mm.MSG_UPLOAD_FAIL                      := 'Falha no upload do arquivo';
                      mm.MSG_BUGERROR_MENU_DO_NOT_EXIST       := '<strong>DICA</strong><br><hr>Talvez a opção ainda não esteja implementada.<br><br>' ;
                      mm.MSG_BUGERROR_REGISTER_IN_USE         := 'Registro em edição. Salve ou cancele a operação.';
                      mm.MSG_BUGERROR_COM_SERVER_FAIL         := 'Falha na comunicação com Servidor de Banco de Dados';

                      mm.MSG_BUGERROR_REGISTER_REQUEST        := 'Falha na solicitação de cadastro!';

                      mm.MSG_BUGERROR_REGISTER_CAN_NOT_DELETE := 'Exclusão de Registro( ' + '%s' + ' )' + sLineBreak +
                                                                 'Existe movimentação com esse registro( cód.' + '%s' + ' ) ' + sLineBreak +
                                                                 'na tabela: ' + mm.varC_LastErrorMsg + sLineBreak + sLineBreak +
                                                                 'A exclusão não é permitida.';
                      mm.MSG_BUGERROR_POST                    := 'Falha ao salvar o registro.';
                      mm.MSG_BUGERROR_INVALID_CONTENT         := 'Informe o conteúdo correto!';
                      mm.MSG_BUGERROR_PK_SEQUENCE             := 'Falha ao gerar o sequencial.';
                      mm.MSG_BUGERROR_CLOSE_QUERY             := 'Falha ao fechar query';
                      mm.MSG_BUGERROR_OPEN_QUERY              := 'Failed to open query';
                      mm.MSG_BUGERROR_DEFAULT_SQL_STATMENT    := 'Não foi definida a instrução sql para <strong>%s</strong> no on create do form herdado.';
                      mm.MSG_BUGERROR_CONTENT_MUST_BE_NUMERIC := 'Conteúdo da pesquisa deve ser númerico(a).';
                      mm.MSG_BUGERROR_INVALID_SEARCH_OPERATOR := 'OPERADOR não permitido para esse tipo de campo.';
                      mm.MSG_BUGERROR_MAX_TAB_OPENED          := 'Max. de Abas( %s ) abertas. Feche alguma(s) para abrir outra(s)!'; // v. 4.0.0.0
                      mm.MSG_BUGERROR_INCOMPATIBLE_SGBD       := 'Função de retorno "%s" incompatível com seu SGBD!';
                      mm.MSG_BUGERROR_FOREIGN_KEY_DELETE      := 'Exclusão de chave estrangeira.'
//                      mm.MSG_BUGERROR_LOOKUP_BTN := '<h2>Falha Acionamento do Botão Pesquisa LookUp !</h2><br>' +
//                                                    '<strong>MENSAGEM</strong><br><hr>' + '<strong>btnLkp: </strong>' + '%s ' + ' não declarado !' + '<br><br>' +
//                                                    '<strong>DICA</strong><br><hr>Botão com nomenclatura fora do padrão %s' + '<br><br>' +
//                                                    mm.MSG_CONTACT_SUPPORT;
//
//                      mm.MSG_BUGERROR_LOOKUP_BTN_QUERY := '<h2>Falha na Preparação de LookUps !</h2><br>' +
//                                                          '<strong>MENSAGEM</strong><br><hr>' + '<strong>LkpQuery: </strong>' + '%s ' + ' não declarado !' + '<br><br>' +
//                                                          '<strong>DICA</strong><br><hr>Query com nomenclatura fora do padrão %s' + '<br><br>' +
//                                                          mm.MSG_CONTACT_SUPPORT;
                    end;
          lten_US, lten_GB: begin
                   mm.MSG_INVALID_LOGIN                    := 'Invalid user / password';
                   mm.MSG_INVALID_USER                     := 'Invalid user / Not registered';
                   mm.MSG_INVALID_EMAIL                    := 'Invalid email / Not registered';
                   mm.MSG_INVALID_PASSWORD                 := 'Invalid password';
                   mm.MSG_UPLOAD_FAIL                      := 'File upload failed';
                   mm.MSG_BUGERROR_MENU_DO_NOT_EXIST       := '<strong>TIP</strong><br><hr>Perhaps the option is not yet implemented.<br><br>' ;
                   mm.MSG_BUGERROR_REGISTER_IN_USE         := 'Editing record. Save or cancel the operation. ';
                   mm.MSG_BUGERROR_COM_SERVER_FAIL         := 'Failed to communicate with Database Server';
                   mm.MSG_BUGERROR_REGISTER_REQUEST        := 'Registration request failed!';
                   mm.MSG_BUGERROR_REGISTER_CAN_NOT_DELETE := 'Registration Deletion( ' + '%s' + ' )' + sLineBreak +
                                                              'There is movement with this record( cód.' + '%s' + ' ) ' + sLineBreak +
                                                              'in table: ' + mm.varC_LastErrorMsg + sLineBreak + sLineBreak +
                                                              'Exclusion is not allowed.';
                   mm.MSG_BUGERROR_POST                    := 'Failed to save the record.';
                   mm.MSG_BUGERROR_INVALID_CONTENT         := 'Enter the correct content of the field!';
                   mm.MSG_BUGERROR_PK_SEQUENCE             := 'Failed to generate sequential';
                   mm.MSG_BUGERROR_CLOSE_QUERY             := 'Failed to close query';
                   mm.MSG_BUGERROR_OPEN_QUERY              := 'Falha ao abrir query';
                   mm.MSG_BUGERROR_DEFAULT_SQL_STATMENT    := 'The sql statement for <strong> %s </strong> has not been defined in the on create of the inherited form.';
                   mm.MSG_BUGERROR_CONTENT_MUST_BE_NUMERIC := 'Search content must be numeric';
                   mm.MSG_BUGERROR_INVALID_SEARCH_OPERATOR := 'OPERATOR not allowed for this type of field.';
                   mm.MSG_BUGERROR_MAX_TAB_OPENED          := 'Max. of open Tabs( %s ). Close one or more to open another(s)!'; // v. 4.0.0.0
                   mm.MSG_BUGERROR_INCOMPATIBLE_SGBD       := 'Return function "%s" is incompatible with your DBMS!';
                   mm.MSG_BUGERROR_FOREIGN_KEY_DELETE      := 'Deletion of foreign key.';
//                   mm.MSG_BUGERROR_LOOKUP_BTN := '<h2> Search LookUp Button Failed! </h2> <br>' +
//                                                  '<strong> MESSAGE </strong> <br> <hr>' + '<strong> btnLkp: </strong>' + '%s' + 'not declared!' + '<br> <br>' +
//                                                  '<strong> TIP </strong> <br> <hr> Button with non-standard nomenclature.' + '<br> <br>' +
//                                                 mm.MSG_CONTACT_SUPPORT;
//
//                   mm.MSG_BUGERROR_LOOKUP_BTN_QUERY := '<h2>LookUps Preparation failed!</h2><br>' +
//                                                       '<strong>MESSAGE</strong><br><hr>' + '<strong>LkpQuery: </strong>' + '%s ' + 'not declared!' + '<br><br>' +
//                                                       '<strong>TIP</strong><br><hr>Query com nomenclatura fora do padrão %s' + '<br><br>' +
//                                                       mm.MSG_CONTACT_SUPPORT;

                 end;
          ltes_ES: begin
                   mm.MSG_INVALID_LOGIN                    := 'Usuario / contraseña no válidos';
                   mm.MSG_INVALID_USER                     := 'Usuario no válido / No registrado';
                   mm.MSG_INVALID_EMAIL                    := 'Correo electrónico no válido / No registrado';
                   mm.MSG_INVALID_PASSWORD                 := 'Contraseña no válida';
                   mm.MSG_UPLOAD_FAIL                      := 'Error al cargar el archivo';
                   mm.MSG_BUGERROR_MENU_DO_NOT_EXIST       := '<strong>Obs:</strong><br><hr>Quizás la opción aún no esté implementada.<br><br>' ;
                   mm.MSG_BUGERROR_REGISTER_IN_USE         := 'Edición de registro. Guarde o cancele la operación. ';
                   mm.MSG_BUGERROR_COM_SERVER_FAIL         := 'Error al comunicarse con el servidor de base de datos';
                   mm.MSG_BUGERROR_REGISTER_REQUEST        := '¡La solicitud de registro falló!';
                   mm.MSG_BUGERROR_REGISTER_CAN_NOT_DELETE := 'Eliminación de registro( ' + '%s' + ' )' + sLineBreak +
                                                              'Hay movimiento con este disco( cód.' + '%s' + ' ) ' + sLineBreak +
                                                              'la tabla: ' + mm.varC_LastErrorMsg + sLineBreak + sLineBreak +
                                                              'No se permite la exclusión.';
                   mm.MSG_BUGERROR_POST                    := 'No se pudo guardar el registro.';
                   mm.MSG_BUGERROR_INVALID_CONTENT         := '¡Ingrese el contenido correcto del campo!';
                   mm.MSG_BUGERROR_PK_SEQUENCE             := 'No se pudo generar secuencial';
                   mm.MSG_BUGERROR_CLOSE_QUERY             := 'No se pudo cerrar la consulta';
                   mm.MSG_BUGERROR_OPEN_QUERY              := 'No se pudo abrir la consulta';
                   mm.MSG_BUGERROR_DEFAULT_SQL_STATMENT    := 'La instrucción sql para <strong> %s </strong> no se ha definido en la creación del formulario heredado.';
                   mm.MSG_BUGERROR_CONTENT_MUST_BE_NUMERIC := 'El contenido de la búsqueda debe ser numérico(a).';
                   mm.MSG_BUGERROR_INVALID_SEARCH_OPERATOR :=  'OPERADOR não permitido para esse tipo de campo.';
                   mm.MSG_BUGERROR_MAX_TAB_OPENED          := 'Máx. de pestañas abiertas (%s). ¡Cierra uno o más para abrir otro(s)!'; // v. 4.0.0.0
                   mm.MSG_BUGERROR_INCOMPATIBLE_SGBD       := '¡La función de retorno "%s" es incompatible con su DBMS!';
                   mm.MSG_BUGERROR_FOREIGN_KEY_DELETE      := 'Eliminación de clave externa';
//                   mm.MSG_BUGERROR_LOOKUP_BTN := '<h2>¡Error en el botón de búsqueda de lookup!</h2> <br>' +
//                                                 '<strong> MENSAJE </strong> <br> <hr>' + '<strong> btnLkp: </strong>' + '%s' + 'no declarado.' + '<br> <br>' +
//                                                 '<strong> SUGERENCIA </strong> <br> <hr> Botón con nomenclatura no estándar.' + '<br> <br>' +
//                                                 mm.MSG_CONTACT_SUPPORT;
//                   mm.MSG_BUGERROR_LOOKUP_BTN_QUERY := '<h2>¡Falló la preparación de LookUps!</h2><br>' +
//                                                       '<strong>MENSAJE</strong><br><hr>' + '<strong>LkpQuery: </strong>' + '%s ' + ' no declarado.' + '<br><br>' +
//                                                       '<strong>SUGERENCIA</strong><br><hr>Query con nomenclatura no estándar %s' + '<br><br>' +
//                                                       mm.MSG_CONTACT_SUPPORT;

                 end;
          ltfr_FR: begin
                   mm.MSG_INVALID_LOGIN                    := 'Utilisateur/mot de passe invalide';
                   mm.MSG_INVALID_USER                     := 'Utilisateur invalide / Non enregistré';
                   mm.MSG_INVALID_EMAIL                    := 'Email invalide / Non enregistré';
                   mm.MSG_INVALID_PASSWORD                 := 'Mot de passe invalide';
                   mm.MSG_UPLOAD_FAIL                      := 'Le téléchargement du fichier a échoué';
                   mm.MSG_BUGERROR_MENU_DO_NOT_EXIST       := '<strong>TIP</strong><br><hr>L''option n''est peut-être pas encore implémentée.<br><br>' ;
                   mm.MSG_BUGERROR_REGISTER_IN_USE         := 'Modification de l''enregistrement. Enregistrez ou annulez l''opération. ';
                   mm.MSG_BUGERROR_COM_SERVER_FAIL         := 'Échec de la communication avec le serveur de base de données';
                   mm.MSG_BUGERROR_REGISTER_REQUEST        := 'La demande d''enregistrement a échoué !';
                   mm.MSG_BUGERROR_REGISTER_CAN_NOT_DELETE := 'Suppression d''enregistrement( ' + '%s' + ' )' + sLineBreak +
                                                              'Il y a du mouvement avec cet enregistrement( cod.' + '%s' + ' ) ' + sLineBreak +
                                                              'dans le tableau : ' + mm.varC_LastErrorMsg + sLineBreak + sLineBreak +
                                                              'L''exclusion n''est pas autorisée.';
                   mm.MSG_BUGERROR_POST                    := 'Échec de l''enregistrement de l''enregistrement.';
                   mm.MSG_BUGERROR_INVALID_CONTENT         := 'Entrez le contenu correct du champ !';
                   mm.MSG_BUGERROR_PK_SEQUENCE             := 'Échec de la génération séquentielle';
                   mm.MSG_BUGERROR_CLOSE_QUERY             := 'Impossible de fermer la requête';
                   mm.MSG_BUGERROR_OPEN_QUERY              := 'Impossible d''ouvrir la requête';
                   mm.MSG_BUGERROR_DEFAULT_SQL_STATMENT    := 'L''instruction SQL pour <strong> %s </strong> n''a pas été définie dans la création du formulaire hérité.';
                   mm.MSG_BUGERROR_CONTENT_MUST_BE_NUMERIC := 'Le contenu de la recherche doit être numérique';
                   mm.MSG_BUGERROR_INVALID_SEARCH_OPERATOR := 'OPERATEUR non autorisé pour ce type de champ.';
                   mm.MSG_BUGERROR_MAX_TAB_OPENED          := 'Max. d''onglets ouverts ( %s ). Fermez-en un ou plusieurs pour en ouvrir un autre(s) !'; // v. 4.0.0.0
                   mm.MSG_BUGERROR_INCOMPATIBLE_SGBD       := 'La fonction de retour "%s" est incompatible avec votre SGBD !';
                   mm.MSG_BUGERROR_FOREIGN_KEY_DELETE      := 'Suppression de la clé étrangère.';
                   // mm.MSG_BUGERROR_LOOKUP_BTN           := '<h2> Échec du bouton de recherche de recherche ! </h2> <br>' +
                   // '<strong> MESSAGE </strong> <br> <hr>' + '<strong> btnLkp: </strong>' + '%s' + 'non déclaré !' + '<br> <br>' +
                   // '<strong> ASTUCE </strong> <br> <hr> Bouton avec une nomenclature non standard.' + '<br> <br>' +
                   // mm.MSG_CONTACT_SUPPORT;
                   //
                   // mm.MSG_BUGERROR_LOOKUP_BTN_QUERY     := '<h2>La préparation des recherches a échoué !</h2><br>' +
                   // '<strong>MESSAGE</strong><br><hr>' + '<strong>LkpQuery : </strong>' + '%s ' + 'non déclaré !' + '<br><br>' +
                   // '<strong>CONSEIL</strong><br><hr>Requête avec un nom non standard %s' + '<br><br>' +
                   // mm.MSG_CONTACT_SUPPORT;
              end;
          ltde_DE: begin  // French
                   mm.MSG_INVALID_LOGIN                    := 'Ungültiger Benutzer/Passwort';
                   mm.MSG_INVALID_USER                     := 'Ungültiger Benutzer / Nicht registriert';
                   mm.MSG_INVALID_EMAIL                    := 'Ungültige E-Mail / Nicht registriert';
                   mm.MSG_INVALID_PASSWORD                 := 'Ungültiges Passwort';
                   mm.MSG_UPLOAD_FAIL                      := 'Datei-Upload fehlgeschlagen';
                   mm.MSG_BUGERROR_MENU_DO_NOT_EXIST       := '<strong>TIPP</strong><br><hr>Vielleicht ist die Option noch nicht implementiert.<br><br>' ;
                   mm.MSG_BUGERROR_REGISTER_IN_USE         := 'Bearbeiten des Datensatzes. Speichern oder brechen Sie den Vorgang ab. ';
                   mm.MSG_BUGERROR_COM_SERVER_FAIL         := 'Kommunikation mit Datenbankserver fehlgeschlagen';
                   mm.MSG_BUGERROR_REGISTER_REQUEST        := 'Registrierungsanfrage fehlgeschlagen!';
                   mm.MSG_BUGERROR_REGISTER_CAN_NOT_DELETE := 'Registrierung löschen( ' + '%s' + ' )' + sLineBreak +
                                                              'Es gibt Bewegung mit diesem Datensatz( cod.' + '%s' + ' ) ' + sLineBreak +
                                                              'in Tabelle: ' + mm.varC_LastErrorMsg + sLineBreak + sLineBreak +
                                                              'Ausschluss ist nicht erlaubt.';
                   mm.MSG_BUGERROR_POST                    := 'Der Datensatz konnte nicht gespeichert werden.';
                   mm.MSG_BUGERROR_INVALID_CONTENT         := 'Geben Sie den korrekten Inhalt des Feldes ein!';
                   mm.MSG_BUGERROR_PK_SEQUENCE             := 'Sequenzielle Generierung fehlgeschlagen';
                   mm.MSG_BUGERROR_CLOSE_QUERY             := 'Abfrage konnte nicht geschlossen werden';
                   mm.MSG_BUGERROR_OPEN_QUERY              := 'Fehler beim Öffnen der Abfrage';
                   mm.MSG_BUGERROR_DEFAULT_SQL_STATMENT    := 'Die SQL-Anweisung für <strong> %s </strong> wurde beim Erstellen des geerbten Formulars nicht definiert.';
                   mm.MSG_BUGERROR_CONTENT_MUST_BE_NUMERIC := 'Suchinhalt muss numerisch sein';
                   mm.MSG_BUGERROR_INVALID_SEARCH_OPERATOR := 'OPERATOR für diesen Feldtyp nicht zulässig.';
                   mm.MSG_BUGERROR_MAX_TAB_OPENED          := 'Max. von geöffneten Tabs ( %s ). Schließen Sie einen oder mehrere, um einen oder mehrere zu öffnen!'; // v. 4.0.0.0
                   mm.MSG_BUGERROR_INCOMPATIBLE_SGBD       := 'Rückgabefunktion "%s" ist mit Ihrem DBMS nicht kompatibel!';
                   mm.MSG_BUGERROR_FOREIGN_KEY_DELETE      := 'Löschen des Fremdschlüssels.';
                   // mm.MSG_BUGERROR_LOOKUP_BTN           := '<h2> Suchschaltfläche für Suche fehlgeschlagen! </h2> <br>' +
                   // '<strong> NACHRICHT </strong> <br> <hr>' + '<strong> btnLkp: </strong>' + '%s' + 'nicht deklariert!' + '<br> <br>' +
                   // '<strong> TIP </strong> <br> <hr> Schaltfläche mit nicht standardmäßiger Nomenklatur.' + '<br> <br>' +
                   // mm.MSG_CONTACT_SUPPORT;
                   //
                   // mm.MSG_BUGERROR_LOOKUP_BTN_QUERY     := '<h2>Vorbereitung der LookUps fehlgeschlagen!</h2><br>' +
                   // '<strong>MESSAGE</strong><br><hr>' + '<strong>LkpQuery: </strong>' + '%s ' + 'nicht deklariert!' + '<br><br>' +
                   // '<strong>TIP</strong><br><hr>Abfrage mit nicht standardmäßiger Benennung %s' + '<br><br>' +
                   // mm.MSG_CONTACT_SUPPORT;
              end;
          ltit_IT: begin  // German
                   mm.MSG_INVALID_LOGIN                    := 'Utente/password non validi';
                   mm.MSG_INVALID_USER                     := 'Utente non valido / Non registrato';
                   mm.MSG_INVALID_EMAIL                    := 'Email non valida / Non registrato';
                   mm.MSG_INVALID_PASSWORD                 := 'Password non valida';
                   mm.MSG_UPLOAD_FAIL                      := 'Caricamento file fallito';
                   mm.MSG_BUGERROR_MENU_DO_NOT_EXIST       := '<strong>TIP</strong><br><hr>Forse l''opzione non è ancora implementata.<br><br>' ;
                   mm.MSG_BUGERROR_REGISTER_IN_USE         := 'Modifica record. Salva o annulla l''operazione. ';
                   mm.MSG_BUGERROR_COM_SERVER_FAIL         := 'Impossibile comunicare con il server database';
                   mm.MSG_BUGERROR_REGISTER_REQUEST        := 'Richiesta di registrazione fallita!';
                   mm.MSG_BUGERROR_REGISTER_CAN_NOT_DELETE := 'Cancellazione registrazione( ' + '%s' + ' )' + sLineBreak +
                                                              'C''è movimento con questo record (cod.' + '%s' + ' ) ' + sLineBreak +
                                                              'nella tabella: ' + mm.varC_LastErrorMsg + sLineBreak + sLineBreak +
                                                              'L''esclusione non è consentita.';
                   mm.MSG_BUGERROR_POST                    := 'Impossibile salvare il record.';
                   mm.MSG_BUGERROR_INVALID_CONTENT         := 'Inserisci il contenuto corretto del campo!';
                   mm.MSG_BUGERROR_PK_SEQUENCE             := 'Impossibile generare sequenziale';
                   mm.MSG_BUGERROR_CLOSE_QUERY             := 'Impossibile chiudere la query';
                   mm.MSG_BUGERROR_OPEN_QUERY              := 'Impossibile aprire la query';
                   mm.MSG_BUGERROR_DEFAULT_SQL_STATMENT    := 'L\''istruzione sql per <strong> %s </strong> non è stata definita nella creazione del modulo ereditato.';
                   mm.MSG_BUGERROR_CONTENT_MUST_BE_NUMERIC := 'Il contenuto della ricerca deve essere numerico';
                   mm.MSG_BUGERROR_INVALID_SEARCH_OPERATOR := 'OPERATOR non consentito per questo tipo di campo.';
                   mm.MSG_BUGERROR_MAX_TAB_OPENED          := 'Massimo. di schede aperte( %s ). Chiudine uno o più per aprirne un altro(i)!'; // v. 4.0.0.0
                   mm.MSG_BUGERROR_INCOMPATIBLE_SGBD       := 'La funzione di ritorno "%s" non è compatibile con il tuo DBMS!';
                   mm.MSG_BUGERROR_FOREIGN_KEY_DELETE      := 'Cancellazione chiave esterna.';
                   // mm.MSG_BUGERROR_LOOKUP_BTN           := '<h2> Pulsante ricerca ricerca fallito! </h2> <br>' +
                   // '<strong> MESSAGGIO </strong> <br> <hr>' + '<strong> btnLkp: </strong>' + '%s' + 'non dichiarato!' + '<br> <br>' +
                   // '<strong> SUGGERIMENTO </strong> <br> <hr> Pulsante con nomenclatura non standard.' + '<br> <br>' +
                   // mm.MSG_CONTACT_SUPPORT;
                   //
                   // mm.MSG_BUGERROR_LOOKUP_BTN_QUERY     := '<h2>Preparazione ricerche non riuscita!</h2><br>' +
                   // '<strong>MESSAGGIO</strong><br><hr>' + '<strong>LkpQuery: </strong>' + '%s ' + 'non dichiarato!' + '<br><br>' +
                   // '<strong>TIP</strong><br><hr>Query con denominazione non standard %s' + '<br><br>' +
                   // mm.MSG_CONTACT_SUPPORT;
              end;
          lttr_TR : begin  // Italian
                   mm.MSG_INVALID_LOGIN                    := 'Geçersiz kullanıcı / şifre';
                   mm.MSG_INVALID_USER                     := 'Geçersiz kullanıcı / Kayıtlı değil';
                   mm.MSG_INVALID_EMAIL                    := 'Geçersiz e-posta / Kayıtlı değil';
                   mm.MSG_INVALID_PASSWORD                 := 'Geçersiz parola';
                   mm.MSG_UPLOAD_FAIL                      := 'Dosya yüklenemedi';
                   mm.MSG_BUGERROR_MENU_DO_NOT_EXIST       := '<strong>İPUCU</strong><br><hr>Belki bu seçenek henüz uygulanmamıştır.<br><br>' ;
                   mm.MSG_BUGERROR_REGISTER_IN_USE         := 'Kayıt düzenleme. İşlemi kaydedin veya iptal edin. ';
                   mm.MSG_BUGERROR_COM_SERVER_FAIL         := 'Veritabanı Sunucusu ile iletişim kurulamadı';
                   mm.MSG_BUGERROR_REGISTER_REQUEST        := 'Kayıt isteği başarısız oldu!';
                   mm.MSG_BUGERROR_REGISTER_CAN_NOT_DELETE := 'Kayıt Silme( ' + '%s' + ' )' + sLineBreak +
                                                              'Bu kayıtta hareket var( kod.' + '%s' + ' ) ' + sLineBreak +
                                                              'tabloda:' + mm.varC_LastErrorMsg + sLineBreak + sLineBreak +
                                                              'Hariç tutmaya izin verilmez.';
                   mm.MSG_BUGERROR_POST                    := 'Kayıt kaydedilemedi.';
                   mm.MSG_BUGERROR_INVALID_CONTENT         := 'Alanın içeriğini doğru girin!';
                   mm.MSG_BUGERROR_PK_SEQUENCE             := 'Sıralı oluşturulamadı';
                   mm.MSG_BUGERROR_CLOSE_QUERY             := 'Sorgu kapatılamadı';
                   mm.MSG_BUGERROR_OPEN_QUERY              := 'Sorgu açılamadı';
                   mm.MSG_BUGERROR_DEFAULT_SQL_STATMENT    := '<strong> %s </strong> için sql deyimi, devralınan formun oluşturulmasında tanımlanmadı.';
                   mm.MSG_BUGERROR_CONTENT_MUST_BE_NUMERIC := 'Arama içeriği sayısal olmalıdır';
                   mm.MSG_BUGERROR_INVALID_SEARCH_OPERATOR := 'Operatöre bu tip alan için izin verilmez.';
                   mm.MSG_BUGERROR_MAX_TAB_OPENED          := 'Maks. açık Sekme sayısı( %s ). Diğer(ler)i açmak için bir veya daha fazlasını kapatın!'; // v. 4.0.0.0
                   mm.MSG_BUGERROR_INCOMPATIBLE_SGBD       := '"%s" döndürme işlevi VTYS''niz ile uyumlu değil!';
                   mm.MSG_BUGERROR_FOREIGN_KEY_DELETE      := 'Yabancı anahtarın silinmesi.';
                   // mm.MSG_BUGERROR_LOOKUP_BTN           := '<h2> Arama Arama Düğmesi Başarısız! </h2> <br>' +
                   // '<strong> MESAJ </strong> <br> <hr>' + '<strong> btnLkp: </strong>' + '%s' + 'bildirilmedi!' + '<br> <br>' +
                   // '<strong> İPUCU </strong> <br> <hr> Standart olmayan terminolojiye sahip düğme.' + '<br> <br>' +
                   // mm.MSG_CONTACT_SUPPORT;
                   //
                   // mm.MSG_BUGERROR_LOOKUP_BTN_QUERY     := '<h2>LookUps Hazırlanamadı!</h2><br>' +
                   // '<strong>MESAJ</strong><br><hr>' + '<strong>LkpQuery: </strong>' + '%s ' + 'bildirilmedi!' + '<br><br>' +
                   // '<strong>İPUCU</strong><br><hr>Standart olmayan adlandırma %s ile sorgu' + '<br><br>' +
                   // mm.MSG_CONTACT_SUPPORT;
              end;
          ltru_RU : begin  // Russian
                   mm.MSG_INVALID_LOGIN                    := 'Неверный пользователь / пароль';
                   mm.MSG_INVALID_USER                     := 'Недействительный пользователь / Не зарегистрирован';
                   mm.MSG_INVALID_EMAIL                    := 'Неверный адрес электронной почты / Не зарегистрирован';
                   mm.MSG_INVALID_PASSWORD                 := 'Неверный пароль';
                   mm.MSG_UPLOAD_FAIL                      := 'Ошибка загрузки файла';
                   mm.MSG_BUGERROR_MENU_DO_NOT_EXIST       := '<strong> СОВЕТ </strong> <br> <hr> Возможно, опция еще не реализована. <br> <br>';
                   mm.MSG_BUGERROR_REGISTER_IN_USE         := 'Редактирование записи. Сохраните или отмените операцию. ';
                   mm.MSG_BUGERROR_COM_SERVER_FAIL         := 'Не удалось связаться с сервером базы данных';
                   mm.MSG_BUGERROR_REGISTER_REQUEST        := 'Ошибка запроса регистрации!';
                   mm.MSG_BUGERROR_REGISTER_CAN_NOT_DELETE := 'Удаление регистрации (' + '%s' + ')' + sLineBreak +
                                                              'Есть движение с этой записью (cod.' + '%s' + ')' + sLineBreak +
                                                              'в таблице:' + mm.varC_LastErrorMsg + sLineBreak + sLineBreak +
                                                              'Исключение не допускается.';
                   mm.MSG_BUGERROR_POST                    := 'Не удалось сохранить запись.';
                   mm.MSG_BUGERROR_INVALID_CONTENT         := 'Введите правильное содержимое поля!';
                   mm.MSG_BUGERROR_PK_SEQUENCE             := 'Не удалось создать последовательный';
                   mm.MSG_BUGERROR_CLOSE_QUERY             := 'Не удалось закрыть запрос';
                   mm.MSG_BUGERROR_OPEN_QUERY              := 'Не удалось открыть запрос';
                   mm.MSG_BUGERROR_DEFAULT_SQL_STATMENT    := 'Оператор sql для <strong>%s </strong> не был определен при создании унаследованной формы.';
                   mm.MSG_BUGERROR_CONTENT_MUST_BE_NUMERIC := 'Содержимое поиска должно быть числовым';
                   mm.MSG_BUGERROR_INVALID_SEARCH_OPERATOR := 'ОПЕРАТОР не разрешен для этого типа поля.';
                   mm.MSG_BUGERROR_MAX_TAB_OPENED          := 'Максимум. открытых вкладок (%s). Закройте один или несколько, чтобы открыть другие!'; // В. 4.0.0.0
                   mm.MSG_BUGERROR_INCOMPATIBLE_SGBD       := 'Функция возврата "%s" несовместима с вашей СУБД!';
                   mm.MSG_BUGERROR_FOREIGN_KEY_DELETE      := 'Удаление внешнего ключа.';
                   // mm.MSG_BUGERROR_LOOKUP_BTN           := '<h2> Сбой кнопки поиска по поиску! </h2> <br> '+
                   // '<strong> СООБЩЕНИЕ </strong> <br> <hr>' + '<strong> btnLkp: </strong>' + '% s' + 'не объявлено!' + '<br> <br>' +
                   // '<strong> СОВЕТ </strong> <br> <hr> Кнопка с нестандартной номенклатурой.' + '<br> <br>' +
                   // мм.MSG_CONTACT_SUPPORT;
                   //
                   // mm.MSG_BUGERROR_LOOKUP_BTN_QUERY     := '<h2> Не удалось подготовить поисковые запросы! </h2> <br>' +
                   // '<strong> СООБЩЕНИЕ </strong> <br> <hr>' + '<strong> LkpQuery: </strong>' + '% s' + 'не объявлено!' + '<br> <br>' +
                   // '<strong> СОВЕТ </strong> <br> <hr> Запрос с нестандартным наименованием% s' + '<br> <br>' +
                   // мм.MSG_CONTACT_SUPPORT;
              end;
       ltzn_CH : begin
                   mm.MSG_INVALID_LOGIN                    := 'Invalid user / password';
                   mm.MSG_INVALID_USER                     := 'Invalid user / Not registered';
                   mm.MSG_INVALID_EMAIL                    := 'Invalid email / Not registered';
                   mm.MSG_INVALID_PASSWORD                 := 'Invalid password';
                   mm.MSG_UPLOAD_FAIL                      := 'File upload failed';
                   mm.MSG_BUGERROR_MENU_DO_NOT_EXIST       := '<strong>TIP</strong><br><hr>Perhaps the option is not yet implemented.<br><br>' ;
                   mm.MSG_BUGERROR_REGISTER_IN_USE         := 'Editing record. Save or cancel the operation. ';
                   mm.MSG_BUGERROR_COM_SERVER_FAIL         := 'Failed to communicate with Database Server';
                   mm.MSG_BUGERROR_REGISTER_REQUEST        := 'Registration request failed!';
                   mm.MSG_BUGERROR_REGISTER_CAN_NOT_DELETE := 'Registration Deletion( ' + '%s' + ' )' + sLineBreak +
                                                              'There is movement with this record( cód.' + '%s' + ' ) ' + sLineBreak +
                                                              'in table: ' + mm.varC_LastErrorMsg + sLineBreak + sLineBreak +
                                                              'Exclusion is not allowed.';
                   mm.MSG_BUGERROR_POST                    := 'Failed to save the record.';
                   mm.MSG_BUGERROR_INVALID_CONTENT         := 'Enter the correct content of the field!';
                   mm.MSG_BUGERROR_PK_SEQUENCE             := 'Failed to generate sequential';
                   mm.MSG_BUGERROR_CLOSE_QUERY             := 'Failed to close query';
                   mm.MSG_BUGERROR_OPEN_QUERY              := 'Falha ao abrir query';
                   mm.MSG_BUGERROR_DEFAULT_SQL_STATMENT    := 'The sql statement for <strong> %s </strong> has not been defined in the on create of the inherited form.';
                   mm.MSG_BUGERROR_CONTENT_MUST_BE_NUMERIC := 'Search content must be numeric';
                   mm.MSG_BUGERROR_INVALID_SEARCH_OPERATOR := 'OPERATOR not allowed for this type of field.';
                   mm.MSG_BUGERROR_MAX_TAB_OPENED          := 'Max. of open Tabs( %s ). Close one or more to open another(s)!'; // v. 4.0.0.0
                   mm.MSG_BUGERROR_INCOMPATIBLE_SGBD       := 'Return function "%s" is incompatible with your DBMS!';
                   mm.MSG_BUGERROR_FOREIGN_KEY_DELETE      := 'Deletion of foreign key.';
//                   mm.MSG_BUGERROR_LOOKUP_BTN := '<h2> Search LookUp Button Failed! </h2> <br>' +
//                                                  '<strong> MESSAGE </strong> <br> <hr>' + '<strong> btnLkp: </strong>' + '%s' + 'not declared!' + '<br> <br>' +
//                                                  '<strong> TIP </strong> <br> <hr> Button with non-standard nomenclature.' + '<br> <br>' +
//                                                 mm.MSG_CONTACT_SUPPORT;
//
//                   mm.MSG_BUGERROR_LOOKUP_BTN_QUERY := '<h2>LookUps Preparation failed!</h2><br>' +
//                                                       '<strong>MESSAGE</strong><br><hr>' + '<strong>LkpQuery: </strong>' + '%s ' + 'not declared!' + '<br><br>' +
//                                                       '<strong>TIP</strong><br><hr>Query com nomenclatura fora do padrão %s' + '<br><br>' +
//                                                       mm.MSG_CONTACT_SUPPORT;

                 end;
       ltin_ID : begin
                   mm.MSG_INVALID_LOGIN                    := 'Invalid user / password';
                   mm.MSG_INVALID_USER                     := 'Invalid user / Not registered';
                   mm.MSG_INVALID_EMAIL                    := 'Invalid email / Not registered';
                   mm.MSG_INVALID_PASSWORD                 := 'Invalid password';
                   mm.MSG_UPLOAD_FAIL                      := 'File upload failed';
                   mm.MSG_BUGERROR_MENU_DO_NOT_EXIST       := '<strong>TIP</strong><br><hr>Perhaps the option is not yet implemented.<br><br>' ;
                   mm.MSG_BUGERROR_REGISTER_IN_USE         := 'Editing record. Save or cancel the operation. ';
                   mm.MSG_BUGERROR_COM_SERVER_FAIL         := 'Failed to communicate with Database Server';
                   mm.MSG_BUGERROR_REGISTER_REQUEST        := 'Registration request failed!';
                   mm.MSG_BUGERROR_REGISTER_CAN_NOT_DELETE := 'Registration Deletion( ' + '%s' + ' )' + sLineBreak +
                                                              'There is movement with this record( cód.' + '%s' + ' ) ' + sLineBreak +
                                                              'in table: ' + mm.varC_LastErrorMsg + sLineBreak + sLineBreak +
                                                              'Exclusion is not allowed.';
                   mm.MSG_BUGERROR_POST                    := 'Failed to save the record.';
                   mm.MSG_BUGERROR_INVALID_CONTENT         := 'Enter the correct content of the field!';
                   mm.MSG_BUGERROR_PK_SEQUENCE             := 'Failed to generate sequential';
                   mm.MSG_BUGERROR_CLOSE_QUERY             := 'Failed to close query';
                   mm.MSG_BUGERROR_OPEN_QUERY              := 'Falha ao abrir query';
                   mm.MSG_BUGERROR_DEFAULT_SQL_STATMENT    := 'The sql statement for <strong> %s </strong> has not been defined in the on create of the inherited form.';
                   mm.MSG_BUGERROR_CONTENT_MUST_BE_NUMERIC := 'Search content must be numeric';
                   mm.MSG_BUGERROR_INVALID_SEARCH_OPERATOR := 'OPERATOR not allowed for this type of field.';
                   mm.MSG_BUGERROR_MAX_TAB_OPENED          := 'Max. of open Tabs( %s ). Close one or more to open another(s)!'; // v. 4.0.0.0
                   mm.MSG_BUGERROR_INCOMPATIBLE_SGBD       := 'Return function "%s" is incompatible with your DBMS!';
                   mm.MSG_BUGERROR_FOREIGN_KEY_DELETE      := 'Deletion of foreign key.';
//                   mm.MSG_BUGERROR_LOOKUP_BTN := '<h2> Search LookUp Button Failed! </h2> <br>' +
//                                                  '<strong> MESSAGE </strong> <br> <hr>' + '<strong> btnLkp: </strong>' + '%s' + 'not declared!' + '<br> <br>' +
//                                                  '<strong> TIP </strong> <br> <hr> Button with non-standard nomenclature.' + '<br> <br>' +
//                                                 mm.MSG_CONTACT_SUPPORT;
//
//                   mm.MSG_BUGERROR_LOOKUP_BTN_QUERY := '<h2>LookUps Preparation failed!</h2><br>' +
//                                                       '<strong>MESSAGE</strong><br><hr>' + '<strong>LkpQuery: </strong>' + '%s ' + 'not declared!' + '<br><br>' +
//                                                       '<strong>TIP</strong><br><hr>Query com nomenclatura fora do padrão %s' + '<br><br>' +
//                                                       mm.MSG_CONTACT_SUPPORT;

                 end;
       ltth_TH : begin
                   mm.MSG_INVALID_LOGIN                    := 'Invalid user / password';
                   mm.MSG_INVALID_USER                     := 'Invalid user / Not registered';
                   mm.MSG_INVALID_EMAIL                    := 'Invalid email / Not registered';
                   mm.MSG_INVALID_PASSWORD                 := 'Invalid password';
                   mm.MSG_UPLOAD_FAIL                      := 'File upload failed';
                   mm.MSG_BUGERROR_MENU_DO_NOT_EXIST       := '<strong>TIP</strong><br><hr>Perhaps the option is not yet implemented.<br><br>' ;
                   mm.MSG_BUGERROR_REGISTER_IN_USE         := 'Editing record. Save or cancel the operation. ';
                   mm.MSG_BUGERROR_COM_SERVER_FAIL         := 'Failed to communicate with Database Server';
                   mm.MSG_BUGERROR_REGISTER_REQUEST        := 'Registration request failed!';
                   mm.MSG_BUGERROR_REGISTER_CAN_NOT_DELETE := 'Registration Deletion( ' + '%s' + ' )' + sLineBreak +
                                                              'There is movement with this record( cód.' + '%s' + ' ) ' + sLineBreak +
                                                              'in table: ' + mm.varC_LastErrorMsg + sLineBreak + sLineBreak +
                                                              'Exclusion is not allowed.';
                   mm.MSG_BUGERROR_POST                    := 'Failed to save the record.';
                   mm.MSG_BUGERROR_INVALID_CONTENT         := 'Enter the correct content of the field!';
                   mm.MSG_BUGERROR_PK_SEQUENCE             := 'Failed to generate sequential';
                   mm.MSG_BUGERROR_CLOSE_QUERY             := 'Failed to close query';
                   mm.MSG_BUGERROR_OPEN_QUERY              := 'Falha ao abrir query';
                   mm.MSG_BUGERROR_DEFAULT_SQL_STATMENT    := 'The sql statement for <strong> %s </strong> has not been defined in the on create of the inherited form.';
                   mm.MSG_BUGERROR_CONTENT_MUST_BE_NUMERIC := 'Search content must be numeric';
                   mm.MSG_BUGERROR_INVALID_SEARCH_OPERATOR := 'OPERATOR not allowed for this type of field.';
                   mm.MSG_BUGERROR_MAX_TAB_OPENED          := 'Max. of open Tabs( %s ). Close one or more to open another(s)!'; // v. 4.0.0.0
                   mm.MSG_BUGERROR_INCOMPATIBLE_SGBD       := 'Return function "%s" is incompatible with your DBMS!';
                   mm.MSG_BUGERROR_FOREIGN_KEY_DELETE      := 'Deletion of foreign key.';
//                   mm.MSG_BUGERROR_LOOKUP_BTN := '<h2> Search LookUp Button Failed! </h2> <br>' +
//                                                  '<strong> MESSAGE </strong> <br> <hr>' + '<strong> btnLkp: </strong>' + '%s' + 'not declared!' + '<br> <br>' +
//                                                  '<strong> TIP </strong> <br> <hr> Button with non-standard nomenclature.' + '<br> <br>' +
//                                                 mm.MSG_CONTACT_SUPPORT;
//
//                   mm.MSG_BUGERROR_LOOKUP_BTN_QUERY := '<h2>LookUps Preparation failed!</h2><br>' +
//                                                       '<strong>MESSAGE</strong><br><hr>' + '<strong>LkpQuery: </strong>' + '%s ' + 'not declared!' + '<br><br>' +
//                                                       '<strong>TIP</strong><br><hr>Query com nomenclatura fora do padrão %s' + '<br><br>' +
//                                                       mm.MSG_CONTACT_SUPPORT;

                 end;
       lthi_IN : begin
                   mm.MSG_INVALID_LOGIN                    := 'Invalid user / password';
                   mm.MSG_INVALID_USER                     := 'Invalid user / Not registered';
                   mm.MSG_INVALID_EMAIL                    := 'Invalid email / Not registered';
                   mm.MSG_INVALID_PASSWORD                 := 'Invalid password';
                   mm.MSG_UPLOAD_FAIL                      := 'File upload failed';
                   mm.MSG_BUGERROR_MENU_DO_NOT_EXIST       := '<strong>TIP</strong><br><hr>Perhaps the option is not yet implemented.<br><br>' ;
                   mm.MSG_BUGERROR_REGISTER_IN_USE         := 'Editing record. Save or cancel the operation. ';
                   mm.MSG_BUGERROR_COM_SERVER_FAIL         := 'Failed to communicate with Database Server';
                   mm.MSG_BUGERROR_REGISTER_REQUEST        := 'Registration request failed!';
                   mm.MSG_BUGERROR_REGISTER_CAN_NOT_DELETE := 'Registration Deletion( ' + '%s' + ' )' + sLineBreak +
                                                              'There is movement with this record( cód.' + '%s' + ' ) ' + sLineBreak +
                                                              'in table: ' + mm.varC_LastErrorMsg + sLineBreak + sLineBreak +
                                                              'Exclusion is not allowed.';
                   mm.MSG_BUGERROR_POST                    := 'Failed to save the record.';
                   mm.MSG_BUGERROR_INVALID_CONTENT         := 'Enter the correct content of the field!';
                   mm.MSG_BUGERROR_PK_SEQUENCE             := 'Failed to generate sequential';
                   mm.MSG_BUGERROR_CLOSE_QUERY             := 'Failed to close query';
                   mm.MSG_BUGERROR_OPEN_QUERY              := 'Falha ao abrir query';
                   mm.MSG_BUGERROR_DEFAULT_SQL_STATMENT    := 'The sql statement for <strong> %s </strong> has not been defined in the on create of the inherited form.';
                   mm.MSG_BUGERROR_CONTENT_MUST_BE_NUMERIC := 'Search content must be numeric';
                   mm.MSG_BUGERROR_INVALID_SEARCH_OPERATOR := 'OPERATOR not allowed for this type of field.';
                   mm.MSG_BUGERROR_MAX_TAB_OPENED          := 'Max. of open Tabs( %s ). Close one or more to open another(s)!'; // v. 4.0.0.0
                   mm.MSG_BUGERROR_INCOMPATIBLE_SGBD       := 'Return function "%s" is incompatible with your DBMS!';
                   mm.MSG_BUGERROR_FOREIGN_KEY_DELETE      := 'Deletion of foreign key.';
//                   mm.MSG_BUGERROR_LOOKUP_BTN := '<h2> Search LookUp Button Failed! </h2> <br>' +
//                                                  '<strong> MESSAGE </strong> <br> <hr>' + '<strong> btnLkp: </strong>' + '%s' + 'not declared!' + '<br> <br>' +
//                                                  '<strong> TIP </strong> <br> <hr> Button with non-standard nomenclature.' + '<br> <br>' +
//                                                 mm.MSG_CONTACT_SUPPORT;
//
//                   mm.MSG_BUGERROR_LOOKUP_BTN_QUERY := '<h2>LookUps Preparation failed!</h2><br>' +
//                                                       '<strong>MESSAGE</strong><br><hr>' + '<strong>LkpQuery: </strong>' + '%s ' + 'not declared!' + '<br><br>' +
//                                                       '<strong>TIP</strong><br><hr>Query com nomenclatura fora do padrão %s' + '<br><br>' +
//                                                       mm.MSG_CONTACT_SUPPORT;

                 end;
       ltar_SA    : begin
                   mm.MSG_INVALID_LOGIN                    := 'اسم مستخدم او كلمة مرور خاطئة';
                   mm.MSG_INVALID_USER                     := 'مستخدم غير صالح / غير مسجل';
                   mm.MSG_INVALID_EMAIL                    := 'بريد إلكتروني غير صحيح / غير مسجل';
                   mm.MSG_INVALID_PASSWORD                 := 'كلمة المرور غير صحيحة';
                   mm.MSG_UPLOAD_FAIL                      := 'فشل تحميل الملف';
                   mm.MSG_BUGERROR_MENU_DO_NOT_EXIST       := '<br><hr>ربما لم يتم تنفيذ الخيار بعد.<br><br><strong>نصيحة</strong>' ;
                   mm.MSG_BUGERROR_REGISTER_IN_USE         := 'تحرير السجل. حفظ أو إلغاء العملية. ';
                   mm.MSG_BUGERROR_COM_SERVER_FAIL         := 'فشل في الاتصال بخادم قاعدة البيانات';
                   mm.MSG_BUGERROR_REGISTER_REQUEST        := 'فشل في طلب التسجيل!';
                   mm.MSG_BUGERROR_REGISTER_CAN_NOT_DELETE := 'حذف التسجيل( ' + '%s' + ' )' + sLineBreak +
                                                              'هناك حركة مع هذا السجل( cód.' + '%s' + ' ) ' + sLineBreak +
                                                              'في الجدول: ' + mm.varC_LastErrorMsg + sLineBreak + sLineBreak +
                                                              'الاستبعاد غير مسموح به.';
                   mm.MSG_BUGERROR_POST                    := 'فشل في حفظ السجل.';
                   mm.MSG_BUGERROR_INVALID_CONTENT         := 'أدخل المحتوى الصحيح للمجال!';
                   mm.MSG_BUGERROR_PK_SEQUENCE             := 'فشل إنشاء تسلسلي';
                   mm.MSG_BUGERROR_CLOSE_QUERY             := 'فشل في إغلاق الاستعلام';
                   mm.MSG_BUGERROR_OPEN_QUERY              := 'فشل في فتح الاستعلام';
                   mm.MSG_BUGERROR_DEFAULT_SQL_STATMENT    := 'لم يتم تعريفه في عند إنشاء النموذج الموروث. <strong> %s </strong> بيان SQL لـ';
                   mm.MSG_BUGERROR_CONTENT_MUST_BE_NUMERIC := 'يجب أن يكون محتوى البحث رقمي';
                   mm.MSG_BUGERROR_INVALID_SEARCH_OPERATOR := 'المشغل غير مسموح به لهذا النوع من المجال.';
                   mm.MSG_BUGERROR_MAX_TAB_OPENED          := 'Max. of open Tabs( %s ). Close one or more to open others!'; // v. 4.0.0.0
                   mm.MSG_BUGERROR_INCOMPATIBLE_SGBD       := 'غير متوافق مع نظام إدارة قواعد البيانات (DBMS) الخاص بك! "%s" إرجاع المهمة';
                   mm.MSG_BUGERROR_FOREIGN_KEY_DELETE      := 'حذف المفتاح الخارجي.';
//                   mm.MSG_BUGERROR_LOOKUP_BTN := '<h2> Search LookUp Button Failed! </h2> <br>' +
//                                                  '<strong> MESSAGE </strong> <br> <hr>' + '<strong> btnLkp: </strong>' + '%s' + 'not declared!' + '<br> <br>' +
//                                                  '<strong> TIP </strong> <br> <hr> Button with non-standard nomenclature.' + '<br> <br>' +
//                                                 mm.MSG_CONTACT_SUPPORT;
//
//                   mm.MSG_BUGERROR_LOOKUP_BTN_QUERY := '<h2>LookUps Preparation failed!</h2><br>' +
//                                                       '<strong>MESSAGE</strong><br><hr>' + '<strong>LkpQuery: </strong>' + '%s ' + 'not declared!' + '<br><br>' +
//                                                       '<strong>TIP</strong><br><hr>Query com nomenclatura fora do padrão %s' + '<br><br>' +
//                                                       mm.MSG_CONTACT_SUPPORT;

                 end;

     end;

     // ALERT / WORDS / MESSAGES TYPES
     case mm.varLT_Lang of
          ltpt_BR : begin
                mm.VALUE_YES    := 'S';
                mm.VALUE_NO     := 'N';

                mm.MSG_INFO     := 'Aviso';
                mm.MSG_WARNING  := 'Atenção';
                mm.MSG_DANGER   := 'Cuidado';
                mm.MSG_SUCCESS  := 'Sucesso';
                mm.MSG_ERROR    := 'Erro';
                mm.MSG_YES      := 'Sim';
                mm.MSG_NO       := 'Não';
                mm.MSG_RESTART     := 'Reiniciar';  // v. 3.2.0.5
                mm.MSG_OPEN_TICKET := 'Suporte';    // v. 3.2.0.5
                mm.MSG_CANCEL   := 'Cancelar';
                mm.MSG_CONTINUE := 'Continuar';

                mm.MSG_OK       := 'Ok';
                mm.MSG_CONFIRM  := 'Confirmação';
                mm.MSG_INVALID  := 'Inválido(a)';
                mm.MSG_DATETYPE := 'Data';
                mm.MSG_WELCOME  := 'Bem Vindo ';
                mm.MSG_DELETE   := 'Exclusão';

                mm.MSG_DATE_INTERVALS_TODAY            := 'Hoje';
                mm.MSG_DATE_INTERVALS_YESTERDAY        := 'Ontem';
                mm.MSG_DATE_INTERVALS_BEFORE_YESTERDAY := 'Antes de Ontem';
                mm.MSG_DATE_INTERVALS_TOMORROW         := 'Amanhã';
                mm.MSG_DATE_INTERVALS_AFTER_TOMORROW   := 'Depois de Amanhã';
                mm.MSG_DATE_INTERVALS_THIS_WEEK        := 'Essa Semana';
                mm.MSG_DATE_INTERVALS_LAST_WEEK        := 'Semana Passada';
                mm.MSG_DATE_INTERVALS_NEXT_WEEK        := 'Próxima Semana' ;
                mm.MSG_DATE_INTERVALS_THIS_FORTNIGHT   := 'Essa Quinzena';
                mm.MSG_DATE_INTERVALS_LAST_FORTNIGHT   := 'Quinzena Passada';
                mm.MSG_DATE_INTERVALS_NEXT_FORTNIGHT   := 'Próxima Quinzena';
                mm.MSG_DATE_INTERVALS_THIS_MONTH       := 'Esse Mês';
                mm.MSG_DATE_INTERVALS_LAST_MONTH       := 'Mês Passado';
                mm.MSG_DATE_INTERVALS_NEXT_MONTH       := 'Próximo Mês';
                mm.MSG_DATE_INTERVALS_THIS_BIMESTER    := 'Nesse Bimestre';
                mm.MSG_DATE_INTERVALS_THIS_QUARTER     := 'Nesse Trimestre';
                mm.MSG_DATE_INTERVALS_THIS_SEMESTER    := 'Nesse Semestre';
                mm.MSG_DATE_INTERVALS_THIS_YEAR        := 'Nesse Ano';
                mm.MSG_DATE_INTERVALS_LAST_YEAR        := 'Ano Passado';
                mm.MSG_DATE_INTERVALS_ALL              := 'Processar Tudo';
                mm.MSG_DATE_INTERVALS_ALL_UNTIL_TODAY  := 'Processar Tudo: Até Hoje';

                mm.ARRAY_MONTH_NAMES[01]               := 'Janeiro';
                mm.ARRAY_MONTH_NAMES[02]               := 'Fevereiro';
                mm.ARRAY_MONTH_NAMES[03]               := 'Março';
                mm.ARRAY_MONTH_NAMES[04]               := 'Abril' ;
                mm.ARRAY_MONTH_NAMES[05]               := 'Maio';
                mm.ARRAY_MONTH_NAMES[06]               := 'Junho' ;
                mm.ARRAY_MONTH_NAMES[07]               := 'Julho';
                mm.ARRAY_MONTH_NAMES[08]               := 'Agosto' ;
                mm.ARRAY_MONTH_NAMES[09]               := 'Setembro';
                mm.ARRAY_MONTH_NAMES[10]               := 'Outubro' ;
                mm.ARRAY_MONTH_NAMES[11]               := 'Novembro' ;
                mm.ARRAY_MONTH_NAMES[12]               := 'Dezembro' ;
                mm.ARRAY_WEEKEND_NAMES[01]             := 'Domingo';
                mm.ARRAY_WEEKEND_NAMES[02]             := 'Segunda-feira' ;
                mm.ARRAY_WEEKEND_NAMES[03]             := 'Terça-feira' ;
                mm.ARRAY_WEEKEND_NAMES[04]             := 'Quarta-feira';
                mm.ARRAY_WEEKEND_NAMES[05]             := 'Quinta-feira';
                mm.ARRAY_WEEKEND_NAMES[06]             := 'Sexta-feira';
                mm.ARRAY_WEEKEND_NAMES[07]             := 'Sábado' ;

                mm.MSG_ACCESS_TO         := 'a ';
                mm.MSG_ACCESS_INSERT_TO  := 'a CADASTRO de ';
                mm.MSG_ACCESS_EDIT_TO    := 'a ALTERAÇÃO de ';
                mm.MSG_ACCESS_DELETE_TO  := 'a EXCLUSÃO de ';
                mm.MSG_ACCESS_SEARCH_TO  := 'a PESQUISA de ';
                mm.MSG_ACCESS_MOVE_TO    := 'a MOVIMENTAR ';

              end;
          lten_US, lten_GB: begin
                     mm.VALUE_YES    := 'Y';
                     mm.VALUE_NO     := 'N';

                     mm.MSG_INFO     := 'Info';
                     mm.MSG_WARNING  := 'Alert';
                     mm.MSG_DANGER   := 'Caution';
                     mm.MSG_SUCCESS  := 'Success';
                     mm.MSG_ERROR    := 'Error';
                     mm.MSG_YES      := 'Yes';
                     mm.MSG_NO       := 'No';
                     mm.MSG_RESTART     := 'Restart';  // v. 3.2.0.5
                     mm.MSG_OPEN_TICKET := 'Support';    // v. 3.2.0.5
                     mm.MSG_CANCEL   := 'Cancel';
                     mm.MSG_CONTINUE := 'Continue';
                     mm.MSG_OK       := 'Ok';
                     mm.MSG_CONFIRM  := 'Confirm';
                     mm.MSG_INVALID  := 'Invalid';
                     mm.MSG_DATETYPE := 'Date';
                     mm.MSG_WELCOME  := 'Welcome ';
                     mm.MSG_DELETE   := 'Delete';

                     mm.MSG_DATE_INTERVALS_TODAY            := 'Today';
                     mm.MSG_DATE_INTERVALS_YESTERDAY        := 'Yesterday';
                     mm.MSG_DATE_INTERVALS_BEFORE_YESTERDAY := 'Before Yesterday';
                     mm.MSG_DATE_INTERVALS_TOMORROW         := 'Tomorrow';
                     mm.MSG_DATE_INTERVALS_AFTER_TOMORROW   := 'After Tomorrow';
                     mm.MSG_DATE_INTERVALS_THIS_WEEK        := 'This Week';
                     mm.MSG_DATE_INTERVALS_LAST_WEEK        := 'Last week';
                     mm.MSG_DATE_INTERVALS_NEXT_WEEK        := 'Next Week';
                     mm.MSG_DATE_INTERVALS_THIS_FORTNIGHT   := 'This Fortnight';
                     mm.MSG_DATE_INTERVALS_LAST_FORTNIGHT   := 'Fortnight Past';
                     mm.MSG_DATE_INTERVALS_NEXT_FORTNIGHT   := 'Next Fortnight';
                     mm.MSG_DATE_INTERVALS_THIS_MONTH       := 'This Month';
                     mm.MSG_DATE_INTERVALS_LAST_MONTH       := 'Last Month';
                     mm.MSG_DATE_INTERVALS_NEXT_MONTH       := 'Next Month';
                     mm.MSG_DATE_INTERVALS_THIS_BIMESTER    := 'In this Bimester';
                     mm.MSG_DATE_INTERVALS_THIS_QUARTER     := 'This Quarter';
                     mm.MSG_DATE_INTERVALS_THIS_SEMESTER    := 'In this Semester';
                     mm.MSG_DATE_INTERVALS_THIS_YEAR        := 'This Year';
                     mm.MSG_DATE_INTERVALS_LAST_YEAR        := 'Last year';
                     mm.MSG_DATE_INTERVALS_ALL              := 'Process All';
                     mm.MSG_DATE_INTERVALS_ALL_UNTIL_TODAY  := 'Process All: Until Today';

                     mm.ARRAY_MONTH_NAMES[01]   := 'January';
                     mm.ARRAY_MONTH_NAMES[02]   := 'February';
                     mm.ARRAY_MONTH_NAMES[03]   := 'March';
                     mm.ARRAY_MONTH_NAMES[04]   := 'April' ;
                     mm.ARRAY_MONTH_NAMES[05]   := 'May';
                     mm.ARRAY_MONTH_NAMES[06]   := 'June' ;
                     mm.ARRAY_MONTH_NAMES[07]   := 'July';
                     mm.ARRAY_MONTH_NAMES[08]   := 'August' ;
                     mm.ARRAY_MONTH_NAMES[09]   := 'September';
                     mm.ARRAY_MONTH_NAMES[10]   := 'October' ;
                     mm.ARRAY_MONTH_NAMES[11]   := 'November' ;
                     mm.ARRAY_MONTH_NAMES[12]   := 'December' ;
                     mm.ARRAY_WEEKEND_NAMES[01] := 'Sunday';
                     mm.ARRAY_WEEKEND_NAMES[02] := 'Monday' ;
                     mm.ARRAY_WEEKEND_NAMES[03] := 'Tuesday' ;
                     mm.ARRAY_WEEKEND_NAMES[04] := 'Wednesday';
                     mm.ARRAY_WEEKEND_NAMES[05] := 'Thursday';
                     mm.ARRAY_WEEKEND_NAMES[06] := 'Friday';
                     mm.ARRAY_WEEKEND_NAMES[07] := 'Saturday' ;

                     mm.MSG_ACCESS_TO         := 'to ';
                     mm.MSG_ACCESS_INSERT_TO  := 'to INSERT ';
                     mm.MSG_ACCESS_EDIT_TO    := 'to EDIT ';
                     mm.MSG_ACCESS_DELETE_TO  := 'to DELETE ';
                     mm.MSG_ACCESS_SEARCH_TO  := 'to SEARCH ';
                     mm.MSG_ACCESS_MOVE_TO    := 'to MOVE ';

                   end;
          ltes_ES: begin

                mm.VALUE_YES    := 'S';
                mm.VALUE_NO     := 'N';

                mm.MSG_INFO     := 'Advertencia';
                mm.MSG_WARNING  := 'Atención';
                mm.MSG_DANGER   := 'Precaución';
                mm.MSG_SUCCESS  := 'Éxito';
                mm.MSG_ERROR    := 'Error';
                mm.MSG_YES      := 'Sí';
                mm.MSG_NO       := 'No';
                mm.MSG_RESTART     := 'Restart';  // v. 3.2.0.5
                mm.MSG_OPEN_TICKET := 'Soporte';    // v. 3.2.0.5
                mm.MSG_CANCEL   := 'Cancelar';
                mm.MSG_CONTINUE := 'Continuar';
                mm.MSG_OK       := 'Ok';
                mm.MSG_CONFIRM  := 'Confirmación';
                mm.MSG_INVALID  := 'Inválido(a)';
                mm.MSG_DATETYPE := 'Fecha';
                mm.MSG_WELCOME  := 'Bien Venido ';
                mm.MSG_DELETE   := 'Exclusión';

                mm.MSG_DATE_INTERVALS_TODAY            := 'Hoy';
                mm.MSG_DATE_INTERVALS_YESTERDAY        := 'Ayer';
                mm.MSG_DATE_INTERVALS_BEFORE_YESTERDAY := 'Antes de ayer';
                mm.MSG_DATE_INTERVALS_TOMORROW         := 'Mañana';
                mm.MSG_DATE_INTERVALS_AFTER_TOMORROW   := 'Después de mañana';
                mm.MSG_DATE_INTERVALS_THIS_WEEK        := 'Esta semana';
                mm.MSG_DATE_INTERVALS_LAST_WEEK        := 'La semana pasada';
                mm.MSG_DATE_INTERVALS_NEXT_WEEK        := 'La próxima semana';
                mm.MSG_DATE_INTERVALS_THIS_FORTNIGHT   := 'Esta Quincena';
                mm.MSG_DATE_INTERVALS_LAST_FORTNIGHT   := 'Quincena pasada';
                mm.MSG_DATE_INTERVALS_NEXT_FORTNIGHT   := 'Próxima quincena';
                mm.MSG_DATE_INTERVALS_THIS_MONTH       := 'Este mes';
                mm.MSG_DATE_INTERVALS_LAST_MONTH       := 'Mes pasado';
                mm.MSG_DATE_INTERVALS_NEXT_MONTH       := 'Mes siguiente';
                mm.MSG_DATE_INTERVALS_THIS_BIMESTER    := 'En este Bimestre';
                mm.MSG_DATE_INTERVALS_THIS_QUARTER     := 'Este trimestre';
                mm.MSG_DATE_INTERVALS_THIS_SEMESTER    := 'En este semestre';
                mm.MSG_DATE_INTERVALS_THIS_YEAR        := 'Este año';
                mm.MSG_DATE_INTERVALS_LAST_YEAR        := 'Año pasado';
                mm.MSG_DATE_INTERVALS_ALL              := 'Procesar todo';
                mm.MSG_DATE_INTERVALS_ALL_UNTIL_TODAY  := 'Procesar todo: hasta hoy';

                mm.ARRAY_MONTH_NAMES [01]   := 'Enero';
                mm.ARRAY_MONTH_NAMES [02]   := 'Febrero';
                mm.ARRAY_MONTH_NAMES [03]   := 'Marzo';
                mm.ARRAY_MONTH_NAMES [04]   := 'Abril';
                mm.ARRAY_MONTH_NAMES [05]   := 'Mayo';
                mm.ARRAY_MONTH_NAMES [06]   := 'Junio';
                mm.ARRAY_MONTH_NAMES [07]   := 'Julio';
                mm.ARRAY_MONTH_NAMES [08]   := 'Agosto';
                mm.ARRAY_MONTH_NAMES [09]   := 'Septiembre';
                mm.ARRAY_MONTH_NAMES [10]   := 'Octubre';
                mm.ARRAY_MONTH_NAMES [11]   := 'Noviembre';
                mm.ARRAY_MONTH_NAMES [12]   := 'Diciembre';
                mm.ARRAY_WEEKEND_NAMES [01] := 'Domingo';
                mm.ARRAY_WEEKEND_NAMES [02] := 'Lunes';
                mm.ARRAY_WEEKEND_NAMES [03] := 'Martes';
                mm.ARRAY_WEEKEND_NAMES [04] := 'Miércoles';
                mm.ARRAY_WEEKEND_NAMES [05] := 'Jueves';
                mm.ARRAY_WEEKEND_NAMES [06] := 'Viernes';
                mm.ARRAY_WEEKEND_NAMES [07] := 'Sábado';

                mm.MSG_ACCESS_TO        := 'la ';
                mm.MSG_ACCESS_INSERT_TO := 'el REGISTRO de';
                mm.MSG_ACCESS_EDIT_TO   := 'el CAMBIO de';
                mm.MSG_ACCESS_DELETE_TO := 'la EXCLUSIÓN de';
                mm.MSG_ACCESS_SEARCH_TO := 'la BÚSQUEDA de';
                mm.MSG_ACCESS_MOVE_TO   := 'para MOVERSE ';

              end;
        ltfr_FR: begin
                mm.VALUE_YES                           := 'O';
                mm.VALUE_NO                            := 'N';

                mm.MSG_INFO                            := 'Info';
                mm.MSG_WARNING                         := 'Alerte';
                mm.MSG_DANGER                          := 'Attention';
                mm.MSG_SUCCESS                         := 'Succès';
                mm.MSG_ERROR                           := 'Erreur';
                mm.MSG_YES                             := 'Oui';
                mm.MSG_NO                              := 'Non';
                mm.MSG_RESTART                         := 'Redémarrage';  // v. 3.2.0.5
                mm.MSG_OPEN_TICKET                     := 'Soutien';    // v. 3.2.0.5
                mm.MSG_CANCEL                          := 'Annuler';
                mm.MSG_CONTINUE                        := 'Continuer';
                mm.MSG_OK                              := 'Ok';
                mm.MSG_CONFIRM                         := 'Confirmer';
                mm.MSG_INVALID                         := 'Invalide';
                mm.MSG_DATETYPE                        := 'Date';
                mm.MSG_WELCOME                         := 'Bienvenue';
                mm.MSG_DELETE                          := 'Supprimer';

                mm.MSG_DATE_INTERVALS_TODAY            := 'Aujourd''hui';
                mm.MSG_DATE_INTERVALS_YESTERDAY        := 'Hier';
                mm.MSG_DATE_INTERVALS_BEFORE_YESTERDAY := 'Avant hier';
                mm.MSG_DATE_INTERVALS_TOMORROW         := 'Demain';
                mm.MSG_DATE_INTERVALS_AFTER_TOMORROW   := 'Après demain';
                mm.MSG_DATE_INTERVALS_THIS_WEEK        := 'Cette semaine';
                mm.MSG_DATE_INTERVALS_LAST_WEEK        := 'La semaine dernière';
                mm.MSG_DATE_INTERVALS_NEXT_WEEK        := 'La semaine prochaine';
                mm.MSG_DATE_INTERVALS_THIS_FORTNIGHT   := 'Cette quinzaine';
                mm.MSG_DATE_INTERVALS_LAST_FORTNIGHT   := 'Quinzaine passée';
                mm.MSG_DATE_INTERVALS_NEXT_FORTNIGHT   := 'Prochaine quinzaine';
                mm.MSG_DATE_INTERVALS_THIS_MONTH       := 'Ce mois';
                mm.MSG_DATE_INTERVALS_LAST_MONTH       := 'Le mois dernier';
                mm.MSG_DATE_INTERVALS_NEXT_MONTH       := 'Mois prochain';
                mm.MSG_DATE_INTERVALS_THIS_BIMESTER    := 'Dans ce Bimester';
                mm.MSG_DATE_INTERVALS_THIS_QUARTER     := 'Ce trimestre';
                mm.MSG_DATE_INTERVALS_THIS_SEMESTER    := 'Dans ce semestre';
                mm.MSG_DATE_INTERVALS_THIS_YEAR        := 'Cette année';
                mm.MSG_DATE_INTERVALS_LAST_YEAR        := 'L''année dernière';
                mm.MSG_DATE_INTERVALS_ALL              := 'Traiter tout';
                mm.MSG_DATE_INTERVALS_ALL_UNTIL_TODAY  := 'Traiter tout : jusqu''à aujourd''hui';

                mm.ARRAY_MONTH_NAMES[01]   := 'Janvier';
                mm.ARRAY_MONTH_NAMES[02]   := 'Février';
                mm.ARRAY_MONTH_NAMES[03]   := 'Mars';
                mm.ARRAY_MONTH_NAMES[04]   := 'Avril' ;
                mm.ARRAY_MONTH_NAMES[05]   := 'Mai';
                mm.ARRAY_MONTH_NAMES[06]   := 'Juin' ;
                mm.ARRAY_MONTH_NAMES[07]   := 'Juillet';
                mm.ARRAY_MONTH_NAMES[08]   := 'Août' ;
                mm.ARRAY_MONTH_NAMES[09]   := 'Septembre';
                mm.ARRAY_MONTH_NAMES[10]   := 'Octobre' ;
                mm.ARRAY_MONTH_NAMES[11]   := 'Novembre' ;
                mm.ARRAY_MONTH_NAMES[12]   := 'Décembre' ;
                mm.ARRAY_WEEKEND_NAMES[01] := 'Dimanche';
                mm.ARRAY_WEEKEND_NAMES[02] := 'Lundi' ;
                mm.ARRAY_WEEKEND_NAMES[03] := 'Mardi' ;
                mm.ARRAY_WEEKEND_NAMES[04] := 'Mercredi';
                mm.ARRAY_WEEKEND_NAMES[05] := 'Jeudi';
                mm.ARRAY_WEEKEND_NAMES[06] := 'Vendredi';
                mm.ARRAY_WEEKEND_NAMES[07] := 'Samedi' ;

                mm.MSG_ACCESS_TO        := 'un ';
                mm.MSG_ACCESS_INSERT_TO := 'à l''ENREGISTREMENT de ';
                mm.MSG_ACCESS_EDIT_TO   := 'le CHANGEMENT de ';
                mm.MSG_ACCESS_DELETE_TO := 'SUPPRIMER de ';
                mm.MSG_ACCESS_SEARCH_TO := 'RECHERCHE pour ';
                mm.MSG_ACCESS_MOVE_TO   := 'MOVE';

            end;
        ltde_DE: begin
                mm.VALUE_YES                           := 'J';
                mm.VALUE_NO                            := 'N';

                mm.MSG_INFO                            := 'Info';
                mm.MSG_WARNING                         := 'Warnung';
                mm.MSG_DANGER                          := 'Vorsicht';
                mm.MSG_SUCCESS                         := 'Erfolg';
                mm.MSG_ERROR                           := 'Fehler';
                mm.MSG_YES                             := 'Ja';
                mm.MSG_NO                              := 'Nein';
                mm.MSG_RESTART                         := 'Neu starten';  // v. 3.2.0.5
                mm.MSG_OPEN_TICKET                     := 'Unterstützung';    // v. 3.2.0.5
                mm.MSG_CANCEL                          := 'Abbrechen';
                mm.MSG_CONTINUE                        := 'Weiter';
                mm.MSG_OK                              := 'Ok';
                mm.MSG_CONFIRM                         := 'Bestätigen';
                mm.MSG_INVALID                         := 'Ungültig';
                mm.MSG_DATETYPE                        := 'Datum';
                mm.MSG_WELCOME                         := 'Willkommen';
                mm.MSG_DELETE                          := 'Löschen';

                mm.MSG_DATE_INTERVALS_TODAY            := 'Heute';
                mm.MSG_DATE_INTERVALS_YESTERDAY        := 'Gestern';
                mm.MSG_DATE_INTERVALS_BEFORE_YESTERDAY := 'Vorgestern'; // v. 3.3.0.2( thanks Alexander Hofmann from germany )
                mm.MSG_DATE_INTERVALS_TOMORROW         := 'Morgen';
                mm.MSG_DATE_INTERVALS_AFTER_TOMORROW   := 'Übermorgen'; // v. 3.3.0.2( thanks Alexander Hofmann from germany )
                mm.MSG_DATE_INTERVALS_THIS_WEEK        := 'Diese Woche';
                mm.MSG_DATE_INTERVALS_LAST_WEEK        := 'Letzte Woche';
                mm.MSG_DATE_INTERVALS_NEXT_WEEK        := 'Nächste Woche';
                mm.MSG_DATE_INTERVALS_THIS_FORTNIGHT   := 'Diese 14 Tage';
                mm.MSG_DATE_INTERVALS_LAST_FORTNIGHT   := 'Vergangene vierzehn Tage';
                mm.MSG_DATE_INTERVALS_NEXT_FORTNIGHT   := 'Nächste 14 Tage';
                mm.MSG_DATE_INTERVALS_THIS_MONTH       := 'Diesen Monat';
                mm.MSG_DATE_INTERVALS_LAST_MONTH       := 'Letzter Monat';
                mm.MSG_DATE_INTERVALS_NEXT_MONTH       := 'Nächster Monat';
                mm.MSG_DATE_INTERVALS_THIS_BIMESTER    := 'In diesem Bimester';
                mm.MSG_DATE_INTERVALS_THIS_QUARTER     := 'Dieses Quartal';
                mm.MSG_DATE_INTERVALS_THIS_SEMESTER    := 'In diesem Semester';
                mm.MSG_DATE_INTERVALS_THIS_YEAR        := 'Dieses Jahr';
                mm.MSG_DATE_INTERVALS_LAST_YEAR        := 'Letztes Jahr';
                mm.MSG_DATE_INTERVALS_ALL              := 'Alle verarbeiten';
                mm.MSG_DATE_INTERVALS_ALL_UNTIL_TODAY  := 'Alle verarbeiten: Bis heute';

                mm.ARRAY_MONTH_NAMES[01]   := 'Januar';
                mm.ARRAY_MONTH_NAMES[02]   := 'Februar';
                mm.ARRAY_MONTH_NAMES[03]   := 'März';
                mm.ARRAY_MONTH_NAMES[04]   := 'April' ;
                mm.ARRAY_MONTH_NAMES[05]   := 'Mai';
                mm.ARRAY_MONTH_NAMES[06]   := 'Juni' ;
                mm.ARRAY_MONTH_NAMES[07]   := 'Juli';
                mm.ARRAY_MONTH_NAMES[08]   := 'August' ;
                mm.ARRAY_MONTH_NAMES[09]   := 'September';
                mm.ARRAY_MONTH_NAMES[10]   := 'Oktober' ;
                mm.ARRAY_MONTH_NAMES[11]   := 'November' ;
                mm.ARRAY_MONTH_NAMES[12]   := 'Dezember' ;
                mm.ARRAY_WEEKEND_NAMES[01] := 'Sonntag';
                mm.ARRAY_WEEKEND_NAMES[02] := 'Montag' ;
                mm.ARRAY_WEEKEND_NAMES[03] := 'Dienstag' ;
                mm.ARRAY_WEEKEND_NAMES[04] := 'Mittwoch';
                mm.ARRAY_WEEKEND_NAMES[05] := 'Donnerstag';
                mm.ARRAY_WEEKEND_NAMES[06] := 'Freitag';
                mm.ARRAY_WEEKEND_NAMES[07] := 'Samstag' ;

                mm.MSG_ACCESS_TO        := 'a';
                mm.MSG_ACCESS_INSERT_TO := 'zur REGISTRIERUNG von ';
                mm.MSG_ACCESS_EDIT_TO   := 'die ÄNDERUNG von ';
                mm.MSG_ACCESS_DELETE_TO := 'LÖSCHEN von ';
                mm.MSG_ACCESS_SEARCH_TO := 'SUCHE nach ';
                mm.MSG_ACCESS_MOVE_TO   := 'BEWEGEN';

            end;
        ltit_IT: begin
                mm.VALUE_YES                           := 'S';
                mm.VALUE_NO                            := 'N';

                mm.MSG_INFO                            := 'Informazioni';
                mm.MSG_WARNING                         := 'Avviso';
                mm.MSG_DANGER                          := 'Attenzione';
                mm.MSG_SUCCESS                         := 'Successo';
                mm.MSG_ERROR                           := 'Errore';
                mm.MSG_YES                             := 'Sì';
                mm.MSG_NO                              := 'No';
                mm.MSG_RESTART                         := 'Ricomincia';  // v. 3.2.0.5
                mm.MSG_OPEN_TICKET                     := 'Supporto';    // v. 3.2.0.5
                mm.MSG_CANCEL                          := 'Annulla';
                mm.MSG_CONTINUE                        := 'Continua';
                mm.MSG_OK                              := 'Ok';
                mm.MSG_CONFIRM                         := 'Conferma';
                mm.MSG_INVALID                         := 'Invalido';
                mm.MSG_DATETYPE                        := 'Data';
                mm.MSG_WELCOME                         := 'Benvenuto ';
                mm.MSG_DELETE                          := 'Elimina';

                mm.MSG_DATE_INTERVALS_TODAY            := 'Oggi';
                mm.MSG_DATE_INTERVALS_YESTERDAY        := 'Ieri';
                mm.MSG_DATE_INTERVALS_BEFORE_YESTERDAY := 'Prima di ieri';
                mm.MSG_DATE_INTERVALS_TOMORROW         := 'Domani';
                mm.MSG_DATE_INTERVALS_AFTER_TOMORROW   := 'Dopo Domani';
                mm.MSG_DATE_INTERVALS_THIS_WEEK        := 'Questa settimana';
                mm.MSG_DATE_INTERVALS_LAST_WEEK        := 'La scorsa settimana';
                mm.MSG_DATE_INTERVALS_NEXT_WEEK        := 'La prossima settimana';
                mm.MSG_DATE_INTERVALS_THIS_FORTNIGHT   := 'Questa quindicina';
                mm.MSG_DATE_INTERVALS_LAST_FORTNIGHT   := 'Quindici giorni passati';
                mm.MSG_DATE_INTERVALS_NEXT_FORTNIGHT   := 'Prossima quindicina';
                mm.MSG_DATE_INTERVALS_THIS_MONTH       := 'Questo mese';
                mm.MSG_DATE_INTERVALS_LAST_MONTH       := 'Ultimo mese';
                mm.MSG_DATE_INTERVALS_NEXT_MONTH       := 'Mese prossimo';
                mm.MSG_DATE_INTERVALS_THIS_BIMESTER    := 'In questo bimestre';
                mm.MSG_DATE_INTERVALS_THIS_QUARTER     := 'Questo trimestre';
                mm.MSG_DATE_INTERVALS_THIS_SEMESTER    := 'In questo semestre';
                mm.MSG_DATE_INTERVALS_THIS_YEAR        := 'Quest''anno';
                mm.MSG_DATE_INTERVALS_LAST_YEAR        := 'L''anno scorso';
                mm.MSG_DATE_INTERVALS_ALL              := 'Elabora tutto';
                mm.MSG_DATE_INTERVALS_ALL_UNTIL_TODAY  := 'Elabora tutto: Fino ad oggi';

                mm.ARRAY_MONTH_NAMES[01]   := 'Gennaio';
                mm.ARRAY_MONTH_NAMES[02]   := 'Febbraio';
                mm.ARRAY_MONTH_NAMES[03]   := 'Marzo';
                mm.ARRAY_MONTH_NAMES[04]   := 'Aprile' ;
                mm.ARRAY_MONTH_NAMES[05]   := 'Maggio';
                mm.ARRAY_MONTH_NAMES[06]   := 'Giugno' ;
                mm.ARRAY_MONTH_NAMES[07]   := 'Luglio';
                mm.ARRAY_MONTH_NAMES[08]   := 'Agosto' ;
                mm.ARRAY_MONTH_NAMES[09]   := 'Settembre';
                mm.ARRAY_MONTH_NAMES[10]   := 'Ottobre' ;
                mm.ARRAY_MONTH_NAMES[11]   := 'Novembre' ;
                mm.ARRAY_MONTH_NAMES[12]   := 'Dicembre' ;
                mm.ARRAY_WEEKEND_NAMES[01] := 'Domenica';
                mm.ARRAY_WEEKEND_NAMES[02] := 'Lunedì' ;
                mm.ARRAY_WEEKEND_NAMES[03] := 'Martedì' ;
                mm.ARRAY_WEEKEND_NAMES[04] := 'Mercoledì';
                mm.ARRAY_WEEKEND_NAMES[05] := 'Giovedì';
                mm.ARRAY_WEEKEND_NAMES[06] := 'Venerdì';
                mm.ARRAY_WEEKEND_NAMES[07] := 'Sabato' ;

                mm.MSG_ACCESS_TO        := 'a';
                mm.MSG_ACCESS_INSERT_TO := 'alla REGISTRAZIONE di ';
                mm.MSG_ACCESS_EDIT_TO   := 'il CAMBIAMENTO di ';
                mm.MSG_ACCESS_DELETE_TO := 'ELIMINA da ';
                mm.MSG_ACCESS_SEARCH_TO := 'CERCA per ';
                mm.MSG_ACCESS_MOVE_TO   := 'SPOSTA';

            end;
        lttr_TR : begin
                mm.VALUE_YES                           := 'E';
                mm.VALUE_NO                            := 'H';

                mm.MSG_INFO                            := 'Bilgi';
                mm.MSG_WARNING                         := 'Uyarı';
                mm.MSG_DANGER                          := 'Dikkat';
                mm.MSG_SUCCESS                         := 'Başarı';
                mm.MSG_ERROR                           := 'Hata';
                mm.MSG_YES                             := 'Evet';
                mm.MSG_NO                              := 'Hayır';
                mm.MSG_RESTART                         := 'Tekrar başlat';  // v. 3.2.0.5
                mm.MSG_OPEN_TICKET                     := 'Destek';    // v. 3.2.0.5
                mm.MSG_CANCEL                          := 'İptal';
                mm.MSG_CONTINUE                        := 'Devam';
                mm.MSG_OK                              := 'Tamam';
                mm.MSG_CONFIRM                         := 'Onayla';
                mm.MSG_INVALID                         := 'Geçersiz';
                mm.MSG_DATETYPE                        := 'Tarih';
                mm.MSG_WELCOME                         := 'Hoş Geldiniz';
                mm.MSG_DELETE                          := 'Sil';

                mm.MSG_DATE_INTERVALS_TODAY            := 'Bugün';
                mm.MSG_DATE_INTERVALS_YESTERDAY        := 'Dün';
                mm.MSG_DATE_INTERVALS_BEFORE_YESTERDAY := 'Dünden Önce';
                mm.MSG_DATE_INTERVALS_TOMORROW         := 'Yarın';
                mm.MSG_DATE_INTERVALS_AFTER_TOMORROW   := 'Yarından Sonra';
                mm.MSG_DATE_INTERVALS_THIS_WEEK        := 'Bu Hafta';
                mm.MSG_DATE_INTERVALS_LAST_WEEK        := 'Geçen hafta';
                mm.MSG_DATE_INTERVALS_NEXT_WEEK        := 'Gelecek Hafta';
                mm.MSG_DATE_INTERVALS_THIS_FORTNIGHT   := 'Bu İki Hafta';
                mm.MSG_DATE_INTERVALS_LAST_FORTNIGHT   := 'Geçmiş İki Hafta';
                mm.MSG_DATE_INTERVALS_NEXT_FORTNIGHT   := 'Önümüzdeki İki Hafta';
                mm.MSG_DATE_INTERVALS_THIS_MONTH       := 'Bu Ay';
                mm.MSG_DATE_INTERVALS_LAST_MONTH       := 'Geçen Ay';
                mm.MSG_DATE_INTERVALS_NEXT_MONTH       := 'Gelecek Ay';
                mm.MSG_DATE_INTERVALS_THIS_BIMESTER    := 'Bu Bimester''de';
                mm.MSG_DATE_INTERVALS_THIS_QUARTER     := 'Bu Çeyrek';
                mm.MSG_DATE_INTERVALS_THIS_SEMESTER    := 'Bu Dönemde';
                mm.MSG_DATE_INTERVALS_THIS_YEAR        := 'Bu Yıl';
                mm.MSG_DATE_INTERVALS_LAST_YEAR        := 'Geçen yıl';
                mm.MSG_DATE_INTERVALS_ALL              := 'Tümünü İşle';
                mm.MSG_DATE_INTERVALS_ALL_UNTIL_TODAY  := 'Tümünü İşle: Bugüne Kadar';

                mm.ARRAY_MONTH_NAMES[01]   := 'Ocak';
                mm.ARRAY_MONTH_NAMES[02]   := 'Şubat';
                mm.ARRAY_MONTH_NAMES[03]   := 'Mart';
                mm.ARRAY_MONTH_NAMES[04]   := 'Nisan' ;
                mm.ARRAY_MONTH_NAMES[05]   := 'Mayıs';
                mm.ARRAY_MONTH_NAMES[06]   := 'Haziran' ;
                mm.ARRAY_MONTH_NAMES[07]   := 'Temmuz';
                mm.ARRAY_MONTH_NAMES[08]   := 'Ağustos' ;
                mm.ARRAY_MONTH_NAMES[09]   := 'Eylül';
                mm.ARRAY_MONTH_NAMES[10]   := 'Ekim' ;
                mm.ARRAY_MONTH_NAMES[11]   := 'Kasım' ;
                mm.ARRAY_MONTH_NAMES[12]   := 'Aralık' ;
                mm.ARRAY_WEEKEND_NAMES[01] := 'Pazar';
                mm.ARRAY_WEEKEND_NAMES[02] := 'Pazartesi' ;
                mm.ARRAY_WEEKEND_NAMES[03] := 'Salı' ;
                mm.ARRAY_WEEKEND_NAMES[04] := 'Çarşamba';
                mm.ARRAY_WEEKEND_NAMES[05] := 'Perşembe';
                mm.ARRAY_WEEKEND_NAMES[06] := 'Cuma';
                mm.ARRAY_WEEKEND_NAMES[07] := 'Cumartesi' ;

                mm.MSG_ACCESS_TO        := 'bir ';
                mm.MSG_ACCESS_INSERT_TO := ' KAYIT için ';
                mm.MSG_ACCESS_EDIT_TO   := 'DE????KL???';
                mm.MSG_ACCESS_DELETE_TO := '?uradan S?L';
                mm.MSG_ACCESS_SEARCH_TO := 'Arama';
                mm.MSG_ACCESS_MOVE_TO   := 'TA?I';

            end;
        ltru_RU : begin
                mm.VALUE_YES                           := 'д';
                mm.VALUE_NO                            := 'н';

                mm.MSG_INFO                            := 'Информация';
                mm.MSG_WARNING                         := 'Предупреждение';
                mm.MSG_DANGER                          := 'Осторожно';
                mm.MSG_SUCCESS                         := 'Успех';
                mm.MSG_ERROR                           := 'Ошибка';
                mm.MSG_YES                             := 'Да';
                mm.MSG_NO                              := 'Нет';
                mm.MSG_RESTART                         := 'Рестарт';  // v. 3.2.0.5
                mm.MSG_OPEN_TICKET                     := 'Служба поддержки';    // v. 3.2.0.5
                mm.MSG_CANCEL                          := 'Отменить';
                mm.MSG_CONTINUE                        := 'Продолжить';
                mm.MSG_OK                              := 'Хорошо';
                mm.MSG_CONFIRM                         := 'Подтвердить';
                mm.MSG_INVALID                         := 'Недействительным';
                mm.MSG_DATETYPE                        := 'Дата';
                mm.MSG_WELCOME                         := 'Добро пожаловать';
                mm.MSG_DELETE                          := 'Удалить';

                mm.MSG_DATE_INTERVALS_TODAY            := 'Сегодня';
                mm.MSG_DATE_INTERVALS_YESTERDAY        := 'Вчера';
                mm.MSG_DATE_INTERVALS_BEFORE_YESTERDAY := 'До вчерашнего дня';
                mm.MSG_DATE_INTERVALS_TOMORROW         := 'Завтра';
                mm.MSG_DATE_INTERVALS_AFTER_TOMORROW   := 'Послезавтра';
                mm.MSG_DATE_INTERVALS_THIS_WEEK        := 'На этой неделе';
                mm.MSG_DATE_INTERVALS_LAST_WEEK        := 'Прошлая неделя';
                mm.MSG_DATE_INTERVALS_NEXT_WEEK        := 'Следующая неделя';
                mm.MSG_DATE_INTERVALS_THIS_FORTNIGHT   := 'Эти две недели';
                mm.MSG_DATE_INTERVALS_LAST_FORTNIGHT   := 'Прошлые две недели';
                mm.MSG_DATE_INTERVALS_NEXT_FORTNIGHT   := 'Следующие две недели';
                mm.MSG_DATE_INTERVALS_THIS_MONTH       := 'В этом месяце';
                mm.MSG_DATE_INTERVALS_LAST_MONTH       := 'Прошлый месяц';
                mm.MSG_DATE_INTERVALS_NEXT_MONTH       := 'В следующем месяце';
                mm.MSG_DATE_INTERVALS_THIS_BIMESTER    := 'В этом биместере';
                mm.MSG_DATE_INTERVALS_THIS_QUARTER     := 'Этот квартал';
                mm.MSG_DATE_INTERVALS_THIS_SEMESTER    := 'В этом семестре';
                mm.MSG_DATE_INTERVALS_THIS_YEAR        := 'В этом году';
                mm.MSG_DATE_INTERVALS_LAST_YEAR        := 'Прошлый год';
                mm.MSG_DATE_INTERVALS_ALL              := 'Обработать все';
                mm.MSG_DATE_INTERVALS_ALL_UNTIL_TODAY  := 'Обрабатывать все: до сегодняшнего дня';

                mm.ARRAY_MONTH_NAMES [01]   := 'Январь';
                mm.ARRAY_MONTH_NAMES [02]   := 'Февраль';
                mm.ARRAY_MONTH_NAMES [03]   := 'Март';
                mm.ARRAY_MONTH_NAMES [04]   := 'Апрель';
                mm.ARRAY_MONTH_NAMES [05]   := 'Май';
                mm.ARRAY_MONTH_NAMES [06]   := 'Июнь';
                mm.ARRAY_MONTH_NAMES [07]   := 'Июль';
                mm.ARRAY_MONTH_NAMES [08]   := 'Август';
                mm.ARRAY_MONTH_NAMES [09]   := 'Сентябрь';
                mm.ARRAY_MONTH_NAMES [10]   := 'Октябрь';
                mm.ARRAY_MONTH_NAMES [11]   := 'Ноябрь';
                mm.ARRAY_MONTH_NAMES [12]   := 'Декабрь';
                mm.ARRAY_WEEKEND_NAMES [01] := 'Воскресенье';
                mm.ARRAY_WEEKEND_NAMES [02] := 'понедельник';
                mm.ARRAY_WEEKEND_NAMES [03] := 'вторник';
                mm.ARRAY_WEEKEND_NAMES [04] := 'Среда';
                mm.ARRAY_WEEKEND_NAMES [05] := 'Четверг';
                mm.ARRAY_WEEKEND_NAMES [06] := 'Пятница';
                mm.ARRAY_WEEKEND_NAMES [07] := 'Суббота';

                mm.MSG_ACCESS_TO        := 'к';
                mm.MSG_ACCESS_INSERT_TO := 'ВСТАВИТЬ';
                mm.MSG_ACCESS_EDIT_TO   := 'редактировать';
                mm.MSG_ACCESS_DELETE_TO := 'УДАЛИТЬ';
                mm.MSG_ACCESS_SEARCH_TO := 'ПОИСКАТЬ';
                mm.MSG_ACCESS_MOVE_TO   := 'ПЕРЕМЕСТИТЬ';

            end;
       ltzn_CH : begin
                     mm.VALUE_YES    := 'Y';
                     mm.VALUE_NO     := 'N';

                     mm.MSG_INFO     := 'Info';
                     mm.MSG_WARNING  := 'Alert';
                     mm.MSG_DANGER   := 'Caution';
                     mm.MSG_SUCCESS  := 'Success';
                     mm.MSG_ERROR    := 'Error';
                     mm.MSG_YES      := 'Yes';
                     mm.MSG_NO       := 'No';
                     mm.MSG_RESTART     := 'Restart';  // v. 3.2.0.5
                     mm.MSG_OPEN_TICKET := 'Support';    // v. 3.2.0.5
                     mm.MSG_CANCEL   := 'Cancel';
                     mm.MSG_CONTINUE := 'Continue';
                     mm.MSG_OK       := 'Ok';
                     mm.MSG_CONFIRM  := 'Confirm';
                     mm.MSG_INVALID  := 'Invalid';
                     mm.MSG_DATETYPE := 'Date';
                     mm.MSG_WELCOME  := 'Welcome ';
                     mm.MSG_DELETE   := 'Delete';

                     mm.MSG_DATE_INTERVALS_TODAY            := 'Today';
                     mm.MSG_DATE_INTERVALS_YESTERDAY        := 'Yesterday';
                     mm.MSG_DATE_INTERVALS_BEFORE_YESTERDAY := 'Before Yesterday';
                     mm.MSG_DATE_INTERVALS_TOMORROW         := 'Tomorrow';
                     mm.MSG_DATE_INTERVALS_AFTER_TOMORROW   := 'After Tomorrow';
                     mm.MSG_DATE_INTERVALS_THIS_WEEK        := 'This Week';
                     mm.MSG_DATE_INTERVALS_LAST_WEEK        := 'Last week';
                     mm.MSG_DATE_INTERVALS_NEXT_WEEK        := 'Next Week';
                     mm.MSG_DATE_INTERVALS_THIS_FORTNIGHT   := 'This Fortnight';
                     mm.MSG_DATE_INTERVALS_LAST_FORTNIGHT   := 'Fortnight Past';
                     mm.MSG_DATE_INTERVALS_NEXT_FORTNIGHT   := 'Next Fortnight';
                     mm.MSG_DATE_INTERVALS_THIS_MONTH       := 'This Month';
                     mm.MSG_DATE_INTERVALS_LAST_MONTH       := 'Last Month';
                     mm.MSG_DATE_INTERVALS_NEXT_MONTH       := 'Next Month';
                     mm.MSG_DATE_INTERVALS_THIS_BIMESTER    := 'In this Bimester';
                     mm.MSG_DATE_INTERVALS_THIS_QUARTER     := 'This Quarter';
                     mm.MSG_DATE_INTERVALS_THIS_SEMESTER    := 'In this Semester';
                     mm.MSG_DATE_INTERVALS_THIS_YEAR        := 'This Year';
                     mm.MSG_DATE_INTERVALS_LAST_YEAR        := 'Last year';
                     mm.MSG_DATE_INTERVALS_ALL              := 'Process All';
                     mm.MSG_DATE_INTERVALS_ALL_UNTIL_TODAY  := 'Process All: Until Today';

                     mm.ARRAY_MONTH_NAMES[01]   := 'January';
                     mm.ARRAY_MONTH_NAMES[02]   := 'February';
                     mm.ARRAY_MONTH_NAMES[03]   := 'March';
                     mm.ARRAY_MONTH_NAMES[04]   := 'April' ;
                     mm.ARRAY_MONTH_NAMES[05]   := 'May';
                     mm.ARRAY_MONTH_NAMES[06]   := 'June' ;
                     mm.ARRAY_MONTH_NAMES[07]   := 'July';
                     mm.ARRAY_MONTH_NAMES[08]   := 'August' ;
                     mm.ARRAY_MONTH_NAMES[09]   := 'September';
                     mm.ARRAY_MONTH_NAMES[10]   := 'October' ;
                     mm.ARRAY_MONTH_NAMES[11]   := 'November' ;
                     mm.ARRAY_MONTH_NAMES[12]   := 'December' ;
                     mm.ARRAY_WEEKEND_NAMES[01] := 'Sunday';
                     mm.ARRAY_WEEKEND_NAMES[02] := 'Monday' ;
                     mm.ARRAY_WEEKEND_NAMES[03] := 'Tuesday' ;
                     mm.ARRAY_WEEKEND_NAMES[04] := 'Wednesday';
                     mm.ARRAY_WEEKEND_NAMES[05] := 'Thursday';
                     mm.ARRAY_WEEKEND_NAMES[06] := 'Friday';
                     mm.ARRAY_WEEKEND_NAMES[07] := 'Saturday' ;

                     mm.MSG_ACCESS_TO         := 'to ';
                     mm.MSG_ACCESS_INSERT_TO  := 'to INSERT ';
                     mm.MSG_ACCESS_EDIT_TO    := 'to EDIT ';
                     mm.MSG_ACCESS_DELETE_TO  := 'to DELETE ';
                     mm.MSG_ACCESS_SEARCH_TO  := 'to SEARCH ';
                     mm.MSG_ACCESS_MOVE_TO    := 'to MOVE ';

                 end;
       ltin_ID : begin
                     mm.VALUE_YES    := 'Y';
                     mm.VALUE_NO     := 'N';

                     mm.MSG_INFO     := 'Info';
                     mm.MSG_WARNING  := 'Alert';
                     mm.MSG_DANGER   := 'Caution';
                     mm.MSG_SUCCESS  := 'Success';
                     mm.MSG_ERROR    := 'Error';
                     mm.MSG_YES      := 'Yes';
                     mm.MSG_NO       := 'No';
                     mm.MSG_RESTART     := 'Restart';  // v. 3.2.0.5
                     mm.MSG_OPEN_TICKET := 'Support';    // v. 3.2.0.5
                     mm.MSG_CANCEL   := 'Cancel';
                     mm.MSG_CONTINUE := 'Continue';
                     mm.MSG_OK       := 'Ok';
                     mm.MSG_CONFIRM  := 'Confirm';
                     mm.MSG_INVALID  := 'Invalid';
                     mm.MSG_DATETYPE := 'Date';
                     mm.MSG_WELCOME  := 'Welcome ';
                     mm.MSG_DELETE   := 'Delete';

                     mm.MSG_DATE_INTERVALS_TODAY            := 'Today';
                     mm.MSG_DATE_INTERVALS_YESTERDAY        := 'Yesterday';
                     mm.MSG_DATE_INTERVALS_BEFORE_YESTERDAY := 'Before Yesterday';
                     mm.MSG_DATE_INTERVALS_TOMORROW         := 'Tomorrow';
                     mm.MSG_DATE_INTERVALS_AFTER_TOMORROW   := 'After Tomorrow';
                     mm.MSG_DATE_INTERVALS_THIS_WEEK        := 'This Week';
                     mm.MSG_DATE_INTERVALS_LAST_WEEK        := 'Last week';
                     mm.MSG_DATE_INTERVALS_NEXT_WEEK        := 'Next Week';
                     mm.MSG_DATE_INTERVALS_THIS_FORTNIGHT   := 'This Fortnight';
                     mm.MSG_DATE_INTERVALS_LAST_FORTNIGHT   := 'Fortnight Past';
                     mm.MSG_DATE_INTERVALS_NEXT_FORTNIGHT   := 'Next Fortnight';
                     mm.MSG_DATE_INTERVALS_THIS_MONTH       := 'This Month';
                     mm.MSG_DATE_INTERVALS_LAST_MONTH       := 'Last Month';
                     mm.MSG_DATE_INTERVALS_NEXT_MONTH       := 'Next Month';
                     mm.MSG_DATE_INTERVALS_THIS_BIMESTER    := 'In this Bimester';
                     mm.MSG_DATE_INTERVALS_THIS_QUARTER     := 'This Quarter';
                     mm.MSG_DATE_INTERVALS_THIS_SEMESTER    := 'In this Semester';
                     mm.MSG_DATE_INTERVALS_THIS_YEAR        := 'This Year';
                     mm.MSG_DATE_INTERVALS_LAST_YEAR        := 'Last year';
                     mm.MSG_DATE_INTERVALS_ALL              := 'Process All';
                     mm.MSG_DATE_INTERVALS_ALL_UNTIL_TODAY  := 'Process All: Until Today';

                     mm.ARRAY_MONTH_NAMES[01]   := 'January';
                     mm.ARRAY_MONTH_NAMES[02]   := 'February';
                     mm.ARRAY_MONTH_NAMES[03]   := 'March';
                     mm.ARRAY_MONTH_NAMES[04]   := 'April' ;
                     mm.ARRAY_MONTH_NAMES[05]   := 'May';
                     mm.ARRAY_MONTH_NAMES[06]   := 'June' ;
                     mm.ARRAY_MONTH_NAMES[07]   := 'July';
                     mm.ARRAY_MONTH_NAMES[08]   := 'August' ;
                     mm.ARRAY_MONTH_NAMES[09]   := 'September';
                     mm.ARRAY_MONTH_NAMES[10]   := 'October' ;
                     mm.ARRAY_MONTH_NAMES[11]   := 'November' ;
                     mm.ARRAY_MONTH_NAMES[12]   := 'December' ;
                     mm.ARRAY_WEEKEND_NAMES[01] := 'Sunday';
                     mm.ARRAY_WEEKEND_NAMES[02] := 'Monday' ;
                     mm.ARRAY_WEEKEND_NAMES[03] := 'Tuesday' ;
                     mm.ARRAY_WEEKEND_NAMES[04] := 'Wednesday';
                     mm.ARRAY_WEEKEND_NAMES[05] := 'Thursday';
                     mm.ARRAY_WEEKEND_NAMES[06] := 'Friday';
                     mm.ARRAY_WEEKEND_NAMES[07] := 'Saturday' ;

                     mm.MSG_ACCESS_TO         := 'to ';
                     mm.MSG_ACCESS_INSERT_TO  := 'to INSERT ';
                     mm.MSG_ACCESS_EDIT_TO    := 'to EDIT ';
                     mm.MSG_ACCESS_DELETE_TO  := 'to DELETE ';
                     mm.MSG_ACCESS_SEARCH_TO  := 'to SEARCH ';
                     mm.MSG_ACCESS_MOVE_TO    := 'to MOVE ';

                 end;
       ltth_TH : begin
                     mm.VALUE_YES    := 'Y';
                     mm.VALUE_NO     := 'N';

                     mm.MSG_INFO     := 'Info';
                     mm.MSG_WARNING  := 'Alert';
                     mm.MSG_DANGER   := 'Caution';
                     mm.MSG_SUCCESS  := 'Success';
                     mm.MSG_ERROR    := 'Error';
                     mm.MSG_YES      := 'Yes';
                     mm.MSG_NO       := 'No';
                     mm.MSG_RESTART     := 'Restart';  // v. 3.2.0.5
                     mm.MSG_OPEN_TICKET := 'Support';    // v. 3.2.0.5
                     mm.MSG_CANCEL   := 'Cancel';
                     mm.MSG_CONTINUE := 'Continue';
                     mm.MSG_OK       := 'Ok';
                     mm.MSG_CONFIRM  := 'Confirm';
                     mm.MSG_INVALID  := 'Invalid';
                     mm.MSG_DATETYPE := 'Date';
                     mm.MSG_WELCOME  := 'Welcome ';
                     mm.MSG_DELETE   := 'Delete';

                     mm.MSG_DATE_INTERVALS_TODAY            := 'Today';
                     mm.MSG_DATE_INTERVALS_YESTERDAY        := 'Yesterday';
                     mm.MSG_DATE_INTERVALS_BEFORE_YESTERDAY := 'Before Yesterday';
                     mm.MSG_DATE_INTERVALS_TOMORROW         := 'Tomorrow';
                     mm.MSG_DATE_INTERVALS_AFTER_TOMORROW   := 'After Tomorrow';
                     mm.MSG_DATE_INTERVALS_THIS_WEEK        := 'This Week';
                     mm.MSG_DATE_INTERVALS_LAST_WEEK        := 'Last week';
                     mm.MSG_DATE_INTERVALS_NEXT_WEEK        := 'Next Week';
                     mm.MSG_DATE_INTERVALS_THIS_FORTNIGHT   := 'This Fortnight';
                     mm.MSG_DATE_INTERVALS_LAST_FORTNIGHT   := 'Fortnight Past';
                     mm.MSG_DATE_INTERVALS_NEXT_FORTNIGHT   := 'Next Fortnight';
                     mm.MSG_DATE_INTERVALS_THIS_MONTH       := 'This Month';
                     mm.MSG_DATE_INTERVALS_LAST_MONTH       := 'Last Month';
                     mm.MSG_DATE_INTERVALS_NEXT_MONTH       := 'Next Month';
                     mm.MSG_DATE_INTERVALS_THIS_BIMESTER    := 'In this Bimester';
                     mm.MSG_DATE_INTERVALS_THIS_QUARTER     := 'This Quarter';
                     mm.MSG_DATE_INTERVALS_THIS_SEMESTER    := 'In this Semester';
                     mm.MSG_DATE_INTERVALS_THIS_YEAR        := 'This Year';
                     mm.MSG_DATE_INTERVALS_LAST_YEAR        := 'Last year';
                     mm.MSG_DATE_INTERVALS_ALL              := 'Process All';
                     mm.MSG_DATE_INTERVALS_ALL_UNTIL_TODAY  := 'Process All: Until Today';

                     mm.ARRAY_MONTH_NAMES[01]   := 'January';
                     mm.ARRAY_MONTH_NAMES[02]   := 'February';
                     mm.ARRAY_MONTH_NAMES[03]   := 'March';
                     mm.ARRAY_MONTH_NAMES[04]   := 'April' ;
                     mm.ARRAY_MONTH_NAMES[05]   := 'May';
                     mm.ARRAY_MONTH_NAMES[06]   := 'June' ;
                     mm.ARRAY_MONTH_NAMES[07]   := 'July';
                     mm.ARRAY_MONTH_NAMES[08]   := 'August' ;
                     mm.ARRAY_MONTH_NAMES[09]   := 'September';
                     mm.ARRAY_MONTH_NAMES[10]   := 'October' ;
                     mm.ARRAY_MONTH_NAMES[11]   := 'November' ;
                     mm.ARRAY_MONTH_NAMES[12]   := 'December' ;
                     mm.ARRAY_WEEKEND_NAMES[01] := 'Sunday';
                     mm.ARRAY_WEEKEND_NAMES[02] := 'Monday' ;
                     mm.ARRAY_WEEKEND_NAMES[03] := 'Tuesday' ;
                     mm.ARRAY_WEEKEND_NAMES[04] := 'Wednesday';
                     mm.ARRAY_WEEKEND_NAMES[05] := 'Thursday';
                     mm.ARRAY_WEEKEND_NAMES[06] := 'Friday';
                     mm.ARRAY_WEEKEND_NAMES[07] := 'Saturday' ;

                     mm.MSG_ACCESS_TO         := 'to ';
                     mm.MSG_ACCESS_INSERT_TO  := 'to INSERT ';
                     mm.MSG_ACCESS_EDIT_TO    := 'to EDIT ';
                     mm.MSG_ACCESS_DELETE_TO  := 'to DELETE ';
                     mm.MSG_ACCESS_SEARCH_TO  := 'to SEARCH ';
                     mm.MSG_ACCESS_MOVE_TO    := 'to MOVE ';

                 end;
       lthi_IN : begin
                     mm.VALUE_YES    := 'Y';
                     mm.VALUE_NO     := 'N';

                     mm.MSG_INFO     := 'Info';
                     mm.MSG_WARNING  := 'Alert';
                     mm.MSG_DANGER   := 'Caution';
                     mm.MSG_SUCCESS  := 'Success';
                     mm.MSG_ERROR    := 'Error';
                     mm.MSG_YES      := 'Yes';
                     mm.MSG_NO       := 'No';
                     mm.MSG_RESTART     := 'Restart';  // v. 3.2.0.5
                     mm.MSG_OPEN_TICKET := 'Support';    // v. 3.2.0.5
                     mm.MSG_CANCEL   := 'Cancel';
                     mm.MSG_CONTINUE := 'Continue';
                     mm.MSG_OK       := 'Ok';
                     mm.MSG_CONFIRM  := 'Confirm';
                     mm.MSG_INVALID  := 'Invalid';
                     mm.MSG_DATETYPE := 'Date';
                     mm.MSG_WELCOME  := 'Welcome ';
                     mm.MSG_DELETE   := 'Delete';

                     mm.MSG_DATE_INTERVALS_TODAY            := 'Today';
                     mm.MSG_DATE_INTERVALS_YESTERDAY        := 'Yesterday';
                     mm.MSG_DATE_INTERVALS_BEFORE_YESTERDAY := 'Before Yesterday';
                     mm.MSG_DATE_INTERVALS_TOMORROW         := 'Tomorrow';
                     mm.MSG_DATE_INTERVALS_AFTER_TOMORROW   := 'After Tomorrow';
                     mm.MSG_DATE_INTERVALS_THIS_WEEK        := 'This Week';
                     mm.MSG_DATE_INTERVALS_LAST_WEEK        := 'Last week';
                     mm.MSG_DATE_INTERVALS_NEXT_WEEK        := 'Next Week';
                     mm.MSG_DATE_INTERVALS_THIS_FORTNIGHT   := 'This Fortnight';
                     mm.MSG_DATE_INTERVALS_LAST_FORTNIGHT   := 'Fortnight Past';
                     mm.MSG_DATE_INTERVALS_NEXT_FORTNIGHT   := 'Next Fortnight';
                     mm.MSG_DATE_INTERVALS_THIS_MONTH       := 'This Month';
                     mm.MSG_DATE_INTERVALS_LAST_MONTH       := 'Last Month';
                     mm.MSG_DATE_INTERVALS_NEXT_MONTH       := 'Next Month';
                     mm.MSG_DATE_INTERVALS_THIS_BIMESTER    := 'In this Bimester';
                     mm.MSG_DATE_INTERVALS_THIS_QUARTER     := 'This Quarter';
                     mm.MSG_DATE_INTERVALS_THIS_SEMESTER    := 'In this Semester';
                     mm.MSG_DATE_INTERVALS_THIS_YEAR        := 'This Year';
                     mm.MSG_DATE_INTERVALS_LAST_YEAR        := 'Last year';
                     mm.MSG_DATE_INTERVALS_ALL              := 'Process All';
                     mm.MSG_DATE_INTERVALS_ALL_UNTIL_TODAY  := 'Process All: Until Today';

                     mm.ARRAY_MONTH_NAMES[01]   := 'January';
                     mm.ARRAY_MONTH_NAMES[02]   := 'February';
                     mm.ARRAY_MONTH_NAMES[03]   := 'March';
                     mm.ARRAY_MONTH_NAMES[04]   := 'April' ;
                     mm.ARRAY_MONTH_NAMES[05]   := 'May';
                     mm.ARRAY_MONTH_NAMES[06]   := 'June' ;
                     mm.ARRAY_MONTH_NAMES[07]   := 'July';
                     mm.ARRAY_MONTH_NAMES[08]   := 'August' ;
                     mm.ARRAY_MONTH_NAMES[09]   := 'September';
                     mm.ARRAY_MONTH_NAMES[10]   := 'October' ;
                     mm.ARRAY_MONTH_NAMES[11]   := 'November' ;
                     mm.ARRAY_MONTH_NAMES[12]   := 'December' ;
                     mm.ARRAY_WEEKEND_NAMES[01] := 'Sunday';
                     mm.ARRAY_WEEKEND_NAMES[02] := 'Monday' ;
                     mm.ARRAY_WEEKEND_NAMES[03] := 'Tuesday' ;
                     mm.ARRAY_WEEKEND_NAMES[04] := 'Wednesday';
                     mm.ARRAY_WEEKEND_NAMES[05] := 'Thursday';
                     mm.ARRAY_WEEKEND_NAMES[06] := 'Friday';
                     mm.ARRAY_WEEKEND_NAMES[07] := 'Saturday' ;

                     mm.MSG_ACCESS_TO         := 'to ';
                     mm.MSG_ACCESS_INSERT_TO  := 'to INSERT ';
                     mm.MSG_ACCESS_EDIT_TO    := 'to EDIT ';
                     mm.MSG_ACCESS_DELETE_TO  := 'to DELETE ';
                     mm.MSG_ACCESS_SEARCH_TO  := 'to SEARCH ';
                     mm.MSG_ACCESS_MOVE_TO    := 'to MOVE ';

                 end;
       ltar_SA : begin
                     mm.VALUE_YES    := 'ن';
                     mm.VALUE_NO     := 'لا';

                     mm.MSG_INFO     := 'معلومة';
                     mm.MSG_WARNING  := 'انذار';
                     mm.MSG_DANGER   := 'تحذير';
                     mm.MSG_SUCCESS  := 'نجاح';
                     mm.MSG_ERROR    := 'خطأ';
                     mm.MSG_YES      := 'نعم';
                     mm.MSG_NO       := 'لا';
                     mm.MSG_RESTART     := 'إعادة تشغيل';  // v. 3.2.0.5
                     mm.MSG_OPEN_TICKET := 'الدعم';    // v. 3.2.0.5
                     mm.MSG_CANCEL   := 'إلغاء';
                     mm.MSG_CONTINUE := 'واصل';
                     mm.MSG_OK       := 'موافق';
                     mm.MSG_CONFIRM  := 'أكد';
                     mm.MSG_INVALID  := 'غير صالح';
                     mm.MSG_DATETYPE := 'تاريخ';
                     mm.MSG_WELCOME  := 'مرحبا ';
                     mm.MSG_DELETE   := 'حذف';

                     mm.MSG_DATE_INTERVALS_TODAY            := 'اليوم';
                     mm.MSG_DATE_INTERVALS_YESTERDAY        := 'الامس';
                     mm.MSG_DATE_INTERVALS_BEFORE_YESTERDAY := 'قبل أمس';
                     mm.MSG_DATE_INTERVALS_TOMORROW         := 'غدا';
                     mm.MSG_DATE_INTERVALS_AFTER_TOMORROW   := 'بعد غد';
                     mm.MSG_DATE_INTERVALS_THIS_WEEK        := 'هذا الاسبوع';
                     mm.MSG_DATE_INTERVALS_LAST_WEEK        := 'الاسبوع الماضي';
                     mm.MSG_DATE_INTERVALS_NEXT_WEEK        := 'الاسبوع المقبل';
                     mm.MSG_DATE_INTERVALS_THIS_FORTNIGHT   := 'هذا الأسبوعين';
                     mm.MSG_DATE_INTERVALS_LAST_FORTNIGHT   := 'الاسبوعين الماضيين';
                     mm.MSG_DATE_INTERVALS_NEXT_FORTNIGHT   := 'الأسبوعين التاليين';
                     mm.MSG_DATE_INTERVALS_THIS_MONTH       := 'هذا الشهر';
                     mm.MSG_DATE_INTERVALS_LAST_MONTH       := 'الشهر الماضي';
                     mm.MSG_DATE_INTERVALS_NEXT_MONTH       := 'الشهر القادم';
                     mm.MSG_DATE_INTERVALS_THIS_BIMESTER    := 'في هذه الشهرين';
                     mm.MSG_DATE_INTERVALS_THIS_QUARTER     := 'ثلاث أشهر';
                     mm.MSG_DATE_INTERVALS_THIS_SEMESTER    := 'ستة أشهر';
                     mm.MSG_DATE_INTERVALS_THIS_YEAR        := 'هذه السنة';
                     mm.MSG_DATE_INTERVALS_LAST_YEAR        := 'السنة الماضية';
                     mm.MSG_DATE_INTERVALS_ALL              := 'معالجة الكل';
                     mm.MSG_DATE_INTERVALS_ALL_UNTIL_TODAY  := 'معالجة الكل: حتى اليوم';

                     mm.ARRAY_MONTH_NAMES[01]   := 'يناير';
                     mm.ARRAY_MONTH_NAMES[02]   := 'فبراير';
                     mm.ARRAY_MONTH_NAMES[03]   := 'مارس';
                     mm.ARRAY_MONTH_NAMES[04]   := 'أبريل' ;
                     mm.ARRAY_MONTH_NAMES[05]   := 'ماي';
                     mm.ARRAY_MONTH_NAMES[06]   := 'يونيو' ;
                     mm.ARRAY_MONTH_NAMES[07]   := 'يوليوز';
                     mm.ARRAY_MONTH_NAMES[08]   := 'غشت' ;
                     mm.ARRAY_MONTH_NAMES[09]   := 'شتنبر';
                     mm.ARRAY_MONTH_NAMES[10]   := 'اكتوبر' ;
                     mm.ARRAY_MONTH_NAMES[11]   := 'نونمبر' ;
                     mm.ARRAY_MONTH_NAMES[12]   := 'دجنبر' ;
                     mm.ARRAY_WEEKEND_NAMES[01] := 'الأحد';
                     mm.ARRAY_WEEKEND_NAMES[02] := 'الاثنين' ;
                     mm.ARRAY_WEEKEND_NAMES[03] := 'الثلاثاء' ;
                     mm.ARRAY_WEEKEND_NAMES[04] := 'الأربعاء';
                     mm.ARRAY_WEEKEND_NAMES[05] := 'الخميس';
                     mm.ARRAY_WEEKEND_NAMES[06] := 'الجمعة';
                     mm.ARRAY_WEEKEND_NAMES[07] := 'السبت' ;

                     mm.MSG_ACCESS_TO         := ' ل';
                     mm.MSG_ACCESS_INSERT_TO  := ' لإدخال';
                     mm.MSG_ACCESS_EDIT_TO    := ' للتعديل';
                     mm.MSG_ACCESS_DELETE_TO  := ' لحذف';
                     mm.MSG_ACCESS_SEARCH_TO  := ' للبحث';
                     mm.MSG_ACCESS_MOVE_TO    := ' للانتقال';

                 end;
     end;

     // -----------------------------------------------------------------------------------
     // VALIDATE MESSAGES
     case mm.varLT_Lang of

          ltpt_BR : begin
                mm.MSG_VALIDATE_INVALID_EXISTS   := 'Registro já existe.' ; // v. 4.0.0.5
                mm.MSG_VALIDATE_INVALID_VALUE    := 'Conteúdo informado é inválido.' ; // v. 3.3.1.0
                mm.MSG_VALIDATE_BLANK_FIELD      := 'Campo %s não pode estar vazio';
                mm.MSG_VALIDATE_OR_BLANK_CONTENT := 'ou em branco';
                mm.MSG_VALIDATE_PASSWORD         := 'A senha precisa ter no mínimo 8 caracteres contendo letras minúsculas, maiúsculas, números e caracteres especiais';
                mm.MSG_VALIDATE_LENGTH_MIN       := 'Informar no mínimo %s caracteres( você informou apenas %s )';
                mm.MSG_VALIDATE_LENGTH_MAX       := 'Informar no máximo %s caracteres( você informou %s )';
              end;
          lten_US, lten_GB: begin
                      mm.MSG_VALIDATE_INVALID_EXISTS   := 'Record already exists.' ; // v. 4.0.0.5
                      mm.MSG_VALIDATE_INVALID_VALUE    := 'Content entered is invalid.' ; // v. 3.3.1.0
                      mm.MSG_VALIDATE_BLANK_FIELD      := 'Field %s cannot be empty';
                      mm.MSG_VALIDATE_OR_BLANK_CONTENT := 'or blank';
                      mm.MSG_VALIDATE_PASSWORD         := 'The password must be at least 8 characters long, containing lowercase, uppercase, numbers and special characters';
                      mm.MSG_VALIDATE_LENGTH_MIN       := 'Enter at least %s characters ( you only entered %s )';
                      mm.MSG_VALIDATE_LENGTH_MAX       := 'Enter a maximum of %s characters ( you have entered %s )';
                   end;
          ltes_ES: begin
                 mm.MSG_VALIDATE_INVALID_EXISTS   := 'El registro ya existe.' ; // v. 4.0.0.5
                 mm.MSG_VALIDATE_INVALID_VALUE    := 'El contenido ingresado no es válido.' ; // v. 3.3.1.0
                 mm.MSG_VALIDATE_BLANK_FIELD      := 'El campo %s no puede estar vacío';
                 mm.MSG_VALIDATE_OR_BLANK_CONTENT := 'o en blanco';
                 mm.MSG_VALIDATE_PASSWORD         := 'La contraseña debe tener al menos 8 caracteres y contener minúsculas, mayúsculas, números y caracteres especiales';
                 mm.MSG_VALIDATE_LENGTH_MIN       := 'Ingrese al menos %s caracteres (solo ingresó %s)';
                 mm.MSG_VALIDATE_LENGTH_MAX       := 'Introduzca un máximo de %s caracteres (ha introducido %s)';
              end;
          ltfr_FR: begin
                 mm.MSG_VALIDATE_INVALID_EXISTS   := 'L''enregistrement existe déjà.' ; // v. 4.0.0.5
                 mm.MSG_VALIDATE_INVALID_VALUE    := 'Le contenu saisi n''est pas valide.' ; // v. 3.3.1.0
                 mm.MSG_VALIDATE_BLANK_FIELD      := 'Le champ %s ne peut pas être vide';
                 mm.MSG_VALIDATE_OR_BLANK_CONTENT := 'ou vide';
                 mm.MSG_VALIDATE_PASSWORD         := 'Le mot de passe doit comporter au moins 8 caractères, contenant des minuscules, des majuscules, des chiffres et des caractères spéciaux';
                 mm.MSG_VALIDATE_LENGTH_MIN       := 'Entrez au moins %s caractères ( vous n''avez entré que %s )';
                 mm.MSG_VALIDATE_LENGTH_MAX       := 'Entrez un maximum de %s caractères ( vous avez entré %s )';
              end;
          ltde_DE: begin
                 mm.MSG_VALIDATE_INVALID_EXISTS   := 'Eintrag existiert bereits.' ; // v. 4.0.0.5
                 mm.MSG_VALIDATE_INVALID_VALUE    := 'Der eingegebene Inhalt ist ungültig.' ; // v. 3.3.1.0
                 mm.MSG_VALIDATE_BLANK_FIELD      := 'Feld %s darf nicht leer sein';
                 mm.MSG_VALIDATE_OR_BLANK_CONTENT := 'oder leer';
                 mm.MSG_VALIDATE_PASSWORD         := 'Das Passwort muss mindestens 8 Zeichen lang sein und Kleinbuchstaben, Großbuchstaben, Zahlen und Sonderzeichen enthalten';
                 mm.MSG_VALIDATE_LENGTH_MIN       := 'Geben Sie mindestens %s Zeichen ein ( Sie haben nur %s eingegeben )';
                 mm.MSG_VALIDATE_LENGTH_MAX       := 'Geben Sie maximal %s Zeichen ein ( Sie haben %s eingegeben )';
              end;
          ltit_IT: begin
                 mm.MSG_VALIDATE_INVALID_EXISTS   := 'Il record esiste già.' ; // v. 4.0.0.5
                 mm.MSG_VALIDATE_INVALID_VALUE    := 'Il contenuto inserito non è valido.' ; // v. 3.3.1.0
                 mm.MSG_VALIDATE_OR_BLANK_CONTENT := 'o vuoto';
                 mm.MSG_VALIDATE_PASSWORD         := 'La password deve essere lunga almeno 8 caratteri, contenente minuscole, maiuscole, numeri e caratteri speciali';
                 mm.MSG_VALIDATE_LENGTH_MIN       := 'Inserisci almeno %s caratteri ( hai inserito solo %s )';
                 mm.MSG_VALIDATE_LENGTH_MAX       := 'Inserisci un massimo di %s caratteri ( hai inserito %s )';
              end;
          lttr_TR : begin
                 mm.MSG_VALIDATE_INVALID_EXISTS   := 'Kayıt zaten var.' ; // v. 4.0.0.5
                 mm.MSG_VALIDATE_INVALID_VALUE    := 'Girilen içerik geçersiz.' ; // v. 3.3.1.0
                 mm.MSG_VALIDATE_OR_BLANK_CONTENT := 'veya boş';
                 mm.MSG_VALIDATE_PASSWORD         := 'Parola en az 8 karakter uzunluğunda olmalı, küçük harf, büyük harf, sayı ve özel karakterler içermelidir';
                 mm.MSG_VALIDATE_LENGTH_MIN       := 'En az %s karakter girin (sadece %s girdiniz)';
                 mm.MSG_VALIDATE_LENGTH_MAX       := 'Maksimum %s karakter girin ( %s girdiniz)';
              end;
          ltru_RU : begin
                 mm.MSG_VALIDATE_INVALID_EXISTS   := '«Запись уже существует».' ; // v. 4.0.0.5
                 mm.MSG_VALIDATE_INVALID_VALUE    := 'Введенный контент недействителен.' ; // v. 3.3.1.0
                 mm.MSG_VALIDATE_OR_BLANK_CONTENT := 'или пусто';
                 mm.MSG_VALIDATE_PASSWORD         := 'Пароль должен состоять минимум из 8 символов, содержать строчные и прописные буквы, цифры и специальные символы';
                 mm.MSG_VALIDATE_LENGTH_MIN       := 'Введите не менее %s символов (вы ввели только %s)';
                 mm.MSG_VALIDATE_LENGTH_MAX       := 'Введите максимум %s символов (вы ввели %s)';
              end;
       ltzn_CH : begin
                      mm.MSG_VALIDATE_INVALID_EXISTS   := 'Record already exists.' ; // v. 4.0.0.5
                      mm.MSG_VALIDATE_INVALID_VALUE    := 'Content entered is invalid.' ; // v. 3.3.1.0
                      mm.MSG_VALIDATE_BLANK_FIELD      := 'Field %s cannot be empty';
                      mm.MSG_VALIDATE_OR_BLANK_CONTENT := 'or blank';
                      mm.MSG_VALIDATE_PASSWORD         := 'The password must be at least 8 characters long, containing lowercase, uppercase, numbers and special characters';
                      mm.MSG_VALIDATE_LENGTH_MIN       := 'Enter at least %s characters ( you only entered %s )';
                      mm.MSG_VALIDATE_LENGTH_MAX       := 'Enter a maximum of %s characters ( you have entered %s )';
                 end;
       ltin_ID : begin
                      mm.MSG_VALIDATE_INVALID_EXISTS   := 'Record already exists.' ; // v. 4.0.0.5
                      mm.MSG_VALIDATE_INVALID_VALUE    := 'Content entered is invalid.' ; // v. 3.3.1.0
                      mm.MSG_VALIDATE_BLANK_FIELD      := 'Field %s cannot be empty';
                      mm.MSG_VALIDATE_OR_BLANK_CONTENT := 'or blank';
                      mm.MSG_VALIDATE_PASSWORD         := 'The password must be at least 8 characters long, containing lowercase, uppercase, numbers and special characters';
                      mm.MSG_VALIDATE_LENGTH_MIN       := 'Enter at least %s characters ( you only entered %s )';
                      mm.MSG_VALIDATE_LENGTH_MAX       := 'Enter a maximum of %s characters ( you have entered %s )';
                 end;
       ltth_TH : begin
                      mm.MSG_VALIDATE_INVALID_EXISTS   := 'Record already exists.' ; // v. 4.0.0.5
                      mm.MSG_VALIDATE_INVALID_VALUE    := 'Content entered is invalid.' ; // v. 3.3.1.0
                      mm.MSG_VALIDATE_BLANK_FIELD      := 'Field %s cannot be empty';
                      mm.MSG_VALIDATE_OR_BLANK_CONTENT := 'or blank';
                      mm.MSG_VALIDATE_PASSWORD         := 'The password must be at least 8 characters long, containing lowercase, uppercase, numbers and special characters';
                      mm.MSG_VALIDATE_LENGTH_MIN       := 'Enter at least %s characters ( you only entered %s )';
                      mm.MSG_VALIDATE_LENGTH_MAX       := 'Enter a maximum of %s characters ( you have entered %s )';
                 end;
       lthi_IN : begin
                      mm.MSG_VALIDATE_INVALID_EXISTS   := 'Record already exists.' ; // v. 4.0.0.5
                      mm.MSG_VALIDATE_INVALID_VALUE    := 'Content entered is invalid.' ; // v. 3.3.1.0
                      mm.MSG_VALIDATE_BLANK_FIELD      := 'Field %s cannot be empty';
                      mm.MSG_VALIDATE_OR_BLANK_CONTENT := 'or blank';
                      mm.MSG_VALIDATE_PASSWORD         := 'The password must be at least 8 characters long, containing lowercase, uppercase, numbers and special characters';
                      mm.MSG_VALIDATE_LENGTH_MIN       := 'Enter at least %s characters ( you only entered %s )';
                      mm.MSG_VALIDATE_LENGTH_MAX       := 'Enter a maximum of %s characters ( you have entered %s )';
                 end;
       ltar_SA : begin
                      mm.MSG_VALIDATE_INVALID_EXISTS   := 'السجل موجود من قبل' ; // v. 4.0.0.5
                      mm.MSG_VALIDATE_INVALID_VALUE    := 'فقط ' + mm.VALUE_YES + ' أو ' + mm.VALUE_NO + ' صالح' ; // v. 3.3.1.0
                      mm.MSG_VALIDATE_BLANK_FIELD      := 'لايمكن ان يكون فارغا %s المجال';
                      mm.MSG_VALIDATE_OR_BLANK_CONTENT := 'أو فارغة';
                      mm.MSG_VALIDATE_PASSWORD         := 'يجب أن تتكون كلمة المرور من 8 أحرف على الأقل ، وأن تحتوي على أحرف صغيرة وأحرف كبيرة وأرقام وأحرف خاصة';
                      mm.MSG_VALIDATE_LENGTH_MIN       := '(%s  أنت دخلت فقط ) حرف %s أدخل على الأقل ';
                      mm.MSG_VALIDATE_LENGTH_MAX       := '( %s لقد أدخلت) حرف %s أدخل كحد أقصى ';
                 end;
     end;
     // v. 3.3.0.0
     // MENU STRINGS
     case mm.varLT_Lang of
          ltpt_BR : begin
                   // menu groups
                   mm.MNU_BASICS              := 'BÁSICOS';
                   mm.MNU_MOVEMENT            := 'MOVIMENTO';
                   mm.MNU_REPORT              := 'RELATÓRIOS';
                   mm.MNU_TOOLS               := 'FERRAMENTAS';
                   mm.MNU_OTHERS              := 'OUTROS';

                   // menu options by group
                   mm.MNU_OTHERS_TRAINNING    := 'Treinamentos';
                   mm.MNU_OTHERS_SUPPORT      := 'SUPORTE';
                   mm.MNU_OTHERS_VIDEOS       := 'VIDEOS';
                   mm.MNU_OTHERS_GENERAL_INFO := 'INFORMAÇÕES GERAIS';
                   mm.MNU_OTHERS_OPEN_TICKET  := 'Abrir Chamado';
                   // menu tools
                   mm.MNU_TOOLS_SETTINGS      := 'CONFIGURAÇÕES';
                   mm.MNU_TOOLS_USERS         := 'Usuários';
                   mm.MNU_TOOLS_VERSIONS      := 'VERSÕES';
                   mm.MNU_TOOLS_UPDATE        := 'Log de Atualizações';
              end;
          lten_US, lten_GB: begin
                   // menu groups
                   mm.MNU_BASICS              := 'BASICS';
                   mm.MNU_MOVEMENT            := 'MOVIMENT';
                   mm.MNU_REPORT              := 'REPORTS';
                   mm.MNU_TOOLS               := 'TOOLS';
                   mm.MNU_OTHERS              := 'OTHERS';

                   // menu options by group
                   mm.MNU_OTHERS_TRAINNING    := 'Trainings';
                   mm.MNU_OTHERS_SUPPORT      := 'SUPPORT';
                   mm.MNU_OTHERS_VIDEOS       := 'VIDEOS';
                   mm.MNU_OTHERS_GENERAL_INFO := 'GENERAL INFO';
                   mm.MNU_OTHERS_OPEN_TICKET  := 'Open Ticket';
                   // menu tools
                   mm.MNU_TOOLS_SETTINGS      := 'SETTINGS';
                   mm.MNU_TOOLS_USERS         := 'Users';
                   mm.MNU_TOOLS_VERSIONS      := 'VERSIONS';
                   mm.MNU_TOOLS_UPDATE        := 'Update Log';
              end;
          ltes_ES: begin
                   // menu groups // v. 3.3.0.2
                   mm.MNU_BASICS   := 'BASICOS';
                   mm.MNU_MOVEMENT := 'MOVIMIENTO';
                   mm.MNU_REPORT   := 'REPORTES';
                   mm.MNU_TOOLS    := 'HERRAMIENTAS';
                   mm.MNU_OTHERS   := 'OTROS';
                   // menu options by group
                   mm.MNU_OTHERS_TRAINNING    := 'Entrenamientos';
                   mm.MNU_OTHERS_SUPPORT      := 'Soporte';
                   mm.MNU_OTHERS_VIDEOS       := 'Videos';
                   mm.MNU_OTHERS_GENERAL_INFO := 'Informaciones Generales';
                   mm.MNU_OTHERS_OPEN_TICKET  := 'Llamada Abierta';
                   //menu tools
                   mm.MNU_TOOLS_SETTINGS      := 'Configuración';
                   mm.MNU_TOOLS_USERS         := 'Usuarios';
                   mm.MNU_TOOLS_VERSIONS      := 'Versiones';
                   mm.MNU_TOOLS_UPDATE        := 'Actualizar registro';
              end;
        ltfr_FR: begin
              // menu groups
              mm.MNU_BASICS              := 'BASICS';
              mm.MNU_MOVEMENT            := 'MOVIMENT';
              mm.MNU_REPORT              := 'RAPPORTS';
              mm.MNU_TOOLS               := 'OUTILS';
              mm.MNU_OTHERS              := 'AUTRES';

              // options de menu par groupe
              mm.MNU_OTHERS_TRAINNING    := 'Formations';
              mm.MNU_OTHERS_SUPPORT      := 'SUPPORT';
              mm.MNU_OTHERS_VIDEOS       := 'VIDEOS';
              mm.MNU_OTHERS_GENERAL_INFO := 'GENERAL INFO';
              mm.MNU_OTHERS_OPEN_TICKET  := 'Billet ouvert';
              // outils de menus
              mm.MNU_TOOLS_SETTINGS      := 'PARAMETRES';
              mm.MNU_TOOLS_USERS         := 'Utilisateurs';
              mm.MNU_TOOLS_VERSIONS      := 'VERSIONS';
              mm.MNU_TOOLS_UPDATE        := 'Journal de mise à jour' ;
            end;
        ltde_DE: begin
              // menu groups
              mm.MNU_BASICS              := 'GRUNDLAGEN';
              mm.MNU_MOVEMENT            := 'MOVIMENT';
              mm.MNU_REPORT              := 'BERICHTE';
              mm.MNU_TOOLS               := 'WERKZEUGE';
              mm.MNU_OTHERS              := 'OTHERS';

              // Menüoptionen nach Gruppe
              mm.MNU_OTHERS_TRAINNING    := 'Schulungen';
              mm.MNU_OTHERS_SUPPORT      := 'UNTERSTÜTZUNG';
              mm.MNU_OTHERS_VIDEOS       := 'VIDEOS';
              mm.MNU_OTHERS_GENERAL_INFO := 'ALLGEMEINE INFO';
              mm.MNU_OTHERS_OPEN_TICKET  := 'Ticket öffnen';
              // Menüwerkzeuge
              mm.MNU_TOOLS_SETTINGS      := 'EINSTELLUNGEN';
              mm.MNU_TOOLS_USERS         := 'Benutzer';
              mm.MNU_TOOLS_VERSIONS      := 'VERSIONEN';
              mm.MNU_TOOLS_UPDATE        := 'Protokoll aktualisieren';
            end;
        ltit_IT: begin
              // menu groups
              mm.MNU_BASICS              := 'BASICS';
              mm.MNU_MOVEMENT            := 'MOVIMENT';
              mm.MNU_REPORT              := 'REPORT';
              mm.MNU_TOOLS               := 'STRUMENTI';
              mm.MNU_OTHERS              := 'ALTRI';

              // opzioni di menu per gruppo
              mm.MNU_OTHERS_TRAINNING    := 'Allenamento';
              mm.MNU_OTHERS_SUPPORT      := 'SUPPORTO';
              mm.MNU_OTHERS_VIDEOS       := 'VIDEO';
              mm.MNU_OTHERS_GENERAL_INFO := 'INFO GENERALI';
              mm.MNU_OTHERS_OPEN_TICKET  := 'Apri biglietto';
              // strumenti del menu
              mm.MNU_TOOLS_SETTINGS      := 'IMPOSTAZIONI';
              mm.MNU_TOOLS_USERS         := 'Utenti';
              mm.MNU_TOOLS_VERSIONS      := 'VERSIONI';
              mm.MNU_TOOLS_UPDATE        := 'Registro aggiornamenti';
            end;
        lttr_TR : begin
              // menu groups
              mm.MNU_BASICS              := 'TEMELLER';
              mm.MNU_MOVEMENT            := 'HAREKET';
              mm.MNU_REPORT              := 'RAPORLAR';
              mm.MNU_TOOLS               := 'ARAÇLAR';
              mm.MNU_OTHERS              := 'DİĞERLER';

              // gruba göre menü seçenekleri
              mm.MNU_OTHERS_TRAINNING    := 'Eğitimler';
              mm.MNU_OTHERS_SUPPORT      := 'DESTEK';
              mm.MNU_OTHERS_VIDEOS       := 'VİDEOLAR';
              mm.MNU_OTHERS_GENERAL_INFO := 'GENEL BİLGİ';
              mm.MNU_OTHERS_OPEN_TICKET  := 'Bilet Aç';
              // menü araçları
              mm.MNU_TOOLS_SETTINGS      := 'AYARLAR';
              mm.MNU_TOOLS_USERS         := 'Kullanıcılar';
              mm.MNU_TOOLS_VERSIONS      := 'SÜRÜMLER';
              mm.MNU_TOOLS_UPDATE        := 'Güncelleme Günlüğü';
            end;
        ltru_RU : begin
                   // menu groups
                   mm.MNU_BASICS              := 'ОСНОВЫ';
                   mm.MNU_MOVEMENT            := 'ДВИЖЕНИЕ';
                   mm.MNU_REPORT              := 'ОТЧЕТЫ';
                   mm.MNU_TOOLS               := 'ИНСТРУМЕНТЫ';
                   mm.MNU_OTHERS              := 'ДРУГИЕ';

                   // опции меню по группам
                   mm.MNU_OTHERS_TRAINNING    := 'Тренинги';
                   mm.MNU_OTHERS_SUPPORT      := 'ПОДДЕРЖКА';
                   mm.MNU_OTHERS_VIDEOS       := 'ВИДЕО';
                   mm.MNU_OTHERS_GENERAL_INFO := 'ОБЩАЯ ИНФОРМАЦИЯ';
                   mm.MNU_OTHERS_OPEN_TICKET  := 'Открыть тикет';
                   // инструменты меню
                   mm.MNU_TOOLS_SETTINGS      := 'НАСТРОЙКИ';
                   mm.MNU_TOOLS_USERS         := 'Пользователи';
                   mm.MNU_TOOLS_VERSIONS      := 'ВЕРСИИ';
                   mm.MNU_TOOLS_UPDATE        := 'Журнал обновлений';
            end;
       ltzn_CH : begin
                   // menu groups
                   mm.MNU_BASICS              := 'BASICS';
                   mm.MNU_MOVEMENT            := 'MOVIMENT';
                   mm.MNU_REPORT              := 'REPORTS';
                   mm.MNU_TOOLS               := 'TOOLS';
                   mm.MNU_OTHERS              := 'OTHERS';

                   // menu options by group
                   mm.MNU_OTHERS_TRAINNING    := 'Trainings';
                   mm.MNU_OTHERS_SUPPORT      := 'SUPPORT';
                   mm.MNU_OTHERS_VIDEOS       := 'VIDEOS';
                   mm.MNU_OTHERS_GENERAL_INFO := 'GENERAL INFO';
                   mm.MNU_OTHERS_OPEN_TICKET  := 'Open Ticket';
                   //menu tools
                   mm.MNU_TOOLS_SETTINGS      := 'AJUSTES';
                   mm.MNU_TOOLS_USERS         := 'Usuarios';
                   mm.MNU_TOOLS_VERSIONS      := 'VERSIONES';
                   mm.MNU_TOOLS_UPDATE        := 'Actualizar registro';
                 end;
       ltin_ID : begin
                   // menu groups
                   mm.MNU_BASICS              := 'BASICS';
                   mm.MNU_MOVEMENT            := 'MOVIMENT';
                   mm.MNU_REPORT              := 'REPORTS';
                   mm.MNU_TOOLS               := 'TOOLS';
                   mm.MNU_OTHERS              := 'OTHERS';

                   // menu options by group
                   mm.MNU_OTHERS_TRAINNING    := 'Trainings';
                   mm.MNU_OTHERS_SUPPORT      := 'SUPPORT';
                   mm.MNU_OTHERS_VIDEOS       := 'VIDEOS';
                   mm.MNU_OTHERS_GENERAL_INFO := 'GENERAL INFO';
                   mm.MNU_OTHERS_OPEN_TICKET  := 'Open Ticket';
                   //menu tools
                   mm.MNU_TOOLS_SETTINGS      := 'AJUSTES';
                   mm.MNU_TOOLS_USERS         := 'Usuarios';
                   mm.MNU_TOOLS_VERSIONS      := 'VERSIONES';
                   mm.MNU_TOOLS_UPDATE        := 'Actualizar registro';
                 end;
       ltth_TH : begin
                   // menu groups
                   mm.MNU_BASICS              := 'BASICS';
                   mm.MNU_MOVEMENT            := 'MOVIMENT';
                   mm.MNU_REPORT              := 'REPORTS';
                   mm.MNU_TOOLS               := 'TOOLS';
                   mm.MNU_OTHERS              := 'OTHERS';

                   // menu options by group
                   mm.MNU_OTHERS_TRAINNING    := 'Trainings';
                   mm.MNU_OTHERS_SUPPORT      := 'SUPPORT';
                   mm.MNU_OTHERS_VIDEOS       := 'VIDEOS';
                   mm.MNU_OTHERS_GENERAL_INFO := 'GENERAL INFO';
                   mm.MNU_OTHERS_OPEN_TICKET  := 'Open Ticket';
                   //menu tools
                   mm.MNU_TOOLS_SETTINGS      := 'AJUSTES';
                   mm.MNU_TOOLS_USERS         := 'Usuarios';
                   mm.MNU_TOOLS_VERSIONS      := 'VERSIONES';
                   mm.MNU_TOOLS_UPDATE        := 'Actualizar registro';
                 end;
       lthi_IN : begin
                   // menu groups
                   mm.MNU_BASICS              := 'BASICS';
                   mm.MNU_MOVEMENT            := 'MOVIMENT';
                   mm.MNU_REPORT              := 'REPORTS';
                   mm.MNU_TOOLS               := 'TOOLS';
                   mm.MNU_OTHERS              := 'OTHERS';

                   // menu options by group
                   mm.MNU_OTHERS_TRAINNING    := 'Trainings';
                   mm.MNU_OTHERS_SUPPORT      := 'SUPPORT';
                   mm.MNU_OTHERS_VIDEOS       := 'VIDEOS';
                   mm.MNU_OTHERS_GENERAL_INFO := 'GENERAL INFO';
                   mm.MNU_OTHERS_OPEN_TICKET  := 'Open Ticket';
                   //menu tools
                   mm.MNU_TOOLS_SETTINGS      := 'AJUSTES';
                   mm.MNU_TOOLS_USERS         := 'Usuarios';
                   mm.MNU_TOOLS_VERSIONS      := 'VERSIONES';
                   mm.MNU_TOOLS_UPDATE        := 'Actualizar registro';
                 end;
       ltar_SA : begin
                   // menu groups
                   mm.MNU_BASICS              := 'الأساسيات';
                   mm.MNU_MOVEMENT            := 'حركة';
                   mm.MNU_REPORT              := 'تقارير';
                   mm.MNU_TOOLS               := 'أدوات';
                   mm.MNU_OTHERS              := 'الآخرين';

                   // menu options by group
                   mm.MNU_OTHERS_TRAINNING    := 'التدريبات';
                   mm.MNU_OTHERS_SUPPORT      := 'الدعم';
                   mm.MNU_OTHERS_VIDEOS       := 'فيديو';
                   mm.MNU_OTHERS_GENERAL_INFO := 'معلومات عامة';
                   mm.MNU_OTHERS_OPEN_TICKET  := 'افتح تذكرة';
                   // menu tools
                   mm.MNU_TOOLS_SETTINGS      := 'إعدادات';
                   mm.MNU_TOOLS_USERS         := 'أعضاء';
                   mm.MNU_TOOLS_VERSIONS      := 'إصدارات';
                   mm.MNU_TOOLS_UPDATE        := 'سجل التحديثات';
                 end;
     end;
end;

procedure rc_Translate( pForm, pObj : TObject; pProp, pLang : string );
var
   cFile, cFormFrame, cFormFrameParent,
   cTemp, cTemp2, cString, cLang1, cLang2,
   cHint, cListGridFields, cHintReverse,
   oObjTranslate : String;
   cTempUtf8 : UTF8String;
   IniFile : TMemIniFile;// TIniFile; // v. 3.3.0.0

   iPos, i, f, l1, l2 : integer;

   oObjFormFrame,
   oObj : TUniControl;
   oComp : TComponent;

   cItem : TMenuItem;
begin
     IniFile := nil;
     // v. 4.0.0.0
     if mm.varB_RCFoldersMissing then
     begin
          raise Exception.Create( APP_NAME + ' default folders not found. Do not proceed.');
     end;
     UniSession.SuspendLayouts; // v. 4.0.0.0
     try
        cFormFrame := lowercase( TComponent( pForm ).Name );

        if Pos( '__', cFormFrame ) > 0 then
           cFormFrame := Copy( cFormFrame, 1, Pos( '__', cFormFrame ) - 1 );

        for l2 := 1 to high( ARRAY_LANGUAGES ) do
        begin
            cLang2 := ARRAY_LANGUAGES [ l2 ];
            cFile  := sm.FilesFolderPath + 'translate' + BACKSLASH + cLang2 + BACKSLASH + cFormFrame + '.ini';
            //cFile  := 'files/translate' + BACKSLASH + cLang2 + BACKSLASH + cFormFrame + '.ini';

            //atualiza lista...
            try
              if cFile <> '' then
              begin
                   if not DirectoryExists( sm.FilesFolderPath + 'translate' + BACKSLASH + cLang2 ) then
                      dm_rc.rc_ForceDirectories( sm.FilesFolderPath + 'translate' + BACKSLASH + cLang2 );
              end;

              IniFile := TMemIniFile.Create( cFile, TEncoding.UTF8 ); // v. 3.3.0.0

              oObjFormFrame := TUniControl( pForm );

              for I := 0 to oObjFormFrame.ComponentCount - 1 do
              begin
                   oComp := oObjFormFrame.Components[ i ];

                   if pos( 'labwelcome' , lowercase( oComp.Name ) ) > 0  then
                      cTemp := cTemp;

                   // v. 4.0.0.0
                   If ( Pos( 'TAction' , oComp.ClassName ) = 0 ) and ( Pos( 'THelp' , oComp.ClassName ) = 0 ) then
                   If GetPropInfo( oComp.ClassInfo, 'hint') <> nil then
                   begin
                      cHint := rc_NormalizeHintProperty( TUniControl( oComp ).Hint );

                      try//lkpfilter-empty:Selecione uma UF<translate>|
                         // v. 3.3.1.0
                         if ( oComp.Name <> '' ) and
                            ( ( rc_PosHintProperty( 'translate:' , cHint ) > 0 ) or
                              ( Pos( ':translate(' , cHint ) > 0 )  or
                              ( Pos( '<translate>' , cHint ) > 0 ) ) then
                         begin
                            // form.comp.prop
                            cTemp := oObjFormFrame.ClassName + '.' + oComp.Name;

                            // dbgrid columns
                            if Pos( ':translate(' , cHint ) > 0 then
                            begin
                                 cHintReverse := cHint;

                                 while Pos( ':translate(', cHintReverse ) > 0 do
                                 begin
                                      // v. 3.3.0.0
                                      iPos := Pos( 'title:translate(', cHintReverse );
                                      if iPos > 0 then
                                      begin
                                         iPos   := iPos + 16;
                                         cTemp2 := Copy( cHintReverse, iPos, 2000 );
                                         cTemp2 := Copy( cTemp2, 1, Pos( ')', cTemp2 ) - 1 );

                                         cListGridFields := IniFile.ReadString( 'grid-col-caption' , cTemp + '.' + cTemp2 , '' );
                                         //cListGridFields := Utf8ToAnsi( IniFile.ReadString( 'grid-col-caption' , cTemp + '.' + cTemp2 , '' ) );
                                         //cListGridFields := UTF8ToWideString( IniFile.ReadString( 'grid-col-caption' , cTemp + '.' + cTemp2 , '' ) );

                                         // v. 3.3.0.0
                                         if cListGridFields.isEmpty then
                                            cListGridFields := uppercase( cTemp2 );
                                         //if cListGridFields <> '' then
                                         begin
                                            cTempUtf8 := AnsiToUtf8( cListGridFields );
                                            IniFile.WriteString( 'grid-col-caption' , cTemp + '.' + cTemp2 , cTempUtf8 );
                                         end;

                                         cHintReverse := Copy( cHintReverse, iPos + 6, 2000 );
                                      end
                                      else
                                      begin
                                         iPos := Pos( 'grid-header:translate(', cHintReverse );
                                         if iPos > 0 then
                                         begin
                                            iPos   := iPos + 22;
                                            //cTemp2 := Copy( cHintReverse, iPos, 2000 );
                                            //cTemp2 := Copy( cTemp2, 1, Pos( ')', cTemp2 ) - 1 );
                                            cString := IniFile.ReadString( 'grid-header' , cTemp , '' );
                                            cTemp2 := TUniDBGrid( oComp ).HeaderTitle;
                                            //cListGridFields := IniFile.ReadString( 'grid-header' , cTemp , '' );
                                            //if cListGridFields.isEmpty then
                                            //   cListGridFields := uppercase( cTemp2 );
                                            if ( cString = '' ) and ( cTemp2 <> '' ) then
                                            begin
                                               cTempUtf8 := AnsiToUtf8( cTemp2 );
                                               //IniFile.WriteString( 'grid-header-caption' , cTemp + '.' + cTemp2 , cTempUtf8 );
                                               IniFile.WriteString( 'grid-header' , cTemp  , cTempUtf8 );
                                            end;
                                            cHintReverse := Copy( cHintReverse, iPos + 7, 2000 );
                                         end;
                                      end;
                                 end;
                            end
                            else
                            // lkpfilter-empty:message
                            if ( Pos( 'lkpfilter-empty:' , cHint ) > 0 ) and ( Pos( '<translate>' , cHint ) > 0 ) then
                            begin
                                 cHintReverse := rc_GetHintProperty( 'lkpfilter-empty:', cHint );
                                 cHintReverse := StringReplace( cHintReverse, '<translate>', '', [rfReplaceAll] );
                                 cString      := IniFile.ReadString( 'lkpfilter-empty' , cTemp , '' );

                                 if ( cString = '' ) and ( cHintReverse <> '' ) then
                                 begin
                                    cTempUtf8 := AnsiToUtf8( cHintReverse );
                                    IniFile.WriteString( 'lkpfilter-empty' , cTemp , cTempUtf8 );
                                 end;
                            end;

                            If ( GetPropInfo( oComp.ClassInfo, 'caption') <> nil ) and ( Pos( 'translate:except-caption' , cHint ) = 0 ) then
                            begin
                               cString := IniFile.ReadString( 'caption' , cTemp , '' );

                               if oComp is TUniMenuItem then
                               begin
                                  if ( cString = '' ) and ( TUniMenuItem( oComp ).Caption <> '' ) then
                                  begin
                                     cTempUtf8 := AnsiToUtf8( TUniMenuItem( oComp ).Caption );
                                     IniFile.WriteString( 'caption' , cTemp  , cTempUtf8 );
                                  end;
                               end
                               else
                               if ( cString = '' ) and ( TUniControl( oComp ).Caption <> '' ) then
                               begin
                                  cTempUtf8 := AnsiToUtf8( TUniControl( oComp ).Caption );
                                  IniFile.WriteString( 'caption' , cTemp  , cTempUtf8 );
                               end;
                            end;

                            If ( GetPropInfo( oComp.ClassInfo, 'emptytext') <> nil ) and ( Pos( 'translate:except-emptytext' , cHint ) = 0 ) then
                            begin
                               cString := IniFile.ReadString( 'emptytext' , cTemp , '' );

                               if ( cString = '' ) and ( TUniEdit( oComp ).EmptyText <> '' ) then
                               begin
                                  cTempUtf8 := AnsiToUtf8( TUniEdit( oComp ).EmptyText );
                                  IniFile.WriteString( 'emptytext' , cTemp , cTempUtf8 );
                               end;
                            end;

                            If ( GetPropInfo( oComp.ClassInfo, 'text') <> nil ) and ( Pos( 'translate:except-text' , cHint ) = 0 ) then
                            begin
                               cString := IniFile.ReadString( 'text' , cTemp , '' );

                               if ( cString = '' ) and ( TUniEdit( oComp ).Text <> '') then
                               begin
                                  cTempUtf8 := AnsiToUtf8( TUniEdit( oComp ).Text );
                                  IniFile.WriteString( 'text' , cTemp , cTempUtf8 );
                               end;
                            end;

                            If ( GetPropInfo( oComp.ClassInfo, 'screenmask') <> nil ) and ( Pos( 'translate:except-screenmask.message' , cHint ) = 0 ) then
                            begin
                               cString := IniFile.ReadString( 'screenmask.message' , cTemp , '' );

                               if oComp is TUniPopupMenu then
                               begin
                                  if ( cString = '' ) and ( TUniPopupMenu( oComp ).ScreenMask.Message <> '' ) then
                                  begin
                                     cTempUtf8 := AnsiToUtf8( TUniPopupMenu( oComp ).ScreenMask.Message );
                                     IniFile.WriteString( 'caption' , cTemp  , cTempUtf8 );
                                  end;
                               end
                               else
                                   if ( cString = '' ) and ( TUniControl( oComp ).ScreenMask.Message <> '' ) then
                                   begin
                                      cTempUtf8 := AnsiToUtf8( TUniControl( oComp ).ScreenMask.Message );
                                      IniFile.WriteString( 'screenmask.message' , cTemp , cTempUtf8 );
                                   end;
                            end;

                            If ( GetPropInfo( oComp.ClassInfo, 'items') <> nil ) and ( Pos( 'translate:except-items' , cHint ) = 0 ) then
                            begin
                               if oComp is TUniComboBox then
                               begin
                                  for f := 0 to TUniCombobox( oComp ).Items.Count - 1 do
                                  begin
                                      cString := IniFile.ReadString( 'items' , cTemp + '.[' + f.ToString + ']' , '' );

                                      if cString = '' then
                                      begin
                                         cTempUtf8 := AnsiToUtf8( TUniCombobox( oComp ).Items[ f ] );
                                         IniFile.WriteString( 'items' , cTemp + '.[' + f.ToString + ']' , cTempUtf8 );
                                      end;
                                  end;
                               end
                               else
                               if oComp is TUniTreeMenu then
                               begin
                                  for f := 0 to TUniTreeMenu( oComp ).Items.Count - 1 do
                                  begin
                                      cString := IniFile.ReadString( 'items' , cTemp + '.[' + f.ToString + ']' , '' );

                                      if cString = '' then
                                      begin
                                         cTempUtf8 := AnsiToUtf8( TUniTreeMenu( oComp ).Items[ f ].Text );
                                         IniFile.WriteString( 'items' , cTemp + '.[' + f.ToString + ']' , cTempUtf8 );
                                      end;
                                  end;
                               end
                               else
                               if oComp is TUniPopupMenu then
                               begin


                               end;
                            end;
                         end;
                      except on e:exception do
                             begin
                                  dm_rc.rc_ShowError( 'rc_Translate( 1 ):[i:' + i.ToString + ' ' + oComp.Name );
                             end;
                      end;
                   end;
              end;
              //IniFile.UpdateFile; // v. 4.0.0.0
            finally
              IniFile.Free;
            end;
        end;

        // active language
        cFile := sm.FilesFolderPath + 'translate' + BACKSLASH + pLang + BACKSLASH + cFormFrame + '.ini';

        if FileExists( cFile ) then
        begin
             try
               IniFile := TMemIniFile.Create( cFile, TEncoding.UTF8 ); // v. 3.3.0.0

               oObjFormFrame := TUniControl( pForm );

               for I := 0 to oObjFormFrame.ComponentCount - 1 do
               begin
                   oComp := oObjFormFrame.Components[ i ];

                   // v. 4.0.0.0
                   If ( Pos( 'TAction' , oComp.ClassName ) = 0 ) and ( Pos( 'THelp' , oComp.ClassName ) = 0 ) then
                   If GetPropInfo( oComp.ClassInfo, 'hint') <> nil then
                   begin
                       cHint := rc_NormalizeHintProperty( TUniControl( oComp ).Hint );

                       try
                          // v. 3.3.1.0
                          if ( oComp.Name <> '' ) and
                             ( ( rc_PosHintProperty( 'translate:' , cHint ) > 0 ) or
                               ( Pos( ':translate(' , cHint ) > 0 ) or
                               ( Pos( '<translate>' , cHint ) > 0 ) ) then
                          begin
                              cTemp := oObjFormFrame.ClassName + '.' + oComp.Name;

                              // dbgrid columns
                              if Pos( ':translate(' , cHint ) > 0 then
                              begin
                                   cHintReverse := cHint;

                                   while Pos( ':translate(', cHintReverse ) > 0 do
                                   begin
                                        // v. 3.3.0.0
                                        iPos := Pos( 'title:translate(', cHintReverse );
                                        if iPos > 0 then
                                        begin
                                           iPos := iPos + 16;
                                           cTemp2 := Copy( cHintReverse, iPos, 2000 );
                                           cTemp2 := Copy( cTemp2, 1, Pos( ')', cTemp2 ) - 1 );

                                           if cTemp2 <> '' then
                                           begin
                                              cTempUtf8 := AnsiToUtf8( cTemp2 );
                                              cListGridFields := IniFile.ReadString( 'grid-col-caption' , cTemp + '.' + cTemp2 , cTempUtf8 );
                                           end;

                                           cHint := StringReplace( cHint, 'title:translate(' + cTemp2 + ')' , 'title:' + cListGridFields, [rfReplaceAll] );
                                           cHintReverse := Copy( cHintReverse, iPos + 6, 2000 );
                                        end
                                        else
                                        begin
                                           iPos := Pos( 'grid-header:translate(', cHintReverse );
                                           if iPos > 0 then
                                           begin
                                              iPos := iPos + 22;
                                              //cTemp2 := Copy( cHintReverse, iPos, 2000 );
                                              //cTemp2 := Copy( cTemp2, 1, Pos( ')', cTemp2 ) - 1 );
                                              cTemp2 := TUniDBGrid( oComp ).HeaderTitle;
                                              //if cTemp2 <> '' then
                                              begin
                                                 cTempUtf8 := AnsiToUtf8( cTemp2 );
                                                 //cListGridFields := IniFile.ReadString( 'grid-header-caption' , cTemp + '.' + cTemp2 , cTempUtf8 );
                                                 TUniDBGrid( oComp ).HeaderTitle := IniFile.ReadString( 'grid-header' , cTemp , cTempUtf8 );
                                              end;

                                              cHint := StringReplace( cHint, 'grid-header:translate(' + cTemp2 + ')' , 'grid-header:' + cListGridFields, [rfReplaceAll] );
                                              cHintReverse := Copy( cHintReverse, iPos + 7, 2000 );
                                           end
                                        end;

                                   end;

                                   TUniControl( oComp ).Hint := cHint;
                              end
                              else
                              // lkpfilter-empty:message
                              if ( Pos( 'lkpfilter-empty:' , cHint ) > 0 ) and ( Pos( '<translate>' , cHint ) > 0 ) then
                              begin
                                   cHintReverse := rc_GetHintProperty( 'lkpfilter-empty:', cHint );
                                   cHintReverse := StringReplace( cHintReverse, '<translate>', '', [rfReplaceAll] );
                                   cTempUtf8 := AnsiToUtf8( cHintReverse );
                                   cHintReverse := IniFile.ReadString( 'lkpfilter-empty' , cTemp , cTempUtf8 );
                                   cTempUtf8 := AnsiToUtf8( cHintReverse );
                                   TUniControl( oComp ).Hint := rc_SetHintProperty( cTempUtf8 + '<translate>', 'lkpfilter-empty:', TUniControl( oComp ).Hint);
                              end;

                              If ( GetPropInfo( oComp.ClassInfo, 'caption') <> nil ) and ( Pos( 'translate:except-caption' , cHint ) = 0 ) then
                              begin
                                  if oComp is TUniMenuItem then
                                  begin
                                     cTempUtf8 := AnsiToUtf8( TUniMenuItem( oComp ).Caption );
                                     TUniMenuItem( oComp ).Caption := ( IniFile.ReadString( 'caption' , cTemp , cTempUtf8 ) );
                                  end
                                  else
                                  begin
                                     cTempUtf8 := AnsiToUtf8( TUniControl( oComp ).Caption );
                                     TUniControl( oComp ).Caption := IniFile.ReadString( 'caption' , cTemp , cTempUtf8 );
                                  end;
                              end;

                              If ( GetPropInfo( oComp.ClassInfo, 'emptytext') <> nil ) and ( Pos( 'translate:except-emptytext' , cHint ) = 0 ) then
                              begin
                                 cTempUtf8 := AnsiToUtf8( TUniEdit( oComp ).EmptyText );
                                 TUniEdit( oComp ).EmptyText := IniFile.ReadString( 'emptytext' , cTemp , cTempUtf8 );
                              end;

                              If ( GetPropInfo( oComp.ClassInfo, 'text') <> nil ) and ( Pos( 'translate:except-text' , cHint ) = 0 ) then
                              begin
                                 cTempUtf8 := AnsiToUtf8( TUniEdit( oComp ).Text );
                                 TUniEdit( oComp ).Text := IniFile.ReadString( 'text' , cTemp , cTempUtf8 );
                              end;

                              If GetPropInfo( oComp.ClassInfo, 'screenmask') <> nil then
                              begin
                                  if oComp is TUniPopupMenu then
                                  begin
                                     cTempUtf8 := AnsiToUtf8( TUniPopupMenu( oComp ).ScreenMask.Message );
                                     TUniPopupMenu( oComp ).ScreenMask.Message := IniFile.ReadString( 'caption' , cTemp , cTempUtf8 );
                                  end
                                  else
                                  If ( Pos( 'translate:except-screenmask.message' , cHint ) = 0 ) then
                                  begin
                                     cTempUtf8 := AnsiToUtf8( TUniControl( oComp ).ScreenMask.Message );
                                     TUniControl( oComp ).ScreenMask.Message := IniFile.ReadString( 'screenmask.message' , cTemp , cTempUtf8 );
                                  end;
                              end;

                              If ( GetPropInfo( oComp.ClassInfo, 'items') <> nil ) and ( Pos( 'translate:items' , cHint ) = 0 ) then
                              begin
                                 if oComp is TUniComboBox then
                                 begin
                                    for f := 0 to TUniCombobox( oComp ).Items.Count - 1 do
                                    begin
                                         cTempUtf8 := AnsiToUtf8( TUniCombobox( oComp ).Items[ f ] );
                                         TUniCombobox( oComp ).Items[ f ] := IniFile.ReadString( 'items' , cTemp + '.[' + f.ToString + ']' , cTempUtf8 );
                                    end;
                                 end
                                 else
                                 if oComp is TUniTreeMenu then
                                 begin
                                    for f := 0 to TUniTreeMenu( oComp ).Items.Count - 1 do
                                    begin
                                         cTempUtf8 := AnsiToUtf8( TUniTreeMenu( oComp ).Items[ f ].Text );
                                         TUniTreeMenu( oComp ).Items[ f ].Text := IniFile.ReadString( 'items' , cTemp + '.[' + f.ToString + ']' , cTempUtf8 );
                                    end;
                                 end;
                              end;
                          end;
                       except on e:exception do
                              begin
                                   dm_rc.rc_ShowError( 'rc_Translate( 2 ):[i:' + i.ToString + ' ' + oComp.Name );
                              end;
                       end;
                   end;
               end;
               //IniFile.UpdateFile; // v. 4.0.0.0
             finally
               IniFile.Free;
             end;
        end;
     finally
           UniSession.ResumeLayouts; // v. 4.0.0.0
     end;
end;
end.
