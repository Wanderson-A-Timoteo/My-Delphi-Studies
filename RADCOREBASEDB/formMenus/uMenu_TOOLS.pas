unit uMenu_TOOLS; 

interface

procedure rc_BuildMenu_TOOLS ;


implementation


uses uconsts, MainModule, mkm_menus;


procedure rc_BuildMenu_TOOLS ;
var

   iSeqMenu,
   iSeqMenuPermission : Integer;

begin

     SetLength( mm.varA_MenuTools, 200 );
     SetLength( mm.varA_MenuToolsPermissions, 200 );

     iSeqMenu           := 1;
     iSeqMenuPermission := 1;

     // adicione suas opções e atenção ao nome do ARRAY neste MENU( mm.varA_MenuTools )
     // add your options and pay attention to the ARRAY name in this MENU( mm.varA_MenuTools )
     // v. 3.3.0.0
     rc_BuildMenuItem( mm.varA_MenuTools, iSeqMenu, 1, mm.MNU_TOOLS              , '', '', '', 'fa-wrench' );
     rc_BuildMenuItem( mm.varA_MenuTools, iSeqMenu, 2, mm.MNU_TOOLS_SETTINGS     , '', '', '', 'fas-cog' );
     //rc_BuildMenuItem( mm.varA_MenuTools, iSeqMenu, 0, 'Parâmetros do Sistema'   , 'parametros', '', '', '' );
     rc_BuildMenuItem( mm.varA_MenuTools, iSeqMenu, 0, mm.MNU_TOOLS_USERS  , 'usuarios', '', '', 'fas-user-cog', false, false, true, false );   // parametro do GUS // v. 3.2.0.1
         rc_BuildMenuItemPermission( mm.varA_MenuToolsPermissions, iSeqMenu, iSeqMenuPermission, '<AIEDH>' );
         rc_BuildMenuItemPermission( mm.varA_MenuToolsPermissions, iSeqMenu, iSeqMenuPermission, 'Cfg.Permis.: MASTER' ); // v. 3.2.0.7
         rc_BuildMenuItemPermission( mm.varA_MenuToolsPermissions, iSeqMenu, iSeqMenuPermission, 'Cfg.Permis.: ALL' );    // v. 3.2.0.7
     // v. 3.3.1.0
     // se você precisar por permissionamento por usuário ao invés somente do acesso por ADMIN...
     // if you need to apply permossion verify do "frmTHEMES" rather than only ADMIN ACCESS...
     //rc_BuildMenuItem( mm.varA_MenuTools, iSeqMenu, 0, 'System Config' , '', '', 'system_config', '' );
     //   rc_BuildMenuItemPermission( mm.varA_MenuToolsPermissions, iSeqMenu, iSeqMenuPermission, '<A>' );

     rc_BuildMenuItem( mm.varA_MenuTools, iSeqMenu, 2, mm.MNU_TOOLS_VERSIONS                 , '', '', '', 'fas-code-branch' );
     rc_BuildMenuItem( mm.varA_MenuTools, iSeqMenu, 0, mm.MNU_TOOLS_UPDATE    , '', '', 'link:https://radcore.pro.br/web/atualizacoes/', '' );

     SetLength( mm.varA_MenuTools, iSeqMenu );
     SetLength( mm.varA_MenuToolsPermissions, iSeqMenuPermission );

     //--------------

end;


end.
