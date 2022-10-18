unit uMenu_OTHERS; // v. 3.0.0.0

interface

procedure rc_BuildMenu_OTHERS ;


implementation

uses uconsts, MainModule, mkm_menus;

procedure rc_BuildMenu_OTHERS ;

var

   iSeqMenu,
   iSeqMenuPermission : Integer;

begin

     SetLength( mm.varA_MenuOptions, 200 );
     SetLength( mm.varA_MenuOptionsPermissions, 200 );

     iSeqMenu           := 1;
     iSeqMenuPermission := 1;

     // adicione suas opções e atenção ao nome do ARRAY neste MENU( mm.varA_MenuOptions )
     // add your options and pay attention to the ARRAY name in this MENU( mm.varA_MenuOptions )
     //
     //rc_BuildMenuItem( mm.varA_MenuOptions, iSeqMenu, 1, mm.MNU_OTHERS             , '', '', '', 'fa-bars' );
     //rc_BuildMenuItem( mm.varA_MenuOptions, iSeqMenu, 2, mm.MNU_OTHERS_VIDEOS      , '', '', '', 'fa-file-video' );


     SetLength( mm.varA_MenuOptions, iSeqMenu );
     SetLength( mm.varA_MenuOptionsPermissions, iSeqMenuPermission );
     //--------------


end;


end.
