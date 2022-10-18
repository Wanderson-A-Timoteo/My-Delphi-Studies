unit uMenu_BASICS;

interface

procedure rc_BuildMenu_BASICS ;


implementation

uses uconsts, MainModule, system.sysutils, untdm_rc, mkm_menus;

procedure rc_BuildMenu_BASICS ;
var
   iSeqMenu,
   iSeqMenuPermission : Integer;
begin
     SetLength( mm.varA_MenuBasics, 200 );
     SetLength( mm.varA_MenuBasicsPermissions, 200 );

     iSeqMenu           := 1;
     iSeqMenuPermission := 1;

     // v. 3.2.0.0
     // este recurso ainda é experimental. Ainda não obtive sucesso para evitar que esta opção recebe o HOVER
     // this feature is still experimental. I haven't been successful yet to prevent this option from receiving HOVER
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 99, 'Levels Group'    , '', '', '', '' );

     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 1, 'Menu Level 1'    , '', '', '', 'fa-sitemap' );
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Item 1 Menu 1'       , '', '', '', '' );
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Item 2 Menu 1'       , '', '', '', '' );
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 2, 'Menu Level 2'    , '', '', '', '' );
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Item 1 Menu 2'       , '', '', '', '' );
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Item 2 Menu 2'       , '', '', '', '' );
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Item 3 Menu 2'       , '', '', '', '' );
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 3, 'Menu Level 3'    , '', '', '', '' );
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Item 1 Menu 3'       , '', '', '', '' );
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Item 2 Menu 3'       , '', '', '', '' );
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Item 3 Menu 3'       , '', '', '', '' );
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 4, 'Menu Level 4'    , '', '', '', '' );
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Item 1 Menu 4'       , '', '', '', '' );
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Item 2 Menu 4'       , '', '', '', '' );
     // v. 3.2.0.4
     // para criar a proxima opção sem ser um submenu
     // to create the next option without being a submenu
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, -1, '', '', '', '', '' );
     // Opção de nível 0...
     // Level 0 option...
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Forms( close btn off )', '', '', 'Demo_Forms', 'fas-dot-circle', false, false, false, false, false, false ); //closebtn
     // v. 3.2.0.0
     // este recurso ainda é experimental. Ainda não obtive sucesso para evitar que esta opção recebe o HOVER
     // this feature is still experimental. I haven't been successful yet to prevent this option from receiving HOVER
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 99, 'options group'    , '', '', '', '' );
     // v. 4.0.0.0
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 1, 'DashBoards' , '' , '' ,'','fas-tachometer-alt' );
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'CRM'        , '', '', 'DashboardCrm', 'fas-dot-circle' );     //
     // [PT] este é o dashboard padrão carregado na tela principal, por isso está comentado
     // [EN] this is the default dashboard loaded on the main screen, so it's commented out
     //rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'E-Commerce' , '', '', 'DashboardEcommerce', 'fas-dot-circle' );
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Hospital'   , '', '', 'DashboardHospital', 'fas-dot-circle' );
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'School'     , '', '', 'DashboardSchool', 'fas-dot-circle' );

     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 1, mm.MNU_BASICS , '' , '' ,'','fa-sitemap' );
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 2, 'MEGA DEMO', '', '', '', '' );
     // free frame é um form que não herda de frmBaseCRUD
     // free frame is a form that does not inherit from frmBaseCRUD
     // v. 4.0.0.0
     //rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Free Frame', '', '', 'FreeFrame', 'fas-dot-circle' );
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Buttons', '', '', 'Demo_Buttons', 'fas-dot-circle' );
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Forms', '', '', 'Demo_Forms', 'fas-dot-circle' );
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'bsPill / bsTabs', '', '', 'Demo_Tabs', 'fas-dot-circle' );
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Messages / Dyn.Align', '', '', 'Demo_Messages', 'fas-dot-circle' );
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Tool Tips', '', '', 'Demo_Tooltips', 'fas-dot-circle' );
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Panels / Cards', '', '', 'Demo_Panels', 'fas-dot-circle' );
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Video / Cam / Image', '', '', 'Demo_VideoImg', 'fas-dot-circle' );
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Extras', '', '', 'Demo_Extras', 'fas-dot-circle' );
     //rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Wizard', '', '', 'Wizard', 'fas-dot-circle' ); in dev
     // demonstração de FORM MODAL e NÃO MODAL
     // FORM MODAL and NON MODAL DEMO
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Form ( open in tab )'      , '', '', 'DEMOWITHFORM' , 'fas-dot-circle' );
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Form ( open MODAL )', '', '', 'DEMOWITHFORMModal', 'fas-dot-circle' , True );
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'RC Racing', '', '', 'RCRacing' , '', false, true); // v. 4.0.0.0
        rc_BuildMenuItemPermission( mm.varA_MenuBasicsPermissions, iSeqMenu, iSeqMenuPermission, '<A>' ); // v. 3.1.0.60
     // demo 'responsivo'
     // 'responsive' demo
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'RC Blocks', '', '', 'RcBlocks' , 'fas-dot-circle' );
     //frmWIZARD will be refactored !
     //rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Wizard DEMO', '', '', 'WizardDemo' , 'fas-dot-circle', True );
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Fish Fact', '', '', 'FISHFACT' , 'fas-dot-circle' );

     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 2, 'Basics Forms', '', '', '' , 'fa-table' );
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'States', 'ufs' );
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Cities', 'cidades' );
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Holidays( Default )', 'feriados' ); // on HELP DOC you can create a HOLIDAY FORM
     // exemplo de tabela que a PK é ALFANUMÉRICA e com ZEROS A ESQUERDA( em uconsts.pas ajuste TABLE_PK_WITH_LEFT_ZEROS )
     // table example that the PK is ALPHANUMERIC and with LEFT ZEROS (in uconsts.pas adjust TABLE_PK_WITH_LEFT_ZEROS)
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Alphanumeric Table Sample', 'T040001', '', '', 'fa-barcode' );
     // v. 3.2.0.5
     // exemplo de tabela com chave primária composta
     // example table with composite primary key
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Compund PK Sample', 'TB_COMPOUNDPK', '', '', 'fa-table' );

     //opcoes vinculadas a uma ÁREA DE ATUACAO ESPECÍFICA
     //options linked to a SPECIFIC AREA OF ACTION
     if mm.CONFIG_APP_TYPE = 'DISTRIB' then
     begin


     end;

     //opção exclusiva se o sistema rodando atual for da sua software house
     //exclusive option if the current system is from your software house
     if mm.varC_Doc_Customer = SOFTWAREHOUSE_CNPJ then
     begin
          //rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Sistemas', 'tb_sistemas' );
     end;

     //opção exclusiva vinculado a empresa selecionada no login
     //exclusive option linked to the company selected at login
     if mm.varI_Code_Company = 1 then
     begin
          //rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Sistemas', 'tb_sistemas' );
     end;

     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 2, 'Peoples Forms', '', '', '', 'fa-male' );
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Companies', 'empresas' );
        //permissions
        rc_BuildMenuItemPermission( mm.varA_MenuBasicsPermissions, iSeqMenu, iSeqMenuPermission, '<AIEDH>' );
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Employees', 'funcionarios' );
        //permissions
        rc_BuildMenuItemPermission( mm.varA_MenuBasicsPermissions, iSeqMenu, iSeqMenuPermission, '<AIEDH>' );
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Clients', 'clientes' );
        //permissions
        rc_BuildMenuItemPermission( mm.varA_MenuBasicsPermissions, iSeqMenu, iSeqMenuPermission, '<AIEDH>' );
        rc_BuildMenuItemPermission( mm.varA_MenuBasicsPermissions, iSeqMenu, iSeqMenuPermission, 'Licence Tab' );
     // v. 3.2.0.5
     //permissions DETAILS on frmCadCLIENTES
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Clients Revisions', 'clientes_revisoes', '', '', '', false, true );
        //permissions
        rc_BuildMenuItemPermission( mm.varA_MenuBasicsPermissions, iSeqMenu, iSeqMenuPermission, '<AIEDH>' );

     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Supplyers', 'fornecedores' );

     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 2, 'Stock', '', '', '', 'fa-barcode' );
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Groups', 'grupos' );
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Brands', 'marcas' );
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Products', 'produtos' );

     SetLength( mm.varA_MenuBasics, iSeqMenu );
     SetLength( mm.varA_MenuBasicsPermissions, iSeqMenuPermission );

end;


end.

