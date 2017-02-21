unit uCharacters;

interface

uses System.SysUtils;

type
  TCombatMode = (cmOffensive=100,cmBalanced=75,cmDefensive=50);

  TSkill = record
    Name : String;
    Skill : String;
    Min : Integer;
    Max : Integer;
  end;

  TCharacter = class
  private
    FLevel: Integer;
    FMagicLevel: Integer;
    FManaPoints: Integer;
    FHitPoints: Integer;
    FCombatMode: TCombatMode;
    FCapacity: Integer;
    procedure SetHitPoints(const Value: Integer);
    procedure SetLevel(const Value: Integer);
    procedure SetMagicLevel(const Value: Integer);
    procedure SetManaPoints(const Value: Integer);
    procedure SetCombatMode(const Value: TCombatMode);
    procedure SetCapacity(const Value: Integer);
  protected
    iHpLevel : Integer;
    iMpLevel : Integer;
  public
    property HitPoints : Integer read FHitPoints write SetHitPoints;
    property ManaPoints : Integer read FManaPoints write SetManaPoints;
    property Level : Integer read FLevel write SetLevel;
    property MagicLevel : Integer read FMagicLevel write SetMagicLevel;
    property CombatMode : TCombatMode read FCombatMode write SetCombatMode;
    property Capacity : Integer read FCapacity write SetCapacity;

    class function GetMinMax(Skill : TSkill): String;
  end;

implementation

{ TCharacter }


class function TCharacter.GetMinMax(Skill: TSkill): String;
begin
  Result := 'Min: ' + FloatToStr(Skill.Min) + ' Max: ' + FloatToStr(Skill.Max);
end;

procedure TCharacter.SetCapacity(const Value: Integer);
begin
  FCapacity := Value;
end;

procedure TCharacter.SetCombatMode(const Value: TCombatMode);
begin
  FCombatMode := Value;
end;

procedure TCharacter.SetHitPoints(const Value: Integer);
begin
  FHitPoints := Value;
end;

procedure TCharacter.SetLevel(const Value: Integer);
begin
  FLevel := Value;
end;

procedure TCharacter.SetMagicLevel(const Value: Integer);
begin
  FMagicLevel := Value;
end;

procedure TCharacter.SetManaPoints(const Value: Integer);
begin
  FManaPoints := Value;
end;

end.
