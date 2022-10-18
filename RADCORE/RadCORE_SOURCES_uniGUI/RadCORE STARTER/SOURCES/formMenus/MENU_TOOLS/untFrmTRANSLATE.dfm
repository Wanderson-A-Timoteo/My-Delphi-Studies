object frmTranslate: TfrmTranslate
  Left = 0
  Top = 0
  Hint = '[[frm-align:right]]'
  ClientHeight = 695
  ClientWidth = 420
  Caption = 'Translate'
  Color = 2763306
  OnShow = UniFormShow
  BorderStyle = bsNone
  Position = poDefaultPosOnly
  OldCreateOrder = False
  OnKeyDown = UniFormKeyDown
  KeyPreview = True
  MonitoredKeys.Keys = <>
  AlignmentControl = uniAlignmentClient
  Font.Color = clWhite
  OnReady = UniFormReady
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object UniContainerPanel16: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 420
    Height = 695
    Hint = ''
    ParentColor = False
    Color = clSilver
    Align = alClient
    TabOrder = 0
    object UniScrollBox1: TUniScrollBox
      AlignWithMargins = True
      Left = 1
      Top = 1
      Width = 418
      Height = 693
      Hint = ''
      Margins.Left = 1
      Margins.Top = 1
      Margins.Right = 1
      Margins.Bottom = 1
      Align = alClient
      Color = 15395562
      TabOrder = 1
      DesignSize = (
        416
        691)
      ScrollHeight = 149
      ScrollWidth = 388
      object paTitulo: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 388
        Height = 42
        Hint = ''
        ParentColor = False
        Color = clWhite
        TabOrder = 0
        object paSearchContent1: TUniContainerPanel
          Left = 0
          Top = 0
          Width = 388
          Height = 42
          Hint = ''
          Margins.Top = 0
          Margins.Bottom = 0
          ParentColor = False
          Color = clWhite
          Align = alClient
          TabOrder = 1
          object labTitleFrm: TUniLabel
            AlignWithMargins = True
            Left = 10
            Top = 5
            Width = 375
            Height = 34
            Hint = ''
            Margins.Left = 10
            Margins.Top = 5
            AutoSize = False
            Caption = 'Language Translate'
            Align = alClient
            ParentFont = False
            Font.Color = clBlack
            Font.Height = -21
            Font.Name = 'Calibri'
            TabOrder = 1
          end
          object labSelectedColor: TUniLabel
            Left = 202
            Top = 8
            Width = 3
            Height = 13
            Hint = ''
            Visible = False
            Caption = ''
            TabOrder = 2
          end
          object btnExit: TUniBitBtn
            AlignWithMargins = True
            Left = 328
            Top = 4
            Width = 49
            Height = 28
            Hint = '[[cls:ButtonThemeCrud]]'
            Margins.Left = 0
            Margins.Top = 4
            Margins.Right = 0
            Caption = 'Close'
            ParentFont = False
            Font.Height = -16
            Font.Name = 'Calibri'
            TabOrder = 3
            OnClick = btnExitClick
          end
        end
      end
      object paGridB: TUniContainerPanel
        Tag = 1
        AlignWithMargins = True
        Left = 10
        Top = 161
        Width = 378
        Height = 516
        Hint = '[[round:no | cls:card-info-box-white]]'
        Margins.Left = 15
        Margins.Top = 15
        Margins.Right = 15
        Margins.Bottom = 10
        ParentColor = False
        Color = 15395562
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 1
        DesignSize = (
          378
          516)
        object UniContainerPanel22: TUniContainerPanel
          Left = 0
          Top = 0
          Width = 378
          Height = 42
          Hint = '[[round:t | cls:card-light]]'
          ParentColor = False
          Color = clSilver
          Align = alTop
          TabOrder = 1
          object UniLabel32: TUniLabel
            AlignWithMargins = True
            Left = 6
            Top = 0
            Width = 372
            Height = 42
            Hint = '[[bsh5:|cls:left-center]]'
            Margins.Left = 6
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            AutoSize = False
            Caption = 'Translate "Form" List'
            Align = alClient
            ParentFont = False
            Font.Color = clGray
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 1
          end
        end
        object sgProps: TUniStringGrid
          Left = 0
          Top = 98
          Width = 377
          Height = 281
          Hint = ''
          FixedCols = 0
          FixedRows = 0
          ColCount = 4
          Options = [goVertLine, goHorzLine, goColSizing, goRowSelect]
          ShowColumnTitles = True
          Columns = <
            item
              Title.Caption = 'Property'
              Title.Font.Name = 'Calibri'
              Width = 150
            end
            item
              Title.Caption = 'Content'
              Title.Font.Name = 'Calibri'
              Width = 205
            end>
          OnSelectCell = sgPropsSelectCell
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 2
          ParentFont = False
        end
        object mmContent: TUniMemo
          Left = 11
          Top = 390
          Width = 356
          Height = 81
          Hint = ''
          Anchors = [akLeft, akBottom]
          TabOrder = 3
        end
        object cbForm: TUniComboBox
          Left = 11
          Top = 54
          Width = 356
          Height = 30
          Hint = ''
          Text = ''
          Items.Strings = (
            'Portuguese - Brazilian ( pt_BR )'
            'English ( en )'
            'Spanish ( es )')
          ParentFont = False
          Font.Height = -13
          TabOrder = 4
          IconItems = <>
          OnChange = cbFormChange
        end
        object btnSave: TUniBitBtn
          AlignWithMargins = True
          Left = 312
          Top = 479
          Width = 55
          Height = 28
          Hint = '[[cls:ButtonThemeCrud]]'
          Margins.Left = 0
          Margins.Top = 4
          Margins.Right = 0
          Caption = 'Save'
          Anchors = [akLeft, akBottom]
          ParentFont = False
          Font.Height = -16
          Font.Name = 'Calibri'
          TabOrder = 5
          OnClick = btnSaveClick
        end
        object bntCancel: TUniBitBtn
          AlignWithMargins = True
          Left = 246
          Top = 479
          Width = 55
          Height = 28
          Hint = '[[cls:ButtonThemeCrud]]'
          Margins.Left = 0
          Margins.Top = 4
          Margins.Right = 0
          Caption = 'Cancel'
          Anchors = [akLeft, akBottom]
          ParentFont = False
          Font.Height = -16
          Font.Name = 'Calibri'
          TabOrder = 6
          OnClick = bntCancelClick
        end
      end
      object UniContainerPanel17: TUniContainerPanel
        Tag = 1
        AlignWithMargins = True
        Left = 10
        Top = 57
        Width = 378
        Height = 92
        Hint = '[[round:no | cls:card-info-box-white]]'
        Margins.Left = 15
        Margins.Top = 15
        Margins.Right = 15
        Margins.Bottom = 10
        ParentColor = False
        Color = 15395562
        TabOrder = 2
        object UniContainerPanel18: TUniContainerPanel
          Left = 0
          Top = 0
          Width = 378
          Height = 42
          Hint = '[[round:t | cls:card-light]]'
          ParentColor = False
          Color = clSilver
          Align = alTop
          TabOrder = 1
          object UniLabel13: TUniLabel
            AlignWithMargins = True
            Left = 6
            Top = 0
            Width = 372
            Height = 42
            Hint = '[[bsh5:|cls:left-center]]'
            Margins.Left = 6
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            AutoSize = False
            Caption = 'Language'
            Align = alClient
            ParentFont = False
            Font.Color = clGray
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 1
          end
        end
        object cbLanguage: TUniComboBox
          Left = 11
          Top = 51
          Width = 356
          Height = 30
          Hint = ''
          Text = ''
          Items.Strings = (
            
              '<a><span class="flag-icon flag-icon-br"></span> Portuguese ( pt_' +
              'BR )</a> '
            
              '<a><span class="flag-icon flag-icon-us"></span> English ( en )</' +
              'a> '
            
              '<a><span class="flag-icon flag-icon-es"></span> English ( es )</' +
              'a> '
            
              '<a><span class="flag-icon flag-icon-fr"></span> Fran'#231'ais( fr )</' +
              'a> '
            
              '<a><span class="flag-icon flag-icon-de"></span> Deutsch ( de )</' +
              'a> ')
          ParentFont = False
          Font.Height = -13
          TabOrder = 2
          IconItems = <>
          OnChange = cbLanguageChange
        end
      end
    end
  end
  object memProps: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 346
    Top = 381
  end
  object dsMemProps: TDataSource
    DataSet = memProps
    Left = 346
    Top = 422
  end
end
