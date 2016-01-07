object frmNextLevelExp: TfrmNextLevelExp
  Left = 414
  Top = 253
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Experi'#234'ncia pr'#243'ximo level'
  ClientHeight = 75
  ClientWidth = 404
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
    Top = 32
    Width = 129
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Color = clActiveCaption
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Layout = tlCenter
  end
  object lbl2: TLabel
    Left = 256
    Top = 16
    Width = 118
    Height = 13
    Caption = 'Exp para o pr'#243'ximo level'
  end
  object lbl3: TLabel
    Left = 24
    Top = 16
    Width = 52
    Height = 13
    Caption = 'Level atual'
  end
  object edt1: TEdit
    Left = 24
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object btn1: TButton
    Left = 160
    Top = 32
    Width = 75
    Height = 25
    Caption = 'calcula'
    TabOrder = 1
    OnClick = btn1Click
  end
end
