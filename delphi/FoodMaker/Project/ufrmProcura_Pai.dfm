inherited frmProcura_Pai: TfrmProcura_Pai
  Caption = 'Procura_Pai'
  ClientHeight = 310
  ClientWidth = 720
  ExplicitWidth = 736
  ExplicitHeight = 349
  PixelsPerInch = 96
  TextHeight = 13
  object sb: TStatusBar
    Left = 0
    Top = 291
    Width = 720
    Height = 19
    Panels = <>
    ExplicitLeft = 520
    ExplicitTop = 152
    ExplicitWidth = 0
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 720
    Height = 65
    Align = alTop
    TabOrder = 1
    object btnText: TButtonedEdit
      Left = 16
      Top = 32
      Width = 425
      Height = 21
      RightButton.Visible = True
      TabOrder = 0
      Text = 'btnText'
    end
  end
  object pnlCenter: TPanel
    Left = 0
    Top = 65
    Width = 720
    Height = 192
    Align = alClient
    TabOrder = 2
    ExplicitLeft = 216
    ExplicitTop = 152
    ExplicitWidth = 353
    ExplicitHeight = 41
    object dbgrd: TDBGrid
      Left = 1
      Top = 1
      Width = 718
      Height = 190
      Align = alClient
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 257
    Width = 720
    Height = 34
    Align = alBottom
    TabOrder = 3
    ExplicitTop = 256
    object btnOK: TButton
      Left = 8
      Top = 4
      Width = 57
      Height = 25
      Caption = 'Ok'
      ImageIndex = 1
      Images = il
      ModalResult = 1
      TabOrder = 0
    end
    object btnCancel: TButton
      Left = 72
      Top = 4
      Width = 81
      Height = 25
      Caption = 'Cancelar'
      ImageIndex = 0
      Images = il
      ModalResult = 2
      TabOrder = 1
    end
  end
  object il: TImageList
    ColorDepth = cd32Bit
    Height = 24
    Width = 24
    Left = 352
    Top = 160
    Bitmap = {
      494C010102000500040018001800FFFFFFFF2100FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000600000001800000001002000000000000024
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F1EBEFFFC7B8CBFFAB93B3FF9F83
      A4FFA485A5FFBBAAC3FFE5D9E0FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F1EBEFFFD6CBD8FFB2A7B8FFA086
      A1FFAA9DB3FFC3B5C6FFE5D9E0FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F1EBEFFFA892B3FF9C98BBFF98BFE1FF97D3F6FF97D3
      F6FF97D3F6FF97CCEFFF9AACCEFF9E82A3FFD7CDD9FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B0A0B2FF9C98B7FF98BADCFF98C5E9FF97D3
      F6FF97D3F6FF99B9DBFF9BA7C7FF9E8BA7FFE0DCE6FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D4C7D9FF9B90B2FF97CCEFFF97D3F6FF9BBEE1FF9CB9E8FF9EA0
      CEFF9DC0F5FF9DA2C8FF97D3F6FF97D3F6FF9CA6C8FFAF95B3FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DDD5D9FF9D8AA7FF98BFE1FF97D3F6FF9BC0E0FF9EC8DEFFA1AC
      BAFFA0D5DDFF9EA7C3FF97D3F6FF97CCEFFF9C99BAFFB3A8BBFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E6DFE7FF9B90B2FF97D3F6FF9AD2F6FF9E84B8FF9975E1FF9A74D4FF9975
      E1FF9977EDFF9B73CEFF9C7ACAFF9BBBE1FF97D3F6FF9AB3D5FFAF95B3FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EBE1E7FF9D98B3FF97D3F6FF98D3F5FFA3989FFFADBD74FFABB277FFADBD
      74FFAFCA71FFABB277FFA7A88FFF9DC1DBFF97D3F6FF99B3D5FFB3A8BBFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009E83A5FF97D3F6FF9D98BAFF9A85EFFF9976E7FF9977EDFF9977EDFF9977
      EDFF9977EDFF9977EDFF9975E1FF9977EDFF9E8FC1FF97CCEFFF9CA6C8FFD7CD
      D9FF000000000000000000000000000000000000000000000000000000000000
      0000A08CA7FF97CCEFFF9DA0BFFFAECD82FFAEC472FFAFCA71FFAFCA71FFAFCA
      71FFAFCA71FFAFCA71FFADBD74FFAFCA71FFA1A6B6FF97CCEFFF9C99B9FFE0DC
      E6FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BDA9
      C2FF99B9DBFF9BABCEFF9C7ACAFF9977EDFF9977EDFF9977EDFF9977EDFF9977
      EDFF9977EDFF9977EDFF9977EDFF9977EDFF9976E7FF9D8AADFF97D3F6FF9E82
      A3FF00000000000000000000000000000000000000000000000000000000C1AD
      BCFF99B9DBFF99BFE1FFA69D8FFFAFCA71FFAFCA71FFAFCA71FFAFCA71FFAFCA
      71FFAFCA71FFAFCA71FFAFCA71FFAFCA71FFADBD74FF9E9AB7FF97CCEFFF9E8B
      A7FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009D89
      ABFF97D3F6FF9D88B3FF9977EDFF9977EDFFA187EFFFB3A5F2FF9977EDFF9977
      EDFF9977EDFF9D7EEEFFB3A5F2FF9977EDFF9977EDFF9C7ACAFF99B9DBFF9BAB
      CEFFE5D9E0FF000000000000000000000000000000000000000000000000A39A
      B0FF97D3F6FFA092A4FFAFCA71FFAFCA71FFAFCA71FFAFCA71FFB5CE83FFAFCA
      71FFAFCA71FFAFCA71FFAFCA71FFAFCA71FFAFCA71FFA6A28BFF99B9DBFF9CA6
      C7FFE5D9E0FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EBE1E7FF9C9F
      C2FF99B9DBFF9C7ACAFF9977EDFF9977EDFF9977EDFFC4C3F5FFB3A5F2FF9977
      EDFF9D7EEEFFC4C3F5FF9D7EEEFF9977EDFF9977EDFF9976E7FF9D8FB4FF97CC
      EFFFBBAAC3FF0000000000000000000000000000000000000000000000009B98
      B6FF99B9DBFFA59E96FFAFCA71FFAFCA71FFAFCA71FFB8D18BFFD5E8E1FFCCE1
      C7FFAFCA71FFAFCA71FFAFCA71FFAFCA71FFAFCA71FFAEC472FF9EA1BFFF99B9
      DBFFC8BECDFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E5D9E0FF9ABA
      DCFF9C9FC2FF9A74D4FF9977EDFF9977EDFF9977EDFF9977EDFFC4C3F5FFB7AC
      F3FFC4C3F5FF9D7EEEFF9977EDFF9977EDFF9977EDFF9977EDFF9E96C1FF97D3
      F6FFA685A5FF0000000000000000000000000000000000000000E5D9E0FF9DA7
      C7FF99B9DBFFABB277FFAFCA71FFAFCA71FFB8D18BFFD2E6D8FFB2CC79FFC1D8
      A5FFCCE1C7FFAFCA71FFAFCA71FFAFCA71FFAFCA71FFAFCA71FF9F8CA6FF97D3
      F6FFB2A1B2FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E5D9E0FFA9C4
      DDFFA29BC2FF9A74D4FF9977EDFF9977EDFF9977EDFF9977EDFF9D7EEEFFD6E1
      F8FFB7ACF3FF9977EDFF9977EDFF9977EDFF9977EDFF9977EDFFA08FC0FFA9E0
      F9FFA483A5FF0000000000000000000000000000000000000000E5D9E0FFA9C4
      DDFFA6B9C9FFABB277FFAFCA71FFAFCA71FFD2E6D8FFB2CC79FFAFCA71FFAFCA
      71FFC1D8A5FFCCE1C7FFAFCA71FFAFCA71FFAFCA71FFAFCA71FFA5A1A6FFABE1
      F8FFA6889EFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E5D9E0FFA8B5
      D0FFA7AECAFF9A74D4FF9977EDFF9977EDFF9977EDFF9D7EEEFFC4C3F5FF9D7E
      EEFFC4C3F5FFB3A5F2FF9977EDFF9977EDFF9977EDFF9977EDFFA086B3FFAEE3
      F9FFB193B3FF0000000000000000000000000000000000000000EBE1E7FFA6A3
      B7FFA8B5D0FFAAAC79FFAFCA71FFAFCA71FFAFCA71FFAFCA71FFAFCA71FFAFCA
      71FFAFCA71FFC1D8A5FFCCE1C7FFAFCA71FFAFCA71FFAFCA71FFA495A5FFACD3
      EBFFBBAAB6FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A496
      B8FFACD3EBFF9E79B7FF9977EDFF9977EDFF9D7EEEFFC4C3F5FF9D7EEEFF9977
      EDFF9977EDFFC4C3F5FFAF9DF1FF9977EDFF9977EDFF9975E1FFA59DC2FFABCC
      E4FFCDBACBFF000000000000000000000000000000000000000000000000A28D
      A2FFADDBF2FFA6988FFFAFCA71FFAFCA71FFAFCA71FFAFCA71FFAFCA71FFAFCA
      71FFAFCA71FFAFCA71FFC1D8A5FFC9DFBEFFAFCA71FFACB875FFA7A5B7FFAAC5
      DDFFDFCFD9FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A789
      ACFFAEE3F9FFA084ADFF9976E7FF9977EDFF9D7EEEFF9D7EEEFF9977EDFF9977
      EDFF9977EDFF9977EDFFA187EFFF9977EDFF9977EDFF9E79B2FFACD3EBFFA397
      B9FFF1EBEFFF000000000000000000000000000000000000000000000000AB97
      A7FFAEE3F9FFA495A5FFADBD74FFAFCA71FFAFCA71FFAFCA71FFAFCA71FFAFCA
      71FFAFCA71FFAFCA71FFAFCA71FFAFCA71FFAFCA71FFA49295FFACD3EBFFA59C
      B0FFF1EBEFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DBCE
      D9FFA6AFCEFFABCCE4FF9F7CB8FF9977EDFF9977EDFF9977EDFF9977EDFF9977
      EDFF9977EDFF9977EDFF9977EDFF9977EDFF9B78CFFFA59DC2FFADDBF2FFB094
      B3FF00000000000000000000000000000000000000000000000000000000E5D9
      E0FFA6A3B7FFABCCE4FFA38B91FFAFCA71FFAFCA71FFAFCA71FFAFCA71FFAFCA
      71FFAFCA71FFAFCA71FFAFCA71FFAFCA71FFAAAE7EFFA8B4C6FFABCCE4FFB7A2
      AFFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B196B3FFABCCE4FFA9C0DDFF9F7CB8FF9976E7FF9977EDFF9977EDFF9977
      EDFF9977EDFF9977EDFF9977EDFF9B7ADBFFA497BBFFAEE3F9FFA490B2FFF1EB
      EFFF000000000000000000000000000000000000000000000000000000000000
      0000BAA3B2FFABCCE4FFAACADDFFA38B91FFAEC472FFAFCA71FFAFCA71FFAFCA
      71FFAFCA71FFAFCA71FFAFCA71FFACBA84FFA69EB1FFAEE3F9FFA68EA2FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AB91B2FFABCCE4FFABCCE4FFA084ADFF9E79B7FF9A74D4FF9A74
      D4FF9A74D4FF9A7BE2FFA086B8FFACDCF8FFAEE3F9FFA190B2FFE1D8E0FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AD97A8FFABCCE4FFACD3EBFFA495A5FFA79E91FFAAAC79FFADBD
      74FFABB277FFADC28BFFA69A9AFFADE1F1FFADDBF2FFA69DAEFFE5D9E0FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B196B3FFA6AFCEFFAEE3F9FFACD3EBFFA8B6D0FFA49B
      C1FFA5A4C2FFAEE3F9FFAEE3F9FFAAC5DDFFA484A6FFEBE1E7FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BBA4B3FFA6A3B6FFAEE3F9FFABCCE4FFA9BDD8FFA6A5
      B6FFA6A8C3FFAEE3F9FFAEE3F9FFA8C2D6FFA98FA2FFEBE1E7FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E1D8E0FFA789ABFFA497B8FFA8B5D0FFAAC5
      DDFFAAC5DDFFA5A0C0FFA488ACFFC2ABC3FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E5D9E0FFAB97A7FFA48DA2FFA6A3B6FFAAC5
      DDFFA6ACC4FFA69DAEFFAC9EABFFC3AFBCFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E5D9E1FFE5D9
      E1FFE5D9E1FFEBE1E7FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EBE1E7FFE5D9
      E1FFE5D9E1FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000060000000180000000100010000000000200100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000}
  end
end
