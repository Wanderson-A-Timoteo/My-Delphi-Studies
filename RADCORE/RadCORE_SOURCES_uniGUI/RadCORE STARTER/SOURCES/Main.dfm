object MainForm: TMainForm
  Left = 0
  Top = 0
  Width = 1057
  Height = 676
  Caption = 'MainForm'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnKeyDown = UniFormKeyDown
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
    Width = 1041
    Height = 637
    Hint = ''
    Align = alClient
    TabOrder = 2
  end
  object htmlFrame: TUniHTMLFrame
    Left = 973
    Top = 8
    Width = 25
    Height = 31
    Hint = ''
    Visible = False
    OnAjaxEvent = htmlFrameAjaxEvent
  end
  object btnFloatingFAB: TUniHTMLFrame
    Left = 942
    Top = 8
    Width = 25
    Height = 31
    Hint = ''
    Visible = False
  end
end
