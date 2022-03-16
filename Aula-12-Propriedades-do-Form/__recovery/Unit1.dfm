object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Curso de Delphi Para Iniciantes'
  ClientHeight = 353
  ClientWidth = 591
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  Position = poScreenCenter
  WindowState = wsMaximized
  DesignSize = (
    591
    353)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 591
    Height = 65
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 0
    ExplicitWidth = 606
    object Button1: TButton
      Left = 458
      Top = 1
      Width = 132
      Height = 63
      Align = alRight
      Caption = 'Button1'
      TabOrder = 0
      OnClick = Button1Click
      ExplicitLeft = 473
    end
    object Edit1: TEdit
      Left = 1
      Top = 1
      Width = 457
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
      ExplicitWidth = 472
      ExplicitHeight = 29
    end
  end
  object Memo1: TMemo
    Left = 0
    Top = 62
    Width = 353
    Height = 227
    Align = alCustom
    Lines.Strings = (
      'Memo1')
    PopupMenu = PopupMenu2
    TabOrder = 1
  end
  object Button2: TButton
    Left = 472
    Top = 296
    Width = 99
    Height = 49
    Anchors = [akRight, akBottom]
    Caption = 'Fechar'
    TabOrder = 2
    OnClick = Button2Click
  end
  object MainMenu1: TMainMenu
    Left = 384
    Top = 72
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
  object PopupMenu1: TPopupMenu
    Left = 464
    Top = 72
    object frm11: TMenuItem
      Caption = 'frm1'
      object subfrm1: TMenuItem
        Caption = 'subfrm'
      end
      object subfrm21: TMenuItem
        Caption = 'subfrm2'
      end
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object frm21: TMenuItem
      Caption = 'frm2'
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 464
    Top = 144
    object Memomenu1: TMenuItem
      Caption = 'Memomenu'
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object Menumenu21: TMenuItem
      Caption = 'Menumenu2'
      object SubMemomeu1: TMenuItem
        Caption = 'SubMemomeu'
      end
    end
  end
end
