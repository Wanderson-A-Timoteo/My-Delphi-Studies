object ModelEntidadeProduto: TModelEntidadeProduto
  OldCreateOrder = False
  Height = 237
  Width = 373
  object FDQuery1: TFDQuery
    CachedUpdates = True
    Connection = DataModule1.FDConnection1
    SQL.Strings = (
      'SELECT * FROM PRODUTOS')
    Left = 168
    Top = 104
  end
end
