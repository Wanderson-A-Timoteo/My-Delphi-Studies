object frmRCBlocks: TfrmRCBlocks
  Left = 0
  Top = 0
  Width = 954
  Height = 653
  OnCreate = UniFrameCreate
  OnReady = UniFrameReady
  ParentAlignmentControl = False
  AlignmentControl = uniAlignmentClient
  TabOrder = 0
  object rcBlock1: TUniContainerPanel
    AlignWithMargins = True
    Left = 19
    Top = 15
    Width = 860
    Height = 623
    Hint = '[['#13#10'cols:xs-12 sm-12 md-8 |'#13#10'center:parent xy'#13#10']]'#13#10#13#10#13#10
    Margins.Left = 15
    Margins.Top = 15
    Margins.Right = 15
    Margins.Bottom = 15
    ParentColor = False
    Color = clWhite
    TabOrder = 0
    DesignSize = (
      860
      623)
    object pgPadrao: TUniPageControl
      Left = 2
      Top = 5
      Width = 858
      Height = 618
      Hint = ''
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      ActivePage = UniTabSheet2
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      object tabGeral: TUniTabSheet
        Hint = ''
        Caption = 'Tab 1'
        object sboxGridBlockTab1: TUniScrollBox
          Left = 0
          Top = 0
          Width = 850
          Height = 590
          Hint = '[['#13#10'cols:xs-12 sm-12 md-12 |'#13#10']]'#13#10
          Align = alClient
          TabOrder = 0
          ScrollHeight = 682
          ScrollWidth = 828
          object rcBlock10: TUniContainerPanel
            Tag = 1
            Left = 10
            Top = 161
            Width = 100
            Height = 48
            Hint = '[[cols:xs-6 sm-6 md-2]]'
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
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Color = clWhite
              Font.Style = [fsBold]
              TabOrder = 1
              Color = clGray
              ReadOnly = True
            end
            object UniLabel3: TUniLabel
              Left = 0
              Top = 0
              Width = 38
              Height = 13
              Hint = ''
              Caption = 'C'#243'digo'
              ParentFont = False
              Font.Style = [fsBold]
              TabOrder = 2
            end
          end
          object rcBlock20: TUniContainerPanel
            Tag = 1
            Left = 147
            Top = 161
            Width = 100
            Height = 48
            Hint = '[[cols:xs-6 sm-6 md-2]]'
            ParentColor = False
            TabOrder = 1
            DesignSize = (
              100
              48)
            object UniLabel66: TUniLabel
              Left = 0
              Top = 0
              Width = 81
              Height = 13
              Hint = ''
              Caption = 'Data Cadastro'
              ParentFont = False
              Font.Style = [fsBold]
              TabOrder = 2
            end
            object edDtCad: TUniDBDateTimePicker
              Left = 0
              Top = 18
              Width = 100
              Height = 29
              Hint = ''
              DateTime = 43596.000000000000000000
              DateFormat = 'dd/MM/yyyy'
              TimeFormat = 'HH:mm:ss'
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
            end
          end
          object rcBlock30: TUniContainerPanel
            Tag = 1
            Left = 287
            Top = 161
            Width = 100
            Height = 48
            Hint = '[[cols:xs-6 sm-6 md-2]]'
            ParentColor = False
            TabOrder = 2
            DesignSize = (
              100
              48)
            object UniLabel5: TUniLabel
              Left = 0
              Top = 0
              Width = 95
              Height = 13
              Hint = ''
              Caption = 'Data Anivers'#225'rio'
              ParentFont = False
              Font.Style = [fsBold]
              TabOrder = 1
            end
            object UniDBDateTimePicker1: TUniDBDateTimePicker
              Left = 0
              Top = 18
              Width = 100
              Height = 29
              Hint = ''
              DateTime = 43596.000000000000000000
              DateFormat = 'dd/MM/yyyy'
              TimeFormat = 'HH:mm:ss'
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
            end
          end
          object rcBlock50: TUniContainerPanel
            Tag = 1
            Left = 567
            Top = 160
            Width = 100
            Height = 48
            Hint = '[[cols:xs-6 sm-6 md-2]]'
            ParentColor = False
            TabOrder = 4
            DesignSize = (
              100
              48)
            object UniLabel10: TUniLabel
              Left = 0
              Top = 0
              Width = 58
              Height = 13
              Hint = ''
              Caption = 'Cpf  / Cnpj'
              ParentFont = False
              Font.Style = [fsBold]
              TabOrder = 1
            end
            object edCnpjCpf: TUniDBEdit
              Left = 0
              Top = 18
              Width = 100
              Height = 29
              Hint = ''
              CharCase = ecUpperCase
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
              InputMask.Mask = '99.999.999/9999-99'
            end
          end
          object rcBlock40: TUniContainerPanel
            Tag = 1
            Left = 427
            Top = 160
            Width = 100
            Height = 48
            Hint = '[[cols:xs-6 sm-6 md-2]]'
            ParentColor = False
            TabOrder = 3
            DesignSize = (
              100
              48)
            object UniLabel67: TUniLabel
              Left = 0
              Top = 0
              Width = 46
              Height = 13
              Hint = ''
              Caption = 'PF ou PJ'
              ParentFont = False
              Font.Style = [fsBold]
              TabOrder = 1
            end
            object edTipoPessoa: TUniDBComboBox
              Left = 0
              Top = 18
              Width = 100
              Height = 29
              Hint = ''
              Anchors = [akLeft, akTop, akRight]
              Items.Strings = (
                'F'
                'J')
              TabOrder = 2
              ClientEvents.ExtEvents.Strings = (
                
                  'afterrender=function afterrender(sender, eOpts) '#13#10'{'#13#10'    var me=' +
                  'sender;'#13#10'    me.inputEl.setStyle('#39'background'#39', '#39'none'#39');'#13#10'    me.' +
                  'triggerCell.setStyle('#39'background'#39', '#39'none'#39');'#13#10'    me.inputWrap.se' +
                  'tStyle('#39'border-right-width'#39', '#39'0'#39');'#13#10'    me.triggerCell.setStyle(' +
                  #39'border-right-width'#39', '#39'1px'#39');'#13#10'    me.triggerCell.setStyle('#39'bord' +
                  'er-top-width'#39', '#39'1px'#39');'#13#10'    me.triggerEl.elements[0].setHtml('#39'<i' +
                  ' class="fa fa-angle-down" style="font-size:1.8em; padding-right:' +
                  '5px"></i>'#39');'#13#10'}')
              IconItems = <>
            end
          end
          object rcBlock70: TUniContainerPanel
            Tag = 1
            Left = 12
            Top = 239
            Width = 100
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-2 lg-2 xl-2]]'
            ParentColor = False
            TabOrder = 6
            DesignSize = (
              100
              48)
            object UniLabel68: TUniLabel
              Left = 0
              Top = 0
              Width = 88
              Height = 13
              Hint = ''
              Caption = 'Inscr. Municipal'
              ParentFont = False
              Font.Style = [fsBold]
              TabOrder = 1
            end
            object UniDBEdit21: TUniDBEdit
              Left = 0
              Top = 18
              Width = 100
              Height = 29
              Hint = ''
              CharCase = ecUpperCase
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
              InputMask.RemoveWhiteSpace = True
            end
          end
          object rcBlock60: TUniContainerPanel
            Tag = 1
            Left = 707
            Top = 160
            Width = 100
            Height = 48
            Hint = '[[cols:xs-6 sm-6 md-2]]'
            ParentColor = False
            TabOrder = 5
            DesignSize = (
              100
              48)
            object btnCancel: TUniBitBtn
              AlignWithMargins = True
              Left = 1
              Top = 18
              Width = 98
              Height = 29
              Hint = '[[cls:ButtonRed ]]'
              Margins.Left = 6
              Margins.Top = 4
              Margins.Right = 6
              Margins.Bottom = 4
              Caption = 'Close Form'
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 1
              OnClick = btnCancelClick
            end
          end
          object rcBlock80: TUniContainerPanel
            Tag = 1
            Left = 145
            Top = 239
            Width = 300
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-5 lg-5 xl-5]]'
            ParentColor = False
            TabOrder = 7
            DesignSize = (
              300
              48)
            object UniLabel6: TUniLabel
              Left = 0
              Top = 0
              Width = 92
              Height = 13
              Hint = ''
              Caption = 'Nome / Fantasia'
              ParentFont = False
              Font.Style = [fsBold]
              TabOrder = 1
            end
            object UniDBEdit1: TUniDBEdit
              Left = 0
              Top = 18
              Width = 299
              Height = 29
              Hint = ''
              CharCase = ecUpperCase
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
            end
          end
          object rcBlock90: TUniContainerPanel
            Tag = 1
            Left = 479
            Top = 239
            Width = 300
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-5 lg-5 xl-5]]'
            ParentColor = False
            TabOrder = 8
            DesignSize = (
              300
              48)
            object UniLabel12: TUniLabel
              Left = 0
              Top = 0
              Width = 71
              Height = 13
              Hint = ''
              Caption = 'Raz'#227'o Social'
              ParentFont = False
              Font.Style = [fsBold]
              TabOrder = 1
            end
            object edRazSoc: TUniDBEdit
              Left = 0
              Top = 18
              Width = 299
              Height = 29
              Hint = ''
              CharCase = ecUpperCase
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
            end
          end
          object rcBlock100: TUniContainerPanel
            Tag = 1
            Left = 10
            Top = 307
            Width = 100
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-2 lg-2 xl-2]]'
            ParentColor = False
            TabOrder = 9
            DesignSize = (
              100
              48)
            object UniLabel4: TUniLabel
              Left = 0
              Top = 0
              Width = 21
              Height = 13
              Hint = ''
              Caption = 'Cep'
              ParentFont = False
              Font.Style = [fsBold]
              TabOrder = 1
            end
            object edCep: TUniDBEdit
              Left = 0
              Top = 18
              Width = 100
              Height = 29
              Hint = ''
              CharCase = ecUpperCase
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
            end
          end
          object rcBlock110: TUniContainerPanel
            Tag = 1
            Left = 131
            Top = 307
            Width = 326
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-4 lg-4 xl-4]]'
            ParentColor = False
            TabOrder = 10
            DesignSize = (
              326
              48)
            object UniLabel21: TUniLabel
              Left = 0
              Top = 0
              Width = 52
              Height = 13
              Hint = ''
              Caption = 'Endere'#231'o'
              ParentFont = False
              Font.Style = [fsBold]
              TabOrder = 1
            end
            object UniDBEdit4: TUniDBEdit
              Left = 0
              Top = 18
              Width = 325
              Height = 29
              Hint = ''
              CharCase = ecUpperCase
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
            end
          end
          object rcBlock120: TUniContainerPanel
            Tag = 1
            Left = 470
            Top = 307
            Width = 100
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-2 lg-2 xl-2]]'
            ParentColor = False
            TabOrder = 11
            DesignSize = (
              100
              48)
            object UniLabel13: TUniLabel
              Left = 0
              Top = 0
              Width = 44
              Height = 13
              Hint = ''
              Caption = 'N'#250'mero'
              ParentFont = False
              Font.Style = [fsBold]
              TabOrder = 1
            end
            object UniDBEdit5: TUniDBEdit
              Left = 0
              Top = 18
              Width = 100
              Height = 29
              Hint = ''
              CharCase = ecUpperCase
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
            end
          end
          object rcBlock130: TUniContainerPanel
            Tag = 1
            Left = 599
            Top = 307
            Width = 100
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-2 lg-2 xl-2]]'
            ParentColor = False
            TabOrder = 12
            DesignSize = (
              100
              48)
            object UniLabel46: TUniLabel
              Left = 0
              Top = 0
              Width = 30
              Height = 13
              Hint = ''
              Caption = 'Bloco'
              ParentFont = False
              Font.Style = [fsBold]
              TabOrder = 1
            end
            object UniDBEdit6: TUniDBEdit
              Left = 0
              Top = 18
              Width = 100
              Height = 29
              Hint = ''
              CharCase = ecUpperCase
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
            end
          end
          object rcBlock140: TUniContainerPanel
            Tag = 1
            Left = 714
            Top = 307
            Width = 100
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-2 lg-2 xl-2]]'
            ParentColor = False
            TabOrder = 13
            DesignSize = (
              100
              48)
            object UniLabel61: TUniLabel
              Left = 0
              Top = 0
              Width = 63
              Height = 13
              Hint = ''
              Caption = 'Sala / Apto'
              ParentFont = False
              Font.Style = [fsBold]
              TabOrder = 1
            end
            object UniDBEdit7: TUniDBEdit
              Left = 0
              Top = 18
              Width = 100
              Height = 29
              Hint = ''
              CharCase = ecUpperCase
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
            end
          end
          object rcBlock150: TUniContainerPanel
            Tag = 1
            Left = 10
            Top = 371
            Width = 100
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-2 lg-2 xl-2]]'
            ParentColor = False
            TabOrder = 14
            DesignSize = (
              100
              48)
            object UniLabel14: TUniLabel
              Left = 0
              Top = 0
              Width = 14
              Height = 13
              Hint = ''
              Caption = 'UF'
              ParentFont = False
              Font.Style = [fsBold]
              TabOrder = 1
            end
            object edLkpUFS: TUniDBEdit
              Left = 0
              Top = 18
              Width = 100
              Height = 29
              Hint = '[[DESCRICAO CODIUF ]]'
              CharCase = ecUpperCase
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
              Color = clInfoBk
              ReadOnly = True
              InputType = 'text'
            end
          end
          object rcBlock160: TUniContainerPanel
            Tag = 1
            Left = 131
            Top = 371
            Width = 326
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-4 lg-4 xl-4]]'
            ParentColor = False
            TabOrder = 15
            DesignSize = (
              326
              48)
            object UniLabel15: TUniLabel
              Left = 0
              Top = 0
              Width = 38
              Height = 13
              Hint = ''
              Caption = 'Cidade'
              ParentFont = False
              Font.Style = [fsBold]
              TabOrder = 1
            end
            object edLkpCIDADES: TUniDBEdit
              Left = 0
              Top = 18
              Width = 325
              Height = 29
              Hint = '[[DESCRICAO CODICIDADE @60 ! + ]]'
              CharCase = ecUpperCase
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
              Color = clInfoBk
              ReadOnly = True
              InputType = 'text'
            end
          end
          object rcBlock180: TUniContainerPanel
            Tag = 1
            Left = 599
            Top = 370
            Width = 229
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-4 lg-4 xl-4]]'
            ParentColor = False
            TabOrder = 16
            DesignSize = (
              229
              48)
            object UniLabel16: TUniLabel
              Left = 0
              Top = 0
              Width = 34
              Height = 13
              Hint = ''
              Caption = 'Bairro'
              ParentFont = False
              Font.Style = [fsBold]
              TabOrder = 1
            end
            object UniDBEdit8: TUniDBEdit
              Left = 0
              Top = 18
              Width = 229
              Height = 29
              Hint = ''
              CharCase = ecUpperCase
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
            end
          end
          object rcBlock170: TUniContainerPanel
            Tag = 1
            Left = 470
            Top = 371
            Width = 100
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-2 lg-2 xl-2]]'
            ParentColor = False
            TabOrder = 17
            DesignSize = (
              100
              48)
            object UniLabel70: TUniLabel
              Left = 0
              Top = 0
              Width = 53
              Height = 13
              Hint = ''
              Caption = 'C'#243'd. IBGE'
              ParentFont = False
              Font.Style = [fsBold]
              TabOrder = 1
            end
            object edLkpCIDADES_SetDS: TUniDBEdit
              Left = 0
              Top = 18
              Width = 100
              Height = 29
              Hint = ''
              CharCase = ecUpperCase
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
            end
          end
          object rcBlock190: TUniContainerPanel
            Tag = 1
            Left = 10
            Top = 438
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-3 lg-3 xl-3]]'
            ParentColor = False
            TabOrder = 18
            DesignSize = (
              150
              48)
            object UniLabel35: TUniLabel
              Left = 0
              Top = 0
              Width = 22
              Height = 13
              Hint = ''
              Caption = 'Site'
              ParentFont = False
              Font.Style = [fsBold]
              TabOrder = 1
            end
            object UniDBEdit3: TUniDBEdit
              Left = 0
              Top = 18
              Width = 150
              Height = 29
              Hint = ''
              CharCase = ecUpperCase
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
            end
          end
          object rcBlock200: TUniContainerPanel
            Tag = 1
            Left = 203
            Top = 438
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-3 lg-3 xl-3]]'
            ParentColor = False
            TabOrder = 19
            DesignSize = (
              150
              48)
            object UniLabel56: TUniLabel
              Left = 0
              Top = 0
              Width = 53
              Height = 13
              Hint = ''
              Caption = 'Email NFe'
              ParentFont = False
              Font.Style = [fsBold]
              TabOrder = 1
            end
            object UniDBEdit13: TUniDBEdit
              Left = 0
              Top = 18
              Width = 150
              Height = 29
              Hint = ''
              CharCase = ecUpperCase
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
            end
          end
          object rcBlock210: TUniContainerPanel
            Tag = 1
            Left = 389
            Top = 438
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-3 lg-3 xl-3]]'
            ParentColor = False
            TabOrder = 20
            DesignSize = (
              150
              48)
            object UniLabel57: TUniLabel
              Left = 0
              Top = 0
              Width = 89
              Height = 13
              Hint = ''
              Caption = 'Email Comercial'
              ParentFont = False
              Font.Style = [fsBold]
              TabOrder = 1
            end
            object UniDBEdit19: TUniDBEdit
              Left = 0
              Top = 18
              Width = 150
              Height = 29
              Hint = ''
              CharCase = ecUpperCase
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
            end
          end
          object rcBlock220: TUniContainerPanel
            Tag = 1
            Left = 565
            Top = 437
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-3 lg-3 xl-3]]'
            ParentColor = False
            TabOrder = 21
            DesignSize = (
              150
              48)
            object UniLabel58: TUniLabel
              Left = 0
              Top = 0
              Width = 91
              Height = 13
              Hint = ''
              Caption = 'Email Financeiro'
              ParentFont = False
              Font.Style = [fsBold]
              TabOrder = 1
            end
            object UniDBEdit20: TUniDBEdit
              Left = 0
              Top = 18
              Width = 150
              Height = 29
              Hint = ''
              CharCase = ecUpperCase
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
            end
          end
          object rcBlock270: TUniContainerPanel
            Tag = 4
            Left = 36
            Top = 502
            Width = 729
            Height = 180
            Hint = '[['#13#10'cols:12 | '#13#10'hr:32 mobile-v-32 mobile-h-180 |'#13#10']]'#13#10
            ParentColor = False
            TabOrder = 22
          end
          object rcBlock5: TUniContainerPanel
            Tag = 4
            Left = 16
            Top = 3
            Width = 729
            Height = 141
            Hint = '[['#13#10'cols:12 | '#13#10'hr:xs-160 sm-160 md-140'#13#10']]'
            ParentColor = False
            AutoScroll = True
            TabOrder = 23
            ScrollHeight = 141
            ScrollWidth = 729
            object labAlerta: TUniLabel
              Left = 0
              Top = 0
              Width = 729
              Height = 141
              Hint = '[['#13#10'rcalert:fa-info-circle title:DEMO "rcBlock"'#13#10']]'#13#10
              TextConversion = txtHTML
              AutoSize = False
              Caption = 
                'Voc'#234' poder'#225' aproveitar os blocos para adicionar em seu form<br><' +
                'br>You can take advantage of the blocks to add to your form'
              Align = alClient
              ParentFont = False
              Font.Style = [fsBold]
              TabOrder = 1
            end
          end
        end
      end
      object UniTabSheet2: TUniTabSheet
        Hint = ''
        Caption = 'Tab 2'
        object sboxGridBlockTab2: TUniScrollBox
          Left = 0
          Top = 0
          Width = 850
          Height = 590
          Hint = ''
          Align = alClient
          TabOrder = 0
          DesignSize = (
            848
            571)
          ScrollHeight = 409
          ScrollWidth = 927
          object rcBlock360: TUniContainerPanel
            Tag = 1
            Left = 12
            Top = 67
            Width = 100
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-2 lg-2 xl-2]]'
            ParentColor = False
            TabOrder = 0
            DesignSize = (
              100
              48)
            object UniLabel73: TUniLabel
              Left = 0
              Top = 0
              Width = 21
              Height = 13
              Hint = ''
              Caption = 'Cep'
              ParentFont = False
              Font.Style = [fsBold]
              TabOrder = 1
            end
            object UniDBEdit22: TUniDBEdit
              Left = 0
              Top = 18
              Width = 100
              Height = 29
              Hint = ''
              DataField = 'CEPENTREGA'
              CharCase = ecUpperCase
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
            end
          end
          object rcBlock370: TUniContainerPanel
            Tag = 1
            Left = 133
            Top = 67
            Width = 326
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-4 lg-4 xl-4]]'
            ParentColor = False
            TabOrder = 1
            DesignSize = (
              326
              48)
            object UniLabel74: TUniLabel
              Left = 0
              Top = 0
              Width = 52
              Height = 13
              Hint = ''
              Caption = 'Endere'#231'o'
              ParentFont = False
              Font.Style = [fsBold]
              TabOrder = 1
            end
            object UniDBEdit32: TUniDBEdit
              Left = 0
              Top = 18
              Width = 325
              Height = 29
              Hint = ''
              DataField = 'ENDERECOENTREGA'
              CharCase = ecUpperCase
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
            end
          end
          object rcBlock380: TUniContainerPanel
            Tag = 1
            Left = 484
            Top = 67
            Width = 100
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-2 lg-2 xl-2]]'
            ParentColor = False
            TabOrder = 2
            DesignSize = (
              100
              48)
            object UniLabel75: TUniLabel
              Left = 0
              Top = 0
              Width = 44
              Height = 13
              Hint = ''
              Caption = 'N'#250'mero'
              ParentFont = False
              Font.Style = [fsBold]
              TabOrder = 1
            end
            object UniDBEdit34: TUniDBEdit
              Left = 0
              Top = 18
              Width = 100
              Height = 29
              Hint = ''
              DataField = 'NUMEROENTREGA'
              CharCase = ecUpperCase
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
            end
          end
          object rcBlock390: TUniContainerPanel
            Tag = 1
            Left = 613
            Top = 67
            Width = 100
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-2 lg-2 xl-2]]'
            ParentColor = False
            TabOrder = 3
            DesignSize = (
              100
              48)
            object UniLabel76: TUniLabel
              Left = 0
              Top = 0
              Width = 30
              Height = 13
              Hint = ''
              Caption = 'Bloco'
              ParentFont = False
              Font.Style = [fsBold]
              TabOrder = 1
            end
            object UniDBEdit36: TUniDBEdit
              Left = 0
              Top = 18
              Width = 100
              Height = 29
              Hint = ''
              DataField = 'BLOCOENTREGA'
              CharCase = ecUpperCase
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
            end
          end
          object rcBlock400: TUniContainerPanel
            Tag = 1
            Left = 728
            Top = 67
            Width = 100
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-2 lg-2 xl-2]]'
            ParentColor = False
            TabOrder = 4
            DesignSize = (
              100
              48)
            object UniLabel77: TUniLabel
              Left = 0
              Top = 0
              Width = 63
              Height = 13
              Hint = ''
              Caption = 'Sala / Apto'
              ParentFont = False
              Font.Style = [fsBold]
              TabOrder = 1
            end
            object UniDBEdit38: TUniDBEdit
              Left = 0
              Top = 18
              Width = 100
              Height = 29
              Hint = ''
              DataField = 'APTOENTREGA'
              CharCase = ecUpperCase
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
            end
          end
          object rcBlock410: TUniContainerPanel
            Tag = 1
            Left = 12
            Top = 131
            Width = 100
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-2 lg-2 xl-2]]'
            ParentColor = False
            TabOrder = 5
            DesignSize = (
              100
              48)
            object UniLabel78: TUniLabel
              Left = 0
              Top = 0
              Width = 14
              Height = 13
              Hint = ''
              Caption = 'UF'
              ParentFont = False
              Font.Style = [fsBold]
              TabOrder = 1
            end
            object edLkpUFS__ENTREGA: TUniDBEdit
              Left = 0
              Top = 18
              Width = 100
              Height = 29
              Hint = '[[DESCRICAO CODIUFENTREGA]]'
              CharCase = ecUpperCase
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
              Color = clInfoBk
              ReadOnly = True
              InputType = 'text'
            end
          end
          object rcBlock420: TUniContainerPanel
            Tag = 1
            Left = 133
            Top = 131
            Width = 326
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-4 lg-4 xl-4]]'
            ParentColor = False
            TabOrder = 6
            DesignSize = (
              326
              48)
            object UniLabel79: TUniLabel
              Left = 0
              Top = 0
              Width = 38
              Height = 13
              Hint = ''
              Caption = 'Cidade'
              ParentFont = False
              Font.Style = [fsBold]
              TabOrder = 1
            end
            object edLkpCIDADES__ENTREGA: TUniDBEdit
              Left = 0
              Top = 18
              Width = 325
              Height = 29
              Hint = '[[DESCRICAO CODICIDADEENTREGA @60 ! +]]'
              CharCase = ecUpperCase
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
              Color = clInfoBk
              ReadOnly = True
              InputType = 'text'
            end
          end
          object rcBlock430: TUniContainerPanel
            Tag = 1
            Left = 500
            Top = 129
            Width = 342
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-6 lg-6 xl-6]]'
            ParentColor = False
            TabOrder = 7
            DesignSize = (
              342
              48)
            object UniLabel80: TUniLabel
              Left = 0
              Top = 0
              Width = 34
              Height = 13
              Hint = ''
              Caption = 'Bairro'
              ParentFont = False
              Font.Style = [fsBold]
              TabOrder = 1
            end
            object UniDBEdit43: TUniDBEdit
              Left = 0
              Top = 18
              Width = 342
              Height = 29
              Hint = ''
              DataField = 'BAIRRO'
              CharCase = ecUpperCase
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
            end
          end
          object rcBlock350: TUniContainerPanel
            Tag = 4
            Left = 10
            Top = 13
            Width = 729
            Height = 30
            Hint = '[[cols:12 | round:all]]'
            ParentColor = False
            TabOrder = 8
            object UniLabel30: TUniLabel
              AlignWithMargins = True
              Left = 6
              Top = 5
              Width = 717
              Height = 19
              Hint = '[[cls:left-center]]'
              Margins.Left = 6
              Margins.Top = 6
              Margins.Right = 6
              Margins.Bottom = 6
              AutoSize = False
              Caption = 'ENDERE'#199'O DE ENTREGA'
              ParentFont = False
              Font.Color = clGray
              Font.Height = -15
              Font.Name = 'Calibri'
              TabOrder = 1
            end
          end
          object rcBlock460: TUniContainerPanel
            Left = 480
            Top = 186
            Width = 447
            Height = 223
            Hint = 
              '[['#13#10'cols:xs-12 sm-12 md-6 | '#13#10'scale:parent h:100%-top off:15 | '#13 +
              #10'round:no | '#13#10'cls:card-info-box-white'#13#10']]'
            ParentColor = False
            Color = 14802398
            TabOrder = 9
            object UniPageControl1: TUniPageControl
              AlignWithMargins = True
              Left = 3
              Top = 45
              Width = 441
              Height = 175
              Hint = ''
              ActivePage = UniTabSheet1
              Align = alClient
              TabOrder = 1
              object UniTabSheet1: TUniTabSheet
                Hint = ''
                Caption = 'UniTabSheet1'
                object sboxGridBlockTab3: TUniScrollBox
                  Left = 0
                  Top = 0
                  Width = 433
                  Height = 147
                  Hint = ''
                  Align = alClient
                  TabOrder = 0
                  ScrollHeight = 248
                  ScrollWidth = 391
                  object rcBlock465: TUniContainerPanel
                    Tag = 1
                    Left = 10
                    Top = 9
                    Width = 100
                    Height = 48
                    Hint = '[[cols:xs-6 sm-6 md-4 ]]'
                    ParentColor = False
                    TabOrder = 0
                    DesignSize = (
                      100
                      48)
                    object UniDBEdit2: TUniDBEdit
                      Left = 0
                      Top = 18
                      Width = 100
                      Height = 29
                      Hint = ''
                      Anchors = [akLeft, akTop, akRight]
                      ParentFont = False
                      Font.Color = clWhite
                      Font.Style = [fsBold]
                      TabOrder = 1
                      Color = clGray
                      ReadOnly = True
                    end
                    object UniLabel1: TUniLabel
                      Left = 0
                      Top = 0
                      Width = 38
                      Height = 13
                      Hint = ''
                      Caption = 'C'#243'digo'
                      ParentFont = False
                      Font.Style = [fsBold]
                      TabOrder = 2
                    end
                  end
                  object rcBlock466: TUniContainerPanel
                    Tag = 1
                    Left = 147
                    Top = 9
                    Width = 100
                    Height = 48
                    Hint = '[[cols:xs-6 sm-6 md-4 ]]'
                    ParentColor = False
                    TabOrder = 1
                    DesignSize = (
                      100
                      48)
                    object UniLabel2: TUniLabel
                      Left = 0
                      Top = 0
                      Width = 81
                      Height = 13
                      Hint = ''
                      Caption = 'Data Cadastro'
                      ParentFont = False
                      Font.Style = [fsBold]
                      TabOrder = 1
                    end
                    object UniDBDateTimePicker2: TUniDBDateTimePicker
                      Left = 0
                      Top = 18
                      Width = 100
                      Height = 29
                      Hint = ''
                      DateTime = 43596.000000000000000000
                      DateFormat = 'dd/MM/yyyy'
                      TimeFormat = 'HH:mm:ss'
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 2
                    end
                  end
                  object rcBlock467: TUniContainerPanel
                    Tag = 1
                    Left = 287
                    Top = 9
                    Width = 100
                    Height = 48
                    Hint = '[[cols:xs-6 sm-6 md-4 ]]'
                    ParentColor = False
                    TabOrder = 2
                    DesignSize = (
                      100
                      48)
                    object UniLabel7: TUniLabel
                      Left = 0
                      Top = 0
                      Width = 95
                      Height = 13
                      Hint = ''
                      Caption = 'Data Anivers'#225'rio'
                      ParentFont = False
                      Font.Style = [fsBold]
                      TabOrder = 1
                    end
                    object UniDBDateTimePicker3: TUniDBDateTimePicker
                      Left = 0
                      Top = 18
                      Width = 100
                      Height = 29
                      Hint = ''
                      DateTime = 43596.000000000000000000
                      DateFormat = 'dd/MM/yyyy'
                      TimeFormat = 'HH:mm:ss'
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 2
                    end
                  end
                  object rcBlock469: TUniContainerPanel
                    Tag = 1
                    Left = 151
                    Top = 67
                    Width = 100
                    Height = 48
                    Hint = '[[cols:xs-6 sm-6 md-4 ]]'
                    ParentColor = False
                    TabOrder = 3
                    DesignSize = (
                      100
                      48)
                    object UniLabel8: TUniLabel
                      Left = 0
                      Top = 0
                      Width = 58
                      Height = 13
                      Hint = ''
                      Caption = 'Cpf  / Cnpj'
                      ParentFont = False
                      Font.Style = [fsBold]
                      TabOrder = 1
                    end
                    object UniDBEdit9: TUniDBEdit
                      Left = 0
                      Top = 18
                      Width = 100
                      Height = 29
                      Hint = ''
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 2
                      InputMask.Mask = '99.999.999/9999-99'
                    end
                  end
                  object rcBlock468: TUniContainerPanel
                    Tag = 1
                    Left = 11
                    Top = 67
                    Width = 100
                    Height = 48
                    Hint = '[[cols:xs-6 sm-6 md-4 ]]'
                    ParentColor = False
                    TabOrder = 4
                    DesignSize = (
                      100
                      48)
                    object UniLabel9: TUniLabel
                      Left = 0
                      Top = 0
                      Width = 46
                      Height = 13
                      Hint = ''
                      Caption = 'PF ou PJ'
                      ParentFont = False
                      Font.Style = [fsBold]
                      TabOrder = 1
                    end
                    object UniDBComboBox1: TUniDBComboBox
                      Left = 0
                      Top = 18
                      Width = 100
                      Height = 29
                      Hint = ''
                      Anchors = [akLeft, akTop, akRight]
                      Items.Strings = (
                        'F'
                        'J')
                      TabOrder = 2
                      IconItems = <>
                    end
                  end
                  object rcBlock470: TUniContainerPanel
                    Tag = 1
                    Left = 291
                    Top = 67
                    Width = 100
                    Height = 48
                    Hint = '[[cols:xs-6 sm-6 md-4 ]]'
                    ParentColor = False
                    TabOrder = 5
                    DesignSize = (
                      100
                      48)
                    object UniLabel22: TUniLabel
                      Left = 0
                      Top = 0
                      Width = 45
                      Height = 13
                      Hint = ''
                      Caption = 'RG / I.E.'
                      ParentFont = False
                      Font.Style = [fsBold]
                      TabOrder = 1
                    end
                    object UniDBEdit14: TUniDBEdit
                      Left = 0
                      Top = 18
                      Width = 100
                      Height = 29
                      Hint = ''
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 2
                      InputMask.RemoveWhiteSpace = True
                    end
                  end
                  object rcBlock490: TUniContainerPanel
                    Tag = 1
                    Left = 10
                    Top = 137
                    Width = 326
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-4 lg-4 xl-4]]'
                    ParentColor = False
                    TabOrder = 6
                    DesignSize = (
                      326
                      48)
                    object UniLabel24: TUniLabel
                      Left = 0
                      Top = 0
                      Width = 38
                      Height = 13
                      Hint = ''
                      Caption = 'Cidade'
                      ParentFont = False
                      Font.Style = [fsBold]
                      TabOrder = 1
                    end
                    object UniDBEdit16: TUniDBEdit
                      Left = 0
                      Top = 18
                      Width = 325
                      Height = 29
                      Hint = '[[DESCRICAO CODICIDADEENTREGA @60 ! +]]'
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 2
                      Color = clInfoBk
                      ReadOnly = True
                      InputType = 'text'
                    end
                  end
                  object rcBlock500: TUniContainerPanel
                    Tag = 1
                    Left = 12
                    Top = 200
                    Width = 290
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-4 lg-4 xl-4]]'
                    ParentColor = False
                    TabOrder = 7
                    DesignSize = (
                      290
                      48)
                    object UniLabel25: TUniLabel
                      Left = 0
                      Top = 0
                      Width = 34
                      Height = 13
                      Hint = ''
                      Caption = 'Bairro'
                      ParentFont = False
                      Font.Style = [fsBold]
                      TabOrder = 1
                    end
                    object UniDBEdit17: TUniDBEdit
                      Left = 0
                      Top = 18
                      Width = 290
                      Height = 29
                      Hint = ''
                      DataField = 'BAIRRO'
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 2
                    end
                  end
                end
              end
            end
            object UniContainerPanel22: TUniContainerPanel
              Left = 0
              Top = 0
              Width = 447
              Height = 42
              Hint = '[[round:t | cls:card-light]]'
              ParentColor = False
              Color = 14802398
              Align = alTop
              TabOrder = 2
              object UniLabel32: TUniLabel
                AlignWithMargins = True
                Left = 6
                Top = 0
                Width = 441
                Height = 42
                Hint = '[[bsh5:|cls:left-center]]'
                Margins.Left = 6
                Margins.Top = 0
                Margins.Right = 0
                Margins.Bottom = 0
                AutoSize = False
                Caption = 'Dinamic Alignment( scale H )'
                Align = alClient
                ParentFont = False
                Font.Color = clGray
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 1
              end
            end
          end
          object rcBlock459: TUniContainerPanel
            Left = 12
            Top = 203
            Width = 433
            Height = 317
            Hint = 
              '[['#13#10'cols:xs-12 sm-12 md-6 | '#13#10'round:no | '#13#10'cls:card-info-box-whi' +
              'te'#13#10']]'
            ParentColor = False
            Color = 14802398
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 10
            object UniPageControl2: TUniPageControl
              AlignWithMargins = True
              Left = 3
              Top = 45
              Width = 427
              Height = 269
              Hint = ''
              ActivePage = UniTabSheet5
              Align = alClient
              TabOrder = 1
              object UniTabSheet5: TUniTabSheet
                Hint = ''
                Caption = 'UniTabSheet1'
                object UniScrollBox3: TUniScrollBox
                  Left = 0
                  Top = 0
                  Width = 419
                  Height = 241
                  Hint = ''
                  Align = alClient
                  TabOrder = 0
                  ScrollHeight = 177
                  ScrollWidth = 390
                  object rcBlock510: TUniContainerPanel
                    Tag = 1
                    Left = 10
                    Top = 59
                    Width = 100
                    Height = 48
                    Hint = '[[cols:xs-6 sm-6 md-4]]'
                    ParentColor = False
                    TabOrder = 0
                    DesignSize = (
                      100
                      48)
                    object UniDBEdit40: TUniDBEdit
                      Left = 0
                      Top = 18
                      Width = 100
                      Height = 29
                      Hint = ''
                      Anchors = [akLeft, akTop, akRight]
                      ParentFont = False
                      Font.Color = clWhite
                      Font.Style = [fsBold]
                      TabOrder = 1
                      Color = clGray
                      ReadOnly = True
                    end
                    object UniLabel37: TUniLabel
                      Left = 0
                      Top = 0
                      Width = 38
                      Height = 13
                      Hint = ''
                      Caption = 'C'#243'digo'
                      ParentFont = False
                      Font.Style = [fsBold]
                      TabOrder = 2
                    end
                  end
                  object rcBlock520: TUniContainerPanel
                    Tag = 1
                    Left = 147
                    Top = 59
                    Width = 100
                    Height = 48
                    Hint = '[[cols:xs-6 sm-6 md-4 ]]'
                    ParentColor = False
                    TabOrder = 1
                    DesignSize = (
                      100
                      48)
                    object UniLabel38: TUniLabel
                      Left = 0
                      Top = 0
                      Width = 81
                      Height = 13
                      Hint = ''
                      Caption = 'Data Cadastro'
                      ParentFont = False
                      Font.Style = [fsBold]
                      TabOrder = 1
                    end
                    object UniDBDateTimePicker4: TUniDBDateTimePicker
                      Left = 0
                      Top = 18
                      Width = 100
                      Height = 29
                      Hint = ''
                      DateTime = 43596.000000000000000000
                      DateFormat = 'dd/MM/yyyy'
                      TimeFormat = 'HH:mm:ss'
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 2
                    end
                  end
                  object rcBlock530: TUniContainerPanel
                    Tag = 1
                    Left = 287
                    Top = 59
                    Width = 100
                    Height = 48
                    Hint = '[[cols:xs-6 sm-6 md-4 ]]'
                    ParentColor = False
                    TabOrder = 2
                    DesignSize = (
                      100
                      48)
                    object UniLabel39: TUniLabel
                      Left = 0
                      Top = 0
                      Width = 95
                      Height = 13
                      Hint = ''
                      Caption = 'Data Anivers'#225'rio'
                      ParentFont = False
                      Font.Style = [fsBold]
                      TabOrder = 1
                    end
                    object UniDBDateTimePicker5: TUniDBDateTimePicker
                      Left = 0
                      Top = 18
                      Width = 100
                      Height = 29
                      Hint = ''
                      DateTime = 43596.000000000000000000
                      DateFormat = 'dd/MM/yyyy'
                      TimeFormat = 'HH:mm:ss'
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 2
                    end
                  end
                  object rcBlock550: TUniContainerPanel
                    Tag = 1
                    Left = 150
                    Top = 129
                    Width = 100
                    Height = 48
                    Hint = '[[cols:xs-6 sm-6 md-4 ]]'
                    ParentColor = False
                    TabOrder = 3
                    DesignSize = (
                      100
                      48)
                    object UniLabel41: TUniLabel
                      Left = 0
                      Top = 0
                      Width = 58
                      Height = 13
                      Hint = ''
                      Caption = 'Cpf  / Cnpj'
                      ParentFont = False
                      Font.Style = [fsBold]
                      TabOrder = 1
                    end
                    object UniDBEdit41: TUniDBEdit
                      Left = 0
                      Top = 18
                      Width = 100
                      Height = 29
                      Hint = ''
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 2
                      InputMask.Mask = '99.999.999/9999-99'
                    end
                  end
                  object rcBlock540: TUniContainerPanel
                    Tag = 1
                    Left = 10
                    Top = 129
                    Width = 100
                    Height = 48
                    Hint = '[[cols:xs-6 sm-6 md-4 ]]'
                    ParentColor = False
                    TabOrder = 4
                    DesignSize = (
                      100
                      48)
                    object UniLabel42: TUniLabel
                      Left = 0
                      Top = 0
                      Width = 46
                      Height = 13
                      Hint = ''
                      Caption = 'PF ou PJ'
                      ParentFont = False
                      Font.Style = [fsBold]
                      TabOrder = 1
                    end
                    object UniDBComboBox2: TUniDBComboBox
                      Left = 0
                      Top = 18
                      Width = 100
                      Height = 29
                      Hint = ''
                      Anchors = [akLeft, akTop, akRight]
                      Items.Strings = (
                        'F'
                        'J')
                      TabOrder = 2
                      IconItems = <>
                    end
                  end
                  object rcBlock560: TUniContainerPanel
                    Tag = 1
                    Left = 290
                    Top = 129
                    Width = 100
                    Height = 48
                    Hint = '[[cols:xs-6 sm-6 md-4 ]]'
                    ParentColor = False
                    TabOrder = 5
                    DesignSize = (
                      100
                      48)
                    object UniLabel44: TUniLabel
                      Left = 0
                      Top = 0
                      Width = 45
                      Height = 13
                      Hint = ''
                      Caption = 'RG / I.E.'
                      ParentFont = False
                      Font.Style = [fsBold]
                      TabOrder = 1
                    end
                    object UniDBEdit44: TUniDBEdit
                      Left = 0
                      Top = 18
                      Width = 100
                      Height = 29
                      Hint = ''
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 2
                      InputMask.RemoveWhiteSpace = True
                    end
                  end
                end
              end
            end
            object UniContainerPanel2: TUniContainerPanel
              Left = 0
              Top = 0
              Width = 433
              Height = 42
              Hint = '[[round:t | cls:card-light]]'
              ParentColor = False
              Color = 14802398
              Align = alTop
              TabOrder = 2
              object UniLabel11: TUniLabel
                AlignWithMargins = True
                Left = 6
                Top = 0
                Width = 427
                Height = 42
                Hint = '[[bsh5:|cls:left-center]]'
                Margins.Left = 6
                Margins.Top = 0
                Margins.Right = 0
                Margins.Bottom = 0
                AutoSize = False
                Caption = 'Anchors Bottom'
                Align = alClient
                ParentFont = False
                Font.Color = clGray
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 1
              end
            end
          end
        end
      end
      object UniTabSheet3: TUniTabSheet
        Hint = ''
        Caption = 'Tab 3'
        object UniScrollBox1: TUniScrollBox
          Left = 0
          Top = 0
          Width = 850
          Height = 590
          Hint = ''
          Align = alClient
          TabOrder = 0
          ScrollHeight = 320
          ScrollWidth = 741
          object rcBlock580: TUniContainerPanel
            Tag = 4
            Left = 12
            Top = 19
            Width = 729
            Height = 30
            Hint = '[[cols:12 | round:all]]'
            ParentColor = False
            TabOrder = 0
            object rcBlock: TUniLabel
              AlignWithMargins = True
              Left = 6
              Top = 5
              Width = 717
              Height = 19
              Hint = '[[cls:left-center]]'
              Margins.Left = 6
              Margins.Top = 6
              Margins.Right = 6
              Margins.Bottom = 6
              AutoSize = False
              Caption = 'GRIDBLOCK with BORDERS offset'
              ParentFont = False
              Font.Color = clGray
              Font.Height = -15
              Font.Name = 'Calibri'
              TabOrder = 1
            end
          end
          object rcBlock590: TUniContainerPanel
            Tag = 1
            Left = 18
            Top = 63
            Width = 100
            Height = 96
            Hint = '[[cols:xs-12 sm-12 md-3]]'
            ParentColor = False
            Color = clInfoBk
            TabOrder = 1
          end
          object rcBlock600: TUniContainerPanel
            Tag = 1
            Left = 142
            Top = 63
            Width = 100
            Height = 96
            Hint = '[[cols:xs-12 sm-12 md-3]]'
            ParentColor = False
            Color = clSkyBlue
            TabOrder = 2
          end
          object rcBlock610: TUniContainerPanel
            Tag = 1
            Left = 271
            Top = 63
            Width = 100
            Height = 96
            Hint = '[[cols:xs-12 sm-12 md-3]]'
            ParentColor = False
            Color = clMoneyGreen
            TabOrder = 3
          end
          object rcBlock620: TUniContainerPanel
            Tag = 1
            Left = 386
            Top = 63
            Width = 100
            Height = 96
            Hint = '[[cols:xs-12 sm-12 md-3]]'
            ParentColor = False
            Color = 8421631
            TabOrder = 4
          end
          object rcBlock640: TUniContainerPanel
            Tag = 1
            Left = 20
            Top = 224
            Width = 100
            Height = 96
            Hint = '[[noborder-all | cols:xs-12 sm-12 md-3]]'
            ParentColor = False
            Color = clInfoBk
            TabOrder = 5
          end
          object rcBlock650: TUniContainerPanel
            Tag = 1
            Left = 148
            Top = 214
            Width = 100
            Height = 96
            Hint = '[[noborder-all | cols:xs-12 sm-12 md-3]]'
            ParentColor = False
            Color = clSkyBlue
            TabOrder = 6
          end
          object rcBlock660: TUniContainerPanel
            Tag = 1
            Left = 277
            Top = 214
            Width = 100
            Height = 96
            Hint = '[[noborder-all | cols:xs-12 sm-12 md-3]]'
            ParentColor = False
            Color = clMoneyGreen
            TabOrder = 7
          end
          object rcBlock670: TUniContainerPanel
            Tag = 1
            Left = 393
            Top = 214
            Width = 100
            Height = 96
            Hint = '[[noborder-all | cols:xs-12 sm-12 md-3]]'
            ParentColor = False
            Color = 8421631
            TabOrder = 8
          end
        end
      end
    end
  end
end
