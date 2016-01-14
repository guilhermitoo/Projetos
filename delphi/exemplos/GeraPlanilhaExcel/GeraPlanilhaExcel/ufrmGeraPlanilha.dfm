object frmGeraPlanilha: TfrmGeraPlanilha
  Left = 241
  Top = 140
  Width = 450
  Height = 401
  Caption = 'Gerar Planilha Excel'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 19
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 434
    Height = 41
    Align = alTop
    TabOrder = 0
    object lbl1: TLabel
      Left = 19
      Top = 8
      Width = 223
      Height = 25
      Caption = 'Exporta'#231#227'o de Dados'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 41
    Width = 434
    Height = 321
    Align = alClient
    TabOrder = 1
    DesignSize = (
      434
      321)
    object lbl2: TLabel
      Left = 16
      Top = 8
      Width = 76
      Height = 19
      Caption = 'Salvar em:'
    end
    object txtCaminho: TJvComboEdit
      Left = 16
      Top = 32
      Width = 401
      Height = 27
      Anchors = [akLeft, akTop, akRight]
      ImageKind = ikEllipsis
      TabOrder = 0
      Text = 'C:\'
      OnButtonClick = txtCaminhoButtonClick
      OnExit = txtCaminhoExit
      OnKeyPress = txtCaminhoKeyPress
    end
    object rgSelecionar: TRadioGroup
      Left = 16
      Top = 68
      Width = 398
      Height = 161
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = 'Selecione o cadastro que deseja exportar'
      Items.Strings = (
        'Cadastro de Clientes'
        'Cadastro de Fornecedores'
        'Cadastro de Vendedores'
        'Cadastro de Produtos'
        'Cadastro de Contas a Receber'
        'Cadastro de Transportadores'
        'Todos os anteriores (ir'#225' gerar v'#225'rias planilhas)')
      TabOrder = 1
    end
    object pb1: TJvProgressBar
      Left = 1
      Top = 291
      Width = 432
      Height = 10
      Align = alBottom
      TabOrder = 4
      Visible = False
      FillColor = clBlue
      Marquee = True
    end
    object stat1: TStatusBar
      Left = 1
      Top = 301
      Width = 432
      Height = 19
      Panels = <
        item
          Width = 300
        end>
    end
    object btn1: TBitBtn
      Left = 344
      Top = 243
      Width = 68
      Height = 41
      Anchors = [akRight, akBottom]
      Caption = 'Sair'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btn1Click
    end
    object btnGerar: TBitBtn
      Left = 16
      Top = 243
      Width = 145
      Height = 41
      Anchors = [akLeft, akBottom]
      Caption = 'Gerar Planilha'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnGerarClick
    end
  end
  object con1: TSQLConnection
    ConnectionName = 'Intertek'
    DriverName = 'DevartInterBase'
    GetDriverFunc = 'getSQLDriverInterBase'
    LibraryName = 'dbexpida.dll'
    Params.Strings = (
      'DriverName=DevartInterBase'
      'DataBase=pc:ws-distribuicao'
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'DevartInterBase TransIsolation=ReadCommited')
    VendorLib = 'fbclient.DLL'
    OnLogin = con1Login
    Left = 288
    Top = 24
  end
  object ds1: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = con1
    Left = 288
    Top = 72
  end
  object dsp1: TDataSetProvider
    DataSet = ds1
    Left = 264
    Top = 136
  end
  object cds1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp1'
    Left = 304
    Top = 136
  end
  object dsc1: TDataSource
    DataSet = cds1
    Left = 344
    Top = 136
  end
end
