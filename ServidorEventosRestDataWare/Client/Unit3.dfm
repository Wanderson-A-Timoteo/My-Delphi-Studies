object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 201
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RESTDWDataBase1: TRESTDWDataBase
    Active = False
    Compression = True
    CriptOptions.Use = False
    CriptOptions.Key = 'RDWBASEKEY256'
    AuthenticationOptions.AuthorizationOption = rdwAONone
    Proxy = False
    ProxyOptions.Port = 8888
    PoolerService = 'localhost'
    PoolerPort = 8082
    StateConnection.AutoCheck = False
    StateConnection.InTime = 1000
    RequestTimeOut = 10000
    ConnectTimeOut = 3000
    EncodeStrings = True
    Encoding = esUtf8
    StrsTrim = False
    StrsEmpty2Null = False
    StrsTrim2Len = True
    PoolerNotFoundMessage = 'Pooler not found'
    HandleRedirects = False
    RedirectMaximum = 0
    ParamCreate = True
    FailOver = False
    FailOverConnections = <>
    FailOverReplaceDefaults = False
    ClientConnectionDefs.Active = False
    UserAgent = 
      'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, l' +
      'ike Gecko) Chrome/41.0.2227.0 Safari/537.36'
    Left = 120
    Top = 80
  end
end