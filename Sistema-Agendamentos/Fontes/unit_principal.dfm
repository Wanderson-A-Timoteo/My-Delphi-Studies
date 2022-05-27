object form_principal: Tform_principal
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  ClientHeight = 520
  ClientWidth = 948
  Color = 11976552
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 15
  object Button1: TButton
    Left = 64
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object MainMenu1: TMainMenu
    Left = 16
    Top = 48
    object Encerrar1: TMenuItem
      Caption = 'Encerrar'
      OnClick = Encerrar1Click
    end
    object Servidor1: TMenuItem
      Caption = 'Servidor'
      OnClick = Servidor1Click
    end
  end
end
