object frmNextLevelExp: TfrmNextLevelExp
  Left = 414
  Top = 253
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Experi'#234'ncia e ML'
  ClientHeight = 119
  ClientWidth = 584
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblProxLevel: TLabel
    Left = 392
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
    Left = 392
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
  object lblManaNecGasta: TLabel
    Left = 256
    Top = 80
    Width = 265
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
  object lbl5: TLabel
    Left = 256
    Top = 64
    Width = 247
    Height = 13
    Caption = 'Mana necess'#225'ria gastar para o pr'#243'ximo Magic Level'
  end
  object lbl6: TLabel
    Left = 24
    Top = 64
    Width = 124
    Height = 13
    Caption = 'Magic Level atual (Mages)'
  end
  object lblExpAtual: TLabel
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
  object lbl7: TLabel
    Left = 256
    Top = 16
    Width = 82
    Height = 13
    Caption = 'Experi'#234'ncia atual'
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
  object edtML: TEdit
    Left = 24
    Top = 80
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object btn2: TButton
    Left = 160
    Top = 80
    Width = 75
    Height = 25
    Caption = 'calcula'
    TabOrder = 3
    OnClick = btn2Click
  end
end
