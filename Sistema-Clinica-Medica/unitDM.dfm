object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 257
  Width = 368
  object ConexaoPostgres: TFDConnection
    Params.Strings = (
      'Database=clinica_medica'
      'DriverID=PG'
      'User_Name=postgres'
      'Password=fontdata2022')
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 26
  end
  object tbPaciente: TFDTable
    Active = True
    AfterInsert = tbPacienteAfterInsert
    IndexFieldNames = 'id'
    Connection = ConexaoPostgres
    TableName = 'paciente'
    Left = 144
    Top = 26
    object tbPacienteid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
    end
    object tbPacientecpf: TWideStringField
      FieldName = 'cpf'
      Origin = 'cpf'
      EditMask = '###.###.###-##;1;_'
      Size = 14
    end
    object tbPacientenome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 100
    end
    object tbPacientetelefone: TWideStringField
      FieldName = 'telefone'
      Origin = 'telefone'
      EditMask = '(##) #.####-####;1;_'
      Size = 16
    end
    object tbPacientedata_cadastro: TDateField
      FieldName = 'data_cadastro'
      Origin = 'data_cadastro'
    end
  end
  object DataSourcePaciente: TDataSource
    DataSet = tbPaciente
    Left = 144
    Top = 98
  end
  object tbAgendamento: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = ConexaoPostgres
    TableName = 'agendamento'
    Left = 264
    Top = 24
    object tbAgendamentoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
    end
    object tbAgendamentoid_paciente: TIntegerField
      FieldName = 'id_paciente'
      Origin = 'id_paciente'
    end
    object tbAgendamentodata_agendada: TDateField
      FieldName = 'data_agendada'
      Origin = 'data_agendada'
      EditMask = '!99/99/0000;1;_'
    end
    object tbAgendamentohora: TWideStringField
      FieldName = 'hora'
      Origin = 'hora'
      EditMask = '!90:00;1;_'
      Size = 5
    end
    object tbAgendamentoespecialidade: TWideStringField
      FieldName = 'especialidade'
      Origin = 'especialidade'
      Size = 30
    end
    object tbAgendamentomedico: TWideStringField
      FieldName = 'medico'
      Origin = 'medico'
      Size = 50
    end
  end
  object DataSourceAgendamento: TDataSource
    DataSet = tbAgendamento
    Left = 264
    Top = 96
  end
end
