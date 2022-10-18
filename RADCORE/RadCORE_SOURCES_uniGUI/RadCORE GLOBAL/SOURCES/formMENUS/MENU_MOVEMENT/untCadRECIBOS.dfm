inherited frmCadRECIBOS: TfrmCadRECIBOS
  inherited paBaseBackGround: TUniContainerPanel
    inherited pgBaseCadControl: TUniPageControl
      ActivePage = tabRegister
      inherited tabSearch: TUniTabSheet
        ExplicitTop = 24
        ExplicitHeight = 484
        inherited paBaseRegSearch: TUniContainerPanel
          ExplicitHeight = 484
          inherited paSearchFilters: TUniPanel
            ExplicitHeight = 484
            inherited UniScrollBox1: TUniScrollBox
              ExplicitHeight = 484
              ScrollHeight = 652
              ScrollWidth = 247
              ScrollY = 170
              inherited labTitleSearch: TUniLabel
                Top = -160
                ExplicitTop = -160
              end
            end
          end
        end
      end
      inherited tabRegister: TUniTabSheet
        ExplicitTop = 24
        ExplicitHeight = 484
        inherited paBaseRegData1: TUniContainerPanel
          Height = 484
          ExplicitHeight = 484
          ScrollHeight = 522
          ScrollWidth = 924
          object rcBlock10: TUniContainerPanel
            Tag = 1
            Left = 34
            Top = 11
            Width = 100
            Height = 48
            Hint = '[[cols:xs-6 sm-6 md-2 lg-2 xl-2]]'
            ParentColor = False
            TabOrder = 1
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
            object UniLabel3: TUniLabel
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
            Left = 472
            Top = 8
            Width = 100
            Height = 48
            Hint = '[['#13#10'cols:xs-0 sm-0 md-8'#13#10']]'
            ParentColor = False
            TabOrder = 2
          end
          object rcBlock40: TUniContainerPanel
            Tag = 1
            Left = 40
            Top = 95
            Width = 347
            Height = 48
            Hint = '[[cols:12]]'
            ParentColor = False
            TabOrder = 3
            DesignSize = (
              347
              48)
            object UniLabel4: TUniLabel
              Left = 0
              Top = 0
              Width = 82
              Height = 15
              Hint = ''
              Caption = 'I received from'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 1
            end
            object UniDBEdit1: TUniDBEdit
              Left = 0
              Top = 19
              Width = 347
              Height = 29
              Hint = ''
              DataField = 'RECEBI_DE'
              DataSource = dsMaster
              CharCase = ecUpperCase
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
            end
          end
          object rcBlock50: TUniContainerPanel
            Tag = 1
            Left = 49
            Top = 155
            Width = 328
            Height = 48
            Hint = '[[cols:12]]'
            ParentColor = False
            TabOrder = 4
            DesignSize = (
              328
              48)
            object UniLabel6: TUniLabel
              Left = 0
              Top = 0
              Width = 44
              Height = 15
              Hint = ''
              Caption = 'Address'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 1
            end
            object UniDBEdit5: TUniDBEdit
              Left = 0
              Top = 19
              Width = 328
              Height = 29
              Hint = ''
              DataField = 'ENDERECO'
              DataSource = dsMaster
              CharCase = ecUpperCase
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
            end
          end
          object rcBlock60: TUniContainerPanel
            Tag = 1
            Left = 49
            Top = 218
            Width = 332
            Height = 48
            Hint = '[[cols:12]]'
            ParentColor = False
            TabOrder = 5
            DesignSize = (
              332
              48)
            object UniLabel1: TUniLabel
              Left = 0
              Top = 0
              Width = 100
              Height = 15
              Hint = ''
              Caption = 'the amount of US$'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 1
            end
            object UniDBEdit2: TUniDBEdit
              Left = 0
              Top = 19
              Width = 332
              Height = 29
              Hint = ''
              DataField = 'VALOR'
              DataSource = dsMaster
              CharCase = ecUpperCase
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
            end
          end
          object rcBlock70: TUniContainerPanel
            Tag = 1
            Left = 49
            Top = 280
            Width = 328
            Height = 48
            Hint = '[[cols:12]]'
            ParentColor = False
            TabOrder = 6
            DesignSize = (
              328
              48)
            object UniLabel5: TUniLabel
              Left = 0
              Top = 0
              Width = 55
              Height = 15
              Hint = ''
              Caption = 'Regarding'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 1
            end
            object UniDBEdit3: TUniDBEdit
              Left = 0
              Top = 19
              Width = 328
              Height = 29
              Hint = ''
              DataField = 'DESCRICAO'
              DataSource = dsMaster
              CharCase = ecUpperCase
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
            end
          end
          object rcBlock90: TUniContainerPanel
            Tag = 1
            Left = 49
            Top = 374
            Width = 242
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-8]]'
            ParentColor = False
            TabOrder = 7
            DesignSize = (
              242
              48)
            object UniLabel10: TUniLabel
              Left = 0
              Top = 0
              Width = 34
              Height = 15
              Hint = ''
              Caption = 'Issuer'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 1
            end
            object UniDBEdit4: TUniDBEdit
              Left = 0
              Top = 19
              Width = 242
              Height = 29
              Hint = ''
              DataField = 'EMITENTE'
              DataSource = dsMaster
              CharCase = ecUpperCase
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
            end
          end
          object rcBlock100: TUniContainerPanel
            Tag = 1
            Left = 307
            Top = 371
            Width = 142
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-4]]'
            ParentColor = False
            TabOrder = 8
            DesignSize = (
              142
              48)
            object UniLabel11: TUniLabel
              Left = 0
              Top = 0
              Width = 128
              Height = 15
              Hint = ''
              Caption = 'Document ( CNPJ / CPF )'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 1
            end
            object UniDBEdit7: TUniDBEdit
              Left = 0
              Top = 19
              Width = 142
              Height = 29
              Hint = ''
              DataField = 'EMITCNPJCPF'
              DataSource = dsMaster
              CharCase = ecUpperCase
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
            end
          end
          object rcBlock120: TUniContainerPanel
            Tag = 1
            Left = 69
            Top = 474
            Width = 318
            Height = 48
            Hint = '[[cols:12]]'
            ParentColor = False
            TabOrder = 9
            DesignSize = (
              318
              48)
            object UniLabel12: TUniLabel
              Left = 0
              Top = 0
              Width = 81
              Height = 15
              Hint = ''
              Caption = 'Place and date'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 1
            end
            object UniDBEdit8: TUniDBEdit
              Left = 0
              Top = 19
              Width = 318
              Height = 29
              Hint = ''
              DataField = 'LOCALEDATA'
              DataSource = dsMaster
              CharCase = ecUpperCase
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
            end
          end
          object rcBlock110: TUniContainerPanel
            Tag = 1
            Left = 58
            Top = 425
            Width = 323
            Height = 48
            Hint = '[[cols:12]]'
            ParentColor = False
            TabOrder = 10
            DesignSize = (
              323
              48)
            object UniLabel13: TUniLabel
              Left = 0
              Top = 0
              Width = 44
              Height = 15
              Hint = ''
              Caption = 'Address'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 1
            end
            object UniDBEdit6: TUniDBEdit
              Left = 0
              Top = 19
              Width = 323
              Height = 29
              Hint = ''
              DataField = 'EMITENDER'
              DataSource = dsMaster
              CharCase = ecUpperCase
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
            end
          end
          object rcBlock30: TUniContainerPanel
            Tag = 4
            Left = 149
            Top = 56
            Width = 317
            Height = 30
            Hint = '[[cols:12 | round:all]]'
            ParentColor = False
            TabOrder = 11
            object UniLabel14: TUniLabel
              AlignWithMargins = True
              Left = 0
              Top = 5
              Width = 251
              Height = 19
              Hint = '[['#13#10'cols:12 |'#13#10'caption-dots:mobile-v-16 '#13#10']]'
              Margins.Left = 6
              Margins.Top = 6
              Margins.Right = 6
              Margins.Bottom = 6
              AutoSize = False
              Caption = 'Data on who RECEIVES the payment'
              ParentFont = False
              Font.Color = clGray
              Font.Height = -15
              Font.Name = 'Calibri'
              TabOrder = 1
            end
          end
          object rcBlock80: TUniContainerPanel
            Tag = 4
            Left = 79
            Top = 338
            Width = 317
            Height = 30
            Hint = '[[cols:12 | round:all]]'
            ParentColor = False
            TabOrder = 12
            object UniLabel15: TUniLabel
              AlignWithMargins = True
              Left = 0
              Top = 5
              Width = 251
              Height = 19
              Hint = '[['#13#10'cols:12 | '#13#10'caption-dots:mobile-v-16'#13#10']]'
              Margins.Left = 6
              Margins.Top = 6
              Margins.Right = 6
              Margins.Bottom = 6
              AutoSize = False
              Caption = 'Details of who ISSUES the receipt'
              ParentFont = False
              Font.Color = clGray
              Font.Height = -15
              Font.Name = 'Calibri'
              TabOrder = 1
            end
          end
          object UniDBEdit9: TUniDBEdit
            Left = 863
            Top = 29
            Width = 15
            Height = 22
            Hint = ''
            Visible = False
            DataField = 'CODIEMP'
            DataSource = dsMaster
            CharCase = ecUpperCase
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 13
            ReadOnly = True
            InputType = 'search'
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
      'FROM  recibos  tab'
      '')
  end
  inherited popMenuOptions: TUniPopupMenu
    object EmitirReciboSimples1: TUniMenuItem
      Caption = 'Emitir Recibo Simples'
      OnClick = EmitirReciboSimples1Click
    end
  end
end
