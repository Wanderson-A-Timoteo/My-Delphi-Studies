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

     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 1, 'Menu Nivel 1'    , '', '', '', 'fa-sitemap' );
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Item 1 Menu 1'       , '', '', '', '' );
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Item 2 Menu 1'       , '', '', '', '' );
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 2, 'Menu Nivel 2'    , '', '', '', '' );
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Item 1 Menu 2'       , '', '', '', '' );
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Item 2 Menu 2'       , '', '', '', '' );
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Item 3 Menu 2'       , '', '', '', '' );
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 3, 'Menu Nivel 3'    , '', '', '', '' );
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Item 1 Menu 3'       , '', '', '', '' );
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Item 2 Menu 3'       , '', '', '', '' );
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Item 3 Menu 3'       , '', '', '', '' );
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 4, 'Menu Nivel 4'    , '', '', '', '' );
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Item 1 Menu 4'       , '', '', '', '' );
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Item 2 Menu 4'       , '', '', '', '' );

     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 1, mm.MNU_BASICS , '' , '' ,'','fa-sitemap' );
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 2, 'MEGA DEMO', '', '', '', '' );
     // free frame é um form que não herda de frmBaseCRUD
     // free frame is a form that does not inherit from frmBaseCRUD
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Free Frame', '', '', 'FreeFrame', 'fas-dot-circle' );
     // para testes:
     //rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Free Frame 2', '', '', 'FreeFrame2', 'fas-dot-circle' );
     // demonstração de FORM MODAL e NÃO MODAL
     // FORM MODAL and NON MODAL DEMO
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Form DEMO'      , '', '', 'DEMOWITHFORM' );
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Form Modal DEMO', '', '', 'DEMOWITHFORMModal', '', True );
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'RC Racing', '', '', 'RCRacing' );
        rc_BuildMenuItemPermission( mm.varA_MenuBasicsPermissions, iSeqMenu, iSeqMenuPermission, '<A>' ); // v. 3.1.0.60
     // demo 'responsivo'
     // 'responsive' demo
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'RC Blocks', '', '', 'RcBlocks' , 'fas-dot-circle' );
     //frmWIZARD will be refactored !
     //rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Wizard DEMO', '', '', 'WizardDemo' , 'fas-dot-circle', True );
     rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Fish Fact', '', '', 'FISHFACT' , 'fas-dot-circle' );

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

     SetLength( mm.varA_MenuBasics, iSeqMenu );
     SetLength( mm.varA_MenuBasicsPermissions, iSeqMenuPermission );

end;


end.

