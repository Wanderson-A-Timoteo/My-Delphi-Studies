object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Sistema Financeiro'
  ClientHeight = 339
  ClientWidth = 606
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 544
    Top = 120
    object menuCadastro: TMenuItem
      Caption = 'Cadastros'
      object menuCadastroPadrao: TMenuItem
        Caption = 'Cadastro Padr'#227'o'
        OnClick = menuCadastroPadraoClick
      end
    end
    object menuRelatorio: TMenuItem
      Caption = 'Relat'#243'rios'
    end
    object menuAjuda: TMenuItem
      Caption = 'Ajuda'
    end
  end
end
