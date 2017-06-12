unit uManipulaClasses;

interface

uses
  System.StrUtils, System.Classes, System.UITypes, TypInfo, System.Rtti,
  System.SysUtils, System.Generics.Collections, System.Variants;

type
  TManipulator = class
    private
      FObj        : TObject;
      FProperties : TStringList;
      FRProp: TRttiProperty;
      FRType: TRttiType;
      FRCxt: TRttiContext;

      procedure SetRCtx  (const Value: TRttiContext);
      procedure SetRProp (const Value: TRttiProperty);
      procedure SetRType (const Value: TRttiType);
      procedure SetObj   (const Value: TObject);

      property RCxt  : TRttiContext read FRCxt write SetRCtx;
      property RType : TRttiType read FRType write SetRType;
      property RProp : TRttiProperty read FRProp write SetRProp;
    public
      property Obj        : TObject       read FObj        write SetObj;
      property Properties : TStringList   read FProperties write FProperties;


      procedure LoadProperties;

      function  GetPropertyValue      (sProperty : String) : Variant;        overload;
      function  GetPropertyTValue     (sProperty : String) : TValue;         overload;
      function  GetPropertyClass      (sProperty : String) : TClass;         overload;
      function  GetPropertyObjectName (sProperty : String) : TObject;        overload;
      function  GetPropertyTypeName   (sProperty : String) : String;
      function  FindProperty          (sProperty : String) : TRttiProperty;  overload;
      function  ExistsProperty        (sProperty : String) : Boolean;        overload;
      procedure SetValueToProperty    (Value : Variant; sProperty : String); overload;
      procedure SetValueToProperty    (Value : TValue; sProperty : String);  overload;

      class function GetPropertyValue      (AObj : TObject; sProperty : String) : Variant;       overload;
      class function GetPropertyTValue     (AObj : TObject; sProperty : String) : TValue;        overload;
      class function GetPropertyClass      (AObj : TObject; sProperty : String) : TClass;        overload;
      class function GetPropertyObjectName (AObj : TObject; sProperty : String) : TObject;       overload;
      class function FindProperty          (AObj : TObject; sProperty : String) : TRttiProperty; overload;
      class function ExistsProperty        (AObj : TObject; sProperty : String) : Boolean;       overload;
      class function PropertiesFrom        (AObj : TObject)                     : TStringList;

      class procedure SetValueToProperty(var AObj : TObject; Value : Variant; sProperty : String); overload;
      class procedure SetValueToProperty(var AObj : TObject; Value : TValue; sProperty : String); overload;

      constructor Create;
      destructor  Destroy; override;
  end;

implementation

{ TManipulator }

constructor TManipulator.Create;
begin
  inherited Create;
  Properties := TStringList.Create;
  RCxt       := TRttiContext.Create;
end;

destructor TManipulator.Destroy;
begin
  Properties.Free;
  RCxt.Free;
  inherited;
end;

function TManipulator.ExistsProperty(sProperty: String): Boolean;
begin
  Result := ( RType.GetProperty(sProperty) <> nil );
end;

class function TManipulator.ExistsProperty(AObj: TObject;
  sProperty: String): Boolean;
var
  Man : TManipulator;
begin
  Man := TManipulator.Create;
  try
    Man.Obj := AObj;
    Result  := Man.ExistsProperty(sProperty);
  finally
    Man.Free;
  end;
end;

function TManipulator.FindProperty(sProperty: String): TRttiProperty;
begin
  Result := RType.GetProperty(sProperty);
end;

class function TManipulator.FindProperty(AObj: TObject;
  sProperty: String): TRttiProperty;
var
  Man : TManipulator;
begin
  Man := TManipulator.Create;
  try
    Man.Obj := AObj;
    Result  := Man.FindProperty(sProperty);
  finally
    Man.Free;
  end;
end;

function TManipulator.GetPropertyValue(sProperty: String): Variant;
var
  v : TValue;
begin
  v := GetPropertyTValue(sProperty);

  if v.IsEmpty then
    Result := null
  else
    Result := v.ToString;
end;

class function TManipulator.GetPropertyClass(AObj: TObject;
  sProperty: String): TClass;
