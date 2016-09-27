program HeaderFooterApplication;

uses
  System.StartUpCopy,
  FMX.Forms,
  HeaderFooterTemplate in 'HeaderFooterTemplate.pas' {frmSkillDamageCalc};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmSkillDamageCalc, frmSkillDamageCalc);
  Application.Run;
end.
