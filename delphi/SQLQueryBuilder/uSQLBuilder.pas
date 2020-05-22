unit uSQLBuilder;

interface

uses  System.StrUtils;

type

  TSQLBuilder = class
  strict private
    ST_SELECT : String;
    ST_FROM   : String;
    ST_JOIN   : String;
    ST_WHERE  : String;
    ST_GROUP  : String;
    ST_ORDER  : String;
    ST_HAVING : String;

    function ReadConditions(conditions : array of const) : String;
    function ContainsComparisonOperator(conditions : array of const) : Boolean;
    function ParentThis( s : String ) : String;
    function PrepareJoin( join, table, alias : string; conditions : array of const ) : TSQLBuilder;
    procedure ResetStructure;
    procedure MountStructure;
  private
    SQL : String;
    function VarRecToStr(AVarRec: TVarRec): string;
  public
    function Select( fields : array of string ; aliases : array of string) : TSQLBuilder; overload;
    function Select( fields : array of string ) : TSQLBuilder; overload;
    function Select( field : String = '*' ) : TSQLBuilder; overload;

    function From( table : String ) : TSQLBuilder;

    function Join( table : string ; conditions : array of const ) : TSQLBuilder; overload;
    function Join( table, alias : string ; conditions : array of const ) : TSQLBuilder; overload;
    function InnerJoin( table, alias : string ; conditions : array of const ) : TSQLBuilder; overload;
    function InnerJoin( table : string ; conditions : array of const ) : TSQLBuilder; overload;
    function LeftJoin( table, alias : string ; conditions : array of const ) : TSQLBuilder; overload;
    function LeftJoin( table : string ; conditions : array of const ) : TSQLBuilder; overload;
    function LeftOuterJoin( table, alias : string ; conditions : array of const ) : TSQLBuilder; overload;
    function LeftOuterJoin( table : string ; conditions : array of const ) : TSQLBuilder; overload;

    function Where( conditions : array of const ) : TSQLBuilder;
    function WhereNot( conditions : array of const ) : TSQLBuilder;

    function OrderBy( fields : array of const ) : TSQLBuilder;
    function OrderByRaw( sOrderBy : String ) : TSQLBuilder;

    function Alias( alias : String ) : TSQLBuilder;

    function Get( bParentThis : Boolean = False ) : String;
  end;

function Qt( s : String ) : String;

implementation

uses
  System.SysUtils;

const
  SPACE = ' ';

{ TSQLBuilderAux }

function TSQLBuilder.ContainsComparisonOperator(conditions: array of const): Boolean;
var
  I: Integer;
  s : String;
const
  CO_1 = '=';
  CO_2 = '>';
  CO_3 = '<';
  CO_4 = '>=';
  CO_5 = '<=';
  CO_6 = '<>';
begin
  Result := False;
  // return if this array has any comparison operator = > <
  for I := 0 to Length(conditions)-1 do
  begin
    s := VarRecToStr(conditions[I]).Trim;

    if MatchStr(s,[CO_1,CO_2,CO_3,CO_4,CO_5,CO_6]) then
    begin
      Result := True;
      Break;
    end;
  end;
end;

function TSQLBuilder.From(table: String): TSQLBuilder;
begin
  ST_FROM := 'from'+SPACE+table;
  ST_JOIN := '';
  MountStructure;
  Result := Self;
end;

function TSQLBuilder.OrderBy(fields: array of const): TSQLBuilder;
var
  I: Integer;
  sOrderBy, sVal : String;
const
  DESC = 'desc';
begin
  sOrderBy := '';
  for I := 0 to Length(fields)-1 do
  begin
    sVal := VarRecToStr(fields[i]).Trim;
    if (not (sOrderBy = '')) and (not (sVal.ToLower=DESC)) then
      sOrderBy := sOrderBy + ',';
    sOrderBy := sOrderBy +SPACE+ sVal;
  end;
  ST_ORDER := 'order by'+sOrderBy;
  MountStructure;
  Result := Self;
end;

