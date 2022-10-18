unit mkm_menus; // v. 4.0.0.0

interface

uses

    System.SysUtils, System.Math, uconsts;

procedure rc_BuildHTMLMENU( pMenuList : array of string  ) ;
// v. 3.2.0.6 //closebtn
procedure rc_BuildMenuItem( var pMenuList     : array of string;
                            var pSeq          : integer ;
                            pLevel            : integer;
                            pItem             : string = '';
                            pTable            : string = '';
                            pRestrictionField : string = '';
                            pForm             : string = '';
                            pIcon             : string = '';
                            pModal            : boolean = false ;
                            pHidden           : boolean = false ;
                            pAskNewAfterPost  : boolean = false ;
                            pGenNextID_OnNew  : boolean = false ;
                            pCloseButton      : boolean = true  ;
                            pDoNotShow        : boolean = false ; // v. 4.0.0.0
                            pMaster           : boolean = false  // v. 4.0.0.0
                            );

procedure rc_BuildMenuItemPermission( var pMenuList : array of string;
                                      var pSeq      : integer ;
                                      var pSeqPerm  : integer;
                                      pItem         : string );

implementation


uses mkm_func_web, MainModule, untdm_rc;

procedure rc_BuildMenuItem( var pMenuList     : array of string;
                            var pSeq          : integer ;
                            pLevel            : integer;
                            pItem             : string ;
                            pTable            : string ;
                            pRestrictionField : string;
                            pForm             : string ;
                            pIcon             : string;
                            pModal            : boolean ;
                            pHidden           : boolean ;
                            pAskNewAfterPost  : boolean ;
                            pGenNextID_OnNew  : boolean ;
                            pCloseButton      : boolean ;
                            pDoNotShow        : boolean ; // v. 4.0.0.0
                            pMaster           : boolean   // v. 4.0.0.0
                            );
begin
     try
        pItem := StringOfChar( ']', pLevel ) + pItem;

        if ( pRestrictionField = '' ) and ( pTable <> '' ) then
           pRestrictionField := pTable
        else
        if ( pRestrictionField = '' ) and ( pForm <> '' ) then
           pRestrictionField := pForm;

        //if pAskNewAfterPost then
        if Pos( 'RC Racing', pItem ) > 0 then
           pSeq := pSeq;

        // v. 3.2.0.4
        if pLevel = -1 then
           pItem := '-1';

        pItem := pItem + varIIf( pIcon <> '' , ' ico:' + pIcon, '' ) +
                         varIIf( pTable <> '', ' tbl:' + pTable, '' ) +
                         varIIf( pRestrictionField <> '', ' fld:' + pRestrictionField, '' ) +
                         varIIf( pHidden , ' hide:' , '' ) +
                         varIIf( pDoNotShow , ' notshow:' , '' ) + // v. 4.0.0.0
                         varIIf( pMaster , ' m:' , '' ) + // v. 4.0.0.0
                         varIIf( pAskNewAfterPost , ' asknew:' , '' ) +
                         varIIf( pGenNextID_OnNew , ' genid:' , '' ) +
                         varIIf( not pCloseButton , ' closebtn:' , '' ) +
                         varIIf( pForm <> '', ' frm:' + varIIF( pModal, 'modal_', '' ) + pForm, '' ) ;
        pMenuList[ pSeq ] := pItem ;
        Inc( pSeq );
     except on e:exception do
            begin
                 dm_rc.rc_ShowSweetAlert( 'rc_BuildMenuItem' , 'Item: ' + pItem + '( ' + e.message + ' )', 'error' );
            end;
     end;
end;
// v. 4.0.0.0
procedure rc_BuildMenuItemPermission( var pMenuList : array of string; var pSeq : integer ; var pSeqPerm : integer; pItem : string );
var
   cAccess,
   cInsert,
   cEdit,
   cDelete,
//   cSearch,
   cHidden,
   cMaster : string;
