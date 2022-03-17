object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 201
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
  object Button1: TButton
    Left = 104
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Bot'#227'o to'
    TabOrder = 0
    OnClick = Button1Click
  end
  object ProgressBar1: TProgressBar
    Left = 24
    Top = 40
    Width = 401
    Height = 33
    Max = 10000
    TabOrder = 1
  end
  object Button2: TButton
    Left = 288
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Bot'#227'o downto'
    TabOrder = 2
    OnClick = Button2Click
  end
end
