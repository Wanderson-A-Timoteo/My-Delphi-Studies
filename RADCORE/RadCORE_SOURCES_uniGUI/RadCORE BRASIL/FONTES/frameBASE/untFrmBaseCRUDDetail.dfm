object frmBaseCRUDDetail: TfrmBaseCRUDDetail
  Left = 0
  Top = 0
  Hint = '[['#13#10'modal:'#13#10']]'
  ClientHeight = 650
  ClientWidth = 960
  Caption = 'Cadastro...'
  OnShow = UniFormShow
  BorderStyle = bsNone
  OldCreateOrder = False
  OnKeyDown = UniFormKeyDown
  KeyPreview = True
  NavigateKeys.Enabled = True
  NavigateKeys.Next.Key = 13
  MonitoredKeys.Keys = <>
  AlignmentControl = uniAlignmentClient
  Font.Height = -13
  Font.Name = 'Calibri'
  LayoutConfig.BodyPadding = '0'
  OnReady = UniFormReady
  OnBeforeShow = UniFormBeforeShow
  OnCreate = UniFormCreate
  OnDestroy = UniFormDestroy
  PixelsPerInch = 96
  TextHeight = 15
  object uniScrollBox1: TUniScrollBox
    Left = 0
    Top = 0
    Width = 960
    Height = 650
    Hint = ''
    Margins.Left = 20
    Margins.Top = 20
    Margins.Right = 20
    Margins.Bottom = 10
    Align = alClient
    TabOrder = 0
    object paTitleRegDetail: TUniContainerPanel
      Left = 0
      Top = 0
      Width = 958
      Height = 0
      Hint = ''
      Margins.Top = 0
      Margins.Bottom = 0
      ParentColor = False
      Align = alTop
      TabOrder = 0
    end
    object paBaseBackGround: TUniContainerPanel
      Left = 0
      Top = 0
      Width = 958
      Height = 648
      Hint = '[[round:all]]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 15
      ParentColor = False
      Align = alClient
      AutoScroll = True
      TabOrder = 1
      ScrollHeight = 648
      ScrollWidth = 958
      object paBaseTop: TUniContainerPanel
        AlignWithMargins = True
        Left = 0
        Top = 0
        Width = 958
        Height = 90
        Hint = ''
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 10
        ParentColor = False
        Color = clWhite
        Align = alTop
        TabOrder = 1
        object paBaseTopTitle: TUniContainerPanel
          Left = 0
          Top = 0
          Width = 958
          Height = 90
          Hint = '[[round:t | cls:card-light]]'
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 2
          ParentColor = False
          Align = alClient
          TabOrder = 1
          DesignSize = (
            958
            90)
          object labTitleFrm: TUniLabel
            Left = 46
            Top = 10
            Width = 37
            Height = 26
            Hint = ''
            Margins.Left = 6
            Margins.Top = 6
            Margins.Bottom = 0
            TextConversion = txtHTML
            Caption = 'Title'
            ParentFont = False
            Font.Color = clGray
            Font.Height = -21
            Font.Name = 'Calibri Light'
            ParentColor = False
            Color = clSilver
            TabOrder = 1
          end
          object labState: TUniLabel
            Left = 796
            Top = 15
            Width = 150
            Height = 20
            Hint = '[[hide:mobile-v]]'
            Margins.Left = 8
            Margins.Top = 12
            Margins.Right = 12
            Margins.Bottom = 6
            Alignment = taRightJustify
            TextConversion = txtHTML
            AutoSize = False
            Caption = '[ browsing ]'
            Anchors = [akTop, akRight]
            ParentFont = False
            Font.Color = clGray
            Font.Name = 'Calibri'
            ParentColor = False
            Color = clWhite
            TabOrder = 2
          end
          object labExit: TUniLabel
            Left = 8
            Top = 8
            Width = 33
            Height = 26
            Cursor = crHandPoint
            Hint = '[['#13#10'ico:fas-sign-out-alt rc-mirror-h'#13#10']]'
            Margins.Left = 8
            Margins.Top = 8
            Margins.Right = 0
            Margins.Bottom = 4
            Alignment = taCenter
            TextConversion = txtHTML
            AutoSize = False
            Caption = '<'
            ParentFont = False
            Font.Color = clBlack
            Font.Height = -21
            Font.Name = 'Calibri Light'
            ParentColor = False
            Color = clSilver
            TabOrder = 3
            OnClick = btnCloseFormClick
          end
          object labOptions: TUniLabel
            Left = 911
            Top = 48
            Width = 33
            Height = 26
            Cursor = crHandPoint
            Hint = '[[ico:fas-bars]]'
            Margins.Left = 8
            Margins.Top = 8
            Margins.Right = 0
            Margins.Bottom = 4
            Alignment = taCenter
            TextConversion = txtHTML
            AutoSize = False
            Caption = '='
            Anchors = [akTop, akRight]
            ParentFont = False
            Font.Color = clBlack
            Font.Height = -21
            Font.Name = 'Calibri Light'
            ParentColor = False
            Color = clSilver
            TabOrder = 4
          end
          object labCancel: TUniLabel
            Left = 925
            Top = 48
            Width = 33
            Height = 26
            Cursor = crHandPoint
            Hint = '[[ico:fas-times]]'
            Margins.Left = 8
            Margins.Top = 8
            Margins.Right = 0
            Margins.Bottom = 4
            Alignment = taCenter
            TextConversion = txtHTML
            AutoSize = False
            Caption = 'X'
            Anchors = [akTop, akRight]
            ParentFont = False
            Font.Color = clBlack
            Font.Height = -21
            Font.Name = 'Calibri Light'
            ParentColor = False
            Color = clSilver
            TabOrder = 5
            OnClick = btnCancelRegClick
          end
          object labSave: TUniLabel
            Left = 925
            Top = 48
            Width = 33
            Height = 26
            Cursor = crHandPoint
            Hint = '[[ico:fas-check]]'
            Margins.Left = 8
            Margins.Top = 8
            Margins.Right = 0
            Margins.Bottom = 4
            Alignment = taCenter
            TextConversion = txtHTML
            AutoSize = False
            Caption = 'V'
            Anchors = [akTop, akRight]
            ParentFont = False
            Font.Color = clBlack
            Font.Height = -21
            Font.Name = 'Calibri Light'
            ParentColor = False
            Color = clSilver
            TabOrder = 6
            OnClick = btnSaveRegClick
          end
          object edQuickSearch: TUniEdit
            AlignWithMargins = True
            Left = 11
            Top = 48
            Width = 151
            Height = 29
            Hint = 
              '[['#13#10'cls:rc-edit-no-border-right rc-clear-btn-no-border-right'#13#10']]' +
              #13#10
            Margins.Right = 5
            Visible = False
            CharCase = ecUpperCase
            Text = ''
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 7
            TabStop = False
            EmptyText = 'Pesquisar por...'
            ClearButton = True
          end
          object labEdit: TUniLabel
            Left = 925
            Top = 48
            Width = 33
            Height = 26
            Cursor = crHandPoint
            Hint = '[[ico:fas-pencil-alt]]'
            Margins.Left = 8
            Margins.Top = 8
            Margins.Right = 0
            Margins.Bottom = 4
            Alignment = taCenter
            TextConversion = txtHTML
            AutoSize = False
            Caption = '!'
            Anchors = [akTop, akRight]
            ParentFont = False
            Font.Color = clBlack
            Font.Height = -21
            Font.Name = 'Calibri Light'
            ParentColor = False
            Color = clSilver
            TabOrder = 8
            OnClick = btnEditRegClick
          end
          object labDelete: TUniLabel
            Left = 925
            Top = 48
            Width = 33
            Height = 26
            Cursor = crHandPoint
            Hint = '[['#13#10'ico:fas-trash-alt'#13#10']]'
            Margins.Left = 8
            Margins.Top = 8
            Margins.Right = 0
            Margins.Bottom = 4
            Alignment = taCenter
            TextConversion = txtHTML
            AutoSize = False
            Caption = '#'
            Anchors = [akTop, akRight]
            ParentFont = False
            Font.Color = clBlack
            Font.Height = -21
            Font.Name = 'Calibri Light'
            ParentColor = False
            Color = clSilver
            TabOrder = 9
            OnClick = btnDeleteRegClick
          end
          object btnQuickSearch: TUniBitBtn
            AlignWithMargins = True
            Left = 160
            Top = 48
            Width = 29
            Height = 29
            Hint = '[[cls:ButtonThemeCrud-no-border-left |ico:fas-search |]]'
            Margins.Left = 6
            Margins.Top = 4
            Margins.Right = 6
            Margins.Bottom = 4
            Visible = False
            Caption = '@'
            ParentFont = False
            Font.Height = -16
            Font.Name = 'Calibri'
            TabOrder = 10
          end
          object labNew: TUniLabel
            Left = 925
            Top = 48
            Width = 33
            Height = 26
            Cursor = crHandPoint
            Hint = '[[ico:fas-plus]]'
            Margins.Left = 8
            Margins.Top = 8
            Margins.Right = 0
            Margins.Bottom = 4
            Alignment = taCenter
            TextConversion = txtHTML
            AutoSize = False
            Caption = '+'
            Anchors = [akTop, akRight]
            ParentFont = False
            Font.Color = clBlack
            Font.Height = -21
            Font.Name = 'Calibri Light'
            ParentColor = False
            Color = clSilver
            TabOrder = 11
            OnClick = btnNewRegClick
          end
          object ed_Table_Deleted_Field: TUniEdit
            Left = 767
            Top = -11
            Width = 15
            Hint = ''
            Visible = False
            Text = ''
            TabOrder = 12
          end
        end
      end
      object pgBaseCadControl: TUniPageControl
        AlignWithMargins = True
        Left = 46
        Top = 100
        Width = 904
        Height = 493
        Hint = '[['#13#10'modal:'#13#10']]'#13#10
        Margins.Left = 4
        Margins.Top = 0
        Margins.Right = 8
        Margins.Bottom = 0
        ActivePage = tabSearchDetail
        TabBarVisible = False
        Align = alClient
        TabOrder = 2
        OnChangeValue = pgBaseCadControlChangeValue
        object tabSearchDetail: TUniTabSheet
          Hint = ''
          Caption = 'Registros'
          object UniScrollBox2: TUniScrollBox
            Left = 0
            Top = 0
            Width = 896
            Height = 465
            Hint = ''
            Align = alClient
            TabOrder = 0
            ScrollHeight = 402
            ScrollWidth = 597
            object dbgSearchCRUD: TUniDBGrid
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 888
              Height = 457
              Hint = ''
              TitleFont.Name = 'Calibri'
              DataSource = dsSearchMaster
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
              WebOptions.FetchAll = True
              LoadMask.WaitData = True
              LoadMask.Message = 'Loading data...'
              BorderStyle = ubsNone
              Align = alClient
              Font.Height = -13
              Font.Name = 'Calibri'
              ParentFont = False
              TabOrder = 0
              TabKeyBehavior = tkNextComponent
              OnColumnSort = dbgSearchCRUDColumnSort
              OnDblClick = dbgSearchCRUDDblClick
              OnDrawColumnCell = dbgSearchCRUDDrawColumnCell
            end
            object paNotFound_dbgSearchCRUD: TUniContainerPanel
              Left = 297
              Top = 72
              Width = 300
              Height = 330
              Hint = 
                '[['#13#10'center:dbgSearchCRUD xy |'#13#10'state-visible:empty-true ds:dsSea' +
                'rchMaster|'#13#10']]'#13#10
              ParentColor = False
              TabOrder = 1
              DesignSize = (
                300
                330)
              object imgNoRecords_dbgSearchCRUD: TUniLabel
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
              object labNotFound_dbgSearchCRUD: TUniLabel
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
        object tabRegisterDetail: TUniTabSheet
          Hint = ''
          Caption = 'Cadastro'
          Font.Height = -13
          Font.Name = 'Calibri'
          ParentFont = False
          object paBaseCrudDetail: TUniContainerPanel
            Left = 0
            Top = 0
            Width = 896
            Height = 465
            Hint = ''
            ParentColor = False
            Align = alClient
            TabOrder = 0
            object paDataDetail: TUniPanel
              Left = 0
              Top = 0
              Width = 896
              Height = 465
              Hint = ''
              Margins.Right = 0
              Align = alClient
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 1
              BorderStyle = ubsNone
              Title = 'Filtros da Pesquisa'
              Caption = ''
              CollapseDirection = cdLeft
              object sboxGridBlockTab1: TUniScrollBox
                AlignWithMargins = True
                Left = 0
                Top = 3
                Width = 896
                Height = 459
                Hint = ''
                Margins.Left = 0
                Margins.Right = 0
                Align = alClient
                Color = clWhite
                TabOrder = 1
              end
            end
          end
        end
      end
      object paTotalizerDetail: TUniContainerPanel
        AlignWithMargins = True
        Left = 4
        Top = 593
        Width = 950
        Height = 51
        Hint = ''
        Margins.Left = 4
        Margins.Top = 0
        Margins.Right = 4
        Margins.Bottom = 4
        Visible = False
        ParentColor = False
        Align = alBottom
        TabOrder = 3
      end
      object paBaseButtons: TUniContainerPanel
        AlignWithMargins = True
        Left = 5
        Top = 105
        Width = 37
        Height = 485
        Hint = ''
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 0
        ParentColor = False
        Color = clWhite
        Align = alLeft
        AutoScroll = True
        TabOrder = 4
        ScrollHeight = 485
        ScrollWidth = 37
        object paOF: TUniContainerPanel
          AlignWithMargins = True
          Left = 0
          Top = 282
          Width = 37
          Height = 89
          Hint = ''
          Margins.Left = 12
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          ParentColor = False
          TabOrder = 1
          object btnCloseForm: TUniBitBtn
            AlignWithMargins = True
            Left = 2
            Top = 56
            Width = 33
            Height = 32
            Hint = 
              '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-sign-out-alt rc-mirror-h | '#13#10'cls' +
              '-ico:font-black'#13#10']]'
            Margins.Left = 2
            Margins.Top = 20
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = '<'
            ParentFont = False
            Font.Height = -19
            Font.Name = 'Calibri'
            TabOrder = 1
            ScaleButton = False
            OnClick = btnCloseFormClick
          end
          object btnOptions: TUniBitBtn
            AlignWithMargins = True
            Left = 2
            Top = 2
            Width = 33
            Height = 32
            Hint = '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-bars | '#13#10'cls-ico:font-black'#13#10']]'
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = '='
            ParentFont = False
            Font.Height = -19
            Font.Name = 'Calibri'
            TabOrder = 2
            ScaleButton = False
            OnClick = btnOptionsClick
          end
        end
        object paP: TUniContainerPanel
          Left = 0
          Top = 2
          Width = 37
          Height = 37
          Hint = ''
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          ParentColor = False
          TabOrder = 2
          object btnSearch: TUniBitBtn
            AlignWithMargins = True
            Left = 2
            Top = 2
            Width = 33
            Height = 32
            Hint = 
              '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-search | '#13#10'cls-ico:font-black |'#13#10 +
              'hint:show / hide search dialog t:search w:200 d:10000 c:info-lig' +
              'ht'#13#10']]'#13#10
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = '@'
            ParentFont = False
            Font.Height = -19
            Font.Name = 'Calibri'
            TabOrder = 1
            ScaleButton = False
          end
        end
        object paNAE: TUniContainerPanel
          AlignWithMargins = True
          Left = 0
          Top = 59
          Width = 37
          Height = 110
          Hint = ''
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          ParentColor = False
          TabOrder = 3
          object btnNewReg: TUniBitBtn
            AlignWithMargins = True
            Left = 2
            Top = 2
            Width = 33
            Height = 32
            Hint = '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-plus | '#13#10'cls-ico:font-black'#13#10']]'
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = '+'
            ParentFont = False
            Font.Height = -19
            Font.Name = 'Calibri'
            TabOrder = 1
            ScaleButton = False
            OnClick = btnNewRegClick
          end
          object btnEditReg: TUniBitBtn
            AlignWithMargins = True
            Left = 2
            Top = 38
            Width = 33
            Height = 32
            Hint = 
              '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-pencil-alt | '#13#10'cls-ico:font-black' +
              #13#10']]'
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = '!'
            ParentFont = False
            Font.Height = -19
            Font.Name = 'Calibri'
            TabOrder = 2
            ScaleButton = False
            OnClick = btnEditRegClick
          end
          object btnDeleteReg: TUniBitBtn
            AlignWithMargins = True
            Left = 2
            Top = 74
            Width = 33
            Height = 32
            Hint = 
              '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-trash-alt | '#13#10'cls-ico:font-black' +
              #13#10']]'
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = '#'
            ParentFont = False
            Font.Height = -19
            Font.Name = 'Calibri'
            TabOrder = 3
            ScaleButton = False
            OnClick = btnDeleteRegClick
          end
        end
        object paGC: TUniContainerPanel
          AlignWithMargins = True
          Left = 0
          Top = 189
          Width = 37
          Height = 73
          Hint = ''
          Margins.Left = 14
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          ParentColor = False
          TabOrder = 4
          object btnSaveReg: TUniBitBtn
            AlignWithMargins = True
            Left = 2
            Top = 2
            Width = 33
            Height = 32
            Hint = '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-check | '#13#10'cls-ico:font-black'#13#10']]'
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'V'
            ParentFont = False
            Font.Height = -19
            Font.Name = 'Calibri'
            TabOrder = 1
            ScaleButton = False
            OnClick = btnSaveRegClick
          end
          object btnCancelReg: TUniBitBtn
            AlignWithMargins = True
            Left = 2
            Top = 38
            Width = 33
            Height = 32
            Hint = '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-times | '#13#10'cls-ico:font-black'#13#10']]'
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'X'
            ParentFont = False
            Font.Height = -19
            Font.Name = 'Calibri'
            TabOrder = 2
            ScaleButton = False
            OnClick = btnCancelRegClick
          end
        end
      end
    end
  end
  object ed_OldPKValue: TUniEdit
    Left = 689
    Top = -12
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 1
  end
  object ed_Table_Status_OLD: TUniEdit
    Left = 670
    Top = -12
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 2
  end
  object ed_FieldMasks: TUniEdit
    Left = 648
    Top = -12
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 3
  end
  object ed_PK: TUniEdit
    Left = 627
    Top = -12
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 4
  end
  object ed_CodMaster: TUniEdit
    Left = 607
    Top = -12
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 5
  end
  object ed_Where_Search: TUniEdit
    Left = 587
    Top = -12
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 6
  end
  object ed_Order_Search: TUniEdit
    Left = 567
    Top = -12
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 7
  end
  object ed_Table_Status: TUniEdit
    Left = 546
    Top = -12
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 8
  end
  object ed_FormOrigin_Tab: TUniEdit
    Left = 525
    Top = -12
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 9
  end
  object ed_FormOrigin: TUniEdit
    Left = 505
    Top = -12
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 10
  end
  object ed_Table_ItemSel: TUniEdit
    Left = 485
    Top = -12
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 11
  end
  object ed_AskNewRec_AfterPost: TUniEdit
    Left = 727
    Top = -10
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 12
  end
  object ed_GenNextID_OnNew: TUniEdit
    Left = 710
    Top = -10
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 13
  end
  object dbgExport: TUniDBGrid
    Left = 750
    Top = -10
    Width = 15
    Height = 22
    Hint = ''
    DataSource = dsSearchMaster
    WebOptions.Paged = False
    WebOptions.PageSize = 10000
    WebOptions.FetchAll = True
    LoadMask.ShowMessage = False
    LoadMask.Message = 'Loading data...'
    TabOrder = 14
    Exporter.Enabled = True
  end
  object sqlMaster: TFDQuery
    CachedUpdates = True
    Connection = mm.SQLConn
    FetchOptions.AssignedValues = [evMode, evRecordCountMode]
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    OnError = sqlMasterError
    Left = 907
    Top = 349
  end
  object dsMaster: TDataSource
    AutoEdit = False
    DataSet = sqlMaster
    OnStateChange = dsMasterStateChange
    OnDataChange = dsMasterDataChange
    Left = 904
    Top = 399
  end
  object sqlSearchMaster: TFDQuery
    CachedUpdates = True
    Connection = mm.SQLConn
    FetchOptions.AssignedValues = [evMode, evItems, evRowsetSize, evRecordCountMode]
    FetchOptions.RowsetSize = 25
    FetchOptions.RecordCountMode = cmTotal
    FetchOptions.Items = [fiDetails]
    FormatOptions.AssignedValues = [fvFmtDisplayDateTime, fvFmtDisplayDate, fvFmtDisplayNumeric, fvStrsTrim2Len]
    OnError = sqlSearchMasterError
    SQL.Strings = (
      '')
    Left = 907
    Top = 449
  end
  object dsSearchMaster: TDataSource
    AutoEdit = False
    DataSet = sqlSearchMaster
    OnStateChange = dsSearchMasterStateChange
    Left = 908
    Top = 495
  end
  object popMenuOptions: TUniPopupMenu
    Left = 906
    Top = 158
    object ExportarDados1: TUniMenuItem
      Caption = 'Exportar Dados'
      object Excel1: TUniMenuItem
        Caption = 'Excel'
        OnClick = Excel1Click
      end
      object Html1: TUniMenuItem
        Caption = 'Html'
        OnClick = Html1Click
      end
      object Xml1: TUniMenuItem
        Caption = 'Xml'
        OnClick = Xml1Click
      end
      object Xml2: TUniMenuItem
        Caption = 'Csv'
        OnClick = Xml2Click
      end
    end
  end
  object mem_MASTER: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 906
    Top = 222
  end
  object ds_memMASTER: TDataSource
    AutoEdit = False
    DataSet = mem_MASTER
    OnStateChange = dsMasterStateChange
    Left = 904
    Top = 267
  end
  object timerClose: TUniTimer
    Interval = 150
    Enabled = False
    ClientEvent.Strings = (
      'function(sender)'
      '{'
      ' '
      '}')
    OnTimer = timerCloseTimer
    Left = 919
    Top = 39
  end
end
