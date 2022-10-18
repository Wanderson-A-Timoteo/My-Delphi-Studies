inherited frmCadEMPRESAS: TfrmCadEMPRESAS
  inherited paBaseBackGround: TUniContainerPanel
    inherited pgBaseCadControl: TUniPageControl
      ActivePage = tabRegister
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
              ScrollY = 220
              inherited labTitleSearch: TUniLabel
                Top = -210
                ExplicitTop = -210
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
                ScrollHeight = 452
                ScrollWidth = 889
                object rcBlock10: TUniContainerPanel
                  Tag = 1
                  Left = 10
                  Top = 11
                  Width = 100
                  Height = 48
                  Hint = '[['#13#10'cols:xs-4 sm-4 md-2'#13#10']]'
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
                object rcBlock50: TUniContainerPanel
                  Tag = 1
                  Left = 146
                  Top = 10
                  Width = 142
                  Height = 48
                  Hint = '[['#13#10'cols:xs-8 sm-8 md-3'#13#10']]'
                  ParentColor = False
                  TabOrder = 1
                  DesignSize = (
                    142
                    48)
                  object UniLabel4: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 25
                    Height = 15
                    Hint = ''
                    Caption = 'Cnpj'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object edCnpj: TUniDBEdit
                    Left = 0
                    Top = 18
                    Width = 142
                    Height = 29
                    Hint = '[['#13#10'valid:cnpj | '#13#10'mask:cnpj'#13#10']]'
                    DataField = 'CNPJ'
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
                  TabOrder = 2
                  DesignSize = (
                    376
                    48)
                  object UniLabel6: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 90
                    Height = 15
                    Hint = ''
                    Caption = 'Nome / Fantasia'
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
                object rcBlock90: TUniContainerPanel
                  Tag = 1
                  Left = 513
                  Top = 86
                  Width = 376
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-6]]'
                  ParentColor = False
                  TabOrder = 3
                  DesignSize = (
                    376
                    48)
                  object UniLabel11: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 70
                    Height = 15
                    Hint = ''
                    Caption = 'Raz'#227'o Social'
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
                  TabOrder = 4
                  DesignSize = (
                    326
                    48)
                  object UniLabel21: TUniLabel
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
                  TabOrder = 5
                  DesignSize = (
                    100
                    48)
                  object UniLabel13: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 43
                    Height = 15
                    Hint = ''
                    Caption = 'N'#250'mero'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBEdit5: TUniDBEdit
                    Left = 0
                    Top = 18
                    Width = 99
                    Height = 29
                    Hint = ''
                    DataField = 'NUMERO'
                    DataSource = dsMaster
                    CharCase = ecUpperCase
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
                  Hint = '[[cols:xs-6 sm-6 md-2]]'
                  ParentColor = False
                  TabOrder = 6
                  DesignSize = (
                    100
                    48)
                  object UniLabel14: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 14
                    Height = 15
                    Hint = ''
                    Caption = 'UF'
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
                  end
                end
                object rcBlock160: TUniContainerPanel
                  Tag = 1
                  Left = 131
                  Top = 221
                  Width = 326
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-5]]'
                  ParentColor = False
                  TabOrder = 7
                  DesignSize = (
                    326
                    48)
                  object UniLabel15: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 38
                    Height = 15
                    Hint = ''
                    Caption = 'Cidade'
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
                    Hint = '[['#13#10'DESCRICAO CODICIDADE @60 + |'#13#10'valid:blank'#13#10']]'
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
                  Left = 511
                  Top = 227
                  Width = 229
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-5]]'
                  ParentColor = False
                  TabOrder = 8
                  DesignSize = (
                    229
                    48)
                  object UniLabel16: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 35
                    Height = 15
                    Hint = ''
                    Caption = 'Bairro'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBEdit6: TUniDBEdit
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
                object rcBlock190: TUniContainerPanel
                  Tag = 1
                  Left = 10
                  Top = 288
                  Width = 301
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-6]]'
                  ParentColor = False
                  TabOrder = 9
                  DesignSize = (
                    301
                    48)
                  object UniLabel27: TUniLabel
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
                  TabOrder = 10
                  DesignSize = (
                    342
                    48)
                  object UniLabel28: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 90
                    Height = 15
                    Hint = ''
                    Caption = 'Email Comercial'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBEdit7: TUniDBEdit
                    Left = 0
                    Top = 18
                    Width = 342
                    Height = 29
                    Hint = '[['#13#10'valid:email notblank |'#13#10']]'
                    DataField = 'EMAIL'
                    DataSource = dsMaster
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
                  TabOrder = 11
                  DesignSize = (
                    200
                    48)
                  object UniLabel18: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 45
                    Height = 15
                    Hint = ''
                    Caption = 'Telefone'
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
                    Hint = '[['#13#10'mask:phone |'#13#10'dial:'#13#10']]'#13#10
                    DataField = 'FONE1'
                    DataSource = dsMaster
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                  end
                  object UniDBEdit8: TUniDBEdit
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
                  object UniLabel29: TUniLabel
                    Left = 94
                    Top = 0
                    Width = 55
                    Height = 15
                    Hint = ''
                    Caption = 'Descri'#231#227'o'
                    Anchors = [akTop, akRight]
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 4
                  end
                end
                object rcBlock100: TUniContainerPanel
                  Tag = 1
                  Left = 10
                  Top = 157
                  Width = 100
                  Height = 48
                  Hint = '[[cols:xs-6 sm-6 md-2 lg-2 xl-2]]'
                  ParentColor = False
                  TabOrder = 12
                  DesignSize = (
                    100
                    48)
                  object UniLabel22: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 20
                    Height = 15
                    Hint = ''
                    Caption = 'Cep'
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
                    Hint = '[['#13'mask:cep '#13']]'
                    DataField = 'CEP'
                    DataSource = dsMaster
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                  end
                end
                object rcBlock270: TUniContainerPanel
                  Tag = 4
                  Left = 77
                  Top = 430
                  Width = 729
                  Height = 22
                  Hint = '[[cols:12 | round:all]]'
                  ParentColor = False
                  TabOrder = 13
                end
                object rcBlock60: TUniContainerPanel
                  Tag = 1
                  Left = 448
                  Top = 8
                  Width = 100
                  Height = 48
                  Hint = '[['#13#10'cols:xs-0 sm-0 md-7 |'#13#10'hide:mobile |'#13#10']]'#13#10
                  ParentColor = False
                  TabOrder = 14
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
      'FROM  empresas tab'
      '')
  end
  object sqlGeneric: TFDQuery
    CachedUpdates = True
    Connection = mm.SQLConn
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    FormatOptions.StrsTrim2Len = True
    SQL.Strings = (
      'SELECT'
      ''
      'tab.* '
      ''
      'FROM  planocontas tab'
      '')
    Left = 925
    Top = 545
  end
  object sqlCadGeral: TFDQuery
    CachedUpdates = True
    Connection = mm.SQLConn
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    FormatOptions.StrsTrim2Len = True
    SQL.Strings = (
      'SELECT'
      ''
      'tab.* '
      ''
      'FROM  planocontas tab'
      '')
    Left = 923
    Top = 597
  end
end
