object frmDEMO_TOOLTIPS: TfrmDEMO_TOOLTIPS
  Left = 0
  Top = 0
  Width = 1004
  Height = 677
  OnCreate = UniFrameCreate
  OnReady = UniFrameReady
  ParentAlignmentControl = False
  AlignmentControl = uniAlignmentClient
  TabOrder = 0
  ParentColor = False
  ParentBackground = False
  object sboxGridBlock: TUniScrollBox
    Left = 0
    Top = 0
    Width = 1004
    Height = 677
    Cursor = crHandPoint
    Hint = ''
    Align = alClient
    Color = 15395562
    TabOrder = 0
    ScrollHeight = 629
    ScrollWidth = 935
    object rcBlock1000: TUniContainerPanel
      Tag = 4
      Left = 40
      Top = 586
      Width = 729
      Height = 43
      Hint = '[[cols:12 | round:all]]'
      ParentColor = False
      TabOrder = 0
    end
    object rcBlock187: TUniContainerPanel
      Tag = 4
      Left = 21
      Top = 148
      Width = 729
      Height = 43
      Hint = '[[cols:12 | round:all]]'
      ParentColor = False
      TabOrder = 1
      object UniLabel1: TUniLabel
        AlignWithMargins = True
        Left = 6
        Top = 6
        Width = 717
        Height = 31
        Hint = '[[bsh5:|cls:left-center]]'
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        AutoSize = False
        Caption = 'ToolTips - Text Hints'
        Align = alClient
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
    object rcBlock188: TUniContainerPanel
      Tag = 1
      Left = 18
      Top = 200
      Width = 140
      Height = 56
      Hint = 
        '[['#13#10'cols:2 |'#13#10'round:no | '#13#10'cls:card-info-box-white rc-dashed-blo' +
        'ck '#13#10']]'
      ParentColor = False
      TabOrder = 2
      DesignSize = (
        140
        56)
      object UniLabel2: TUniLabel
        Left = 0
        Top = 4
        Width = 140
        Height = 23
        Cursor = crHandPoint
        Hint = '[['#13#10'center:parent xy |'#13#10'hint:Default Hint Text t:Default'#13#10']]'
        Alignment = taCenter
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Default'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -13
        Font.Style = [fsBold]
        TabOrder = 1
      end
    end
    object rcBlock189: TUniContainerPanel
      Tag = 1
      Left = 164
      Top = 195
      Width = 140
      Height = 56
      Hint = 
        '[['#13#10'cols:2 |'#13#10'round:no | '#13#10'cls:card-info-box-white rc-dashed-blo' +
        'ck '#13#10']]'
      ParentColor = False
      TabOrder = 3
      DesignSize = (
        140
        56)
      object UniLabel3: TUniLabel
        Left = 0
        Top = 4
        Width = 140
        Height = 23
        Cursor = crHandPoint
        Hint = 
          '[['#13#10'center:parent xy |'#13#10'hint:hint with delay 10s and width 200px' +
          ' t:gray hint c:gray w:200 d:10000 |'#13#10']]'#13#10
        Alignment = taCenter
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'gray border'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -13
        Font.Style = [fsBold]
        TabOrder = 1
      end
    end
    object rcBlock192: TUniContainerPanel
      Tag = 1
      Left = 471
      Top = 195
      Width = 140
      Height = 56
      Hint = 
        '[['#13#10'cols:2 |'#13#10'round:no | '#13#10'cls:card-info-box-white rc-dashed-blo' +
        'ck '#13#10']]'
      ParentColor = False
      TabOrder = 4
      DesignSize = (
        140
        56)
      object UniLabel4: TUniLabel
        Left = 0
        Top = 4
        Width = 140
        Height = 23
        Cursor = crHandPoint
        Hint = 
          '[['#13#10'hint:hint with delay 10s and width 200px t:success hint c:su' +
          'ccess w:200 d:10000 '#13#10']]'
        Alignment = taCenter
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'success'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -13
        Font.Style = [fsBold]
        TabOrder = 1
      end
      object UniLabel5: TUniLabel
        Left = 0
        Top = 33
        Width = 140
        Height = 23
        Cursor = crHandPoint
        Hint = 
          '[['#13#10'hint:hint with delay 10s and width 200px t:success-light c:s' +
          'uccess-light w:200 d:10000'#13#10']]'
        Alignment = taCenter
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'success light'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -13
        Font.Style = [fsBold]
        TabOrder = 2
      end
    end
    object rcBlock194: TUniContainerPanel
      Tag = 1
      Left = 795
      Top = 193
      Width = 140
      Height = 56
      Hint = 
        '[['#13#10'cols:2 |'#13#10'round:no | '#13#10'cls:card-info-box-white rc-dashed-blo' +
        'ck '#13#10']]'
      ParentColor = False
      TabOrder = 5
      DesignSize = (
        140
        56)
      object UniLabel6: TUniLabel
        Left = 0
        Top = 4
        Width = 140
        Height = 23
        Cursor = crHandPoint
        Hint = 
          '[['#13#10'hint:hint with delay 10s and width 200px t:warning hint c:wa' +
          'rning w:200 d:10000 '#13#10']]'
        Alignment = taCenter
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'warning'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -13
        Font.Style = [fsBold]
        TabOrder = 1
      end
      object UniLabel7: TUniLabel
        Left = 0
        Top = 33
        Width = 140
        Height = 23
        Cursor = crHandPoint
        Hint = 
          '[['#13#10'hint:hint with delay 10s and width 200px t:warning-light hin' +
          't c:warning-light w:200 d:10000 '#13#10']]'
        Alignment = taCenter
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'warning light'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -13
        Font.Style = [fsBold]
        TabOrder = 2
      end
    end
    object rcBlock190: TUniContainerPanel
      Tag = 1
      Left = 315
      Top = 200
      Width = 140
      Height = 56
      Hint = 
        '[['#13#10'cols:2 |'#13#10'round:no | '#13#10'cls:card-info-box-white rc-dashed-blo' +
        'ck '#13#10']]'
      ParentColor = False
      TabOrder = 6
      DesignSize = (
        140
        56)
      object UniLabel8: TUniLabel
        Left = 0
        Top = 4
        Width = 140
        Height = 23
        Cursor = crHandPoint
        Hint = 
          '[['#13#10'hint:hint with delay 10s and width 200px t:info hint c:info ' +
          'w:200 d:10000 '#13#10']]'
        Alignment = taCenter
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'info'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -13
        Font.Style = [fsBold]
        TabOrder = 1
      end
      object UniLabel9: TUniLabel
        Left = -1
        Top = 33
        Width = 140
        Height = 23
        Cursor = crHandPoint
        Hint = 
          '[['#13#10'hint:hint with delay 10s and width 200px t:info-light c:info' +
          '-light w:200 d:10000 '#13#10']]'
        Alignment = taCenter
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'info light'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -13
        Font.Style = [fsBold]
        TabOrder = 2
      end
    end
    object rcBlock193: TUniContainerPanel
      Tag = 1
      Left = 626
      Top = 193
      Width = 140
      Height = 56
      Hint = 
        '[['#13#10'cols:2 |'#13#10'round:no | '#13#10'cls:card-info-box-white rc-dashed-blo' +
        'ck '#13#10']]'
      ParentColor = False
      TabOrder = 7
      DesignSize = (
        140
        56)
      object UniLabel10: TUniLabel
        Left = 0
        Top = 3
        Width = 140
        Height = 23
        Cursor = crHandPoint
        Hint = 
          '[['#13#10'hint:hint with delay 10s and width 200px t:danger hint c:dan' +
          'ger w:200 d:10000 '#13#10']]'#13#10
        Alignment = taCenter
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'danger'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -13
        Font.Style = [fsBold]
        TabOrder = 1
      end
      object UniLabel11: TUniLabel
        Left = 0
        Top = 33
        Width = 140
        Height = 23
        Cursor = crHandPoint
        Hint = 
          '[['#13#10'hint:hint with delay 10s and width 200px t:danger-light hint' +
          ' c:danger-light w:200 d:10000 '#13#10']]'
        Alignment = taCenter
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'danger light'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -13
        Font.Style = [fsBold]
        TabOrder = 2
      end
    end
  end
  object rcSweetAlert: TUniSweetAlert
    Title = 'Title'
    ConfirmButtonText = 'OK'
    CancelButtonText = 'Cancel'
    ImageIndex = 0
    Padding = 20
    FocusCancel = True
    Left = 894
    Top = 46
  end
end