begin
        if Pos( 'Cfg.Permis', pItem ) > 0 then
           pSeq := pSeq;
     //permissions
     if ( ( Pos( '<', pItem ) > 0 ) and ( Pos( '>', pItem ) > 0 ) ) and
        ( ( Pos( 'A', pItem ) > 0 ) or
          ( Pos( 'I', pItem ) > 0 ) or
          ( Pos( 'E', pItem ) > 0 ) or
          ( Pos( 'D', pItem ) > 0 ) or
//          ( Pos( 'S', pItem ) > 0 ) or
//          ( Pos( 'H', pItem ) > 0 ) or
          ( Pos( 'M', pItem ) > 0 ) ) then
     begin
        cAccess := '';
        cInsert := '';
        cEdit   := '';
        cDelete := '';
//        cSearch := '';
        cHidden := '';
        cMaster := '';
        // translate messages
        case mm.varLT_Lang of

             ltpt_BR : begin
                          If ( Pos( 'A', pItem ) > 0 ) then cAccess := 'Acessar'  ;
                          If ( Pos( 'I', pItem ) > 0 ) then cInsert := 'Cadastrar' ;
                          If ( Pos( 'E', pItem ) > 0 ) then cEdit   := 'Alterar'   ;
                          If ( Pos( 'D', pItem ) > 0 ) then cDelete := 'Excluir' ;
//                          If ( Pos( 'S', pItem ) > 0 ) then cSearch := 'Pesquisar' ;
//                          if ( Pos( 'H', pItem ) > 0 ) then cHidden := 'Oculto' ;
                          If ( Pos( 'M', pItem ) > 0 ) then cMaster := 'RCMaster' ;
                       end;
             lten_US,
             lten_GB : begin
                          If ( Pos( 'A', pItem ) > 0 ) then cAccess := 'Access'  ;
                          If ( Pos( 'I', pItem ) > 0 ) then cInsert := 'Insert' ;
                          If ( Pos( 'E', pItem ) > 0 ) then cEdit   := 'Edit'   ;
                          If ( Pos( 'D', pItem ) > 0 ) then cDelete := 'Delete' ;
//                          If ( Pos( 'S', pItem ) > 0 ) then cSearch := 'Search' ;
//                          if ( Pos( 'H', pItem ) > 0 ) then cHidden := 'Hidden' ;
                          If ( Pos( 'M', pItem ) > 0 ) then cMaster := 'RCMaster' ;
                       end;
             ltes_ES   : begin
                          If ( Pos( 'A', pItem ) > 0 ) then cAccess := 'Acessar'  ;
                          If ( Pos( 'I', pItem ) > 0 ) then cInsert := 'Cadastrar' ;
                          If ( Pos( 'E', pItem ) > 0 ) then cEdit   := 'Alterar'   ;
                          If ( Pos( 'D', pItem ) > 0 ) then cDelete := 'Excluir' ;
//                          If ( Pos( 'S', pItem ) > 0 ) then cSearch := 'Pesquisar' ;
//                          if ( Pos( 'H', pItem ) > 0 ) then cHidden := 'Oculto' ;
                          If ( Pos( 'M', pItem ) > 0 ) then cMaster := 'RCMaster' ;
                       end;
             ltfr_FR   : begin
                          If ( Pos( 'A', pItem ) > 0 ) then cAccess := 'Accès'  ;
                          If ( Pos( 'I', pItem ) > 0 ) then cInsert := 'Cadastre' ;
                          If ( Pos( 'E', pItem ) > 0 ) then cEdit   := 'Éditer'   ;
                          If ( Pos( 'D', pItem ) > 0 ) then cDelete := 'Supprimer' ;
//                          If ( Pos( 'S', pItem ) > 0 ) then cSearch := 'Recherche' ;
//                          if ( Pos( 'H', pItem ) > 0 ) then cHidden := 'Caché' ;
                          If ( Pos( 'M', pItem ) > 0 ) then cMaster := 'RCMaster' ;
                       end;
             ltde_DE   : begin
                          If ( Pos( 'A', pItem ) > 0 ) then cAccess := 'Zugang'  ;
                          If ( Pos( 'I', pItem ) > 0 ) then cInsert := 'Kataster' ;
                          If ( Pos( 'E', pItem ) > 0 ) then cEdit   := 'Redigieren'   ;
                          If ( Pos( 'D', pItem ) > 0 ) then cDelete := 'Löschen' ;
