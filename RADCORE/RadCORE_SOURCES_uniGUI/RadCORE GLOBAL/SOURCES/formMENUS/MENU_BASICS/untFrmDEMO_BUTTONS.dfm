object frmDEMO_BUTTONS: TfrmDEMO_BUTTONS
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
    ScrollWidth = 769
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
        Caption = 'Buttons'
        Align = alClient
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
    object rcBlock30: TUniContainerPanel
      Tag = 2
      AlignWithMargins = True
      Left = 307
      Top = 74
      Width = 340
      Height = 230
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-6 | '#13#10'round:no | '#13#10'cls:card-info-box-whi' +
        'te |'#13#10']]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 1
      object UniContainerPanel11: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 340
        Height = 42
        Hint = '[['#13#10'round:t | '#13#10'cls:card-light'#13#10']]'
        ParentColor = False
        Color = clSilver
        Align = alTop
        TabOrder = 1
        object UniLabel42: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 0
          Width = 334
          Height = 42
          Hint = '[['#13#10'bsh5: |'#13#10'cls:left-center'#13#10']]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AutoSize = False
          Caption = 'Buttons Outline / Rounded'
          Align = alClient
          ParentFont = False
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object UniScrollBox3: TUniScrollBox
        AlignWithMargins = True
        Left = 0
        Top = 45
        Width = 340
        Height = 182
        Hint = ''
        Margins.Left = 0
        Margins.Right = 0
        Align = alClient
        TabOrder = 2
        ScrollHeight = 171
        ScrollWidth = 291
        object btnRedOutL: TUniBitBtn
          AlignWithMargins = True
          Left = 12
          Top = 15
          Width = 90
          Height = 36
          Hint = 
            '[['#13#10'cls:ButtonOutline ButtonOutlineRed btn-font-red| '#13#10'scale:par' +
            'ent w:32% | '#13#10'pos-l:2%'#13#10']]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Red OL'
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 0
        end
        object btnGreenOutL: TUniBitBtn
          AlignWithMargins = True
          Left = 107
          Top = 15
          Width = 90
          Height = 36
          Hint = 
            '[[cls:ButtonOutline ButtonOutlineGreen btn-font-green| align:btn' +
            'RedOutL t:0 r:5 | scale:parent w:32%]]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Green OL'
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object btnBlueOutL: TUniBitBtn
          AlignWithMargins = True
          Left = 201
          Top = 15
          Width = 90
          Height = 36
          Hint = 
            '[['#13#10'cls:ButtonOutline ButtonOutlineBlue btn-font-blue| '#13#10'align:b' +
            'tnGreenOutL t:0 r:5 | '#13#10'scale:parent w:31%'#13#10']]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Blue OL'
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 2
        end
        object btnRedRound: TUniBitBtn
          AlignWithMargins = True
          Left = 12
          Top = 95
          Width = 90
          Height = 36
          Hint = 
            '[[cls:ButtonOutline ButtonOutlineRed ButtonRound | scale:parent ' +
            'w:32% | pos-l:2%]]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Red'
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 3
        end
        object btnGreenRound: TUniBitBtn
          AlignWithMargins = True
          Left = 107
          Top = 95
          Width = 90
          Height = 36
          Hint = 
            '[[cls:ButtonOutline ButtonOutlineGreen ButtonRound | align:btnRe' +
            'dRound t:0 r:5 | scale:parent w:32%]]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Green'
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 4
        end
        object btnRound: TUniBitBtn
          AlignWithMargins = True
          Left = 201
          Top = 95
          Width = 90
          Height = 36
          Hint = 
            '[['#13#10'cls:ButtonOutline ButtonOutlineBlue ButtonRound | align:btnG' +
            'reenRound t:0 r:5 | '#13#10'scale:parent w:31%'#13#10']]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Blue'
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 5
        end
        object btnOrangeOutL: TUniBitBtn
          AlignWithMargins = True
          Left = 12
          Top = 55
          Width = 90
          Height = 36
          Hint = 
            '[[cls:ButtonOutline ButtonOutlineOrange btn-font-orange| scale:p' +
            'arent w:32% | pos-l:2%]]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Orange OL'
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 6
        end
        object btnGrayOutL: TUniBitBtn
          AlignWithMargins = True
          Left = 106
          Top = 55
          Width = 90
          Height = 36
          Hint = 
            '[[cls:ButtonOutline ButtonOutlineGray btn-font-gray| align:btnOr' +
            'angeOutL t:0 r:5 | scale:parent w:32%]]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Gray OL'
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 7
        end
        object btnOrangeRound: TUniBitBtn
          AlignWithMargins = True
          Left = 12
          Top = 135
          Width = 90
          Height = 36
          Hint = 
            '[[cls:ButtonOutline ButtonOutlineOrange ButtonRound | scale:pare' +
            'nt w:32% | pos-l:2%]]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Orange'
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 8
        end
        object btnSilverOutL: TUniBitBtn
          AlignWithMargins = True
          Left = 201
          Top = 55
          Width = 90
          Height = 36
          Hint = 
            '[[cls:ButtonOutline ButtonOutlineSilver btn-font-silver| align:b' +
            'tnGrayOutL t:0 r:5 | scale:parent w:31%]]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Silver OL'
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 9
        end
        object btnGrayRound: TUniBitBtn
          AlignWithMargins = True
          Left = 106
          Top = 135
          Width = 90
          Height = 36
          Hint = 
            '[[cls:ButtonOutline ButtonOutlineGray ButtonRound | align:btnOra' +
            'ngeRound t:0 r:5 | scale:parent w:32%]]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Gray'
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 10
        end
        object btnSilverRound: TUniBitBtn
          AlignWithMargins = True
          Left = 201
          Top = 135
          Width = 90
          Height = 36
          Hint = 
            '[[cls:ButtonOutline ButtonOutlineSilver ButtonRound | align:btnG' +
            'rayRound t:0 r:5 | scale:parent w:31%]]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Silver'
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 11
        end
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
      TabOrder = 2
    end
    object rcBlock19: TUniContainerPanel
      Tag = 2
      AlignWithMargins = True
      Left = 25
      Top = 71
      Width = 278
      Height = 230
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-6 | '#13#10'hr-childs:xs-exp sm-exp md-fix | '#13 +
        #10'cls:card-info-box-white |'#13#10'round:no | '#13#10']]'#13#10
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      AutoScroll = True
      TabOrder = 3
      ScrollHeight = 230
      ScrollWidth = 278
      object rcBlock20: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 251
        Height = 42
        Hint = 
          '[['#13#10'cols:12 | '#13#10'noborder-top | '#13#10'noborder-left | '#13#10'scale:parent ' +
          'w:100% | '#13#10'round:t | '#13#10'cls:card-light'#13#10']]'
        ParentColor = False
        Color = 14802398
        TabOrder = 1
        DesignSize = (
          251
          42)
        object UniLabel1: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 0
          Width = 245
          Height = 42
          Hint = '[['#13#10'bsh5: | '#13#10'cls:left-center'#13#10']]'#13#10
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AutoSize = False
          Caption = 'Buttons Default'
          Align = alClient
          ParentFont = False
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object labRcCollapse24: TUniLabel
          Left = 228
          Top = 10
          Width = 15
          Height = 25
          Hint = '[['#13#10'collapse:rcBlock19 off-42 collapsed:mobile'#13#10']]'#13#10
          TextConversion = txtHTML
          Caption = '^'
          Anchors = [akTop, akRight]
          ParentFont = False
          Font.Height = -21
          ParentColor = False
          Color = clBlack
          TabOrder = 2
        end
      end
      object rcBlock21: TUniContainerPanel
        Left = 24
        Top = 60
        Width = 75
        Height = 36
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 2
        DesignSize = (
          75
          36)
        object btnClose: TUniBitBtn
          AlignWithMargins = True
          Left = 1
          Top = 1
          Width = 73
          Height = 34
          Hint = '[[cls:ButtonDark ]]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Dark'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object rcBlock22: TUniContainerPanel
        Left = 103
        Top = 60
        Width = 75
        Height = 36
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 3
        DesignSize = (
          75
          36)
        object btnRed: TUniBitBtn
          AlignWithMargins = True
          Left = 1
          Top = 1
          Width = 73
          Height = 34
          Hint = '[[cls:ButtonRed ]]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Red'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object rcBlock23: TUniContainerPanel
        Left = 187
        Top = 62
        Width = 75
        Height = 36
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 4
        DesignSize = (
          75
          36)
        object btnGreen: TUniBitBtn
          AlignWithMargins = True
          Left = 1
          Top = 1
          Width = 73
          Height = 34
          Hint = '[[cls:ButtonGreen]]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Green'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object rcBlock27: TUniContainerPanel
        Left = 19
        Top = 162
        Width = 75
        Height = 36
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 5
        DesignSize = (
          75
          36)
        object btnGray: TUniBitBtn
          AlignWithMargins = True
          Left = 1
          Top = 1
          Width = 73
          Height = 34
          Hint = '[[cls:ButtonGray]]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Gray'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object rcBlock28: TUniContainerPanel
        Left = 105
        Top = 162
        Width = 75
        Height = 36
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 6
        DesignSize = (
          75
          36)
        object btnSilver: TUniBitBtn
          AlignWithMargins = True
          Left = 1
          Top = 1
          Width = 73
          Height = 34
          Hint = '[[cls:ButtonSilver btn-font-black]]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Silver'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object rcBlock29: TUniContainerPanel
        Left = 185
        Top = 162
        Width = 75
        Height = 36
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 7
        DesignSize = (
          75
          36)
        object btnCrud: TUniBitBtn
          AlignWithMargins = True
          Left = 1
          Top = 1
          Width = 73
          Height = 34
          Hint = '[[cls:ButtonThemeCrud]]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Themed'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object rcBlock24: TUniContainerPanel
        Left = 19
        Top = 112
        Width = 75
        Height = 36
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 8
        DesignSize = (
          75
          36)
        object btnOrange: TUniBitBtn
          AlignWithMargins = True
          Left = 1
          Top = 1
          Width = 73
          Height = 34
          Hint = '[[cls:ButtonOrange ]]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Orange'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object rcBlock25: TUniContainerPanel
        Left = 105
        Top = 112
        Width = 75
        Height = 36
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 9
        DesignSize = (
          75
          36)
        object btnBlue: TUniBitBtn
          AlignWithMargins = True
          Left = 1
          Top = 1
          Width = 73
          Height = 34
          Hint = '[[cls:ButtonBlue]]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Blue'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object rcBlock26: TUniContainerPanel
        Left = 185
        Top = 112
        Width = 75
        Height = 36
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 10
        DesignSize = (
          75
          36)
        object btnDark: TUniBitBtn
          AlignWithMargins = True
          Left = 1
          Top = 1
          Width = 73
          Height = 34
          Hint = '[[cls:ButtonBlueDark ]]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'BlueDark'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
    end
    object rcBlock40: TUniContainerPanel
      Tag = 2
      AlignWithMargins = True
      Left = 15
      Top = 319
      Width = 278
      Height = 230
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-4 | '#13#10'round:no | '#13#10'cls:card-info-box-whi' +
        'te |'#13#10']]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 4
      object UniContainerPanel11Clone: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 278
        Height = 42
        Hint = '[['#13#10'round:t | '#13#10'cls:card-light'#13#10']]'
        ParentColor = False
        Color = clSilver
        Align = alTop
        TabOrder = 1
        object UniLabel42Clone: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 0
          Width = 272
          Height = 42
          Hint = '[['#13#10'bsh5: |'#13#10'cls:left-center'#13#10']]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AutoSize = False
          Caption = 'Buttons With Icons'
          Align = alClient
          ParentFont = False
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object UniScrollBox3Clone: TUniScrollBox
        AlignWithMargins = True
        Left = 0
        Top = 45
        Width = 278
        Height = 182
        Hint = ''
        Margins.Left = 0
        Margins.Right = 0
        Align = alClient
        TabOrder = 2
        ScrollHeight = 128
        ScrollWidth = 271
        object UniContainerPanel1: TUniContainerPanel
          Left = 7
          Top = 14
          Width = 264
          Height = 114
          Hint = '[['#13#10'center:parent xy'#13#10']]'
          ParentColor = False
          TabOrder = 0
          object btnLink: TUniBitBtn
            AlignWithMargins = True
            Left = 2
            Top = 2
            Width = 259
            Height = 63
            Hint = 
              '[['#13#10'ico:fas-link 2x | '#13#10'ico-pos:up |'#13#10'cls:ButtonOutline ButtonOu' +
              'tlineGreen | '#13#10'append'#13#10']]'
            Margins.Left = 6
            Margins.Top = 4
            Margins.Right = 6
            Margins.Bottom = 4
            Caption = 'Open Link'
            ParentFont = False
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 1
          end
          object btnCancel: TUniBitBtn
            AlignWithMargins = True
            Left = 2
            Top = 73
            Width = 124
            Height = 36
            Hint = '[['#13#10'ico:far-paste | '#13#10'cls:ButtonRed | '#13#10'append '#13#10']]'
            Margins.Left = 6
            Margins.Top = 4
            Margins.Right = 6
            Margins.Bottom = 4
            Caption = 'Paste'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
          object btnSave: TUniBitBtn
            AlignWithMargins = True
            Left = 134
            Top = 73
            Width = 127
            Height = 36
            Hint = '[['#13#10'ico:far-copy | '#13#10'cls:ButtonGreen | '#13#10'append'#13#10']]'
            Margins.Left = 6
            Margins.Top = 4
            Margins.Right = 6
            Margins.Bottom = 4
            Caption = 'Copy ClipBoard'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 3
          end
        end
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
