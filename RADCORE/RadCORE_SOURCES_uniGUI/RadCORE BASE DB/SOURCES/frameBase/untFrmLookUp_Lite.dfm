object frmLookUp_Lite: TfrmLookUp_Lite
  Left = 0
  Top = 0
  Hint = '[['#13#10'modal: |'#13#10'width:340 fix |'#13#10'height:350 fix'#13#10']]'#13#10
  ClientHeight = 350
  ClientWidth = 326
  Caption = 'Pesquisa Din'#226'mica'
  Color = clWhite
  OnShow = UniFormShow
  BorderStyle = bsNone
  OldCreateOrder = False
  OnKeyDown = UniFormKeyDown
  KeyPreview = True
  MonitoredKeys.Keys = <>
  AlignmentControl = uniAlignmentClient
  ScreenMask.Target = Owner
  ScreenMask.Color = clGray
  OnReady = UniFormReady
  OnBeforeShow = UniFormBeforeShow
  OnCreate = UniFormCreate
  OnDestroy = UniFormDestroy
  OnScreenResize = UniFormScreenResize
  PixelsPerInch = 96
  TextHeight = 13
  object paBackground: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 326
    Height = 350
    Hint = ''
    Margins.Left = 1
    Margins.Top = 1
    Margins.Right = 1
    Margins.Bottom = 1
    ParentColor = False
    Color = clWhite
    Align = alClient
    TabOrder = 0
    object paPesquisa: TUniContainerPanel
      Left = 0
      Top = 0
      Width = 326
      Height = 35
      Hint = ''
      ParentColor = False
      Color = 14737632
      Align = alTop
      TabOrder = 1
      object paSearchContent1: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 326
        Height = 35
        Hint = ''
        Margins.Top = 0
        Margins.Bottom = 0
        ParentColor = False
        Color = clWhite
        Align = alClient
        TabOrder = 0
        DesignSize = (
          326
          35)
        object edSearchCRUD1: TUniEdit
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 249
          Height = 29
          Hint = ''
          CharCase = ecUpperCase
          Text = ''
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          EmptyText = 'conte'#250'do da pesquisa'
          OnExit = edSearchCRUD1Exit
          OnKeyDown = edSearchCRUD1KeyDown
          OnKeyUp = edSearchCRUD1KeyUp
        end
        object btnLkpSearch: TUniBitBtn
          Left = 124
          Top = -6
          Width = 33
          Height = 27
          Hint = '[[cls:ButtonThemeCrud]]'
          Margins.Top = 28
          Margins.Bottom = 12
          Visible = False
          Caption = '@'
          ParentFont = False
          Font.Height = -16
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          TabOrder = 2
          OnClick = btnLkpSearchClick
        end
        object btnCloseForm: TUniBitBtn
          Left = 290
          Top = 3
          Width = 32
          Height = 29
          Hint = '[[cls:ButtonThemeCrud]]'
          Margins.Top = 28
          Margins.Bottom = 12
          Caption = 'X'
          Anchors = [akTop, akRight]
          ParentFont = False
          Font.Height = -16
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          TabOrder = 3
          OnClick = btnCloseFormClick
        end
        object ed_PK: TUniEdit
          Left = 720
          Top = 1
          Width = 17
          Hint = ''
          Visible = False
          Text = ''
          TabOrder = 4
        end
        object btnClearLookup: TUniBitBtn
          Left = 255
          Top = 3
          Width = 32
          Height = 29
          Hint = '[['#13#10'cls:ButtonThemeCrud |'#13#10'hint:Clear LookUp'#13#10']]'
          Margins.Top = 28
          Margins.Bottom = 12
          Caption = 'C'
          Anchors = [akTop, akRight]
          ParentFont = False
          Font.Height = -16
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          TabOrder = 5
          OnClick = btnClearLookupClick
        end
      end
    end
    object dbgSearchCRUDLookUpLite: TUniDBGrid
      AlignWithMargins = True
      Left = 1
      Top = 36
      Width = 324
      Height = 281
      Hint = ''
      Margins.Left = 1
      Margins.Top = 1
      Margins.Right = 1
      Margins.Bottom = 1
      TitleFont.Name = 'Calibri'
      DataSource = dm_rc.dsLookUpSearch
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
      WebOptions.FetchAll = True
      LoadMask.WaitData = True
      LoadMask.Message = 'Loading data...'
      ForceFit = True
      BorderStyle = ubsNone
      Align = alClient
      Font.Height = -13
      Font.Name = 'Calibri'
      ParentFont = False
      TabOrder = 2
      OnExit = dbgSearchCRUDLookUpLiteExit
      OnCellClick = dbgSearchCRUDLookUpLiteCellClick
      OnColumnSort = dbgSearchCRUDLookUpLiteColumnSort
      OnDblClick = dbgSearchCRUDLookUpLiteDblClick
      OnDrawColumnCell = dbgSearchCRUDLookUpLiteDrawColumnCell
    end
    object labTotReg: TUniLabel
      AlignWithMargins = True
      Left = 3
      Top = 328
      Width = 320
      Height = 19
      Hint = ''
      Margins.Top = 10
      Alignment = taCenter
      AutoSize = False
      Caption = '0 registro(s)'
      Align = alBottom
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 3
    end
  end
  object timerClose: TUniTimer
    Interval = 700
    Enabled = False
    ClientEvent.Strings = (
      'function(sender)'
      '{'
      ' '
      '}')
    OnTimer = timerCloseTimer
    Left = 431
    Top = 249
  end
end
