object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 361
  ClientWidth = 718
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
  object Button1: TButton
    Left = 120
    Top = 80
    Width = 145
    Height = 25
    Caption = 'Pre'#231'o Normal'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 120
    Top = 111
    Width = 145
    Height = 25
    Caption = 'Pre'#231'o Promo'#231#227'o'
    TabOrder = 1
    OnClick = Button2Click
  end
  object ComboBox1: TComboBox
    Left = 120
    Top = 53
    Width = 145
    Height = 21
    ItemIndex = 0
    TabOrder = 2
    Text = 'Varejo'
    Items.Strings = (
      'Varejo'
      'Atacado')
  end
  object Edit1: TEdit
    Left = 360
    Top = 53
    Width = 121
    Height = 21
    TabOrder = 3
    Text = '10'
  end
end
