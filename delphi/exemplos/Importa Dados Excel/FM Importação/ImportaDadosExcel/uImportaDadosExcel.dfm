object frmImportaDadosExcel: TfrmImportaDadosExcel
  Left = 229
  Top = 159
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Importar Dados Excel'
  ClientHeight = 391
  ClientWidth = 746
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblFileName: TLabel
    Left = 144
    Top = 10
    Width = 537
    Height = 24
    AutoSize = False
    Color = cl3DLight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object lbl1: TLabel
    Left = 688
    Top = 10
    Width = 41
    Height = 24
    Align = alCustom
    Alignment = taCenter
    AutoSize = False
    Color = cl3DLight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 224
    Top = 49
    Width = 49
    Height = 21
    AutoSize = False
    Color = cl3DLight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object lbl3: TLabel
    Left = 144
    Top = 48
    Width = 71
    Height = 19
    Caption = 'Registros:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object btn1: TSpeedButton
    Left = 648
    Top = 48
    Width = 81
    Height = 25
    Caption = 'Sair'
    OnClick = btn1Click
  end
  object lbl4: TLabel
    Left = 304
    Top = 48
    Width = 89
    Height = 19
    Caption = 'Importando:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblTipo: TLabel
    Left = 400
    Top = 49
    Width = 153
    Height = 21
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
  object btnSelecionar: TButton
    Left = 16
    Top = 8
    Width = 113
    Height = 25
    Caption = 'Selecionar Arquivo'
    TabOrder = 0
    OnClick = btnSelecionarClick
  end
  object btnCarregar: TButton
    Left = 16
    Top = 48
    Width = 113
    Height = 25
    Caption = 'Carregar Arquivo'
    Enabled = False
    TabOrder = 1
    OnClick = btnCarregarClick
  end
  object dbgrd1: TDBGrid
    Left = 16
    Top = 88
    Width = 713
    Height = 273
    DataSource = dsFor
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object statusBar: TStatusBar
    Left = 0
    Top = 372
    Width = 746
    Height = 19
    Panels = <
      item
        Width = 150
      end>
  end
  object dlgOpen1: TOpenDialog
    Filter = 'arquivos do Excel|*.xls;*.xlsx'
    Left = 392
    Top = 65528
  end
  object con1: TSQLConnection
    ConnectionName = 'wsrei'
    DriverName = 'DevartInterBase'
    GetDriverFunc = 'getSQLDriverInterBase'
    LibraryName = 'dbexpida.dll'
    LoadParamsOnConnect = True
    Params.Strings = (
      'DriverName=DevartInterBase'
      'DataBase=pc:wsrei-novo'
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'DevartInterBase TransIsolation=ReadCommited')
    VendorLib = 'fbclient.DLL'
    OnLogin = con1Login
    Connected = True
    Left = 320
    Top = 65528
  end
  object sqlFor: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select F.* '
      'from CADFOR F'
      'where F.CODIGO = '#39#39)
    SQLConnection = con1
    Left = 456
    Top = 65528
    object strngfldForCODIGO: TStringField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      FixedChar = True
      Size = 5
    end
    object strngfldForRAZAO: TStringField
      FieldName = 'RAZAO'
      Size = 50
    end
    object strngfldForFANTASIA: TStringField
      FieldName = 'FANTASIA'
      Size = 50
    end
    object strngfldForCGC: TStringField
      FieldName = 'CGC'
      Size = 18
    end
    object strngfldForTIPOINS: TStringField
      FieldName = 'TIPOINS'
      FixedChar = True
      Size = 1
    end
    object strngfldForINSCR: TStringField
      FieldName = 'INSCR'
      Size = 17
    end
    object strngfldForFONE: TStringField
      FieldName = 'FONE'
      Size = 25
    end
    object strngfldForFAX: TStringField
      FieldName = 'FAX'
      Size = 15
    end
    object strngfldForEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object strngfldForENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object UsuForNUMERO: TIntegerField
      FieldName = 'NUMERO'
    end
    object strngfldForCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
    end
    object strngfldForBAIRRO: TStringField
      FieldName = 'BAIRRO'
    end
    object strngfldForCEP: TStringField
      FieldName = 'CEP'
      FixedChar = True
      Size = 9
    end
    object strngfldForCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object strngfldForESTADO: TStringField
      FieldName = 'ESTADO'
      FixedChar = True
      Size = 2
    end
    object strngfldForCODCID: TStringField
      FieldName = 'CODCID'
      Size = 7
    end
    object sqlForOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
    end
    object strngfldForCONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 25
    end
    object strngfldForFONECONT: TStringField
      FieldName = 'FONECONT'
    end
    object strngfldForTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object UsuForATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object sqlForLEMBRETE: TMemoField
      FieldName = 'LEMBRETE'
      BlobType = ftMemo
    end
    object strngfldForLEMB_ATIVO: TStringField
      FieldName = 'LEMB_ATIVO'
      FixedChar = True
      Size = 1
    end
    object strngfldForSTATUS: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object dpsFor: TDataSetProvider
    DataSet = sqlFor
    UpdateMode = upWhereKeyOnly
    Left = 496
    Top = 65528
  end
  object cdsFor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dpsFor'
    Left = 536
    Top = 65528
    object strngfldForCODIGO1: TStringField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      FixedChar = True
      Size = 5
    end
    object strngfldForRAZAO1: TStringField
      FieldName = 'RAZAO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object strngfldForFANTASIA1: TStringField
      FieldName = 'FANTASIA'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object strngfldForCGC1: TStringField
      FieldName = 'CGC'
      ProviderFlags = [pfInUpdate]
      Size = 18
    end
    object strngfldForTIPOINS1: TStringField
      FieldName = 'TIPOINS'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object strngfldForINSCR1: TStringField
      FieldName = 'INSCR'
      ProviderFlags = [pfInUpdate]
      Size = 17
    end
    object strngfldForFONE1: TStringField
      FieldName = 'FONE'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object strngfldForFAX1: TStringField
      FieldName = 'FAX'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object strngfldForEMAIL1: TStringField
      FieldName = 'EMAIL'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object strngfldForENDERECO1: TStringField
      FieldName = 'ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object UsuForNUMERO1: TIntegerField
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate]
    end
    object strngfldForCOMPLEMENTO1: TStringField
      FieldName = 'COMPLEMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object strngfldForBAIRRO1: TStringField
      FieldName = 'BAIRRO'
      ProviderFlags = [pfInUpdate]
    end
    object strngfldForCEP1: TStringField
      FieldName = 'CEP'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 9
    end
    object strngfldForCIDADE1: TStringField
      FieldName = 'CIDADE'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object strngfldForESTADO1: TStringField
      FieldName = 'ESTADO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object strngfldForCODCID1: TStringField
      FieldName = 'CODCID'
      ProviderFlags = [pfInUpdate]
      Size = 7
    end
    object cdsForOBS: TMemoField
      FieldName = 'OBS'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object strngfldForCONTATO1: TStringField
      FieldName = 'CONTATO'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object strngfldForFONECONT1: TStringField
      FieldName = 'FONECONT'
      ProviderFlags = [pfInUpdate]
    end
    object strngfldForTIPO1: TStringField
      FieldName = 'TIPO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object UsuForATIVO1: TIntegerField
      FieldName = 'ATIVO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsForLEMBRETE: TMemoField
      FieldName = 'LEMBRETE'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object strngfldForLEMB_ATIVO1: TStringField
      FieldName = 'LEMB_ATIVO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object strngfldForSTATUS1: TStringField
      FieldName = 'STATUS'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
  end
  object dsFor: TDataSource
    DataSet = cdsFor
    Left = 424
    Top = 65528
  end
  object sqlCli: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select C.* '
      'from CADCLI C'
      'where C.CODIGO = '#39#39)
    SQLConnection = con1
    Left = 200
    Top = 65528
    object strngfldsql1CODIGO: TStringField
      FieldName = 'CODIGO'
      FixedChar = True
      Size = 5
    end
    object strngfldsql1RAZAO: TStringField
      FieldName = 'RAZAO'
      Size = 37
    end
    object strngfldsql1FANTASIA: TStringField
      FieldName = 'FANTASIA'
      Size = 30
    end
    object strngfldsql1CGC: TStringField
      FieldName = 'CGC'
      Size = 18
    end
    object strngfldsql1TIPOINS: TStringField
      FieldName = 'TIPOINS'
      FixedChar = True
      Size = 1
    end
    object strngfldsql1INSCR: TStringField
      FieldName = 'INSCR'
      Size = 17
    end
    object strngfldsql1FONE: TStringField
      FieldName = 'FONE'
      Size = 30
    end
    object strngfldsql1FAX: TStringField
      FieldName = 'FAX'
      Size = 15
    end
    object strngfldsql1EMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object strngfldsql1ENDENTR: TStringField
      FieldName = 'ENDENTR'
      Size = 35
    end
    object Ususql1NUMENTR: TIntegerField
      FieldName = 'NUMENTR'
    end
    object strngfldsql1COMENTR: TStringField
      FieldName = 'COMENTR'
      Size = 30
    end
    object strngfldsql1BAIENTR: TStringField
      FieldName = 'BAIENTR'
    end
    object strngfldsql1CEPENTR: TStringField
      FieldName = 'CEPENTR'
      Size = 9
    end
    object strngfldsql1CIDENTR: TStringField
      FieldName = 'CIDENTR'
      Size = 30
    end
    object strngfldsql1ESTENTR: TStringField
      FieldName = 'ESTENTR'
      Size = 2
    end
    object strngfldsql1ENDCOBR: TStringField
      FieldName = 'ENDCOBR'
      Size = 35
    end
    object Ususql1NUMCOBR: TIntegerField
      FieldName = 'NUMCOBR'
    end
    object strngfldsql1COMCOBR: TStringField
      FieldName = 'COMCOBR'
      Size = 30
    end
    object strngfldsql1BAICOBR: TStringField
      FieldName = 'BAICOBR'
    end
    object strngfldsql1CEPCOBR: TStringField
      FieldName = 'CEPCOBR'
      Size = 9
    end
    object strngfldsql1CIDCOBR: TStringField
      FieldName = 'CIDCOBR'
      Size = 30
    end
    object strngfldsql1ESTCOBR: TStringField
      FieldName = 'ESTCOBR'
      Size = 2
    end
    object strngfldsql1CODBAN: TStringField
      FieldName = 'CODBAN'
      FixedChar = True
      Size = 3
    end
    object strngfldsql1REGIAO: TStringField
      FieldName = 'REGIAO'
      FixedChar = True
      Size = 3
    end
    object strngfldsql1CODVEND: TStringField
      FieldName = 'CODVEND'
      FixedChar = True
      Size = 3
    end
    object strngfldsql1COBRANCA: TStringField
      FieldName = 'COBRANCA'
      FixedChar = True
      Size = 3
    end
    object Ususql1NUM_COMPRA: TIntegerField
      FieldName = 'NUM_COMPRA'
    end
    object strngfldsql1OBS: TStringField
      FieldName = 'OBS'
      Size = 100
    end
    object Ususql1CARTORIOS: TIntegerField
      FieldName = 'CARTORIOS'
    end
    object Ususql1PROTESTOS: TIntegerField
      FieldName = 'PROTESTOS'
    end
    object strngfldsql1COMPRADOR: TStringField
      FieldName = 'COMPRADOR'
    end
    object strngfldsql1FONE_COMP: TStringField
      FieldName = 'FONE_COMP'
    end
    object sqlCliCLI_DESDE: TDateField
      FieldName = 'CLI_DESDE'
    end
    object sqlCliULT_COMPRA: TDateField
      FieldName = 'ULT_COMPRA'
    end
    object Ususql1NEGATIVADO: TIntegerField
      FieldName = 'NEGATIVADO'
    end
    object fmtbcdfldsql1LIM_CRED: TFMTBCDField
      FieldName = 'LIM_CRED'
      Precision = 20
      Size = 2
    end
    object sqlCliLIM_VENCTO: TDateField
      FieldName = 'LIM_VENCTO'
    end
    object Ususql1BLOQ_VEN: TIntegerField
      FieldName = 'BLOQ_VEN'
    end
    object strngfldsql1MOTIVO_NEG: TStringField
      FieldName = 'MOTIVO_NEG'
    end
    object strngfldsql1DESBL_VEN: TStringField
      FieldName = 'DESBL_VEN'
    end
    object sqlCliCOMPLEMENT: TMemoField
      FieldName = 'COMPLEMENT'
      BlobType = ftMemo
    end
    object strngfldsql1INTERNET: TStringField
      FieldName = 'INTERNET'
      Size = 40
    end
    object strngfldsql1MALADIR: TStringField
      FieldName = 'MALADIR'
      FixedChar = True
      Size = 1
    end
    object strngfldsql1TIPOCLI: TStringField
      FieldName = 'TIPOCLI'
      FixedChar = True
      Size = 1
    end
    object strngfldsql1TIPOCAD: TStringField
      FieldName = 'TIPOCAD'
      FixedChar = True
      Size = 1
    end
    object sqlCliTVULTCONT: TDateField
      FieldName = 'TVULTCONT'
    end
    object sqlCliTVPROXCONT: TDateField
      FieldName = 'TVPROXCONT'
    end
    object Ususql1TVCOMPROU: TIntegerField
      FieldName = 'TVCOMPROU'
    end
    object Ususql1TVFREQPED: TIntegerField
      FieldName = 'TVFREQPED'
    end
    object sqlCliTVOBS: TMemoField
      FieldName = 'TVOBS'
      BlobType = ftMemo
    end
    object strngfldsql1TVOPERADOR: TStringField
      FieldName = 'TVOPERADOR'
    end
    object strngfldsql1TVDIFICULD: TStringField
      FieldName = 'TVDIFICULD'
      Size = 35
    end
    object strngfldsql1TVRAMOATIV: TStringField
      FieldName = 'TVRAMOATIV'
      FixedChar = True
      Size = 3
    end
    object strngfldsql1TVCODIGO: TStringField
      FieldName = 'TVCODIGO'
      FixedChar = True
      Size = 3
    end
    object Ususql1FICHAS: TIntegerField
      FieldName = 'FICHAS'
    end
    object sqlCliLEMBRETE: TMemoField
      FieldName = 'LEMBRETE'
      BlobType = ftMemo
    end
    object Ususql1LEMBATIVO: TIntegerField
      FieldName = 'LEMBATIVO'
    end
    object strngfldsql1TABELA: TStringField
      FieldName = 'TABELA'
      FixedChar = True
      Size = 1
    end
    object strngfldsql1SITUACAO_ICMS: TStringField
      FieldName = 'SITUACAO_ICMS'
      FixedChar = True
      Size = 1
    end
    object strngfldsql1CODCID: TStringField
      FieldName = 'CODCID'
      Size = 7
    end
    object strngfldsql1CODPAIS: TStringField
      FieldName = 'CODPAIS'
      Size = 5
    end
    object sqlCliCONTANIVER: TDateField
      FieldName = 'CONTANIVER'
    end
    object strngfldsql1INSCRITO_SUFRAMA: TStringField
      FieldName = 'INSCRITO_SUFRAMA'
      FixedChar = True
      Size = 1
    end
    object strngfldsql1SUFRAMA: TStringField
      FieldName = 'SUFRAMA'
      Size = 10
    end
  end
  object sqlVend: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select V.* '
      'from CADVEND V'
      'where V.CODIGO = '#39#39)
    SQLConnection = con1
    Left = 608
    Top = 65528
    object strngfldsql2CODIGO: TStringField
      FieldName = 'CODIGO'
      FixedChar = True
      Size = 3
    end
    object strngfldsql2NOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object strngfldsql2TIPO: TStringField
      FieldName = 'TIPO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object strngfldsql2TELEFONE: TStringField
      FieldName = 'TELEFONE'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object strngfldsql2ENDERECO: TStringField
      FieldName = 'ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object strngfldsql2BAIRRO: TStringField
      FieldName = 'BAIRRO'
      ProviderFlags = [pfInUpdate]
    end
    object strngfldsql2CEP: TStringField
      FieldName = 'CEP'
      ProviderFlags = [pfInUpdate]
      Size = 9
    end
    object strngfldsql2CIDADE: TStringField
      FieldName = 'CIDADE'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object strngfldsql2ESTADO: TStringField
      FieldName = 'ESTADO'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object strngfldsql2EMAIL: TStringField
      FieldName = 'EMAIL'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object fmtbcdfldsql2COMISSAO: TFMTBCDField
      FieldName = 'COMISSAO'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 2
    end
    object Ususql2CONTROLE: TIntegerField
      FieldName = 'CONTROLE'
      ProviderFlags = [pfInUpdate]
    end
    object fmtbcdfldsql2COMIS_A: TFMTBCDField
      FieldName = 'COMIS_A'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 2
    end
    object fmtbcdfldsql2COMIS_I: TFMTBCDField
      FieldName = 'COMIS_I'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 2
    end
    object sqlVendNASCTO: TDateField
      FieldName = 'NASCTO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dpsVend: TDataSetProvider
    DataSet = sqlVend
    UpdateMode = upWhereKeyOnly
    Left = 640
    Top = 65528
  end
  object dpsCli: TDataSetProvider
    DataSet = sqlCli
    UpdateMode = upWhereKeyOnly
    Left = 240
    Top = 65528
  end
  object cdsCli: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dpsCli'
    Left = 280
    Top = 65528
    object strngfldcds1CODIGO: TStringField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      FixedChar = True
      Size = 5
    end
    object strngfldcds1RAZAO: TStringField
      FieldName = 'RAZAO'
      ProviderFlags = [pfInUpdate]
      Size = 37
    end
    object strngfldcds1FANTASIA: TStringField
      FieldName = 'FANTASIA'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object strngfldcds1CGC: TStringField
      FieldName = 'CGC'
      ProviderFlags = [pfInUpdate]
      Size = 18
    end
    object strngfldcds1TIPOINS: TStringField
      FieldName = 'TIPOINS'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object strngfldcds1INSCR: TStringField
      FieldName = 'INSCR'
      ProviderFlags = [pfInUpdate]
      Size = 17
    end
    object strngfldcds1FONE: TStringField
      FieldName = 'FONE'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object strngfldcds1FAX: TStringField
      FieldName = 'FAX'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object strngfldcds1EMAIL: TStringField
      FieldName = 'EMAIL'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object strngfldcds1ENDENTR: TStringField
      FieldName = 'ENDENTR'
      ProviderFlags = [pfInUpdate]
      Size = 35
    end
    object Usucds1NUMENTR: TIntegerField
      FieldName = 'NUMENTR'
      ProviderFlags = [pfInUpdate]
    end
    object strngfldcds1COMENTR: TStringField
      FieldName = 'COMENTR'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object strngfldcds1BAIENTR: TStringField
      FieldName = 'BAIENTR'
      ProviderFlags = [pfInUpdate]
    end
    object strngfldcds1CEPENTR: TStringField
      FieldName = 'CEPENTR'
      ProviderFlags = [pfInUpdate]
      Size = 9
    end
    object strngfldcds1CIDENTR: TStringField
      FieldName = 'CIDENTR'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object strngfldcds1ESTENTR: TStringField
      FieldName = 'ESTENTR'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object strngfldcds1ENDCOBR: TStringField
      FieldName = 'ENDCOBR'
      ProviderFlags = [pfInUpdate]
      Size = 35
    end
    object Usucds1NUMCOBR: TIntegerField
      FieldName = 'NUMCOBR'
      ProviderFlags = [pfInUpdate]
    end
    object strngfldcds1COMCOBR: TStringField
      FieldName = 'COMCOBR'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object strngfldcds1BAICOBR: TStringField
      FieldName = 'BAICOBR'
      ProviderFlags = [pfInUpdate]
    end
    object strngfldcds1CEPCOBR: TStringField
      FieldName = 'CEPCOBR'
      ProviderFlags = [pfInUpdate]
      Size = 9
    end
    object strngfldcds1CIDCOBR: TStringField
      FieldName = 'CIDCOBR'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object strngfldcds1ESTCOBR: TStringField
      FieldName = 'ESTCOBR'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object strngfldcds1CODBAN: TStringField
      FieldName = 'CODBAN'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object strngfldcds1REGIAO: TStringField
      FieldName = 'REGIAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object strngfldcds1CODVEND: TStringField
      FieldName = 'CODVEND'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object strngfldcds1COBRANCA: TStringField
      FieldName = 'COBRANCA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object Usucds1NUM_COMPRA: TIntegerField
      FieldName = 'NUM_COMPRA'
      ProviderFlags = [pfInUpdate]
    end
    object strngfldcds1OBS: TStringField
      FieldName = 'OBS'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object Usucds1CARTORIOS: TIntegerField
      FieldName = 'CARTORIOS'
      ProviderFlags = [pfInUpdate]
    end
    object Usucds1PROTESTOS: TIntegerField
      FieldName = 'PROTESTOS'
      ProviderFlags = [pfInUpdate]
    end
    object strngfldcds1COMPRADOR: TStringField
      FieldName = 'COMPRADOR'
      ProviderFlags = [pfInUpdate]
    end
    object strngfldcds1FONE_COMP: TStringField
      FieldName = 'FONE_COMP'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCliCLI_DESDE: TDateField
      FieldName = 'CLI_DESDE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCliULT_COMPRA: TDateField
      FieldName = 'ULT_COMPRA'
      ProviderFlags = [pfInUpdate]
    end
    object Usucds1NEGATIVADO: TIntegerField
      FieldName = 'NEGATIVADO'
      ProviderFlags = [pfInUpdate]
    end
    object fmtbcdfldcds1LIM_CRED: TFMTBCDField
      FieldName = 'LIM_CRED'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 2
    end
    object cdsCliLIM_VENCTO: TDateField
      FieldName = 'LIM_VENCTO'
      ProviderFlags = [pfInUpdate]
    end
    object Usucds1BLOQ_VEN: TIntegerField
      FieldName = 'BLOQ_VEN'
      ProviderFlags = [pfInUpdate]
    end
    object strngfldcds1MOTIVO_NEG: TStringField
      FieldName = 'MOTIVO_NEG'
      ProviderFlags = [pfInUpdate]
    end
    object strngfldcds1DESBL_VEN: TStringField
      FieldName = 'DESBL_VEN'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCliCOMPLEMENT: TMemoField
      FieldName = 'COMPLEMENT'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object strngfldcds1INTERNET: TStringField
      FieldName = 'INTERNET'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object strngfldcds1MALADIR: TStringField
      FieldName = 'MALADIR'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object strngfldcds1TIPOCLI: TStringField
      FieldName = 'TIPOCLI'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object strngfldcds1TIPOCAD: TStringField
      FieldName = 'TIPOCAD'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsCliTVULTCONT: TDateField
      FieldName = 'TVULTCONT'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCliTVPROXCONT: TDateField
      FieldName = 'TVPROXCONT'
      ProviderFlags = [pfInUpdate]
    end
    object Usucds1TVCOMPROU: TIntegerField
      FieldName = 'TVCOMPROU'
      ProviderFlags = [pfInUpdate]
    end
    object Usucds1TVFREQPED: TIntegerField
      FieldName = 'TVFREQPED'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCliTVOBS: TMemoField
      FieldName = 'TVOBS'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object strngfldcds1TVOPERADOR: TStringField
      FieldName = 'TVOPERADOR'
      ProviderFlags = [pfInUpdate]
    end
    object strngfldcds1TVDIFICULD: TStringField
      FieldName = 'TVDIFICULD'
      ProviderFlags = [pfInUpdate]
      Size = 35
    end
    object strngfldcds1TVRAMOATIV: TStringField
      FieldName = 'TVRAMOATIV'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object strngfldcds1TVCODIGO: TStringField
      FieldName = 'TVCODIGO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object Usucds1FICHAS: TIntegerField
      FieldName = 'FICHAS'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCliLEMBRETE: TMemoField
      FieldName = 'LEMBRETE'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object Usucds1LEMBATIVO: TIntegerField
      FieldName = 'LEMBATIVO'
      ProviderFlags = [pfInUpdate]
    end
    object strngfldcds1TABELA: TStringField
      FieldName = 'TABELA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object strngfldcds1SITUACAO_ICMS: TStringField
      FieldName = 'SITUACAO_ICMS'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object strngfldcds1CODCID: TStringField
      FieldName = 'CODCID'
      ProviderFlags = [pfInUpdate]
      Size = 7
    end
    object strngfldcds1CODPAIS: TStringField
      FieldName = 'CODPAIS'
      ProviderFlags = [pfInUpdate]
      Size = 5
    end
    object cdsCliCONTANIVER: TDateField
      FieldName = 'CONTANIVER'
      ProviderFlags = [pfInUpdate]
    end
    object strngfldcds1INSCRITO_SUFRAMA: TStringField
      FieldName = 'INSCRITO_SUFRAMA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object strngfldcds1SUFRAMA: TStringField
      FieldName = 'SUFRAMA'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
  end
  object cdsVend: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dpsVend'
    Left = 672
    Top = 65528
    object strngfldVendCODIGO: TStringField
      FieldName = 'CODIGO'
      FixedChar = True
      Size = 3
    end
    object strngfldVendNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object strngfldVendTIPO: TStringField
      FieldName = 'TIPO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object strngfldVendTELEFONE: TStringField
      FieldName = 'TELEFONE'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object strngfldVendENDERECO: TStringField
      FieldName = 'ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object strngfldVendBAIRRO: TStringField
      FieldName = 'BAIRRO'
      ProviderFlags = [pfInUpdate]
    end
    object strngfldVendCEP: TStringField
      FieldName = 'CEP'
      ProviderFlags = [pfInUpdate]
      Size = 9
    end
    object strngfldVendCIDADE: TStringField
      FieldName = 'CIDADE'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object strngfldVendESTADO: TStringField
      FieldName = 'ESTADO'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object strngfldVendEMAIL: TStringField
      FieldName = 'EMAIL'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object fmtbcdfldVendCOMISSAO: TFMTBCDField
      FieldName = 'COMISSAO'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 2
    end
    object UsuVendCONTROLE: TIntegerField
      FieldName = 'CONTROLE'
      ProviderFlags = [pfInUpdate]
    end
    object fmtbcdfldVendCOMIS_A: TFMTBCDField
      FieldName = 'COMIS_A'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 2
    end
    object fmtbcdfldVendCOMIS_I: TFMTBCDField
      FieldName = 'COMIS_I'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 2
    end
    object cdsVendNASCTO: TDateField
      FieldName = 'NASCTO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dsCli: TDataSource
    DataSet = cdsCli
    Left = 168
    Top = 65528
  end
  object sqlPro: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select * '
      'from CADPRO'
      'where CODIGO = '#39#39)
    SQLConnection = con1
    Left = 408
    Top = 40
    object strngfldProCODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      FixedChar = True
      Size = 8
    end
    object strngfldProCLASSE: TStringField
      FieldName = 'CLASSE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object strngfldProCATEGORIA: TStringField
      FieldName = 'CATEGORIA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object strngfldProDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 46
    end
    object strngfldProDESCRICAO_REDUZIDA: TStringField
      FieldName = 'DESCRICAO_REDUZIDA'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object strngfldProREFER: TStringField
      FieldName = 'REFER'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object strngfldProUNIDADE: TStringField
      FieldName = 'UNIDADE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object strngfldProCODTRIB: TStringField
      FieldName = 'CODTRIB'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object fmtbcdfldProEST_MIN: TFMTBCDField
      FieldName = 'EST_MIN'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 3
    end
    object fmtbcdfldProEST_ATUAL: TFMTBCDField
      FieldName = 'EST_ATUAL'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 5
    end
    object fmtbcdfldProQTD_RESER: TFMTBCDField
      FieldName = 'QTD_RESER'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 5
    end
    object fmtbcdfldProCUSTO_MED: TFMTBCDField
      FieldName = 'CUSTO_MED'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 3
    end
    object fmtbcdfldProULT_CUSTO: TFMTBCDField
      FieldName = 'ULT_CUSTO'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 3
    end
    object sqlProDATA_PRECO: TDateField
      FieldName = 'DATA_PRECO'
      ProviderFlags = [pfInUpdate]
    end
    object fmtbcdfldProPRECO_VEND: TFMTBCDField
      FieldName = 'PRECO_VEND'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 3
    end
    object fmtbcdfldProPRECO_PROMO: TFMTBCDField
      FieldName = 'PRECO_PROMO'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 3
    end
    object UsuProPROMOCIONAL: TIntegerField
      FieldName = 'PROMOCIONAL'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProPROMO_INICIO: TDateField
      FieldName = 'PROMO_INICIO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProPROMO_FIM: TDateField
      FieldName = 'PROMO_FIM'
      ProviderFlags = [pfInUpdate]
    end
    object fmtbcdfldProPESO: TFMTBCDField
      FieldName = 'PESO'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 3
    end
    object fmtbcdfldProPESO_LIQUIDO: TFMTBCDField
      FieldName = 'PESO_LIQUIDO'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 3
    end
    object fmtbcdfldProIPI: TFMTBCDField
      FieldName = 'IPI'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 2
    end
    object strngfldProC_ESTOQUE: TStringField
      FieldName = 'C_ESTOQUE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object fmtbcdfldProMARGEM: TFMTBCDField
      FieldName = 'MARGEM'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 2
    end
    object strngfldProESPESSURA: TStringField
      FieldName = 'ESPESSURA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object strngfldProCOMPRIM: TStringField
      FieldName = 'COMPRIM'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object fmtbcdfldProTABELAIND: TFMTBCDField
      FieldName = 'TABELAIND'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 3
    end
    object fmtbcdfldProBASE_CUSTO: TFMTBCDField
      FieldName = 'BASE_CUSTO'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 2
    end
    object fmtbcdfldProMARGEMATAC: TFMTBCDField
      FieldName = 'MARGEMATAC'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 2
    end
    object fmtbcdfldProPRECO_ATAC: TFMTBCDField
      FieldName = 'PRECO_ATAC'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 3
    end
    object strngfldProTRIBUTACAO: TStringField
      FieldName = 'TRIBUTACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object strngfldProOLD_CLASS_FISCAL: TStringField
      FieldName = 'OLD_CLASS_FISCAL'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
    object UsuProCLASSIF_FISCAL: TIntegerField
      FieldName = 'CLASSIF_FISCAL'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProDATABAL: TDateField
      FieldName = 'DATABAL'
      ProviderFlags = [pfInUpdate]
    end
    object fmtbcdfldProESTOQUEBAL: TFMTBCDField
      FieldName = 'ESTOQUEBAL'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 3
    end
    object fmtbcdfldProBALANCO: TFMTBCDField
      FieldName = 'BALANCO'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 3
    end
    object fmtbcdfldProBALVALOR: TFMTBCDField
      FieldName = 'BALVALOR'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 2
    end
    object strngfldProEMBALAGEM: TStringField
      FieldName = 'EMBALAGEM'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object UsuProATIVO: TIntegerField
      FieldName = 'ATIVO'
      ProviderFlags = [pfInUpdate]
    end
    object strngfldProORIGEM_PRODUTO: TStringField
      FieldName = 'ORIGEM_PRODUTO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object strngfldProCODIGOBARRAS: TStringField
      FieldName = 'CODIGOBARRAS'
      ProviderFlags = [pfInUpdate]
      Size = 13
    end
    object UsuProID_COMPCUSTO: TIntegerField
      FieldName = 'ID_COMPCUSTO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProADICIONAIS_NF: TMemoField
      FieldName = 'ADICIONAIS_NF'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object UsuProNUMEROS_DE_SERIE: TIntegerField
      FieldName = 'NUMEROS_DE_SERIE'
      ProviderFlags = [pfInUpdate]
    end
    object UsuProNUMEROS_DE_SERIE_ENTRADA: TIntegerField
      FieldName = 'NUMEROS_DE_SERIE_ENTRADA'
      ProviderFlags = [pfInUpdate]
    end
    object strngfldProSITUACAO_SIMPLES: TStringField
      FieldName = 'SITUACAO_SIMPLES'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object strngfldProTIPOPROD: TStringField
      FieldName = 'TIPOPROD'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object strngfldProSTATUS: TStringField
      FieldName = 'STATUS'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object strngfldProTIPO_ITEM: TStringField
      FieldName = 'TIPO_ITEM'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object strngfldProCADASTROSITE: TStringField
      FieldName = 'CADASTROSITE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object fmtbcdfldProID_INTEGRA_SITE: TFMTBCDField
      FieldName = 'ID_INTEGRA_SITE'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 0
    end
    object fmtbcdfldProID_INTEGRA_SITE_FOTO: TFMTBCDField
      FieldName = 'ID_INTEGRA_SITE_FOTO'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 0
    end
    object strngfldProDESCRICAO_SITE: TStringField
      FieldName = 'DESCRICAO_SITE'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object strngfldProLANCAMENTO: TStringField
      FieldName = 'LANCAMENTO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object strngfldProSITE_DESTAQUE: TStringField
      FieldName = 'SITE_DESTAQUE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object sqlProFICHATECNICA_SITE: TMemoField
      FieldName = 'FICHATECNICA_SITE'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object strngfldProDIMENSOES: TStringField
      FieldName = 'DIMENSOES'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object fmtbcdfldProMARGEM_SITE: TFMTBCDField
      FieldName = 'MARGEM_SITE'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 2
    end
    object fmtbcdfldProPRECO_SITE: TFMTBCDField
      FieldName = 'PRECO_SITE'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 3
    end
    object fmtbcdfldProPRECO_PROMO_SITE: TFMTBCDField
      FieldName = 'PRECO_PROMO_SITE'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 3
    end
    object sqlProPROMO_INI_SITE: TSQLTimeStampField
      FieldName = 'PROMO_INI_SITE'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProPROMO_FIM_SITE: TSQLTimeStampField
      FieldName = 'PROMO_FIM_SITE'
      ProviderFlags = [pfInUpdate]
    end
    object strngfldProENDERECO_ESTOQUE: TStringField
      FieldName = 'ENDERECO_ESTOQUE'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object fmtbcdfldProCUSTO_UNIT: TFMTBCDField
      FieldName = 'CUSTO_UNIT'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 4
    end
    object fmtbcdfldProCUSTO_VLR_FRETE: TFMTBCDField
      FieldName = 'CUSTO_VLR_FRETE'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 4
    end
    object fmtbcdfldProCUSTO_VLR_SEGURO: TFMTBCDField
      FieldName = 'CUSTO_VLR_SEGURO'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 4
    end
    object fmtbcdfldProCUSTO_VLR_OUTROS: TFMTBCDField
      FieldName = 'CUSTO_VLR_OUTROS'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 4
    end
    object fmtbcdfldProCUSTO_VLR_ICMS_ST: TFMTBCDField
      FieldName = 'CUSTO_VLR_ICMS_ST'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 4
    end
    object fmtbcdfldProCUSTO_VLR_IPI: TFMTBCDField
      FieldName = 'CUSTO_VLR_IPI'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 4
    end
    object fmtbcdfldProESTOQUE_INDISP: TFMTBCDField
      FieldName = 'ESTOQUE_INDISP'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 5
    end
    object strngfldProCST_IPI: TStringField
      FieldName = 'CST_IPI'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
  end
  object cdsPro: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dpsPro'
    Left = 488
    Top = 40
    object strngfldProCODIGO1: TStringField
      FieldName = 'CODIGO'
      Required = True
      FixedChar = True
      Size = 8
    end
    object strngfldProCLASSE1: TStringField
      FieldName = 'CLASSE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object strngfldProCATEGORIA1: TStringField
      FieldName = 'CATEGORIA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object strngfldProDESCRICAO1: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 46
    end
    object strngfldProDESCRICAO_REDUZIDA1: TStringField
      FieldName = 'DESCRICAO_REDUZIDA'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object strngfldProREFER1: TStringField
      FieldName = 'REFER'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object strngfldProUNIDADE1: TStringField
      FieldName = 'UNIDADE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object strngfldProCODTRIB1: TStringField
      FieldName = 'CODTRIB'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object fmtbcdfldProEST_MIN1: TFMTBCDField
      FieldName = 'EST_MIN'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 3
    end
    object fmtbcdfldProEST_ATUAL1: TFMTBCDField
      FieldName = 'EST_ATUAL'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 5
    end
    object fmtbcdfldProQTD_RESER1: TFMTBCDField
      FieldName = 'QTD_RESER'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 5
    end
    object fmtbcdfldProCUSTO_MED1: TFMTBCDField
      FieldName = 'CUSTO_MED'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 3
    end
    object fmtbcdfldProULT_CUSTO1: TFMTBCDField
      FieldName = 'ULT_CUSTO'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 3
    end
    object cdsProDATA_PRECO: TDateField
      FieldName = 'DATA_PRECO'
      ProviderFlags = [pfInUpdate]
    end
    object fmtbcdfldProPRECO_VEND1: TFMTBCDField
      FieldName = 'PRECO_VEND'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 3
    end
    object fmtbcdfldProPRECO_PROMO1: TFMTBCDField
      FieldName = 'PRECO_PROMO'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 3
    end
    object UsuProPROMOCIONAL1: TIntegerField
      FieldName = 'PROMOCIONAL'
      ProviderFlags = [pfInUpdate]
    end
    object cdsProPROMO_INICIO: TDateField
      FieldName = 'PROMO_INICIO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsProPROMO_FIM: TDateField
      FieldName = 'PROMO_FIM'
      ProviderFlags = [pfInUpdate]
    end
    object fmtbcdfldProPESO1: TFMTBCDField
      FieldName = 'PESO'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 3
    end
    object fmtbcdfldProPESO_LIQUIDO1: TFMTBCDField
      FieldName = 'PESO_LIQUIDO'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 3
    end
    object fmtbcdfldProIPI1: TFMTBCDField
      FieldName = 'IPI'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 2
    end
    object strngfldProC_ESTOQUE1: TStringField
      FieldName = 'C_ESTOQUE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object fmtbcdfldProMARGEM1: TFMTBCDField
      FieldName = 'MARGEM'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 2
    end
    object strngfldProESPESSURA1: TStringField
      FieldName = 'ESPESSURA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object strngfldProCOMPRIM1: TStringField
      FieldName = 'COMPRIM'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object fmtbcdfldProTABELAIND1: TFMTBCDField
      FieldName = 'TABELAIND'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 3
    end
    object fmtbcdfldProBASE_CUSTO1: TFMTBCDField
      FieldName = 'BASE_CUSTO'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 2
    end
    object fmtbcdfldProMARGEMATAC1: TFMTBCDField
      FieldName = 'MARGEMATAC'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 2
    end
    object fmtbcdfldProPRECO_ATAC1: TFMTBCDField
      FieldName = 'PRECO_ATAC'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 3
    end
    object strngfldProTRIBUTACAO1: TStringField
      FieldName = 'TRIBUTACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object strngfldProOLD_CLASS_FISCAL1: TStringField
      FieldName = 'OLD_CLASS_FISCAL'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
    object UsuProCLASSIF_FISCAL1: TIntegerField
      FieldName = 'CLASSIF_FISCAL'
      ProviderFlags = [pfInUpdate]
    end
    object cdsProDATABAL: TDateField
      FieldName = 'DATABAL'
      ProviderFlags = [pfInUpdate]
    end
    object fmtbcdfldProESTOQUEBAL1: TFMTBCDField
      FieldName = 'ESTOQUEBAL'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 3
    end
    object fmtbcdfldProBALANCO1: TFMTBCDField
      FieldName = 'BALANCO'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 3
    end
    object fmtbcdfldProBALVALOR1: TFMTBCDField
      FieldName = 'BALVALOR'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 2
    end
    object strngfldProEMBALAGEM1: TStringField
      FieldName = 'EMBALAGEM'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object UsuProATIVO1: TIntegerField
      FieldName = 'ATIVO'
      ProviderFlags = [pfInUpdate]
    end
    object strngfldProORIGEM_PRODUTO1: TStringField
      FieldName = 'ORIGEM_PRODUTO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object strngfldProCODIGOBARRAS1: TStringField
      FieldName = 'CODIGOBARRAS'
      ProviderFlags = [pfInUpdate]
      Size = 13
    end
    object UsuProID_COMPCUSTO1: TIntegerField
      FieldName = 'ID_COMPCUSTO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsProADICIONAIS_NF: TMemoField
      FieldName = 'ADICIONAIS_NF'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object UsuProNUMEROS_DE_SERIE1: TIntegerField
      FieldName = 'NUMEROS_DE_SERIE'
      ProviderFlags = [pfInUpdate]
    end
    object UsuProNUMEROS_DE_SERIE_ENTRADA1: TIntegerField
      FieldName = 'NUMEROS_DE_SERIE_ENTRADA'
      ProviderFlags = [pfInUpdate]
    end
    object strngfldProSITUACAO_SIMPLES1: TStringField
      FieldName = 'SITUACAO_SIMPLES'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object strngfldProTIPOPROD1: TStringField
      FieldName = 'TIPOPROD'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object strngfldProSTATUS1: TStringField
      FieldName = 'STATUS'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object strngfldProTIPO_ITEM1: TStringField
      FieldName = 'TIPO_ITEM'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object strngfldProCADASTROSITE1: TStringField
      FieldName = 'CADASTROSITE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object fmtbcdfldProID_INTEGRA_SITE1: TFMTBCDField
      FieldName = 'ID_INTEGRA_SITE'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 0
    end
    object fmtbcdfldProID_INTEGRA_SITE_FOTO1: TFMTBCDField
      FieldName = 'ID_INTEGRA_SITE_FOTO'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 0
    end
    object strngfldProDESCRICAO_SITE1: TStringField
      FieldName = 'DESCRICAO_SITE'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object strngfldProLANCAMENTO1: TStringField
      FieldName = 'LANCAMENTO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object strngfldProSITE_DESTAQUE1: TStringField
      FieldName = 'SITE_DESTAQUE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsProFICHATECNICA_SITE: TMemoField
      FieldName = 'FICHATECNICA_SITE'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object strngfldProDIMENSOES1: TStringField
      FieldName = 'DIMENSOES'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object fmtbcdfldProMARGEM_SITE1: TFMTBCDField
      FieldName = 'MARGEM_SITE'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 2
    end
    object fmtbcdfldProPRECO_SITE1: TFMTBCDField
      FieldName = 'PRECO_SITE'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 3
    end
    object fmtbcdfldProPRECO_PROMO_SITE1: TFMTBCDField
      FieldName = 'PRECO_PROMO_SITE'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 3
    end
    object cdsProPROMO_INI_SITE: TSQLTimeStampField
      FieldName = 'PROMO_INI_SITE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsProPROMO_FIM_SITE: TSQLTimeStampField
      FieldName = 'PROMO_FIM_SITE'
      ProviderFlags = [pfInUpdate]
    end
    object strngfldProENDERECO_ESTOQUE1: TStringField
      FieldName = 'ENDERECO_ESTOQUE'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object fmtbcdfldProCUSTO_UNIT1: TFMTBCDField
      FieldName = 'CUSTO_UNIT'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 4
    end
    object fmtbcdfldProCUSTO_VLR_FRETE1: TFMTBCDField
      FieldName = 'CUSTO_VLR_FRETE'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 4
    end
    object fmtbcdfldProCUSTO_VLR_SEGURO1: TFMTBCDField
      FieldName = 'CUSTO_VLR_SEGURO'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 4
    end
    object fmtbcdfldProCUSTO_VLR_OUTROS1: TFMTBCDField
      FieldName = 'CUSTO_VLR_OUTROS'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 4
    end
    object fmtbcdfldProCUSTO_VLR_ICMS_ST1: TFMTBCDField
      FieldName = 'CUSTO_VLR_ICMS_ST'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 4
    end
    object fmtbcdfldProCUSTO_VLR_IPI1: TFMTBCDField
      FieldName = 'CUSTO_VLR_IPI'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 4
    end
    object fmtbcdfldProESTOQUE_INDISP1: TFMTBCDField
      FieldName = 'ESTOQUE_INDISP'
      ProviderFlags = [pfInUpdate]
      Precision = 20
      Size = 5
    end
    object strngfldProCST_IPI1: TStringField
      FieldName = 'CST_IPI'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
  end
  object dsPro: TDataSource
    DataSet = cdsPro
    Left = 352
    Top = 40
  end
  object dpsPro: TDataSetProvider
    DataSet = sqlPro
    UpdateMode = upWhereKeyOnly
    Left = 448
    Top = 40
  end
  object sqlClassFiscal: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select CF.* '
      'from CLASS_FISCAL CF'
      'where CF.CLASS_FISCAL = '#39#39)
    SQLConnection = con1
    Left = 32
    Top = 200
    object UsuClassFiscalID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object strngfldClassFiscalCLASS_FISCAL: TStringField
      FieldName = 'CLASS_FISCAL'
      Size = 12
    end
    object strngfldClassFiscalDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object fmtbcdfldClassFiscalIPI: TFMTBCDField
      FieldName = 'IPI'
      Precision = 20
      Size = 2
    end
    object strngfldClassFiscalCST_IPI: TStringField
      FieldName = 'CST_IPI'
      FixedChar = True
      Size = 1
    end
    object strngfldClassFiscalTRIBUTACAO: TStringField
      FieldName = 'TRIBUTACAO'
      Size = 3
    end
  end
  object dpsClassFiscal: TDataSetProvider
    DataSet = sqlClassFiscal
    UpdateMode = upWhereKeyOnly
    Left = 64
    Top = 200
  end
  object cdsClassFiscal: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dpsClassFiscal'
    Left = 96
    Top = 200
    object UsuClassFiscalID1: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object strngfldClassFiscalCLASS_FISCAL1: TStringField
      FieldName = 'CLASS_FISCAL'
      Size = 12
    end
    object strngfldClassFiscalDESCRICAO1: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object fmtbcdfldClassFiscalIPI1: TFMTBCDField
      FieldName = 'IPI'
      Precision = 20
      Size = 2
    end
    object strngfldClassFiscalCST_IPI1: TStringField
      FieldName = 'CST_IPI'
      FixedChar = True
      Size = 1
    end
    object strngfldClassFiscalTRIBUTACAO1: TStringField
      FieldName = 'TRIBUTACAO'
      Size = 3
    end
  end
  object sqlTribut: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * '
      'from TRIBUTACAO'
      'where CODIGO_TRI = 0')
    SQLConnection = con1
    Left = 32
    Top = 136
    object strngfldTributCODIGO_TRI: TStringField
      FieldName = 'CODIGO_TRI'
      Required = True
      FixedChar = True
      Size = 3
    end
    object strngfldTributDESCRICAO_TRI: TStringField
      FieldName = 'DESCRICAO_TRI'
      Size = 30
    end
    object fmtbcdfldTributMARGEM_ST: TFMTBCDField
      FieldName = 'MARGEM_ST'
      Precision = 20
      Size = 2
    end
  end
  object dpsTribut: TDataSetProvider
    DataSet = sqlTribut
    UpdateMode = upWhereKeyOnly
    Left = 64
    Top = 136
  end
  object cdsTribut: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dpsTribut'
    Left = 96
    Top = 136
    object strngfldTributCODIGO_TRI1: TStringField
      FieldName = 'CODIGO_TRI'
      Required = True
      FixedChar = True
      Size = 3
    end
    object strngfldTributDESCRICAO_TRI1: TStringField
      FieldName = 'DESCRICAO_TRI'
      Size = 30
    end
    object fmtbcdfldTributMARGEM_ST1: TFMTBCDField
      FieldName = 'MARGEM_ST'
      Precision = 20
      Size = 2
    end
  end
  object sqlCadEst: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * '
      'from CADEST'
      'where NOME = '#39#39)
    SQLConnection = con1
    Left = 32
    Top = 264
    object strngfldCadEstCODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object strngfldCadEstESTADO: TStringField
      FieldName = 'ESTADO'
      Required = True
      FixedChar = True
      Size = 2
    end
    object strngfldCadEstNOME: TStringField
      FieldName = 'NOME'
    end
    object fmtbcdfldCadEstICMS: TFMTBCDField
      FieldName = 'ICMS'
      Precision = 20
      Size = 2
    end
    object fmtbcdfldCadEstREDUCAO: TFMTBCDField
      FieldName = 'REDUCAO'
      Precision = 20
      Size = 2
    end
    object sqlCadEstOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
    end
    object UsuCadEstSUBST_TRIB: TIntegerField
      FieldName = 'SUBST_TRIB'
    end
    object fmtbcdfldCadEstMARGEM_SUBST: TFMTBCDField
      FieldName = 'MARGEM_SUBST'
      Precision = 20
      Size = 2
    end
    object fmtbcdfldCadEstALIQ_SUBST: TFMTBCDField
      FieldName = 'ALIQ_SUBST'
      Precision = 20
      Size = 2
    end
    object fmtbcdfldCadEstICMS_NC: TFMTBCDField
      FieldName = 'ICMS_NC'
      Precision = 20
      Size = 2
    end
    object fmtbcdfldCadEstREDUCAO_NC: TFMTBCDField
      FieldName = 'REDUCAO_NC'
      Precision = 20
      Size = 2
    end
    object sqlCadEstOBS_NC: TMemoField
      FieldName = 'OBS_NC'
      BlobType = ftMemo
    end
    object UsuCadEstSUBST_TRIB_NC: TIntegerField
      FieldName = 'SUBST_TRIB_NC'
    end
    object fmtbcdfldCadEstMARGEM_SUBST_NC: TFMTBCDField
      FieldName = 'MARGEM_SUBST_NC'
      Precision = 20
      Size = 2
    end
    object fmtbcdfldCadEstALIQ_SUBST_NC: TFMTBCDField
      FieldName = 'ALIQ_SUBST_NC'
      Precision = 20
      Size = 2
    end
  end
  object dpsCadEst: TDataSetProvider
    DataSet = sqlCadEst
    UpdateMode = upWhereKeyOnly
    Left = 64
    Top = 264
  end
  object cdsCadEst: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dpsCadEst'
    Left = 96
    Top = 264
    object strngfldCadEstCODIGO1: TStringField
      FieldName = 'CODIGO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object strngfldCadEstESTADO1: TStringField
      FieldName = 'ESTADO'
      Required = True
      FixedChar = True
      Size = 2
    end
    object strngfldCadEstNOME1: TStringField
      FieldName = 'NOME'
    end
    object fmtbcdfldCadEstICMS1: TFMTBCDField
      FieldName = 'ICMS'
      Precision = 20
      Size = 2
    end
    object fmtbcdfldCadEstREDUCAO1: TFMTBCDField
      FieldName = 'REDUCAO'
      Precision = 20
      Size = 2
    end
    object cdsCadEstOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
    end
    object UsuCadEstSUBST_TRIB1: TIntegerField
      FieldName = 'SUBST_TRIB'
    end
    object fmtbcdfldCadEstMARGEM_SUBST1: TFMTBCDField
      FieldName = 'MARGEM_SUBST'
      Precision = 20
      Size = 2
    end
    object fmtbcdfldCadEstALIQ_SUBST1: TFMTBCDField
      FieldName = 'ALIQ_SUBST'
      Precision = 20
      Size = 2
    end
    object fmtbcdfldCadEstICMS_NC1: TFMTBCDField
      FieldName = 'ICMS_NC'
      Precision = 20
      Size = 2
    end
    object fmtbcdfldCadEstREDUCAO_NC1: TFMTBCDField
      FieldName = 'REDUCAO_NC'
      Precision = 20
      Size = 2
    end
    object cdsCadEstOBS_NC: TMemoField
      FieldName = 'OBS_NC'
      BlobType = ftMemo
    end
    object UsuCadEstSUBST_TRIB_NC1: TIntegerField
      FieldName = 'SUBST_TRIB_NC'
    end
    object fmtbcdfldCadEstMARGEM_SUBST_NC1: TFMTBCDField
      FieldName = 'MARGEM_SUBST_NC'
      Precision = 20
      Size = 2
    end
    object fmtbcdfldCadEstALIQ_SUBST_NC1: TFMTBCDField
      FieldName = 'ALIQ_SUBST_NC'
      Precision = 20
      Size = 2
    end
  end
end
