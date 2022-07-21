object Form2: TForm2
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Form2'
  ClientHeight = 338
  ClientWidth = 651
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 651
    Height = 41
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 0
    ExplicitLeft = 232
    ExplicitTop = 152
    ExplicitWidth = 185
  end
  object StackPanel1: TStackPanel
    Left = 0
    Top = 41
    Width = 651
    Height = 256
    Align = alClient
    ControlCollection = <
      item
        Control = Label2
      end
      item
        Control = Edit1
      end
      item
        Control = Label1
      end
      item
        Control = Edit2
      end
      item
        Control = Label3
      end
      item
        Control = Edit3
      end>
    HorizontalPositioning = sphpFill
    TabOrder = 1
    VerticalPositioning = spvpBottom
    ExplicitTop = 47
    ExplicitWidth = 635
    ExplicitHeight = 258
    object Label2: TLabel
      Left = 1
      Top = 1
      Width = 649
      Height = 13
      Caption = 'Label1'
    end
    object Edit1: TEdit
      Left = 1
      Top = 16
      Width = 649
      Height = 21
      TabOrder = 0
      Text = 'Edit1'
    end
    object Label1: TLabel
      Left = 1
      Top = 39
      Width = 649
      Height = 13
      Caption = 'Label1'
    end
    object Edit2: TEdit
      Left = 1
      Top = 54
      Width = 649
      Height = 21
      TabOrder = 1
      Text = 'Edit1'
    end
    object Label3: TLabel
      Left = 1
      Top = 77
      Width = 649
      Height = 13
      Caption = 'Label3'
    end
    object Edit3: TEdit
      Left = 1
      Top = 92
      Width = 649
      Height = 21
      TabOrder = 2
      Text = 'Edit1'
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 297
    Width = 651
    Height = 41
    Align = alBottom
    Caption = 'Panel1'
    TabOrder = 2
    ExplicitLeft = 2
    ExplicitTop = 9
    ExplicitWidth = 633
  end
end
