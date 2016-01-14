program GeraPlanilha;

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  Forms,
  ufrmGeraPlanilha in 'ufrmGeraPlanilha.pas' {frmGeraPlanilha};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmGeraPlanilha, frmGeraPlanilha);
  Application.Run;
end.
