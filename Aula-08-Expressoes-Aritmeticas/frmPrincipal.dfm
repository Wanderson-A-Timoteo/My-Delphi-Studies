object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 155
  ClientWidth = 447
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
    Left = 225
    Top = 35
    Width = 95
    Height = 13
    Caption = '='
  end
  object Button1: TButton
    Left = 24
    Top = 59
    Width = 35
    Height = 25
    Caption = '+'
    TabOrder = 0
    OnClick = Button1Click
  end
  object edtValue2: TEdit
    Left = 120
    Top = 32
    Width = 89
    Height = 21
    TabOrder = 1
  end
  object edtValue1: TEdit
    Left = 24
    Top = 32
    Width = 81
    Height = 21
    TabOrder = 2
  end
  object edtResultado: TEdit
    Left = 248
    Top = 32
    Width = 72
    Height = 21
    TabOrder = 3
  end
  object Button2: TButton
    Left = 65
    Top = 59
    Width = 40
    Height = 25
    Caption = '-'
    TabOrder = 4
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 111
    Top = 59
    Width = 42
    Height = 25
    Caption = 'x'
    TabOrder = 5
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 159
    Top = 59
    Width = 42
    Height = 25
    Caption = 'div'
    TabOrder = 6
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 207
    Top = 59
    Width = 42
    Height = 25
    Caption = '/'
    TabOrder = 7
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 255
    Top = 59
    Width = 42
    Height = 25
    Caption = 'mod'
    TabOrder = 8
    OnClick = Button6Click
  end
end
