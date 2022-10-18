unit uMenu_REPORTS; // v. 3.0.0.0

interface

procedure rc_BuildMenu_REPORTS ;


implementation

uses uconsts, MainModule, mkm_menus;

procedure rc_BuildMenu_REPORTS ;
var

   iSeqMenu,
   iSeqMenuPermission : Integer;

begin

     SetLength( mm.varA_MenuReport, 200 );
     SetLength( mm.varA_MenuReportPermissions, 200 );

     iSeqMenu           := 1;
     iSeqMenuPermission := 1;

     // v. 3.2.0.7
     rc_BuildMenuItem( mm.varA_MenuReport, iSeqMenu, 1, mm.MNU_REPORT                   , '', '', '', 'fa-print' );
     rc_BuildMenuItem( mm.varA_MenuReport, iSeqMenu, 2, 'BASICS'                       , '', '', '', '' );
     (*<prj-nofortes1>*)rc_BuildMenuItem( mm.varA_MenuReport, iSeqMenu, 0, 'Clients Reports'                 , '', '', 'reportMenuClientes', '' );
        //permissions 'reportMenuClientes' deve existir na tabela USUARIOS_RESTRICOES
        (*<prj-nofortes2>*)rc_BuildMenuItemPermission( mm.varA_MenuReportPermissions, iSeqMenu, iSeqMenuPermission, '<A>' );
        (*<prj-nofortes3>*)rc_BuildMenuItemPermission( mm.varA_MenuReportPermissions, iSeqMenu, iSeqMenuPermission, 'Clientes - Simples' );
        (*<prj-nofortes4>*)rc_BuildMenuItemPermission( mm.varA_MenuReportPermissions, iSeqMenu, iSeqMenuPermission, 'Clientes - Completa' );

     SetLength( mm.varA_MenuReport, iSeqMenu );
     SetLength( mm.varA_MenuReportPermissions, iSeqMenuPermission );

     //--------------

end;


end.
