object DataModule1: TDataModule1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 149
  Width = 383
  object FDConnection: TFDConnection
    Params.Strings = (
      'Port='
      'DriverID=PG')
    LoginPrompt = False
    Left = 56
    Top = 56
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 272
    Top = 56
  end
  object PgDriverLink: TFDPhysPgDriverLink
    Left = 152
    Top = 56
  end
end
