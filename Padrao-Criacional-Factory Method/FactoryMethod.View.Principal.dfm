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
  object ComboBox1: TComboBox
    Left = 208
    Top = 80
    Width = 193
    Height = 21
    ItemIndex = 0
    TabOrder = 0
    Text = 'Coca Cola'
    Items.Strings = (
      'Coca Cola'
      'Guarana')
  end
  object Button1: TButton
    Left = 248
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
end
