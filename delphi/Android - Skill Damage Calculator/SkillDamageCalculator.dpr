program SkillDamageCalculator;

uses
  System.StartUpCopy,
  FMX.Forms,
  uSkillDamageCalc in 'uSkillDamageCalc.pas' {frmSkillDamageCalc},
  uMage in 'uMage.pas',
  uCharacters in 'uCharacters.pas',
  uDruid in 'uDruid.pas',
  uPaladin in 'uPaladin.pas',
  uKnight in 'uKnight.pas',
  ufrmResults in 'ufrmResults.pas' {frmResults};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmSkillDamageCalc, frmSkillDamageCalc);
  Application.Run;
end.
