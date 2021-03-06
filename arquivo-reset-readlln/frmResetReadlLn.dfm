object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 701
  ClientWidth = 957
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
    Left = 200
    Top = 32
    Width = 555
    Height = 37
    Caption = 'Lendo dados de um arquivo de texto'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 264
    Top = 391
    Width = 409
    Height = 19
    Caption = 'Clicar par buscar a primeira linha do arquivo de texto'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Memo1: TMemo
    Left = 24
    Top = 96
    Width = 897
    Height = 273
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    Lines.Strings = (
      
        'Vamos analisar o processo de leitura de dados de um arquivo. Abr' +
        'imos o arquivo para leitura com a chamada para Reset(f).'
      
        'Aten'#231#227'o: o arquivo que est'#225' prestes a ser aberto para leitura de' +
        've existir em um disco. Caso contr'#225'rio, um erro de tempo de '
      
        'execu'#231#227'o exibir'#225' uma mensagem de erro e encerrar'#225' a execu'#231#227'o do ' +
        'programa.'
      
        'Se o arquivo for aberto com sucesso, o cursor ser'#225' posicionado n' +
        'o in'#237'cio da primeira linha. Podemos ler essa linha chamando '
      'o procedimento ReadlLn(f, s).'
      
        'Ap'#243's a instru'#231#227'o ReadLn ser conclu'#237'da, a vari'#225'vel s ter'#225' o conte' +
        #250'do da primeira linha e o cursor ser'#225' posicionado no in'#237'cio da '
      
        'pr'#243'xima linha. Se repetirmos a instru'#231#227'o, a vari'#225'vel ser'#225' atribu' +
        #237'da a um conte'#250'do da segunda linha, o cursor ser'#225' posicionado '
      'no in'#237'cio da '
      'terceira linha e assim por diante.'
      
        'Ap'#243's terminarmos de trabalhar com o arquivo, precisamos fech'#225'-lo' +
        ', usando a chamada de procedimento CloseFile(f), '
      'exatamente como ao gravar arquivos.'
      
        'Abaixo est'#225' um exemplo de um procedimento que gravar'#225' a primeira' +
        ' linha de um arquivo '#8216'my.txt'#8217' no componente memEx1 '
      'Memo.')
    ParentFont = False
    TabOrder = 0
  end
  object Button1: TButton
    Left = 352
    Top = 416
    Width = 227
    Height = 73
    Caption = 'Bot'#227'o'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Memo2: TMemo
    Left = 264
    Top = 512
    Width = 417
    Height = 169
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    Lines.Strings = (
      '')
    ParentFont = False
    TabOrder = 2
  end
end
