inherited frmCadT040001: TfrmCadT040001
  inherited paBaseBackGround: TUniContainerPanel
    inherited pgBaseCadControl: TUniPageControl
      inherited tabSearch: TUniTabSheet
        ExplicitTop = 24
        ExplicitHeight = 484
        inherited paBaseRegSearch: TUniContainerPanel
          Height = 484
          ExplicitHeight = 484
          inherited paSearchFilters: TUniPanel
            Height = 484
            ExplicitHeight = 484
            inherited UniScrollBox1: TUniScrollBox
              Height = 484
              ExplicitHeight = 484
              ScrollHeight = 702
              ScrollWidth = 247
              ScrollY = 133
              inherited paSearchFilterDate: TUniContainerPanel
                Top = 397
                ExplicitTop = 397
              end
              inherited paSearchFilter1: TUniContainerPanel
                Top = -84
                ExplicitTop = -84
              end
              inherited paSearchContent1: TUniContainerPanel
                Top = 36
                ExplicitTop = 36
              end
              inherited paSearchFilter2: TUniContainerPanel
                Top = 156
                ExplicitTop = 156
              end
              inherited paSearchContent2: TUniContainerPanel
                Top = 277
                ExplicitTop = 277
              end
              inherited paSearchFilterAndOr: TUniContainerPanel
                Top = 96
                ExplicitTop = 96
              end
              inherited labTitleSearch: TUniLabel
                Top = -123
                ExplicitTop = -123
              end
              inherited paSearchFilterPeriod: TUniContainerPanel
                Top = 337
                ExplicitTop = 337
              end
              inherited paSearchFilterPeriodSelect: TUniContainerPanel
                Top = 457
                ExplicitTop = 457
              end
              inherited paSearchBtn: TUniContainerPanel
                Top = 533
                ExplicitTop = 533
              end
            end
          end
          inherited dbgSearchCRUD: TUniDBGrid
            Height = 484
          end
        end
      end
      inherited tabRegister: TUniTabSheet
        ExplicitTop = 24
        ExplicitHeight = 484
        inherited paBaseRegData1: TUniContainerPanel
          Height = 484
          ExplicitHeight = 484
          ScrollHeight = 484
          ScrollWidth = 924
          object rcBlock10: TUniContainerPanel
            Tag = 1
            Left = 20
            Top = 15
            Width = 100
            Height = 48
            Hint = '[[cols:xs-6 sm-6 md-2]]'
            ParentColor = False
            TabOrder = 1
            DesignSize = (
              100
              48)
            object edID: TUniDBEdit
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
            object UniLabel4: TUniLabel
              Left = 0
              Top = 0
              Width = 11
              Height = 15
              Hint = ''
              Caption = 'Id'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
          end
          object rcBlock20: TUniContainerPanel
            Tag = 1
            Left = 139
            Top = 14
            Width = 100
            Height = 48
            Hint = '[[cols:xs-6 sm-6 md-4]]'
            ParentColor = False
            TabOrder = 2
            DesignSize = (
              100
              48)
            object UniLabel5: TUniLabel
              Left = 0
              Top = 0
              Width = 63
              Height = 15
              Hint = ''
              Caption = 'Description'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 1
            end
            object UniDBEdit1: TUniDBEdit
              Left = 0
              Top = 19
              Width = 100
              Height = 29
              Hint = ''
              DataField = 'DESCRICAO'
              DataSource = dsMaster
              CharCase = ecUpperCase
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
              InputType = 'search'
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
      'select * from t040001')
  end
end
