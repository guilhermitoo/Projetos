object frmBuscaCadMovimentacao: TfrmBuscaCadMovimentacao
  Left = 360
  Top = 121
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Buscar Cadastros de Movimenta'#231#227'o'
  ClientHeight = 416
  ClientWidth = 970
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
  object lbl1: TLabel
    Left = 16
    Top = 56
    Width = 43
    Height = 16
    Caption = 'Buscar:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 496
    Top = 56
    Width = 62
    Height = 16
    Caption = 'Filtrar por:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl4: TLabel
    Left = 632
    Top = 376
    Width = 70
    Height = 19
    Caption = 'Total:  R$'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblTotal: TLabel
    Left = 704
    Top = 374
    Width = 97
    Height = 27
    AutoSize = False
    Color = clScrollBar
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = False
  end
  object lbl3: TLabel
    Left = 16
    Top = 88
    Width = 66
    Height = 16
    Caption = 'Per'#237'odo de:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl5: TLabel
    Left = 192
    Top = 88
    Width = 23
    Height = 16
    Caption = 'at'#233':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object dbgrdMovimentacao: TDBGrid
    Left = 18
    Top = 120
    Width = 935
    Height = 241
    Color = clWhite
    DataSource = dsMovimentacao
    FixedColor = cl3DLight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_MOV'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'M.DESCRICAO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TM.DESCRICAO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TG.DESCRICAO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MP.DESCRICAO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Pitch = fpVariable
        Font.Style = [fsBold]
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'DATA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Visible = True
      end>
  end
  object edtParametro: TEdit
    Left = 64
    Top = 53
    Width = 417
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 50
    ParentFont = False
    TabOrder = 0
    OnKeyPress = edtParametroKeyPress
  end
  object txt1: TStaticText
    Left = 24
    Top = 16
    Width = 343
    Height = 27
    Caption = 'Buscar Cadastros de Movimenta'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
  end
  object cbbFiltro: TComboBox
    Left = 568
    Top = 53
    Width = 161
    Height = 24
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 16
    ParentFont = False
    TabOrder = 1
    OnChange = cbbFiltroChange
    Items.Strings = (
      'C'#243'digo'
      'Descri'#231#227'o'
      'Tipo de Movimenta'#231#227'o'
      'Tipo de Pagamento'
      'Tipo de Gasto'
      'Valor')
  end
  object btnCancelar: TBitBtn
    Left = 856
    Top = 41
    Width = 99
    Height = 41
    Caption = 'Cancelar'
    TabOrder = 3
    OnClick = btnCancelarClick
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000FF00FFFF00FF
      FF00FFFF00FFBFBFBF5E5F6920245403074F03064D21214F606069C2C2C2FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4D4F5E000E7D0013AF000EAE00
      09AD0007A900069F00049400006250505CFF00FFFF00FFFF00FFFF00FFFF00FF
      262C53001AB70012BC0004BC0000BD0000BE0000BE0000BD0001B600029F0001
      88272746FF00FFFF00FFFF00FF41445B0021C50013C50000C00000C00000C000
      00C00000C00000C00000C00000C00002A600018A434355FF00FFAFAFAF001FA3
      001ED10000C90000C90000C90000C90000C90000C90000C90000C90000C90000
      C800039F00016DAFAFAF4D5166002CDE000ED40000D10000CD0000CD0000CD00
      00CD0000CD0000CD0000CD0000CD0000D10002BD0004954D4D5D15276A002FE3
      0004D9585BD6B9BAE1BABBE2BABBE2BABBE2BABBE2BABBE2BABBE2B9BAE1585B
      D60000D300079B14154C0019740032E90001E0D2D2F9FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFD2D2F90000DD000AA000034D0016710035EE
      0009E74B4BEEA8A8F7A9A9F7A9A9F7A9A9F7A9A9F7A9A9F7A9A9F7A8A8F74B4B
      EE0002DC000DA601064F141E5D0038F4001CEE0000ED0000ED0000ED0000ED00
      00ED0000ED0000ED0000ED0000ED0000ED0009CE0010AB15174E4D4D5D0030E5
      0036F40008F30000F30000F30000F30000F30000F30000F30000F30000F30003
      EB0015B90010AC4E4E5FAFAFAF000E89003BF80032F50009F70000F90000F900
      00F90000F90000F90000F90005F00018C80019BB000579AFAFAFFF00FF424255
      0017BB003BF80037F40020F5000DF80004FB0004FA000AF40016E40022CE001F
      C7000BA6424255FF00FFFF00FFFF00FF27274B000EB60030ED0038F40035EE00
      32E9002FE3002CDE0029D8001FCE0008AC26264BFF00FFFF00FFFF00FFFF00FF
      FF00FF4F4F5E000080000DD6001CEA0021F0001FEC0017E1000AD00000804E4E
      5FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC1C1C15F5F6C21216603
      03770303762121665F5F6CC1C1C1FF00FFFF00FFFF00FFFF00FF}
  end
  object btnPesquisar: TBitBtn
    Left = 744
    Top = 41
    Width = 99
    Height = 41
    Caption = 'Pesquisar'
    TabOrder = 2
    OnClick = btnPesquisarClick
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFABABABA1A1A1CECECEFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0E0E0
      AFAFAFAAAAAABFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAEAEAB0B0B0B1B1B1B9B9B9DFDFDFFF
      FFFFBEBDBDB5B5B5C9C9C9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFB3B3B3C7C7C7ABABABC2BEBDEBE5DCEAE3D1DFD9C6B3B0ABCCCC
      CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCDCDCD929292F4EDF0FC
      F4F0FDF4E5FCF3DDFBEFCDFBF0D5C6C0B3D9D9D9FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFC8C8C8F0EDEEFDF6F8FDF5EEFDF4E6FDF3DEFBEECDFCF1D7FBEF
      D6B8B4ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFACACACFDF8F9FDF7F7FD
      F5EEFDF4E7FDF2DFFBEDCEFCF1D8FCF0D9C4BBABD6D6D6FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFB0B0B0FEF9FBFDF7F7FDF5EFFDF4E7FDF1E1FBECD1FCEFDAFCEF
      DAD3C8B7CAC9C9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB4B3B3FCF3F6FDF6F7FD
      F4F0FDF2E9FDF1E2FBEAD3FCEEDBFCEEDCBBB1A5D1D1D1FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFBFBFBFF1E4E8FDF0F3FDF2F0FDF1EBFCEFE4FBE8D5FCEEDEF1E3
      D598918BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6C1BDBDF9EBEFFC
      EBECFBE9E4FBE8DFFAE4D7F7E5D7BBACA3C9C8C7FDFDFDFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFC1BBBDE8D6DAFAE5E5F7DFDAEAD0C8B1A199C2BF
      BEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC4
      C4C4BDBABABAB5B5C2C0BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
  end
  object btnExcluir: TBitBtn
    Left = 16
    Top = 376
    Width = 83
    Height = 25
    Caption = 'Excluir'
    TabOrder = 7
    OnClick = btnExcluirClick
  end
  object dtpData1: TDateTimePicker
    Left = 88
    Top = 88
    Width = 89
    Height = 21
    Date = 41695.454933194440000000
    Time = 41695.454933194440000000
    TabOrder = 4
  end
  object dtpData2: TDateTimePicker
    Left = 224
    Top = 88
    Width = 89
    Height = 21
    Date = 41695.454933194440000000
    Time = 41695.454933194440000000
    TabOrder = 5
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
    Left = 392
    Top = 8
  end
  object qryMovimentacao: TADOQuery
    Connection = conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      '')
    Left = 456
    Top = 8
    object UsuMovimentacaoCOD_MOV: TAutoIncField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 5
      FieldName = 'COD_MOV'
      ReadOnly = True
    end
    object UsuMovimentacaoMDESCRICAO: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 50
      FieldName = 'M.DESCRICAO'
      Size = 50
    end
    object UsuMovimentacaoTMDESCRICAO: TWideStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 6
      FieldName = 'TM.DESCRICAO'
      Size = 15
    end
    object UsuMovimentacaoMPDESCRICAO: TWideStringField
      DisplayLabel = 'Pagamento em'
      DisplayWidth = 19
      FieldName = 'MP.DESCRICAO'
      Size = 50
    end
    object UsuMovimentacaoTGDESCRICAO: TWideStringField
      DisplayLabel = 'Gasto com'
      DisplayWidth = 13
      FieldName = 'TG.DESCRICAO'
      Size = 50
    end
    object fltfldMovimentacaoVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 12
      FieldName = 'VALOR'
      KeyFields = 'VALOR'
      DisplayFormat = '00.00'
    end
    object dtmfldMovimentacaoDATA: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 19
      FieldName = 'DATA'
    end
  end
  object dsMovimentacao: TDataSource
    DataSet = qryMovimentacao
    Left = 504
    Top = 8
  end
  object dsExcluirMov: TDataSource
    DataSet = qryExcluirMov
    Left = 616
    Top = 8
  end
  object qryExcluirMov: TADOQuery
    Connection = conexao
    Parameters = <>
    Left = 560
    Top = 8
  end
end
