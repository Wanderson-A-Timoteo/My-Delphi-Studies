object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 353
  ClientWidth = 606
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 606
    Height = 65
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 0
    ExplicitWidth = 745
    object Button1: TButton
      Left = 473
      Top = 1
      Width = 132
      Height = 63
      Align = alRight
      Caption = 'Button1'
      TabOrder = 0
      OnClick = Button1Click
      ExplicitLeft = 728
    end
    object Edit1: TEdit
      Left = 1
      Top = 1
      Width = 472
      Height = 63
      Align = alClient
      Alignment = taCenter
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clHotLight
      Font.Height = -21
      Font.Name = '@PMingLiU-ExtB'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      Text = 'Edit1'
      OnChange = Edit1Change
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
      ExplicitHeight = 29
    end
  end
  object Memo1: TMemo
    Left = 0
    Top = 65
    Width = 606
    Height = 288
    Align = alClient
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
    ExplicitLeft = 32
    ExplicitTop = 88
    ExplicitWidth = 185
    ExplicitHeight = 89
  end
  object MainMenu1: TMainMenu
    Left = 8
    Top = 88
    object Inicio1: TMenuItem
      Caption = 'Inicio'
      object este11: TMenuItem
        Caption = 'Teste1'
        object este1Submenu1: TMenuItem
          Caption = 'Teste1Submenu'
          object este1SubmenuSub1: TMenuItem
            Caption = 'Teste1SubmenuSub'
          end
          object este1SubmenuSub21: TMenuItem
            Caption = 'Teste1SubmenuSub2'
          end
        end
        object este1Submenu21: TMenuItem
          Caption = 'Teste1Submenu2'
        end
        object estes1Submenu31: TMenuItem
          Caption = 'Testes1Submenu3'
        end
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object este21: TMenuItem
        Caption = 'Teste2'
        object este2Submenu1: TMenuItem
          Caption = 'Teste2Submenu'
        end
      end
    end
  end
end
