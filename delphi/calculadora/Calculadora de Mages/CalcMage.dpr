program CalcMage;

uses
  Forms,
  UCalcMage in 'UCalcMage.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmCalcMage, frmCalcMage);
  Application.Run;
end.
