object Form1: TForm1
  Left = 192
  Top = 125
  Width = 390
  Height = 110
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
    Left = 256
    Top = 24
    Width = 89
    Height = 25
    AutoSize = False
    Color = clActiveCaption
    ParentColor = False
  end
  object edt1: TEdit
    Left = 24
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object btn1: TButton
    Left = 160
    Top = 24
    Width = 75
    Height = 25
    Caption = 'calcula'
    TabOrder = 1
    OnClick = btn1Click
  end
end
