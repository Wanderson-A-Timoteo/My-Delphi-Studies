object dmDados: TdmDados
  Left = 0
  Top = 0
  Caption = 'Data Module Dados'
  ClientHeight = 114
  ClientWidth = 421
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object QryUnidades: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM public."Produtos"')
    Left = 296
    Top = 16
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=DBGRID'
      'User_Name=postgres'
      'Password=fontdata2022'
      'Server=localhost'
      'DriverID=PG')
    Connected = True
    Left = 24
    Top = 16
  end
  object PgDriverLink: TFDPhysPgDriverLink
    Left = 112
    Top = 16
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 200
    Top = 16
  end
end
