unit uMage;

interface

uses uCharacters;

type
  TMage = class(TCharacter)
  private
    FBasicStrike: Integer;
    FLightHealing: Integer;
    FIntenseHealing: Integer;
    FUltimateHealing: Integer;
    FUltimateStrike: Integer;
    FStrongStrike: Integer;
    procedure SetBasicStrike(const Value: Integer);
    procedure SetIntenseHealing(const Value: Integer);
    procedure SetLightHealing(const Value: Integer);
    procedure SetStrongStrike(const Value: Integer);
    procedure SetUltimateHealing(const Value: Integer);
    procedure SetUltimateStrike(const Value: Integer);
  protected
  public
    property BasicStrike : Integer read FBasicStrike write SetBasicStrike;
    property StrongStrike : Integer read FStrongStrike write SetStrongStrike;
    property UltimateStrike : Integer read FUltimateStrike write SetUltimateStrike;
    property LightHealing : Integer read FLightHealing write SetLightHealing;
    property IntenseHealing : Integer read FIntenseHealing write SetIntenseHealing;
    property UltimateHealing : Integer read FUltimateHealing write SetUltimateHealing;

    procedure Calculate;
    constructor Create;
  End;

implementation

{ TMage }

procedure TMage.Calculate;
begin
  // realiza os cálculos de mage
end;

constructor TMage.Create;
begin
  inherited;
  iHpLevel := 5;
  iMpLevel := 30;
end;

procedure TMage.SetBasicStrike(const Value: Integer);
begin
  FBasicStrike := Value;
end;

procedure TMage.SetIntenseHealing(const Value: Integer);
begin
  FIntenseHealing := Value;
end;

procedure TMage.SetLightHealing(const Value: Integer);
begin
  FLightHealing := Value;
end;

procedure TMage.SetStrongStrike(const Value: Integer);
begin
  FStrongStrike := Value;
end;

procedure TMage.SetUltimateHealing(const Value: Integer);
begin
  FUltimateHealing := Value;
end;

procedure TMage.SetUltimateStrike(const Value: Integer);
begin
  FUltimateStrike := Value;
end;

end.
