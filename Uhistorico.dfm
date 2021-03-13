object Fhistorico: TFhistorico
  Left = 0
  Top = 0
  Caption = 'Fhistorico'
  ClientHeight = 308
  ClientWidth = 677
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 64
    Top = 240
    Width = 31
    Height = 13
    Caption = 'Label2'
  end
  object salariogrid: TStringGrid
    Left = 24
    Top = 32
    Width = 320
    Height = 120
    TabOrder = 0
  end
  object Button1: TButton
    Left = 56
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Stx2: TStringGrid
    Left = 368
    Top = 24
    Width = 320
    Height = 120
    TabOrder = 2
  end
  object Ftd: TMemo
    Left = 279
    Top = 193
    Width = 185
    Height = 89
    Lines.Strings = (
      'Ftd')
    TabOrder = 3
  end
  object RCe: TRichEdit
    Left = 504
    Top = 200
    Width = 185
    Height = 89
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'RCe')
    ParentFont = False
    TabOrder = 4
    Zoom = 100
  end
  object PB1: TProgressBar
    Left = 56
    Top = 288
    Width = 150
    Height = 17
    TabOrder = 5
  end
  object Memo1: TMemo
    Left = 21
    Top = 199
    Width = 185
    Height = 89
    Lines.Strings = (
      'Memo1')
    TabOrder = 6
  end
  object Button2: TButton
    Left = 216
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 7
    OnClick = Button2Click
  end
end
