unit uDB_Controller;
// Data Base Controller

interface

uses
  Classes, SQLExpr, SysUtils, Forms, DB, Variants, DBConsts, DBClient,
  Dialogs, Data.DBXCommon, Data.SqlConst,
  MaskUtils, IniFiles;

type

  TDB = class
  private
    FParametros : TParams;
    FCodigoSQL : String;
    FQry : TCustomSQLDataSet;
    Transacao : TDBXTransaction;
    FSQLConnection: TSQLConnection;
    function getCodigoSQL: String;
    function getParametros: TParams;
    procedure setCodigoSQL(const Value: String);
    procedure setParametros(const Value: TParams);
    procedure setQry(const Value: TCustomSQLDataSet);
    function getQry: TCustomSQLDataSet;
    procedure SetSQLConnection(const Value: TSQLConnection);
  public
    constructor Create( Connection : TSQLConnection = nil );
    destructor Destroy; override;

    property Parametros: TParams read getParametros write setParametros;
    property CodigoSQL: String read getCodigoSQL write setCodigoSQL;
    property Qry : TCustomSQLDataSet read getQry write setQry;
    property SQLConnection : TSQLConnection read FSQLConnection write SetSQLConnection;
    function TransacaoAtiva: Boolean;
    procedure AbreTransacao;
    function Abrir : Integer; // Essa função executa o comando sql e atribui o resultado para uma qry
    procedure AddParametro( Valor : String); overload;
    procedure AddParametro( Valor : TDateTime ); overload;
    procedure AddParametro( Valor : Integer); overload;
    procedure AddParametro( Valor : Boolean); overload;
    procedure AddParametro( Valor : Double); overload;
    procedure AddParametro( Valor : Currency); overload;
    procedure AddParametro( Valor : TStream; Tipo : TFieldType ); overload;
    procedure AddParametro( Valor : Variant; Tipo : TFieldType ); overload;
    procedure Commit;
    function Executar : Integer; // essa função somente executa um sql e retorna um inteiro
    function Eof: Boolean;
    function FieldByName( FieldName : String ): TField;
    function IsEmpty: Boolean;
    procedure LimpaParametros;
    procedure Next;
    procedure Rollback;
    class function BuscaCampo(sCampo : string; sTabela: String; valorVerificacao : Variant; sCampoVerificacao : String) : Variant;
    class function GetFieldSize( sCampo, sTabela : string ) : Integer;
    class procedure BeforeConnection(SQLConnection: TSQLConnection);
    class procedure SqlConnectionOnLogin(SQLConnection : TSQLConnection; LoginParams: TStrings );
    class procedure CheckUseDefaultPort(SQLConnection: TSQLConnection);
    {$IFDEF WS_TRANSPEX}
      class function ObterUltimoID : Integer;
    {$ENDIF}
  end;

implementation

uses
  WSUtils;

class function TDB.BuscaCampo(sCampo : string; sTabela: String; valorVerificacao : Variant; sCampoVerificacao: string) : Variant;
var
  vRetorna : Variant;
  db : TDB;
begin
  // FUNÇÃO CRIADA POR: GULHERME DIAS - 10/07/2015
  // BUSCA 1 CAMPO DE 1 TABELA FILTRANDO POR 1 VALOR, FACILITANDO A BUSCA
  // POR APENAS UM CAMPO NO BANCO DE DADOS
  db := TDB.Create;
  try
    db.CodigoSQL := 'select '+ sCampo +
                    ' from '+ sTabela +
                    ' where '+ sCampoVerificacao;
    if VarIsNull( valorVerificacao ) then
      db.CodigoSQL := db.CodigoSQL + ' is null'
    else
    begin
      db.CodigoSQL := db.CodigoSQL + ' = :pParametro ';
      db.LimpaParametros;
      TParam( db.Parametros.Add ).Value := valorVerificacao;
    end;
    db.Abrir;
    vRetorna := null;
    // SE NÃO OBTIVER RETORNO NO SELECT, RETORNA NULL
    if not db.Qry.IsEmpty then
      vRetorna := db.Qry.FieldByName(sCampo).Value;
  finally
    db.Free;
  end;
  Result := vRetorna;
end;

constructor TDB.Create( Connection : TSQLConnection = nil );
begin
  // cria a classe
  inherited Create;
  // instancia os parâmetros
  FParametros := TParams.Create;
  if ( Connection <> nil ) then
    FSQLConnection := Connection
  else
    FSQLConnection := GetSQLConnection;
end;


function TDB.getCodigoSQL: String;
begin
  Result := FCodigoSQL;
end;

function TDB.getParametros: TParams;
begin
  Result := FParametros;
end;

procedure TDB.setCodigoSQL(const Value: String);
begin
  FCodigoSQL := Value;
end;

procedure TDB.setParametros(const Value: TParams);
begin
  FParametros := Value;
end;

