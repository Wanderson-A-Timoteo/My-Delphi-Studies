object frmBase: TfrmBase
  Left = 0
  Top = 0
  Width = 1020
  Height = 650
  OnCreate = UniFrameCreate
  OnReady = UniFrameReady
  ParentAlignmentControl = False
  AlignmentControl = uniAlignmentClient
  Font.Height = -13
  Font.Name = 'Calibri'
  TabOrder = 0
  ParentFont = False
  AutoScroll = True
  object paBaseBackGround: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 1020
    Height = 650
    Hint = ''
    ParentColor = False
    Color = 15395562
    Align = alClient
    TabOrder = 0
    object paBaseTop: TUniContainerPanel
      Left = 0
      Top = 0
      Width = 1020
      Height = 40
      Hint = ''
      ParentColor = False
      Color = clWhite
      Align = alTop
      TabOrder = 1
    end
  end
  object htmlFrame: TUniHTMLFrame
    Left = 240
    Top = -3
    Width = 29
    Height = 39
    Hint = ''
    Visible = False
  end
  object rcSweetAlert: TUniSweetAlert
    Title = 'Title'
    ConfirmButtonText = 'OK'
    CancelButtonText = 'Cancel'
    ImageIndex = 0
    Padding = 20
    FocusCancel = True
    Left = 924
    Top = 172
  end
end
