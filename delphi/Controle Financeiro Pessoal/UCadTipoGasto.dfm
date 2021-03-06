object frmCadTipoGasto: TfrmCadTipoGasto
  Left = 511
  Top = 348
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Tipo de Gasto'
  ClientHeight = 166
  ClientWidth = 325
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object lbl4: TLabel
    Left = 16
    Top = 56
    Width = 89
    Height = 13
    Caption = 'Gasto/Ganho com:'
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 107
    Width = 325
    Height = 59
    Align = alBottom
    TabOrder = 1
    object btnConfirmar: TBitBtn
      Left = 8
      Top = 9
      Width = 97
      Height = 41
      Caption = 'Confirmar'
      TabOrder = 0
      OnClick = btnConfirmarClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFC0A18D
        874A20535755535755535755535755535755535755535755535755535755874A
        20874A20874A20C0A18DC0A18D874A20CCA98E927B63E3E3E3D6D6D6BABABABA
        BABABABABAB9B9B9B9B9B9947C63CE9F72DCB898EAD2BE874A20874A20CCA98E
        DCB898927B62E1E1E1E6E6E6535755535755C5C5C5C2C2C2B2B2B2937A61CE9E
        71DBB694EAD2BE874A20874A20EAD2BECF9F72927B62C5C5C5E1E1E153575553
        5755C5C5C5C5C5C5BFBFBF937A61CE9E71DBB694EAD2BE874A20874A20EAD2BE
        CF9F72927A61C5C5C5C5C5C5535755535755E2E2E2C5C5C5B9B9B9937A61CE9E
        71DBB694EAD2BE874A20874A20EAD2BECF9F729C7E60BABABAC5C5C5C5C5C5E1
        E1E1E7E7E7D7D7D7BABAB9997B5DCE9E70DBB694EAD2BE874A20874A20EAD2BE
        CF9F72B08C69947C62947C62947C62947C62947C62947C62947C62B08C69DBB6
        94CF9F72EAD2BE874A20874A20EAD2BECF9F72CF9F72CF9F72CF9F72CF9F72CF
        9F72CF9F72CF9F72CF9F72CF9F72CF9F72CF9F72EAD2BE874A20874A20EAD2BE
        CF9F72FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FECF9F72EAD2BE874A20874A20EAD2BECF9F72FEFEFEF4F4F4F4F4F4F4F4F4F4
        F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4CF9F72EAD2BE874A20874A20EAD2BE
        CF9F72FEFEFED7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7F4F4
        F4CF9F72EAD2BE874A20874A20EAD2BECF9F72FEFEFEF4F4F4F4F4F4F4F4F4F4
        F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4CF9F72EAD2BE874A20874A20EAD2BE
        CF9F72F9F9F9E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2F9F9
        F9CF9F72EAD2BE874A20874A20EAD2BECF9F72F9F9F9F9F9F9F9F9F9F9F9F9F9
        F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9CF9F72EAD2BE874A20874A20EAD2BE
        EED9C83EAFFC3EAFFC3EAFFC3EAFFC3EAFFC3EAFFC3EAFFC3EAFFC3EAFFC3EAF
        FCEAD2BEEAD2BE874A20AE866B874A20874A20005CCE005CCE005CCE005CCE00
        5CCE005CCE005CCE005CCE005CCE005CCE874A20874A20AE866B}
    end
    object btnCancelar: TBitBtn
      Left = 216
      Top = 9
      Width = 99
      Height = 41
      Caption = 'Cancelar'
      TabOrder = 2
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
    object btnProcurar: TBitBtn
      Left = 112
      Top = 9
      Width = 99
      Height = 41
      Caption = 'Procurar'
      TabOrder = 1
      OnClick = btnProcurarClick
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
  end
  object edtDescricao: TEdit
    Left = 16
    Top = 70
    Width = 297
    Height = 21
    TabOrder = 0
  end
  object txt1: TStaticText
    Left = 16
    Top = 16
    Width = 251
    Height = 27
    Caption = 'Cadastro de Gasto/Ganho'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object dsTipoGasto: TDataSource
    DataSet = tblTipoGasto
    Left = 48
    Top = 65520
  end
  object tblTipoGasto: TADOTable
    Connection = conexao
    CursorType = ctStatic
    TableName = 'TbTipoGasto'
    Left = 88
    Top = 65520
  end
  object conexao: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Users\suporte3\D' +
      'ocuments\Controle Financeiro Pessoal\BdControleFinanceiro.mdb;Pe' +
      'rsist Security Info=False;'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 8
    Top = 65520
  end
end
