unit uPaladin;

interface

uses uCharacters;

type
  TPaladin = class(TCharacter)
  private
    FWeaponDamage: Integer;
    FDistanceFighting: Integer;
    FDivineMissile: Integer;
    FDivineHealing: Integer;
    FEtherealSpear: Integer;
    FDivineCaldera: Integer;
    FAttackDamage: Integer;
    FDivineMissileMax: Integer;
    FDivineHealingMax: Integer;
    FEtherealSpearMax: Integer;
    FDivineCalderaMax: INteger;
    FAttackDamageMax: Integer;
    procedure SetDistanceFighting(const Value: Integer);
    procedure SetWeaponDamage(const Value: Integer);
    procedure SetAttackDamage(const Value: Integer);
    procedure SetDivineCaldera(const Value: Integer);
    procedure SetDivineHealing(const Value: Integer);
    procedure SetDivineMissile(const Value: Integer);
    procedure SetEtherealSpear(const Value: Integer);
    procedure SetAttackDamageMax(const Value: Integer);
    procedure SetDivineHealingMax(const Value: Integer);
    procedure SetDivineMissileMax(const Value: Integer);
    procedure SetDivineCalderaMax(const Value: INteger);
    procedure SetEtherealSpearMax(const Value: Integer);
  protected
  public
    property DistanceFighting : Integer read FDistanceFighting write SetDistanceFighting;
    property WeaponDamage : Integer read FWeaponDamage write SetWeaponDamage;

    property EtherealSpear : Integer read FEtherealSpear write SetEtherealSpear;
    property DivineMissile : Integer read FDivineMissile write SetDivineMissile;
    property DivineCaldera : Integer read FDivineCaldera write SetDivineCaldera;
    property DivineHealing : Integer read FDivineHealing write SetDivineHealing;
    property AttackDamage : Integer read FAttackDamage write SetAttackDamage;
    property EtherealSpearMax : Integer read FEtherealSpearMax write SetEtherealSpearMax;
    property DivineMissileMax : Integer read FDivineMissileMax write SetDivineMissileMax;
    property DivineCalderaMax : INteger read FDivineCalderaMax write SetDivineCalderaMax;
    property DivineHealingMax : Integer read FDivineHealingMax write SetDivineHealingMax;
    property AttackDamageMax : Integer read FAttackDamageMax write SetAttackDamageMax;

    procedure Calculate;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TPaladin }

procedure TPaladin.Calculate;
var
  dFatorDano : Double;
begin
  case CombatMode of
    cmOffensive: dFatorDano := 1;
    cmBalanced:  dFatorDano := 0.75;
    cmDefensive: dFatorDano := 0.5;
  end;
  // Dano à distância

  //HP e MP
  HitPoints := Round(((Level - 8) * 10) + 185);
  ManaPoints := Round(((Level - 8) * 15) + 35);

  EtherealSpear := Round(((DistanceFighting + 25) / 3 ) + ( Level / 5 ));
  EtherealSpearMax := Round((DistanceFighting + 25) + ( Level / 5 ));
  DivineMissile := Round((Level*0.2)+(MagicLevel*1.79)+11);
  DivineMissileMax := Round((Level*0.2)+(MagicLevel*3)+18);
  DivineCaldera := Round(( Level / 5 ) + ( MagicLevel * 4 ));
  DivineCalderaMax := Round(( Level / 5 ) + ( MagicLevel * 6 ));
  DivineHealing := Round(( Level / 5 ) + ( MagicLevel * 18.5 ));
  DivineHealingMax := Round(( Level / 5 ) + ( MagicLevel * 25 ));
  AttackDamage := Round( Level / 5 );
  AttackDamageMax := Round( 0.09 * dFatorDano * DistanceFighting * WeaponDamage ) + AttackDamage;
  Capacity := Round((Level * 20)+310);
end;

constructor TPaladin.Create;
begin

end;

destructor TPaladin.Destroy;
begin

end;

procedure TPaladin.SetAttackDamage(const Value: Integer);
begin
  FAttackDamage := Value;
end;

procedure TPaladin.SetAttackDamageMax(const Value: Integer);
begin
  FAttackDamageMax := Value;
end;

procedure TPaladin.SetDistanceFighting(const Value: Integer);
begin
  FDistanceFighting := Value;
end;

procedure TPaladin.SetDivineCaldera(const Value: Integer);
begin
  FDivineCaldera := Value;
end;

procedure TPaladin.SetDivineHealing(const Value: Integer);
begin
  FDivineHealing := Value;
end;

procedure TPaladin.SetDivineHealingMax(const Value: Integer);
begin
  FDivineHealingMax := Value;
end;

procedure TPaladin.SetDivineMissile(const Value: Integer);
begin
  FDivineMissile := Value;
end;

procedure TPaladin.SetDivineMissileMax(const Value: Integer);
begin
  FDivineMissileMax := Value;
end;

procedure TPaladin.SetDivineCalderaMax(const Value: INteger);
begin
  FDivineCalderaMax := Value;
end;

procedure TPaladin.SetEtherealSpear(const Value: Integer);
begin
  FEtherealSpear := Value;
end;

procedure TPaladin.SetEtherealSpearMax(const Value: Integer);
begin
  FEtherealSpearMax := Value;
end;

procedure TPaladin.SetWeaponDamage(const Value: Integer);
begin
  FWeaponDamage := Value;
end;

end.
