unit uconsts; // v. 3.3.0.0


interface

uses

  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

Type

  TRCRGPParamType  = ( rptSEQ, rptVALUE, rptFIELD );
  TRCValidateTypes = ( vtNotBlank, vtNumbers, vtLetters, vtEmail, vtIP, vtDATE, vtTIME, vtPASS, vtCNPJ, vtCPF, vtCEP ); // v. 4.0.0.6
  TRCMaskType      = ( mtUNMASK, mtCNPJ, mtCPF, mtPHONE, mtPHONEDDD, mtDATE, mtCEP, mtCARPLATE );
  TRCGraphType     = ( gtPIE, gtDOUGHNUT);
  TRCGraphColor    = ( gcRainbow, gcInferno, gcMagma, gcPurples, gcGreens, gcReds, gcRandom );

  TRCGSAPEase      = ( gsEaseNone, gsEasePower1, gsEasePower2, gsEasePower3, gsEasePower4, gsEaseBack,
                       gsEaseElastic, gsEaseBounce, gsEaseRough, gsEaseSlow, gsEaseSteps, gsEaseCirc, gsEaseExpo, gsEaseSine );
  TRCGSAPEaseType  = ( gsEaseTypeIn, gsEaseTypeOut, gsEaseTypeInOut );

  // I'm trying to make rc_translate accessible to everyone. I cannot guarantee that the translations are perfect.
  // I appreciate your help in possible corrections of the text and / or additional translations.
  TRCLanguagesType = ( ltUNDEF,  // Can be used for another translate tool/component associated with an indexed string, for example: MNU[0] like tsLang...
                       ltpt_BR,  // Portuguese( Brazil )
                       ltpt_PT,  // Português Portugal
                       lten_US,  // English US
                       lten_GB,  // English BRITISH // v. 3.3.0.0
                       ltes_ES,  // Spanish
                       ltfr_FR,  // French
                       ltde_DE,  // German
                       ltit_IT,  // Italian
                       lttr_TR,  // Turkish
                       ltru_RU,  // Russian
                       ltzn_CH,  // Chinese
                       ltin_ID,  // Indonesian
                       ltth_TH,  // Thailand
                       lthi_IN,  // Indian
                       ltar_SA      // Arabic
                       );

  TRCExportType    = ( etExcel, etHTML, etXML, etCSV );

  TRCAddFormParamType  = ( aftNone, aftShow, aftEdit, aftInsert, aftShowReg ); // v. 3.4.0.0
  // v. 3.4.0.0
  TRCCalloutTheme  = (ctDefault, ctCartoon, ctFancyBlue, ctGray, ctYellow, ctDanger, ctWarning, ctSuccess, ctInfo);
  TRCCalloutArrow  = (carTop, carBottom, carRight, carRight_Top, carRight_Bottom, carLeft, carLeft_Top, carLeft_Bottom, carBottom_Right, carBottom_Left, carTop_Right, carTop_Left);
  TRCCalloutRelPos = (crpC_C, crpT_B, crpB_T, crpL_R, crpR_L, crpT_T, crpB_B, crpL_L, crpR_R, crpTR_BL, crpTL_BR, crpBL_TR, crpBR_TL);


  //TRCSwtAlertType = ( swtSuccess, swtInfo, swtWarning, swtError, swtQuestion ) ;
//resourcestring


