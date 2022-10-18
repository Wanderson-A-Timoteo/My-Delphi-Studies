inherited frmMessage: TfrmMessage
  Hint = '[['#13#10'modal:|'#13#10']]'
  ClientHeight = 350
  Caption = 'frmMessage'
  ExplicitHeight = 350
  DesignSize = (
    360
    350)
  PixelsPerInch = 96
  TextHeight = 13
  inherited paBackground: TUniContainerPanel
    Top = 155
    Width = 350
    Height = 150
    Color = clWhite
    Anchors = [akLeft, akTop, akRight]
    ExplicitTop = 155
    ExplicitWidth = 350
    ExplicitHeight = 150
    DesignSize = (
      350
      150)
    ScrollHeight = 150
    ScrollWidth = 350
    object labMsg: TUniLabel
      Left = 9
      Top = 11
      Width = 329
      Height = 127
      Hint = ''
      Visible = False
      TextConversion = txtHTML
      AutoSize = False
      Caption = 'labMsg'
      Anchors = [akLeft, akTop, akRight, akBottom]
      ParentFont = False
      Font.Height = -16
      Font.Name = 'Calibri Light'
      TabOrder = 2
    end
    object memoMensagem: TUniHTMLFrame
      AlignWithMargins = True
      Left = 9
      Top = 9
      Width = 332
      Height = 131
      Hint = ''
      Margins.Left = 9
      Margins.Top = 5
      Margins.Right = 9
      Margins.Bottom = 10
      AutoScroll = True
      Anchors = [akLeft, akTop, akRight, akBottom]
      ScrollHeight = 131
      ScrollWidth = 332
    end
  end
  inherited paBaseTopTitle: TUniContainerPanel
    Top = 111
    Width = 350
    Height = 44
    Color = clWhite
    ExplicitTop = 111
    ExplicitWidth = 350
    ExplicitHeight = 44
    inherited labTitleForm: TUniLabel
      Left = 6
      Width = 341
      Height = 38
      Margins.Bottom = 3
      Alignment = taCenter
      Align = alClient
      Font.Color = 4210752
      Font.Height = -32
      Font.Style = [fsBold]
      ExplicitLeft = 6
      ExplicitWidth = 341
      ExplicitHeight = 38
    end
  end
  object paComandos: TUniContainerPanel [2]
    AlignWithMargins = True
    Left = 4
    Top = 305
    Width = 350
    Height = 40
    Hint = '[['#13#10'align:paBackground  t:h+150 l:0 |'#13#10']]'
    Margins.Left = 4
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 5
    ParentColor = False
    Color = clWhite
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 2
    DesignSize = (
      350
      40)
    object btnTicket: TUniBitBtn
      AlignWithMargins = True
      Left = 9
      Top = 5
      Width = 93
      Height = 30
      Hint = '[[cls:ButtonDark]]'
      Margins.Left = 9
      Margins.Top = 5
      Margins.Bottom = 5
      Caption = 'Suporte'
      ParentFont = False
      Font.Height = -16
      Font.Name = 'Calibri'
      TabOrder = 1
      OnClick = btnEncerraClick
    end
    object btnNo: TUniBitBtn
      AlignWithMargins = True
      Left = 156
      Top = 5
      Width = 88
      Height = 30
      Hint = '[[cls:ButtonRed]]'
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Cancelar'
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.Height = -16
      Font.Name = 'Calibri'
      TabOrder = 2
      OnClick = btnNoClick
    end
    object btnOk: TUniBitBtn
      AlignWithMargins = True
      Left = 260
      Top = 5
      Width = 87
      Height = 30
      Hint = '[[cls:ButtonGreen]]'
      Margins.Top = 5
      Margins.Right = 9
      Margins.Bottom = 5
      Caption = 'Ok'
      ParentFont = False
      Font.Height = -16
      Font.Name = 'Calibri'
      TabOrder = 3
      OnClick = btnOkClick
    end
  end
  object imgTipo: TUniImage [3]
    Left = 12
    Top = 10
    Width = 313
    Height = 93
    Hint = '[[center:parent x ]]'
    Margins.Top = 6
    Margins.Bottom = 0
    Center = True
  end
end
