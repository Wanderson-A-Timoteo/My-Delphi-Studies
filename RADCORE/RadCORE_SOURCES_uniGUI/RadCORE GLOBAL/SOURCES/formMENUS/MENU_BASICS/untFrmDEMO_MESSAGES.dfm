object frmDEMO_MESSAGES: TfrmDEMO_MESSAGES
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
    ScrollWidth = 971
    object rcBlock10: TUniContainerPanel
      Tag = 4
      Left = 25
      Top = 19
      Width = 729
      Height = 43
      Hint = '[[cols:12 | round:all]]'
      ParentColor = False
      TabOrder = 0
      object UniLabel35: TUniLabel
        AlignWithMargins = True
        Left = 6
        Top = 6
        Width = 717
        Height = 31
        Hint = '[[bsh5:left-center]]'
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        AutoSize = False
        Caption = 'Messages and Dinamic Objects Alignment'
        Align = alClient
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
    object rcBlock1000: TUniContainerPanel
      Tag = 4
      Left = 40
      Top = 586
      Width = 729
      Height = 43
      Hint = '[[cols:12 | round:all]]'
      ParentColor = False
      TabOrder = 1
    end
    object rcBlock128: TUniContainerPanel
      Tag = 1
      AlignWithMargins = True
      Left = 741
      Top = 90
      Width = 230
      Height = 151
      Hint = 
        '[[cols:xs-12 sm-12 md-6 lg-3 xl-3 | round:no | cls:card-info-box' +
        '-white]]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 2
      object UniContainerPanel1: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 230
        Height = 42
        Hint = '[[round:t | cls:card-light]]'
        ParentColor = False
        Color = clSilver
        Align = alTop
        TabOrder = 1
        object UniLabel1: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 0
          Width = 224
          Height = 42
          Hint = '[[bsh5:|cls:left-center]]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AutoSize = False
          Caption = 'rc_ShowInputBox / YesNo'
          Align = alClient
          ParentFont = False
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object btnQuestionInput: TUniBitBtn
        AlignWithMargins = True
        Left = 17
        Top = 81
        Width = 70
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineBlue | '#13#10'center:parent x:-74 ' +
          'y:42'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Question'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
        OnClick = btnQuestionInputClick
      end
      object btnInputShow: TUniBitBtn
        AlignWithMargins = True
        Left = 93
        Top = 91
        Width = 70
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineBlue | '#13#10'center:parent x:74 y' +
          ':42'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Input'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 3
        OnClick = btnInputShowClick
      end
      object chkPassword: TUniLabel
        Left = 12
        Top = 124
        Width = 20
        Height = 20
        Hint = '[[bschk:0]]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Password'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsUnderline]
        ParentColor = False
        Color = clBtnFace
        TabOrder = 4
      end
      object UniLabel2: TUniLabel
        Left = 38
        Top = 127
        Width = 52
        Height = 15
        Hint = ''
        Caption = 'Password'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        TabOrder = 5
      end
    end
    object rcBlock126: TUniContainerPanel
      Tag = 1
      AlignWithMargins = True
      Left = 494
      Top = 90
      Width = 230
      Height = 151
      Hint = 
        '[[cols:xs-12 sm-12 md-6 lg-3 xl-3 | round:no | cls:card-info-box' +
        '-white]]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 3
      object UniContainerPanel2: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 230
        Height = 42
        Hint = '[[round:t | cls:card-light]]'
        ParentColor = False
        Color = clSilver
        Align = alTop
        TabOrder = 1
        object UniLabel3: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 0
          Width = 224
          Height = 42
          Hint = '[[bsh5:|cls:left-center]]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AutoSize = False
          Caption = 'rc_ShowToaster'
          Align = alClient
          ParentFont = False
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object btnToastSucces: TUniBitBtn
        AlignWithMargins = True
        Left = 27
        Top = 67
        Width = 70
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineGreen | '#13#10'pos-l:4 | '#13#10'pos-t:5' +
          '2'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Success'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
        OnClick = btnToastSuccesClick
      end
      object btnToastWarning: TUniBitBtn
        AlignWithMargins = True
        Left = 6
        Top = 96
        Width = 70
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineBlue | '#13#10'pos-l:4 | '#13#10'pos-b:40' +
          #13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Warning'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 3
        OnClick = btnToastWarningClick
      end
      object btnToastError: TUniBitBtn
        AlignWithMargins = True
        Left = 121
        Top = 107
        Width = 70
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineRed | '#13#10'pos-r:74 | '#13#10'pos-b:40' +
          #13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Error'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 4
        OnClick = btnToastErrorClick
      end
      object btnToastInfo: TUniBitBtn
        AlignWithMargins = True
        Left = 141
        Top = 54
        Width = 70
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineBlue | '#13#10'pos-r:74 | '#13#10'pos-t:5' +
          '2'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Info'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 5
        OnClick = btnToastInfoClick
      end
      object chkSound: TUniLabel
        Left = 174
        Top = 88
        Width = 20
        Height = 20
        Hint = '[[bschk:0 | center:parent x:-25 y:42]]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Sound'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsUnderline]
        ParentColor = False
        Color = clBtnFace
        TabOrder = 6
      end
      object UniLabel4: TUniLabel
        Left = 200
        Top = 91
        Width = 34
        Height = 15
        Hint = '[[center:parent x:25 y:42]]'
        Caption = 'Sound'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        TabOrder = 7
      end
    end
    object rcBlock124: TUniContainerPanel
      Tag = 1
      AlignWithMargins = True
      Left = 252
      Top = 92
      Width = 230
      Height = 151
      Hint = 
        '[[cols:xs-12 sm-12 md-6 lg-3 xl-3 | round:no | cls:card-info-box' +
        '-white]]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 4
      object paSweetHeader: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 230
        Height = 42
        Hint = '[[round:t | cls:card-light]]'
        ParentColor = False
        Color = clSilver
        Align = alTop
        TabOrder = 1
        object UniLabel5: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 0
          Width = 224
          Height = 42
          Hint = '[[bsh5:|cls:left-center]]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AutoSize = False
          Caption = 'rc_ShowSweetAlert'
          Align = alClient
          ParentFont = False
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object btnSweetSuccess: TUniBitBtn
        AlignWithMargins = True
        Left = 13
        Top = 59
        Width = 70
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineGreen | '#13#10'scale:parent w:45% ' +
          '| '#13#10'pos-l:5%'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Success'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
        OnClick = btnSweetSuccessClick
      end
      object btnSweetWarning: TUniBitBtn
        AlignWithMargins = True
        Left = 26
        Top = 99
        Width = 70
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineOrange | '#13#10'align:btnSweetSucc' +
          'ess t:h+5 l:0 | '#13#10'scale:parent w:45%'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Warning'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 3
        OnClick = btnSweetWarningClick
      end
      object btnSweetError: TUniBitBtn
        AlignWithMargins = True
        Left = 157
        Top = 107
        Width = 70
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineRed | '#13#10'align:btnSweetWarning' +
          ' t:0 r:5 | '#13#10'scale:parent w:45%'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Error'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 4
        OnClick = btnSweetErrorClick
      end
      object btnSweetInfo: TUniBitBtn
        AlignWithMargins = True
        Left = 148
        Top = 49
        Width = 70
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineBlue | align:btnSweetSuccess ' +
          't:0 r:5 | '#13#10'scale:parent w:45%'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Info'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 5
        OnClick = btnSweetInfoClick
      end
    end
    object rcBlock122: TUniContainerPanel
      Tag = 1
      AlignWithMargins = True
      Left = 9
      Top = 92
      Width = 230
      Height = 151
      Hint = 
        '[[cols:xs-12 sm-12 md-6 lg-3 xl-3 | round:no | cls:card-info-box' +
        '-white]]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 5
      object UniContainerPanel3: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 230
        Height = 42
        Hint = '[[round:t | cls:card-light]]'
        ParentColor = False
        Color = clSilver
        Align = alTop
        TabOrder = 1
        object UniLabel6: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 0
          Width = 224
          Height = 42
          Hint = '[[bsh5:|cls:left-center]]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AutoSize = False
          Caption = 'rc_ShowMessage'
          Align = alClient
          ParentFont = False
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object UniBitBtn1: TUniBitBtn
        AlignWithMargins = True
        Left = 88
        Top = 94
        Width = 70
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineRed | '#13#10'center:parent x:74 y:' +
          '90'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Error'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
        OnClick = UniBitBtn1Click
      end
      object btnSuccess1: TUniBitBtn
        AlignWithMargins = True
        Left = 6
        Top = 52
        Width = 70
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineGreen | '#13#10'center:parent x:-74' +
          ' y:8'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Success'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 3
        OnClick = btnSuccess1Click
      end
      object btnShowMsgInfo: TUniBitBtn
        AlignWithMargins = True
        Left = 88
        Top = 50
        Width = 70
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineBlue | '#13#10'center:parent x:74 y' +
          ':8'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Info'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 4
        OnClick = btnShowMsgInfoClick
      end
      object btnShowWarning: TUniBitBtn
        AlignWithMargins = True
        Left = 6
        Top = 96
        Width = 70
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineOrange | '#13#10'center:parent x:-7' +
          '4 y:90'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Warning'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 5
        OnClick = btnShowWarningClick
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