const

  // As constantes são usadas na formação de alguns parâmetros e mensagens
  // Constants are used in the formation of some parameters and messages

  //dados do SEU aplicativo
  //
  APP_NAME                            = 'RadCORE WEB';

  //APLICATIVO_VERSAO                 = '2019.01.00.01';
  APP_NAME_VERSION                    = APP_NAME ;

  //porta padrao pra rodar a aplicação
  APP_PORT                            = '8075';

  //APP_BD_SQLITE                       = APP_NAME ;//+ '_local.db';
  //APP_BD_STRUCTURE                    = APP_NAME + '_estru.db';

  BD_POOLED                           = true;

  // If you don´t use this..Put '' or only "T" or your prefix default
  FRM_CLASS_PREFIX                    = 'TFRM';
  FRM_CLASS_CRUD_PREFIX               = 'TFRMCAD';
  // File Extensions
  APP_FILETYPES                       = '*.jpg;*.rar;*.zip*.pdf';


  // PERMISSIONS TYPE
  PT_ACCESS = 1;
  PT_INSERT = 2;
  PT_EDIT   = 3;
  PT_DELETE = 4;
  //PT_HIDDEN = 5; // v. 4.0.0.0

  //dados da SUA empresa
  //
  // ao ser executado pela primeira vez o RADCORE cria TODA a estrutura de pastas
  // para ORGANIZAR seus sistemas seguindo o modelo abaixo:
  //
  SOFTWAREHOUSE_NAME                  = 'Mikromundo Sistemas';
  SOFTWAREHOUSE_CNPJ                  = '08817253000164';

  SOFTWAREHOUSE_COMMERCIAL_PHONE      = '(85) 3085-8611' ;
  SOFTWAREHOUSE_FINANCIAL_PHONE       = '(85) 3085-8611' ;
  SOFTWAREHOUSE_SUPPORT_PHONE         = '(85) 3085-8611' ;

  SOFTWAREHOUSE_COMMERCIAL_EMAIL      = 'mikromundo@gmail.com';
  SOFTWAREHOUSE_COMMERCIAL_EMAIL_PASS = '';
  SOFTWAREHOUSE_FINANCIAL_EMAIL       = 'financeiro@mikromundo.com.br';
  SOFTWAREHOUSE_FINANCIAL_EMAIL_PASS  = '';
  SOFTWAREHOUSE_SUPPORT_EMAIL         = 'nautilussuporte@gmail.com';
  SOFTWAREHOUSE_SUPPORT_EMAIL_PASS    = '';

  SOFTWAREHOUSE_SITE                  = 'www.mikromundo.com';


  // Senha MASTER para acesso aos dados e/ou estatísticas do servidor uniGUI. Gere uma nova para seu projeto
  // MASTER password for accessing uniGUI server data and / or statistics. Generate a new one for your project
  //
  // M1kromund0R@dC0r3 <- apague do SEU FONTE , ou altere sua senha master
  USER_ADMIN_PASS                     = '08D81B2FD862B26252DCE8F23AE1A6A1';


  ONLY_UPPERCASE                      = ['A' .. 'Z'];
  ONLY_LOWERCASE                      = ['a' .. 'z'];
  ONLY_NUMBERS                        = ['0' .. '9'];


  // REG EX
  RegEx_EMAIL = '\b^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$\b';
  RegEx_IP4   = '\b(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b';
  RegEx_IP6   = '\b((^|:)([0-9a-fA-F]{0,4})){1,8}$\b';
  RegEx_CEP   = '\b[0-9]{5}[\-]?[0-9]{3}\b';
  RegEx_PASS  = '\b(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$\b'; // min 8, upper e lower case, symbols and alphanum
  RegEx_GEO   = '\b-?\d{1,3}\.\d+\b';
  RegEx_ISBN  = '\b(?:(?=.{17}$)97[89][ -](?:[0-9]+[ -]){2}[0-9]+[ -][0-9]|97[89][0-9]{10}|(?=.{13}$)(?:[0-9]+[ -]){2}[0-9]+[ -][0-9Xx]|[0-9]{9}[0-9Xx])\b';
  RegEx_NUMBR = '\b[-+]?[0-9]*[.,]?[0-9]+\b';
  RegEX_ALPHA = '\b[a-zA-Z0-9]+\bg';


  // Controle windows/linux
  //{$IfDEF MSWINDOWS}
  //BACKSLASH   = '\';
  //{$Else}
  BACKSLASH   = '/';
  //{$IfEnd}

  // cores para dashboard
  DASHBOARD_BLK_COLOR1                = $004E9254; //green
  DASHBOARD_BLK_ICON_COLOR1           = $00407B4A;
  DASHBOARD_BLK_COLOR2                = $009C550E; //blue
  DASHBOARD_BLK_ICON_COLOR2           = $0081460C;
  DASHBOARD_BLK_COLOR3                = $004995E0; //orange
  DASHBOARD_BLK_ICON_COLOR3           = $002C73C0;
  DASHBOARD_BLK_COLOR4                = $001717A8; //red
  DASHBOARD_BLK_ICON_COLOR4           = $00111182;

  // css colors
  COLOR_RED                           = $004545D6;
  COLOR_BORDER_RED                    = $004545D6;
  COLOR_HOVER_RED                     = $006464DD;
  COLOR_GREEN                         = $00808040;
  COLOR_BORDER_GREEN                  = $00808040;
  COLOR_HOVER_GREEN                   = $00B7B717;// $009A9A4E;
  COLOR_BLUE                          = $00C78E18;
  COLOR_BORDER_BLUE                   = $00C78E18;
  COLOR_HOVER_BLUE                    = $00E7AE3A;
  COLOR_BLUEDARK                      = $008B2F14;
  COLOR_BORDER_BLUEDARK               = $008B2F14;
  COLOR_HOVER_BLUEDARK                = $00C4421C;
  COLOR_ORANGE                        = $00378DE3;
  COLOR_BORDER_ORANGE                 = $00378DE3;
  COLOR_HOVER_ORANGE                  = $0066A8EA;
  COLOR_ORANGEDARK                    = $000B68d8 ;//#d8680b;
  COLOR_BORDER_ORANGEDARK             = $00378DE3;
  COLOR_HOVER_ORANGEDARK              = $0066A8EA;
  COLOR_SILVER                        = $00BBBBBB;
  COLOR_BORDER_SILVER                 = $00BBBBBB;
  COLOR_HOVER_SILVER                  = $00D4D4D4;
  COLOR_GRAY                          = $00837074;
  COLOR_BORDER_GRAY                   = $00837074;
  COLOR_HOVER_GRAY                    = $0098878A;
  COLOR_DARK                          = $00292929;
  COLOR_BORDER_DARK                   = $00292929;
  COLOR_HOVER_DARK                    = $00484848;
  COLOR_PURPLE                        = $00BA1B7E; // v. 3.3.3.0
  COLOR_BORDER_PURPLE                 = $00EF87C0; // v. 3.3.3.0
  COLOR_HOVER_PURPLE                  = $00EF87C0; // v. 3.3.3.0
  // languages
  ARRAY_LANGUAGES       : array [1..15] of string = ( 'pt_BR',  // Portuguese( Brazil )   // v. 3.3.0.0
                                                      'pt_PT',  // Português Portugal
                                                      'en_US',  // English
                                                      'en_GB',  // English British // v. 3.3.0.0
                                                      'es_ES',  // Spanish
                                                      'fr_FR',  // French
                                                      'de_DE',  // German
                                                      'it_IT',  // Italian
                                                      'tr_TR',  // Turkish
                                                      'ru_RU',  // Russian
                                                      'zn_CH',  // Chinese
                                                      'in_ID',  // Indonesian
                                                      'th_TH',  // Thailand
                                                      'hi_IN',  // Indian
                                                      'ar'      // Arabic // v. 3.1.0.60
                                                     );
  ARRAY_LANGUAGES_FLAGS : array [1..15] of string = ( 'br'    ,   // v. 3.3.0.0
                                                      'pt'    ,
                                                      'us'    ,
                                                      'gb'    , // v. 3.3.0.0
                                                      'es'    ,
                                                      'fr'    ,
                                                      'de'    ,
                                                      'it'    ,
                                                      'tr'    ,
                                                      'ru'    ,
                                                      'cn'    ,
                                                      'id'    ,
                                                      'th'    ,
                                                      'in'    ,
                                                      'sa'      // v. 3.1.0.60
                                                     );

  //até 12 series
  // Rainbow
  ARRAY_COLORS1 : array [1..12] of string = ( '#6e40aa', '#b23cb2', '#ee4395', '#ff5e63', '#ff8c38', '#d9c231', '#aff05b', '#60f760', '#28ea8d', '#1ac7c2', '#2f96e0', '#5465d6' );
  // Inferno
  ARRAY_COLORS2 : array [1..12] of string = ( '#000004', '#110a30', '#320a5e', '#57106e', '#781c6d', '#9a2865', '#bc3754', '#d84c3e', '#ed6925', '#f98e09', '#fbb61a', '#f4df53' );
  // Magma
  ARRAY_COLORS3 : array [1..12] of string = ( '#000004', '#100b2d', '#2c115f', '#51127c', '#721f81', '#932b80', '#b73779', '#d8456c', '#f1605d', '#fc8961', '#feb078', '#fed799' );
  // greens
  ARRAY_COLORS4 : array [1..12] of string = ( '#f7fcfd', '#ebf7fa', '#dcf2f2', '#c8eae4', '#aadfd2', '#88d1bc', '#68c2a3', '#4eb485', '#37a266', '#228c49', '#0d7635', '#025f27' );
  // purples
  ARRAY_COLORS5 : array [1..12] of string = ( '#f7fcfd', '#e7f1f7', '#d5e3ef', '#bfd3e6', '#aac3de', '#99afd3', '#8f95c6', '#8c79b8', '#8a5daa', '#88409b', '#812186', '#6d0c6b' );
  //reds
  ARRAY_COLORS6 : array [1..12] of string = ( '#fff7ec', '#feedd4', '#fee1ba', '#fdd3a1', '#fdc28c', '#fdab75', '#fa8e5d', '#f3724d', '#e65339', '#d53121', '#be120c', '#a10202'  );

  // BASICOS sao todas as telas que tenha apenas CODIGO e DESCRICAO
  // BASICS are all screens that have only CODE and DESCRIPTION
  // v. 3.3.0.2
  ARRAY_BASICS : array [1..1] of string = ( '' );
  //ARRAY_BASICS : array [1..5] of string = ( 'grupos',
  //                                          'marcas',
  //                                          'montadoras' ,
  //                                          'carros',
  //                                          'ufs'  );

  // -----------------------------------------------------------------
  // Configurações para controle de geração de novos cadastros
  // Settings to control the generation of new registrations
  // -----------------------------------------------------------------
  // Tabelas que a PK não é um código sequencial
  // Tables that PK is not a sequential code
  // -----------------------------------------------------------------
  // Exemplo: DATAS, CNPJ...
  //
  ARRAY_PK_NO_INC : array [1..1] of string = ( '' ) ; //table name

  // Tabelas que a PK não recebe ZEROS a ESQUERDA se a CONSTANTE de PREENCIMENTO DE ZEROS( TABLE_PK_WITH_LEFT_ZEROS ) estiver definida com valor > 0
  // Tables that the PK does not receive LEFT ZERO if the ZERO FILLING CONSTANT (TABLE_PK_WITH_LEFT_ZEROS) is defined with value> 0
  //
  // Exemplo: CNPJ...
  //
  ARRAY_PK_NO_ZERO : array [1..1] of string = ( '' ) ;

  // CONSTANTE de PREENCIMENTO DE ZEROS a ESQUERDA para chaves primárias( PK ) strings
  // LEFT ZERO FILLING CONSTANT for primary keys (PK) strings
  //
  TABLE_PK_WITH_LEFT_ZEROS               = 5;   // se for > 0 indica que o campo codigo é STRING e associa 'n' zeros a esquerda
                                                // de acordo com o SIZE do CAMPO ( chave primária STRING )
                                                // veja "frmT040001" como exemplo
                                                // if > 0 indicates that the code field is STRING and associates 'n' zeros to the left
                                                // according to the FIELD SIZE (primary key STRING)
                                                // see "frmT040001" as an example


  // Tabelas que a PK precisa ser reposicionada( em algumas situações, a ordem dos campos não é mantida )
  // Tables that the PK needs to be repositioned ( in some situations, the order of fields is not maintained ) )
  //
  // Exemplo: planocontas
  //
  ARRAY_PK_PRIOR : array [1..1] of string = ( 'planocontas' ) ;



