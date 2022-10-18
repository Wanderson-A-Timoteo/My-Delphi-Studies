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

     // adicione suas opções e atenção ao nome do ARRAY neste MENU( mm.varA_MenuBasics )
     // add your options and pay attention to the ARRAY name in this MENU( mm.varA_MenuBasics )
     //
     //rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 1, mm.MNU_BASICS , '' , '' ,'','fa-sitemap' );
     //rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 2, 'MEGA DEMO', '', '', '', '' );
     //rc_BuildMenuItem( mm.varA_MenuBasics, iSeqMenu, 0, 'Free Frame', '', '', 'FreeFrame', 'fas-dot-circle' );
       //rc_BuildMenuItemPermission( mm.varA_MenuBasicsPermissions, iSeqMenu, iSeqMenuPermission, '<AIED>' );

     SetLength( mm.varA_MenuBasics, iSeqMenu );
     SetLength( mm.varA_MenuBasicsPermissions, iSeqMenuPermission );

end;


end.

