object dm_rc: Tdm_rc
  OnCreate = DataModuleCreate
  Height = 682
  Width = 1089
  object dsSqlGeneric: TDataSource
    DataSet = sqlGeneric
    Left = 180
    Top = 54
  end
  object memRecords: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 426
    Top = 194
  end
  object memTemp: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 426
    Top = 336
  end
  object sqlGeneric: TFDQuery
    CachedUpdates = True
    Connection = mm.SQLConn
    FetchOptions.AssignedValues = [evMode, evRecordCountMode]
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    FormatOptions.StrsTrim2Len = True
    SQL.Strings = (
      'Select * from Servidor')
    Left = 181
    Top = 5
  end
  object sqlDelete: TFDQuery
    CachedUpdates = True
    Connection = mm.SQLConn
    FetchOptions.AssignedValues = [evMode]
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    FormatOptions.StrsTrim2Len = True
    SQL.Strings = (
      'Select * from Servidor')
    Left = 181
    Top = 479
  end
  object sqlGetDataSet: TFDQuery
    CachedUpdates = True
    Connection = mm.SQLConn
    FetchOptions.AssignedValues = [evMode]
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    FormatOptions.StrsTrim2Len = True
    SQL.Strings = (
      'Select * from Servidor')
    Left = 181
    Top = 431
  end
  object sqlNextID: TFDQuery
    CachedUpdates = True
    Connection = mm.SQLConn
    FetchOptions.AssignedValues = [evMode]
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    FormatOptions.StrsTrim2Len = True
    SQL.Strings = (
      'Select * from Servidor')
    Left = 181
    Top = 385
  end
  object sqlSearchMaster: TFDQuery
    CachedUpdates = True
    Connection = mm.SQLConn
    FetchOptions.AssignedValues = [evMode]
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    FormatOptions.StrsTrim2Len = True
    SQL.Strings = (
      'Select * from Servidor')
    Left = 181
    Top = 337
  end
  object sqlDS: TFDQuery
    CachedUpdates = True
    Connection = mm.SQLConn
    FetchOptions.AssignedValues = [evMode]
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    FormatOptions.StrsTrim2Len = True
    SQL.Strings = (
      'Select * from Servidor')
    Left = 179
    Top = 287
  end
  object memStructure: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 424
    Top = 290
  end
  object sqlIns_Upd: TFDQuery
    CachedUpdates = True
    Connection = mm.SQLConn
    FetchOptions.AssignedValues = [evMode]
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    FormatOptions.StrsTrim2Len = True
    SQL.Strings = (
      'Select * from Servidor')
    Left = 181
    Top = 241
  end
  object memUsers: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 428
    Top = 414
  end
  object memTotRecords: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 424
    Top = 242
  end
  object sqlGetRecords: TFDQuery
    CachedUpdates = True
    Connection = mm.SQLConn
    FetchOptions.AssignedValues = [evMode]
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    FormatOptions.StrsTrim2Len = True
    SQL.Strings = (
      'Select * from Servidor')
    Left = 181
    Top = 195
  end
  object memUsersPermissions: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 428
    Top = 458
  end
  object memUsersPermissionsSecondary: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 426
    Top = 560
  end
  object memUsersPermissionsEdit: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 428
    Top = 612
  end
  object sqlCompanies: TFDQuery
    CachedUpdates = True
    Connection = mm.SQLConn
    FetchOptions.AssignedValues = [evMode]
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    FormatOptions.StrsTrim2Len = True
    SQL.Strings = (
      'Select * from Empresas')
    Left = 181
    Top = 101
  end
  object dsSqlCompanies: TDataSource
    DataSet = sqlCompanies
    Left = 182
    Top = 150
  end
  object memUsersSecondary: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 426
    Top = 508
  end
  object REGISTER_REQUEST: TFDQuery
    CachedUpdates = True
    FetchOptions.AssignedValues = [evMode]
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    FormatOptions.StrsTrim2Len = True
    SQL.Strings = (
      'SELECT *'
      'FROM solicitacao_cadastro')
    Left = 183
    Top = 525
  end
  object IdFTP1: TIdFTP
    Host = 'plugrevenda01.plugin.com.br'
    Passive = True
    ConnectTimeout = 0
    Username = 'hpmikromundo'
    NATKeepAlive.UseKeepAlive = False
    NATKeepAlive.IdleTimeMS = 0
    NATKeepAlive.IntervalMS = 0
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 61
    Top = 67
  end
  object memPK: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 425
    Top = 10
  end
  object memGridPK: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 425
    Top = 114
  end
  object dsMemPk: TDataSource
    DataSet = memPK
    Left = 426
    Top = 62
  end
  object uniFileUp: TUniFileUpload
    Title = 'Upload'
    Messages.Uploading = 'Enviando...'
    Messages.PleaseWait = 'Aguarde...'
    Messages.Cancel = 'Cancelar'
    Messages.Processing = 'Processando...'
    Messages.UploadError = 'Erro no Envio'
    Messages.Upload = 'Upload'
    Messages.NoFileError = 'Selecione um arquivo'
    Messages.BrowseText = 'Browse...'
    Messages.UploadTimeout = 'Timeout occurred...'
    Messages.MaxSizeError = 'File is bigger than maximum allowed size'
    Messages.MaxFilesError = 'You can upload maximum %d files.'
    TargetFolder = 'uploads'
    Overwrite = True
    Left = 64
    Top = 13
  end
  object UniSweetAlert: TUniSweetAlert
    Title = 'Title'
    ConfirmButtonText = 'OK'
    CancelButtonText = 'Cancel'
    Padding = 20
    OnDismiss = UniSweetAlertDismiss
    OnConfirm = UniSweetAlertConfirm
    Left = 60
    Top = 116
  end
  object sqlLookUpSearch: TFDQuery
    CachedUpdates = True
    Connection = mm.SQLConn
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    FormatOptions.StrsTrim2Len = True
    SQL.Strings = (
      'Select * from tabela')
    Left = 181
    Top = 569
  end
  object dsLookUpSearch: TDataSource
    AutoEdit = False
    DataSet = sqlLookUpSearch
    Left = 180
    Top = 613
  end
  object UniGridExcelExporter1: TUniGridExcelExporter
    FileExtention = 'xlsx'
    MimeType = 
      'application/vnd.openxmlformats-officedocument.spreadsheetml.shee' +
      't'
    CharSet = 'UTF-8'
    Left = 58
    Top = 166
  end
  object UniGridXMLExporter1: TUniGridXMLExporter
    FileExtention = 'xml'
    MimeType = 'text/xml'
    CharSet = 'UTF-8'
    Left = 58
    Top = 268
  end
  object UniGridHTMLExporter1: TUniGridHTMLExporter
    FileExtention = 'html'
    MimeType = 'text/html'
    CharSet = 'UTF-8'
    Left = 58
    Top = 318
  end
  object UniGridCSVExporter1: TUniGridCSVExporter
    FileExtention = 'csv'
    MimeType = 'text/csv'
    CharSet = 'UTF-8'
    Left = 58
    Top = 216
  end
end
