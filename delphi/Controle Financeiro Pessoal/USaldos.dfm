object frmSaldos: TfrmSaldos
  Left = 580
  Top = 224
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Saldos'
  ClientHeight = 173
  ClientWidth = 312
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbl2: TLabel
    Left = 24
    Top = 24
    Width = 113
    Height = 19
    Caption = 'Conta Corrente:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl3: TLabel
    Left = 24
    Top = 56
    Width = 66
    Height = 19
    Caption = 'Dinheiro:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl4: TLabel
    Left = 24
    Top = 88
    Width = 41
    Height = 19
    Caption = 'Total:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblContaCorrente: TLabel
    Left = 144
    Top = 24
    Width = 153
    Height = 25
    AutoSize = False
    Color = cl3DLight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object lblDinheiro: TLabel
    Left = 144
    Top = 56
    Width = 153
    Height = 25
    AutoSize = False
    Color = cl3DLight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object lblTotal: TLabel
    Left = 144
    Top = 88
    Width = 153
    Height = 25
    AutoSize = False
    Color = cl3DLight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object btnOk: TBitBtn
    Left = 232
    Top = 128
    Width = 67
    Height = 33
    Caption = 'Ok'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = btnOkClick
  end
  object qrySaldo: TADOQuery
    Connection = conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select SUM(VALOR) '
      'from TbMovimentacao')
    Left = 128
    Top = 128
    object fltfldSaldoExpr1000: TFloatField
      FieldName = 'Expr1000'
    end
  end
  object conexao: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Users\suporte3\D' +
      'ocuments\Controle Financeiro Pessoal\BdControleFinanceiro.mdb;Pe' +
      'rsist Security Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 40
    Top = 128
  end
end
