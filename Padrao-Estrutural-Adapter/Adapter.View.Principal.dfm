object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 299
  ClientWidth = 635
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
  object Edit1: TEdit
    Left = 40
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'Produto'
  end
  object Edit2: TEdit
    Left = 40
    Top = 83
    Width = 121
    Height = 21
    TabOrder = 1
    Text = '10'
  end
  object Button1: TButton
    Left = 40
    Top = 110
    Width = 121
    Height = 25
    Caption = 'Add'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 328
    Top = 24
    Width = 299
    Height = 225
    Lines.Strings = (
      'Memo1')
    TabOrder = 3
  end
  object Button2: TButton
    Left = 328
    Top = 255
    Width = 299
    Height = 25
    Caption = 'Lista'
    TabOrder = 4
    OnClick = Button2Click
  end
end
