inherited frmCadREVISOES: TfrmCadREVISOES
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
              ScrollHeight = 708
              ScrollWidth = 247
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
          object rcBlock10: TUniContainerPanel
            Tag = 1
            Left = 22
            Top = 122
            Width = 121
            Height = 48
            Hint = '[['#13#10'cols:xs-12 sm-12 md-6'#13#10']]'
            ParentColor = False
            TabOrder = 1
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
              Width = 120
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
            Left = 28
            Top = 194
            Width = 121
            Height = 48
            Hint = '[['#13#10'cols:xs-12 sm-12 md-4'#13#10']]'
            ParentColor = False
            TabOrder = 2
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
            Left = 339
            Top = 199
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
            Left = 176
            Top = 200
            Width = 121
            Height = 48
            Hint = '[['#13#10'cols:xs-12 sm-12 md-4'#13#10']]'
            ParentColor = False
            TabOrder = 4
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
          object rcBlock5: TUniContainerPanel
            Tag = 1
            Left = 16
            Top = 12
            Width = 274
            Height = 48
            Hint = '[['#13#10'cols:xs-12 sm-12 md-6'#13#10']]'
            ParentColor = False
            TabOrder = 5
            DesignSize = (
              274
              48)
            object UniLabel1: TUniLabel
              Left = 0
              Top = 0
              Width = 38
              Height = 15
              Hint = ''
              Caption = 'Cliente'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 1
            end
            object edLkpCLIENTES: TUniDBEdit
              Left = 0
              Top = 18
              Width = 273
              Height = 29
              Hint = '[[NOME CODICLI]]'
              CharCase = ecUpperCase
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
              Color = clInfoBk
              ReadOnly = True
              InputType = 'text'
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
end
