program SkillDamageCalculator;

uses
  System.StartUpCopy,
  FMX.Forms,
  uSkillDamageCalc in 'uSkillDamageCalc.pas' {frmSkillDamageCalc};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmSkillDamageCalc, frmSkillDamageCalc);
  Application.Run;
end.
