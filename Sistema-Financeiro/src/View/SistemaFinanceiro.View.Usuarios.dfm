inherited frmUsuarios: TfrmUsuarios
  Caption = 'Cadastro de Usu'#225'rios'
  PixelsPerInch = 96
  TextHeight = 19
  inherited PnlPrincipal: TCardPanel
    ActiveCard = cardCadastro
    inherited cardCadastro: TCard
      object Label2: TLabel [0]
        Left = 40
        Top = 43
        Width = 48
        Height = 19
        Caption = 'Nome:'
      end
      object Label3: TLabel [1]
        Left = 40
        Top = 76
        Width = 45
        Height = 19
        Caption = 'Login:'
      end
      object Label4: TLabel [2]
        Left = 40
        Top = 109
        Width = 49
        Height = 19
        Caption = 'Senha:'
      end
      object Label5: TLabel [3]
        Left = 40
        Top = 139
        Width = 49
        Height = 19
        Caption = 'Status:'
      end
      object edtNome: TEdit
        Left = 104
        Top = 40
        Width = 417
        Height = 27
        TabOrder = 1
      end
      object edtLogin: TEdit
        Left = 104
        Top = 73
        Width = 417
        Height = 27
        TabOrder = 2
      end
      object edtSenha: TEdit
        Left = 104
        Top = 106
        Width = 417
        Height = 27
        TabOrder = 3
      end
      object ToggleSwitchStatus: TToggleSwitch
        Left = 104
        Top = 139
        Width = 130
        Height = 21
        StateCaptions.CaptionOn = 'Ativo'
        StateCaptions.CaptionOff = 'Bloqueado'
        TabOrder = 4
      end
    end
    inherited cardPesquisa: TCard
      inherited pnlPesquisa: TPanel
        inherited btnPesquisar: TButton
          OnClick = btnPesquisarClick
        end
      end
      inherited pnlGrid: TPanel
        inherited DBGrid1: TDBGrid
          Columns = <
            item
              Expanded = False
              FieldName = 'nome'
              Title.Caption = 'Nome'
              Width = 340
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'login'
              Title.Caption = 'Login'
              Width = 214
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'status'
              Title.Caption = 'Status'
              Width = 81
              Visible = True
            end>
        end
      end
    end
  end
  inherited ImageList1: TImageList
    Left = 601
    Top = 138
  end
  inherited DataSource1: TDataSource
    DataSet = dmUsuarios.cdsUsuarios
    Left = 601
    Top = 258
  end
end
