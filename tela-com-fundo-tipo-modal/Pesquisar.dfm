object FormPesquisar: TFormPesquisar
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = 'Pesquisar'
  ClientHeight = 589
  ClientWidth = 855
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
    Left = 32
    Top = 16
    Width = 753
    Height = 513
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 304
      Top = 24
      Width = 145
      Height = 33
      Caption = 'Pesquisar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Cadastrar: TButton
      Left = 56
      Top = 376
      Width = 193
      Height = 57
      Caption = 'Cadastrar'
      TabOrder = 0
      OnClick = CadastrarClick
    end
    object Button1: TButton
      Left = 288
      Top = 376
      Width = 185
      Height = 57
      Caption = 'Sair'
      TabOrder = 1
      OnClick = Button1Click
    end
  end
end
