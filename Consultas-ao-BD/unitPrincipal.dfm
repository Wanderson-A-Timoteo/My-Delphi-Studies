object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Consultas '#224' Banco de Dados'
  ClientHeight = 361
  ClientWidth = 579
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
  object LabelPesquisa: TLabel
    Left = 264
    Top = 8
    Width = 66
    Height = 13
    Caption = 'Digite o Nome'
  end
  object RadioGroupOpcoes: TRadioGroup
    Left = 24
    Top = 8
    Width = 217
    Height = 57
    Caption = 'Op'#231#245'es de Consulta'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Nome'
      'Bairro')
    TabOrder = 0
    OnClick = RadioGroupOpcoesClick
  end
  object EditPesquisa: TEdit
    Left = 264
    Top = 27
    Width = 289
    Height = 21
    TabOrder = 1
  end
  object Button1: TButton
    Left = 24
    Top = 88
    Width = 529
    Height = 50
    Caption = 'Realizar Consulta'
    TabOrder = 2
    OnClick = Button1Click
  end
  object DBGrid1: TDBGrid
    Left = 24
    Top = 152
    Width = 529
    Height = 192
    DataSource = DataModule1.DataSourceSQLConsulta
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Title.Caption = 'ID'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Title.Caption = 'NOME'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bairro'
        Title.Caption = 'BAIRRO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'idade'
        Title.Caption = 'IDADE'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = True
      end>
  end
end