function TSQLBuilder.OrderByRaw( sOrderBy : String ) : TSQLBuilder;
begin
  ST_ORDER := 'order by'+SPACE+sOrderBy;
  MountStructure;
  Result := Self;
end;

function TSQLBuilder.ParentThis(s: String): String;
begin
  Result := '(' + s + ')';
end;

function TSQLBuilder.PrepareJoin( join, table, alias : string; conditions : array of const ) : TSQLBuilder;
var
  s, sTable : String;
begin
  sTable := table;
  if not alias.IsEmpty then
    sTable := sTable + SPACE + 'as' + SPACE + alias;

  if not ST_JOIN.IsEmpty then
    ST_JOIN := ST_JOIN + #13#10;

  s := join+SPACE+sTable+SPACE+'on'+SPACE+ReadConditions(conditions);

  ST_JOIN := ST_JOIN + s;
  MountStructure;
  Result := Self;
end;

function TSQLBuilder.ReadConditions(conditions: array of const): String;
var
  X, I, Z: Integer;
begin
  Result := '';
  if Length(conditions) = 2 then
  begin
    Result := ParentThis(VarRecToStr(conditions[0]) +SPACE+ '=' +SPACE+ VarRecToStr(conditions[1]));
  end
  else if ((Length(conditions) mod 2) = 0) and (not ContainsComparisonOperator(conditions)) then
  begin
    X := Trunc(Length(conditions)/2);
    for I := 0 to X-1 do
    begin
      if not Result.IsEmpty then
        Result := Result +SPACE+ 'and' +SPACE;

      Z := 2*I;

      Result := Result + ReadConditions([ VarRecToStr(conditions[Z]),
                                          VarRecToStr(conditions[Z+1]) ]);
    end;
    Result := Result;
  end
  else if ((Length(conditions) mod 3) = 0) and (Length(conditions)<>3) then
  begin
    X := Trunc(Length(conditions)/3);
    for I := 0 to X-1 do
    begin
      if not Result.IsEmpty then
        Result := Result +SPACE+ 'and' +SPACE;

      Z := 3*I;

      Result := Result + ReadConditions([ VarRecToStr(conditions[Z]),
                                          VarRecToStr(conditions[Z+1]),
                                          VarRecToStr(conditions[Z+2]) ]);
    end;
    Result := Result;
  end
  else
  begin
    for I := 0 to Length(conditions)-1 do
    begin
      if not (Result = '') then
        Result := Result+SPACE;
      Result := Result+VarRecToStr( conditions[i] );
    end;
    Result := ParentThis(Result);
  end;
end;

function TSQLBuilder.Alias( alias : String ) : TSQLBuilder;
begin
  ST_FROM := ST_FROM+SPACE+'as'+SPACE+alias;
  MountStructure;
  Result := Self;
end;

function TSQLBuilder.Get( bParentThis : Boolean = False ) : String;
begin
  MountStructure;
  if bParentThis then
    SQL := ParentThis(SQL);
  Result := SQL;
  ResetStructure;
end;

function TSQLBuilder.InnerJoin(table, alias: string;
  conditions: array of const): TSQLBuilder;
begin
  Result := PrepareJoin('inner join',table,alias,conditions);
end;

function TSQLBuilder.InnerJoin(table: string;
  conditions: array of const): TSQLBuilder;
begin
  Result := InnerJoin(table,'',conditions);
end;

function TSQLBuilder.Join(table, alias: string;
  conditions: array of const): TSQLBuilder;
begin
  Result := PrepareJoin('join',table,alias,conditions);
end;

function TSQLBuilder.LeftJoin(table, alias: string;
  conditions: array of const): TSQLBuilder;
begin
  Result := PrepareJoin('left join',table,alias,conditions);
end;

function TSQLBuilder.LeftJoin(table: string;
  conditions: array of const): TSQLBuilder;
begin
  Result := LeftJoin(table,'',conditions);
end;

function TSQLBuilder.LeftOuterJoin(table, alias: string;
  conditions: array of const): TSQLBuilder;
begin
  Result := PrepareJoin('left outer join',table,alias,conditions);
end;

