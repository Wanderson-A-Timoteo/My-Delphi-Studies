object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Mascara'
  ClientHeight = 320
  ClientWidth = 648
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
    Left = 8
    Top = 24
    Width = 41
    Height = 30
    Alignment = taCenter
    AutoSize = False
    Caption = 'CPF'
  end
  object MaskEdit1: TMaskEdit
    Left = 64
    Top = 21
    Width = 111
    Height = 33
    EditMask = '999.999.999-99;1;_'
    MaxLength = 14
    TabOrder = 0
    Text = '   .   .   -  '
  end
end
