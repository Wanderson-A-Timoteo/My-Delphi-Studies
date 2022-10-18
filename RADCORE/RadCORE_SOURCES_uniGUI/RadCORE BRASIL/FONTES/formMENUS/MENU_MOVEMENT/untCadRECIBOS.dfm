inherited frmCadRECIBOS: TfrmCadRECIBOS
  inherited paBaseBackGround: TUniContainerPanel
    inherited pgBaseCadControl: TUniPageControl
      ActivePage = tabRegister
      inherited tabSearch: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 945
        ExplicitHeight = 510
        inherited paBaseRegSearch: TUniContainerPanel
          ExplicitHeight = 510
          inherited paSearchFilters: TUniPanel
            Height = 484
            ExplicitHeight = 484
            inherited UniScrollBox1: TUniScrollBox
              Height = 484
              ExplicitHeight = 484
              ScrollHeight = 966
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
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 945
        ExplicitHeight = 510
        inherited paBaseRegData1: TUniContainerPanel
          Height = 510
          ExplicitHeight = 510
          ScrollHeight = 510
          ScrollWidth = 945
          object UniDBEdit10: TUniDBEdit
            Left = 873
            Top = 26
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
            TabOrder = 1
            ReadOnly = True
            InputType = 'search'
          end
          object UniScrollBox2: TUniScrollBox
            Left = 0
            Top = 0
            Width = 945
            Height = 510
            Hint = ''
            Align = alClient
            TabOrder = 2
            ScrollHeight = 534
            ScrollWidth = 565
            object rcBlock40: TUniContainerPanel
              Tag = 1
              Left = 11
              Top = 95
              Width = 347
              Height = 48
              Hint = '[[cols:12]]'
              ParentColor = False
              TabOrder = 0
              DesignSize = (
                347
                48)
              object UniLabel4: TUniLabel
                Left = 0
                Top = 0
                Width = 89
                Height = 15
                Hint = ''
                Caption = 'Recebi(emos) de'
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
              Left = 20
              Top = 155
              Width = 328
              Height = 48
              Hint = '[[cols:12]]'
              ParentColor = False
              TabOrder = 1
              DesignSize = (
                328
                48)
              object UniLabel6: TUniLabel
                Left = 0
                Top = 0
                Width = 50
                Height = 15
                Hint = ''
                Caption = 'Endere'#231'o'
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
              Left = 20
              Top = 218
              Width = 332
              Height = 48
              Hint = '[[cols:12]]'
              ParentColor = False
              TabOrder = 2
              DesignSize = (
                332
                48)
              object labDetail: TUniLabel
                Left = 0
                Top = 0
                Width = 114
                Height = 15
                Hint = ''
                Caption = 'a import'#226'ncia de R$ '
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
              Left = 20
              Top = 280
              Width = 328
              Height = 48
              Hint = '[[cols:12]]'
              ParentColor = False
              TabOrder = 3
              DesignSize = (
                328
                48)
              object UniLabel5: TUniLabel
                Left = 0
                Top = 0
                Width = 76
                Height = 15
                Hint = ''
                Caption = 'Referente a(o)'
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
              Left = 20
              Top = 374
              Width = 242
              Height = 48
              Hint = '[[cols:xs-12 sm-12 md-8]]'
              ParentColor = False
              TabOrder = 4
              DesignSize = (
                242
                48)
              object UniLabel7: TUniLabel
                Left = 0
                Top = 0
                Width = 47
                Height = 15
                Hint = ''
                Caption = 'Emitente'
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
              Left = 278
              Top = 371
              Width = 142
              Height = 48
              Hint = '[[cols:xs-12 sm-12 md-4]]'
              ParentColor = False
              TabOrder = 5
              DesignSize = (
                142
                48)
              object UniLabel8: TUniLabel
                Left = 0
                Top = 0
                Width = 112
                Height = 15
                Hint = ''
                Caption = 'Docmto( CNPJ / CPF )'
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
              Left = 19
              Top = 486
              Width = 318
              Height = 48
              Hint = '[[cols:12]]'
              ParentColor = False
              TabOrder = 6
              DesignSize = (
                318
                48)
              object UniLabel9: TUniLabel
                Left = 0
                Top = 0
                Width = 67
                Height = 15
                Hint = ''
                Caption = 'Local e Data'
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
              Left = 17
              Top = 429
              Width = 323
              Height = 48
              Hint = '[[cols:12]]'
              ParentColor = False
              TabOrder = 7
              DesignSize = (
                323
                48)
              object UniLabel10: TUniLabel
                Left = 0
                Top = 0
                Width = 50
                Height = 15
                Hint = ''
                Caption = 'Endere'#231'o'
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
              Left = 108
              Top = 56
              Width = 317
              Height = 30
              Hint = '[[cols:12 | round:all]]'
              ParentColor = False
              TabOrder = 8
              object UniLabel11: TUniLabel
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
                Caption = 'Dados de quem RECEBE o pagamento'
                ParentFont = False
                Font.Color = clGray
                Font.Height = -15
                Font.Name = 'Calibri'
                TabOrder = 1
              end
            end
            object rcBlock80: TUniContainerPanel
              Tag = 4
              Left = 50
              Top = 338
              Width = 317
              Height = 30
              Hint = '[[cols:12 | round:all]]'
              ParentColor = False
              TabOrder = 9
              object UniLabel12: TUniLabel
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
                Caption = 'Dados de quem EMITE o recibo'
                ParentFont = False
                Font.Color = clGray
                Font.Height = -15
                Font.Name = 'Calibri'
                TabOrder = 1
              end
            end
            object rcBlock20: TUniContainerPanel
              Tag = 1
              Left = 431
              Top = 8
              Width = 134
              Height = 48
              Hint = '[['#13#10'cols:xs-0 sm-0 md-8'#13#10']]'
              ParentColor = False
              TabOrder = 10
            end
            object rcBlock10: TUniContainerPanel
              Tag = 1
              Left = 7
              Top = 11
              Width = 100
              Height = 48
              Hint = '[[cols:xs-6 sm-6 md-2 lg-2 xl-2]]'
              ParentColor = False
              TabOrder = 11
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
