object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 563
  ClientWidth = 981
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 200
    Top = 136
    Width = 281
    Height = 385
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object Memo2: TMemo
    Left = 576
    Top = 136
    Width = 273
    Height = 385
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object Button1: TButton
    Left = 200
    Top = 105
    Width = 281
    Height = 25
    Caption = 'CAIXA -> COZINHA'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 576
    Top = 105
    Width = 273
    Height = 25
    Caption = 'COZINHA <- CAIXA'
    TabOrder = 3
    OnClick = Button2Click
  end
end
