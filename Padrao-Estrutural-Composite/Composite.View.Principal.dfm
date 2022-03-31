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
  object Label1: TLabel
    Left = 440
    Top = 32
    Width = 13
    Height = 13
    Caption = 'R$'
  end
  object Label2: TLabel
    Left = 146
    Top = 32
    Width = 56
    Height = 13
    Caption = 'Quantidade'
  end
  object Label3: TLabel
    Left = 175
    Top = 75
    Width = 27
    Height = 13
    Caption = 'Pre'#231'o'
  end
  object Label4: TLabel
    Left = 368
    Top = 32
    Width = 71
    Height = 13
    Caption = 'Total a pagar: '
  end
  object Edit1: TEdit
    Left = 208
    Top = 29
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 208
    Top = 72
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object Button1: TButton
    Left = 192
    Top = 115
    Width = 137
    Height = 25
    Caption = 'Adicionar ao Carrinho'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 520
    Top = 27
    Width = 89
    Height = 25
    Caption = 'Calcular Total'
    TabOrder = 3
    OnClick = Button2Click
  end
end
