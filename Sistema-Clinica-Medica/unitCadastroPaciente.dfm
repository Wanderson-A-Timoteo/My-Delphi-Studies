object frmCadastroPaciente: TfrmCadastroPaciente
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Paciente'
  ClientHeight = 471
  ClientWidth = 794
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
  object Label3: TLabel
    Left = 40
    Top = 141
    Width = 23
    Height = 13
    Caption = 'CPF:'
  end
  object Label4: TLabel
    Left = 40
    Top = 87
    Width = 75
    Height = 13
    Caption = 'Nome Completo'
  end
  object Label5: TLabel
    Left = 40
    Top = 205
    Width = 33
    Height = 13
    Caption = 'Celular'
  end
  object Label6: TLabel
    Left = 40
    Top = 261
    Width = 85
    Height = 13
    Caption = 'Data de Cadastro'
  end
  object Label7: TLabel
    Left = 458
    Top = 87
    Width = 83
    Height = 13
    Caption = 'Buscar Paciente: '
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 794
    Height = 57
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 40
      Top = 12
      Width = 224
      Height = 31
      Alignment = taCenter
      Caption = 'Cadastro de Paciente'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object DBEditCPF: TDBEdit
    Left = 40
    Top = 160
    Width = 163
    Height = 21
    DataField = 'cpf'
    DataSource = DataModule1.DataSourcePaciente
    MaxLength = 14
    TabOrder = 2
  end
  object DBEditNome: TDBEdit
    Left = 40
    Top = 106
    Width = 289
    Height = 21
    DataField = 'nome'
    DataSource = DataModule1.DataSourcePaciente
    TabOrder = 1
  end
  object DBEditTelefone: TDBEdit
    Left = 40
    Top = 224
    Width = 121
    Height = 21
    DataField = 'telefone'
    DataSource = DataModule1.DataSourcePaciente
    MaxLength = 16
    TabOrder = 3
  end
  object DBEditDataCadastro: TDBEdit
    Left = 40
    Top = 280
    Width = 121
    Height = 21
    DataField = 'data_cadastro'
    DataSource = DataModule1.DataSourcePaciente
    ReadOnly = True
    TabOrder = 4
  end
  object DBGrid1: TDBGrid
    Left = 458
    Top = 136
    Width = 320
    Height = 291
    DataSource = DataModule1.DataSourcePaciente
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'nome'
        Title.Caption = 'Pacientes Cadastrados'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -19
        Title.Font.Name = 'Arial Narrow'
        Title.Font.Style = [fsBold]
        Visible = True
      end>
  end
  object DBNavigator1: TDBNavigator
    Left = 40
    Top = 392
    Width = 320
    Height = 35
    DataSource = DataModule1.DataSourcePaciente
    TabOrder = 7
  end
  object EditBuscarPaciente: TEdit
    Left = 458
    Top = 106
    Width = 320
    Height = 21
    TabOrder = 5
    OnChange = EditBuscarPacienteChange
  end
end
