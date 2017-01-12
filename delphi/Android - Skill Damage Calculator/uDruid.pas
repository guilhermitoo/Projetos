unit uDruid;

interface

uses uMage;

type
  TDruid = class(TMage)
  private
    FIceWave: Integer;
    FStrongIceWave: Integer;
    FTerraWave: Integer;
    procedure SetIceWave(const Value: Integer);
    procedure SetStrongIceWave(const Value: Integer);
    procedure SetTerraWave(const Value: Integer);
  protected
  public
    property IceWave : Integer read FIceWave write SetIceWave;
    property TerraWave : Integer read FTerraWave write SetTerraWave;
    property StrongIceWave : Integer read FStrongIceWave write SetStrongIceWave;
  end;

implementation

{ TDruid }

procedure TDruid.SetIceWave(const Value: Integer);
begin
  FIceWave := Value;
end;

procedure TDruid.SetStrongIceWave(const Value: Integer);
begin
  FStrongIceWave := Value;
end;

procedure TDruid.SetTerraWave(const Value: Integer);
begin
  FTerraWave := Value;
end;

end.