var
  Man : TManipulator;
begin
  Man := TManipulator.Create;
  try
    Man.Obj := AObj;
    Result := Man.GetPropertyClass(sProperty);
  finally
    Man.Free;
  end;
end;

function TManipulator.GetPropertyTypeName(sProperty: String): String;
begin
  RProp := RType.GetProperty(sProperty);

  Result := RProp.PropertyType.ToString;
end;

function TManipulator.GetPropertyObjectName(sProperty: String): TObject;
begin
//
end;

class function TManipulator.GetPropertyObjectName(AObj: TObject;
  sProperty: String): TObject;
begin
//
end;

function TManipulator.GetPropertyTValue(sProperty: String): TValue;
begin
  Result := TValue.Empty;
  RProp := RType.GetProperty(sProperty);
  if ( RProp <> nil ) then
    Result := RProp.GetValue(Obj);
end;

class function TManipulator.GetPropertyTValue(AObj: TObject;
  sProperty: String): TValue;
var
  Man : TManipulator;
begin
  Man := TManipulator.Create;
  try
    Man.Obj := AObj;
    Result := Man.GetPropertyTValue(sProperty);
  finally
    Man.Free;
  end;
end;

function TManipulator.GetPropertyClass(sProperty: String): TClass;
begin
  Result := TRttiInstanceType(RProp.PropertyType).MetaclassType;
end;

class function TManipulator.GetPropertyValue(AObj: TObject;
  sProperty: String): Variant;
var
  Man : TManipulator;
begin
  Man := TManipulator.Create;
  try
    Man.Obj := AObj;
    Result := Man.GetPropertyValue(sProperty);
  finally
    Man.Free;
  end;
end;

procedure TManipulator.LoadProperties;
var
  RProperty : TRttiProperty;
begin
  //Lista todas as propriedades do Objeto
  for RProperty in RType.GetProperties do
  begin
    try
      Properties.Add(RProperty.Name+'='+ RProperty.GetValue(FObj).ToString);
    except
      on E:Exception do
        Properties.Add(RProperty.Name+'=Error');
    end;
  end;
end;

class function TManipulator.PropertiesFrom(AObj: TObject): TStringList;
var
  Man : TManipulator;
begin
  Man := TManipulator.Create;
  try
    Man.Obj := AObj;
    Man.LoadProperties;
    Result := TStringList.Create;
    Result.Text := Man.Properties.Text;
  finally
    Man.Free;
  end;
end;

procedure TManipulator.SetObj(const Value: TObject);
begin
  if (Value <> nil) and (FObj <> Value) then
  begin
    FObj := Value;
    RType := RCxt.GetType(FObj.ClassType);
  end;
end;

procedure TManipulator.SetRCtx(const Value: TRttiContext);
begin
  FRCxt := Value;
end;

procedure TManipulator.SetRProp(const Value: TRttiProperty);
begin
  if FRProp <> Value then
    FRProp := Value;
end;

procedure TManipulator.SetRType(const Value: TRttiType);
begin
  if FRType <> Value then
    FRType := Value;
end;

procedure TManipulator.SetValueToProperty(Value: TValue; sProperty: String);
begin
  RProp := FindProperty(sProperty);
  RProp.SetValue(Obj, Value);
end;

class procedure TManipulator.SetValueToProperty(var AObj: TObject;
  Value: TValue; sProperty: String);
var
  Man : TManipulator;
begin
  Man := TManipulator.Create;
  try
    Man.Obj := AObj;
    Man.SetValueToProperty(Value, sProperty);
  finally
    Man.Free;
  end;
end;

procedure TManipulator.SetValueToProperty(Value : Variant; sProperty : String);
begin
  RProp := FindProperty(sProperty);
  RProp.SetValue(Obj, TValue.FromVariant(Value));
end;

class procedure TManipulator.SetValueToProperty(var AObj: TObject;
  Value : Variant; sProperty : String);
var
  Man : TManipulator;
begin
  Man := TManipulator.Create;
  try
    Man.Obj := AObj;
    Man.SetValueToProperty(Value, sProperty);
  finally
    Man.Free;
  end;
end;

end.
