program Finances;

uses
  System.StartUpCopy,
  FMX.Forms,
  ufrmDefault in 'ufrmDefault.pas' {frmDefault},
  ufrmMain in 'ufrmMain.pas' {frmMain},
  ufrmRegister in 'ufrmRegister.pas' {frmDefault1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
