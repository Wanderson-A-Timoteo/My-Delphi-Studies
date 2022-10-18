inherited frmCadFUNCIONARIOS: TfrmCadFUNCIONARIOS
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
              DesignSize = (
                306
                482)
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
            Margins.Left = 10
            Margins.Top = 10
            Margins.Right = 10
            Margins.Bottom = 10
            ActivePage = tabGeral
            Align = alClient
            TabOrder = 1
            ExplicitLeft = 10
            ExplicitTop = 178
            ExplicitWidth = 992
            ExplicitHeight = 394
            object tabGeral: TUniTabSheet
              Hint = ''
              Caption = 'Geral'
              object sboxTab1: TUniScrollBox
                Left = 0
                Top = 0
                Width = 937
                Height = 480
                Hint = ''
                Align = alClient
                TabOrder = 0
                ExplicitWidth = 919
                ExplicitHeight = 454
                ScrollHeight = 327
                ScrollWidth = 671
                object UniDBEdit9: TUniDBEdit
                  Left = 899
                  Top = 3
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
                  TabOrder = 0
                  ReadOnly = True
                  InputType = 'search'
                end
                object rcBlock10: TUniContainerPanel
                  Tag = 1
                  Left = 11
                  Top = 10
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
                  object UniLabel1: TUniLabel
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
                object rcBlock30: TUniContainerPanel
                  Tag = 1
                  Left = 247
                  Top = 7
                  Width = 376
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-8]]'
                  ParentColor = False
                  TabOrder = 2
                  DesignSize = (
                    376
                    48)
                  object UniLabel3: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 34
                    Height = 15
                    Hint = ''
                    Caption = 'Nome '
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
                    DataField = 'NOME'
                    DataSource = dsMaster
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                  end
                end
                object rcBlock40: TUniContainerPanel
                  Tag = 1
                  Left = 15
                  Top = 91
                  Width = 135
                  Height = 72
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 3
                  object UniLabel6: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 38
                    Height = 13
                    Hint = ''
                    Caption = 'STATUS'
                    ParentFont = False
                    TabOrder = 1
                  end
                  object UniDBCheckBox1: TUniDBCheckBox
                    Left = 0
                    Top = 19
                    Width = 120
                    Height = 17
                    Hint = ''
                    DataField = 'ATIVO'
                    DataSource = dsMaster
                    ValueChecked = 'S'
                    ValueUnchecked = 'N'
                    Caption = 'Ativo'
                    TabOrder = 2
                    ParentColor = False
                    Color = clBtnFace
                  end
                  object chkTipoFunc: TUniDBCheckBox
                    Left = 0
                    Top = 39
                    Width = 120
                    Height = 17
                    Hint = ''
                    DataField = 'VENDEDOR'
                    DataSource = dsMaster
                    ValueChecked = 'S'
                    ValueUnchecked = 'N'
                    Caption = 'Vendedor'
                    TabOrder = 3
                    ParentColor = False
                    Color = clBtnFace
                  end
                end
                object rcBlock20: TUniContainerPanel
                  Tag = 1
                  Left = 131
                  Top = 8
                  Width = 101
                  Height = 48
                  Hint = '[[cols:xs-6 sm-6 md-2 lg-2 xl-2]]'
                  ParentColor = False
                  TabOrder = 4
                  DesignSize = (
                    101
                    48)
                  object UniLabel4: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 48
                    Height = 15
                    Hint = ''
                    Caption = 'Situa'#231#227'o'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object edTipoOS: TUniDBLookupComboBox
                    Left = 0
                    Top = 18
                    Width = 100
                    Height = 29
                    Hint = ''
                    ListField = 'Descricao'
                    ListSource = dsMemSituacao
                    KeyField = 'codigo'
                    ListFieldIndex = 0
                    DataField = 'TIPO'
                    DataSource = dsMaster
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                    Color = clWindow
                  end
                end
                object rcBlock50: TUniContainerPanel
                  Tag = 1
                  Left = 22
                  Top = 279
                  Width = 255
                  Height = 48
                  Hint = '[[cols:xs-6 sm-6 md-2 lg-2 xl-2]]'
                  ParentColor = False
                  TabOrder = 5
                  DesignSize = (
                    255
                    48)
                  object UniLabel2: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 107
                    Height = 15
                    Hint = ''
                    Caption = 'STATE( only search )'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object edLkpUFS: TUniDBEdit
                    Left = 0
                    Top = 18
                    Width = 255
                    Height = 29
                    Hint = '[['#13#10'DESCRICAO lkponlysearch ! |'#13#10'valid:blank=Status'#13#10']]'#13#10#13#10
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                    Color = clInfoBk
                    ReadOnly = True
                    InputType = 'text'
                    OnEnter = edLkpUFSEnter
                  end
                end
                object rcBlock55: TUniContainerPanel
                  Tag = 1
                  Left = 293
                  Top = 275
                  Width = 120
                  Height = 48
                  Hint = '[['#13#10'cols:xs-12 sm-12 md-4'#13#10']]'
                  ParentColor = False
                  TabOrder = 6
                  DesignSize = (
                    120
                    48)
                  object UniLabel5: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 57
                    Height = 14
                    Hint = ''
                    Caption = 'Get Result'
                    ParentFont = False
                    Font.Height = -12
                    TabOrder = 1
                  end
                  object ed_lkp_teste: TUniEdit
                    Left = 0
                    Top = 19
                    Width = 118
                    Height = 29
                    Hint = ''
                    Text = ''
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                  end
                end
                object rcBlock45: TUniContainerPanel
                  Tag = 4
                  Left = 9
                  Top = 227
                  Width = 662
                  Height = 23
                  Hint = '[['#13#10'cols:12 | '#13#10'border:b color-silver-light'#13#10']]'
                  ParentColor = False
                  TabOrder = 7
                  object UniLabel56Clone: TUniLabel
                    Left = 6
                    Top = 2
                    Width = 168
                    Height = 15
                    Hint = ''
                    Caption = 'Lookup Sample - ONLY SEARCH'
                    ParentFont = False
                    Font.Color = clSilver
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    Font.Style = [fsBold]
                    TabOrder = 1
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
      'SELECT'
      ''
      'tab.* '
      ''
      'FROM  FUNCIONARIOS tab'
      '')
  end
  object memSituacao: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 786
    Top = 447
  end
  object dsMemSituacao: TDataSource
    DataSet = memSituacao
    Left = 786
    Top = 488
  end
end
