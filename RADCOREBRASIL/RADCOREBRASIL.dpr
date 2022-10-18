{$define UNIGUI_VCL} // Comment out this line to turn this project into an ISAPI module
(*
colar UNIGUI_VCL; antes do DEBUG dem DELPHI COMPILER

ai vai gerar EXE pra DEBUG
e DLL pra PRODUCAO

    aaaaaaaaaaaaaaa       aaaaaaaaaaaaaaa          aaaaaaaaaaa         aaaaaaaaaaaaa      aaaa    aaaa
    aaaaaaaaaaaaaaaaa     aaaaaaaaaaaaaaaaa      aaaaaaaaaaaaaaa     aaaaaaaaaaaaaaaa     aaaa    aaaa
    aaaa          aaaa    aaaa          aaaa    aaaa         aaaa    aaa          aaa     aaaa    aaaa
    aaaa          aaaa    aaaa          aaaa    aaaa         aaaa    aaa                  aaaa    aaaa
    aaaa          aaaa    aaaa          aaaa    aaaa         aaaa    aaa                  aaaa    aaaa
    aaaaaaaaaaaaaaa       aaaaaaaaaaaaaaa       aaaaaaaaaaaaaaaaa     aaaaaaaaaaaaaaa     aaaa    aaaa
    aaaaaaaaaaaaaaaaa     aaaaaaaaaaaaaaaaa     aaaaaaaaaaaaaaaaa      aaaaaaaaaaaaaaa    aaaa    aaaa
    aaaa          aaaa    aaaa          aaaa    aaaa         aaaa                  aaa    aaaa    aaaa
    aaaa          aaaa    aaaa          aaaa    aaaa         aaaa    aaa           aaa    aaaa    aaaa
    aaaaaaaaaaaaaaaaaa    aaaa          aaaa    aaaa         aaaa    aaaaaaaaaaaaaaaa     aaaa    aaaaaaaaaaaaaaaa
    aaaaaaaaaaaaaaaaa     aaaa          aaaa    aaaa         aaaa     aaaaaaaaaaaaaa      aaaa    aaaaaaaaaaaaaaaa

    last version: 4.0.0.6
*)

