object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 233
  ClientWidth = 448
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
    Left = 16
    Top = 32
    Width = 39
    Height = 13
    Caption = 'Fun'#231#227'o:'
  end
  object Label2: TLabel
    Left = 18
    Top = 59
    Width = 34
    Height = 13
    Caption = 'Nome: '
  end
  object Label3: TLabel
    Left = 204
    Top = 61
    Width = 36
    Height = 13
    Caption = 'Salario:'
  end
  object Label4: TLabel
    Left = 325
    Top = 61
    Width = 29
    Height = 13
    Caption = 'Bonus'
  end
  object cbFuncao: TComboBox
    Left = 61
    Top = 29
    Width = 364
    Height = 21
    ItemIndex = 0
    TabOrder = 0
    Text = 'Administrativo'
    Items.Strings = (
      'Administrativo'
      'Vendedor'
      'Funcionario')
  end
  object edtNome: TEdit
    Left = 58
    Top = 56
    Width = 140
    Height = 21
    TabOrder = 1
  end
  object edtSalario: TEdit
    Left = 246
    Top = 56
    Width = 60
    Height = 21
    TabOrder = 2
  end
  object edtBonus: TEdit
    Left = 365
    Top = 56
    Width = 60
    Height = 21
    TabOrder = 3
  end
  object btnCadastrar: TButton
    Left = 18
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Cadastrar'
    TabOrder = 4
    OnClick = btnCadastrarClick
  end
  object btnVoltar: TButton
    Left = 319
    Top = 112
    Width = 50
    Height = 25
    Caption = '<<'
    TabOrder = 5
    OnClick = btnVoltarClick
  end
  object btnProximo: TButton
    Left = 375
    Top = 112
    Width = 50
    Height = 25
    Caption = '>>'
    TabOrder = 6
    OnClick = btnProximoClick
  end
  object Memo1: TMemo
    Left = 18
    Top = 151
    Width = 407
    Height = 73
    Lines.Strings = (
      '')
    TabOrder = 7
  end
  object btnCalcular: TButton
    Left = 115
    Top = 112
    Width = 94
    Height = 25
    Caption = 'Calcular Sal'#225'rio'
    TabOrder = 8
    OnClick = btnCalcularClick
  end
end
