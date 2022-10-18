inherited frmCadBASICS: TfrmCadBASICS
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
            inherited UniScrollBox1: TUniScrollBox
              Height = 484
              ScrollHeight = 670
              ScrollWidth = 247
              ScrollY = 162
              inherited paSearchFilterDate: TUniContainerPanel
                Top = 368
                ExplicitTop = 368
              end
              inherited paSearchFilter1: TUniContainerPanel
                Top = -113
                ExplicitTop = -113
              end
              inherited paSearchContent1: TUniContainerPanel
                Top = 7
                ExplicitTop = 7
              end
              inherited paSearchFilter2: TUniContainerPanel
                Top = 127
                ExplicitTop = 127
              end
              inherited paSearchContent2: TUniContainerPanel
                Top = 248
                ExplicitTop = 248
              end
              inherited paSearchFilterAndOr: TUniContainerPanel
                Top = 67
                ExplicitTop = 67
              end
              inherited labTitleSearch: TUniLabel
                Top = -152
                ExplicitTop = -152
              end
              inherited paSearchFilterPeriod: TUniContainerPanel
                Top = 308
                ExplicitTop = 308
              end
              inherited paSearchFilterPeriodSelect: TUniContainerPanel
                Top = 428
                ExplicitTop = 428
              end
              inherited paSearchBtn: TUniContainerPanel
                Top = 472
                inherited btnSearchCRUD: TUniBitBtn
                  ScreenMask.Target = Owner
                end
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
          object rcBlock1: TUniContainerPanel
            Tag = 1
            Left = 16
            Top = 11
            Width = 100
            Height = 48
            Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
            ParentColor = False
            TabOrder = 1
            DesignSize = (
              100
              48)
            object edID: TUniDBEdit
              Left = 0
              Top = 19
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
            object labID: TUniLabel
              Left = 0
              Top = 0
              Width = 12
              Height = 15
              Hint = ''
              Caption = 'ID'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
          end
          object rcBlock4: TUniContainerPanel
            Tag = 1
            Left = 16
            Top = 70
            Width = 207
            Height = 48
            Hint = '[['#13#10'cols:xs-12 sm-12 md-10'#13#10']]'
            ParentColor = False
            TabOrder = 2
            DesignSize = (
              207
              48)
            object edDescription: TUniDBEdit
              Left = 0
              Top = 19
              Width = 207
              Height = 29
              Hint = '[['#13#10'valid:not-exists<str> |'#13#10'valid-required:top-in'#13#10']]'
              DataField = 'DESCRICAO'
              DataSource = dsMaster
              CharCase = ecUpperCase
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
            end
            object labDescription: TUniLabel
              Left = 0
              Top = 0
              Width = 63
              Height = 15
              Hint = ''
              Caption = 'Description'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
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
  inherited ed_Table_ItemSel: TUniEdit
    TabOrder = 8
  end
  inherited ed_FormOrigin: TUniEdit
    TabOrder = 9
  end
  inherited ed_FormOrigin_Tab: TUniEdit
    TabOrder = 10
  end
  inherited ed_Table_Status: TUniEdit
    TabOrder = 11
  end
  inherited ed_Order_Search: TUniEdit
    TabOrder = 1
  end
  inherited ed_Where_Search: TUniEdit
    TabOrder = 2
  end
  inherited ed_CodMaster: TUniEdit
    TabOrder = 3
  end
  inherited ed_PK: TUniEdit
    TabOrder = 4
  end
  inherited ed_FieldMasks: TUniEdit
    TabOrder = 5
  end
  inherited ed_OldPKValue: TUniEdit
    TabOrder = 6
  end
  inherited ed_Table_Status_OLD: TUniEdit
    TabOrder = 7
  end
  inherited sqlMaster: TFDQuery
    SQL.Strings = (
      'SELECT'
      ''
      'tab.* '
      ''
      'FROM  rotas  tab'
      '')
  end
end
