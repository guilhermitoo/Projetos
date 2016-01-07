object Form1: TForm1
  Left = 221
  Top = 150
  Width = 273
  Height = 150
  Caption = 'Calcula'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 19
  object lbl1: TLabel
    Left = 16
    Top = 56
    Width = 121
    Height = 25
    AutoSize = False
    Color = clBtnHighlight
    ParentColor = False
  end
  object edt1: TEdit
    Left = 16
    Top = 16
    Width = 121
    Height = 27
    TabOrder = 0
  end
  object btn1: TButton
    Left = 152
    Top = 16
    Width = 81
    Height = 33
    Caption = 'Calcula'
    TabOrder = 1
    OnClick = btn1Click
  end
end
