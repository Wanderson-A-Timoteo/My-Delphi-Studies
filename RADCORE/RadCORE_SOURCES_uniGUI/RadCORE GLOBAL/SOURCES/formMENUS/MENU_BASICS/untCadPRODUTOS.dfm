inherited frmCadPRODUTOS: TfrmCadPRODUTOS
  inherited paBaseBackGround: TUniContainerPanel
    inherited pgBaseCadControl: TUniPageControl
      ActivePage = tabRegister
      inherited tabSearch: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 924
        ExplicitHeight = 484
        inherited paBaseRegSearch: TUniContainerPanel
          ExplicitHeight = 484
          inherited paSearchFilters: TUniPanel
            ExplicitHeight = 484
            inherited UniScrollBox1: TUniScrollBox
              ExplicitHeight = 484
              ScrollHeight = 928
              ScrollWidth = 247
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
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 924
        ExplicitHeight = 484
        inherited paBaseRegData1: TUniContainerPanel
          Height = 484
          ExplicitHeight = 484
          ScrollHeight = 484
          ScrollWidth = 924
          object pgComplementData: TUniPageControl
            Left = 0
            Top = 0
            Width = 924
            Height = 484
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
                Width = 916
                Height = 454
                Hint = ''
                Align = alClient
                TabOrder = 0
                ScrollHeight = 246
                ScrollWidth = 511
                object rcBlock10: TUniContainerPanel
                  Tag = 1
                  Left = 11
                  Top = 10
                  Width = 100
                  Height = 48
                  Hint = '[[cols:xs-6 sm-6 md-2 ]]'
                  ParentColor = False
                  TabOrder = 0
                  DesignSize = (
                    100
                    48)
                  object edCodigo: TUniDBEdit
                    Left = 0
                    Top = 18
                    Width = 100
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
                  object UniLabel1: TUniLabel
                    Left = 0
                    Top = -3
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
                object rcBlock30: TUniContainerPanel
                  Tag = 1
                  Left = 135
                  Top = 9
                  Width = 376
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-8]]'
                  ParentColor = False
                  TabOrder = 1
                  DesignSize = (
                    376
                    48)
                  object UniLabel3: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 55
                    Height = 15
                    Hint = ''
                    Caption = 'Descri'#231#227'o'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBEdit1: TUniDBEdit
                    Left = 0
                    Top = 18
                    Width = 375
                    Height = 29
                    Hint = '[[valid:blank=Nome]]'
                    DataField = 'DESCRICAO'
                    DataSource = dsMaster
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                  end
                end
                object rcBlock60: TUniContainerPanel
                  Tag = 1
                  Left = 16
                  Top = 198
                  Width = 120
                  Height = 48
                  Hint = '[[cols:xs-6 sm-6 md-3]]'
                  ParentColor = False
                  TabOrder = 2
                  DesignSize = (
                    120
                    48)
                  object UniLabel4: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 64
                    Height = 13
                    Hint = ''
                    Caption = 'Valor Compra'
                    ParentFont = False
                    TabOrder = 1
                  end
                  object UniDBNumberEdit1: TUniDBFormattedNumberEdit
                    Left = 0
                    Top = 19
                    Width = 120
                    Height = 29
                    Hint = ''
                    DataField = 'VALOR_COMPRA'
                    DataSource = dsMaster
                    Alignment = taRightJustify
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                end
                object rcBlock70: TUniContainerPanel
                  Tag = 1
                  Left = 168
                  Top = 198
                  Width = 120
                  Height = 48
                  Hint = '[[cols:xs-6 sm-6 md-3]]'
                  ParentColor = False
                  TabOrder = 3
                  DesignSize = (
                    120
                    48)
                  object UniLabel5: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 57
                    Height = 13
                    Hint = ''
                    Caption = 'Valor Venda'
                    ParentFont = False
                    TabOrder = 1
                  end
                  object UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit
                    Left = 0
                    Top = 19
                    Width = 120
                    Height = 29
                    Hint = ''
                    DataField = 'VALOR_VENDA'
                    DataSource = dsMaster
                    Alignment = taRightJustify
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                end
                object rcBlock40: TUniContainerPanel
                  Tag = 1
                  Left = 29
                  Top = 102
                  Width = 121
                  Height = 48
                  Hint = '[['#13#10'cols:xs-12 sm-12 md-6]]'
                  ParentColor = False
                  TabOrder = 4
                  DesignSize = (
                    121
                    48)
                  object rcLabel4400: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 29
                    Height = 13
                    Hint = ''
                    Caption = 'Grupo'
                    ParentFont = False
                    TabOrder = 1
                  end
                  object edLKPGRUPOS: TUniDBEdit
                    Left = 0
                    Top = 18
                    Width = 120
                    Height = 29
                    Hint = '[['#13#10'descricao codigrupo !'#13#10']]'
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                    Color = clInfoBk
                  end
                end
                object rcBlock50: TUniContainerPanel
                  Tag = 1
                  Left = 187
                  Top = 102
                  Width = 121
                  Height = 48
                  Hint = '[['#13#10'cols:xs-12 sm-12 md-6]]'
                  ParentColor = False
                  TabOrder = 5
                  DesignSize = (
                    121
                    48)
                  object UniLabel6: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 29
                    Height = 13
                    Hint = ''
                    Caption = 'Marca'
                    ParentFont = False
                    TabOrder = 1
                  end
                  object edLKPMARCAS: TUniDBEdit
                    Left = 0
                    Top = 18
                    Width = 120
                    Height = 29
                    Hint = '[['#13#10'descricao codimarca !'#13#10']]'
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                    Color = clInfoBk
                  end
                end
              end
            end
          end
        end
      end
    end
    inherited paBaseButtons: TUniContainerPanel
      ScrollHeight = 517
      ScrollWidth = 37
    end
  end
  inherited sqlMaster: TFDQuery
    SQL.Strings = (
      'SELECT'
      ''
      'tab.* '
      ''
      'FROM  PRODUTOS tab'
      '')
  end
end
