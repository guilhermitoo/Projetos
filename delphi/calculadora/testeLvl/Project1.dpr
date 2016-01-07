program Project1;

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  Forms,
  uNextLevelExp in 'uNextLevelExp.pas' {frmNextLevelExp};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmNextLevelExp, frmNextLevelExp);
  Application.Run;
end.
