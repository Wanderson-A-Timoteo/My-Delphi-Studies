object DataModuleDados: TDataModuleDados
  OldCreateOrder = False
  Height = 341
  Width = 438
  object DatabaseMaximus: TFDConnection
    ConnectionName = 'DBMaximus'
    Params.Strings = (
      'Database=DBMAXIMUS'
      'User_Name=postgres'
      'Password=Font1252'
      'Server=localhost'
      'DriverID=PG')
    LoginPrompt = False
    Left = 64
    Top = 16
  end
  object QueryParametros: TFDQuery
    CachedUpdates = True
    Connection = DatabaseMaximus
    SQL.Strings = (
      '')
    Left = 60
    Top = 72
  end
  object QueryPesquisa: TFDQuery
    Connection = DatabaseMaximus
    Left = 252
    Top = 72
  end
  object QueryDataHoraServidor: TFDQuery
    Connection = DatabaseMaximus
    Left = 340
    Top = 72
  end
  object ADPhysPgDriverLink: TFDPhysPgDriverLink
    Left = 152
    Top = 16
  end
  object ADGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 248
    Top = 16
  end
  object QueryGeral: TFDQuery
    Connection = DatabaseMaximus
    Left = 148
    Top = 72
  end
  object QueryAcessaLoja: TFDQuery
    Connection = DatabaseMaximus
    SQL.Strings = (
      'SELECT  codigo,'
      '        nome,'
      '        cod_loja,'
      '        acessa_outras_loja,'
      '        ativo'
      'FROM usuarios'
      ''
      'WHERE codigo   = :codigo       '
      '')
    Left = 48
    Top = 136
    ParamData = <
      item
        Name = 'codigo'
      end>
  end
  object DataSetProviderAcessaLoja: TDataSetProvider
    DataSet = QueryAcessaLoja
    Options = [poAllowCommandText]
    Left = 143
    Top = 136
  end
  object ClientDataSetAcessaLoja: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptInput
      end>
    ProviderName = 'DataSetProviderAcessaLoja'
    Left = 245
    Top = 136
  end
  object QryCrianca: TFDQuery
    CachedUpdates = True
    Connection = DatabaseMaximus
    SQL.Strings = (
      'SELECT *'
      'FROM paraisokids.controle_criancas'
      'WHERE numero_pulseira = :numero_pulseira')
    Left = 48
    Top = 208
    ParamData = <
      item
        Name = 'NUMERO_PULSEIRA'
        ParamType = ptInput
      end>
  end
  object QryPesquisarCrianca: TFDQuery
    AfterOpen = QryPesquisarCriancaAfterOpen
    Connection = DatabaseMaximus
    SQL.Strings = (
      'SELECT numero_pulseira,'
      '       nome_crianca,'
      '       nome_mae,'
      '       nome_pai,'
      '       numero_mesa,'
      '       data_hora_entrada,'
      '       CAST(CASE sair_sozinho'
      '         WHEN '#39'S'#39' THEN '#39'SIM'#39
      '         WHEN '#39'N'#39' THEN '#39'N'#195'O'#39
      '       END AS varchar(3)) AS sair_sozinho'
      'FROM paraisokids.controle_criancas'
      
        'WHERE (UPPER(UNACCENT(nome_crianca)) LIKE UPPER(UNACCENT(:nome))' +
        ' OR'
      
        '       UPPER(UNACCENT(nome_mae))     LIKE UPPER(UNACCENT(:nome))' +
        ' OR'
      
        '       UPPER(UNACCENT(nome_pai))     LIKE UPPER(UNACCENT(:nome))' +
        ') AND'
      '       ativo = '#39'S'#39' AND'
      
        '       data_hora_entrada BETWEEN :data_hora_inicial AND :data_ho' +
        'ra_final')
    Left = 45
    Top = 269
    ParamData = <
      item
        Name = 'NOME'
        ParamType = ptInput
      end
      item
        Name = 'DATA_HORA_INICIAL'
        ParamType = ptInput
      end
      item
        Name = 'DATA_HORA_FINAL'
        ParamType = ptInput
      end>
  end
  object DscPesquisarCrianca: TDataSource
    DataSet = QryPesquisarCrianca
    Left = 141
    Top = 269
  end
end
