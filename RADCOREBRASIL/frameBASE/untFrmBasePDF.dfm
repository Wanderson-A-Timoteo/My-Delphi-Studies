object frmBasePDF: TfrmBasePDF
  Left = 0
  Top = 0
  ClientHeight = 659
  ClientWidth = 577
  Caption = 'frmBasePDF'
  BorderStyle = bsNone
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  AlignmentControl = uniAlignmentClient
  Font.Height = -13
  Font.Name = 'Calibri'
  OnReady = UniFormReady
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object UniURLFrame1: TUniURLFrame
    AlignWithMargins = True
    Left = 3
    Top = 47
    Width = 571
    Height = 609
    Hint = ''
    Margins.Top = 0
    Align = alClient
    TabOrder = 0
    ParentColor = False
    Color = clBtnFace
  end
  object paTitleRegDetail: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 577
    Height = 43
    Hint = ''
    Margins.Top = 0
    Margins.Bottom = 0
    ParentColor = False
    Color = clWhite
    Align = alTop
    TabOrder = 1
    object labTitleFrm: TUniLabel
      AlignWithMargins = True
      Left = 10
      Top = 5
      Width = 474
      Height = 35
      Hint = ''
      Margins.Left = 10
      Margins.Top = 5
      AutoSize = False
      Caption = 'PDF'
      Align = alClient
      ParentFont = False
      Font.Color = clGray
      Font.Height = -24
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      TabOrder = 1
    end
    object btnExit: TUniBitBtn
      AlignWithMargins = True
      Left = 532
      Top = 4
      Width = 35
      Height = 35
      Hint = '[[cls:ButtonWhite | ico:fas-sign-out-alt cls-ico:font-black]]'
      Margins.Left = 0
      Margins.Top = 4
      Margins.Right = 10
      Margins.Bottom = 4
      Caption = '<'
      Align = alRight
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      TabOrder = 2
      ScaleButton = False
      OnClick = btnExitClick
    end
    object btnPDF: TUniBitBtn
      AlignWithMargins = True
      Left = 487
      Top = 4
      Width = 35
      Height = 35
      Hint = '[[cls:ButtonWhite | ico:fas-bolt cls-ico:font-black]]'
      Margins.Left = 0
      Margins.Top = 4
      Margins.Right = 10
      Margins.Bottom = 4
      Caption = '/'
      Align = alRight
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      TabOrder = 3
      ScaleButton = False
      OnClick = btnPDFClick
    end
  end
  object UniPanel1: TUniPanel
    Left = 0
    Top = 43
    Width = 577
    Height = 4
    Hint = ''
    Align = alTop
    TabOrder = 2
    Caption = ''
  end
  object sqlMaster: TFDQuery
    CachedUpdates = True
    Connection = mm.SQLConn
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    SQL.Strings = (
      'Select * from cargos')
    Left = 975
    Top = 135
  end
  object dsMaster: TDataSource
    AutoEdit = False
    DataSet = sqlMaster
    Left = 972
    Top = 185
  end
  object sqlSearchMaster: TFDQuery
    CachedUpdates = True
    Connection = mm.SQLConn
    FormatOptions.AssignedValues = [fvFmtDisplayDateTime, fvFmtDisplayDate, fvFmtDisplayNumeric, fvStrsTrim2Len]
    SQL.Strings = (
      '')
    Left = 975
    Top = 235
  end
  object dsSearchMaster: TDataSource
    AutoEdit = False
    DataSet = sqlSearchMaster
    Left = 974
    Top = 281
  end
end
