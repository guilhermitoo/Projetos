object Form1: TForm1
  Left = 386
  Top = 136
  Width = 497
  Height = 278
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 32
    Top = 80
    Width = 10
    Height = 13
    Caption = 'lvl'
  end
  object edty: TEdit
    Left = 56
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edtx: TEdit
    Left = 56
    Top = 72
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object edt3: TEdit
    Left = 56
    Top = 120
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 2
    Text = 'edt3'
  end
  object btn1: TButton
    Left = 192
    Top = 72
    Width = 75
    Height = 25
    Caption = 'btn1'
    TabOrder = 3
    OnClick = btn1Click
  end
end
