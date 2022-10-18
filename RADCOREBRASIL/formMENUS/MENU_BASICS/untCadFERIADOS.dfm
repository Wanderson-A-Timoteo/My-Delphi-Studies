inherited frmCadFERIADOS: TfrmCadFERIADOS
  inherited paBaseBackGround: TUniContainerPanel
    inherited paBaseTop: TUniContainerPanel
      inherited paBaseTopTitle: TUniContainerPanel
        inherited labNew: TUniLabel
          Hint = '[['#13#10'ico:fas-plus'#13#10']]'
        end
      end
    end
    inherited pgBaseCadControl: TUniPageControl
      inherited tabSearch: TUniTabSheet
        ExplicitTop = 24
        ExplicitHeight = 510
        inherited paBaseRegSearch: TUniContainerPanel
          Height = 510
          ExplicitHeight = 510
          inherited dbgSearchCRUD: TUniDBGrid
            Height = 510
          end
          inherited paSearchFilters: TUniPanel
            Height = 484
            ExplicitHeight = 484
            inherited UniScrollBox1: TUniScrollBox
              Height = 484
              ExplicitHeight = 484
              ScrollHeight = 863
              ScrollWidth = 164
              ScrollY = 210
              inherited paSearchFilterDate: TUniContainerPanel
                Top = 320
                ExplicitTop = 320
              end
              inherited paSearchFilter1: TUniContainerPanel
                Top = -204
                ExplicitTop = -204
              end
              inherited paSearchContent1: TUniContainerPanel
                Top = -41
                ExplicitTop = -41
              end
              inherited paSearchFilter2: TUniContainerPanel
                Top = 79
                ExplicitTop = 79
              end
              inherited paSearchContent2: TUniContainerPanel
                Top = 200
                ExplicitTop = 200
              end
              inherited paSearchFilterAndOr: TUniContainerPanel
                Top = 19
                ExplicitTop = 19
              end
              inherited labTitleSearch: TUniLabel
                Top = -200
                ExplicitTop = -200
              end
              inherited paSearchFilterPeriod: TUniContainerPanel
                Top = 260
                ExplicitTop = 260
              end
              inherited paSearchFilterPeriodSelect: TUniContainerPanel
                Top = 380
                ExplicitTop = 380
              end
              inherited paSearchBtn: TUniContainerPanel
                Top = 617
                ExplicitTop = 617
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
          object rcBlock10: TUniContainerPanel
            Tag = 1
            Left = 12
            Top = 8
            Width = 176
            Height = 48
            Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
            ParentColor = False
            TabOrder = 0
            object edCodigo: TUniDBEdit
              Left = 0
              Top = 19
              Width = 175
              Height = 28
              Hint = ''
              DataField = 'codigo'
              DataSource = dsMaster
              ParentFont = False
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'Calibri'
              Font.Style = [fsBold]
              TabOrder = 1
              Color = clGray
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
            Left = 9
            Top = 76
            Width = 176
            Height = 48
            Hint = '[['#13#10'cols:xs-12 sm-12 md-3'#13#10']]'
            ParentColor = False
            TabOrder = 1
            DesignSize = (
              176
              48)
            object edDataCad: TUniDBDateTimePicker
              Left = 0
              Top = 18
              Width = 175
              Height = 29
              Hint = '[['#13#10'mask:date'#13#10']]'
              DataField = 'DATA'
              DataSource = dsMaster
              DateTime = 43596.000000000000000000
              DateFormat = 'dd/MM/yyyy'
              TimeFormat = 'HH:mm:ss'
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
            end
            object UniLabel5: TUniLabel
              Left = 0
              Top = 0
              Width = 29
              Height = 15
              Hint = ''
              Caption = 'Data '
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
          end
          object rcBlock30: TUniContainerPanel
            Tag = 1
            Left = 216
            Top = 76
            Width = 366
            Height = 48
            Hint = '[['#13#10'cols:xs-12 sm-12 md-5'#13#10']]'
            ParentColor = False
            TabOrder = 2
            DesignSize = (
              366
              48)
            object UniLabel4: TUniLabel
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
              Width = 366
              Height = 29
              Hint = ''
              DataField = 'DESCRICAO'
              DataSource = dsMaster
              CharCase = ecUpperCase
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
            end
          end
          object rcBlock40: TUniContainerPanel
            Tag = 1
            Left = 12
            Top = 151
            Width = 187
            Height = 120
            Hint = '[['#13#10'cols:xs-12 sm-12 md-3'#13#10']]'
            ParentColor = False
            TabOrder = 3
            DesignSize = (
              187
              120)
            object labFeriados: TUniLabel
              Left = 0
              Top = 32
              Width = 20
              Height = 20
              Hint = '[[bschk:0 field:facultativo ds:dsmaster]]'
              TextConversion = txtHTML
              AutoSize = False
              Caption = 'Facultativo'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              Font.Style = [fsUnderline]
              ParentColor = False
              Color = clBtnFace
              TabOrder = 1
            end
            object UniLabel54: TUniLabel
              Left = 0
              Top = 2
              Width = 184
              Height = 19
              Hint = ''
              TextConversion = txtHTML
              AutoSize = False
              Caption = 'DEMO bschk<br><hr>'
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Color = clSilver
              Font.Height = -13
              Font.Name = 'Calibri'
              Font.Style = [fsBold]
              TabOrder = 2
            end
            object UniLabel1: TUniLabel
              Left = 26
              Top = 36
              Width = 61
              Height = 15
              Hint = ''
              Caption = 'Facultativo'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 3
            end
            object labRcCollapse01: TUniLabel
              Left = 169
              Top = 0
              Width = 10
              Height = 26
              Hint = '[['#13#10'collapse:rcBlock40 off-28 collapsed:mobile'#13#10']]'#13#10#13#10
              TextConversion = txtHTML
              Caption = '^'
              Anchors = [akTop, akRight]
              ParentFont = False
              Font.Height = -21
              Font.Name = 'Calibri'
              ParentColor = False
              Color = clBlack
              TabOrder = 4
            end
          end
          object rcBlock50: TUniContainerPanel
            Tag = 1
            Left = 231
            Top = 161
            Width = 187
            Height = 120
            Hint = '[['#13#10'cols:xs-12 sm-12 md-3'#13#10']]'
            ParentColor = False
            TabOrder = 4
            DesignSize = (
              187
              120)
            object labRcCollapseSwt: TUniLabel
              Left = 0
              Top = 2
              Width = 184
              Height = 19
              Hint = ''
              TextConversion = txtHTML
              AutoSize = False
              Caption = 'DEMO bsswt<br><hr>'
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Color = clSilver
              Font.Height = -13
              Font.Name = 'Calibri'
              Font.Style = [fsBold]
              TabOrder = 1
            end
            object UniLabel6: TUniLabel
              Left = 71
              Top = 29
              Width = 33
              Height = 20
              Hint = '[[bsswt:0 field:municipal ds:dsmaster ]]'
              TextConversion = txtHTML
              AutoSize = False
              Caption = 'Municipal'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              Font.Style = [fsUnderline]
              ParentColor = False
              Color = clBtnFace
              TabOrder = 2
            end
            object UniLabel11: TUniLabel
              Left = 71
              Top = 57
              Width = 33
              Height = 20
              Hint = '[[bsswt:0 field:estadual ds:dsmaster ]]'
              TextConversion = txtHTML
              AutoSize = False
              Caption = 'Estadual'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              Font.Style = [fsUnderline]
              ParentColor = False
              Color = clBtnFace
              TabOrder = 3
            end
            object UniLabel14: TUniLabel
              Left = 71
              Top = 85
              Width = 33
              Height = 20
              Hint = '[[bsswt:0* field:federal ds:dsmaster ]]'
              TextConversion = txtHTML
              AutoSize = False
              Caption = 'Federal'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              Font.Style = [fsUnderline]
              ParentColor = False
              Color = clBtnFace
              TabOrder = 4
            end
            object UniLabel10: TUniLabel
              Left = 0
              Top = 32
              Width = 57
              Height = 15
              Hint = ''
              Caption = 'Municipal'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 5
            end
            object UniLabel12: TUniLabel
              Left = 0
              Top = 60
              Width = 48
              Height = 15
              Hint = ''
              Caption = 'Estadual'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 6
            end
            object UniLabel15: TUniLabel
              Left = 0
              Top = 88
              Width = 41
              Height = 15
              Hint = ''
              Caption = 'Federal'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 7
            end
            object labRcCollapse02: TUniLabel
              Left = 169
              Top = 0
              Width = 10
              Height = 26
              Hint = '[['#13#10'collapse:rcBlock50 off-28 collapsed:mobile'#13#10']]'#13#10
              TextConversion = txtHTML
              Caption = '^'
              Anchors = [akTop, akRight]
              ParentFont = False
              Font.Height = -21
              Font.Name = 'Calibri'
              ParentColor = False
              Color = clBlack
              TabOrder = 8
            end
          end
          object rcBlock60: TUniContainerPanel
            Tag = 1
            Left = 450
            Top = 151
            Width = 187
            Height = 120
            Hint = '[['#13#10'cols:xs-12 sm-12 md-3'#13#10']]'
            ParentColor = False
            TabOrder = 5
            DesignSize = (
              187
              120)
            object UniLabel18: TUniLabel
              Left = 0
              Top = 2
              Width = 184
              Height = 19
              Hint = ''
              TextConversion = txtHTML
              AutoSize = False
              Caption = 'DEMO bsrgp<br><hr>'
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Color = clSilver
              Font.Height = -13
              Font.Name = 'Calibri'
              Font.Style = [fsBold]
              TabOrder = 1
            end
            object bsrgpTipo01_M_db: TUniLabel
              Left = 0
              Top = 33
              Width = 20
              Height = 20
              Hint = '[['#13#10'ds:dsMaster'#13#10']]'
              TextConversion = txtHTML
              AutoSize = False
              Caption = 'Municipal'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              Font.Style = [fsUnderline]
              ParentColor = False
              Color = clBtnFace
              TabOrder = 2
            end
            object UniLabel17: TUniLabel
              Left = 26
              Top = 36
              Width = 57
              Height = 15
              Hint = ''
              Caption = 'Municipal'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 3
            end
            object bsrgpTipo02_E_db: TUniLabel
              Left = 0
              Top = 56
              Width = 20
              Height = 20
              Hint = ''
              TextConversion = txtHTML
              AutoSize = False
              Caption = 'Estadual'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              Font.Style = [fsUnderline]
              ParentColor = False
              Color = clBtnFace
              TabOrder = 4
            end
            object UniLabel19: TUniLabel
              Left = 26
              Top = 59
              Width = 48
              Height = 15
              Hint = ''
              Caption = 'Estadual'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 5
            end
            object bsrgpTipo03_F_db: TUniLabel
              Left = 0
              Top = 81
              Width = 20
              Height = 20
              Hint = ''
              TextConversion = txtHTML
              AutoSize = False
              Caption = 'Facultativo'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              Font.Style = [fsUnderline]
              ParentColor = False
              Color = clBtnFace
              TabOrder = 6
            end
            object UniLabel21: TUniLabel
              Left = 26
              Top = 84
              Width = 41
              Height = 15
              Hint = ''
              Caption = 'Federal'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 7
            end
            object labRcCollapse03: TUniLabel
              Left = 169
              Top = 0
              Width = 10
              Height = 26
              Hint = '[['#13#10'collapse:rcBlock60 off-28 collapsed:mobile'#13#10']]'#13#10
              TextConversion = txtHTML
              Caption = '^'
              Anchors = [akTop, akRight]
              ParentFont = False
              Font.Height = -21
              Font.Name = 'Calibri'
              ParentColor = False
              Color = clBlack
              TabOrder = 8
            end
          end
          object rcBlock35: TUniContainerPanel
            Tag = 1
            Left = 599
            Top = 76
            Width = 230
            Height = 47
            Hint = '[['#13#10'cols:xs-12 sm-12 md-4'#13#10']]'
            ParentColor = False
            TabOrder = 7
          end
        end
      end
    end
    inherited paBaseButtons: TUniContainerPanel
      ScrollHeight = 533
      ScrollWidth = 37
    end
  end
  inherited ed_Order_Search: TUniEdit
    TabOrder = 12
  end
  inherited ed_Where_Search: TUniEdit
    TabOrder = 9
  end
  inherited ed_CodMaster: TUniEdit
    TabOrder = 10
  end
  inherited ed_PK: TUniEdit
    TabOrder = 11
  end
  inherited ed_FieldMasks: TUniEdit
    TabOrder = 6
  end
  inherited ed_OldPKValue: TUniEdit
    TabOrder = 7
  end
  inherited ed_Table_Status_OLD: TUniEdit
    TabOrder = 8
  end
  inherited sqlMaster: TFDQuery
    SQL.Strings = (
      'select * from FERIADOS')
  end
end
