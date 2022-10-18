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

//     rc_BuildMenuItem( mm.varA_MenuReport, iSeqMenu, 1, mm.MNU_REPORT                   , '', '', '', 'fa-print' ); // v. 3.0.0.0
//     rc_BuildMenuItem( mm.varA_MenuReport, iSeqMenu, 2, 'BÁSICOS'                       , '', '', '', '' );
//     rc_BuildMenuItem( mm.varA_MenuReport, iSeqMenu, 0, 'Rel. Clientes'                 , '', '', 'reportMenuClientes', '' );

     SetLength( mm.varA_MenuReport, iSeqMenu );
     SetLength( mm.varA_MenuReportPermissions, iSeqMenuPermission );

     //--------------

end;


end.
