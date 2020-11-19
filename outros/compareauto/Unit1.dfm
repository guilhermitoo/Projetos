object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'CompareAuto Tools'
  ClientHeight = 660
  ClientWidth = 1045
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 41
    Width = 1045
    Height = 600
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Modelo'
      object DBGrid1: TDBGrid
        Left = 0
        Top = 35
        Width = 1037
        Height = 537
        Align = alClient
        DataSource = dsVehicles
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'id'
            Width = 58
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'description'
            Width = 667
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'model_id'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'brand_id'
            Visible = True
          end>
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 1037
        Height = 35
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object btnRunVehicles: TButton
          AlignWithMargins = True
          Left = 84
          Top = 3
          Width = 109
          Height = 29
          Align = alLeft
          Caption = 'Ajustar modelos'
          TabOrder = 0
          OnClick = btnRunVehiclesClick
        end
        object btnOpenVehicles: TButton
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 75
          Height = 29
          Align = alLeft
          Caption = 'Abrir'
          TabOrder = 1
          OnClick = btnOpenVehiclesClick
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Coment'#225'rios'
      ImageIndex = 1
      object DBGrid2: TDBGrid
        Left = 0
        Top = 35
        Width = 1037
        Height = 537
        Align = alClient
        DataSource = dsComments
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MARCA'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MODELO'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COMENTARIO'
            Width = 600
            Visible = True
          end>
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 1037
        Height = 35
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object btnRunComments: TButton
          AlignWithMargins = True
          Left = 84
          Top = 3
          Width = 173
          Height = 29
          Align = alLeft
          Caption = 'Excluir duplicatas de coment'#225'rio'
          TabOrder = 0
          OnClick = btnRunCommentsClick
        end
        object btnOpenComments: TButton
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 75
          Height = 29
          Align = alLeft
          Caption = 'Abrir'
          TabOrder = 1
          OnClick = btnOpenCommentsClick
        end
        object Button1: TButton
          AlignWithMargins = True
          Left = 263
          Top = 3
          Width = 130
          Height = 29
          Align = alLeft
          Caption = 'Ajustar model_id'
          TabOrder = 2
          OnClick = Button1Click
        end
      end
    end
    object tsImportarComentarios: TTabSheet
      Caption = 'Importar Ajustes Coment'#225'rios'
      ImageIndex = 2
      object dbgrdImpComments: TDBGrid
        Left = 0
        Top = 35
        Width = 1037
        Height = 502
        Align = alClient
        DataSource = dsImportComments
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'id_comentario'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'marca_ok'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'modelo_ok'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'marca_id'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'modelo_id'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'positivo'
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'negativo'
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'estrelas'
            Visible = True
          end>
      end
      object pnl2: TPanel
        Left = 0
        Top = 537
        Width = 1037
        Height = 35
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object btnUpdateDatabase: TButton
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 102
          Height = 29
          Align = alLeft
          Caption = 'Salvar no banco'
          TabOrder = 0
          OnClick = btnUpdateDatabaseClick
        end
      end
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 1037
        Height = 35
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        object btnOpenFile: TButton
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 86
          Height = 29
          Align = alLeft
          Caption = 'Abrir arquivo'
          TabOrder = 0
          OnClick = btnOpenFileClick
        end
        object btnReadFile: TButton
          AlignWithMargins = True
          Left = 688
          Top = 3
          Width = 86
          Height = 29
          Align = alLeft
          Caption = 'Ler arquivo'
          TabOrder = 1
          OnClick = btnReadFileClick
        end
        object edtFile: TEdit
          AlignWithMargins = True
          Left = 98
          Top = 6
          Width = 581
          Height = 23
          Margins.Left = 6
          Margins.Top = 6
          Margins.Right = 6
          Margins.Bottom = 6
          Align = alLeft
          ReadOnly = True
          TabOrder = 2
          ExplicitHeight = 21
        end
        object btnLoadBrandAndModelId: TButton
          AlignWithMargins = True
          Left = 780
          Top = 3
          Width = 189
          Height = 29
          Align = alLeft
          Caption = 'Carregar ID da marca e do modelo'
          TabOrder = 3
          OnClick = btnLoadBrandAndModelIdClick
        end
      end
    end
  end
  object pnlcon: TPanel
    Left = 0
    Top = 0
    Width = 1045
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object pnl1: TPanel
      Left = 484
      Top = 0
      Width = 121
      Height = 41
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object lbl1: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 115
        Height = 13
        Align = alTop
        Caption = 'Senha'
        ExplicitWidth = 30
      end
      object edtPassword: TEdit
        AlignWithMargins = True
        Left = 3
        Top = 17
        Width = 115
        Height = 21
        Align = alBottom
        TabOrder = 0
      end
    end
    object Panel3: TPanel
      Left = 242
      Top = 0
      Width = 121
      Height = 41
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 1
      object Label2: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 115
        Height = 13
        Align = alTop
        Caption = 'Porta'
        ExplicitWidth = 26
      end
      object edtPort: TEdit
        AlignWithMargins = True
        Left = 3
        Top = 17
        Width = 115
        Height = 21
        Align = alBottom
        TabOrder = 0
        Text = '3306'
      end
    end
    object Panel4: TPanel
      Left = 121
      Top = 0
      Width = 121
      Height = 41
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 2
      object Label3: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 115
        Height = 13
        Align = alTop
        Caption = 'Banco de Dados'
        ExplicitWidth = 77
      end
      object edtDatabase: TEdit
        AlignWithMargins = True
        Left = 3
        Top = 17
        Width = 115
        Height = 21
        Align = alBottom
        TabOrder = 0
        Text = 'compareauto'
      end
    end
    object Panel5: TPanel
      Left = 0
      Top = 0
      Width = 121
      Height = 41
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 3
      object Label4: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 115
        Height = 13
        Align = alTop
        Caption = 'Servidor'
        ExplicitWidth = 40
      end
      object edtServer: TEdit
        AlignWithMargins = True
        Left = 3
        Top = 17
        Width = 115
        Height = 21
        Align = alBottom
        TabOrder = 0
        Text = 'localhost'
      end
    end
    object Panel6: TPanel
      Left = 363
      Top = 0
      Width = 121
      Height = 41
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 4
      object Label5: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 115
        Height = 13
        Align = alTop
        Caption = 'Usu'#225'rio'
        ExplicitWidth = 36
      end
      object edtUser: TEdit
        AlignWithMargins = True
        Left = 3
        Top = 17
        Width = 115
        Height = 21
        Align = alBottom
        TabOrder = 0
        Text = 'root'
      end
    end
    object btnConnect: TButton
      AlignWithMargins = True
      Left = 608
      Top = 3
      Width = 75
      Height = 35
      Align = alLeft
      Caption = 'Conectar'
      TabOrder = 5
      OnClick = btnConnectClick
    end
    object chkDesabilitaControles: TCheckBox
      Left = 912
      Top = 0
      Width = 133
      Height = 41
      Align = alRight
      Caption = 'Desabilita controles'
      TabOrder = 6
    end
  end
  object stat1: TStatusBar
    Left = 0
    Top = 641
    Width = 1045
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'DriverID=MySQL'
      'User_Name=root'
      'Database=compareauto'
      'Server=localhost'
      'Port=3306')
    AfterConnect = FDConnection1AfterConnect
    Left = 40
    Top = 272
  end
  object fdqVehicles: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select id, description,model_id,brand_id from vehicles')
    Left = 40
    Top = 344
  end
  object dsVehicles: TDataSource
    DataSet = fdqVehicles
    Left = 40
    Top = 424
  end
  object fdqComments: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'SELECT vm.id, b.description AS Marca, m.description AS Modelo, v' +
        'm.positive AS Comentario, v.model_id'
      'FROM vehicle_comments vm'
      'JOIN vehicles v ON ( v.id = vm.vehicle_id )'
      'JOIN brands b ON ( b.id = v.brand_id )'
      'left JOIN models m ON ( m.id = v.model_id )'
      'ORDER BY v.id')
    Left = 140
    Top = 344
    object fdqCommentsid: TLargeintField
      AutoGenerateValue = arDefault
      DisplayLabel = 'id'
      FieldName = 'ID'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object fdqCommentsMarca: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Marca'
      FieldName = 'MARCA'
      Origin = 'description'
      ProviderFlags = []
      ReadOnly = True
      Size = 255
    end
    object fdqCommentsModelo: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO'
      Origin = 'model'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object fdqCommentsComentario: TMemoField
      DisplayLabel = 'Coment'#225'rio'
      FieldName = 'COMENTARIO'
      Origin = 'positive'
      Required = True
      OnGetText = fdqCommentsComentarioGetText
      BlobType = ftMemo
    end
    object fdqCommentsmodel_id: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'model_id'
      Origin = 'model_id'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsComments: TDataSource
    DataSet = fdqComments
    Left = 136
    Top = 424
  end
  object cdsComments_ok: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 520
    Top = 336
    object cdsComments_okid: TIntegerField
      FieldName = 'ID'
    end
    object cdsComments_okcomentario: TMemoField
      FieldName = 'COMENTARIO'
      BlobType = ftMemo
    end
    object cdsComments_okMODELO: TStringField
      FieldName = 'MODELO'
      Size = 30
    end
    object cdsComments_okMARCA: TStringField
      FieldName = 'MARCA'
      Size = 255
    end
  end
  object cdsComments_del: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 520
    Top = 400
    object IntegerField1: TIntegerField
      FieldName = 'ID'
    end
    object MemoField1: TMemoField
      FieldName = 'COMENTARIO'
      BlobType = ftMemo
    end
    object StringField1: TStringField
      FieldName = 'MODELO'
      Size = 30
    end
    object StringField2: TStringField
      FieldName = 'MARCA'
      Size = 255
    end
  end
  object fdqAux: TFDQuery
    Connection = FDConnection1
    Left = 280
    Top = 280
  end
  object cdsImportComments: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 416
    Top = 160
    object cdsImportCommentsid_comentario: TIntegerField
      FieldName = 'id_comentario'
    end
    object cdsImportCommentsmarca_ok: TStringField
      FieldName = 'marca_ok'
      Size = 255
    end
    object cdsImportCommentsmodelo_ok: TStringField
      FieldName = 'modelo_ok'
      Size = 255
    end
    object cdsImportCommentsmarca_id: TIntegerField
      FieldName = 'marca_id'
    end
    object cdsImportCommentsmodelo_id: TIntegerField
      FieldName = 'modelo_id'
    end
    object cdsImportCommentspositivo: TMemoField
      FieldName = 'positivo'
      OnGetText = cdsImportCommentspositivoGetText
      BlobType = ftMemo
    end
    object cdsImportCommentsnegativo: TMemoField
      FieldName = 'negativo'
      OnGetText = cdsImportCommentsnegativoGetText
      BlobType = ftMemo
    end
    object cdsImportCommentsestrelas: TIntegerField
      FieldName = 'estrelas'
    end
  end
  object dsImportComments: TDataSource
    DataSet = cdsImportComments
    Left = 324
    Top = 145
  end
  object dlgOpen1: TOpenDialog
    Left = 140
    Top = 169
  end
end
