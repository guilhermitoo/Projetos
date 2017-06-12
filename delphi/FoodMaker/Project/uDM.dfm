object DM: TDM
  OldCreateOrder = False
  Height = 203
  Width = 396
  object conPrincipal: TSQLConnection
    DriverName = 'Odbc'
    Params.Strings = (
      'DriverName=Odbc'
      'DriverUnit=Data.DBXOdbc'
      'DriverPackageLoader=TDBXOdbcDriverLoader,DBXOdbcDriver230.bpl'
      
        'MetaDataPackageLoader=TDBXOdbcMetaDataCommandFactory,DbxOdbcDriv' +
        'er230.bpl'
      'IsolationLevel=ReadCommitted'
      'RowSetSize=20'
      
        'DriverAssemblyLoader=Borland.Data.TDBXOdbcDriverLoader,Borland.D' +
        'ata.DbxOdbcDriver,Version=23.0.0.0,Culture=neutral,PublicKeyToke' +
        'n=91d62ebb5b0d1b1b'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXOdbcMetaDataCommandFacto' +
        'ry,Borland.Data.DbxOdbcDriver,Version=23.0.0.0,Culture=neutral,P' +
        'ublicKeyToken=91d62ebb5b0d1b1b'
      'Database=PostgreSQL35W'
      'User_Name=postgres'
      'Password=masterkey')
    Left = 184
    Top = 88
  end
end
