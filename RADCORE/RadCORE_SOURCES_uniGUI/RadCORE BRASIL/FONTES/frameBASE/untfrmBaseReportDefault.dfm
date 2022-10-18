object frmBaseReportDefault: TfrmBaseReportDefault
  Left = 0
  Top = 0
  ClientHeight = 1061
  ClientWidth = 1049
  Caption = 'frmBaseReportDefault'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Font.Height = -13
  Font.Name = 'Calibri'

  TextHeight = 15
  object RLReport: TRLReport
    Left = 58
    Top = 11
    Width = 794
    Height = 1123
    DataSource = dsMaster
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    object bandHeader: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 175
      BandType = btHeader
      object paTitle: TRLPanel
        Left = 0
        Top = 0
        Width = 718
        Height = 175
        Align = faClient
        object paDataCompany: TRLPanel
          Left = 0
          Top = 0
          Width = 718
          Height = 117
          Align = faTop
          object labEmail: TRLLabel
            Left = 5
            Top = 94
            Width = 522
            Height = 13
            AutoSize = False
            Caption = 'Email_Site'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Calibri'
            Font.Style = []
            ParentFont = False
          end
          object labPhone: TRLLabel
            Left = 5
            Top = 77
            Width = 522
            Height = 13
            AutoSize = False
            Caption = 
              'Sistema NAUTILUS - MIKROMUNDO Sistemas ( 85 3085-8611- mikromun-' +
              ' mikromundo@gmail.com - www.mikromundo.com )'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Calibri'
            Font.Style = []
            ParentFont = False
          end
          object labAddress: TRLLabel
            Left = 5
            Top = 60
            Width = 522
            Height = 13
            AutoSize = False
            Caption = 'Ender_Num_Bairro_Cep'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Calibri'
            Font.Style = []
            ParentFont = False
          end
          object labCnpj: TRLLabel
            Left = 5
            Top = 43
            Width = 522
            Height = 13
            AutoSize = False
            Caption = 'Cnpj'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Calibri'
            Font.Style = []
            ParentFont = False
          end
          object labRazSoc: TRLLabel
            Left = 5
            Top = 26
            Width = 522
            Height = 13
            AutoSize = False
            Caption = 'RazSoc'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Calibri'
            Font.Style = []
            ParentFont = False
          end
          object labCompanyName: TRLLabel
            Left = 5
            Top = 2
            Width = 522
            Height = 21
            AutoSize = False
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = False
            Caption = 'Company'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -19
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object paLogo: TRLPanel
            Left = 538
            Top = 0
            Width = 180
            Height = 117
            Align = faRight
            object imgLogoReport: TRLImage
              AlignWithMargins = True
              Left = 0
              Top = 0
              Width = 176
              Height = 106
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Borders.Color = clSilver
              Center = True
            end
          end
        end
        object paTituloRel: TRLPanel
          Left = 0
          Top = 117
          Width = 718
          Height = 58
          Align = faClient
          Color = 15790320
          ParentColor = False
          Transparent = False
          object labTitleRep: TRLLabel
            Left = 5
            Top = 9
            Width = 99
            Height = 23
            Caption = 'Report Title'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -19
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object labReportPeriod: TRLLabel
            Left = 5
            Top = 37
            Width = 33
            Height = 13
            Caption = 'Period'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Calibri'
            Font.Style = []
            ParentFont = False
            Transparent = False
            Visible = False
          end
          object RLPanel1: TRLPanel
            Left = 526
            Top = 0
            Width = 192
            Height = 58
            Align = faRight
            Transparent = False
            object labDatePrint: TRLLabel
              Left = 12
              Top = 37
              Width = 27
              Height = 13
              Anchors = [fkRight]
              Caption = 'Date:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Calibri'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = False
            end
            object sysDatePrint: TRLSystemInfo
              Left = 66
              Top = 37
              Width = 119
              Height = 15
              Alignment = taRightJustify
              Anchors = [fkRight]
              AutoSize = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Calibri'
              Font.Style = []
              Info = itNow
              ParentFont = False
              Text = ''
              Transparent = False
            end
          end
        end
      end
    end
    object bandColumnHeader: TRLBand
      Left = 38
      Top = 213
      Width = 718
      Height = 20
      GreenBarColor = 15724527
      BandType = btColumnHeader
      Color = 8158332
      ParentColor = False
      Transparent = False
    end
    object bandFooter: TRLBand
      Left = 38
      Top = 233
      Width = 718
      Height = 20
      BandType = btFooter
      object labAppName: TRLLabel
        Left = 0
        Top = 0
        Width = 50
        Height = 20
        Align = faLeft
        Caption = 'App Name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object labSite: TRLLabel
        Left = 633
        Top = 0
        Width = 85
        Height = 20
        Align = faRight
        Caption = 'company website'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object rlSysInfo1: TRLSystemInfo
        Left = 277
        Top = 3
        Width = 60
        Height = 15
        Alignment = taRightJustify
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        Info = itPageNumber
        ParentFont = False
        Text = ''
      end
      object RLLabel4: TRLLabel
        Left = 337
        Top = 3
        Width = 10
        Height = 13
        AutoSize = False
        Caption = ' / '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object rlSysInfo2: TRLSystemInfo
        Left = 346
        Top = 3
        Width = 58
        Height = 15
        Alignment = taJustify
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        Info = itLastPageNumber
        ParentFont = False
        Text = ''
      end
    end
  end
  object RLExpressionParser: TRLExpressionParser
    Left = 898
    Top = 346
  end
  object RLPDFFilter: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0 \251 Copyright '#169' 1999-2016 F' +
      'ortes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 898
    Top = 300
  end
  object sqlMaster: TFDQuery
    CachedUpdates = True
    Connection = mm.SQLConn
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    SQL.Strings = (
      'Select * from cargos')
    Left = 898
    Top = 401
  end
  object sqlSearchMaster: TFDQuery
    CachedUpdates = True
    Connection = mm.SQLConn
    FormatOptions.AssignedValues = [fvFmtDisplayDateTime, fvFmtDisplayDate, fvFmtDisplayNumeric, fvStrsTrim2Len]
    SQL.Strings = (
      '')
    Left = 898
    Top = 507
  end
  object dsMaster: TDataSource
    AutoEdit = False
    DataSet = sqlMaster
    Left = 898
    Top = 455
  end
  object dsSearchMaster: TDataSource
    AutoEdit = False
    DataSet = sqlSearchMaster
    Left = 898
    Top = 551
  end
end
