object frmCadastroAgendamento: TfrmCadastroAgendamento
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Agendamento'
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
  object Label4: TLabel
    Left = 40
    Top = 87
    Width = 75
    Height = 13
    Caption = 'Nome Completo'
  end
  object Label2: TLabel
    Left = 40
    Top = 143
    Width = 27
    Height = 13
    Caption = 'Data:'
  end
  object Label3: TLabel
    Left = 144
    Top = 143
    Width = 27
    Height = 13
    Caption = 'Hora:'
  end
  object Label5: TLabel
    Left = 40
    Top = 191
    Width = 64
    Height = 13
    Caption = 'Especialidade'
  end
  object Label6: TLabel
    Left = 40
    Top = 247
    Width = 78
    Height = 13
    Caption = 'Nome do M'#233'dico'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 794
    Height = 73
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 161
      Height = 31
      Alignment = taCenter
      Caption = 'Agendamentos'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object DBLookupComboBoxNomeCompleto: TDBLookupComboBox
    Left = 40
    Top = 106
    Width = 289
    Height = 21
    DataField = 'id_paciente'
    DataSource = DataModule1.DataSourceAgendamento
    KeyField = 'id'
    ListField = 'nome'
    ListSource = DataModule1.DataSourcePaciente
    TabOrder = 1
  end
  object DBEditDataAgendada: TDBEdit
    Left = 40
    Top = 162
    Width = 76
    Height = 21
    DataField = 'data_agendada'
    DataSource = DataModule1.DataSourceAgendamento
    MaxLength = 10
    TabOrder = 2
  end
  object DBEditHoraAgendada: TDBEdit
    Left = 144
    Top = 162
    Width = 80
    Height = 21
    DataField = 'hora'
    DataSource = DataModule1.DataSourceAgendamento
    MaxLength = 5
    TabOrder = 3
  end
  object DBComboBoxEspecialidade: TDBComboBox
    Left = 40
    Top = 210
    Width = 184
    Height = 21
    DataField = 'especialidade'
    DataSource = DataModule1.DataSourceAgendamento
    Items.Strings = (
      'Selecione'
      'Cardiologista'
      'Ortopedista'
      'Ginecologista'
      'Pediatra'
      'Oncologista'
      'Cirurgi'#227'o Geral')
    TabOrder = 4
  end
  object DBNavigator1: TDBNavigator
    Left = 40
    Top = 400
    Width = 350
    Height = 49
    DataSource = DataModule1.DataSourceAgendamento
    TabOrder = 5
  end
  object DBEditNomeMedico: TDBEdit
    Left = 40
    Top = 266
    Width = 177
    Height = 21
    DataField = 'medico'
    DataSource = DataModule1.DataSourceAgendamento
    TabOrder = 6
  end
  object DBGridAgendamentos: TDBGrid
    Left = 456
    Top = 106
    Width = 320
    Height = 343
    DataSource = DataModule1.DataSourceAgendamento
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'data_agendada'
        Title.Caption = 'Data'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'hora'
        Title.Caption = 'Hora'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'especialidade'
        Title.Caption = 'Especialidade'
        Visible = True
      end>
  end
end
