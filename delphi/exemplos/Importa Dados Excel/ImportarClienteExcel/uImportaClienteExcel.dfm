object frmImportaClienteExcel: TfrmImportaClienteExcel
  Left = 267
  Top = 164
  Width = 500
  Height = 193
  BorderIcons = [biSystemMenu]
  Caption = 'Importar Cliente do Excel'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblFileName: TLabel
    Left = 128
    Top = 12
    Width = 313
    Height = 17
    AutoSize = False
    Color = cl3DLight
    ParentColor = False
  end
  object lbl1: TLabel
    Left = 448
    Top = 12
    Width = 25
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Color = cl3DLight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object btnSelecionar: TButton
    Left = 8
    Top = 8
    Width = 113
    Height = 25
    Caption = 'Selecionar Arquivo'
    TabOrder = 0
    OnClick = btnSelecionarClick
  end
  object btnCarregar: TButton
    Left = 8
    Top = 40
    Width = 113
    Height = 25
    Caption = 'Carregar Arquivo'
    Enabled = False
    TabOrder = 1
  end
  object dlgOpen1: TOpenDialog
    Filter = 'arquivos do Excel|*.xls;*.xlsx'
    Left = 248
    Top = 48
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
    Left = 312
    Top = 40
  end
  object sqlCli: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select C.* '
      'from CADCLI C'
      'where C.CODIGO = '#39#39)
    SQLConnection = con1
    Left = 352
    Top = 40
    object strngfldsql1CODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
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
      Required = True
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
      Required = True
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
      Required = True
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
      Required = True
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
      Required = True
    end
    object sqlCliLEMBRETE: TMemoField
      FieldName = 'LEMBRETE'
      BlobType = ftMemo
    end
    object Ususql1LEMBATIVO: TIntegerField
      FieldName = 'LEMBATIVO'
      Required = True
    end
    object strngfldsql1TABELA: TStringField
      FieldName = 'TABELA'
      FixedChar = True
      Size = 1
    end
    object strngfldsql1SITUACAO_ICMS: TStringField
      FieldName = 'SITUACAO_ICMS'
      Required = True
      FixedChar = True
      Size = 1
    end
    object strngfldsql1CODCID: TStringField
      FieldName = 'CODCID'
      Size = 7
    end
    object strngfldsql1CODPAIS: TStringField
      FieldName = 'CODPAIS'
      Required = True
      Size = 5
    end
    object sqlCliCONTANIVER: TDateField
      FieldName = 'CONTANIVER'
    end
    object strngfldsql1INSCRITO_SUFRAMA: TStringField
      FieldName = 'INSCRITO_SUFRAMA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object strngfldsql1SUFRAMA: TStringField
      FieldName = 'SUFRAMA'
      Size = 10
    end
  end
  object dpsCli: TDataSetProvider
    DataSet = sqlCli
    UpdateMode = upWhereKeyOnly
    Left = 392
    Top = 40
  end
  object cdsCli: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dps1'
    Left = 432
    Top = 40
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
  object sqlVend: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select V.* '
      'from CADVEND V'
      'where V.CODIGO = '#39#39)
    SQLConnection = con1
    Left = 352
    Top = 104
    object strngfldsql2CODIGO: TStringField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 3
    end
    object strngfldsql2NOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object strngfldsql2TIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object strngfldsql2TELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 30
    end
    object strngfldsql2ENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 30
    end
    object strngfldsql2BAIRRO: TStringField
      FieldName = 'BAIRRO'
    end
    object strngfldsql2CEP: TStringField
      FieldName = 'CEP'
      Size = 9
    end
    object strngfldsql2CIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object strngfldsql2ESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 2
    end
    object strngfldsql2EMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 40
    end
    object fmtbcdfldsql2COMISSAO: TFMTBCDField
      FieldName = 'COMISSAO'
      Precision = 20
      Size = 2
    end
    object Ususql2CONTROLE: TIntegerField
      FieldName = 'CONTROLE'
      Required = True
    end
    object fmtbcdfldsql2COMIS_A: TFMTBCDField
      FieldName = 'COMIS_A'
      Precision = 20
      Size = 2
    end
    object fmtbcdfldsql2COMIS_I: TFMTBCDField
      FieldName = 'COMIS_I'
      Precision = 20
      Size = 2
    end
    object sqlVendNASCTO: TDateField
      FieldName = 'NASCTO'
    end
  end
  object dpsVend: TDataSetProvider
    DataSet = sqlVend
    UpdateMode = upWhereKeyOnly
    Left = 392
    Top = 104
  end
  object cdsVend: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dps2'
    Left = 432
    Top = 104
    object strngfldcds2CODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      FixedChar = True
      Size = 5
    end
    object strngfldcds2RAZAO: TStringField
      FieldName = 'RAZAO'
      Size = 37
    end
    object strngfldcds2FANTASIA: TStringField
      FieldName = 'FANTASIA'
      Size = 30
    end
    object strngfldcds2CGC: TStringField
      FieldName = 'CGC'
      Size = 18
    end
    object strngfldcds2TIPOINS: TStringField
      FieldName = 'TIPOINS'
      FixedChar = True
      Size = 1
    end
    object strngfldcds2INSCR: TStringField
      FieldName = 'INSCR'
      Size = 17
    end
    object strngfldcds2FONE: TStringField
      FieldName = 'FONE'
      Size = 30
    end
    object strngfldcds2FAX: TStringField
      FieldName = 'FAX'
      Size = 15
    end
    object strngfldcds2EMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object strngfldcds2ENDENTR: TStringField
      FieldName = 'ENDENTR'
      Size = 35
    end
    object Usucds2NUMENTR: TIntegerField
      FieldName = 'NUMENTR'
    end
    object strngfldcds2COMENTR: TStringField
      FieldName = 'COMENTR'
      Size = 30
    end
    object strngfldcds2BAIENTR: TStringField
      FieldName = 'BAIENTR'
    end
    object strngfldcds2CEPENTR: TStringField
      FieldName = 'CEPENTR'
      Size = 9
    end
    object strngfldcds2CIDENTR: TStringField
      FieldName = 'CIDENTR'
      Size = 30
    end
    object strngfldcds2ESTENTR: TStringField
      FieldName = 'ESTENTR'
      Size = 2
    end
    object strngfldcds2ENDCOBR: TStringField
      FieldName = 'ENDCOBR'
      Size = 35
    end
    object Usucds2NUMCOBR: TIntegerField
      FieldName = 'NUMCOBR'
    end
    object strngfldcds2COMCOBR: TStringField
      FieldName = 'COMCOBR'
      Size = 30
    end
    object strngfldcds2BAICOBR: TStringField
      FieldName = 'BAICOBR'
    end
    object strngfldcds2CEPCOBR: TStringField
      FieldName = 'CEPCOBR'
      Size = 9
    end
    object strngfldcds2CIDCOBR: TStringField
      FieldName = 'CIDCOBR'
      Size = 30
    end
    object strngfldcds2ESTCOBR: TStringField
      FieldName = 'ESTCOBR'
      Size = 2
    end
    object strngfldcds2CODBAN: TStringField
      FieldName = 'CODBAN'
      FixedChar = True
      Size = 3
    end
    object strngfldcds2REGIAO: TStringField
      FieldName = 'REGIAO'
      FixedChar = True
      Size = 3
    end
    object strngfldcds2CODVEND: TStringField
      FieldName = 'CODVEND'
      FixedChar = True
      Size = 3
    end
    object strngfldcds2COBRANCA: TStringField
      FieldName = 'COBRANCA'
      FixedChar = True
      Size = 3
    end
    object Usucds2NUM_COMPRA: TIntegerField
      FieldName = 'NUM_COMPRA'
    end
    object strngfldcds2OBS: TStringField
      FieldName = 'OBS'
      Size = 100
    end
    object Usucds2CARTORIOS: TIntegerField
      FieldName = 'CARTORIOS'
    end
    object Usucds2PROTESTOS: TIntegerField
      FieldName = 'PROTESTOS'
    end
    object strngfldcds2COMPRADOR: TStringField
      FieldName = 'COMPRADOR'
    end
    object strngfldcds2FONE_COMP: TStringField
      FieldName = 'FONE_COMP'
    end
    object cdsVendCLI_DESDE: TDateField
      FieldName = 'CLI_DESDE'
    end
    object cdsVendULT_COMPRA: TDateField
      FieldName = 'ULT_COMPRA'
    end
    object Usucds2NEGATIVADO: TIntegerField
      FieldName = 'NEGATIVADO'
      Required = True
    end
    object fmtbcdfldcds2LIM_CRED: TFMTBCDField
      FieldName = 'LIM_CRED'
      Precision = 20
      Size = 2
    end
    object cdsVendLIM_VENCTO: TDateField
      FieldName = 'LIM_VENCTO'
    end
    object Usucds2BLOQ_VEN: TIntegerField
      FieldName = 'BLOQ_VEN'
      Required = True
    end
    object strngfldcds2MOTIVO_NEG: TStringField
      FieldName = 'MOTIVO_NEG'
    end
    object strngfldcds2DESBL_VEN: TStringField
      FieldName = 'DESBL_VEN'
    end
    object cdsVendCOMPLEMENT: TMemoField
      FieldName = 'COMPLEMENT'
      BlobType = ftMemo
    end
    object strngfldcds2INTERNET: TStringField
      FieldName = 'INTERNET'
      Size = 40
    end
    object strngfldcds2MALADIR: TStringField
      FieldName = 'MALADIR'
      FixedChar = True
      Size = 1
    end
    object strngfldcds2TIPOCLI: TStringField
      FieldName = 'TIPOCLI'
      Required = True
      FixedChar = True
      Size = 1
    end
    object strngfldcds2TIPOCAD: TStringField
      FieldName = 'TIPOCAD'
      FixedChar = True
      Size = 1
    end
    object cdsVendTVULTCONT: TDateField
      FieldName = 'TVULTCONT'
    end
    object cdsVendTVPROXCONT: TDateField
      FieldName = 'TVPROXCONT'
    end
    object Usucds2TVCOMPROU: TIntegerField
      FieldName = 'TVCOMPROU'
      Required = True
    end
    object Usucds2TVFREQPED: TIntegerField
      FieldName = 'TVFREQPED'
    end
    object cdsVendTVOBS: TMemoField
      FieldName = 'TVOBS'
      BlobType = ftMemo
    end
    object strngfldcds2TVOPERADOR: TStringField
      FieldName = 'TVOPERADOR'
    end
    object strngfldcds2TVDIFICULD: TStringField
      FieldName = 'TVDIFICULD'
      Size = 35
    end
    object strngfldcds2TVRAMOATIV: TStringField
      FieldName = 'TVRAMOATIV'
      FixedChar = True
      Size = 3
    end
    object strngfldcds2TVCODIGO: TStringField
      FieldName = 'TVCODIGO'
      FixedChar = True
      Size = 3
    end
    object Usucds2FICHAS: TIntegerField
      FieldName = 'FICHAS'
      Required = True
    end
    object cdsVendLEMBRETE: TMemoField
      FieldName = 'LEMBRETE'
      BlobType = ftMemo
    end
    object Usucds2LEMBATIVO: TIntegerField
      FieldName = 'LEMBATIVO'
      Required = True
    end
    object strngfldcds2TABELA: TStringField
      FieldName = 'TABELA'
      FixedChar = True
      Size = 1
    end
    object strngfldcds2SITUACAO_ICMS: TStringField
      FieldName = 'SITUACAO_ICMS'
      Required = True
      FixedChar = True
      Size = 1
    end
    object strngfldcds2CODCID: TStringField
      FieldName = 'CODCID'
      Size = 7
    end
    object strngfldcds2CODPAIS: TStringField
      FieldName = 'CODPAIS'
      Required = True
      Size = 5
    end
    object cdsVendCONTANIVER: TDateField
      FieldName = 'CONTANIVER'
    end
    object strngfldcds2INSCRITO_SUFRAMA: TStringField
      FieldName = 'INSCRITO_SUFRAMA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object strngfldcds2SUFRAMA: TStringField
      FieldName = 'SUFRAMA'
      Size = 10
    end
  end
end
