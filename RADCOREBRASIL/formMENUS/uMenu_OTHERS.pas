unit uMenu_OTHERS; 

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

     rc_BuildMenuItem( mm.varA_MenuOptions, iSeqMenu, 1, mm.MNU_OTHERS             , '', '', '', 'fa-bars' );
     rc_BuildMenuItem( mm.varA_MenuOptions, iSeqMenu, 2, mm.MNU_OTHERS_VIDEOS      , '', '', '', 'fa-file-video' );
     rc_BuildMenuItem( mm.varA_MenuOptions, iSeqMenu, 0, mm.MNU_OTHERS_TRAINNING   , '', '', 'link:https://youtu.be/-Gzz7wKE-r4/', '' ); 
     rc_BuildMenuItem( mm.varA_MenuOptions, iSeqMenu, 2, mm.MNU_OTHERS_SUPPORT     , '', '', '', '' );
     rc_BuildMenuItem( mm.varA_MenuOptions, iSeqMenu, 0, mm.MNU_OTHERS_OPEN_TICKET , '', '', 'link:https://app.radticket.com.br', '' ); 

     //opção exclusiva se o sistema rodando atual for da sua software house
     //exclusive option if the current system is from your software house
     if mm.varC_Doc_Customer = SOFTWAREHOUSE_CNPJ then
     begin
        rc_BuildMenuItem( mm.varA_MenuOptions, iSeqMenu, 2, SOFTWAREHOUSE_NAME     , '', '', '', '' );
     end;

     SetLength( mm.varA_MenuOptions, iSeqMenu );
     SetLength( mm.varA_MenuOptionsPermissions, iSeqMenuPermission );
     //--------------


end;


end.
