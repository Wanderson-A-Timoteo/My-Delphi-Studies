object frmConsultaMovimentacao: TfrmConsultaMovimentacao
  Left = 0
  Top = 0
  Caption = 'Consulta de Movimenta'#231#227'o'
  ClientHeight = 495
  ClientWidth = 719
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 8
    Top = 456
    Width = 226
    Height = 22
    Caption = 'Total de Movimenta'#231#245'es'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblTotal: TLabel
    Left = 240
    Top = 456
    Width = 22
    Height = 22
    Caption = '00'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 719
    Height = 81
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 200
      Top = 22
      Width = 299
      Height = 29
      Caption = 'Consultar Movimenta'#231#245'es'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 81
    Width = 719
    Height = 64
    Align = alTop
    TabOrder = 1
    object Label2: TLabel
      Left = 24
      Top = 6
      Width = 78
      Height = 18
      Caption = 'Data inicial'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 200
      Top = 5
      Width = 66
      Height = 18
      Caption = 'Data final'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 168
      Top = 30
      Width = 9
      Height = 18
      Caption = 'a'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object txtDataInicial: TJvMaskEdit
      Left = 24
      Top = 24
      Width = 120
      Height = 26
      EditMask = '##/##/####;1;_'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 0
      Text = '  /  /    '
    end
    object txtDataFinal: TJvMaskEdit
      Left = 200
      Top = 24
      Width = 120
      Height = 26
      EditMask = '##/##/####;1;_'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 1
      Text = '  /  /    '
    end
    object btnConsultarMovimentacoes: TButton
      Left = 352
      Top = 7
      Width = 209
      Height = 43
      Caption = 'Consultar Movimenta'#231#245'es'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnConsultarMovimentacoesClick
    end
  end
  object DBGridMovimentacoes: TDBGrid
    Left = 8
    Top = 151
    Width = 369
    Height = 283
    DataSource = DataModule1.DataSourceSQLMovimentacoes
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'tipo'
        Title.Caption = 'Tipo'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'data_hora'
        Title.Caption = 'Data/Hora'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'responsavel'
        Title.Caption = 'Respons'#227'vel'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 137
        Visible = True
      end>
  end
  object DBGridProdutos: TDBGrid
    Left = 391
    Top = 151
    Width = 320
    Height = 283
    DataSource = DataModule1.DataSourceSQLMovimentacoesProdutos
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'nome_produto'
        Title.Caption = 'Produto'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quantidade'
        Title.Caption = 'Quantidade'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Visible = True
      end>
  end
end
