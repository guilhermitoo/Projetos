program ControleFinanceiro;

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  Forms,
  UControleFinanceiro in 'UControleFinanceiro.pas' {frmPrincipal},
  UCadMovimentacao in 'UCadMovimentacao.pas' {frmCadMovimentacao},
  UCadLembrete in 'UCadLembrete.pas' {frmCadLembrete},
  UCadTipoGasto in 'UCadTipoGasto.pas' {frmCadTipoGasto},
  UBuscaMovimentacao in 'UBuscaMovimentacao.pas' {frmBuscaCadMovimentacao},
  UBuscaTipoGastoGanho in 'UBuscaTipoGastoGanho.pas' {frmBuscaTipoGastoGanho};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
