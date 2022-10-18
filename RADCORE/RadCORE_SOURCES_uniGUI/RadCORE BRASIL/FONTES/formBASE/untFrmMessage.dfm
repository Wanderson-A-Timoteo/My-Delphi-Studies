inherited frmMessage: TfrmMessage
  Caption = 'frmMessage'
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
    ScrollHeight = 294
    ScrollWidth = 334
    object rcBlock2: TUniContainerPanel
      Tag = 1
      Left = 16
      Top = 2
      Width = 285
      Height = 107
      Hint = '[[cols:xs-12 sm-12 md-12|noborder-all]]'
      ParentColor = False
      TabOrder = 0
      object imgTipo: TUniImage
        Left = 56
        Top = 7
        Width = 94
        Height = 98
        Hint = '[[scale:parent w:100% | center:parent x ]]'
        Margins.Top = 6
        Margins.Bottom = 0
        Center = True
      end
    end
    object rcBlock4: TUniContainerPanel
      Tag = 1
      Left = 16
      Top = 115
      Width = 299
      Height = 43
      Hint = '[[cols:xs-12 sm-12 md-12|noborder-top]]'
      ParentColor = False
      TabOrder = 1
      DesignSize = (
        299
        43)
      object labTitleForm: TUniLabel
        AlignWithMargins = True
        Left = 2
        Top = 3
        Width = 297
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
    object rcBlock8: TUniContainerPanel
      Tag = 1
      Left = 14
      Top = 161
      Width = 320
      Height = 133
      Hint = '[[cols:xs-12 sm-12 md-12|noborder-top]]'
      ParentColor = False
      TabOrder = 2
      DesignSize = (
        320
        133)
      object memoMensagem: TUniHTMLFrame
        Left = 1
        Top = 12
        Width = 318
        Height = 120
        Hint = ''
        Margins.Left = 9
        Margins.Top = 5
        Margins.Right = 9
        Margins.Bottom = 10
        AutoScroll = True
        Anchors = [akLeft, akTop, akRight, akBottom]
        ScrollHeight = 120
        ScrollWidth = 318
      end
    end
    object btnTicket: TUniBitBtn
      AlignWithMargins = True
      Left = 14
      Top = 310
      Width = 93
      Height = 34
      Hint = '[[cls:ButtonDark]]'
      Margins.Left = 9
      Margins.Top = 5
      Margins.Bottom = 5
      Caption = 'Suporte'
      ModalResult = 2
      Anchors = [akLeft, akBottom]
      ParentFont = False
      Font.Height = -16
      Font.Name = 'Calibri'
      TabOrder = 3
      OnClick = btnTicketClick
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
      ModalResult = 2
      Anchors = [akRight, akBottom]
      ParentFont = False
      Font.Height = -16
      Font.Name = 'Calibri'
      TabOrder = 4
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
      ModalResult = 1
      Anchors = [akRight, akBottom]
      ParentFont = False
      Font.Height = -16
      Font.Name = 'Calibri'
      TabOrder = 5
      OnClick = btnOkClick
    end
  end
end
