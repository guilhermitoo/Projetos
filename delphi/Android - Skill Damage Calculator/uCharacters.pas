unit uCharacters;

interface

type
  TCombatMode = (cmOffensive,cmBalanced,cmDefensive);

  TCharacter = class
  private
    FLevel: Integer;
    FMagicLevel: Integer;
    FManaPoints: Integer;
    FHitPoints: Integer;
    FCombatMode: TCombatMode;
    procedure SetHitPoints(const Value: Integer);
    procedure SetLevel(const Value: Integer);
    procedure SetMagicLevel(const Value: Integer);
    procedure SetManaPoints(const Value: Integer);
    procedure SetCombatMode(const Value: TCombatMode);
  protected
    iHpLevel : Integer;
    iMpLevel : Integer;
  public
    property HitPoints : Integer read FHitPoints write SetHitPoints;
    property ManaPoints : Integer read FManaPoints write SetManaPoints;
    property Level : Integer read FLevel write SetLevel;
    property MagicLevel : Integer read FMagicLevel write SetMagicLevel;
    property CombatMode : TCombatMode read FCombatMode write SetCombatMode;
  end;

implementation

{ TCharacter }

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
