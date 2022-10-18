object frmDEMO_FORMS: TfrmDEMO_FORMS
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
    ScrollHeight = 1111
    ScrollWidth = 982
    object rcBlock10: TUniContainerPanel
      Tag = 4
      Left = 25
      Top = 19
      Width = 746
      Height = 43
      Hint = '[[cols:12 | round:all]]'
      ParentColor = False
      TabOrder = 0
      DesignSize = (
        746
        43)
      object UniLabel35: TUniLabel
        AlignWithMargins = True
        Left = 6
        Top = 6
        Width = 655
        Height = 31
        Hint = '[[bsh5:left-center]]'
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        AutoSize = False
        Caption = 'Forms and Elements'
        Align = alLeft
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniBitBtn1: TUniBitBtn
        AlignWithMargins = True
        Left = 711
        Top = 7
        Width = 30
        Height = 30
        Hint = 
          '[['#13#10'ico:far-times-circle | '#13#10'cls:ButtonOutline ButtonOutlineRed ' +
          '| '#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'x'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
        OnClick = UniBitBtn1Click
      end
    end
    object rcBlock1000: TUniContainerPanel
      Tag = 4
      Left = 130
      Top = 1068
      Width = 729
      Height = 43
      Hint = '[[cols:12 | round:all]]'
      ParentColor = False
      TabOrder = 1
    end
    object rcBlock40: TUniContainerPanel
      Tag = 1
      AlignWithMargins = True
      Left = 25
      Top = 98
      Width = 235
      Height = 284
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-3| '#13#10'round:no | '#13#10'cls:card-info-box-whit' +
        'e'#13#10']]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 2
      DesignSize = (
        235
        284)
      object UniContainerPanel1: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 235
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
          Width = 229
          Height = 42
          Hint = '[[bsh5:|cls:left-center]]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AutoSize = False
          Caption = 'Input Icons'
          Align = alClient
          ParentFont = False
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object edUserName: TUniEdit
        Left = 16
        Top = 75
        Width = 203
        Height = 40
        Hint = '[['#13#10'inputico:fas-envelope |'#13#10'focus-color:off |'#13#10']]'#13#10
        CharCase = ecLowerCase
        Text = ''
        ParentFont = False
        Font.Height = -17
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        EmptyText = 'User Email'
        FieldLabelWidth = 20
        FieldLabelSeparator = ' '
        FieldLabelFont.Name = 'Calibri'
      end
      object labRepitaNova: TUniLabel
        Left = 17
        Top = 54
        Width = 59
        Height = 15
        Hint = ''
        Caption = 'User Email'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 3
      end
      object UniLabel2: TUniLabel
        Left = 16
        Top = 129
        Width = 82
        Height = 15
        Hint = ''
        Caption = 'User Password'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 4
      end
      object edPassword: TUniEdit
        Left = 17
        Top = 148
        Width = 203
        Height = 40
        Hint = '[['#13#10'inputico:fas-unlock |'#13#10'focus-color:off |'#13#10']]'#13#10
        PasswordChar = '*'
        Text = ''
        ParentFont = False
        Font.Height = -17
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 5
        EmptyText = 'Senha de Acesso'
        FieldLabelWidth = 20
        FieldLabelSeparator = ' '
        FieldLabelFont.Name = 'Calibri'
      end
      object btnLink: TUniBitBtn
        AlignWithMargins = True
        Left = 17
        Top = 205
        Width = 202
        Height = 66
        Hint = 
          '[['#13#10'ico:fas-link 2x | '#13#10'ico-pos:up |'#13#10'cls:ButtonOutline ButtonOu' +
          'tlineGreen | '#13#10'align:edPassword r:-w b:10 | '#13#10'link:https://radco' +
          're.pro.br/web/atualizacoes/ |'#13#10'append'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Open Link'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 6
      end
    end
    object rcBlock42: TUniContainerPanel
      Tag = 1
      AlignWithMargins = True
      Left = 271
      Top = 98
      Width = 280
      Height = 284
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-4 | '#13#10'round:no | '#13#10'cls:card-info-box-whi' +
        'te'#13#10']]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 3
      object rcBlock43: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 280
        Height = 42
        Hint = '[['#13#10'cols:12 |'#13#10'noborder-all|'#13#10'round:t | cls:card-light'#13#10']]'
        ParentColor = False
        Color = clSilver
        TabOrder = 1
        object UniLabel3: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 0
          Width = 274
          Height = 42
          Hint = '[[bsh5:|cls:left-center]]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AutoSize = False
          Caption = 'Forms'
          Align = alClient
          ParentFont = False
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object btnSave: TUniBitBtn
        AlignWithMargins = True
        Left = 149
        Top = 231
        Width = 117
        Height = 36
        Hint = 
          '[['#13#10'ico:far-copy | '#13#10'cls:ButtonGreen | '#13#10'align:rcBlock45 r:-w b:' +
          '10 | '#13#10'append'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Copy ClipBoard'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
        OnClick = btnSaveClick
      end
      object btnCancel: TUniBitBtn
        AlignWithMargins = True
        Left = 23
        Top = 212
        Width = 63
        Height = 36
        Hint = 
          '[['#13#10'ico:far-paste | '#13#10'cls:ButtonRed | '#13#10'align:btnsave t:0 l:-w-1' +
          '0 | '#13#10'append '#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Paste'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 3
        OnClick = btnCancelClick
      end
      object rcBlock44: TUniContainerPanel
        Left = 28
        Top = 55
        Width = 122
        Height = 36
        Hint = '[[cols:xs-12 sm-12 md-12 ]]'
        ParentColor = False
        TabOrder = 4
        DesignSize = (
          122
          36)
        object UniEdit1: TUniEdit
          Left = 0
          Top = 6
          Width = 122
          Height = 29
          Hint = 
            '[['#13#10'form-label:top-in Label |'#13#10'form-label-color:#7e7e7e |'#13#10'form-' +
            'label-bg:#ffffff |'#13#10'focus-color:off |'#13#10']]'
          Text = ''
          ParentFont = False
          Font.Height = -16
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
      end
      object rcBlock45: TUniContainerPanel
        Left = 23
        Top = 114
        Width = 205
        Height = 81
        Hint = '[[cols:xs-12 sm-12 md-12 ]]'
        ParentColor = False
        TabOrder = 5
        DesignSize = (
          205
          81)
        object memo: TUniMemo
          Left = 2
          Top = 16
          Width = 201
          Height = 63
          Hint = 
            '[['#13#10'form-label:top Memo |'#13#10'form-label-bg:#ffffff |'#13#10'form-label-c' +
            'olor:#7e7e7e |'#13#10'focus-color:off |'#13#10']]'
          ParentFont = False
          Font.Height = -16
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          LayoutConfig.Cls = 'toupper'
        end
      end
    end
    object rcBlock72: TUniContainerPanel
      Tag = 1
      AlignWithMargins = True
      Left = 31
      Top = 405
      Width = 184
      Height = 246
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-4| '#13#10'round:no | '#13#10'cls:card-info-box-whit' +
        'e'#13#10']]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 4
      object UniContainerPanel2: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 184
        Height = 42
        Hint = '[[round:t | cls:card-light]]'
        ParentColor = False
        Color = clSilver
        Align = alTop
        TabOrder = 1
        object UniLabel8: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 0
          Width = 178
          Height = 42
          Hint = '[[bsh5:|cls:left-center]]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AutoSize = False
          Caption = 'bsswt  / bschk'
          Align = alClient
          ParentFont = False
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object UniScrollBox1: TUniScrollBox
        Left = 0
        Top = 42
        Width = 184
        Height = 204
        Hint = ''
        Align = alClient
        TabOrder = 2
        DesignSize = (
          182
          202)
        object UniContainerPanel3: TUniContainerPanel
          Left = 20
          Top = 12
          Width = 147
          Height = 177
          Hint = ''
          ParentColor = False
          Anchors = []
          TabOrder = 0
          object UniLabel9: TUniLabel
            Left = 81
            Top = 15
            Width = 33
            Height = 20
            Hint = '[[bsswt:1]]'
            TextConversion = txtHTML
            AutoSize = False
            Caption = 'Opt1'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsUnderline]
            ParentColor = False
            Color = clBtnFace
            TabOrder = 1
          end
          object UniLabel10: TUniLabel
            Left = 10
            Top = 18
            Width = 48
            Height = 15
            Hint = ''
            Caption = 'Option 1'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 2
          end
          object UniLabel11: TUniLabel
            Left = 81
            Top = 38
            Width = 33
            Height = 20
            Hint = '[[bsswt:0]]'
            TextConversion = txtHTML
            AutoSize = False
            Caption = 'Opt2'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsUnderline]
            ParentColor = False
            Color = clBtnFace
            TabOrder = 3
          end
          object UniLabel12: TUniLabel
            Left = 10
            Top = 43
            Width = 48
            Height = 15
            Hint = ''
            Caption = 'Option 2'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 4
          end
          object UniLabel13: TUniLabel
            Left = 81
            Top = 66
            Width = 33
            Height = 20
            Hint = '[[bsswt:0 *]]'
            TextConversion = txtHTML
            AutoSize = False
            Caption = 'Opt3'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsUnderline]
            ParentColor = False
            Color = clBtnFace
            TabOrder = 5
          end
          object UniLabel14: TUniLabel
            Left = 12
            Top = 71
            Width = 48
            Height = 15
            Hint = ''
            Caption = 'Option 3'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 6
          end
          object UniLabel15: TUniLabel
            Left = 10
            Top = 120
            Width = 20
            Height = 20
            Hint = '[[bschk:1]]'
            TextConversion = txtHTML
            AutoSize = False
            Caption = 'Active'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsUnderline]
            ParentColor = False
            Color = clBtnFace
            TabOrder = 7
          end
          object UniLabel16: TUniLabel
            Left = 36
            Top = 123
            Width = 34
            Height = 15
            Hint = ''
            Caption = 'Active'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 8
          end
          object UniLabel17: TUniLabel
            Left = 10
            Top = 142
            Width = 20
            Height = 20
            Hint = '[[bschk:0]]'
            TextConversion = txtHTML
            AutoSize = False
            Caption = 'Active'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsUnderline]
            ParentColor = False
            Color = clBtnFace
            TabOrder = 9
          end
          object UniLabel18: TUniLabel
            Left = 36
            Top = 145
            Width = 42
            Height = 15
            Hint = ''
            Caption = 'Inactive'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 10
          end
        end
      end
    end
    object rcBlock70: TUniContainerPanel
      Tag = 1
      AlignWithMargins = True
      Left = 223
      Top = 405
      Width = 184
      Height = 246
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-4| '#13#10'round:no | '#13#10'cls:card-info-box-whit' +
        'e'#13#10']]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      ParentAlignmentControl = False
      TabOrder = 5
      DesignSize = (
        184
        246)
      object UniContainerPanel4: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 184
        Height = 42
        Hint = '[[round:t | cls:card-light]]'
        ParentColor = False
        Color = clSilver
        Align = alTop
        TabOrder = 1
        object UniLabel19: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 0
          Width = 178
          Height = 42
          Hint = '[[bsh5:|cls:left-center]]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AutoSize = False
          Caption = 'bsrgp'
          Align = alClient
          ParentFont = False
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object UniContainerPanel5: TUniContainerPanel
        Left = 6
        Top = 64
        Width = 174
        Height = 171
        Hint = ''
        ParentColor = False
        Anchors = []
        TabOrder = 2
        DesignSize = (
          174
          171)
        object bsrgpTipo01_M: TUniLabel
          Tag = 1
          Left = 11
          Top = 11
          Width = 20
          Height = 20
          Hint = ''
          TextConversion = txtHTML
          AutoSize = False
          Caption = 'Opt1'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsUnderline]
          ParentColor = False
          Color = clBtnFace
          TabOrder = 1
        end
        object UniLabel20: TUniLabel
          Left = 37
          Top = 14
          Width = 105
          Height = 15
          Hint = ''
          Caption = 'Option 1( value M )'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          TabOrder = 2
        end
        object bsrgpTipo02_E: TUniLabel
          Left = 11
          Top = 34
          Width = 20
          Height = 20
          Hint = ''
          TextConversion = txtHTML
          AutoSize = False
          Caption = 'Opt2'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsUnderline]
          ParentColor = False
          Color = clBtnFace
          TabOrder = 3
        end
        object UniLabel21: TUniLabel
          Left = 37
          Top = 37
          Width = 100
          Height = 15
          Hint = ''
          Caption = 'Option 2( value E )'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          TabOrder = 4
        end
        object bsrgpTipo03_F: TUniLabel
          Left = 11
          Top = 59
          Width = 20
          Height = 20
          Hint = ''
          TextConversion = txtHTML
          AutoSize = False
          Caption = 'Opt3'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsUnderline]
          ParentColor = False
          Color = clBtnFace
          TabOrder = 5
        end
        object UniLabel22: TUniLabel
          Left = 37
          Top = 62
          Width = 100
          Height = 15
          Hint = ''
          Caption = 'Option 3( value F )'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          TabOrder = 6
        end
        object btnGetIndex: TUniBitBtn
          AlignWithMargins = True
          Left = 5
          Top = 123
          Width = 75
          Height = 36
          Hint = '[['#13#10'cls:ButtonThemeCrud | '#13#10'pos-l:10 | '#13#10'pos-b:46'#13#10']]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Get Index'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 7
          OnClick = btnGetIndexClick
        end
        object btnGetValue: TUniBitBtn
          AlignWithMargins = True
          Left = 85
          Top = 127
          Width = 75
          Height = 36
          Hint = '[['#13#10'cls:ButtonThemeCrud | '#13#10'align:btnGetIndex t:0 r:10'#13#10']]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Get Value'
          Anchors = []
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 8
          OnClick = btnGetValueClick
        end
      end
    end
    object rcBlock76: TUniContainerPanel
      Tag = 1
      AlignWithMargins = True
      Left = 421
      Top = 405
      Width = 310
      Height = 246
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-4 | '#13#10'round:no | '#13#10'cls:card-info-box-whi' +
        'te'#13#10']]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 6
      object UniContainerPanel6: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 310
        Height = 42
        Hint = '[[round:t | cls:card-light]]'
        ParentColor = False
        Color = clSilver
        Align = alTop
        TabOrder = 1
        object UniLabel23: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 0
          Width = 304
          Height = 42
          Hint = '[[bsh5:|cls:left-center]]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AutoSize = False
          Caption = 'Open Form Dynamically'
          Align = alClient
          ParentFont = False
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object btnInsertNew: TUniBitBtn
        AlignWithMargins = True
        Left = 170
        Top = 134
        Width = 82
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineRed | '#13#10'center:parent x:90 y:' +
          '60'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Insert New'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
        OnClick = btnInsertNewClick
      end
      object btnShowFishFact: TUniBitBtn
        AlignWithMargins = True
        Left = 34
        Top = 53
        Width = 82
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineGreen | '#13#10'center:parent x:-90' +
          ' y:-30'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'FISHFACTS'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 3
        OnClick = btnShowFishFactClick
      end
      object btnShowCustomer: TUniBitBtn
        AlignWithMargins = True
        Left = 155
        Top = 54
        Width = 82
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineBlue | '#13#10'center:parent x:90 y' +
          ':-30'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Show "569"'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 4
        OnClick = btnShowCustomerClick
      end
      object btnEditCustomer: TUniBitBtn
        AlignWithMargins = True
        Left = 44
        Top = 139
        Width = 82
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineOrange | '#13#10'center:parent x:-9' +
          '0 y:60'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Edit "569"'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 5
        OnClick = btnEditCustomerClick
      end
      object btnInsideBlock: TUniBitBtn
        AlignWithMargins = True
        Left = 44
        Top = 183
        Width = 172
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineOrange | '#13#10'align:btnEditCusto' +
          'mer t:h+9 l:0 |'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'FISHFACTS inside a BLOCK'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 6
        OnClick = btnInsideBlockClick
      end
    end
    object rcBlock151: TUniContainerPanel
      Left = 661
      Top = 687
      Width = 321
      Height = 150
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-12 |'#13#10'round:no | '#13#10'cls:card-info-box-whi' +
        'te |'#13#10'hr:198 mobile-v-150 mobile-h-150 |'#13#10']]'
      ParentColor = False
      Color = clInfoBk
      TabOrder = 7
      object rcBlock157: TUniContainerPanel
        Left = 64
        Top = 0
        Width = 253
        Height = 150
        Hint = '[['#13#10'cols:xs-10 sm-10 md-12 |'#13#10'noborder-all'#13#10']]'
        ParentColor = False
        TabOrder = 1
      end
      object rcBlock152: TUniContainerPanel
        Left = 8
        Top = 0
        Width = 44
        Height = 150
        Hint = 
          '[['#13#10'cols:xs-2 sm-2 md-12 |'#13#10'noborder-all |'#13#10'hr:48 mobile-v-150 m' +
          'obile-h-150 |'#13#10'width:mobile-50  |'#13#10']]'#13#10#13#10
        ParentColor = False
        Color = 5354999
        TabOrder = 2
        object rcBlock154: TUniContainerPanel
          Left = 5
          Top = 19
          Width = 30
          Height = 30
          Hint = 
            '[['#13#10'cols:xs-12 sm-12 md-2 |'#13#10'hr:32 mobile-v-36 mobile-h-36 |'#13#10'wi' +
            'dth:36 mobile-36 |'#13#10'noborder-top:mobile|'#13#10'noborder-left |'#13#10'cente' +
            'r:parent y-mobile-x |'#13#10']]'#13#10#13#10
          ParentColor = False
          TabOrder = 1
          object UUUniBitBtn1Clone170: TUniBitBtn
            AlignWithMargins = True
            Left = 0
            Top = 0
            Width = 30
            Height = 30
            Hint = 
              '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-plus | '#13#10'cls-ico:font-black |'#13#10'ce' +
              'nter:parent xy'#13#10']]'
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
          end
        end
        object rcBlock155: TUniContainerPanel
          Left = 5
          Top = 60
          Width = 30
          Height = 30
          Hint = 
            '[['#13#10'cols:xs-12 sm-12 md-2 |'#13#10'hr:32 mobile-v-36 mobile-h-36 |'#13#10'wi' +
            'dth:36 mobile-36 |'#13#10'noborder-top:mobile |'#13#10'noborder-left |'#13#10'cent' +
            'er:parent y-mobile-x |'#13#10']]'#13#10
          ParentColor = False
          TabOrder = 2
          object UUUniBitBtn2Clone190: TUniBitBtn
            AlignWithMargins = True
            Left = 0
            Top = 0
            Width = 30
            Height = 30
            Hint = 
              '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-pencil-alt | '#13#10'cls-ico:font-black' +
              '|'#13#10'center:parent xy'#13#10']]'
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = '!'
            ParentFont = False
            Font.Height = -19
            Font.Name = 'Calibri'
            TabOrder = 1
            ScaleButton = False
          end
        end
        object rcBlock156: TUniContainerPanel
          Left = 5
          Top = 100
          Width = 30
          Height = 30
          Hint = 
            '[['#13#10'cols:xs-12 sm-12 md-2 |'#13#10'hr:32 mobile-v-36 mobile-h-36 |'#13#10'wi' +
            'dth:36 mobile-36 |'#13#10'noborder-top:mobile |'#13#10'noborder-left |'#13#10'cent' +
            'er:parent y-mobile-x |'#13#10']]'#13#10
          ParentColor = False
          TabOrder = 3
          object UUUniBitBtn3Clone210: TUniBitBtn
            AlignWithMargins = True
            Left = 0
            Top = 0
            Width = 30
            Height = 30
            Hint = 
              '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-trash-alt | '#13#10'cls-ico:font-black' +
              '|'#13#10'center:parent xy'#13#10']]'
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 0
            Caption = '#'
            ParentFont = False
            Font.Height = -19
            Font.Name = 'Calibri'
            TabOrder = 1
            ScaleButton = False
          end
        end
        object rcBlock153: TUniContainerPanel
          Left = 8
          Top = 7
          Width = 32
          Height = 7
          Hint = '[['#13#10'cols:xs-12 sm-12 md-2 |'#13#10'noborder-all |'#13#10'width:6'#13#10']]'#13#10
          ParentColor = False
          TabOrder = 4
        end
      end
    end
    object rcBlock144: TUniContainerPanel
      Left = 334
      Top = 687
      Width = 321
      Height = 150
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-12 |'#13#10'round:no | '#13#10'cls:card-info-box-whi' +
        'te |'#13#10'hr:150 mobile-v-198 mobile-h-198 |'#13#10']]'
      ParentColor = False
      Color = clInfoBk
      TabOrder = 8
      object rcBlock150: TUniContainerPanel
        Left = 65
        Top = 0
        Width = 253
        Height = 150
        Hint = '[['#13#10'cols:xs-12 sm-12 md-11 |'#13#10'noborder-all'#13#10']]'
        ParentColor = False
        TabOrder = 1
      end
      object rcBlock145: TUniContainerPanel
        Left = 8
        Top = 0
        Width = 44
        Height = 150
        Hint = 
          '[['#13#10'cols:xs-12 sm-12 md-1 |'#13#10'noborder-all |'#13#10'hr:150 mobile-v-48 ' +
          'mobile-h-48 |'#13#10'width:50  |'#13#10']]'
        ParentColor = False
        Color = 5354999
        TabOrder = 2
        object rcBlock147: TUniContainerPanel
          Left = 5
          Top = 19
          Width = 30
          Height = 30
          Hint = 
            '[['#13#10'cols:xs-2 sm-2 md-12 |'#13#10'hr:36 mobile-v-32 mobile-h-32 |'#13#10'wid' +
            'th:36 mobile-36 |'#13#10'noborder-top |'#13#10'noborder-left |'#13#10'center:paren' +
            't x-mobile-y |'#13#10']]'#13#10#13#10
          ParentColor = False
          TabOrder = 1
          object UUUniBitBtn1: TUniBitBtn
            AlignWithMargins = True
            Left = 0
            Top = 0
            Width = 30
            Height = 30
            Hint = 
              '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-plus | '#13#10'cls-ico:font-black |'#13#10'ce' +
              'nter:parent xy'#13#10']]'
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
          end
        end
        object rcBlock148: TUniContainerPanel
          Left = 5
          Top = 60
          Width = 30
          Height = 30
          Hint = 
            '[['#13#10'cols:xs-2 sm-2 md-12 |'#13#10'hr:36 mobile-v-32 mobile-h-32 |'#13#10'wid' +
            'th:36 mobile-36 |'#13#10'noborder-top |'#13#10'noborder-left |'#13#10'center:paren' +
            't x-mobile-y'#13#10']]'#13#10
          ParentColor = False
          TabOrder = 2
          object UUUniBitBtn2: TUniBitBtn
            AlignWithMargins = True
            Left = 0
            Top = 0
            Width = 30
            Height = 30
            Hint = 
              '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-pencil-alt | '#13#10'cls-ico:font-black' +
              '|'#13#10'center:parent xy'#13#10']]'
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = '!'
            ParentFont = False
            Font.Height = -19
            Font.Name = 'Calibri'
            TabOrder = 1
            ScaleButton = False
          end
        end
        object rcBlock149: TUniContainerPanel
          Left = 5
          Top = 100
          Width = 30
          Height = 30
          Hint = 
            '[['#13#10'cols:xs-2 sm-2 md-12 |'#13#10'hr:36 mobile-v-32 mobile-h-32 |'#13#10'wid' +
            'th:36 mobile-36 |'#13#10'noborder-top |'#13#10'noborder-left |'#13#10'center:paren' +
            't x-mobile-y'#13#10']]'
          ParentColor = False
          TabOrder = 3
          object UUUniBitBtn3: TUniBitBtn
            AlignWithMargins = True
            Left = 0
            Top = 0
            Width = 30
            Height = 30
            Hint = 
              '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-trash-alt | '#13#10'cls-ico:font-black' +
              '|'#13#10'center:parent xy'#13#10']]'
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 0
            Caption = '#'
            ParentFont = False
            Font.Height = -19
            Font.Name = 'Calibri'
            TabOrder = 1
            ScaleButton = False
          end
        end
        object rcBlock146: TUniContainerPanel
          Left = 11
          Top = 7
          Width = 32
          Height = 7
          Hint = '[['#13#10'cols:xs-1 sm-1 md-12 |'#13#10'noborder-all |'#13#10'width:mobile-6'#13#10']]'#13#10
          ParentColor = False
          TabOrder = 4
        end
      end
    end
    object rcBlock132: TUniContainerPanel
      Left = 7
      Top = 687
      Width = 321
      Height = 150
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-12 |'#13#10'round:no | '#13#10'cls:card-info-box-whi' +
        'te |'#13#10'hr:150 mobile-v-198 mobile-h-198 |'#13#10']]'
      ParentColor = False
      Color = clInfoBk
      TabOrder = 9
      object rcBlock133: TUniContainerPanel
        Left = 3
        Top = 0
        Width = 253
        Height = 150
        Hint = '[['#13#10'cols:xs-12 sm-12 md-11 |'#13#10'noborder-all'#13#10']]'
        ParentColor = False
        TabOrder = 1
        object rcBlock134: TUniContainerPanel
          Tag = 1
          Left = 14
          Top = 16
          Width = 70
          Height = 48
          Hint = '[[cols:xs-6 sm-6 md-2 ]]'
          ParentColor = False
          TabOrder = 1
          DesignSize = (
            70
            48)
          object UUUniDBEdit1: TUniDBEdit
            Left = 0
            Top = 18
            Width = 70
            Height = 29
            Hint = ''
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Font.Color = clWhite
            Font.Style = [fsBold]
            TabOrder = 1
            Color = clGray
            ReadOnly = True
          end
          object UUUniLabel5: TUniLabel
            Left = 0
            Top = 0
            Width = 13
            Height = 13
            Hint = ''
            Caption = 'ID'
            ParentFont = False
            Font.Style = [fsBold]
            TabOrder = 2
          end
        end
        object rcBlock135: TUniContainerPanel
          Tag = 1
          Left = 97
          Top = 16
          Width = 70
          Height = 48
          Hint = '[[cols:xs-6 sm-6 md-2 ]]'#13#10
          ParentColor = False
          TabOrder = 2
          DesignSize = (
            70
            48)
          object UUUniLabel6: TUniLabel
            Left = 0
            Top = 0
            Width = 36
            Height = 13
            Hint = ''
            Caption = 'Field 1'
            ParentFont = False
            Font.Style = [fsBold]
            TabOrder = 1
          end
          object UUUniDBDateTimePicker1: TUniDBDateTimePicker
            Left = 0
            Top = 18
            Width = 70
            Height = 29
            Hint = ''
            DateTime = 43596.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
          end
        end
        object rcBlock136: TUniContainerPanel
          Tag = 1
          Left = 171
          Top = 15
          Width = 70
          Height = 48
          Hint = '[['#13#10'cols:xs-0 sm-0 md-8 |'#13#10']]'
          ParentColor = False
          TabOrder = 3
        end
        object rcBlock137: TUniContainerPanel
          Tag = 1
          Left = 15
          Top = 84
          Width = 70
          Height = 48
          Hint = '[[cols:xs-12 sm-12 md-6 ]]'
          ParentColor = False
          TabOrder = 4
          DesignSize = (
            70
            48)
          object UUUniLabel7: TUniLabel
            Left = 0
            Top = 0
            Width = 36
            Height = 13
            Hint = ''
            Caption = 'Field 4'
            ParentFont = False
            Font.Style = [fsBold]
            TabOrder = 1
          end
          object UUUniDBEdit2: TUniDBEdit
            Left = 0
            Top = 18
            Width = 70
            Height = 29
            Hint = ''
            CharCase = ecUpperCase
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
            InputMask.Mask = '99.999.999/9999-99'
          end
        end
      end
      object rcBlock138: TUniContainerPanel
        Left = 270
        Top = 0
        Width = 44
        Height = 150
        Hint = 
          '[['#13#10'cols:xs-12 sm-12 md-1 |'#13#10'noborder-all |'#13#10'hr:150 mobile-v-48 ' +
          'mobile-h-48 |'#13#10'width:50  |'#13#10']]'
        ParentColor = False
        Color = 5354999
        TabOrder = 2
        object rcBlock140: TUniContainerPanel
          Left = 5
          Top = 25
          Width = 32
          Height = 32
          Hint = 
            '[['#13#10'cols:xs-2 sm-2 md-12 |'#13#10'hr:36 mobile-v-32 mobile-h-32 |'#13#10'wid' +
            'th:36 mobile-36 |'#13#10'noborder-top |'#13#10'noborder-left|'#13#10'center:parent' +
            ' x-mobile-y |'#13#10']]'
          ParentColor = False
          TabOrder = 1
          object bbbtnNewReg: TUniBitBtn
            AlignWithMargins = True
            Left = 0
            Top = 2
            Width = 30
            Height = 30
            Hint = 
              '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-plus | '#13#10'cls-ico:font-black |'#13#10'ce' +
              'nter:parent xy'#13#10']]'
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
          end
        end
        object rcBlock141: TUniContainerPanel
          Left = 5
          Top = 64
          Width = 32
          Height = 32
          Hint = 
            '[['#13#10'cols:xs-2 sm-2 md-12 |'#13#10'hr:36 mobile-v-32 mobile-h-32 |'#13#10'wid' +
            'th:36 mobile-36 |'#13#10'noborder-top |'#13#10'noborder-left:mobile |'#13#10'cente' +
            'r:parent x-mobile-y'#13#10']]'
          ParentColor = False
          TabOrder = 2
          object bbbtnEditReg: TUniBitBtn
            AlignWithMargins = True
            Left = 0
            Top = 0
            Width = 30
            Height = 30
            Hint = 
              '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-pencil-alt | '#13#10'cls-ico:font-black' +
              '|'#13#10'center:parent xy'#13#10']]'
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = '!'
            ParentFont = False
            Font.Height = -19
            Font.Name = 'Calibri'
            TabOrder = 1
            ScaleButton = False
          end
        end
        object rcBlock142: TUniContainerPanel
          Left = 5
          Top = 104
          Width = 32
          Height = 32
          Hint = 
            '[['#13#10'cols:xs-2 sm-2 md-12 |'#13#10'hr:36 mobile-v-32 mobile-h-32 |'#13#10'wid' +
            'th:36 mobile-36 |'#13#10'noborder-top |'#13#10'noborder-left:mobile |'#13#10'cente' +
            'r:parent x-mobile-y'#13#10']]'
          ParentColor = False
          TabOrder = 3
          object bbbtnDeleteReg: TUniBitBtn
            AlignWithMargins = True
            Left = 0
            Top = 0
            Width = 30
            Height = 30
            Hint = 
              '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-trash-alt | '#13#10'cls-ico:font-black' +
              '|'#13#10'center:parent xy'#13#10']]'
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 0
            Caption = '#'
            ParentFont = False
            Font.Height = -19
            Font.Name = 'Calibri'
            TabOrder = 1
            ScaleButton = False
          end
        end
        object rcBlock139: TUniContainerPanel
          Left = 9
          Top = 5
          Width = 32
          Height = 7
          Hint = '[['#13#10'cols:xs-1 sm-1 md-12 |'#13#10'noborder-all |'#13#10'width:mobile-6'#13#10']]'#13#10
          ParentColor = False
          TabOrder = 4
        end
      end
    end
    object rcBlock158: TUniContainerPanel
      Left = 18
      Top = 847
      Width = 321
      Height = 150
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-12 |'#13#10'round:no | '#13#10'cls:card-info-box-whi' +
        'te |'#13#10'hr:198 mobile-v-150 mobile-h-150 |'#13#10']]'
      ParentColor = False
      Color = clInfoBk
      TabOrder = 10
      object rcBlock164: TUniContainerPanel
        Left = 65
        Top = 0
        Width = 253
        Height = 150
        Hint = '[['#13#10'cols:xs-10 sm-10 md-12 |'#13#10'noborder-all'#13#10']]'
        ParentColor = False
        TabOrder = 1
      end
      object rcBlock159: TUniContainerPanel
        Left = 8
        Top = 0
        Width = 44
        Height = 150
        Hint = 
          '[['#13#10'cols:xs-2 sm-2 md-12 |'#13#10'noborder-all |'#13#10'hr:48 mobile-v-150 m' +
          'obile-h-150 |'#13#10'width:mobile-50  |'#13#10']]'#13#10#13#10
        ParentColor = False
        Color = 4737096
        TabOrder = 2
        object rcBlock161: TUniContainerPanel
          Left = 5
          Top = 19
          Width = 30
          Height = 30
          Hint = 
            '[['#13#10'cols:xs-12 sm-12 md-2 |'#13#10'hr:32 mobile-v-36 mobile-h-36 |'#13#10'wi' +
            'dth:90 mobile-32 |'#13#10'noborder-top:mobile|'#13#10'noborder-left |'#13#10'cente' +
            'r:parent y-mobile-x |'#13#10']]'#13#10#13#10
          ParentColor = False
          TabOrder = 1
          DesignSize = (
            30
            30)
          object UUUUniBitBtn1Clone170: TUniBitBtn
            AlignWithMargins = True
            Left = 0
            Top = 0
            Width = 30
            Height = 30
            Hint = 
              '[['#13#10'cls:ButtonBlue |'#13#10'ico:fas-plus | '#13#10'append |'#13#10'center:parent x' +
              'y |'#13#10'caption-hide:mobile'#13#10']]'
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'New'
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Font.Height = -16
            Font.Name = 'Calibri'
            TabOrder = 1
            ScaleButton = False
          end
        end
        object rcBlock162: TUniContainerPanel
          Left = 5
          Top = 60
          Width = 30
          Height = 30
          Hint = 
            '[['#13#10'cols:xs-12 sm-12 md-2 |'#13#10'hr:32 mobile-v-36 mobile-h-36 |'#13#10'wi' +
            'dth:90 mobile-32 |'#13#10'noborder-top:mobile |'#13#10'center:parent y-mobil' +
            'e-x |'#13#10']]'#13#10
          ParentColor = False
          TabOrder = 2
          DesignSize = (
            30
            30)
          object UUUUniBitBtn2Clone190: TUniBitBtn
            AlignWithMargins = True
            Left = 0
            Top = 0
            Width = 30
            Height = 30
            Hint = 
              '[['#13#10'cls:ButtonBlue|'#13#10'ico:fas-pencil-alt |'#13#10'append | '#13#10'center:par' +
              'ent xy |'#13#10'caption-hide:mobile'#13#10']]'
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'Edit'
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Font.Height = -16
            Font.Name = 'Calibri'
            TabOrder = 1
            ScaleButton = False
          end
        end
        object rcBlock163: TUniContainerPanel
          Left = 5
          Top = 100
          Width = 30
          Height = 30
          Hint = 
            '[['#13#10'cols:xs-12 sm-12 md-2 |'#13#10'hr:32 mobile-v-36 mobile-h-36 |'#13#10'wi' +
            'dth:90 mobile-32 |'#13#10'noborder-top:mobile |'#13#10'center:parent y-mobil' +
            'e-x |'#13#10']]'#13#10
          ParentColor = False
          TabOrder = 3
          DesignSize = (
            30
            30)
          object UUUUniBitBtn3Clone210: TUniBitBtn
            AlignWithMargins = True
            Left = 0
            Top = 0
            Width = 30
            Height = 30
            Hint = 
              '[['#13#10'cls:ButtonBlue | '#13#10'ico:fas-trash-alt | '#13#10'append |'#13#10'center:pa' +
              'rent xy |'#13#10'caption-hide:mobile'#13#10']]'
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 0
            Caption = 'Cancel'
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Font.Height = -16
            Font.Name = 'Calibri'
            TabOrder = 1
            ScaleButton = False
          end
        end
        object rcBlock160: TUniContainerPanel
          Left = 8
          Top = 7
          Width = 32
          Height = 7
          Hint = '[['#13#10'cols:xs-12 sm-12 md-2 |'#13#10'noborder-all |'#13#10'width:12 |'#13#10']]'
          ParentColor = False
          TabOrder = 4
        end
      end
    end
    object rcBlock390: TUniContainerPanel
      Tag = 4
      Left = 24
      Top = 1016
      Width = 729
      Height = 43
      Hint = '[[cols:12 | round:all]]'
      ParentColor = False
      TabOrder = 11
    end
    object rcBlock46: TUniContainerPanel
      Tag = 1
      AlignWithMargins = True
      Left = 574
      Top = 98
      Width = 349
      Height = 284
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-5 | '#13#10'hr-childs:xs-exp sm-exp md-fix(mob' +
        'ile-exp) | '#13#10'round:no | '#13#10'cls:card-info-box-white |'#13#10']]'#13#10#13#10
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 12
      object rcBlock48: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 349
        Height = 42
        Hint = 
          '[['#13#10'cols:12 |'#13#10'noborder-top | '#13#10'noborder-left | '#13#10'round:t | '#13#10'cl' +
          's:card-light |'#13#10']]'
        ParentColor = False
        Color = clSilver
        Align = alTop
        TabOrder = 1
        object UniLabel4: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 0
          Width = 343
          Height = 42
          Hint = '[['#13#10'bsh5:|cls:left-center'#13#10']]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AutoSize = False
          Caption = '"In Line" Form Responsive'
          Align = alClient
          ParentFont = False
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object rcBlock50: TUniContainerPanel
        Tag = 1
        Left = 12
        Top = 51
        Width = 91
        Height = 32
        Hint = 
          '[['#13#10'cols:xs-12 sm-12 md-2 |'#13#10'noborder-bottom |'#13#10'noborder-top:mob' +
          'ile |'#13#10']]'
        ParentColor = False
        TabOrder = 2
        DesignSize = (
          91
          32)
        object rcLabel3600: TUniLabel
          Left = 1
          Top = 13
          Width = 30
          Height = 14
          Hint = 
            '[['#13#10'scale:parent w:100% off:4 mobile-off |'#13#10'alignment:right mobi' +
            'le-left '#13#10']]'#13#10
          AutoSize = False
          Caption = 'Date'
          Anchors = [akLeft, akBottom]
          ParentFont = False
          Font.Height = -12
          TabOrder = 1
        end
      end
      object rcBlock52: TUniContainerPanel
        Tag = 1
        Left = 114
        Top = 51
        Width = 111
        Height = 32
        Hint = '[['#13#10'cols:xs-12 sm-12 md-10 |'#13#10'noborder-top |'#13#10']]'
        ParentColor = False
        TabOrder = 3
        DesignSize = (
          111
          32)
        object UniDateTimePicker1: TUniDateTimePicker
          Left = 0
          Top = 1
          Width = 110
          Height = 30
          Hint = '[['#13#10'mask:date'#13#10']]'
          DateTime = 44599.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
      end
      object rcBlock58: TUniContainerPanel
        Tag = 1
        Left = 14
        Top = 139
        Width = 91
        Height = 32
        Hint = 
          '[['#13#10'cols:xs-12 sm-12 md-2 |'#13#10'noborder-bottom |'#13#10'noborder-top:mob' +
          'ile |'#13#10']]'
        ParentColor = False
        TabOrder = 4
        DesignSize = (
          91
          32)
        object UniLabel5: TUniLabel
          Left = 1
          Top = 13
          Width = 30
          Height = 14
          Hint = 
            '[['#13#10'scale:parent w:100% off:4 mobile-off |'#13#10'alignment:right mobi' +
            'le-left '#13#10']]'#13#10
          AutoSize = False
          Caption = 'Id'
          Anchors = [akLeft, akBottom]
          ParentFont = False
          Font.Height = -12
          TabOrder = 1
        end
      end
      object rcBlock60: TUniContainerPanel
        Tag = 1
        Left = 116
        Top = 139
        Width = 111
        Height = 32
        Hint = '[['#13#10'cols:xs-12 sm-12 md-10 |'#13#10'noborder-top |'#13#10']]'
        ParentColor = False
        TabOrder = 5
        DesignSize = (
          111
          32)
        object edID: TUniEdit
          Left = 0
          Top = 1
          Width = 110
          Height = 30
          Hint = '[['#13#10'mask:99.99 |'#13#10'valid:min-4|'#13#10']]'#13#10
          CharCase = ecUpperCase
          Text = ''
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
      end
      object rcBlock65: TUniContainerPanel
        Tag = 1
        Left = 14
        Top = 223
        Width = 91
        Height = 32
        Hint = 
          '[['#13#10'cols:xs-0 sm-0 md-2 |'#13#10'hr:xs-0 sm-0 md-2 |'#13#10'hide:mobile |'#13#10']' +
          ']'#13#10#13#10#13#10
        ParentColor = False
        TabOrder = 6
      end
      object rcBlock67: TUniContainerPanel
        Tag = 1
        Left = 116
        Top = 223
        Width = 111
        Height = 32
        Hint = '[['#13#10'cols:xs-6 sm-6 md-5 |'#13#10']]'
        ParentColor = False
        TabOrder = 7
        DesignSize = (
          111
          32)
        object btnCancelForm: TUniBitBtn
          AlignWithMargins = True
          Left = 0
          Top = 1
          Width = 110
          Height = 30
          Hint = '[['#13#10'ico:fas-times | '#13#10'cls:ButtonRed | '#13#10'append '#13#10']]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Remove Mask'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
          OnClick = btnCancelFormClick
        end
      end
      object rcBlock69: TUniContainerPanel
        Tag = 1
        Left = 233
        Top = 223
        Width = 111
        Height = 32
        Hint = '[['#13#10'cols:xs-6 sm-6 md-5 |'#13#10']]'
        ParentColor = False
        TabOrder = 8
        DesignSize = (
          111
          32)
        object btnSaveFormValidate: TUniBitBtn
          AlignWithMargins = True
          Left = 0
          Top = 1
          Width = 110
          Height = 30
          Hint = '[['#13#10'ico:fas-save | '#13#10'cls:ButtonGreen | '#13#10'append'#13#10']]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Save'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
          ClientEvents.UniEvents.Strings = (
            'ajaxRequest=function ajaxRequest(sender, url, data)'#13#10'{'#13#10#13#10'}')
          OnClick = btnSaveFormValidateClick
        end
      end
      object rcBlock54: TUniContainerPanel
        Tag = 1
        Left = 12
        Top = 93
        Width = 91
        Height = 32
        Hint = 
          '[['#13#10'cols:xs-12 sm-12 md-2 |'#13#10'noborder-bottom |'#13#10'noborder-top:mob' +
          'ile |'#13#10']]'
        ParentColor = False
        TabOrder = 9
        DesignSize = (
          91
          32)
        object UniLabel6: TUniLabel
          Left = 1
          Top = 13
          Width = 30
          Height = 14
          Hint = 
            '[['#13#10'scale:parent w:100% off:4 mobile-off |'#13#10'alignment:right mobi' +
            'le-left '#13#10']]'#13#10
          AutoSize = False
          Caption = 'Phone'
          Anchors = [akLeft, akBottom]
          ParentFont = False
          Font.Height = -12
          TabOrder = 1
        end
      end
      object rcBlock56: TUniContainerPanel
        Tag = 1
        Left = 114
        Top = 93
        Width = 111
        Height = 32
        Hint = '[['#13#10'cols:xs-12 sm-12 md-10 |'#13#10'noborder-top |'#13#10']]'
        ParentColor = False
        TabOrder = 10
        DesignSize = (
          111
          32)
        object UniEdit2: TUniEdit
          Left = 0
          Top = 1
          Width = 110
          Height = 30
          Hint = '[['#13#10'mask:phoneddd |'#13#10'dial:'#13#10']]'#13#10
          CharCase = ecUpperCase
          Text = ''
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
      end
      object rcBlock63: TUniContainerPanel
        Tag = 1
        Left = 14
        Top = 181
        Width = 91
        Height = 32
        Hint = 
          '[['#13#10'cols:xs-12 sm-12 md-2 |'#13#10'noborder-bottom |'#13#10'noborder-top:mob' +
          'ile |'#13#10']]'
        ParentColor = False
        TabOrder = 11
        DesignSize = (
          91
          32)
        object UniLabel7: TUniLabel
          Left = 1
          Top = 13
          Width = 30
          Height = 14
          Hint = 
            '[['#13#10'scale:parent w:100% off:4 mobile-off |'#13#10'alignment:right mobi' +
            'le-left '#13#10']]'#13#10
          AutoSize = False
          Caption = 'Site'
          Anchors = [akLeft, akBottom]
          ParentFont = False
          Font.Height = -12
          TabOrder = 1
        end
      end
      object rcBlock64: TUniContainerPanel
        Tag = 1
        Left = 116
        Top = 181
        Width = 111
        Height = 32
        Hint = '[['#13#10'cols:xs-12 sm-12 md-10 |'#13#10'noborder-top |'#13#10']]'
        ParentColor = False
        TabOrder = 12
        DesignSize = (
          111
          32)
        object edSite: TUniEdit
          Left = 0
          Top = 1
          Width = 110
          Height = 30
          Hint = 
            '[['#13#10'valid:blank=Site |'#13#10'valid-required:bottom-in |'#13#10'link: |'#13#10']]'#13 +
            #10#13#10
          Text = ''
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
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
