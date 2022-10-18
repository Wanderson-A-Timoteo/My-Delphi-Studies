inherited frmCadCLIENTES_REVISOES: TfrmCadCLIENTES_REVISOES
  Caption = 'frmCadCLIENTES_REVISOES'
  PixelsPerInch = 96
  TextHeight = 15
  inherited uniScrollBox1: TUniScrollBox
    inherited paBaseBackGround: TUniContainerPanel
      ScrollHeight = 648
      ScrollWidth = 958
      inherited pgBaseCadControl: TUniPageControl
        ActivePage = tabRegisterDetail
        inherited tabSearchDetail: TUniTabSheet
          inherited UniScrollBox2: TUniScrollBox
            ScrollHeight = 402
            ScrollWidth = 597
          end
        end
        inherited tabRegisterDetail: TUniTabSheet
          ExplicitLeft = 4
          ExplicitTop = 24
          ExplicitWidth = 896
          ExplicitHeight = 465
          inherited paBaseCrudDetail: TUniContainerPanel
            inherited paDataDetail: TUniPanel
              inherited sboxGridBlockTab1: TUniScrollBox
                ScrollHeight = 200
                ScrollWidth = 454
                object rcBlock10: TUniContainerPanel
                  Tag = 1
                  Left = 16
                  Top = 74
                  Width = 121
                  Height = 48
                  Hint = '[['#13#10'cols:xs-12 sm-12 md-6'#13#10']]'
                  ParentColor = False
                  TabOrder = 0
                  DesignSize = (
                    121
                    48)
                  object rcLabel10: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 39
                    Height = 15
                    Hint = ''
                    Caption = 'Ve'#237'culo'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object edLkpCLIENTES_VEICULOS: TUniDBEdit
                    Left = 0
                    Top = 18
                    Width = 119
                    Height = 29
                    Hint = '[[DESCRICAO(carros|codicarro)  CODIVEICULO ! #PLACA ]]'
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                    Color = clInfoBk
                    ReadOnly = True
                    InputType = 'text'
                    OnClick = edLkpCLIENTES_VEICULOSClick
                  end
                end
                object rcBlock20: TUniContainerPanel
                  Tag = 1
                  Left = 22
                  Top = 146
                  Width = 121
                  Height = 48
                  Hint = '[['#13#10'cols:xs-12 sm-12 md-4'#13#10']]'
                  ParentColor = False
                  TabOrder = 1
                  DesignSize = (
                    121
                    48)
                  object UniLabel5: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 64
                    Height = 15
                    Hint = ''
                    Caption = 'KM Revis'#227'o'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBEdit1: TUniDBEdit
                    Left = 0
                    Top = 18
                    Width = 120
                    Height = 29
                    Hint = ''
                    DataField = 'KM_REVISAO'
                    DataSource = dsMaster
                    CharCase = ecUpperCase
                    Alignment = taRightJustify
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock40: TUniContainerPanel
                  Tag = 1
                  Left = 333
                  Top = 151
                  Width = 121
                  Height = 48
                  Hint = '[['#13#10'cols:xs-12 sm-12 md-4'#13#10']]'
                  ParentColor = False
                  TabOrder = 3
                  DesignSize = (
                    121
                    48)
                  object UniLabel6: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 64
                    Height = 15
                    Hint = ''
                    Caption = 'Valor Anual'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit
                    Left = 0
                    Top = 18
                    Width = 120
                    Height = 29
                    Hint = ''
                    DataField = 'TOTAL'
                    DataSource = dsMaster
                    Alignment = taRightJustify
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                end
                object rcBlock30: TUniContainerPanel
                  Tag = 1
                  Left = 170
                  Top = 152
                  Width = 121
                  Height = 48
                  Hint = '[['#13#10'cols:xs-12 sm-12 md-4'#13#10']]'
                  ParentColor = False
                  TabOrder = 2
                  DesignSize = (
                    121
                    48)
                  object UniLabel7: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 29
                    Height = 15
                    Hint = ''
                    Caption = 'Data '
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBDateTimePicker1: TUniDBDateTimePicker
                    Left = 0
                    Top = 18
                    Width = 120
                    Height = 29
                    Hint = ''
                    DataField = 'DATA'
                    DataSource = dsMaster
                    DateTime = 43596.000000000000000000
                    DateFormat = 'dd/MM/yyyy'
                    TimeFormat = 'HH:mm:ss'
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                  end
                end
                object rcBlock50: TUniContainerPanel
                  Tag = 1
                  Left = 169
                  Top = 73
                  Width = 122
                  Height = 48
                  Hint = '[['#13#10'cols:xs-12 sm-12 md-6'#13#10']]'
                  Visible = False
                  ParentColor = False
                  TabOrder = 4
                end
              end
            end
          end
        end
      end
      inherited paBaseButtons: TUniContainerPanel
        ScrollHeight = 485
        ScrollWidth = 37
      end
    end
  end
  inherited ed_FieldMasks: TUniEdit
    TabOrder = 4
  end
  inherited ed_PK: TUniEdit
    TabOrder = 3
  end
  inherited sqlMaster: TFDQuery
    SQL.Strings = (
      'select * from clientes_revisoes')
  end
end