//                          If ( Pos( 'S', pItem ) > 0 ) then cSearch := 'Suche' ;
//                          if ( Pos( 'H', pItem ) > 0 ) then cHidden := 'Versteckt' ;
                          If ( Pos( 'M', pItem ) > 0 ) then cMaster := 'RCMaster' ;
                       end;
             ltit_IT   : begin
                          If ( Pos( 'A', pItem ) > 0 ) then cAccess := 'Accesso'  ;
                          If ( Pos( 'I', pItem ) > 0 ) then cInsert := 'Catasto' ;
                          If ( Pos( 'E', pItem ) > 0 ) then cEdit   := 'Redigere'   ;
                          If ( Pos( 'D', pItem ) > 0 ) then cDelete := 'Cancellare' ;
//                          If ( Pos( 'S', pItem ) > 0 ) then cSearch := 'Ricerca' ;
//                          if ( Pos( 'H', pItem ) > 0 ) then cHidden := 'Nascosto' ;
                          If ( Pos( 'M', pItem ) > 0 ) then cMaster := 'RCMaster' ;
                       end;
             lttr_TR    : begin
                          If ( Pos( 'A', pItem ) > 0 ) then cAccess := 'Erişim'  ;
                          If ( Pos( 'I', pItem ) > 0 ) then cInsert := 'Kadastro' ;
                          If ( Pos( 'E', pItem ) > 0 ) then cEdit   := 'Düzenlemek'   ;
                          If ( Pos( 'D', pItem ) > 0 ) then cDelete := 'Silmek' ;
//                          If ( Pos( 'S', pItem ) > 0 ) then cSearch := 'Aramak' ;
//                          if ( Pos( 'H', pItem ) > 0 ) then cHidden := 'Gizli' ;
                          If ( Pos( 'M', pItem ) > 0 ) then cMaster := 'RCMaster' ;
                       end;
             ltru_RU    : begin
                          If ( Pos( 'A', pItem ) > 0 ) then cAccess := 'Доступ'  ;
                          If ( Pos( 'I', pItem ) > 0 ) then cInsert := 'Вставка' ;
                          If ( Pos( 'E', pItem ) > 0 ) then cEdit   := 'Редактировать'   ;
                          If ( Pos( 'D', pItem ) > 0 ) then cDelete := 'Удалить' ;
//                          If ( Pos( 'S', pItem ) > 0 ) then cSearch := 'Поиск' ;
//                          if ( Pos( 'H', pItem ) > 0 ) then cHidden := 'Скрытый' ;
                          If ( Pos( 'M', pItem ) > 0 ) then cMaster := 'RCMaster' ;
                       end;
             ltzn_CH : begin
                          If ( Pos( 'A', pItem ) > 0 ) then cAccess := 'Access'  ;
                          If ( Pos( 'I', pItem ) > 0 ) then cInsert := 'Insert' ;
                          If ( Pos( 'E', pItem ) > 0 ) then cEdit   := 'Edit'   ;
                          If ( Pos( 'D', pItem ) > 0 ) then cDelete := 'Delete' ;
//                          If ( Pos( 'S', pItem ) > 0 ) then cSearch := 'Search' ;
//                          if ( Pos( 'H', pItem ) > 0 ) then cHidden := 'Hidden' ;
                          If ( Pos( 'M', pItem ) > 0 ) then cMaster := 'RCMaster' ;
                       end;
             ltin_ID : begin
                          If ( Pos( 'A', pItem ) > 0 ) then cAccess := 'Access'  ;
                          If ( Pos( 'I', pItem ) > 0 ) then cInsert := 'Insert' ;
                          If ( Pos( 'E', pItem ) > 0 ) then cEdit   := 'Edit'   ;
                          If ( Pos( 'D', pItem ) > 0 ) then cDelete := 'Delete' ;
