object frmDanoFisico: TfrmDanoFisico
  Left = 357
  Top = 213
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Calculadora de Dano F'#237'sico'
  ClientHeight = 306
  ClientWidth = 299
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    299
    306)
  PixelsPerInch = 96
  TextHeight = 18
  object lbl1: TLabel
    Left = 24
    Top = 56
    Width = 33
    Height = 18
    Caption = 'Level'
  end
  object lbl2: TLabel
    Left = 160
    Top = 56
    Width = 55
    Height = 18
    Caption = 'Voca'#231#227'o'
  end
  object lbl3: TLabel
    Left = 24
    Top = 16
    Width = 110
    Height = 23
    Caption = 'Dano F'#237'sico'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl4: TLabel
    Left = 24
    Top = 96
    Width = 106
    Height = 18
    Caption = 'Ataque da arma'
  end
  object lbl6: TLabel
    Left = 24
    Top = 136
    Width = 66
    Height = 18
    Caption = 'Skill (level)'
  end
  object lbl8: TLabel
    Left = 32
    Top = 312
    Width = 99
    Height = 20
    Anchors = [akLeft]
    AutoSize = False
    Color = clScrollBar
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object lbl9: TLabel
    Left = 24
    Top = 176
    Width = 70
    Height = 18
    Caption = 'Magic level'
  end
  object lbl10: TLabel
    Left = 144
    Top = 272
    Width = 30
    Height = 18
    Caption = 'Cap:'
  end
  object lblCap: TLabel
    Left = 176
    Top = 272
    Width = 105
    Height = 23
    AutoSize = False
    Color = clScrollBar
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object edtLevel: TEdit
    Left = 24
    Top = 72
    Width = 121
    Height = 26
    TabOrder = 2
  end
  object cbbVoc: TComboBox
    Left = 160
    Top = 72
    Width = 121
    Height = 26
    ItemHeight = 18
    ItemIndex = 0
    TabOrder = 3
    Text = 'Knight'
    Items.Strings = (
      'Knight'
      'Paladin')
  end
  object edtAtq: TEdit
    Left = 24
    Top = 112
    Width = 121
    Height = 26
    TabOrder = 4
  end
  object btnCalcular: TBitBtn
    Left = 24
    Top = 224
    Width = 121
    Height = 33
    Caption = 'Calcular'
    TabOrder = 8
    OnClick = btnCalcularClick
  end
  object btnLimpar: TBitBtn
    Left = 160
    Top = 224
    Width = 121
    Height = 33
    Caption = 'Limpar'
    TabOrder = 9
    OnClick = btnLimparClick
  end
  object edtSkill: TEdit
    Left = 24
    Top = 152
    Width = 121
    Height = 26
    TabOrder = 5
  end
  object rgPost: TRadioGroup
    Left = 160
    Top = 104
    Width = 121
    Height = 105
    Caption = 'Postura'
    ItemIndex = 0
    Items.Strings = (
      'Ataque'
      'Balanceado'
      'Defesa')
    TabOrder = 7
  end
  object pnlKnight: TPanel
    Left = 296
    Top = 0
    Width = 3
    Height = 306
    Align = alRight
    TabOrder = 0
    object lbl27: TLabel
      Left = 13
      Top = 76
      Width = 67
      Height = 19
      Caption = 'Exori Hur'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblHurMin: TLabel
      Left = 96
      Top = 72
      Width = 105
      Height = 23
      AutoSize = False
      Color = clScrollBar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lblMasMin: TLabel
      Left = 96
      Top = 96
      Width = 105
      Height = 23
      AutoSize = False
      Color = clScrollBar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lbl30: TLabel
      Left = 13
      Top = 100
      Width = 68
      Height = 19
      Caption = 'Exori Mas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblExoriMin: TLabel
      Left = 96
      Top = 120
      Width = 105
      Height = 23
      AutoSize = False
      Color = clScrollBar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lbl32: TLabel
      Left = 13
      Top = 124
      Width = 36
      Height = 19
      Caption = 'Exori'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblGranMin: TLabel
      Left = 96
      Top = 144
      Width = 105
      Height = 23
      AutoSize = False
      Color = clScrollBar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lbl34: TLabel
      Left = 14
      Top = 148
      Width = 75
      Height = 19
      Caption = 'Exori Gran'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl35: TLabel
      Left = 14
      Top = 172
      Width = 67
      Height = 19
      Caption = 'Exura Ico'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl36: TLabel
      Left = 65
      Top = 16
      Width = 181
      Height = 23
      Caption = 'Habilidades Knight'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblIcoMin: TLabel
      Left = 96
      Top = 168
      Width = 105
      Height = 23
      AutoSize = False
      Color = clScrollBar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lblHurMax: TLabel
      Left = 202
      Top = 72
      Width = 105
      Height = 23
      AutoSize = False
      Color = clScrollBar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lbl39: TLabel
      Left = 104
      Top = 48
      Width = 94
      Height = 19
      Caption = 'Dano M'#237'nimo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl40: TLabel
      Left = 208
      Top = 48
      Width = 97
      Height = 19
      Caption = 'Dano M'#225'ximo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblMasMax: TLabel
      Left = 202
      Top = 96
      Width = 105
      Height = 23
      AutoSize = False
      Color = clScrollBar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lblExoriMax: TLabel
      Left = 202
      Top = 120
      Width = 105
      Height = 23
      AutoSize = False
      Color = clScrollBar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lblGranMax: TLabel
      Left = 202
      Top = 144
      Width = 105
      Height = 23
      AutoSize = False
      Color = clScrollBar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lblIcoMax: TLabel
      Left = 202
      Top = 168
      Width = 105
      Height = 23
      AutoSize = False
      Color = clScrollBar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lblMin: TLabel
      Left = 96
      Top = 192
      Width = 105
      Height = 23
      AutoSize = False
      Color = clScrollBar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lblMax: TLabel
      Left = 202
      Top = 192
      Width = 105
      Height = 23
      AutoSize = False
      Color = clScrollBar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lbl7: TLabel
      Left = 14
      Top = 196
      Width = 50
      Height = 19
      Caption = 'Ataque'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblKinaHP: TLabel
      Left = 14
      Top = 224
      Width = 292
      Height = 19
      Alignment = taCenter
      AutoSize = False
      Color = clRed
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lblKinaMP: TLabel
      Left = 14
      Top = 245
      Width = 292
      Height = 19
      Alignment = taCenter
      AutoSize = False
      Color = clBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
  end
  object pnlPaladin: TPanel
    Left = 295
    Top = 0
    Width = 1
    Height = 306
    Align = alRight
    TabOrder = 1
    object lbl5: TLabel
      Left = 14
      Top = 92
      Width = 69
      Height = 19
      Caption = 'Exori Con'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblConMin: TLabel
      Left = 120
      Top = 88
      Width = 105
      Height = 23
      AutoSize = False
      Color = clScrollBar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lblSanMin: TLabel
      Left = 120
      Top = 112
      Width = 105
      Height = 23
      AutoSize = False
      Color = clScrollBar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lbl11: TLabel
      Left = 13
      Top = 116
      Width = 67
      Height = 19
      Caption = 'Exori San'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblMasSanMin: TLabel
      Left = 120
      Top = 136
      Width = 105
      Height = 23
      AutoSize = False
      Color = clScrollBar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lbl13: TLabel
      Left = 13
      Top = 140
      Width = 105
      Height = 19
      Caption = 'Exevo Mas San'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblExuraMin: TLabel
      Left = 120
      Top = 160
      Width = 105
      Height = 23
      AutoSize = False
      Color = clScrollBar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lbl15: TLabel
      Left = 14
      Top = 164
      Width = 71
      Height = 19
      Caption = 'Exura San'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl17: TLabel
      Left = 65
      Top = 24
      Width = 188
      Height = 23
      Caption = 'Habilidades Paladin'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblConMax: TLabel
      Left = 226
      Top = 88
      Width = 105
      Height = 23
      AutoSize = False
      Color = clScrollBar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lbl20: TLabel
      Left = 128
      Top = 64
      Width = 94
      Height = 19
      Caption = 'Dano M'#237'nimo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl21: TLabel
      Left = 232
      Top = 64
      Width = 97
      Height = 19
      Caption = 'Dano M'#225'ximo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblSanMax: TLabel
      Left = 226
      Top = 112
      Width = 105
      Height = 23
      AutoSize = False
      Color = clScrollBar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lblMasSanMax: TLabel
      Left = 226
      Top = 136
      Width = 105
      Height = 23
      AutoSize = False
      Color = clScrollBar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lblExuraMax: TLabel
      Left = 226
      Top = 160
      Width = 105
      Height = 23
      AutoSize = False
      Color = clScrollBar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lblPalaMin: TLabel
      Left = 120
      Top = 184
      Width = 105
      Height = 23
      AutoSize = False
      Color = clScrollBar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lblPalaMax: TLabel
      Left = 226
      Top = 184
      Width = 105
      Height = 23
      AutoSize = False
      Color = clScrollBar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lbl46: TLabel
      Left = 14
      Top = 188
      Width = 50
      Height = 19
      Caption = 'Ataque'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblPalaHP: TLabel
      Left = 14
      Top = 224
      Width = 315
      Height = 19
      Alignment = taCenter
      AutoSize = False
      Color = clRed
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lblPalaMP: TLabel
      Left = 14
      Top = 245
      Width = 315
      Height = 19
      Alignment = taCenter
      AutoSize = False
      Color = clBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
  end
  object edtML: TEdit
    Left = 24
    Top = 192
    Width = 121
    Height = 26
    TabOrder = 6
  end
end
