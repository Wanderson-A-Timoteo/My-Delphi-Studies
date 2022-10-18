inherited frmInputBox: TfrmInputBox
  Caption = 'frmInputBox'
  PixelsPerInch = 96
  TextHeight = 13
  object UniScrollBox1: TUniScrollBox [0]
    Left = 0
    Top = 0
    Width = 360
    Height = 360
    Hint = ''
    Align = alClient
    TabOrder = 0
    DesignSize = (
      358
      358)
    ScrollHeight = 301
    ScrollWidth = 334
    object rcBlock4: TUniContainerPanel
      Tag = 1
      Left = 16
      Top = 111
      Width = 294
      Height = 43
      Hint = '[[cols:xs-12 sm-12 md-12|noborder-top]]'
      ParentColor = False
      TabOrder = 0
      DesignSize = (
        294
        43)
      object labTitleForm: TUniLabel
        AlignWithMargins = True
        Left = 0
        Top = 3
        Width = 294
        Height = 33
        Hint = ''
        Margins.Left = 6
        Margins.Bottom = 8
        Alignment = taCenter
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Title'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Color = 4210752
        Font.Height = -32
        Font.Name = 'Calibri Light'
        ParentColor = False
        Color = clSilver
        TabOrder = 1
      end
    end
    object rcBlock6: TUniContainerPanel
      Tag = 1
      Left = 14
      Top = 155
      Width = 320
      Height = 146
      Hint = '[[cols:xs-12 sm-12 md-12|noborder-top]]'
      ParentColor = False
      TabOrder = 1
      DesignSize = (
        320
        146)
      object lab1: TUniLabel
        AlignWithMargins = True
        Left = 10
        Top = 25
        Width = 297
        Height = 17
        Hint = ''
        Margins.Left = 10
        Margins.Top = 15
        AutoSize = False
        Caption = 'Label 1'
        ParentFont = False
        Font.Height = -15
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object ed2: TUniEdit
        Left = 10
        Top = 111
        Width = 297
        Height = 34
        Hint = ''
        Margins.Left = 10
        Visible = False
        PasswordChar = '*'
        Text = ''
        ParentFont = False
        Font.Height = -13
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        EmptyText = 'senha'
      end
      object ed1: TUniEdit
        Left = 10
        Top = 46
        Width = 297
        Height = 34
        Hint = ''
        Margins.Left = 10
        Text = ''
        ParentFont = False
        Font.Height = -13
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
        EmptyText = 'usu'#225'rio'
      end
      object lab2: TUniLabel
        AlignWithMargins = True
        Left = 10
        Top = 90
        Width = 297
        Height = 17
        Hint = ''
        Margins.Left = 10
        Margins.Top = 15
        AutoSize = False
        Caption = 'Label 2'
        ParentFont = False
        Font.Height = -15
        Font.Name = 'Calibri'
        TabOrder = 4
      end
    end
    object btnNo: TUniBitBtn
      AlignWithMargins = True
      Left = 158
      Top = 310
      Width = 88
      Height = 34
      Hint = '[[cls:ButtonRed]]'
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Cancelar'
      Anchors = [akRight, akBottom]
      ParentFont = False
      Font.Height = -16
      Font.Name = 'Calibri'
      TabOrder = 2
      OnClick = btnNoClick
    end
    object btnOk: TUniBitBtn
      AlignWithMargins = True
      Left = 257
      Top = 310
      Width = 87
      Height = 34
      Hint = '[[cls:ButtonGreen]]'
      Margins.Top = 5
      Margins.Right = 9
      Margins.Bottom = 5
      Caption = 'Ok'
      Anchors = [akRight, akBottom]
      ParentFont = False
      Font.Height = -16
      Font.Name = 'Calibri'
      TabOrder = 3
      OnClick = btnOkClick
    end
    object rcBlock2: TUniContainerPanel
      Tag = 1
      Left = 16
      Top = 2
      Width = 294
      Height = 107
      Hint = '[[cols:xs-12 sm-12 md-12|noborder-all]]'
      ParentColor = False
      TabOrder = 4
      DesignSize = (
        294
        107)
      object imgTipo: TUniImage
        Left = 2
        Top = 12
        Width = 289
        Height = 92
        Hint = ''
        Margins.Top = 6
        Margins.Bottom = 0
        Center = True
        Anchors = [akLeft, akTop, akRight, akBottom]
      end
    end
  end
end
