object mm: Tmm
  OldCreateOrder = False
  OnCreate = UniGUIMainModuleCreate
  OnDestroy = UniGUIMainModuleDestroy
  BackButtonAction = bbaWarnUser
  Theme = 'triton.modified'
  TouchTheme = 'material'
  MonitoredKeys.Enabled = True
  MonitoredKeys.KeyEnableAll = True
  MonitoredKeys.Keys = <>
  EnableSynchronousOperations = True
  ConstrainForms = True
  OnSessionTimeout = UniGUIMainModuleSessionTimeout
  OnBeforeLogin = UniGUIMainModuleBeforeLogin
  OnBrowserClose = UniGUIMainModuleBrowserClose
  Height = 577
  Width = 941
end
