unit uJsonUtils;

interface

uses
  System.JSON, System.SysUtils, Winapi.Windows, Data.SqlExpr, Data.DB, System.Variants;

//Verifica se a variávelé do tipo Boleana
function VarIsBool(const Value:Variant):Boolean;
function VarIsDate(const Value:Variant):Boolean;

//Converte uma string (formatado como JSON) em um Objeto JSON
function StrToJSON(str: string): TJSONObject;
//Converte uma string (formatado como JSON) em uma Array JSON
function StrToJSONArray(str: string): TJSONArray;
//Converte um objeto JSON em uma Array JSON
function JSONObjToJSONArray(JSONOBject: TJSONObject): TJSONArray;

//Converte uma string ( do formato informado ) em um TDateTime
function StringToDateTime( sStringDate : String; sFormat : String = 'yyyy-mm-ddThh:nn:ss-zzzz'; sSeparator : Char = '-' ): TDateTime;
//Converte um TDateTime em uma string ( do formato informado )
function DateTimeToString( DateTime: TDateTime;  sFormat : String = 'yyyy-mm-ddThh:nn:ss-0300'; sSeparator : Char = '-' ): String;

//Cria um JSONArray contendo os registros do DataSet informado;
function DataSetToJSON(ds: TCustomSQLDataSet): TJSONArray;

//Cria um registro (par) em JSON
function JsonPair(sChave: String; Valor: Variant): TJSONPair; overload;
function JsonPair(sChave: String; JSONObject: TJSONObject): TJSONPair; overload;
function JsonPair(sChave: String; JSONArray: TJSONArray): TJSONPair; overload;

implementation

function StrToJSON(str: string): TJSONObject;
begin
  Result := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(str), 0) as TJSONObject;
end;

function StrToJSONArray(str: string): TJSONArray;
begin
  Result := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(str), 0) as TJSONArray;
end;

function JSONObjToJSONArray(JSONOBject: TJSONObject): TJSONArray;
begin
  Result := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(JSONOBject.ToJSON), 0) as TJSONArray;
end;

function StringToDateTime(sStringDate,
  sFormat: String; sSeparator : Char): TDateTime;
var
  fs : TFormatSettings;
begin
  GetLocaleFormatSettings(LOCALE_SYSTEM_DEFAULT, fs);
  fs.DateSeparator := sSeparator;
  fs.DecimalSeparator := '.';
  fs.ShortDateFormat := sFormat;
  Result := StrToDateTime( sStringDate, fs );
end;

function DateTimeToString(DateTime: TDateTime; sFormat: String;
  sSeparator: Char): String;
var
  fs : TFormatSettings;
begin
  fs := TFormatSettings.Create( GetThreadLocale );
  fs.DateSeparator := sSeparator;
  fs.DecimalSeparator := '.';
  fs.ShortDateFormat := sFormat;
  Result := DateTimeToStr( DateTime, fs );
end;

function DataSetToJSON(ds: TCustomSQLDataSet): TJSONArray;
var
  listObj : TJSONArray;
  obj : TJSONObject;
  i : integer;
begin
  listObj := TJSONArray.Create;
  try
    while not ds.Eof do
    begin
      obj := TJSONObject.Create;
      try
        for i := 0 to (ds.FieldCount - 1) do
        begin
          case ds.Fields[i].DataType of
            ftInteger,
            ftFloat,
            ftCurrency,
            ftSmallint,
            ftBCD,
            ftLargeint,
            ftShortint,
            ftExtended,
            ftTimeStamp:
            begin
              obj.AddPair(TJsonPair.Create(ds.Fields[i].FieldName,
                              TJSONNumber.Create(ds.Fields[i].AsInteger)));
            end;
            ftBoolean:
            begin
              obj.AddPair(TJsonPair.Create(ds.Fields[i].FieldName,
                              TJSONBool.Create(ds.Fields[i].AsBoolean)));
            end;
            ftDateTime:
            begin
              obj.AddPair(TJsonPair.Create(ds.Fields[i].FieldName,
                              TJSONString.Create(DateTimeToString(ds.Fields[i].AsDateTime))));
            end;
            ftDate:
            begin
              obj.AddPair(TJsonPair.Create(ds.Fields[i].FieldName,
                              TJSONString.Create(DateTimeToString(ds.Fields[i].AsDateTime, 'yyyy-mm-dd'))));
            end;
            ftTime:
            begin
              obj.AddPair(TJsonPair.Create(ds.Fields[i].FieldName,
                              TJSONString.Create(DateTimeToString(ds.Fields[i].AsDateTime, 'hh:nn:ss'))));
            end;
          else
            begin
              obj.AddPair(TJsonPair.Create(ds.Fields[i].FieldName,
                              TJSONString.Create(ds.Fields[i].AsString)));
            end;
          end;
        end;
      except
        on E:Exception do
        begin
          raise Exception.Create('Ocorreu um erro ao converter o DataSet eum um Objeto JSON' + #13#10 +
                                 E.Message);
        end;

      end;
        listObj.AddElement(obj);
      ds.Next;
    end;
    Result := listObj;
  finally
    listObj.Free;
  end;
end;

function VarIsBool(const Value:Variant):Boolean;
begin
  Result := (VarType(Value) = varBoolean);
end;

function VarIsDate(const Value:Variant):Boolean;
begin
  Result := (VarType(Value) = varDate );
end;

function JsonPair(sChave: String; Valor: Variant): TJSONPair;
begin
  if VarIsNull(Valor) then
    Result := TJSONPair.Create( TJSONString.Create(sChave), TJSONNull.Create )
  else if VarIsDate(Valor) then
    Result := TJSONPair.Create( TJSONString.Create(sChave), TJSONString.Create(DateTimeToString(Valor)) )
  else if VarIsBool(Valor) then
    Result := TJSONPair.Create( TJSONString.Create(sChave), TJSONBool.Create(Valor) )
  else if VarIsNumeric(Valor) then
    Result := TJSONPair.Create( TJSONString.Create(sChave), TJSONNumber.Create(Valor) )
  else
    Result := TJSONPair.Create( TJSONString.Create(sChave), TJSONString.Create(Trim(VarToStr(Valor))) );
end;

function JsonPair(sChave: String; JSONOBject: TJSONObject): TJSONPair;
begin
  Result := TJSONPair.Create( TJSONString.Create(sChave), JSONObject );
end;

function JsonPair(sChave: String; JSONArray: TJSONArray): TJSONPair;
begin
  Result := TJSONPair.Create( TJSONString.Create(sChave), JSONArray );
end;

end.
