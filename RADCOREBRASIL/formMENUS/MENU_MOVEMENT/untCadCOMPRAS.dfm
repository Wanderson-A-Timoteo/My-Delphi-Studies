inherited frmCadCOMPRAS: TfrmCadCOMPRAS
  inherited paBaseBackGround: TUniContainerPanel
    inherited pgBaseCadControl: TUniPageControl
      ActivePage = tabRegister
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
            inherited UniScrollBox1: TUniScrollBox
              ScrollHeight = 926
              ScrollWidth = 164
              ScrollY = 226
              inherited paSearchFilterDate: TUniContainerPanel
                Top = 528
                ExplicitTop = 528
              end
              inherited paSearchFilter1: TUniContainerPanel
                Top = 47
                ExplicitTop = 47
              end
              inherited paSearchContent1: TUniContainerPanel
                Top = 167
                ExplicitTop = 167
              end
              inherited paSearchFilter2: TUniContainerPanel
                Top = 287
                ExplicitTop = 287
              end
              inherited paSearchContent2: TUniContainerPanel
                Top = 408
                ExplicitTop = 408
              end
              inherited paSearchFilterAndOr: TUniContainerPanel
                Top = 227
                ExplicitTop = 227
              end
              inherited labTitleSearch: TUniLabel
                Top = -216
                ExplicitTop = -216
              end
              inherited paSearchFilterPeriod: TUniContainerPanel
                Top = 468
                ExplicitTop = 468
              end
              inherited paSearchFilterPeriodSelect: TUniContainerPanel
                Top = 588
                ExplicitTop = 588
              end
              inherited paSearchBtn: TUniContainerPanel
                Top = 664
                ExplicitTop = 664
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
                ScrollHeight = 445
                ScrollWidth = 866
                object UniDBEdit5: TUniDBEdit
                  Left = 835
                  Top = 16
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
                  Left = 20
                  Top = 16
                  Width = 100
                  Height = 48
                  Hint = '[[cols:xs-6 sm-6 md-2]]'
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
                  Left = 131
                  Top = 8
                  Width = 142
                  Height = 48
                  Hint = '[[cols:xs-6 sm-6 md-3]]'
                  ParentColor = False
                  TabOrder = 2
                  DesignSize = (
                    142
                    48)
                  object UniLabel5: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 79
                    Height = 15
                    Hint = ''
                    Caption = 'Data Cadastro'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBDateTimePicker1: TUniDBDateTimePicker
                    Left = 0
                    Top = 19
                    Width = 142
                    Height = 29
                    Hint = ''
                    DataField = 'DTCADASTRO'
                    DataSource = dsMaster
                    DateTime = 43596.000000000000000000
                    DateFormat = 'dd/MM/yyyy'
                    TimeFormat = 'HH:mm:ss'
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                  end
                end
                object rcBlock50: TUniContainerPanel
                  Tag = 1
                  Left = 289
                  Top = 10
                  Width = 256
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-7]]'
                  ParentColor = False
                  TabOrder = 3
                  DesignSize = (
                    256
                    48)
                  object UniLabel12: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 62
                    Height = 15
                    Hint = ''
                    Caption = 'Fornecedor'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object edLkpFORNECEDORES: TUniDBEdit
                    Left = 0
                    Top = 19
                    Width = 255
                    Height = 29
                    Hint = '[[nome CodiForn +]]'
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
                object rcBlock90: TUniContainerPanel
                  Tag = 1
                  Left = 15
                  Top = 127
                  Width = 142
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 4
                  DesignSize = (
                    142
                    48)
                  object UniLabel14: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 26
                    Height = 15
                    Hint = ''
                    Caption = 'Qtde'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object edQtde: TUniDBFormattedNumberEdit
                    Left = 0
                    Top = 19
                    Width = 142
                    Height = 29
                    Hint = ''
                    DataField = 'QTDE'
                    DataSource = dsCOMPRAS_PRODUTOS
                    Alignment = taRightJustify
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                    OnEnter = edQtdeEnter
                  end
                end
                object rcBlock100: TUniContainerPanel
                  Tag = 1
                  Left = 184
                  Top = 132
                  Width = 286
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-4]]'
                  ParentColor = False
                  TabOrder = 5
                  DesignSize = (
                    286
                    48)
                  object UniLabel15: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 44
                    Height = 15
                    Hint = ''
                    Caption = 'Produto'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object edLkpPRODUTOS: TUniDBEdit
                    Left = 0
                    Top = 19
                    Width = 286
                    Height = 29
                    Hint = '[['#13#10'DESCRICAO CodiProd @ ds:dsCOMPRAS_PRODUTOS '#13#10']]'#13#10
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                    Color = clInfoBk
                    ReadOnly = True
                    InputType = 'text'
                    OnClick = edLkpPRODUTOSClick
                    OnExit = edLkpPRODUTOSExit
                  end
                end
                object rcBlock110: TUniContainerPanel
                  Tag = 1
                  Left = 492
                  Top = 132
                  Width = 142
                  Height = 48
                  Hint = '[[cols:xs-6 sm-6 md-2]]'
                  ParentColor = False
                  TabOrder = 6
                  DesignSize = (
                    142
                    48)
                  object UniLabel16: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 29
                    Height = 15
                    Hint = ''
                    Caption = 'Valor'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit
                    Left = 0
                    Top = 19
                    Width = 142
                    Height = 29
                    Hint = ''
                    DataField = 'VALORUNIT'
                    DataSource = dsCOMPRAS_PRODUTOS
                    Alignment = taRightJustify
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                end
                object rcBlock120: TUniContainerPanel
                  Tag = 1
                  Left = 640
                  Top = 134
                  Width = 142
                  Height = 48
                  Hint = '[[cols:xs-6 sm-6 md-2]]'
                  ParentColor = False
                  TabOrder = 7
                  DesignSize = (
                    142
                    48)
                  object UniLabel17: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 27
                    Height = 15
                    Hint = ''
                    Caption = 'Total'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit
                    Left = 0
                    Top = 19
                    Width = 142
                    Height = 29
                    Hint = ''
                    Enabled = False
                    DataField = 'TOTALPROD'
                    DataSource = dsCOMPRAS_PRODUTOS
                    Alignment = taRightJustify
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                end
                object rcBlock70: TUniContainerPanel
                  Tag = 4
                  Left = 15
                  Top = 82
                  Width = 317
                  Height = 31
                  Hint = '[[cols:12 | round:all]]'
                  ParentColor = False
                  TabOrder = 8
                  object UniLabel18: TUniLabel
                    AlignWithMargins = True
                    Left = 0
                    Top = 5
                    Width = 251
                    Height = 19
                    Hint = '[[cols:12 | round:all]]'
                    Margins.Left = 6
                    Margins.Top = 6
                    Margins.Right = 6
                    Margins.Bottom = 6
                    AutoSize = False
                    Caption = 'PRODUTOS'
                    ParentFont = False
                    Font.Color = clGray
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                end
                object rcBlock130: TUniContainerPanel
                  Tag = 1
                  Left = 796
                  Top = 129
                  Width = 70
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 9
                  object btnOk: TUniBitBtn
                    AlignWithMargins = True
                    Left = 1
                    Top = 18
                    Width = 32
                    Height = 29
                    Hint = '[[cls:ButtonThemeCrud | ico:fas-check 1x]]'
                    Margins.Left = 7
                    Margins.Top = 0
                    Margins.Right = 0
                    Caption = 'V'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    Font.Style = [fsBold]
                    TabOrder = 1
                    ScaleButton = False
                    OnClick = btnOkClick
                  end
                  object btnDel: TUniBitBtn
                    AlignWithMargins = True
                    Left = 35
                    Top = 18
                    Width = 32
                    Height = 29
                    Hint = '[[cls:ButtonThemeCrud | ico:fas-trash-alt ]]'
                    Margins.Left = 2
                    Margins.Top = 0
                    Caption = 'X'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    Font.Style = [fsBold]
                    TabOrder = 2
                    ScaleButton = False
                    OnClick = btnDelClick
                  end
                end
                object rcBlock460: TUniContainerPanel
                  Left = 12
                  Top = 199
                  Width = 707
                  Height = 246
                  Hint = 
                    '[['#13#10'cols:xs-12 sm-12 md-12 | '#13#10'round:no | '#13#10'cls:card-info-box-wh' +
                    'ite|'#13#10'scale:parent h:100%-top off:5 |'#13#10'min-height:200 mobile-220' +
                    '| '#13#10']]'#13#10#13#10#13#10#13#10#13#10#13#10
                  ParentColor = False
                  TabOrder = 10
                  DesignSize = (
                    707
                    246)
                  object dbgProdutos: TUniDBGrid
                    Left = -1
                    Top = -1
                    Width = 709
                    Height = 248
                    Hint = ''
                    HeaderTitle = #205'TENS COMPRADOS'
                    HeaderTitleAlign = taCenter
                    TitleFont.Style = [fsBold]
                    DataSource = dsCOMPRAS_PRODUTOS
                    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgTitleClick, dgAutoRefreshRow]
                    WebOptions.Paged = False
                    LoadMask.Message = 'Loading data...'
                    BorderStyle = ubsNone
                    Anchors = [akLeft, akTop, akRight, akBottom]
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    ParentFont = False
                    TabOrder = 1
                    Summary.Align = taBottom
                    Summary.Enabled = True
                    TabKeyBehavior = tkNextComponent
                    OnTitleClick = dbgProdutosTitleClick
                    OnDrawColumnCell = dbgProdutosDrawColumnCell
                    OnColumnSummary = dbgProdutosColumnSummary
                    OnColumnSummaryResult = dbgProdutosColumnSummaryResult
                    Columns = <
                      item
                        FieldName = 'CODIPROD'
                        Title.Caption = 'CODIPROD'
                        Width = 64
                        Font.Name = 'Calibri'
                      end
                      item
                        FieldName = 'PRODUTO'
                        Title.Caption = 'PRODUTO'
                        Width = 64
                        Font.Name = 'Calibri'
                      end
                      item
                        FieldName = 'VALORUNIT'
                        Title.Caption = 'V.UNIT'#193'RIO'
                        Width = 154
                        Font.Color = clBlack
                        Font.Name = 'Calibri'
                      end
                      item
                        FieldName = 'QTDE'
                        Title.Caption = 'QTDE'
                        Width = 136
                        Font.Color = clBlack
                        Font.Name = 'Calibri'
                        ShowSummary = True
                      end
                      item
                        FieldName = 'TOTALPROD'
                        Title.Caption = 'TOTAL'
                        Title.Font.Style = [fsBold]
                        Width = 64
                        Font.Name = 'Calibri'
                        ShowSummary = True
                      end>
                  end
                  object paNotFound_dbgProdutos: TUniContainerPanel
                    Left = 375
                    Top = -160
                    Width = 300
                    Height = 330
                    Hint = 
                      '[['#13#10'center:dbgProdutos xy |'#13#10'state-visible:empty-true ds:dsCOMPR' +
                      'AS_PRODUTOS|'#13#10']]'#13#10
                    ParentColor = False
                    TabOrder = 2
                    DesignSize = (
                      300
                      330)
                    object UniLabel1: TUniLabel
                      Left = 0
                      Top = 0
                      Width = 300
                      Height = 300
                      Hint = '[['#13#10'center:parent xy'#13#10']]'#13#10
                      TextConversion = txtHTML
                      AutoSize = False
                      Caption = 
                        '<img id="norecimg" class="" src="files/images/not-found.jpg" alt' +
                        '="NoRec Img">'
                      ParentFont = False
                      Font.Height = -27
                      Font.Name = 'Calibri'
                      Font.Style = [fsBold]
                      TabOrder = 1
                    end
                    object UniLabel2: TUniLabel
                      Left = 10
                      Top = 290
                      Width = 281
                      Height = 37
                      Hint = ''
                      Alignment = taCenter
                      TextConversion = txtHTML
                      AutoSize = False
                      Caption = 'No Records Found'
                      Anchors = [akLeft, akRight, akBottom]
                      ParentFont = False
                      Font.Color = clGray
                      Font.Height = -19
                      TabOrder = 2
                    end
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
  inherited dsMaster: TDataSource
    Left = 942
  end
  inherited sqlSearchMaster: TFDQuery
    Left = 925
    Top = 447
  end
  inherited sqlMaster: TFDQuery
    AfterOpen = sqlMasterAfterOpen
    SQL.Strings = (
      'SELECT'
      ''
      'tab.* '
      ''
      'FROM  compras tab'
      '')
    Left = 941
  end
  inherited FDSchemaAdapter1: TFDSchemaAdapter
    Left = 916
    Top = 548
  end
  object dsMemTipoOS: TDataSource
    DataSet = memTipoOS
    Left = 758
    Top = 434
  end
  object memTipoOS: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 756
    Top = 393
  end
  object COMPRAS_PRODUTOS: TFDQuery
    AfterOpen = COMPRAS_PRODUTOSAfterOpen
    BeforePost = COMPRAS_PRODUTOSBeforePost
    CachedUpdates = True
    MasterSource = dsMaster
    MasterFields = 'CODIGO'
    DetailFields = 'CODIGO'
    Connection = mm.SQLConn
    SchemaAdapter = FDSchemaAdapter1
    FetchOptions.AssignedValues = [evDetailCascade]
    FetchOptions.DetailCascade = True
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    FormatOptions.StrsTrim2Len = True
    OnError = COMPRAS_PRODUTOSError
    SQL.Strings = (
      'select'
      ''
      '  cp.codiemp , cp.codicompra, '
      '  cp.data, cp.codiprod, p.descricao as produto, '
      '  cp.qtde, cp.valorunit, cp.totalprod'
      ''
      'from compras_produtos cp'
      ''
      'left join produtos p on p.codigo = cp.codiprod'
      ''
      'where cp.codicompra = :codicompra')
    Left = 765
    Top = 489
    ParamData = <
      item
        Name = 'CODICOMPRA'
        ParamType = ptInput
      end>
  end
  object dsCOMPRAS_PRODUTOS: TDataSource
    DataSet = COMPRAS_PRODUTOS
    OnStateChange = dsCOMPRAS_PRODUTOSStateChange
    Left = 760
    Top = 535
  end
end
