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
  object Label1: TLabel
    Left = 336
    Top = 72
    Width = 3
    Height = 13
  end
  object Label2: TLabel
    Left = 345
    Top = 72
    Width = 64
    Height = 16
    Alignment = taRightJustify
    Caption = 'Letras'
  end
  object Memo1: TMemo
    Left = 16
    Top = 128
    Width = 409
    Height = 57
    Lines.Strings = (
      '')
    TabOrder = 0
  end
  object Button1: TButton
    Left = 168
    Top = 64
    Width = 97
    Height = 25
    Caption = 'Bot'#227'o'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 98
    Top = 24
    Width = 241
    Height = 21
    TabOrder = 2
  end
  object Eventos1: TEventos
    Status = Eventos1Status
    Left = 24
    Top = 16
  end
end
