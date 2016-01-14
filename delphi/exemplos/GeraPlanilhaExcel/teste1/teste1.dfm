object Form1: TForm1
  Left = 194
  Top = 117
  Width = 928
  Height = 480
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
  object dbgrd1: TDBGrid
    Left = 24
    Top = 128
    Width = 809
    Height = 217
    DataSource = ds2
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btn1: TButton
    Left = 704
    Top = 344
    Width = 129
    Height = 33
    Caption = 'exportar para excel'
    TabOrder = 1
    OnClick = btn1Click
  end
  object con1: TSQLConnection
    ConnectionName = 'ws-siscom'
    DriverName = 'DevartInterBase'
    GetDriverFunc = 'getSQLDriverInterBase'
    LibraryName = 'dbexpida.dll'
    Params.Strings = (
      'DriverName=DevartInterBase'
      'DataBase=pc:ws-industria'
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'DevartInterBase TransIsolation=ReadCommited')
    VendorLib = 'fbclient.DLL'
    Connected = True
    Left = 112
    Top = 16
  end
  object dsp1: TDataSetProvider
    DataSet = ds1
    Left = 408
    Top = 24
  end
  object ds1: TSQLDataSet
    CommandText = 'select first 10 * from acoes'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = con1
    Left = 360
    Top = 24
    object cdsds1ACAO: TStringField
      FieldName = 'ACAO'
      Required = True
      Size = 40
    end
    object cdsds1DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object intgrfldds1CODIGO_WINDSOFT: TIntegerField
      FieldName = 'CODIGO_WINDSOFT'
      Required = True
    end
  end
  object cds1: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp1'
    Left = 464
    Top = 24
    object cds1ACAO: TStringField
      FieldName = 'ACAO'
      Required = True
      Size = 40
    end
    object cds1DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object intgrfldcds1CODIGO_WINDSOFT: TIntegerField
      FieldName = 'CODIGO_WINDSOFT'
      Required = True
    end
  end
  object ds2: TDataSource
    DataSet = cds1
    Left = 656
    Top = 40
  end
end