destructor TDB.Destroy;
begin
  // destroi os parâmetros para liberar a memória
  if FParametros <> nil then
    FreeAndNil(FParametros);
  if FQry <> nil then
    FreeAndNil( FQry );
  inherited;
end;

function TDB.getQry: TCustomSQLDataSet;
begin
  Result := FQry;
end;

procedure TDB.setQry(const Value: TCustomSQLDataSet);
begin
  FQry := Value;
end;

procedure TDB.LimpaParametros;
begin
  FParametros.Clear;
end;

function TDB.Abrir : Integer;
begin
  // se a Qry já foi usada anteriormente, libera a memória
  if ( FQry <> nil ) then
    FreeAndNil( FQry );

  Result := SQLConnection.Execute(CodigoSQL,Parametros,@FQry);
end;

procedure TDB.AddParametro(Valor: Integer);
var
  parametro : TParam;
begin
  parametro := TParam(FParametros.Add);
  parametro.DataType := ftInteger;
  parametro.Bound := True;
  parametro.AsInteger := Valor;
end;

procedure TDB.AddParametro(Valor: Boolean);
var
  parametro : TParam;
begin
  parametro := TParam(FParametros.Add);
  parametro.DataType := ftBoolean;
  parametro.Bound := True;
  parametro.AsBoolean := Valor;
end;

procedure TDB.AddParametro(Valor: Double);
var
  parametro : TParam;
begin
  parametro := TParam(FParametros.Add);
  parametro.DataType := ftFloat;
  parametro.Bound := True;
  parametro.AsFloat := Valor;
end;

procedure TDB.AddParametro(Valor: String);
var
  parametro : TParam;
begin
  parametro := TParam(FParametros.Add);
  parametro.DataType := ftString;
  parametro.Bound := True;
  parametro.AsString := Valor;
end;

procedure TDB.AddParametro(Valor: TStream; Tipo : TFieldType);
var
  parametro : TParam;
begin
  parametro := TParam(FParametros.Add);
  parametro.DataType := Tipo;
  parametro.Bound := True;
  parametro.LoadFromStream(Valor, Tipo);
end;

procedure TDB.AddParametro(Valor: Variant ; Tipo : TFieldType );
var
  parametro : TParam;
begin
  parametro := TParam(FParametros.Add);
  parametro.DataType := Tipo;
  parametro.Bound := True;
  parametro.Value := Valor;
end;

procedure TDB.AddParametro(Valor: Currency);
var
  parametro : TParam;
begin
  parametro := TParam(FParametros.Add);
  parametro.DataType := ftCurrency;
  parametro.Bound := True;
  parametro.AsCurrency := Valor;
end;

procedure TDB.AddParametro(Valor: TDateTime);
var
  parametro : TParam;
begin
  parametro := TParam(FParametros.Add);
  parametro.DataType := ftDateTime;
  parametro.Bound := True;
  parametro.AsDateTime := Valor;
end;

function TDB.Executar: Integer;
var
  bAbriuTransacaoAqui : Boolean;
begin
  // Se não há uma transação ativa, então abre uma
  if ( TransacaoAtiva ) then
    bAbriuTransacaoAqui := False
  else
  begin
    AbreTransacao;
    bAbriuTransacaoAqui := True;
  end;

  try
    Result := SQLConnection.Execute(CodigoSQL,Parametros);
    // Se a transação foi aberta aqui comita
    if ( bAbriuTransacaoAqui ) then
      Commit;
  except
    // Se a transação foi aberta aqui e ocorreu erro, faz rollback
    if ( bAbriuTransacaoAqui ) then
      Rollback;
    raise;
  end;
end;

procedure TDB.AbreTransacao;
begin
  if not TransacaoAtiva then
    Transacao := WSUtils.AbreTransacao( SQLConnection );
end;

class procedure TDB.CheckUseDefaultPort(SQLConnection: TSQLConnection);
var
  sHostName : String;
begin
  // Se a porta nao estiver definida força a utilização da porta padrão
  sHostName := SQLConnection.Params.Values[DATABASENAME_KEY];
  sHostName := Copy( sHostName, 1, Pos(':',sHostName) -1);
  if ( Pos('/',sHostName) = 0 ) then
    SQLConnection.Params.Values['ForceUsingDefaultPort'] := 'True';
  //
end;

procedure TDB.Commit;
begin
  FechaTransacao( SQLConnection, Transacao, True );
end;

procedure TDB.Rollback;
begin
  FechaTransacao( SQLConnection, Transacao, False );
end;

procedure TDB.SetSQLConnection(const Value: TSQLConnection);
begin
  FSQLConnection := Value;
end;

class procedure TDB.SqlConnectionOnLogin(SQLConnection: TSQLConnection;
  LoginParams: TStrings);
var
  IniFile : TMemIniFile;
  List : TStrings;
  sIniFileName : string;
