program Menu;

uses
  Forms,
  uMenu in 'uMenu.pas' {frmMenu},
  UCalcMage in '..\Calculadora de Mages\UCalcMage.pas' {frmCalcMage},
  uDanoFisico in '..\Calculadora Dano F�sico\uDanoFisico.pas' {frmDanoFisico},
  uNextLevelExp in '..\Calculadora Experiencia\uNextLevelExp.pas' {frmNextLevelExp};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.CreateForm(TfrmCalcMage, frmCalcMage);
  Application.CreateForm(TfrmDanoFisico, frmDanoFisico);
  Application.Run;
end.
