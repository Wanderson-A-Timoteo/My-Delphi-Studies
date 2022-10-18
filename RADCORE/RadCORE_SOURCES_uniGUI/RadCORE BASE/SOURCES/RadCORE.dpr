{$define UNIGUI_VCL} // Comment out this line to turn this project into an ISAPI module

(*
colar UNIGUI_VCL; antes do DEBUG dem DELPHI COMPILER

ai vai gerar EXE pra DEBUG
e DLL pra PRODUCAO

  aaaaaaaaaaaaaa          aaaaaaaaaaa        aaaaaaaaaaaaaaaa    aaaaaaaaaaaaaaaa
  aaaaaaaaaaaaaaaa      aaaaaaaaaaaaaaa     aaaaaaaaaaaaaaaaaa   aaaaaaaaaaaaaaaa
  aaaa         aaaa    aaaa         aaaa    aaa            aaa   aaaa
  aaaa         aaaa    aaaa         aaaa    aaa                  aaaa
  aaaaaaaaaaaaaaaa     aaaa         aaaa    aaa                  aaaaaaaaaaaaaa
  aaaaaaaaaaaaaaaa     aaaaaaaaaaaaaaaaa     aaaaaaaaaaaaaaaa    aaaaaaaaaaaaaa
  aaaa         aaaa    aaaaaaaaaaaaaaaaa      aaaaaaaaaaaaaaaa   aaaa
  aaaa         aaaa    aaaa         aaaa                   aaa   aaaa
  aaaa         aaaa    aaaa         aaaa    aaaa           aaa   aaaa
  aaaaaaaaaaaaaaaaa    aaaa         aaaa    aaaaaaaaaaaaaaaaaa   aaaaaaaaaaaaaaaa
  aaaaaaaaaaaaaaaa     aaaa         aaaa     aaaaaaaaaaaaaaaa    aaaaaaaaaaaaaaaa

  last version: 4.1.0.2

*)


{$ifndef UNIGUI_VCL}
library
{$else}
program
{$endif}
(*<prj-name*)RadCORE(*prj-name>*);

uses
  {$ifdef MSWINDOWS}
  uniGUIISAPI,
  {$endif }
  Forms,
  MidasLib,
  ServerModule in 'ServerModule.pas' {sm: TUniGUIServerModule},
  MainModule in 'MainModule.pas' {mm: TUniGUIMainModule},
  Main in 'Main.pas' {MainForm: TUniForm},
  uMenu_BASICS in 'formMENUS\uMenu_BASICS.pas',
  uMenu_TOOLS in 'formMENUS\uMenu_TOOLS.pas',
  uMenu_MOVEMENT in 'formMENUS\uMenu_MOVEMENT.pas',
  uMenu_OTHERS in 'formMENUS\uMenu_OTHERS.pas',
  uMenu_REPORTS in 'formMENUS\uMenu_REPORTS.pas',
  mkm_menus in 'formMENUS\mkm_menus.pas',
  mkm_func_web in 'FUNCTIONS\mkm_func_web.pas',
  uconsts in 'FUNCTIONS\uconsts.pas',
  Login in 'Login.pas' {frmLogin: TUniLoginForm},
  untFrmBase in 'frameBASE\untFrmBase.pas' {frmBase: TUniFrame},
  str_func in 'FUNCTIONS\str_func.pas',
  uVersion in 'FUNCTIONS\uVersion.pas',
  untFormBase in 'formBASE\untFormBase.pas' {formBase: TUniForm},
  untFrmTHEMES in 'formMENUS\MENU_TOOLS\untFrmTHEMES.pas' {frmThemes: TUniForm},
  untDM_RC in 'DATAMODULES\untDM_RC.pas' {dm_rc: TDataModule},
  mkm_graphs in 'FUNCTIONS\mkm_graphs.pas',
  mkm_gridblock in 'FUNCTIONS\mkm_gridblock.pas',
  mkm_layout in 'FUNCTIONS\mkm_layout.pas',
  mkm_validate in 'FUNCTIONS\mkm_validate.pas',
  mkm_anim in 'FUNCTIONS\mkm_anim.pas',
  mkm_translate in 'FUNCTIONS\mkm_translate.pas',
  untFrmTRANSLATE in 'formMENUS\MENU_TOOLS\untFrmTRANSLATE.pas' {frmTranslate: TUniForm},
  mkm_email in 'functions\mkm_email.pas',
  mkm_login in 'functions\mkm_login.pas',
  DelphiZXIngQRCode in 'functions\DelphiZXIngQRCode.pas',
  mkm_qrcode in 'functions\mkm_qrcode.pas',
  untGenericModalForm in 'formBase\untGenericModalForm.pas' {frmGenericModalForm: TUniForm},
  untFrmInputBox in 'formBase\untFrmInputBox.pas' {frmInputBox: TUniForm},
  untFrmMessage in 'formBase\untFrmMessage.pas' {frmMessage: TUniForm},
  mkm_createcomponents in 'functions\mkm_createcomponents.pas';

{$R *.res}

{$ifndef UNIGUI_VCL}
exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;
{$endif}

begin
{$ifdef UNIGUI_VCL}
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Tsm.Create(Application);
  Application.Run;
{$endif}
end.