begin
  LoginParams.Values[szUSERNAME] := 'sysdba';
  LoginParams.Values[szPASSWORD] := 'carmofae';
  SQLConnection.Params.Values[szUserName] := LoginParams.Values[szUSERNAME];
  SQLConnection.Params.Values[szPASSWORD] := LoginParams.Values[szPASSWORD];

  List := TStringList.Create;
  try
    sIniFileName := IncludeTrailingPathDelimiter(ExtractFilePath( ParamStr(0) ))+'dbxconnections.ini';
    IniFile := TMemIniFile.Create(sIniFileName);
    try
      if FileExists(sIniFileName) then
      begin
        IniFile.ReadSectionValues(SQLConnection.ConnectionName, List);

        if ( List.Values[szUSERNAME] <> '' ) then
        begin
          LoginParams.Values[szUSERNAME] := List.Values[szUSERNAME];
          SQLConnection.Params.Values[szUserName] := List.Values[szUSERNAME];
        end;

        if ( List.Values[szPASSWORD] <> '' ) then
        begin
          LoginParams.Values[szPASSWORD] := List.Values[szPASSWORD];
          SQLConnection.Params.Values[szPASSWORD] := List.Values[szPASSWORD];
        end;
      end;
    finally
      IniFile.Free;
    end;
  finally
    List.Free;
  end;
end;

function TDB.TransacaoAtiva: Boolean;
begin
  Result := SQLConnection.InTransaction;
end;

function TDB.Eof: Boolean;
begin
  if Assigned( FQry ) then
    Result := FQry.Eof
  else
    raise Exception.Create( SDataSetClosed );
end;

function TDB.FieldByName(FieldName: String): TField;
begin
  if Assigned( FQry ) then
    Result := FQry.FieldByName(FieldName)
  else
    raise Exception.Create( SDataSetClosed );
end;

procedure TDB.Next;
begin
  if Assigned( FQry ) then
    FQry.Next
  else
    raise Exception.Create( SDataSetClosed );
end;

{$IFDEF WS_TRANSPEX}
  class function TDB.ObterUltimoID: Integer;
  var
    db : TDB;
  begin
    db := TDB.Create;
    try
      db.CodigoSQL := 'select LAST_INSERT_ID() as ID';
      db.Abrir;
      Result := db.FieldByName('ID').AsInteger;
    finally
      db.Free;
    end;
  end;
{$ENDIF}

function TDB.IsEmpty: Boolean;
begin
  if Assigned( FQry ) then
    Result := FQry.IsEmpty
  else
    raise Exception.Create( SDataSetClosed );
end;

class function TDB.GetFieldSize(sCampo, sTabela: string): Integer;
var
  db : TDB;
begin
  db := TDB.Create;
  try
    db.CodigoSQL := 'select ' + sCampo + ' from ' + sTabela + ' where ( 1 = 0 )';
    db.Abrir;
    Result := db.FieldByName(sCampo).Size;
  finally
    db.Free;
  end;
end;



class procedure TDB.BeforeConnection(SQLConnection: TSQLConnection);
var
  Ini: TIniFile;
  s : string;
  sl : TStrings;
  IniFile : TMemIniFile;
  List : TStrings;
  sIniFileName : string;
begin
  if SQLConnection.ConnectionName = '' then
    DatabaseError(SConnectionNameMissing);

  // Adiciona as opções padrões para a conexão: Somente se for conexão com Mysql
  if ( UpperCase(SQLConnection.Params.Values['DriverName']) = 'DEVARTINTERBASE' ) then
  begin
    SQLConnection.Params.Values['LockTimeout'] := '10';
    SQLConnection.Params.Values['Reconnect'] := 'True';
    SQLConnection.Params.Values['WaitOnLocks'] := 'True';
    SQLConnection.Params.Values['UseUnicode'] := 'False';
    SQLConnection.Params.Values['DevartInterBase TransIsolation'] := 'ReadCommitted';
  end
  else if ( UpperCase(SQLConnection.Params.Values['DriverName']) = 'DEVARTMYSQL' ) then
  begin
    SQLConnection.Params.Values['Reconnect'] := 'True';
    SQLConnection.Params.Values['UseUnicode'] := 'False';
  end;

  List := TStringList.Create;
  try
    sIniFileName := IncludeTrailingPathDelimiter(ExtractFilePath( ParamStr(0) ))+'dbxconnections.ini';
    IniFile := TMemIniFile.Create(sIniFileName);
    try
      if FileExists(sIniFileName) then
      begin
        IniFile.ReadSectionValues(SQLConnection.ConnectionName, List);
        SQLConnection.Params.Values[DATABASENAME_KEY] := List.Values[DATABASENAME_KEY];
        SQLConnection.Params.Values[HOSTNAME_KEY]     := List.Values[HOSTNAME_KEY];
      end;
    finally
      IniFile.Free;
    end;
  finally
    List.Free;
  end;
end;

end.



