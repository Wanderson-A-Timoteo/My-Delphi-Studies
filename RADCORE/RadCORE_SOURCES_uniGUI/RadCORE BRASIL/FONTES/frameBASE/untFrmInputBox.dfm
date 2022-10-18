inherited frmInputBox: TfrmInputBox
  Hint = '[['#13#10'modal:'#13#10']]'
  ClientHeight = 355
  ClientWidth = 355
  Caption = 'frmInputBox'
  ExplicitWidth = 355
  ExplicitHeight = 355
  PixelsPerInch = 96
  TextHeight = 13
  inherited paBackground: TUniContainerPanel
    Top = 156
    Width = 350
    Height = 149
    Color = clWhite
    ExplicitTop = 156
    ExplicitWidth = 350
    ExplicitHeight = 149
    ScrollHeight = 149
    ScrollWidth = 350
    object lab1: TUniLabel
      AlignWithMargins = True
      Left = 16
      Top = 25
      Width = 324
      Height = 17
      Hint = ''
      Margins.Left = 10
      Margins.Top = 15
      AutoSize = False
      Caption = 'Label 1'
      ParentFont = False
      Font.Height = -16
      Font.Name = 'Calibri'
      TabOrder = 3
    end
    object ed2: TUniEdit
      Left = 16
      Top = 116
      Width = 324
      Height = 30
      Hint = ''
      Margins.Left = 10
      Visible = False
      PasswordChar = '*'
      Text = ''
      ParentFont = False
      Font.Height = -13
      TabOrder = 1
      EmptyText = 'senha'
    end
    object ed1: TUniEdit
      Left = 16
      Top = 48
      Width = 324
      Height = 30
      Hint = ''
      Margins.Left = 10
      Text = ''
      ParentFont = False
      Font.Height = -13
      TabOrder = 0
      EmptyText = 'usu'#225'rio'
    end
    object lab2: TUniLabel
      AlignWithMargins = True
      Left = 16
      Top = 93
      Width = 324
      Height = 17
      Hint = ''
      Margins.Left = 10
      Margins.Top = 15
      AutoSize = False
      Caption = 'Label 2'
      ParentFont = False
      Font.Height = -16
      Font.Name = 'Calibri'
      TabOrder = 4
    end
  end
  inherited paBaseTopTitle: TUniContainerPanel
    Top = 106
    Width = 350
    Height = 44
    Hint = '[['#13#10'round:t'#13#10' ]]'
    Color = clWhite
    ExplicitTop = 106
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
      ExplicitWidth = 347
      ExplicitHeight = 38
    end
  end
  object paComandos: TUniContainerPanel [2]
    AlignWithMargins = True
    Left = 4
    Top = 315
    Width = 350
    Height = 33
    Hint = '[['#13#10'align:paBackground  t:h+150 l:0 |'#13#10']]'
    Margins.Left = 4
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 1
    ParentColor = False
    Color = clWhite
    TabOrder = 2
    DesignSize = (
      350
      33)
    object btnNo: TUniBitBtn
      AlignWithMargins = True
      Left = 150
      Top = 1
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
      TabOrder = 1
      OnClick = btnNoClick
      ExplicitLeft = 156
    end
    object btnOk: TUniBitBtn
      AlignWithMargins = True
      Left = 247
      Top = 1
      Width = 87
      Height = 30
      Hint = '[[cls:ButtonGreen]]'
      Margins.Top = 5
      Margins.Right = 16
      Margins.Bottom = 5
      Caption = 'Ok'
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.Height = -16
      Font.Name = 'Calibri'
      TabOrder = 2
      OnClick = btnOkClick
      ExplicitLeft = 253
    end
  end
  object imgTipo: TUniImage [3]
    Left = 46
    Top = 10
    Width = 277
    Height = 93
    Hint = '[[center:parent x]]'
    Margins.Top = 6
    Margins.Bottom = 0
    Center = True
  end
end
