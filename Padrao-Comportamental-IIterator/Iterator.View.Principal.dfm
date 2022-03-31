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
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 65
    Width = 18
    Height = 13
    Caption = 'Qnt'
  end
  object Label2: TLabel
    Left = 24
    Top = 92
    Width = 27
    Height = 13
    Caption = 'Pre'#231'o'
  end
  object Edit1: TEdit
    Left = 64
    Top = 89
    Width = 121
    Height = 21
    TabOrder = 0
    Text = '10'
  end
  object Button1: TButton
    Left = 64
    Top = 116
    Width = 121
    Height = 25
    Caption = 'Add Item'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 304
    Top = 8
    Width = 297
    Height = 249
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
  object Button2: TButton
    Left = 64
    Top = 176
    Width = 121
    Height = 25
    Caption = 'Total Venda'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Edit2: TEdit
    Left = 64
    Top = 62
    Width = 121
    Height = 21
    TabOrder = 4
    Text = '10'
  end
  object Button3: TButton
    Left = 64
    Top = 31
    Width = 121
    Height = 25
    Caption = 'Nova Venda'
    TabOrder = 5
    OnClick = Button3Click
  end
end
