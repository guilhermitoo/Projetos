program DanoFisico;

uses
  Forms,
  uDanoFisico in 'uDanoFisico.pas' {frmDanoFisico};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmDanoFisico, frmDanoFisico);
  Application.Run;
end.