{$ifndef UNIGUI_VCL}
library
{$else}
program
{$endif}
RADCOREBRASIL;

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
  Login in 'Login.pas' {frmLogin: TUniLoginForm},
  untFrmBase in 'frameBASE\untFrmBase.pas' {frmBase: TUniFrame},
  untFrmBaseCRUD in 'frameBASE\untFrmBaseCRUD.pas' {frmBaseCRUD: TUniFrame},
  untCadCLIENTES in 'formMENUS\MENU_BASICS\untCadCLIENTES.pas' {frmCadCLIENTES: TUniFrame},
  str_func in 'FUNCTIONS\str_func.pas',
  untFrmLookUp in 'frameBASE\untFrmLookUp.pas' {frmLookUp: TUniForm},
  untCadFUNCIONARIOS in 'formMENUS\MENU_BASICS\untCadFUNCIONARIOS.pas' {frmCadFUNCIONARIOS: TUniFrame},
  untCadFORNECEDORES in 'formMENUS\MENU_BASICS\untCadFORNECEDORES.pas' {frmCadFORNECEDORES: TUniFrame},
  untCadEMPRESAS in 'formMENUS\MENU_BASICS\untCadEMPRESAS.pas' {frmCadEMPRESAS: TUniFrame},
  untCadUSUARIOS in 'formMENUS\MENU_TOOLS\untCadUSUARIOS.pas' {frmCadUSUARIOS: TUniFrame},
  untFrmBaseCRUDDetail in 'frameBASE\untFrmBaseCRUDDetail.pas' {frmBaseCRUDDetail: TUniForm},
  untFrmBaseReportMenu in 'frameBASE\untFrmBaseReportMenu.pas' {frmBaseReportMenu: TUniFrame},
  untReportMenuClientes in 'formMENUS\MENU_REPORTS\untReportMenuClientes.pas' {frmReportMenuClientes: TUniFrame},
  untfrmBaseReportDefault in 'frameBASE\untfrmBaseReportDefault.pas' {frmBaseReportDefault: TUniForm},
  mkm_func_report in 'FUNCTIONS\mkm_func_report.pas',
  untReportClientesSimples in 'formMENUS\MENU_REPORTS\untReportClientesSimples.pas' {frmReportClientesSimples: TUniForm},
  untReportClientesCompleto in 'formMENUS\MENU_REPORTS\untReportClientesCompleto.pas' {frmReportClientesCompleto: TUniForm},
  uVersion in 'FUNCTIONS\uVersion.pas',
  untCadBASICS in 'formMENUS\MENU_BASICS\untCadBASICS.pas' {frmCadBASICS: TUniFrame},
  untCadCOMPRAS in 'formMENUS\MENU_MOVEMENT\untCadCOMPRAS.pas' {frmCadCOMPRAS: TUniFrame},
  untCadCIDADES in 'formMENUS\MENU_BASICS\untCadCIDADES.pas' {frmCadCIDADES: TUniFrame},
  untFrmBaseReport in 'frameBASE\untFrmBaseReport.pas' {frmBaseReport: TUniForm},
  untCadRECIBOS in 'formMENUS\MENU_MOVEMENT\untCadRECIBOS.pas' {frmCadRECIBOS: TUniFrame},
  untReportReciboSimples in 'formMENUS\MENU_REPORTS\untReportReciboSimples.pas' {frmReportReciboSimples: TUniForm},
  untCadCLIENTES_VEICULOS in 'formMENUS\MENU_BASICS\untCadCLIENTES_VEICULOS.pas' {frmCadCLIENTES_VEICULOS: TUniForm},
  untCadMOVCAIXA in 'formMENUS\MENU_MOVEMENT\untCadMOVCAIXA.pas' {frmCadMOVCAIXA: TUniFrame},
  untCadT040001 in 'formMENUS\MENU_BASICS\untCadT040001.pas' {frmCadT040001: TUniFrame},
  untFrmLookUp_Lite in 'frameBASE\untFrmLookUp_Lite.pas' {frmLookUp_Lite: TUniForm},
  untFormBase in 'formBASE\untFormBase.pas' {formBase: TUniForm},
  untCadFERIADOS in 'formMENUS\MENU_BASICS\untCadFERIADOS.pas' {frmCadFERIADOS: TUniFrame},
  untFrmTHEMES in 'formMENUS\MENU_TOOLS\untFrmTHEMES.pas' {frmThemes: TUniForm},
  untDM_RC in 'datamodules\untDM_RC.pas' {dm_rc: TDataModule},
  mkm_graphs in 'FUNCTIONS\mkm_graphs.pas',
  mkm_gridblock in 'functions\mkm_gridblock.pas',
  mkm_layout in 'functions\mkm_layout.pas',
  mkm_validate in 'FUNCTIONS\mkm_validate.pas',
  untFrmRCBLOCKS in 'formMENUS\MENU_BASICS\untFrmRCBLOCKS.pas' {frmRCBlocks: TUniFrame},
  untFrmDEMOWITHFORM in 'formMENUS\MENU_BASICS\untFrmDEMOWITHFORM.pas' {frmDEMOWithForm: TUniForm},
  untFrmDEMOWITHFORMMODAL in 'formMENUS\MENU_BASICS\untFrmDEMOWITHFORMMODAL.pas' {frmDEMOWithFormMODAL: TUniForm},
  untFrmRCRacing in 'formMENUS\MENU_BASICS\untFrmRCRacing.pas' {frmRCRACING: TUniFrame},
  mkm_anim in 'FUNCTIONS\mkm_anim.pas',
  mkm_translate in 'FUNCTIONS\mkm_translate.pas',
  untFrmTRANSLATE in 'formMENUS\MENU_TOOLS\untFrmTRANSLATE.pas' {frmTranslate: TUniForm},
  untCadPRODUTOS in 'formMENUS\MENU_BASICS\untCadPRODUTOS.pas' {frmCadPRODUTOS: TUniFrame},
  untFrmBasePDF in 'frameBASE\untFrmBasePDF.pas' {frmBasePDF: TUniForm},
  untFrmWIZARD in 'formMENUS\MENU_BASICS\untFrmWIZARD.pas' {frmWIZARD: TUniFrame},
  untFrmWIZARDDEMO in 'formMENUS\MENU_BASICS\untFrmWIZARDDEMO.pas' {frmWIZARDDEMO: TUniForm},
  uconsts in 'functions\uconsts.pas',
  mkm_email in 'FUNCTIONS\mkm_email.pas',
  untFrmFISHFACT in 'formMENUS\MENU_BASICS\untFrmFISHFACT.pas' {frmFishFact: TUniFrame},
  mkm_login in 'FUNCTIONS\mkm_login.pas',
  untCadCLIENTES_REVISOES in 'formMENUS\MENU_BASICS\untCadCLIENTES_REVISOES.pas' {frmCadCLIENTES_REVISOES: TUniForm},
  DelphiZXIngQRCode in 'FUNCTIONS\DelphiZXIngQRCode.pas',
  mkm_qrcode in 'FUNCTIONS\mkm_qrcode.pas',
  untCadTB_COMPOUNDPK in 'formMENUS\MENU_BASICS\untCadTB_COMPOUNDPK.pas' {frmCadTB_COMPOUNDPK: TUniFrame},
  mkm_dbfuncs in 'FUNCTIONS\mkm_dbfuncs.pas',
  mkm_dbcombobox in 'FUNCTIONS\mkm_dbcombobox.pas',
  untFrmWEBCAM in 'formMENUS\MENU_TOOLS\untFrmWEBCAM.pas' {frmWEBCAM: TUniForm},
  untGenericModalForm in 'formBASE\untGenericModalForm.pas' {frmGenericModalForm: TUniForm},
  untFrmInputBox in 'formBASE\untFrmInputBox.pas' {frmInputBox: TUniForm},
  untFrmMessage in 'formBASE\untFrmMessage.pas' {frmMessage: TUniForm},
  untFrmQRCODE in 'formMENUS\MENU_TOOLS\untFrmQRCODE.pas' {frmQRCODE: TUniForm},
  mkm_paginator in 'functions\mkm_paginator.pas',
  untDashBoardCRM in 'DashBoards\untDashBoardCRM.pas' {frmDashboardCRM: TUniFrame},
  untDashBoardECOMMERCE in 'DashBoards\untDashBoardECOMMERCE.pas' {frmDashboardECOMMERCE: TUniFrame},
  untDashBoardHOSPITAL in 'DashBoards\untDashBoardHOSPITAL.pas' {frmDashboardHOSPITAL: TUniFrame},
  untDashBoardSCHOOL in 'DashBoards\untDashBoardSCHOOL.pas' {frmDashboardSCHOOL: TUniFrame},
  mkm_createcomponents in 'functions\mkm_createcomponents.pas',
  untFrmDEMO_BUTTONS in 'formMENUS\MENU_BASICS\untFrmDEMO_BUTTONS.pas' {frmDEMO_BUTTONS: TUniFrame},
  untFrmDEMO_FORMS in 'formMENUS\MENU_BASICS\untFrmDEMO_FORMS.pas' {frmDEMO_FORMS: TUniFrame},
  untFrmDEMO_MESSAGES in 'formMENUS\MENU_BASICS\untFrmDEMO_MESSAGES.pas' {frmDEMO_MESSAGES: TUniFrame},
  untFrmDEMO_TOOLTIPS in 'formMENUS\MENU_BASICS\untFrmDEMO_TOOLTIPS.pas' {frmDEMO_TOOLTIPS: TUniFrame},
  untFrmDEMO_PANELS in 'formMENUS\MENU_BASICS\untFrmDEMO_PANELS.pas' {frmDEMO_PANELS: TUniFrame},
  untFrmDEMO_EXTRAS in 'formMENUS\MENU_BASICS\untFrmDEMO_EXTRAS.pas' {frmDEMO_EXTRAS: TUniFrame},
  untFrmDEMO_VIDEOIMG in 'formMENUS\MENU_BASICS\untFrmDEMO_VIDEOIMG.pas' {frmDEMO_VIDEOIMG: TUniFrame},
  untFrmDEMO_TABS in 'formMENUS\MENU_BASICS\untFrmDEMO_TABS.pas' {frmDEMO_TABS: TUniFrame},
  untFrmBARCODE in 'formMENUS\MENU_TOOLS\untFrmBARCODE.pas' {frmBARCODE: TUniForm};

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

