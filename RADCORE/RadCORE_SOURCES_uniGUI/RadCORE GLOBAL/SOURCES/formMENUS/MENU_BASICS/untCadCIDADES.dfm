inherited frmCadCIDADES: TfrmCadCIDADES
  inherited paBaseBackGround: TUniContainerPanel
    inherited pgBaseCadControl: TUniPageControl
      ActivePage = tabRegister
      inherited tabSearch: TUniTabSheet
        ExplicitTop = 24
        ExplicitHeight = 510
        inherited paBaseRegSearch: TUniContainerPanel
          ExplicitHeight = 510
          inherited paSearchFilters: TUniPanel
            inherited UniScrollBox1: TUniScrollBox
              ScrollHeight = 723
              ScrollWidth = 164
              ScrollY = 220
              inherited labTitleSearch: TUniLabel
                Top = -210
                ExplicitTop = -210
              end
            end
          end
        end
      end
      inherited tabRegister: TUniTabSheet
        ExplicitTop = 24
        ExplicitHeight = 510
        inherited paBaseRegData1: TUniContainerPanel
          Height = 510
          ExplicitHeight = 510
          ScrollHeight = 510
          ScrollWidth = 945
          object pgComplementData: TUniPageControl
            Left = 0
            Top = 0
            Width = 945
            Height = 510
            Hint = ''
            Margins.Left = 10
            Margins.Top = 10
            Margins.Right = 10
            Margins.Bottom = 10
            ActivePage = tabGeral
            Align = alClient
            TabOrder = 1
            object tabGeral: TUniTabSheet
              Hint = ''
              Caption = 'Geral'
              object sboxTab1: TUniScrollBox
                Left = 0
                Top = 0
                Width = 937
                Height = 480
                Hint = ''
                Align = alClient
                TabOrder = 0
                ScrollHeight = 126
                ScrollWidth = 550
                object rcBlock10: TUniContainerPanel
                  Tag = 1
                  Left = 16
                  Top = 10
                  Width = 123
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 0
                  DesignSize = (
                    123
                    48)
                  object edCodigo: TUniDBEdit
                    Left = 1
                    Top = 18
                    Width = 121
                    Height = 29
                    Hint = ''
                    DataField = 'codigo'
                    DataSource = dsMaster
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Color = clWhite
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    Font.Style = [fsBold]
                    TabOrder = 1
                    Color = clGray
                    ReadOnly = True
                  end
                  object UniLabel3: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 38
                    Height = 15
                    Hint = ''
                    Caption = 'C'#243'digo'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock20: TUniContainerPanel
                  Tag = 1
                  Left = 16
                  Top = 78
                  Width = 123
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 1
                  DesignSize = (
                    123
                    48)
                  object UniLabel5: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 13
                    Height = 13
                    Hint = ''
                    Caption = 'UF'
                    ParentFont = False
                    TabOrder = 1
                  end
                  object cbxUFS: TUniDBComboBox
                    Left = 1
                    Top = 18
                    Width = 121
                    Height = 29
                    Hint = '[['#13#10'cbx-fill:ufs descricao |'#13#10']]'#13#10
                    Anchors = [akLeft, akTop, akRight]
                    DataField = 'UF'
                    DataSource = dsMaster
                    TabOrder = 2
                    IconItems = <>
                  end
                end
                object rcBlock30: TUniContainerPanel
                  Tag = 1
                  Left = 156
                  Top = 77
                  Width = 245
                  Height = 48
                  Hint = '[['#13#10'cols:xs-12 sm-12 md-6'#13#10']]'
                  ParentColor = False
                  TabOrder = 2
                  DesignSize = (
                    245
                    48)
                  object UniDBEdit1: TUniDBEdit
                    Left = 1
                    Top = 18
                    Width = 243
                    Height = 29
                    Hint = ''
                    DataField = 'DESCRICAO'
                    DataSource = dsMaster
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                  end
                  object UniLabel4: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 46
                    Height = 13
                    Hint = ''
                    Caption = 'Descri'#231#227'o'
                    ParentFont = False
                    TabOrder = 2
                  end
                end
                object rcBlock40: TUniContainerPanel
                  Tag = 1
                  Left = 427
                  Top = 74
                  Width = 123
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 3
                  DesignSize = (
                    123
                    48)
                  object UniDBEdit2: TUniDBEdit
                    Left = 1
                    Top = 18
                    Width = 121
                    Height = 29
                    Hint = ''
                    DataField = 'CODIIBGE'
                    DataSource = dsMaster
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                  end
                  object UniLabel1: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 49
                    Height = 13
                    Hint = ''
                    Caption = 'C'#243'd. IBGE'
                    ParentFont = False
                    TabOrder = 2
                  end
                end
              end
            end
          end
        end
      end
    end
    inherited paBaseButtons: TUniContainerPanel
      ScrollHeight = 533
      ScrollWidth = 37
    end
  end
  inherited sqlMaster: TFDQuery
    SQL.Strings = (
      'SELECT'
      ''
      'tab.* '
      ''
      'FROM  cidades  tab'
      '')
  end
end
