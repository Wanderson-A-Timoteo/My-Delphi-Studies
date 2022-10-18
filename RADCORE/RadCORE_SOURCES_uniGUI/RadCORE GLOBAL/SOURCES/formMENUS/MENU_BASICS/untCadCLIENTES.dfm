inherited frmCadCLIENTES: TfrmCadCLIENTES
  inherited paBaseBackGround: TUniContainerPanel
    inherited paBaseTop: TUniContainerPanel
      inherited paBaseTopTitle: TUniContainerPanel
        inherited labCancel: TUniLabel [0]
        end
        inherited labTitleForm: TUniLabel [1]
          Top = 8
          Hint = '[['#13#10'caption-dots:mobile-v-16 |'#13#10'caption-id'#13#10']]'#13#10#13#10
          ExplicitTop = 8
        end
        inherited labExit: TUniLabel [2]
        end
        inherited labSave: TUniLabel [3]
        end
        inherited btnQuickSearch: TUniBitBtn [4]
        end
        inherited labState: TUniLabel [5]
        end
        inherited labOptions: TUniLabel [6]
        end
        inherited edQuickSearch: TUniEdit [7]
        end
        inherited labEdit: TUniLabel [8]
        end
        inherited labDelete: TUniLabel [9]
        end
        inherited labNew: TUniLabel [10]
        end
      end
    end
    inherited pgBaseCadControl: TUniPageControl
      ActivePage = tabRegister
      inherited tabSearch: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 945
        ExplicitHeight = 510
        inherited paBaseRegSearch: TUniContainerPanel
          Height = 510
          ExplicitHeight = 510
          inherited dbgSearchCRUD: TUniDBGrid
            Height = 510
          end
          inherited paSearchFilters: TUniPanel
            Height = 454
            ExplicitHeight = 454
            inherited UniScrollBox1: TUniScrollBox
              Height = 454
              ExplicitHeight = 454
              ScrollHeight = 1096
              ScrollWidth = 164
              ScrollY = 226
              inherited paSearchFilterDate: TUniContainerPanel
                Top = 532
                ExplicitTop = 532
              end
              inherited paSearchFilter1: TUniContainerPanel
                Top = 51
                ExplicitTop = 51
                inherited paSearchField1: TUniContainerPanel
                  inherited cbxSearchCRUDField1: TUniComboBox
                    Left = 5
                    ExplicitLeft = 5
                  end
                end
              end
              inherited paSearchContent1: TUniContainerPanel
                Top = 171
                ExplicitTop = 171
              end
              inherited paSearchFilter2: TUniContainerPanel
                Top = 291
                ExplicitTop = 291
              end
              inherited paSearchContent2: TUniContainerPanel
                Top = 412
                ExplicitTop = 412
              end
              inherited paSearchFilterAndOr: TUniContainerPanel
                Top = 231
                ExplicitTop = 231
              end
              inherited labTitleSearch: TUniLabel
                Top = -216
                ExplicitTop = -216
              end
              inherited paSearchFilterPeriod: TUniContainerPanel
                Top = 472
                ExplicitTop = 472
              end
              inherited paSearchBtn: TUniContainerPanel
                Top = 834
                ExplicitTop = 834
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
          object pgComplementData: TUniPageControl
            Left = 0
            Top = 0
            Width = 945
            Height = 510
            Hint = ''
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            ActivePage = tabGeral
            Align = alClient
            TabOrder = 1
            OnChange = pgComplementDataChange
            object tabGeral: TUniTabSheet
              Hint = ''
              Caption = 'General'
              object sboxGridBlockTab1: TUniScrollBox
                Left = 0
                Top = 0
                Width = 937
                Height = 480
                Hint = ''
                Align = alClient
                TabOrder = 0
                ScrollHeight = 502
                ScrollWidth = 891
                object UniDBEdit9: TUniDBEdit
                  Left = 960
                  Top = 6
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
                  TabOrder = 22
                  ReadOnly = True
                  InputType = 'search'
                end
                object rcBlock10: TUniContainerPanel
                  Tag = 1
                  Left = 10
                  Top = 11
                  Width = 100
                  Height = 48
                  Hint = '[['#13#10'cols:xs-6 sm-6 md-2 lg-2 xl-2 |'#13#10']]'#13#10
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
                    Hint = 
                      '[['#13#10'state-font-color:i-[[EDIT_COLOR_READONLY]] e-[[EDIT_FONT_COL' +
                      'OR]] b-[[EDIT_FONT_COLOR]] '#13#10']]'#13#10#13#10
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
                  Left = 147
                  Top = 11
                  Width = 100
                  Height = 48
                  Hint = 
                    '[['#13#10'cols:xs-6 sm-6 md-2 |'#13#10'state-color:i-clinfobk e-clskyblue b-' +
                    'clbtnface |'#13#10']]'
                  ParentColor = False
                  TabOrder = 1
                  DesignSize = (
                    100
                    48)
                  object UniLabel27: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 72
                    Height = 15
                    Hint = 
                      '[['#13#10'state-font-color:i-clred e-clwhite b-clblack |'#13#10'state-captio' +
                      'n:i-Data Cadastro e-Data Edi'#231#227'o b-Data |'#13#10']]'#13#10
                    Caption = 'Register Date'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object edDtCad: TUniDBDateTimePicker
                    Left = 0
                    Top = 18
                    Width = 100
                    Height = 29
                    Hint = '[['#13#10'mask:date |'#13#10'valid:date'#13#10']]'
                    DataField = 'dtcadastro'
                    DataSource = dsMaster
                    DateTime = 44279.000000000000000000
                    DateFormat = 'MM/dd/yyyy'
                    TimeFormat = 'HH:mm:ss'
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                  end
                end
                object rcBlock30: TUniContainerPanel
                  Tag = 1
                  Left = 287
                  Top = 11
                  Width = 100
                  Height = 48
                  Hint = '[['#13#10'cols:xs-6 sm-6 md-2 lg-2 xl-2 |'#13#10'state-cls:i-rc-obj-float ]]'
                  ParentColor = False
                  TabOrder = 2
                  DesignSize = (
                    100
                    48)
                  object UniLabel5: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 54
                    Height = 15
                    Hint = ''
                    Caption = 'Born Date'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBDateTimePicker1: TUniDBDateTimePicker
                    Left = 0
                    Top = 21
                    Width = 100
                    Height = 26
                    Hint = '[['#13#10'mask:date |'#13#10'state-enable:i-true e-false b-true |'#13#10']]'
                    DataField = 'DTANIVERSARIO'
                    DataSource = dsMaster
                    DateTime = 44279.000000000000000000
                    DateFormat = 'dd/MM/yyyy'
                    TimeFormat = 'HH:mm:ss'
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                  end
                end
                object rcBlock50: TUniContainerPanel
                  Tag = 1
                  Left = 567
                  Top = 10
                  Width = 100
                  Height = 48
                  Hint = '[[cols:xs-6 sm-6 md-2 lg-2 xl-2]]'
                  ParentColor = False
                  TabOrder = 4
                  DesignSize = (
                    100
                    48)
                  object UniLabel10: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 21
                    Height = 15
                    Hint = ''
                    Caption = 'Doc'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object edCnpjCpf: TUniDBEdit
                    Left = 0
                    Top = 18
                    Width = 100
                    Height = 29
                    Hint = ''
                    DataField = 'CNPJ_CPF'
                    DataSource = dsMaster
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                  end
                end
                object rcBlock40: TUniContainerPanel
                  Tag = 1
                  Left = 427
                  Top = 10
                  Width = 100
                  Height = 48
                  Hint = '[[cols:xs-6 sm-6 md-2 lg-2 xl-2]]'
                  ParentColor = False
                  TabOrder = 3
                  DesignSize = (
                    100
                    48)
                  object UniLabel37: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 43
                    Height = 15
                    Hint = ''
                    Caption = 'PF ou PJ'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object edTipoPessoa: TUniDBComboBox
                    Left = 0
                    Top = 18
                    Width = 100
                    Height = 29
                    Hint = ''
                    Anchors = [akLeft, akTop, akRight]
                    DataField = 'PESSOA'
                    DataSource = dsMaster
                    Items.Strings = (
                      'F'
                      'J')
                    TabOrder = 2
                    IconItems = <>
                    OnChange = edTipoPessoaChange
                  end
                end
                object rcBlock60: TUniContainerPanel
                  Tag = 1
                  Left = 707
                  Top = 10
                  Width = 100
                  Height = 48
                  Hint = '[[cols:xs-6 sm-6 md-2 lg-2 xl-2]]'
                  ParentColor = False
                  TabOrder = 5
                  DesignSize = (
                    100
                    48)
                  object UniLabel42: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 42
                    Height = 15
                    Hint = ''
                    Caption = 'RG / I.E.'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBEdit10: TUniDBEdit
                    Left = 0
                    Top = 18
                    Width = 100
                    Height = 29
                    Hint = ''
                    DataField = 'CGF_RG'
                    DataSource = dsMaster
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                  end
                end
                object rcBlock80: TUniContainerPanel
                  Tag = 1
                  Left = 35
                  Top = 86
                  Width = 376
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-6]]'
                  ParentColor = False
                  TabOrder = 6
                  DesignSize = (
                    376
                    48)
                  object UniLabel6: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 31
                    Height = 15
                    Hint = ''
                    Caption = 'Name'
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
                    Hint = '[['#13#10'valid:blank=Nome'#13#10']]'
                    DataField = 'NOME'
                    DataSource = dsMaster
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                  end
                end
                object rcBlock90: TUniContainerPanel
                  Tag = 1
                  Left = 515
                  Top = 86
                  Width = 376
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-6]]'
                  ParentColor = False
                  TabOrder = 7
                  DesignSize = (
                    376
                    48)
                  object UniLabel12: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 85
                    Height = 15
                    Hint = ''
                    Caption = 'Company Name'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object edRazSoc: TUniDBEdit
                    Left = 0
                    Top = 18
                    Width = 375
                    Height = 29
                    Hint = ''
                    DataField = 'RAZSOC'
                    DataSource = dsMaster
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                  end
                end
                object rcBlock110: TUniContainerPanel
                  Tag = 1
                  Left = 131
                  Top = 157
                  Width = 326
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-7]]'
                  ParentColor = False
                  TabOrder = 9
                  DesignSize = (
                    326
                    48)
                  object UniLabel21: TUniLabel
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
                  object UniDBEdit4: TUniDBEdit
                    Left = 0
                    Top = 18
                    Width = 325
                    Height = 29
                    Hint = ''
                    DataField = 'ENDERECO'
                    DataSource = dsMaster
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                  end
                end
                object rcBlock120: TUniContainerPanel
                  Tag = 1
                  Left = 482
                  Top = 157
                  Width = 100
                  Height = 48
                  Hint = '[[cols:xs-12 sm-6 md-3]]'
                  ParentColor = False
                  TabOrder = 10
                  DesignSize = (
                    100
                    48)
                  object UniLabel13: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 43
                    Height = 15
                    Hint = ''
                    Caption = 'Number'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBEdit5: TUniDBEdit
                    Left = 0
                    Top = 18
                    Width = 100
                    Height = 29
                    Hint = ''
                    DataField = 'NUMERO'
                    DataSource = dsMaster
                    CharCase = ecUpperCase
                    Alignment = taCenter
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                  end
                end
                object rcBlock150: TUniContainerPanel
                  Tag = 1
                  Left = 10
                  Top = 221
                  Width = 100
                  Height = 48
                  Hint = '[[cols:xs-6 sm-6 md-2 lg-2 xl-2]]'
                  ParentColor = False
                  TabOrder = 11
                  DesignSize = (
                    100
                    48)
                  object UniLabel14: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 27
                    Height = 15
                    Hint = ''
                    Caption = 'State'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object edLkpUFS: TUniDBEdit
                    Left = 0
                    Top = 18
                    Width = 100
                    Height = 29
                    Hint = '[[DESCRICAO CODIUF ! ]]'
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                    Color = clInfoBk
                    ReadOnly = True
                    InputType = 'text'
                    OnClick = edLkpUFSClick
                  end
                end
                object rcBlock160: TUniContainerPanel
                  Tag = 1
                  Left = 131
                  Top = 221
                  Width = 326
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-4 lg-4 xl-4]]'
                  ParentColor = False
                  TabOrder = 12
                  DesignSize = (
                    326
                    48)
                  object UniLabel15: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 21
                    Height = 15
                    Hint = ''
                    Caption = 'City'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object edLkpCIDADES: TUniDBEdit
                    Left = 0
                    Top = 18
                    Width = 325
                    Height = 29
                    Hint = 
                      '[['#13#10'DESCRICAO CODICIDADE @70 + |'#13#10'lkpfilter:quoted(uf=edLkpUFS<t' +
                      'ext>) |'#13#10'lkpfilter-empty:Selecione uma UF<translate>|'#13#10'lkpfilter' +
                      '-order: |'#13#10'lkpfilter-searchfields:codiibge |'#13#10'lkpfilter-gridattr' +
                      ': |'#13#10'valid:blank'#13#10']]'#13#10
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
                  Left = 611
                  Top = 219
                  Width = 229
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-4 lg-4 xl-4]]'
                  ParentColor = False
                  TabOrder = 14
                  DesignSize = (
                    229
                    48)
                  object UniLabel16: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 41
                    Height = 15
                    Hint = ''
                    Caption = 'District'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBEdit8: TUniDBEdit
                    Left = 0
                    Top = 18
                    Width = 229
                    Height = 29
                    Hint = ''
                    DataField = 'BAIRRO'
                    DataSource = dsMaster
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                  end
                end
                object rcBlock170: TUniContainerPanel
                  Tag = 1
                  Left = 482
                  Top = 221
                  Width = 100
                  Height = 48
                  Hint = '[[cols:xs-6 sm-6 md-2 lg-2 xl-2]]'
                  ParentColor = False
                  TabOrder = 13
                  DesignSize = (
                    100
                    48)
                  object UniLabel45: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 55
                    Height = 15
                    Hint = ''
                    Caption = 'IBGE Code'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object edLkpCIDADES_SetDS_CODIIBGE: TUniDBEdit
                    Left = 0
                    Top = 18
                    Width = 100
                    Height = 29
                    Hint = '[[ saveto: ]]'
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                  end
                end
                object rcBlock190: TUniContainerPanel
                  Tag = 1
                  Left = 10
                  Top = 288
                  Width = 301
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-6]]'
                  ParentColor = False
                  TabOrder = 15
                  DesignSize = (
                    301
                    48)
                  object UniLabel35: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 20
                    Height = 15
                    Hint = ''
                    Caption = 'Site'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBEdit3: TUniDBEdit
                    Left = 0
                    Top = 18
                    Width = 301
                    Height = 29
                    Hint = '[['#13#10'link: |'#13#10']]'#13#10
                    DataField = 'SITE'
                    DataSource = dsMaster
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                  end
                end
                object rcBlock210: TUniContainerPanel
                  Tag = 1
                  Left = 389
                  Top = 288
                  Width = 342
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-6]]'
                  ParentColor = False
                  TabOrder = 16
                  DesignSize = (
                    342
                    48)
                  object UniLabel47: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 100
                    Height = 15
                    Hint = ''
                    Caption = 'Commercial Email'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBEdit17: TUniDBEdit
                    Left = 0
                    Top = 18
                    Width = 342
                    Height = 29
                    Hint = '[['#13#10'valid:email notblank'#13#10']]'
                    DataField = 'EMAIL'
                    DataSource = dsMaster
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                  end
                end
                object rcBlock230: TUniContainerPanel
                  Tag = 1
                  Left = 10
                  Top = 355
                  Width = 200
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-6 lg-3 xl-3]]'
                  ParentColor = False
                  TabOrder = 17
                  DesignSize = (
                    200
                    48)
                  object UniLabel18: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 34
                    Height = 15
                    Hint = ''
                    Caption = 'Phone'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object edPhone: TUniDBEdit
                    Left = 0
                    Top = 18
                    Width = 85
                    Height = 29
                    Hint = '[['#13#10'mask:phoneddd |'#13#10'dial:'#13#10']]'
                    DataField = 'FONE1'
                    DataSource = dsMaster
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                  end
                  object UniDBEdit19: TUniDBEdit
                    Left = 94
                    Top = 18
                    Width = 105
                    Height = 29
                    Hint = ''
                    DataField = 'DESCRIFONE1'
                    DataSource = dsMaster
                    CharCase = ecUpperCase
                    Anchors = [akTop, akRight]
                    TabOrder = 3
                  end
                  object UniLabel40: TUniLabel
                    Left = 94
                    Top = 0
                    Width = 63
                    Height = 15
                    Hint = ''
                    Caption = 'Description'
                    Anchors = [akTop, akRight]
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 4
                  end
                end
                object rcBlock240: TUniContainerPanel
                  Tag = 1
                  Left = 219
                  Top = 355
                  Width = 200
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-6 lg-3 xl-3]]'
                  ParentColor = False
                  TabOrder = 18
                  DesignSize = (
                    200
                    48)
                  object UniLabel19: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 34
                    Height = 15
                    Hint = ''
                    Caption = 'Phone'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBEdit20: TUniDBEdit
                    Left = 0
                    Top = 18
                    Width = 85
                    Height = 29
                    Hint = '[['#13#10'mask:phoneddd'#13#10']]'
                    DataField = 'FONE2'
                    DataSource = dsMaster
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                  end
                  object UniDBEdit21: TUniDBEdit
                    Left = 94
                    Top = 18
                    Width = 105
                    Height = 29
                    Hint = ''
                    DataField = 'DESCRIFONE2'
                    DataSource = dsMaster
                    CharCase = ecUpperCase
                    Anchors = [akTop, akRight]
                    TabOrder = 3
                  end
                  object UniLabel17: TUniLabel
                    Left = 94
                    Top = 0
                    Width = 63
                    Height = 15
                    Hint = ''
                    Caption = 'Description'
                    Anchors = [akTop, akRight]
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 4
                  end
                end
                object rcBlock250: TUniContainerPanel
                  Tag = 1
                  Left = 425
                  Top = 355
                  Width = 200
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-6 lg-3 xl-3]]'
                  ParentColor = False
                  TabOrder = 19
                  DesignSize = (
                    200
                    48)
                  object UniLabel20: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 34
                    Height = 15
                    Hint = ''
                    Caption = 'Phone'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBEdit23: TUniDBEdit
                    Left = 0
                    Top = 18
                    Width = 85
                    Height = 29
                    Hint = '[[mask:phoneddd]]'
                    DataField = 'FONE3'
                    DataSource = dsMaster
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                  end
                  object UniDBEdit24: TUniDBEdit
                    Left = 94
                    Top = 18
                    Width = 105
                    Height = 29
                    Hint = ''
                    DataField = 'DESCRIFONE3'
                    DataSource = dsMaster
                    CharCase = ecUpperCase
                    Anchors = [akTop, akRight]
                    TabOrder = 3
                  end
                  object UniLabel49: TUniLabel
                    Left = 94
                    Top = 0
                    Width = 63
                    Height = 15
                    Hint = ''
                    Caption = 'Description'
                    Anchors = [akTop, akRight]
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 4
                  end
                end
                object rcBlock260: TUniContainerPanel
                  Tag = 1
                  Left = 633
                  Top = 354
                  Width = 200
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-6 lg-3 xl-3]]'
                  ParentColor = False
                  TabOrder = 20
                  DesignSize = (
                    200
                    48)
                  object UniLabel50: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 34
                    Height = 15
                    Hint = ''
                    Caption = 'Phone'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBEdit25: TUniDBEdit
                    Left = 0
                    Top = 18
                    Width = 85
                    Height = 29
                    Hint = '[['#13#10'mask:phoneddd '#13#10']]'
                    DataField = 'FONE4'
                    DataSource = dsMaster
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                  end
                  object UniEdit1: TUniEdit
                    Left = 94
                    Top = 18
                    Width = 79
                    Height = 29
                    Hint = ''
                    Text = 'WhatsApp'
                    Anchors = [akTop, akRight]
                    TabOrder = 3
                    Color = clSilver
                    ReadOnly = True
                  end
                  object UniSpeedButton1: TUniSpeedButton
                    Left = 174
                    Top = 18
                    Width = 24
                    Height = 29
                    Hint = '[['#13#10'cls:ButtonThemeCrud | '#13#10'ico:fas-paper-plane'#13#10']]'
                    Caption = 'A'
                    Anchors = [akTop, akRight]
                    ParentColor = False
                    TabOrder = 4
                    OnClick = UniSpeedButton1Click
                  end
                end
                object rcBlock270: TUniContainerPanel
                  Tag = 4
                  Left = 69
                  Top = 480
                  Width = 729
                  Height = 22
                  Hint = '[[cols:12 | round:all]]'
                  ParentColor = False
                  TabOrder = 21
                end
                object rcBlock100: TUniContainerPanel
                  Tag = 1
                  Left = 10
                  Top = 157
                  Width = 100
                  Height = 48
                  Hint = '[[cols:xs-6 sm-6 md-2 lg-2 xl-2]]'
                  ParentColor = False
                  TabOrder = 8
                  DesignSize = (
                    100
                    48)
                  object UniLabel4: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 99
                    Height = 15
                    Hint = ''
                    Caption = 'Postal Code( Cep )'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object edCep: TUniDBEdit
                    Left = 0
                    Top = 18
                    Width = 100
                    Height = 29
                    Hint = '[['#13#10'mask:cep |'#13#10']]'
                    DataField = 'CEP'
                    DataSource = dsMaster
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                    OnExit = edCepExit
                  end
                end
              end
            end
            object UniTabSheet2: TUniTabSheet
              Hint = ''
              Caption = 'Address'
              object sboxGridBlockTab2: TUniScrollBox
                Left = 0
                Top = 0
                Width = 937
                Height = 480
                Hint = ''
                Align = alClient
                TabOrder = 0
                ScrollHeight = 534
                ScrollWidth = 842
                object rcBlock550: TUniContainerPanel
                  Tag = 4
                  Left = 79
                  Top = 512
                  Width = 729
                  Height = 22
                  Hint = '[[cols:12 | round:all]]'
                  ParentColor = False
                  TabOrder = 0
                end
                object rcBlock370: TUniContainerPanel
                  Tag = 1
                  Left = 133
                  Top = 67
                  Width = 326
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-8]]'
                  ParentColor = False
                  TabOrder = 1
                  DesignSize = (
                    326
                    48)
                  object UniLabel74: TUniLabel
                    Left = 0
                    Top = -1
                    Width = 41
                    Height = 13
                    Hint = ''
                    Caption = 'Address'
                    ParentFont = False
                    TabOrder = 1
                  end
                  object UniDBEdit32: TUniDBEdit
                    Left = 0
                    Top = 18
                    Width = 325
                    Height = 29
                    Hint = ''
                    DataField = 'ENDERECOENTREGA'
                    DataSource = dsMaster
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
                  Hint = '[[cols:xs-6 sm-6 md-2 lg-2 xl-2]]'
                  ParentColor = False
                  TabOrder = 2
                  DesignSize = (
                    100
                    48)
                  object UniLabel75: TUniLabel
                    Left = 0
                    Top = -1
                    Width = 41
                    Height = 13
                    Hint = ''
                    Caption = 'Number'
                    ParentFont = False
                    TabOrder = 1
                  end
                  object UniDBEdit34: TUniDBEdit
                    Left = 0
                    Top = 18
                    Width = 100
                    Height = 29
                    Hint = ''
                    DataField = 'NUMEROENTREGA'
                    DataSource = dsMaster
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
                  Hint = '[[cols:xs-4 sm-4 md-2 lg-2 xl-2]]'
                  ParentColor = False
                  TabOrder = 3
                  DesignSize = (
                    100
                    48)
                  object UniLabel78: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 26
                    Height = 13
                    Hint = ''
                    Caption = 'State'
                    ParentFont = False
                    TabOrder = 1
                  end
                  object edLkpUFS__ENTREGA: TUniDBEdit
                    Left = 0
                    Top = 18
                    Width = 100
                    Height = 29
                    Hint = '[[DESCRICAO CODIUFENTREGA !]]'
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
                  Top = 130
                  Width = 326
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-5 lg-5 xl-5]]'
                  ParentColor = False
                  TabOrder = 4
                  DesignSize = (
                    326
                    48)
                  object UniLabel79: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 19
                    Height = 13
                    Hint = ''
                    Caption = 'City'
                    ParentFont = False
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
                    OnClick = edLkpCIDADES__ENTREGAClick
                  end
                end
                object rcBlock430: TUniContainerPanel
                  Tag = 1
                  Left = 613
                  Top = 129
                  Width = 229
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-5 lg-5 xl-5]]'
                  ParentColor = False
                  TabOrder = 5
                  DesignSize = (
                    229
                    48)
                  object UniLabel80: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 36
                    Height = 13
                    Hint = ''
                    Caption = 'District'
                    ParentFont = False
                    TabOrder = 1
                  end
                  object UniDBEdit43: TUniDBEdit
                    Left = 0
                    Top = 18
                    Width = 229
                    Height = 29
                    Hint = ''
                    DataField = 'BAIRRO'
                    DataSource = dsMaster
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                  end
                end
                object rcBlock450: TUniContainerPanel
                  Tag = 1
                  Left = 130
                  Top = 259
                  Width = 326
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-8]]'
                  ParentColor = False
                  TabOrder = 6
                  DesignSize = (
                    326
                    48)
                  object UniLabel23: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 41
                    Height = 13
                    Hint = ''
                    Caption = 'Address'
                    ParentFont = False
                    TabOrder = 1
                  end
                  object UniDBEdit12: TUniDBEdit
                    Left = 0
                    Top = 18
                    Width = 325
                    Height = 29
                    Hint = ''
                    DataField = 'ENDERECOCOBRANCA'
                    DataSource = dsMaster
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                  end
                end
                object rcBlock460: TUniContainerPanel
                  Tag = 1
                  Left = 481
                  Top = 259
                  Width = 100
                  Height = 48
                  Hint = '[[cols:xs-6 sm-6 md-2 lg-2 xl-2]]'
                  ParentColor = False
                  TabOrder = 7
                  DesignSize = (
                    100
                    48)
                  object UniLabel24: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 41
                    Height = 13
                    Hint = ''
                    Caption = 'Number'
                    ParentFont = False
                    TabOrder = 1
                  end
                  object UniDBEdit14: TUniDBEdit
                    Left = 0
                    Top = 18
                    Width = 100
                    Height = 29
                    Hint = ''
                    DataField = 'NUMEROCOBRANCA'
                    DataSource = dsMaster
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                  end
                end
                object rcBlock490: TUniContainerPanel
                  Tag = 1
                  Left = 9
                  Top = 323
                  Width = 100
                  Height = 48
                  Hint = '[[cols:xs-4 sm-4 md-2 lg-2 xl-2]]'
                  ParentColor = False
                  TabOrder = 8
                  DesignSize = (
                    100
                    48)
                  object UniLabel28: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 26
                    Height = 13
                    Hint = ''
                    Caption = 'State'
                    ParentFont = False
                    TabOrder = 1
                  end
                  object edLkpUFS__COBRANCA: TUniDBEdit
                    Left = 0
                    Top = 18
                    Width = 100
                    Height = 29
                    Hint = '[[DESCRICAO CODIUFCOBRANCA ! ]]'
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
                  Left = 130
                  Top = 323
                  Width = 326
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-5 lg-5 xl-5]]'
                  ParentColor = False
                  TabOrder = 9
                  DesignSize = (
                    326
                    48)
                  object UniLabel29: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 19
                    Height = 13
                    Hint = ''
                    Caption = 'City'
                    ParentFont = False
                    TabOrder = 1
                  end
                  object edLkpCIDADES__COBRANCA: TUniDBEdit
                    Left = 0
                    Top = 18
                    Width = 325
                    Height = 29
                    Hint = '[[DESCRICAO CODICIDADECOBRANCA @60 ! +]]'
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                    Color = clInfoBk
                    ReadOnly = True
                    InputType = 'text'
                    OnClick = edLkpCIDADES__COBRANCAClick
                  end
                end
                object rcBlock510: TUniContainerPanel
                  Tag = 1
                  Left = 610
                  Top = 321
                  Width = 229
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-5 lg-5 xl-5]]'
                  ParentColor = False
                  TabOrder = 10
                  DesignSize = (
                    229
                    48)
                  object UniLabel59: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 36
                    Height = 13
                    Hint = ''
                    Caption = 'District'
                    ParentFont = False
                    TabOrder = 1
                  end
                  object UniDBEdit42: TUniDBEdit
                    Left = 0
                    Top = 18
                    Width = 229
                    Height = 29
                    Hint = ''
                    DataField = 'BAIRROCOBRANCA'
                    DataSource = dsMaster
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
                  TabOrder = 11
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
                    Caption = 'DELIVERY ADDRESS'
                    ParentFont = False
                    Font.Color = clGray
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                end
                object rcBlock435: TUniContainerPanel
                  Tag = 4
                  Left = 10
                  Top = 201
                  Width = 729
                  Height = 23
                  Hint = '[[cols:12 | round:all]]'
                  ParentColor = False
                  TabOrder = 12
                  object UniLabel31: TUniLabel
                    AlignWithMargins = True
                    Left = 0
                    Top = 0
                    Width = 717
                    Height = 19
                    Hint = '[[cols:12 | round:all]]'
                    Margins.Left = 6
                    Margins.Top = 6
                    Margins.Right = 6
                    Margins.Bottom = 6
                    AutoSize = False
                    Caption = 'BILLING ADDRESS'
                    ParentFont = False
                    Font.Color = clGray
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                end
                object rcBlock360: TUniContainerPanel
                  Tag = 1
                  Left = 12
                  Top = 67
                  Width = 100
                  Height = 48
                  Hint = '[[cols:xs-6 sm-6 md-2 lg-2 xl-2]]'
                  ParentColor = False
                  TabOrder = 13
                  DesignSize = (
                    100
                    48)
                  object UniLabel73: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 92
                    Height = 13
                    Hint = ''
                    Caption = 'Postal Code( CEP )'
                    ParentFont = False
                    TabOrder = 1
                  end
                  object edCepCOBRANCA: TUniDBEdit
                    Left = 0
                    Top = 18
                    Width = 100
                    Height = 29
                    Hint = '[[mask:cep]]'
                    DataField = 'CEPENTREGA'
                    DataSource = dsMaster
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                    OnExit = edCepCOBRANCAExit
                  end
                end
                object rcBlock440: TUniContainerPanel
                  Tag = 1
                  Left = 9
                  Top = 259
                  Width = 100
                  Height = 48
                  Hint = '[[cols:xs-4 sm-4 md-2 lg-2 xl-2]]'
                  ParentColor = False
                  TabOrder = 14
                  DesignSize = (
                    100
                    48)
                  object UniLabel22: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 95
                    Height = 13
                    Hint = ''
                    Caption = 'Postal Code ( CEP )'
                    ParentFont = False
                    TabOrder = 1
                  end
                  object edCepENTREGA: TUniDBEdit
                    Left = 0
                    Top = 18
                    Width = 100
                    Height = 29
                    Hint = '[[mask:cep]]'
                    DataField = 'CEPCOBRANCA'
                    DataSource = dsMaster
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                    OnExit = edCepENTREGAExit
                  end
                end
              end
            end
            object tabComercial: TUniTabSheet
              Hint = ''
              Caption = 'Commercial'
              object sboxTab4: TUniScrollBox
                Left = 0
                Top = 0
                Width = 937
                Height = 480
                Hint = ''
                Align = alClient
                TabOrder = 0
                ScrollHeight = 371
                ScrollWidth = 579
                object rcBlock520: TUniContainerPanel
                  Tag = 1
                  Left = 14
                  Top = 56
                  Width = 120
                  Height = 48
                  Hint = '[['#13#10'cols:xs-12 sm-12 md-4'#13#10']]'
                  ParentColor = False
                  TabOrder = 0
                  DesignSize = (
                    120
                    48)
                  object UniLabel25: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 84
                    Height = 13
                    Hint = ''
                    Caption = 'Financial Officer'
                    ParentFont = False
                    TabOrder = 1
                  end
                  object edLkpCLIENTES: TUniDBEdit
                    Left = 0
                    Top = 18
                    Width = 120
                    Height = 29
                    Hint = '[['#13#10'NOME+FONE1 CODICLIPAI  @40 #90CGF_RG |'#13#10']]'
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                    Color = clInfoBk
                    ReadOnly = True
                    InputType = 'text'
                    OnClick = edLkpCLIENTESClick
                    OnExit = edLkpCLIENTESExit
                    OnEnter = edLkpCLIENTESEnter
                  end
                end
                object rcBlock525: TUniContainerPanel
                  Tag = 1
                  Left = 155
                  Top = 56
                  Width = 120
                  Height = 48
                  Hint = '[['#13#10'cols:xs-12 sm-12 md-4'#13#10']]'
                  ParentColor = False
                  TabOrder = 1
                  DesignSize = (
                    120
                    48)
                  object UniLabel26: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 27
                    Height = 13
                    Hint = ''
                    Caption = 'Email'
                    ParentFont = False
                    TabOrder = 1
                  end
                  object ed_lkp_Email: TUniEdit
                    Left = 0
                    Top = 18
                    Width = 120
                    Height = 29
                    Hint = ''
                    Text = ''
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                  end
                end
                object rcBlock530: TUniContainerPanel
                  Tag = 1
                  Left = 318
                  Top = 43
                  Width = 120
                  Height = 48
                  Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
                  ParentColor = False
                  TabOrder = 2
                  DesignSize = (
                    120
                    48)
                  object UniLabel41: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 33
                    Height = 13
                    Hint = ''
                    Caption = 'Phone'
                    ParentFont = False
                    TabOrder = 1
                  end
                  object ed_lkp_fone: TUniEdit
                    Left = 0
                    Top = 18
                    Width = 120
                    Height = 29
                    Hint = ''
                    Text = ''
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                  end
                end
                object rcBlock535: TUniContainerPanel
                  Tag = 1
                  Left = 459
                  Top = 43
                  Width = 120
                  Height = 48
                  Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
                  ParentColor = False
                  TabOrder = 3
                  DesignSize = (
                    120
                    48)
                  object UniLabel43: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 40
                    Height = 13
                    Hint = ''
                    Caption = 'Blocked'
                    ParentFont = False
                    TabOrder = 1
                  end
                  object ed_lkp_block: TUniEdit
                    Left = 0
                    Top = 18
                    Width = 120
                    Height = 29
                    Hint = ''
                    Text = ''
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                  end
                end
                object rcBlock540: TUniContainerPanel
                  Tag = 1
                  Left = 32
                  Top = 254
                  Width = 493
                  Height = 117
                  Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                  ParentColor = False
                  TabOrder = 4
                  object labAlert: TUniLabel
                    Left = 4
                    Top = 3
                    Width = 476
                    Height = 112
                    Hint = '[[ bsalert:info ]]'
                    TextConversion = txtHTML
                    AutoSize = False
                    Caption = 
                      'The fields EMAIL, PHONE, BLOCKED are being used for dictation pu' +
                      'rposes. Just to demonstrate LOOKUP lookup with multiple fields r' +
                      'eturn.'
                    ParentFont = False
                    Font.Style = [fsBold]
                    TabOrder = 1
                  end
                end
              end
            end
            object tabLicencas: TUniTabSheet
              Hint = ''
              Caption = 'Licences'
              object sboxTab5: TUniScrollBox
                Left = 0
                Top = 0
                Width = 937
                Height = 480
                Hint = ''
                Align = alClient
                TabOrder = 0
                ScrollHeight = 250
                ScrollWidth = 694
                object rcBlock650: TUniContainerPanel
                  Tag = 1
                  Left = 16
                  Top = 18
                  Width = 120
                  Height = 48
                  Hint = '[[cols:xs-6 sm-6 md-2]]'
                  ParentColor = False
                  TabOrder = 0
                  DesignSize = (
                    120
                    48)
                  object UniLabel1: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 56
                    Height = 13
                    Hint = ''
                    Caption = 'Initial Date'
                    ParentFont = False
                    TabOrder = 1
                  end
                  object UniDBDateTimePicker3: TUniDBDateTimePicker
                    Left = 0
                    Top = 19
                    Width = 120
                    Height = 29
                    Hint = '[['#13#10'mask:date |'#13#10']]'
                    DataField = 'dtcadastro'
                    DataSource = dsMaster
                    DateTime = 43596.000000000000000000
                    DateFormat = 'dd/MM/yyyy'
                    TimeFormat = 'HH:mm:ss'
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                  end
                end
                object rcBlock660: TUniContainerPanel
                  Tag = 1
                  Left = 157
                  Top = 18
                  Width = 120
                  Height = 48
                  Hint = '[[cols:xs-6 sm-6 md-2]]'
                  ParentColor = False
                  TabOrder = 1
                  DesignSize = (
                    120
                    48)
                  object UniLabel32: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 52
                    Height = 13
                    Hint = ''
                    Caption = 'Final Date'
                    ParentFont = False
                    TabOrder = 1
                  end
                  object UniDBDateTimePicker4: TUniDBDateTimePicker
                    Left = 0
                    Top = 19
                    Width = 120
                    Height = 29
                    Hint = '[['#13#10'mask:date |'#13#10'valid:>05/02/2022'#13#10']]'#13#10
                    DataField = 'DTANIVERSARIO'
                    DataSource = dsMaster
                    DateTime = 43596.000000000000000000
                    DateFormat = 'dd/MM/yyyy'
                    TimeFormat = 'HH:mm:ss'
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                  end
                end
                object rcBlock670: TUniContainerPanel
                  Tag = 1
                  Left = 296
                  Top = 18
                  Width = 120
                  Height = 48
                  Hint = '[[cols:xs-6 sm-6 md-2]]'
                  ParentColor = False
                  TabOrder = 2
                  DesignSize = (
                    120
                    48)
                  object UniLabel33: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 73
                    Height = 13
                    Hint = ''
                    Caption = 'Expiration day'
                    ParentFont = False
                    TabOrder = 1
                  end
                  object UniDBEdit31: TUniDBEdit
                    Left = 0
                    Top = 19
                    Width = 120
                    Height = 29
                    Hint = '[['#13#10'valid:=20 or >25'#13#10']]'
                    DataField = 'DIA_COBRANCA'
                    DataSource = dsMaster
                    CharCase = ecUpperCase
                    Alignment = taRightJustify
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                    InputMask.RemoveWhiteSpace = True
                  end
                end
                object rcBlock680: TUniContainerPanel
                  Tag = 1
                  Left = 433
                  Top = 18
                  Width = 120
                  Height = 48
                  Hint = '[[cols:xs-6 sm-6 md-2]]'
                  ParentColor = False
                  TabOrder = 3
                  DesignSize = (
                    120
                    48)
                  object UniLabel34: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 100
                    Height = 13
                    Hint = ''
                    Caption = 'Number of Licences'
                    ParentFont = False
                    TabOrder = 1
                  end
                  object UniDBEdit46: TUniDBEdit
                    Left = 0
                    Top = 19
                    Width = 120
                    Height = 29
                    Hint = '[['#13#10'valid:>=1 and <=9'#13#10']]'
                    DataField = 'LICENCAS'
                    DataSource = dsMaster
                    CharCase = ecUpperCase
                    Alignment = taRightJustify
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                    InputMask.RemoveWhiteSpace = True
                  end
                end
                object rcBlock690: TUniContainerPanel
                  Tag = 1
                  Left = 574
                  Top = 9
                  Width = 120
                  Height = 48
                  Hint = '[[cols:xs-6 sm-6 md-2]]'
                  ParentColor = False
                  TabOrder = 4
                  DesignSize = (
                    120
                    48)
                  object UniLabel36: TUniLabel
                    Left = 0
                    Top = -1
                    Width = 74
                    Height = 13
                    Hint = ''
                    Caption = 'Monthly Value'
                    ParentFont = False
                    TabOrder = 1
                  end
                  object UniDBNumberEdit1: TUniDBFormattedNumberEdit
                    Left = 0
                    Top = 19
                    Width = 92
                    Height = 29
                    Hint = '[['#13#10'valid:>99.99 and <=500'#13#10']]'
                    DataField = 'VALOR_CONTRATO'
                    DataSource = dsMaster
                    Alignment = taRightJustify
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                  object btnPayment: TUniSpeedButton
                    Left = 92
                    Top = 18
                    Width = 27
                    Height = 29
                    Hint = 
                      '[['#13#10'field-cls:bloqueado value-S:ButtonRed value-N:ButtonGreen ds' +
                      ':dsMaster| '#13#10'field-ico:bloqueado value-S:fas-hand-holding-usd va' +
                      'lue-N:fas-piggy-bank ds:dsMaster|'#13#10'field-cls-ico:bloqueado value' +
                      '-S:rc-btn-font-white value-N:rc-btn-font-black ds:dsMaster|'#13#10']]'#13 +
                      #10#13#10
                    Caption = 'A'
                    Anchors = [akTop, akRight]
                    ParentColor = False
                    TabOrder = 3
                  end
                end
                object rcBlock710: TUniContainerPanel
                  Tag = 1
                  Left = 20
                  Top = 120
                  Width = 141
                  Height = 130
                  Hint = '[[cols:xs-12 sm-12 md-6]]'
                  ParentColor = False
                  TabOrder = 5
                  object UniLabel38: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 37
                    Height = 13
                    Hint = ''
                    Caption = 'STATUS'
                    ParentFont = False
                    TabOrder = 1
                  end
                  object UniDBCheckBox10: TUniDBCheckBox
                    Left = 3
                    Top = 23
                    Width = 120
                    Height = 17
                    Hint = ''
                    DataField = 'ATIVO'
                    DataSource = dsMaster
                    ValueChecked = 'S'
                    ValueUnchecked = 'N'
                    Caption = 'Active'
                    TabOrder = 2
                    ParentColor = False
                    Color = clBtnFace
                  end
                  object UniDBCheckBox11: TUniDBCheckBox
                    Left = 3
                    Top = 45
                    Width = 120
                    Height = 17
                    Hint = ''
                    DataField = 'BLOQUEADO'
                    DataSource = dsMaster
                    ValueChecked = 'S'
                    ValueUnchecked = 'N'
                    Caption = 'Blocked'
                    TabOrder = 3
                    ParentColor = False
                    Color = clBtnFace
                  end
                  object UniDBCheckBox12: TUniDBCheckBox
                    Left = 3
                    Top = 64
                    Width = 120
                    Height = 17
                    Hint = ''
                    DataField = 'TRAVADO'
                    DataSource = dsMaster
                    ValueChecked = 'S'
                    ValueUnchecked = 'N'
                    Caption = 'Locked'
                    TabOrder = 4
                    ParentColor = False
                    Color = clBtnFace
                  end
                  object UniDBCheckBox21: TUniDBCheckBox
                    Left = 3
                    Top = 84
                    Width = 120
                    Height = 17
                    Hint = ''
                    DataField = 'INADIMPLENTE'
                    DataSource = dsMaster
                    ValueChecked = 'S'
                    ValueUnchecked = 'N'
                    Caption = 'Defaulter'
                    TabOrder = 5
                    ParentColor = False
                    Color = clBtnFace
                  end
                  object UniDBCheckBox22: TUniDBCheckBox
                    Left = 3
                    Top = 103
                    Width = 120
                    Height = 17
                    Hint = ''
                    DataField = 'ESPECIAL'
                    DataSource = dsMaster
                    ValueChecked = 'S'
                    ValueUnchecked = 'N'
                    Caption = 'Special'
                    TabOrder = 6
                    ParentColor = False
                    Color = clBtnFace
                  end
                end
                object rcBlock720: TUniContainerPanel
                  Tag = 1
                  Left = 171
                  Top = 120
                  Width = 256
                  Height = 130
                  Hint = '[[cols:xs-12 sm-12 md-6]]'
                  ParentColor = False
                  TabOrder = 6
                  object UniLabel39: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 106
                    Height = 13
                    Hint = ''
                    Caption = 'MODULES RELEASED'
                    ParentFont = False
                    TabOrder = 1
                  end
                  object UniDBCheckBox2: TUniDBCheckBox
                    Left = 1
                    Top = 23
                    Width = 120
                    Height = 17
                    Hint = ''
                    DataField = 'NFE'
                    DataSource = dsMaster
                    ValueChecked = 'S'
                    ValueUnchecked = 'N'
                    Caption = 'NFe'
                    TabOrder = 2
                    ParentColor = False
                    Color = clBtnFace
                  end
                  object UniDBCheckBox7: TUniDBCheckBox
                    Left = 3
                    Top = 45
                    Width = 120
                    Height = 17
                    Hint = ''
                    DataField = 'BOLETOS'
                    DataSource = dsMaster
                    ValueChecked = 'S'
                    ValueUnchecked = 'N'
                    Caption = 'Boletos'
                    TabOrder = 3
                    ParentColor = False
                    Color = clBtnFace
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
      'select * from clientes')
  end
  inherited popMenuOptions: TUniPopupMenu
    Left = 418
    Top = 16
    object Revisoes: TUniMenuItem
      Caption = 'Revis'#245'es'
      OnClick = RevisoesClick
    end
    object Veculos1: TUniMenuItem
      Caption = 'Ve'#237'culos'
      OnClick = Veculos1Click
    end
  end
end
