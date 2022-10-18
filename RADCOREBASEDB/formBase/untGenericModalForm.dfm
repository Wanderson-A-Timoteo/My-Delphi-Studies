object frmGenericModalForm: TfrmGenericModalForm
  Left = 0
  Top = 0
  Hint = '[[modal:]]'
  Margins.Left = 4
  Margins.Top = 4
  Margins.Right = 4
  Margins.Bottom = 4
  ClientHeight = 360
  ClientWidth = 360
  Caption = ''
  Color = clWhite
  OnShow = UniFormShow
  BorderStyle = bsNone
  OldCreateOrder = False
  OnKeyDown = UniFormKeyDown
  KeyPreview = True
  NavigateKeys.Enabled = True
  NavigateKeys.Prior.Key = 13
  NavigateKeys.Prior.ShiftState = [ussShift]
  NavigateKeys.Next.Key = 13
  MonitoredKeys.Keys = <>
  AlignmentControl = uniAlignmentClient
  OnReady = UniFormReady
  OnBeforeShow = UniFormBeforeShow
  OnDestroy = UniFormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object timerClose: TUniTimer
    Interval = 500
    Enabled = False
    ClientEvent.Strings = (
      'function(sender)'
      '{'
      ' '
      '}')
    Left = 200
    Top = 9
  end
  object rcSweetAlert: TUniSweetAlert
    Title = 'Title'
    ConfirmButtonText = 'OK'
    CancelButtonText = 'Cancel'
    ImageIndex = 0
    Padding = 20
    FocusCancel = True
    Left = 266
    Top = 10
  end
end
