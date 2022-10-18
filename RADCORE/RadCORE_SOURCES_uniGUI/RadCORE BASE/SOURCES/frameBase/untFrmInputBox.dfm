inherited frmInputBox: TfrmInputBox
  Hint = '[['#13#10'modal:'#13#10']]'
  ClientHeight = 363
  Caption = 'frmInputBox'
  ExplicitHeight = 363
  PixelsPerInch = 96
  TextHeight = 13
  inherited paBackground: TUniContainerPanel
    Top = 165
    Height = 157
    Color = clWhite
    ExplicitTop = 165
    ExplicitHeight = 157
    ScrollHeight = 157
    ScrollWidth = 356
    object lab1: TUniLabel
      AlignWithMargins = True
      Left = 16
      Top = 19
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
      Top = 104
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
      Top = 42
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
      Top = 81
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
    Top = 121
    Height = 44
    Color = clWhite
    ExplicitTop = 121
    ExplicitHeight = 44
    inherited labTitleForm: TUniLabel
      Width = 347
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
    Top = 322
    Width = 356
    Height = 40
    Hint = ''
    Margins.Left = 4
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 1
    ParentColor = False
    Color = clWhite
    Align = alBottom
    TabOrder = 2
    object btnNo: TUniBitBtn
      AlignWithMargins = True
      Left = 157
      Top = 5
      Width = 88
      Height = 30
      Hint = '[[cls:ButtonRed]]'
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Cancelar'
      Align = alRight
      ParentFont = False
      Font.Height = -16
      Font.Name = 'Calibri'
      TabOrder = 1
      OnClick = btnNoClick
    end
    object btnOk: TUniBitBtn
      AlignWithMargins = True
      Left = 253
      Top = 5
      Width = 87
      Height = 30
      Hint = '[[cls:ButtonGreen]]'
      Margins.Top = 5
      Margins.Right = 16
      Margins.Bottom = 5
      Caption = 'Ok'
      Align = alRight
      ParentFont = False
      Font.Height = -16
      Font.Name = 'Calibri'
      TabOrder = 2
      OnClick = btnOkClick
    end
  end
  object imgTipo: TUniImage [3]
    AlignWithMargins = True
    Left = 3
    Top = 15
    Width = 354
    Height = 92
    Hint = ''
    Margins.Top = 15
    Margins.Bottom = 10
    Center = True
    Align = alTop
  end
end
