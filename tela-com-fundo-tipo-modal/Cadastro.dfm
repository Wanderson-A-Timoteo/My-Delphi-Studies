object FormCadastro: TFormCadastro
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = 'Tela de Cadastro'
  ClientHeight = 585
  ClientWidth = 851
  Color = clBlack
  TransparentColor = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object PanelContainer: TPanel
    Left = 64
    Top = 32
    Width = 737
    Height = 489
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 305
      Top = 26
      Width = 161
      Height = 33
      Caption = 'Cadastro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Button1: TButton
      Left = 40
      Top = 392
      Width = 137
      Height = 41
      Caption = 'Pesquisar'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 192
      Top = 392
      Width = 129
      Height = 41
      Caption = 'Sair'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
end
