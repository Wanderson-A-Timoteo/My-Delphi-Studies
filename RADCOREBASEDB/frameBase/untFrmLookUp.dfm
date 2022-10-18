object frmLookUp: TfrmLookUp
  Left = 0
  Top = 0
  Hint = '[['#13#10'modal:'#13#10']]'#13#10
  ClientHeight = 490
  ClientWidth = 722
  Caption = 'Pesquisa Din'#226'mica'
  OnShow = UniFormShow
  BorderStyle = bsSingle
  OldCreateOrder = False
  OnKeyDown = UniFormKeyDown
  BorderIcons = [biSystemMenu]
  KeyPreview = True
  MonitoredKeys.Keys = <>
  AlignmentControl = uniAlignmentClient
  OnReady = UniFormReady
  OnBeforeShow = UniFormBeforeShow
  OnCreate = UniFormCreate
  OnDestroy = UniFormDestroy
  DesignSize = (
    722
    490)
  PixelsPerInch = 96
  TextHeight = 13
  object rcBlock10: TUniContainerPanel
    Left = 12
    Top = 6
    Width = 243
    Height = 54
    Hint = '[[cols:xs-12 sm-12 md-6]]'
    ParentColor = False
    TabOrder = 0
    DesignSize = (
      243
      54)
    object edSearchCRUD1: TUniEdit
      Left = 0
      Top = 24
      Width = 242
      Height = 29
      Hint = ''
      Margins.Left = 10
      CharCase = ecUpperCase
      Text = ''
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 1
      OnKeyDown = edSearchCRUD1KeyDown
    end
    object UniLabelv1: TUniLabel
      AlignWithMargins = True
      Left = 0
      Top = 0
      Width = 193
      Height = 17
      Hint = ''
      Margins.Left = 10
      Margins.Top = 15
      AutoSize = False
      Caption = 'Conte'#250'do da Pesquisa'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 2
    end
  end
  object rcBlock40: TUniContainerPanel
    Left = 14
    Top = 74
    Width = 691
    Height = 257
    Hint = '[[cols:12 | scale:parent h:100%-top off:60]]'
    ParentColor = False
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 1
    DesignSize = (
      691
      257)
    object dbgSearchCRUDLookUp: TUniDBGrid
      Left = 3
      Top = 2
      Width = 687
      Height = 218
      Hint = ''
      TitleFont.Name = 'Calibri'
      DataSource = dm_rc.dsLookUpSearch
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
      WebOptions.FetchAll = True
      LoadMask.WaitData = True
      LoadMask.Message = 'Loading data...'
      ForceFit = True
      BorderStyle = ubsNone
      Anchors = [akLeft, akTop, akRight, akBottom]
      Font.Height = -13
      Font.Name = 'Calibri'
      ParentFont = False
      TabOrder = 1
      OnColumnSort = dbgSearchCRUDLookUpColumnSort
      OnDblClick = dbgSearchCRUDLookUpDblClick
      OnDrawColumnCell = dbgSearchCRUDLookUpDrawColumnCell
    end
    object paTotreg: TUniContainerPanel
      Left = 0
      Top = 227
      Width = 691
      Height = 30
      Hint = ''
      ParentColor = False
      Align = alBottom
      TabOrder = 2
      DesignSize = (
        691
        30)
      object labTotReg: TUniLabel
        Left = 0
        Top = 6
        Width = 687
        Height = 19
        Hint = ''
        Margins.Top = 10
        Alignment = taCenter
        AutoSize = False
        Caption = '0 registro(s)'
        Anchors = [akLeft, akTop, akRight, akBottom]
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
  end
  object rcBlock20: TUniContainerPanel
    Left = 276
    Top = 8
    Width = 95
    Height = 52
    Hint = 
      '[['#13#10'cols:xs-6 sm-6 md-3 |'#13#10'hr:xs-(btnLkpClear+1) sm-(btnLkpClear' +
      '+1) md-rcBlock10  ]]'
    ParentColor = False
    TabOrder = 2
    DesignSize = (
      95
      52)
    object btnLkpSearch: TUniBitBtn
      Left = 0
      Top = 22
      Width = 95
      Height = 29
      Hint = '[[cls:ButtonThemeCrud]]'
      Margins.Top = 28
      Margins.Bottom = 12
      Caption = 'Pesquisa'
      Anchors = [akLeft, akRight, akBottom]
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 1
      OnClick = btnLkpSearchClick
    end
  end
  object ed_PK: TUniEdit
    Left = 638
    Top = 19
    Width = 17
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 3
  end
  object rcBlock30: TUniContainerPanel
    Left = 390
    Top = 10
    Width = 95
    Height = 52
    Hint = 
      '[['#13#10'cols:xs-6 sm-6 md-3 | '#13#10'hr:xs-(btnLkpClear+1) sm-(btnLkpClea' +
      'r+1) md-rcBlock10 '#13#10']]'
    ParentColor = False
    TabOrder = 4
    DesignSize = (
      95
      52)
    object btnLkpClear: TUniBitBtn
      Left = 0
      Top = 22
      Width = 95
      Height = 29
      Hint = '[[cls:ButtonThemeCrud]]'
      Margins.Top = 28
      Margins.Bottom = 12
      Caption = 'Limpar'
      Anchors = [akLeft, akRight, akBottom]
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 1
      OnClick = btnLkpClearClick
    end
  end
  object timerClose: TUniTimer
    Interval = 700
    Enabled = False
    RunOnce = True
    ClientEvent.Strings = (
      'function(sender)'
      '{'
      ' '
      '}')
    OnTimer = timerCloseTimer
    Left = 673
    Top = 13
  end
end
