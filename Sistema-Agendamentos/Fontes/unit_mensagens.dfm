object form_mensagens: Tform_mensagens
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 219
  ClientWidth = 593
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object panel_fundo: TPanel
    Left = 0
    Top = 0
    Width = 593
    Height = 219
    Align = alClient
    TabOrder = 0
    DesignSize = (
      593
      219)
    object shape_fundo: TShape
      Left = 1
      Top = 1
      Width = 591
      Height = 217
      Align = alClient
      ExplicitLeft = 2
      ExplicitTop = 0
      ExplicitWidth = 623
      ExplicitHeight = 283
    end
    object label_titulo_janela: TLabel
      Left = 14
      Top = 8
      Width = 74
      Height = 21
      Caption = 'ATEN'#199#195'O'
      Color = 5839365
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5839365
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object img_icone: TImage
      Left = 14
      Top = 59
      Width = 128
      Height = 128
      AutoSize = True
      Center = True
    end
    object label_titulo_msg: TLabel
      Left = 176
      Top = 56
      Width = 62
      Height = 25
      Caption = 'T'#237'tulo: '
      Color = 5839365
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5839365
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object label_mensagem_para_usuario: TLabel
      Left = 176
      Top = 83
      Width = 199
      Height = 21
      Caption = 'Mensagem Para o Usu'#225'rio'
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Panel1: TPanel
      Left = 0
      Top = 35
      Width = 625
      Height = 1
      BevelOuter = bvNone
      Color = clBlack
      ParentBackground = False
      TabOrder = 0
    end
    object pnlBotoesSimNao: TPanel
      Left = 264
      Top = 152
      Width = 305
      Height = 35
      Anchors = [akTop, akRight]
      BevelOuter = bvNone
      TabOrder = 1
      object pnlBotaoNao: TPanel
        Left = 155
        Top = 0
        Width = 150
        Height = 35
        Align = alRight
        BevelOuter = bvNone
        Color = 16730184
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 11976552
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        object SpeedButtonNao: TSpeedButton
          Left = 0
          Top = 0
          Width = 150
          Height = 35
          Cursor = crHandPoint
          Align = alClient
          Caption = 'N'#227'o (ESC)'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = SpeedButtonNaoClick
          ExplicitLeft = 56
          ExplicitTop = 24
          ExplicitWidth = 23
          ExplicitHeight = 22
        end
      end
      object pnlBotaoSim: TPanel
        Left = 0
        Top = 0
        Width = 150
        Height = 35
        Align = alLeft
        BevelOuter = bvNone
        Color = 11976552
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 11976552
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
        object SpeedButtonSim: TSpeedButton
          Left = 0
          Top = 0
          Width = 150
          Height = 35
          Cursor = crHandPoint
          Margins.Top = 4
          Align = alClient
          Caption = 'Sim (Enter)'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = SpeedButtonSimClick
          ExplicitLeft = -1
          ExplicitHeight = 50
        end
      end
    end
  end
end