//                          If ( Pos( 'S', pItem ) > 0 ) then cSearch := 'Search' ;
//                          if ( Pos( 'H', pItem ) > 0 ) then cHidden := 'Hidden' ;
                          If ( Pos( 'M', pItem ) > 0 ) then cMaster := 'RCMaster' ;
                       end;
             ltth_TH : begin
                          If ( Pos( 'A', pItem ) > 0 ) then cAccess := 'Access'  ;
                          If ( Pos( 'I', pItem ) > 0 ) then cInsert := 'Insert' ;
                          If ( Pos( 'E', pItem ) > 0 ) then cEdit   := 'Edit'   ;
                          If ( Pos( 'D', pItem ) > 0 ) then cDelete := 'Delete' ;
//                          If ( Pos( 'S', pItem ) > 0 ) then cSearch := 'Search' ;
//                          if ( Pos( 'H', pItem ) > 0 ) then cHidden := 'Hidden' ;
                          If ( Pos( 'M', pItem ) > 0 ) then cMaster := 'RCMaster' ;
                       end;
             lthi_IN : begin
                          If ( Pos( 'A', pItem ) > 0 ) then cAccess := 'Access'  ;
                          If ( Pos( 'I', pItem ) > 0 ) then cInsert := 'Insert' ;
                          If ( Pos( 'E', pItem ) > 0 ) then cEdit   := 'Edit'   ;
                          If ( Pos( 'D', pItem ) > 0 ) then cDelete := 'Delete' ;
//                          If ( Pos( 'S', pItem ) > 0 ) then cSearch := 'Search' ;
//                          if ( Pos( 'H', pItem ) > 0 ) then cHidden := 'Hidden' ;
                          If ( Pos( 'M', pItem ) > 0 ) then cMaster := 'RCMaster' ;
                       end;
                       // feedback Mohamed Ammar // v. 3.1.0.63
             ltar_SA : begin
                          If ( Pos( 'A', pItem ) > 0 ) then cAccess := 'عرض'  ;
                          If ( Pos( 'I', pItem ) > 0 ) then cInsert := 'جديد' ;
                          If ( Pos( 'E', pItem ) > 0 ) then cEdit   := 'تعديل'   ;
                          If ( Pos( 'D', pItem ) > 0 ) then cDelete := 'حذف' ;
//                          If ( Pos( 'S', pItem ) > 0 ) then cSearch := 'بحث' ;
//                          if ( Pos( 'H', pItem ) > 0 ) then cHidden := 'مخفي' ;
                          If ( Pos( 'M', pItem ) > 0 ) then cMaster := 'RCMaster' ;
                       end;
        end;
        If cAccess <> '' then
        begin
          pMenuList[ pSeqPerm ] := IntToStr( pSeq - 1 ) + '.' + cAccess  ;
          Inc( pSeqPerm );
        end;
        If cInsert <> '' then
        begin
          pMenuList[ pSeqPerm ] := IntToStr( pSeq - 1 ) + '.' + cInsert ;
          Inc( pSeqPerm );
        end;
        If cEdit <> '' then
        begin
          pMenuList[ pSeqPerm ] := IntToStr( pSeq - 1 ) + '.' + cEdit   ;
          Inc( pSeqPerm );
        end;
        If cDelete <> '' then
        begin
          pMenuList[ pSeqPerm ] := IntToStr( pSeq - 1 ) + '.' + cDelete;
          Inc( pSeqPerm );
        end;
//        If cSearch <> '' then
//        begin
//          pMenuList[ pSeqPerm ] := IntToStr( pSeq - 1 ) + '.' + cSearch;
//          Inc( pSeqPerm );
//        end;
//        if cHidden <> '' then
//        begin
//           pMenuList[ pSeqPerm ] := IntToStr( pSeq - 1 ) + '.' + cHidden ;
//           Inc( pSeqPerm );
//        end;
        If cMaster <> '' then
        begin
          pMenuList[ pSeqPerm ] := IntToStr( pSeq - 1 ) + '.' + cMaster ;
        end;
     end
     else
     begin
       pMenuList[ pSeqPerm ] := IntToStr( pSeq - 1 ) + '.' + pItem ; Inc( pSeqPerm );
     end;
