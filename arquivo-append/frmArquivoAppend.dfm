object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Metodo Append'
  ClientHeight = 324
  ClientWidth = 594
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 136
    Top = 240
    Width = 268
    Height = 19
    Caption = 'Clicar no bot'#227'o para criar o arquivo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnClick: TButton
    Left = 232
    Top = 280
    Width = 75
    Height = 25
    Caption = 'Bot'#227'o'
    TabOrder = 0
    OnClick = btnClickClick
  end
  object Memo1: TMemo
    Left = 8
    Top = 8
    Width = 577
    Height = 201
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    Lines.Strings = (
      
        #201' poss'#237'vel usar Append() apenas em um arquivo existente. Caso co' +
        'ntr'#225'rio,'
      
        'o sistema do tempo de execu'#231#227'o exibir'#225' um erro e o programa ser'#225 +
        ' encerrado.'
      
        'Ap'#243's terminar de trabalhar com um arquivo que foi aberto com App' +
        'end(),'
      'precisamos fech'#225'-lo com uma chamada de CloseFile().'
      
        'O argumento do arquivo nos procedimentos deve ser sempre declara' +
        'do'
      'como um argumento de vari'#225'vel, usando a palavra-chave var.'
      
        'A seguir est'#225' um exemplo de um programa que cria dois arquivos, ' +
        #8220'test1.txt'#8221
      
        'e '#8220'test2.txt'#8221', e escreve v'#225'rias linhas com zeros nelas. O primei' +
        'ro arquivo deve'
      
        'conter tr'#234's linhas com cinco zeros e um segundo arquivo deve con' +
        'ter quatro'
      'linhas com tr'#234's zeros. Os zeros s'#227'o separados por dois espa'#231'os.')
    ParentFont = False
    TabOrder = 1
  end
end
