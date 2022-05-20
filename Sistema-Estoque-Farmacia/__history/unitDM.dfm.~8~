object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 421
  Width = 843
  object ConexaoEstoqueFarmacia: TFDConnection
    Params.Strings = (
      'User_Name=postgres'
      'Password=fontdata2022'
      'Database=Estoque_Farmacia'
      'DriverID=PG')
    Connected = True
    LoginPrompt = False
    Left = 56
    Top = 80
  end
  object tbProdutos: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = ConexaoEstoqueFarmacia
    TableName = 'produtos'
    Left = 200
    Top = 80
    object tbProdutosid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
    end
    object tbProdutosnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object tbProdutosfabricante: TWideStringField
      FieldName = 'fabricante'
      Origin = 'fabricante'
      Size = 30
    end
    object tbProdutosvalidade: TDateField
      FieldName = 'validade'
      Origin = 'validade'
      EditMask = '##/##/####;1;_'
    end
    object tbProdutosestoque_atual: TIntegerField
      FieldName = 'estoque_atual'
      Origin = 'estoque_atual'
    end
  end
  object DataSourceProdutos: TDataSource
    DataSet = tbProdutos
    Left = 200
    Top = 144
  end
  object DataSourceMovimentacoes: TDataSource
    DataSet = tbMovimentacoes
    Left = 360
    Top = 144
  end
  object DataSourceMovimentacoesProdutos: TDataSource
    DataSet = tbMovimentacoesProdutos
    Left = 544
    Top = 144
  end
  object tbMovimentacoes: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = ConexaoEstoqueFarmacia
    TableName = 'movimentacoes'
    Left = 360
    Top = 80
  end
  object tbMovimentacoesProdutos: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = ConexaoEstoqueFarmacia
    TableName = 'movimentacoes_produtos'
    Left = 544
    Top = 80
  end
  object sqlAumentaEstoque: TFDCommand
    Connection = ConexaoEstoqueFarmacia
    ParamData = <
      item
        Name = 'pId'
      end
      item
        Name = 'pQtd'
      end>
    Left = 112
    Top = 248
  end
  object sqlDiminuiEstoque: TFDCommand
    Connection = ConexaoEstoqueFarmacia
    ParamData = <
      item
        Name = 'pId'
      end
      item
        Name = 'pQtd'
      end>
    Left = 112
    Top = 320
  end
  object sqlMovimentacoes: TFDQuery
    Active = True
    Connection = ConexaoEstoqueFarmacia
    SQL.Strings = (
      'SELECT * FROM movimentacoes')
    Left = 296
    Top = 248
  end
  object DataSourceSQLMovimentacoes: TDataSource
    DataSet = sqlMovimentacoes
    Left = 304
    Top = 320
  end
end
