object form_relatorio_agendamento_periodo: Tform_relatorio_agendamento_periodo
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 358
  ClientWidth = 835
  Color = 11976552
  Font.Charset = DEFAULT_CHARSET
  Font.Color = 11976552
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 15
  object shape_fundo_form_agendamento: TShape
    Left = 0
    Top = 0
    Width = 835
    Height = 358
    Align = alClient
    Brush.Color = 11976552
    Pen.Color = 11976552
    ExplicitWidth = 535
    ExplicitHeight = 415
  end
  object PanelContainer: TPanel
    Left = 8
    Top = 8
    Width = 817
    Height = 345
    BevelOuter = bvNone
    Color = 11976552
    ParentBackground = False
    TabOrder = 0
    object PanelAgrupaCamposAgendamento: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 811
      Height = 334
      Margins.Bottom = 0
      Align = alTop
      BevelOuter = bvNone
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSilver
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      object RLReportAgendamentoPeriodo: TRLReport
        Left = 0
        Top = 0
        Width = 794
        Height = 1123
        DataSource = ds_padrao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        object RLBand1: TRLBand
          Left = 38
          Top = 38
          Width = 718
          Height = 59
          BandType = btTitle
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = False
          object RLLabel1: TRLLabel
            Left = 0
            Top = 0
            Width = 718
            Height = 32
            Align = faTop
            Alignment = taCenter
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = False
            Caption = 'RELAT'#211'RIO DE AGENDAMENTOS POR PER'#205'ODO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -19
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblPeriodo: TRLLabel
            Left = 0
            Top = 32
            Width = 718
            Height = 20
            Align = faTop
            Alignment = taCenter
            Caption = 'PER'#205'ODO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLSystemInfoNumeroPagina: TRLSystemInfo
            Left = 626
            Top = 17
            Width = 89
            Height = 17
            Alignment = taRightJustify
            Info = itPageNumber
            Text = ''
          end
          object RLSystemInfoDataEmissao: TRLSystemInfo
            Left = 3
            Top = 19
            Width = 39
            Height = 17
            Text = ''
          end
          object RLLabel2: TRLLabel
            Left = 3
            Top = 3
            Width = 75
            Height = 15
            Caption = 'Data Emiss'#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel9: TRLLabel
            Left = 676
            Top = 3
            Width = 39
            Height = 15
            Caption = 'P'#225'gina'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object RLBand2: TRLBand
          Left = 38
          Top = 97
          Width = 718
          Height = 24
          BandType = btColumnHeader
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = True
          Borders.DrawRight = False
          Borders.DrawBottom = True
          object RLLabelData: TRLLabel
            Left = 3
            Top = 3
            Width = 29
            Height = 15
            Caption = 'Data'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabelHora: TRLLabel
            Left = 113
            Top = 3
            Width = 30
            Height = 15
            Caption = 'Hora'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabelNomeProfissional: TRLLabel
            Left = 224
            Top = 3
            Width = 66
            Height = 15
            Caption = 'Profissional'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabelNomeCliente: TRLLabel
            Left = 353
            Top = 3
            Width = 42
            Height = 15
            Caption = 'Cliente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabelAgendadoPor: TRLLabel
            Left = 481
            Top = 3
            Width = 81
            Height = 15
            Caption = 'Agendado Por'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object RLBand3: TRLBand
          Left = 38
          Top = 121
          Width = 718
          Height = 64
          object RLDBText1: TRLDBText
            Left = 3
            Top = 3
            Width = 59
            Height = 15
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            Text = ''
          end
          object RLDBText2: TRLDBText
            Left = 113
            Top = 3
            Width = 59
            Height = 15
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            Text = ''
          end
          object RLDBText3: TRLDBText
            Left = 224
            Top = 3
            Width = 59
            Height = 15
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            Text = ''
          end
          object RLDBText4: TRLDBText
            Left = 353
            Top = 3
            Width = 65
            Height = 17
            Text = ''
          end
          object RLDBText5: TRLDBText
            Left = 481
            Top = 3
            Width = 59
            Height = 15
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            Text = ''
          end
        end
        object RLBand4: TRLBand
          Left = 38
          Top = 185
          Width = 718
          Height = 35
          BandType = btFooter
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = True
          Borders.DrawRight = False
          Borders.DrawBottom = True
          object RLLabelTotalAgendamentosPeriodo: TRLLabel
            Left = 3
            Top = 12
            Width = 235
            Height = 15
            Caption = 'TOTAL DE AGENDAMENTOS NO PER'#205'ODO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblTotal: TRLLabel
            Left = 261
            Top = 12
            Width = 10
            Height = 15
            Caption = '0'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
      end
    end
  end
  object ds_padrao: TDataSource
    Left = 731
    Top = 243
  end
end
