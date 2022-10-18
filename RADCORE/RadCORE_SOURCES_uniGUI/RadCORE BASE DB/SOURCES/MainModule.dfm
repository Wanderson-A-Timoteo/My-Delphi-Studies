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
  object SQLConn: TFDConnection
    Params.Strings = (
      'Port=3050'
      'CharacterSet=win1252'
      'Protocol=TCPIP'
      'Server=localhost'
      'User_Name=sysdba'
      'Password=masterkey'
      'Database=C:\inetpub\wwwroot\radcore\files\database\RC_DB.FDB'
      'DriverID=FB')
    FetchOptions.AssignedValues = [evMode, evItems, evRowsetSize, evRecordCountMode]
    FetchOptions.RowsetSize = 25
    FormatOptions.AssignedValues = [fvSE2Null, fvStrsTrim, fvFmtDisplayDateTime, fvFmtDisplayDate, fvFmtDisplayTime, fvFmtDisplayNumeric, fvFmtEditNumeric, fvStrsTrim2Len]
    FormatOptions.StrsTrim = False
    TxOptions.Isolation = xiReadCommitted
    LoginPrompt = False
    OnRecover = SQLConnRecover
    Left = 73
    Top = 39
  end
end
