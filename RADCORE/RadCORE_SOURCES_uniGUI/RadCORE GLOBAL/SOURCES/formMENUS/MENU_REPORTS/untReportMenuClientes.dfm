inherited frmReportMenuClientes: TfrmReportMenuClientes
  Layout = 'accordion'
  inherited paBaseBackGround: TUniContainerPanel
    inherited paBaseTop: TUniContainerPanel
      inherited btnProcessReport: TUniBitBtn
        Left = 565
        ScreenMask.Target = Owner
        ExplicitLeft = 565
      end
    end
    inherited pgBaseCadControl: TUniPageControl
      ActivePage = tabReport
      inherited tabSearch: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 974
        ExplicitHeight = 538
        inherited paBaseRegSearch: TUniContainerPanel
          ExplicitHeight = 538
          inherited sbox: TUniScrollBox
            ExplicitHeight = 538
            ScrollHeight = 585
            ScrollWidth = 973
            ScrollY = 6
            inherited paRelatorioOpcoes: TUniContainerPanel
              Height = 574
              ExplicitHeight = 574
            end
            inherited paReportFilters: TUniContainerPanel
              Height = 574
              ExplicitHeight = 574
            end
            inherited rcBlock100: TUniContainerPanel
              object rcBlock120: TUniContainerPanel
                Tag = 1
                Left = 12
                Top = 58
                Width = 228
                Height = 48
                Hint = '[['#13#10'cols:xs-12 sm-12 md-6'#13#10']]'
                ParentColor = False
                TabOrder = 3
                DesignSize = (
                  228
                  48)
                object UniLabel7: TUniLabel
                  Left = 0
                  Top = 0
                  Width = 39
                  Height = 15
                  Hint = ''
                  Caption = 'Cliente'
                  ParentFont = False
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  Font.Style = [fsBold]
                  TabOrder = 1
                end
                object edLkpCLIENTES: TUniDBEdit
                  Left = 1
                  Top = 18
                  Width = 226
                  Height = 29
                  Hint = '[[NOME CODICLI @ ! ]]'
                  CharCase = ecUpperCase
                  Anchors = [akLeft, akTop, akRight]
                  ParentFont = False
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  TabOrder = 2
                  Color = clInfoBk
                  ReadOnly = True
                  InputType = 'text'
                end
              end
              object rcBlock130: TUniContainerPanel
                Tag = 1
                Left = 256
                Top = 57
                Width = 107
                Height = 48
                Hint = '[['#13#10'cols:xs-12 sm-12 md-6'#13#10']]'
                ParentColor = False
                TabOrder = 4
                object cbAtivos: TUniCheckBox
                  Left = 0
                  Top = 9
                  Width = 81
                  Height = 20
                  Hint = ''
                  Checked = True
                  Caption = 'Ativos'
                  ParentFont = False
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  TabOrder = 1
                  Color = clWhite
                end
                object cbBloqueados: TUniCheckBox
                  Left = 0
                  Top = 26
                  Width = 81
                  Height = 20
                  Hint = ''
                  Caption = 'Bloqueados'
                  ParentFont = False
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  TabOrder = 2
                  Color = clWhite
                end
              end
            end
            inherited paOutrasOpcoes: TUniPanel
              Top = -4
              ExplicitTop = -4
            end
            object rcBlock200: TUniContainerPanel
              Tag = 1
              Left = 12
              Top = 554
              Width = 961
              Height = 15
              Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
              ParentColor = False
              TabOrder = 7
            end
          end
        end
      end
      inherited tabReport: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 974
        ExplicitHeight = 538
        inherited paBaseRegData1: TUniContainerPanel
          Height = 538
          ExplicitHeight = 538
          inherited UniURLFrameReport: TUniURLFrame
            Height = 532
            ExplicitHeight = 532
          end
        end
      end
    end
  end
end
