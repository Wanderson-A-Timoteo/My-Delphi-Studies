object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 254
  Width = 381
  object ConexaoPostgres: TFDConnection
    Params.Strings = (
      'Database=BDConsulta'
      'User_Name=postgres'
      'Password=fontdata2022'
      'DriverID=pG')
    Connected = True
    LoginPrompt = False
    Left = 64
    Top = 96
  end
  object QryConsulta: TFDQuery
    Active = True
    Connection = ConexaoPostgres
    SQL.Strings = (
      '  SELECT * FROM clientes')
    Left = 168
    Top = 96
  end
  object DataSourceSQLConsulta: TDataSource
    DataSet = QryConsulta
    Left = 272
    Top = 96
  end
end
