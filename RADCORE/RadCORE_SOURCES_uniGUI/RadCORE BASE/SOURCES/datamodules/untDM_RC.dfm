object dm_rc: Tdm_rc
  OnCreate = DataModuleCreate
  Height = 682
  Width = 1089
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
