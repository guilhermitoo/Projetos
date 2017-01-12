unit uPaladin;

interface

uses uCharacters;

type
  TPaladin = class(TCharacter)
  private
    FWeapongDamage: Integer;
    FDistanceFighting: Integer;
    FDivineMissile: Integer;
    FDivineHealing: Integer;
    FEtherealSpear: Integer;
    FDivineCaldera: Integer;
    FAttackDamage: Integer;
    procedure SetDistanceFighting(const Value: Integer);
    procedure SetWeapongDamage(const Value: Integer);
    procedure SetAttackDamage(const Value: Integer);
    procedure SetDivineCaldera(const Value: Integer);
    procedure SetDivineHealing(const Value: Integer);
    procedure SetDivineMissile(const Value: Integer);
    procedure SetEtherealSpear(const Value: Integer);
  protected
  public
    property DistanceFighting : Integer read FDistanceFighting write SetDistanceFighting;
    property WeapongDamage : Integer read FWeapongDamage write SetWeapongDamage;

    property EtherealSpear : Integer read FEtherealSpear write SetEtherealSpear;
    property DivineMissile : Integer read FDivineMissile write SetDivineMissile;
    property DivineCaldera : Integer read FDivineCaldera write SetDivineCaldera;
    property DivineHealing : Integer read FDivineHealing write SetDivineHealing;
    property AttackDamage : Integer read FAttackDamage write SetAttackDamage;
  end;

implementation

{ TPaladin }

procedure TPaladin.SetAttackDamage(const Value: Integer);
begin
  FAttackDamage := Value;
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

procedure TPaladin.SetDivineMissile(const Value: Integer);
begin
  FDivineMissile := Value;
end;

procedure TPaladin.SetEtherealSpear(const Value: Integer);
begin
  FEtherealSpear := Value;
end;

procedure TPaladin.SetWeapongDamage(const Value: Integer);
begin
  FWeapongDamage := Value;
end;

end.
