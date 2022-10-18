object frmDEMO_PANELS: TfrmDEMO_PANELS
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
    ScrollHeight = 857
    ScrollWidth = 947
    ScrollY = 120
    object rcBlock1000: TUniContainerPanel
      Tag = 4
      Left = 27
      Top = 694
      Width = 729
      Height = 43
      Hint = '[[cols:12 | round:all]]'
      ParentColor = False
      TabOrder = 0
    end
    object rcBlock130: TUniContainerPanel
      Tag = 4
      Left = 11
      Top = -94
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
        Caption = 'Panels '
        Align = alClient
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
    object rcBlock131: TUniContainerPanel
      Tag = 4
      AlignWithMargins = True
      Left = 37
      Top = -42
      Width = 680
      Height = 200
      Hint = '[[cols:12 | round:no | cls:card-info-box-white]]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 2
      object UniContainerPanel9: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 680
        Height = 42
        Hint = '[[round:t | cls:card-light]]'
        ParentColor = False
        Color = clSilver
        Align = alTop
        TabOrder = 1
        object UniLabel2: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 0
          Width = 674
          Height = 42
          Hint = '[[bsh5:|cls:left-center]]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AutoSize = False
          Caption = 'Rounded Panels with scroll'
          Align = alClient
          ParentFont = False
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object UniScrollBox1: TUniScrollBox
        AlignWithMargins = True
        Left = 2
        Top = 44
        Width = 676
        Height = 154
        Hint = ''
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Align = alClient
        TabOrder = 2
        ScrollHeight = 129
        ScrollWidth = 578
        object UniContainerPanel1: TUniContainerPanel
          Left = 12
          Top = 16
          Width = 163
          Height = 55
          Hint = '[[round:all]]'
          ParentColor = False
          Color = 13078040
          TabOrder = 0
          DesignSize = (
            163
            55)
          object UniLabel9: TUniLabel
            Left = 6
            Top = 22
            Width = 150
            Height = 15
            Hint = ''
            Alignment = taCenter
            AutoSize = False
            Caption = 'All Rounded'
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 1
          end
        end
        object UniContainerPanel4: TUniContainerPanel
          Left = 334
          Top = 16
          Width = 120
          Height = 55
          Hint = '[[ round:t l ]]'
          ParentColor = False
          Color = 8421440
          TabOrder = 1
          object UniLabel3: TUniLabel
            Left = 6
            Top = 5
            Width = 113
            Height = 38
            Hint = ''
            AutoSize = False
            Caption = 'top left'
            ParentFont = False
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 1
          end
        end
        object UniContainerPanel6: TUniContainerPanel
          Left = 334
          Top = 74
          Width = 120
          Height = 55
          Hint = '[[ round:b l ]]'
          ParentColor = False
          Color = 8421440
          TabOrder = 2
          object UniLabel4: TUniLabel
            Left = 2
            Top = 34
            Width = 113
            Height = 15
            Hint = ''
            AutoSize = False
            Caption = 'bottom left'
            ParentFont = False
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 1
          end
        end
        object UniContainerPanel2: TUniContainerPanel
          Left = 12
          Top = 74
          Width = 80
          Height = 55
          Hint = '[[round:l]]'
          ParentColor = False
          Color = 4539862
          TabOrder = 3
          object UniLabel8: TUniLabel
            Left = 3
            Top = 34
            Width = 71
            Height = 17
            Hint = ''
            AutoSize = False
            Caption = 'left '
            ParentFont = False
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 1
          end
        end
        object UniContainerPanel3: TUniContainerPanel
          Left = 95
          Top = 74
          Width = 80
          Height = 55
          Hint = '[[round:r]]'
          ParentColor = False
          Color = 4539862
          TabOrder = 4
          object UniLabel7: TUniLabel
            Left = 4
            Top = 34
            Width = 68
            Height = 17
            Hint = ''
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'right'
            ParentFont = False
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 1
          end
        end
        object UniContainerPanel7: TUniContainerPanel
          Left = 458
          Top = 74
          Width = 120
          Height = 55
          Hint = '[[ round:b r ]]'
          ParentColor = False
          Color = 8421440
          TabOrder = 5
          object UniLabel5: TUniLabel
            Left = 2
            Top = 34
            Width = 113
            Height = 15
            Hint = ''
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'bottom left'
            ParentFont = False
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 1
          end
        end
        object UniContainerPanel5: TUniContainerPanel
          Left = 458
          Top = 16
          Width = 120
          Height = 55
          Hint = '[[ round:t r ]]'
          ParentColor = False
          Color = 8421440
          TabOrder = 6
          object UniLabel6: TUniLabel
            Left = 2
            Top = 5
            Width = 113
            Height = 38
            Hint = ''
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'top right'
            ParentFont = False
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 1
          end
        end
        object UniContainerPanel8: TUniContainerPanel
          Left = 186
          Top = 16
          Width = 138
          Height = 55
          Hint = '[[round:t]]'
          ParentColor = False
          Color = 6727914
          TabOrder = 7
          DesignSize = (
            138
            55)
          object UniLabel10: TUniLabel
            Left = 6
            Top = 5
            Width = 125
            Height = 15
            Hint = ''
            Alignment = taCenter
            AutoSize = False
            Caption = 'Top'
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 1
          end
        end
        object UniContainerPanel10: TUniContainerPanel
          Left = 186
          Top = 74
          Width = 138
          Height = 55
          Hint = '[[ round:b ]]'
          ParentColor = False
          Color = 6727914
          TabOrder = 8
          DesignSize = (
            138
            55)
          object UniLabel11: TUniLabel
            Left = 6
            Top = 34
            Width = 125
            Height = 15
            Hint = ''
            Alignment = taCenter
            AutoSize = False
            Caption = 'Bottom'
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 1
          end
        end
      end
    end
    object rcBlock172: TUniContainerPanel
      Tag = 1
      AlignWithMargins = True
      Left = 21
      Top = 238
      Width = 170
      Height = 270
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-6 lg-3 xl-3 | '#13#10'round:no | '#13#10'cls:card-in' +
        'fo-box-white'#13#10']]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 3
      DesignSize = (
        170
        270)
      object UniContainerPanel11: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 170
        Height = 42
        Hint = '[[round:t | cls:card-green]]'
        ParentColor = False
        Color = clSilver
        Align = alTop
        TabOrder = 1
        object UniLabel12: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 0
          Width = 164
          Height = 42
          Hint = '[[bsh5:|cls:left-center]]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AutoSize = False
          Caption = 'RadCORE DEMO'
          Align = alClient
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object labAlert: TUniLabel
        Left = 9
        Top = 59
        Width = 153
        Height = 79
        Hint = '[[ bsalert:success ]]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Exemplo Alerta'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -12
        Font.Style = [fsBold]
        TabOrder = 2
      end
      object UniLabel13: TUniLabel
        Left = 8
        Top = 155
        Width = 153
        Height = 79
        Hint = '[['#13#10'rcalert:success title:Success Sample'#13#10']]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Exemplo Alerta'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -12
        Font.Style = [fsBold]
        TabOrder = 3
      end
    end
    object rcBlock170: TUniContainerPanel
      Tag = 4
      Left = 23
      Top = 185
      Width = 729
      Height = 43
      Hint = '[[cols:12 | round:all]]'
      ParentColor = False
      TabOrder = 4
      object UniLabel14: TUniLabel
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
        Caption = 'Cards and Alerts'
        Align = alClient
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
    object rcBlock174: TUniContainerPanel
      Tag = 1
      AlignWithMargins = True
      Left = 206
      Top = 238
      Width = 170
      Height = 270
      Hint = 
        '[[cols:xs-12 sm-12 md-6 lg-3 xl-3 | round:no | cls:card-info-box' +
        '-white]]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 5
      DesignSize = (
        170
        270)
      object UniContainerPanel12: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 170
        Height = 42
        Hint = '[[round:t | cls:card-red]]'
        ParentColor = False
        Color = clSilver
        Align = alTop
        TabOrder = 1
        object UniLabel15: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 0
          Width = 164
          Height = 42
          Hint = '[[bsh5:|cls:left-center]]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AutoSize = False
          Caption = 'RadCORE DEMO'
          Align = alClient
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object UniLabel16: TUniLabel
        Left = 10
        Top = 59
        Width = 153
        Height = 79
        Hint = '[[ bsalert:danger ]]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Exemplo Alerta'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -12
        Font.Style = [fsBold]
        TabOrder = 2
      end
      object UniLabel17: TUniLabel
        Left = 10
        Top = 155
        Width = 153
        Height = 79
        Hint = '[['#13#10'rcalert:danger title:Danger Sample'#13#10']]'#13#10
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Exemplo Alerta'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -12
        Font.Style = [fsBold]
        TabOrder = 3
      end
    end
    object rcBlock178: TUniContainerPanel
      Tag = 1
      AlignWithMargins = True
      Left = 579
      Top = 238
      Width = 170
      Height = 270
      Hint = 
        '[[cols:xs-12 sm-12 md-6 lg-3 xl-3 | round:no | cls:card-info-box' +
        '-white]]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 6
      DesignSize = (
        170
        270)
      object UniContainerPanel13: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 170
        Height = 42
        Hint = '[[round:t | cls:card-orange]]'
        ParentColor = False
        Color = clSilver
        Align = alTop
        TabOrder = 1
        object UniLabel18: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 0
          Width = 164
          Height = 42
          Hint = '[[bsh5:|cls:left-center]]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AutoSize = False
          Caption = 'RadCORE DEMO'
          Align = alClient
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object UniLabel19: TUniLabel
        Left = 10
        Top = 59
        Width = 153
        Height = 79
        Hint = '[[ bsalert:warning ]]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Exemplo Alerta'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -12
        Font.Style = [fsBold]
        TabOrder = 2
      end
      object UniLabel20: TUniLabel
        Left = 10
        Top = 155
        Width = 153
        Height = 79
        Hint = '[['#13#10'rcalert:warning title:Warning Sample'#13#10']]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Exemplo Alerta'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -12
        Font.Style = [fsBold]
        TabOrder = 3
      end
    end
    object rcBlock176: TUniContainerPanel
      Tag = 1
      AlignWithMargins = True
      Left = 398
      Top = 238
      Width = 170
      Height = 270
      Hint = 
        '[[cols:xs-12 sm-12 md-6 lg-3 xl-3 | round:no | cls:card-info-box' +
        '-white]]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 7
      DesignSize = (
        170
        270)
      object UniContainerPanel14: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 170
        Height = 42
        Hint = '[[round:t | cls:card-blue]]'
        ParentColor = False
        Color = clSilver
        Align = alTop
        TabOrder = 1
        object UniLabel21: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 0
          Width = 164
          Height = 42
          Hint = '[[bsh5:|cls:left-center]]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AutoSize = False
          Caption = 'RadCORE DEMO'
          Align = alClient
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object UniLabel22: TUniLabel
        Left = 10
        Top = 59
        Width = 153
        Height = 79
        Hint = '[[ bsalert:info ]]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Exemplo Alerta'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -12
        Font.Style = [fsBold]
        TabOrder = 2
      end
      object UniLabel23: TUniLabel
        Left = 10
        Top = 155
        Width = 153
        Height = 79
        Hint = '[['#13#10'rcalert:info title:Info Sample'#13#10']]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Exemplo Alerta'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -12
        Font.Style = [fsBold]
        TabOrder = 3
      end
    end
    object rcBlock180: TUniContainerPanel
      Tag = 4
      Left = 19
      Top = 511
      Width = 729
      Height = 43
      Hint = '[[cols:12 | round:all]]'
      ParentColor = False
      TabOrder = 8
      object UniLabel24: TUniLabel
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
        Caption = 'Features Tiles'
        Align = alClient
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
    object rcBlock182: TUniContainerPanel
      Tag = 1
      Left = 17
      Top = 565
      Width = 222
      Height = 110
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-6 lg-3 xl-3 |'#13#10'hr:110 mobile-v-92 mobile' +
        '-h-92'#13#10']]'
      ParentColor = False
      TabOrder = 9
      object UniLabel25: TUniLabel
        Left = 0
        Top = 0
        Width = 222
        Height = 110
        Hint = '[['#13#10'rcfeature:fa-filter title:rcFeature Sample |'#13#10']]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'RC-Feature Tile can bu used to describe anything you want.'
        Align = alClient
        ParentFont = False
        Font.Height = -12
        Font.Style = [fsBold]
        TabOrder = 1
      end
    end
    object rcBlock183: TUniContainerPanel
      Tag = 1
      Left = 266
      Top = 560
      Width = 220
      Height = 110
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-6 lg-3 xl-3 |'#13#10'hr:110 mobile-v-90 mobile' +
        '-h-90'#13#10']]'
      ParentColor = False
      TabOrder = 10
      object UniLabel26: TUniLabel
        Left = 0
        Top = 0
        Width = 220
        Height = 110
        Hint = '[['#13#10'rcfeature:fa-print title:rcFeature Sample'#13#10']]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'RC-Feature Tile can bu used to describe anything you want.'
        Align = alClient
        ParentFont = False
        Font.Height = -12
        Font.Style = [fsBold]
        TabOrder = 1
      end
    end
    object rcBlock184: TUniContainerPanel
      Tag = 1
      Left = 499
      Top = 560
      Width = 220
      Height = 110
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-6 lg-3 xl-3 |'#13#10'hr:110 mobile-v-90 mobile' +
        '-h-90'#13#10']]'
      ParentColor = False
      TabOrder = 11
      object UniLabel27: TUniLabel
        Left = 0
        Top = 0
        Width = 220
        Height = 110
        Hint = '[['#13#10'rcfeature:fa-cogs title:rcFeature Sample'#13#10']]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'RC-Feature Tile can bu used to describe anything you want.'
        Align = alClient
        ParentFont = False
        Font.Height = -12
        Font.Style = [fsBold]
        TabOrder = 1
      end
    end
    object rcBlock185: TUniContainerPanel
      Tag = 1
      Left = 727
      Top = 558
      Width = 220
      Height = 110
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-6 lg-3 xl-3 |'#13#10'hr:110 mobile-v-90 mobile' +
        '-h-90'#13#10' ]]'
      ParentColor = False
      TabOrder = 12
      object UniLabel28: TUniLabel
        Left = 0
        Top = 0
        Width = 220
        Height = 110
        Hint = '[['#13#10'rcfeature:fa-download title:rcFeature Sample'#13#10']]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'RC-Feature Tile can bu used to describe anything you want.'
        Align = alClient
        ParentFont = False
        Font.Height = -12
        Font.Style = [fsBold]
        TabOrder = 1
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
