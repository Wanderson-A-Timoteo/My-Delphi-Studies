object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 310
  Width = 477
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=D:\BDFirebird\MENUS.FDB'
      'User_Name=SYSDBA'
      'Password=12345'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 104
    Top = 40
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 224
    Top = 136
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 256
    Top = 48
  end
end
