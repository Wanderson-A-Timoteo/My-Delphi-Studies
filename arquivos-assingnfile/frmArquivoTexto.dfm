object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Metodo AssingnFile'
  ClientHeight = 152
  ClientWidth = 444
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 48
    Top = 40
    Width = 337
    Height = 19
    Caption = 'Clicar no bot'#227'o para criar o arquivo Texto.txt'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnClick: TButton
    Left = 168
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Bot'#227'o'
    TabOrder = 0
    OnClick = btnClickClick
  end
end
