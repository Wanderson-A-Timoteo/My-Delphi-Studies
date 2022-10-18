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

//     rc_BuildMenuItem( mm.varA_MenuMovement, iSeqMenu, 1, mm.MNU_MOVEMENT           , '', '', '', 'fa-dollar-sign' ); // v. 3.0.0.0
//     rc_BuildMenuItem( mm.varA_MenuMovement, iSeqMenu, 2, 'ENTRADAS'                , '', '', '', '' );
//     rc_BuildMenuItem( mm.varA_MenuMovement, iSeqMenu, 0, 'Compras'                 , 'compras', '', '', '' );
//
//     rc_BuildMenuItem( mm.varA_MenuMovement, iSeqMenu, 2, 'FINANCEIRO'              , '', '', '', '' );
//     rc_BuildMenuItem( mm.varA_MenuMovement, iSeqMenu, 0, 'Movimento de Caixa'       , 'movcaixa', '', '', '' );
//
//     rc_BuildMenuItem( mm.varA_MenuMovement, iSeqMenu, 2, 'ADMINISTRATIVO'          , '', '', '', '' );
//     rc_BuildMenuItem( mm.varA_MenuMovement, iSeqMenu, 0, 'Recibos'                 , 'recibos', '', '', '' );

     SetLength( mm.varA_MenuMovement, iSeqMenu );
     SetLength( mm.varA_MenuMovementPermissions, iSeqMenuPermission );

end;


end.