function TSQLBuilder.LeftOuterJoin(table: string;
  conditions: array of const): TSQLBuilder;
begin
  Result := LeftOuterJoin(table,'',conditions);
end;

function TSQLBuilder.Join( table : string ; conditions : array of const ) : TSQLBuilder;
begin
  Result := Join(table,'',conditions);
end;

procedure TSQLBuilder.MountStructure;
begin
  SQL := ST_SELECT +#13#10+
         ST_FROM;

  if not ST_JOIN.IsEmpty then
    SQL := SQL + #13#10 + ST_JOIN;

  if not ST_WHERE.IsEmpty then
    SQL := SQL + #13#10 + ST_WHERE;

  if not ST_GROUP.IsEmpty then
    SQL := SQL + #13#10 + ST_GROUP;

  if not ST_HAVING.IsEmpty then
    SQL := SQL + #13#10 + ST_HAVING;

  if not ST_ORDER.IsEmpty then
    SQL := SQL + #13#10 + ST_ORDER;
end;

function TSQLBuilder.Where( conditions : array of const ) : TSQLBuilder;
var
  sCond : String;
begin
  sCond := ReadConditions(conditions);
  ST_WHERE := 'where'+SPACE+sCond;
  MountStructure;
  Result := Self;
end;

function TSQLBuilder.WhereNot(conditions: array of const): TSQLBuilder;
var
  sCond : String;
begin
  sCond := ReadConditions(conditions);
  ST_WHERE := 'where not'+SPACE+sCond;
  MountStructure;
  Result := Self;
end;

{ TSQLBuilder }

procedure TSQLBuilder.ResetStructure;
begin
  ST_SELECT := '';
  ST_FROM   := '';
  ST_WHERE  := '';
  ST_GROUP  := '';
  ST_ORDER  := '';
  ST_HAVING := '';
  SQL := '';
end;

function TSQLBuilder.Select(fields: array of string ; aliases : array of string): TSQLBuilder;
var
  I: Integer;
  sFields : String;
begin
  sFields := '';
  for I := 0 to Length(fields)-1 do
  begin
    if not (sFields = '') then
      sFields := sFields + ',';

    if (Length(aliases) < I ) then
      sFields := sFields + SPACE + fields[I]
    else
    begin
      if not aliases[I].IsEmpty then
        sFields := sFields + SPACE + fields[I] + SPACE + 'as' + SPACE + aliases[I]
      else
        sFields := sFields + SPACE + fields[I];
    end;
  end;
  ST_SELECT := 'select'+sFields;
  MountStructure;
  Result := Self;
end;

function TSQLBuilder.Select(field: String = '*'): TSQLBuilder;
begin
  ST_SELECT := 'select'+SPACE+field;
  MountStructure;
  Result := Self;
end;

function TSQLBuilder.Select(fields: array of string): TSQLBuilder;
begin
  Result := Select(fields,['']);
end;

function TSQLBuilder.VarRecToStr( AVarRec : TVarRec ) : string;
const
  Bool : array[Boolean] of string = ('False', 'True');
begin
  case AVarRec.VType of
    vtInteger:    Result := IntToStr(AVarRec.VInteger);
    vtBoolean:    Result := Bool[AVarRec.VBoolean];
    vtChar:       Result := AVarRec.VChar;
    vtExtended:   Result := FloatToStr(AVarRec.VExtended^);
    vtString:     Result := AVarRec.VString^;
    vtPChar:      Result := AVarRec.VPChar;
    vtObject:     Result := AVarRec.VObject.ClassName;
    vtClass:      Result := AVarRec.VClass.ClassName;
    vtWideChar:   Result := AVarRec.VWideChar;
    vtAnsiString: Result := string(AVarRec.VAnsiString);
    vtCurrency:   Result := CurrToStr(AVarRec.VCurrency^);
    vtVariant:    Result := string(AVarRec.VVariant^);
    vtUnicodeString: Result := String(AVarRec.VUnicodeString);

  else
    result := '';
  end;
end;

function Qt( s : String ) : String;
begin
  Result := QuotedStr(s);
end;

end.