//  //arrays fixos
//  //
//  ARRAY_MESES : Array [1 .. 12] of String = ( 'JANEIRO','FEVEREIRO','MARÇO','ABRIL','MAIO','JUNHO','JULHO','AGOSTO','SETEMBRO','OUTUBRO','NOVEMBRO','DEZEMBRO');
//  ARRAY_SEMANA : Array [1 .. 7] of String = ( 'Domingo','Segunda-feira', 'Terça-feira','Quarta-feira','Quinta-feira','Sexta-feira','Sábado');
  ARRAY_COMPANY_TYPE : Array [1 .. 10] of String = ( 'DEFAULT',                     // -Comércio/Serviço
                                                     'OFC',                         // -Automotivo
                                                     'OTC',                         // -Ótica
                                                     'PET',                         //-Pet Shop
                                                     'GLP',                         // -Revendas de Gás/Água
                                                     'HAIR',                        // -Salão de Beleza
                                                     'BODY',                        // -Clínica de Estética
                                                     'DISTRIB',                     // -Distribuidora
                                                     'INFO',                        // -Informática/Telefonia
                                                     'CONSERT'                      // -Ajustes de Roupas
                                                     );


  // caso em suas tabelas existam campos de controle interno que não devem ser mostrados nos grids, basta adicioná-los no array abaixo
  // if in your tables there are internal control fields that should not be shown in the grids, just add them to the array below
  ARRAY_DO_NOT_SHOW_DBGRID : Array [1 .. 3] of String = ( 'date_update'          ,
                                                          'date_access'          ,
                                                          'hour_access'          );



implementation


end.

