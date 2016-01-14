object frmPrincipal: TfrmPrincipal
  Left = 242
  Top = 163
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Controle Financeiro Pessoal'
  ClientHeight = 328
  ClientWidth = 732
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Menu = mmMenu
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMenu: TPanel
    Left = 0
    Top = 0
    Width = 732
    Height = 73
    Align = alTop
    TabOrder = 0
    object lblSaldodesc: TLabel
      Left = 344
      Top = 16
      Width = 201
      Height = 41
      AutoSize = False
      Caption = 'Saldo Atual:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -37
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblSaldoAtual: TLabel
      Left = 544
      Top = 16
      Width = 177
      Height = 41
      AutoSize = False
      Color = cl3DLight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -37
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object btnCadLembrete: TButton
      Left = 144
      Top = 8
      Width = 129
      Height = 49
      Caption = 'Cadastro de Lembrete'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      WordWrap = True
      OnClick = btnCadLembreteClick
    end
    object btnCadMovimentacao: TBitBtn
      Left = 8
      Top = 8
      Width = 129
      Height = 49
      Caption = 'Cadastro de '#13#10'Movimenta'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      WordWrap = True
      OnClick = btnCadMovimentacaoClick
    end
  end
  object pgcLembretes: TPageControl
    Left = 0
    Top = 64
    Width = 732
    Height = 264
    ActivePage = ts1
    Align = alBottom
    TabOrder = 1
    object ts1: TTabSheet
      Caption = 'Lembretes'
      object dbgrdLembrete: TDBGrid
        Left = 12
        Top = 8
        Width = 701
        Height = 193
        Color = clWhite
        DataSource = dsLembretes
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object btnExcluirLembrete: TBitBtn
        Left = 12
        Top = 199
        Width = 77
        Height = 25
        Caption = 'Excluir'
        TabOrder = 1
        OnClick = btnExcluirLembreteClick
      end
    end
    object ts2: TTabSheet
      Caption = 'Receber'
      ImageIndex = 1
      object dbgrdReceber: TDBGrid
        Left = 12
        Top = 8
        Width = 701
        Height = 193
        Color = clWhite
        DataSource = dsReceber
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = dbgrdReceberDblClick
      end
      object btnExcluirReceber: TBitBtn
        Left = 12
        Top = 199
        Width = 77
        Height = 25
        Caption = 'Excluir'
        TabOrder = 1
        OnClick = btnExcluirReceberClick
      end
    end
    object ts3: TTabSheet
      Caption = 'Pagar'
      ImageIndex = 2
      object dbgrdPagar: TDBGrid
        Left = 12
        Top = 8
        Width = 701
        Height = 193
        Color = clWhite
        DataSource = dsPagar
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = dbgrdPagarDblClick
      end
      object btnExcluirPagar: TBitBtn
        Left = 12
        Top = 199
        Width = 77
        Height = 25
        Caption = 'Excluir'
        TabOrder = 1
        OnClick = btnExcluirPagarClick
      end
    end
  end
  object mmMenu: TMainMenu
    Left = 344
    Top = 65520
    object Movimentao1: TMenuItem
      Caption = 'Cadastros'
      object CadastrarEntrada1: TMenuItem
        Caption = 'Movimenta'#231#227'o'
        OnClick = CadastrarEntrada1Click
      end
      object ipodeGasto1: TMenuItem
        Caption = 'Tipo de Gasto/Ganho'
        OnClick = ipodeGasto1Click
      end
      object Lembrete1: TMenuItem
        Caption = 'Lembrete'
        OnClick = Lembrete1Click
      end
    end
    object Listar1: TMenuItem
      Caption = 'Listar'
      object iposdeGastoGanho1: TMenuItem
        Caption = 'Tipos de Gasto/Ganho'
        OnClick = iposdeGastoGanho1Click
      end
      object Movimentaes1: TMenuItem
        Caption = 'Movimenta'#231#245'es'
        OnClick = Movimentaes1Click
      end
    end
    object Sair1: TMenuItem
      Caption = 'Sair'
      OnClick = Sair1Click
    end
  end
  object conexao: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=C:\Us' +
      'ers\suporte3\Documents\Controle Financeiro Pessoal\BdControleFin' +
      'anceiro.mdb;Mode=Share Deny None;Persist Security Info=False;Jet' +
      ' OLEDB:System database="";Jet OLEDB:Registry Path="";Jet OLEDB:D' +
      'atabase Password="";Jet OLEDB:Engine Type=5;Jet OLEDB:Database L' +
      'ocking Mode=1;Jet OLEDB:Global Partial Bulk Ops=2;Jet OLEDB:Glob' +
      'al Bulk Transactions=1;Jet OLEDB:New Database Password="";Jet OL' +
      'EDB:Create System Database=False;Jet OLEDB:Encrypt Database=Fals' +
      'e;Jet OLEDB:Don'#39't Copy Locale on Compact=False;Jet OLEDB:Compact' +
      ' Without Replica Repair=False;Jet OLEDB:SFP=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 376
    Top = 65520
  end
  object qryLembrete: TADOQuery
    Connection = conexao
    CursorType = ctStatic
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      
        'select L.COD_LEMBRETE, L.DATA as '#39'Data'#39', L.DESCRICAO as '#39'Descric' +
        'ao'#39' from TbLembrete L'
      'where L.TIPO_LEMBRETE = 1;')
    Left = 392
    Top = 24
    object UsuLembreteCOD_LEMBRETE: TAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_LEMBRETE'
      ReadOnly = True
    end
    object dtmfldLembreteData: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 23
      FieldName = #39'Data'#39
    end
    object UsuLembreteDescricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 72
      FieldName = #39'Descricao'#39
      Size = 65
    end
  end
  object dtstprvdr1: TDataSetProvider
    DataSet = qryLembrete
    Left = 472
    Top = 65520
  end
  object dsLembretes: TDataSource
    DataSet = qryLembrete
    Left = 440
    Top = 8
  end
  object qrySaldo: TADOQuery
    Connection = conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select coalesce(SUM(VALOR),0) from TbMovimentacao;')
    Left = 552
    Top = 24
    object fltfldSaldoExpr1000: TFloatField
      FieldName = 'Expr1000'
    end
  end
  object dsSaldo: TDataSource
    DataSet = qrySaldo
    Left = 600
    Top = 24
  end
  object tmrAtualiza: TTimer
    Interval = 10000
    OnTimer = tmrAtualizaTimer
    Left = 504
    Top = 65520
  end
  object qryReceber: TADOQuery
    Connection = conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select L.COD_LEMBRETE, L.DATA as '#39'Data'#39', L.DESCRICAO as '#39'Descric' +
        'ao'#39','
      ' L.VALOR as '#39'Valor'#39' from TbLembrete L where L.TIPO_LEMBRETE = 3;')
    Left = 648
    Top = 65520
    object UsuReceberCOD_LEMBRETE: TAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_LEMBRETE'
      ReadOnly = True
    end
    object dtmfldReceberData: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = #39'Data'#39
    end
    object UsuReceberDescricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = #39'Descricao'#39
      Size = 65
    end
    object fltfldReceberValor: TFloatField
      DisplayLabel = 'Valor'
      FieldName = #39'Valor'#39
      DisplayFormat = '0.00'
    end
  end
  object dsReceber: TDataSource
    DataSet = qryReceber
    Left = 680
    Top = 65520
  end
  object qryPagar: TADOQuery
    Connection = conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select L.COD_LEMBRETE, L.DATA as '#39'Data'#39', L.DESCRICAO as '#39'Descric' +
        'ao'#39','
      ' L.VALOR as '#39'Valor'#39' from TbLembrete L where L.TIPO_LEMBRETE = 2;')
    Left = 264
    Top = 32
    object UsuPagarCOD_LEMBRETE: TAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_LEMBRETE'
      ReadOnly = True
    end
    object dtmfld1: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = #39'Data'#39
    end
    object Usu1: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = #39'Descricao'#39
      Size = 65
    end
    object fltfld2: TFloatField
      DisplayLabel = 'Valor'
      FieldName = #39'Valor'#39
      DisplayFormat = '0.00'
    end
  end
  object dsPagar: TDataSource
    DataSet = qryPagar
    Left = 288
    Top = 32
  end
  object dsExcluir: TDataSource
    DataSet = qryExcluir
    Left = 200
    Top = 32
  end
  object qryExcluir: TADOQuery
    Connection = conexao
    CursorType = ctStatic
    Parameters = <>
    Left = 176
    Top = 32
    object Usu2: TAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_LEMBRETE'
      ReadOnly = True
    end
    object dtmfld2: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = #39'Data'#39
    end
    object Usu3: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = #39'Descricao'#39
      Size = 65
    end
    object fltfld3: TFloatField
      DisplayLabel = 'Valor'
      FieldName = #39'Valor'#39
      DisplayFormat = '0.00'
    end
  end
end
