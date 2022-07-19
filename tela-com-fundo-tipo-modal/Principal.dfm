object FormPrincipal: TFormPrincipal
  Left = 0
  Top = 0
  ClientHeight = 671
  ClientWidth = 1048
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 456
    Top = 24
    Width = 149
    Height = 33
    Caption = 'Tela Inicial'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button1: TButton
    Left = 344
    Top = 272
    Width = 137
    Height = 49
    Caption = 'Cadastrar'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 520
    Top = 272
    Width = 137
    Height = 49
    Caption = 'Pesquisar'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 692
    Top = 272
    Width = 137
    Height = 49
    Caption = 'Relat'#243'rio'
    TabOrder = 2
    OnClick = Button3Click
  end
end
