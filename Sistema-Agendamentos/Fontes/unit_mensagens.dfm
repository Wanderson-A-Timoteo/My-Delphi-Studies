object form_mensagens: Tform_mensagens
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 261
  ClientWidth = 625
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
    Width = 625
    Height = 261
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      625
      261)
    object shape_fundo: TShape
      Left = 0
      Top = 0
      Width = 625
      Height = 261
      Align = alClient
      ExplicitWidth = 649
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
      Top = 83
      Width = 177
      Height = 159
      AutoSize = True
      Center = True
    end
    object label_titulo_msg: TLabel
      Left = 198
      Top = 40
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
      Left = 197
      Top = 64
      Width = 414
      Height = 125
      AutoSize = False
      Caption = 'Mensagem Para o Usu'#225'rio'
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      WordWrap = True
    end
    object panel_borda_header: TPanel
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
      Left = 303
      Top = 195
      Width = 305
      Height = 47
      Anchors = [akTop, akRight]
      BevelOuter = bvNone
      TabOrder = 1
      object pnlBotaoNao: TPanel
        Left = 155
        Top = 0
        Width = 150
        Height = 47
        Align = alRight
        BevelOuter = bvNone
        Color = 5839365
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 5839365
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        object SpeedButtonNao: TSpeedButton
          Left = 2
          Top = 2
          Width = 146
          Height = 43
          Cursor = crHandPoint
          Align = alCustom
          Caption = 'N'#227'o (ESC)'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = SpeedButtonNaoClick
          OnMouseEnter = SpeedButtonNaoMouseEnter
          OnMouseLeave = SpeedButtonNaoMouseLeave
        end
      end
      object pnlBotaoSim: TPanel
        Left = 0
        Top = 0
        Width = 150
        Height = 47
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
          Left = 2
          Top = 2
          Width = 146
          Height = 43
          Cursor = crHandPoint
          Margins.Top = 4
          Align = alCustom
          Caption = 'Sim (Enter)'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = SpeedButtonSimClick
          OnMouseEnter = SpeedButtonSimMouseEnter
          OnMouseLeave = SpeedButtonSimMouseLeave
        end
      end
    end
  end
end
