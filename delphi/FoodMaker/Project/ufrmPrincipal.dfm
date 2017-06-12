object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'FoodMaker <Empresa.Nome>'
  ClientHeight = 472
  ClientWidth = 1011
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object sbPrincipal: TStatusBar
    Left = 0
    Top = 453
    Width = 1011
    Height = 19
    Panels = <>
    ExplicitLeft = 472
    ExplicitTop = 208
    ExplicitWidth = 0
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 1011
    Height = 89
    Align = alTop
    Caption = 'pnlTop'
    TabOrder = 1
  end
  object pnlCenter: TPanel
    Left = 81
    Top = 89
    Width = 831
    Height = 295
    Align = alClient
    Caption = 'pnlCenter'
    TabOrder = 2
    ExplicitLeft = 424
    ExplicitTop = 112
    ExplicitWidth = 185
    ExplicitHeight = 41
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 384
    Width = 1011
    Height = 69
    Align = alBottom
    Caption = 'pnlBottom'
    TabOrder = 3
  end
  object pnlRight: TPanel
    Left = 912
    Top = 89
    Width = 99
    Height = 295
    Align = alRight
    Caption = 'pnlRight'
    TabOrder = 4
  end
  object pnlLeft: TPanel
    Left = 0
    Top = 89
    Width = 81
    Height = 295
    Align = alLeft
    Caption = 'pnlLeft'
    TabOrder = 5
  end
end
