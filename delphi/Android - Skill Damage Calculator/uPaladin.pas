unit uPaladin;

interface

uses uCharacters;

type
  TPaladin = class(TCharacter)
  private
    FWeaponDamage: Integer;
    FDistanceFighting: Integer;
    FDivineMissile: TSkill;
    FDivineHealing: TSkill;
    FEtherealSpear: TSkill;
    FDivineCaldera: TSkill;
    FAttackDamage: TSkill;
    FSalvation: TSkill;
    procedure SetDistanceFighting(const Value: Integer);
    procedure SetWeaponDamage(const Value: Integer);
    procedure SetAttackDamage(const Value: TSkill);
    procedure SetDivineCaldera(const Value: TSkill);
    procedure SetDivineHealing(const Value: TSkill);
    procedure SetDivineMissile(const Value: TSkill);
    procedure SetEtherealSpear(const Value: TSkill);
    procedure SetSalvation(const Value: TSkill);
  protected
  public
    property DistanceFighting : Integer read FDistanceFighting write SetDistanceFighting;
    property WeaponDamage : Integer read FWeaponDamage write SetWeaponDamage;

    property EtherealSpear : TSkill read FEtherealSpear write SetEtherealSpear;
    property DivineMissile : TSkill read FDivineMissile write SetDivineMissile;
    property DivineCaldera : TSkill read FDivineCaldera write SetDivineCaldera;
    property DivineHealing : TSkill read FDivineHealing write SetDivineHealing;
    property AttackDamage: TSkill read FAttackDamage write SetAttackDamage;
    property Salvation: TSkill read FSalvation write SetSalvation;

    procedure Calculate;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TPaladin }

procedure TPaladin.Calculate;
var
  dFatorDano : Double;
  sk : TSkill;
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
  Capacity := Round((Level * 20)+310);

  with sk do
  begin
    Name := 'Ethereal Spear';
    Skill := 'exori con';
    Min := Round(((DistanceFighting + 25) / 3 ) + ( Level / 5 ));
    Max := Round((DistanceFighting + 25) + ( Level / 5 ));
    EtherealSpear := sk;

    Name := 'Divine Missile';
    Skill := 'exori san';
    Min := Round((Level*0.2)+(MagicLevel*1.79)+11);
    Max := Round((Level*0.2)+(MagicLevel*3)+18);
    DivineMissile := sk;

    Name := 'Divine Caldera';
    Skill := 'exevo mas san';
    Min := Round(( Level / 5 ) + ( MagicLevel * 4 ));
    Max := Round(( Level / 5 ) + ( MagicLevel * 6 ));
    DivineCaldera := sk;

    Name := 'Divine Healing';
    Skill := 'exura san';
    Min := Round(( Level / 5 ) + ( MagicLevel * 18.5 ));
    Max := Round(( Level / 5 ) + ( MagicLevel * 25 ));
    DivineHealing := sk;

    Name := 'Attack Damage';
    Skill := '';
    Min := Round( Level / 5 );
    Max := Round( 0.09 * dFatorDano * DistanceFighting * WeaponDamage ) + AttackDamage.Min;
    AttackDamage := sk;

    Name := 'Salvation';
    Skill := 'exura gran san';
    Min := Round( Level * 0.2 ) + ( MagicLevel*19 );
    Max := Round( Level * 0.2 ) + ( MagicLevel*19 ) + 100;
    Salvation := sk;
  end;
end;

constructor TPaladin.Create;
begin
end;

destructor TPaladin.Destroy;
begin
  inherited;
end;

procedure TPaladin.SetAttackDamage(const Value: TSkill);
begin
  FAttackDamage := Value;
end;

procedure TPaladin.SetDistanceFighting(const Value: Integer);
begin
  FDistanceFighting := Value;
end;

procedure TPaladin.SetDivineCaldera(const Value: TSkill);
begin
  FDivineCaldera := Value;
end;

procedure TPaladin.SetDivineHealing(const Value: TSkill);
begin
  FDivineHealing := Value;
end;

procedure TPaladin.SetDivineMissile(const Value: TSkill);
begin
  FDivineMissile := Value;
end;

procedure TPaladin.SetEtherealSpear(const Value: TSkill);
begin
  FEtherealSpear := Value;
end;

procedure TPaladin.SetSalvation(const Value: TSkill);
begin
  FSalvation := Value;
end;

procedure TPaladin.SetWeaponDamage(const Value: Integer);
begin
  FWeaponDamage := Value;
end;

end.