end;
// _pasta é pra SEPARAR os arquivos de cada categoria do MENU
procedure rc_BuildHTMLMENU( pMenuList : array of string ) ;
var
   I      : integer;
   vItem_prior,
   vItem : string;
begin
    vItem_prior := ' ';
    I := 1;

    //mm.varSL_HtmlMenu.Add( '          <ul class="treeview-menu">' );
    //mm.varSL_HtmlMenu.Add( '            <!-- <li><a href="#"><i class="fa fa-circle-o"></i> Opção avulsa</a></li> -->' );
    while ( I <= High( pMenuList ) ) do
    begin
         vItem_prior := pMenuList[ i - 1 ];
         vItem := pMenuList[ i ];

         // montar o Array com as informacoes do MENU e sua respectiva TABELA
         if Copy( vItem , 1, 1 ) = ']' then
         begin
              mm.varSL_HtmlMenu.Add( '             <li class="treeview">' );
              mm.varSL_HtmlMenu.Add( '                 <a href="#"><i class="fa fa-circle-o text-yellow"></i> ' + Copy( vItem , 2, 50 ) );
              mm.varSL_HtmlMenu.Add( '                    <span class="pull-right-container">' );
              mm.varSL_HtmlMenu.Add( '                     <i class="fa fa-angle-left pull-right"></i>' );
              mm.varSL_HtmlMenu.Add( '                    </span>' );
              mm.varSL_HtmlMenu.Add( '                 </a>' );

              mm.varSL_HtmlMenu.Add( '                 <ul class="treeview-menu">' );

              vItem_prior := pMenuList[ i ];
              // processa até o próximo SUBMENU
              Repeat
                    Inc( I );

                    if ( I <= High( pMenuList ) ) then
                    begin
                       vItem := pMenuList[ i ];

                       if Pos( '|', vItem ) > 0 then
                       begin
                            mm.varA_FSideMenu[ mm.varI_NumMenu ].option  := Trim( Copy( vItem , 1, Pos( '|', vItem ) - 1 ) );
                            mm.varA_FSideMenu[ mm.varI_NumMenu ].table := Trim( Copy( vItem , Pos( '|', vItem ) + 1, 100 ) );
                            mm.varA_FSideMenu[ mm.varI_NumMenu ].image := 'fa fa-circle-o';

                            // estou ASSUMINDO mainpage? pra tentar CENTRALIZAR tudo
                            if mm.varC_MenuGroup <> 'relatorios' then
                               mm.varSL_HtmlMenu.Add( '                    <li><a href="#" onclick="ajaxRequest( MainForm.hfMain , ''menuprincipal'' , [ page=' + mm.varA_FSideMenu[ mm.varI_NumMenu ].option + ', table=' + mm.varA_FSideMenu[ mm.varI_NumMenu ].table + ' ] )"><i class="' + mm.varA_FSideMenu[ mm.varI_NumMenu ].image + '"></i> ' + mm.varA_FSideMenu[ mm.varI_NumMenu ].option + '</a></li>' )
                            else
                               mm.varSL_HtmlMenu.Add( '                    <li><a href="#" onclick="ajaxRequest( MainForm.hfMain , ''relatorios'' , [ page=' + mm.varA_FSideMenu[ mm.varI_NumMenu ].option + ', table=' + mm.varA_FSideMenu[ mm.varI_NumMenu ].table + ' ] )"><i class="' + mm.varA_FSideMenu[ mm.varI_NumMenu ].image + '"></i> ' + mm.varA_FSideMenu[ mm.varI_NumMenu ].option + '</a></li>' );

                            Inc( mm.varI_NumMenu );
                       end;
                    end;
              Until ( Copy( vItem , 1, 1 ) = ']' ) or ( I > High( pMenuList ) );

              mm.varSL_HtmlMenu.Add( '                 </ul>' );
              mm.varSL_HtmlMenu.Add( '             </li>' );
         end;
    end;

    mm.varSL_HtmlMenu.Add( '            </li>' );
    mm.varSL_HtmlMenu.Add( '          </ul>');
end;
end.
