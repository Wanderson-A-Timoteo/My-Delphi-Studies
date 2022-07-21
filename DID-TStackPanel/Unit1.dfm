object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 513
  ClientWidth = 902
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object StackPanel1: TStackPanel
    Left = 272
    Top = 168
    Width = 337
    Height = 145
    ControlCollection = <
      item
        Control = Label1
      end
      item
        Control = Edit1
      end
      item
        Control = Button1
      end>
    HorizontalPositioning = sphpCenter
    Padding.Left = 20
    Padding.Top = 20
    Padding.Right = 20
    Padding.Bottom = 20
    Spacing = 10
    TabOrder = 0
    object Label1: TLabel
      Left = 49
      Top = 21
      Width = 239
      Height = 13
      Caption = 'Label1'
    end
    object Edit1: TEdit
      Left = 49
      Top = 44
      Width = 239
      Height = 21
      TabOrder = 0
      Text = 'Edit1'
    end
    object Button1: TButton
      Left = 49
      Top = 75
      Width = 239
      Height = 25
      Caption = 'Button1'
      TabOrder = 1
    end
  end
end
