unit uMenu_MOVEMENT;

interface

procedure rc_BuildMenu_MOVEMENT ;


implementation


uses uconsts, MainModule, mkm_menus;


procedure rc_BuildMenu_MOVEMENT ;
var
   iSeqMenu,
   iSeqMenuPermission : Integer;

begin

     SetLength( mm.varA_MenuMovement, 200 );
     SetLength( mm.varA_MenuMovementPermissions, 200 );

     iSeqMenu           := 1;
     iSeqMenuPermission := 1;

     rc_BuildMenuItem( mm.varA_MenuMovement, iSeqMenu, 1, mm.MNU_MOVEMENT           , '', '', '', 'fa-dollar-sign' ); // v. 3.0.0.0
     rc_BuildMenuItem( mm.varA_MenuMovement, iSeqMenu, 2, 'MOVEMENTS IN'                , '', '', '', '' );
     rc_BuildMenuItem( mm.varA_MenuMovement, iSeqMenu, 0, 'Purchases'                 , 'compras', '', '', '' );

     //rc_BuildMenuItem( mm.varA_MenuMovement, iSeqMenu, 2, 'SAÍDAS'                  , '', '', '', '' );
     //rc_BuildMenuItem( mm.varA_MenuMovement, iSeqMenu, 0, 'Ordem de Serviço'        , 'oses', '', '', '' );
     //rc_BuildMenuItem( mm.varA_MenuMovement, iSeqMenu, 0, 'PDV'                   , 'oses', '', 'PDV', '' );

     rc_BuildMenuItem( mm.varA_MenuMovement, iSeqMenu, 2, 'FINANCIAL'              , '', '', '', '' );
     rc_BuildMenuItem( mm.varA_MenuMovement, iSeqMenu, 0, 'Cash Movement'       , 'movcaixa', '', '', '' );

     rc_BuildMenuItem( mm.varA_MenuMovement, iSeqMenu, 2, 'ADMINISTRATIVE'          , '', '', '', '' );
     rc_BuildMenuItem( mm.varA_MenuMovement, iSeqMenu, 0, 'Receipts'                 , 'recibos', '', '', '' );

     SetLength( mm.varA_MenuMovement, iSeqMenu );
     SetLength( mm.varA_MenuMovementPermissions, iSeqMenuPermission );

end;


end.

