object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 154
  ClientWidth = 469
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
    Left = 14
    Top = 28
    Width = 10
    Height = 13
    Caption = 'Id'
  end
  object Label2: TLabel
    Left = 14
    Top = 71
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object Label3: TLabel
    Left = 14
    Top = 114
    Width = 28
    Height = 13
    Caption = 'Idade'
  end
  object Button1: TButton
    Left = 272
    Top = 125
    Width = 74
    Height = 21
    Caption = 'Gravar'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 47
    Top = 68
    Width = 218
    Height = 21
    TabOrder = 1
  end
  object Edit2: TEdit
    Left = 47
    Top = 25
    Width = 50
    Height = 21
    TabOrder = 2
  end
  object Button2: TButton
    Left = 376
    Top = 124
    Width = 71
    Height = 22
    Caption = 'Exibir'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Edit3: TEdit
    Left = 47
    Top = 111
    Width = 121
    Height = 21
    TabOrder = 4
  end
end
