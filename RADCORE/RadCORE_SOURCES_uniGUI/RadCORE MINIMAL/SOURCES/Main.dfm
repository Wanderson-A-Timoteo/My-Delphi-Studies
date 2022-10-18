object MainForm: TMainForm
  Left = 0
  Top = 0
  Width = 837
  Height = 585
  Caption = 'MainForm'
  OldCreateOrder = False
  Script.Strings = (
    ''
    '')
  KeyPreview = True
  AutoScroll = True
  NavigateKeys.Enabled = True
  NavigateKeys.Prior.Key = 13
  NavigateKeys.Prior.ShiftState = [ussShift]
  NavigateKeys.Next.Key = 13
  NavigateKeys.SelectText = True
  MonitoredKeys.Keys = <>
  AlignmentControl = uniAlignmentClient
  ScreenMask.WaitData = True
  OnReady = UniFormReady
  OnBeforeShow = UniFormBeforeShow
  OnAfterShow = UniFormAfterShow
  OnCreate = UniFormCreate
  OnScreenResize = UniFormScreenResize
  PixelsPerInch = 96
  TextHeight = 13
  object sboxGridBlock: TUniScrollBox
    Left = 0
    Top = 0
    Width = 821
    Height = 546
    Hint = ''
    Align = alClient
    TabOrder = 0
  end
end
