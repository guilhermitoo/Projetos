program Pong;

uses
  System.StartUpCopy,
  FMX.Forms,
  uPong in 'uPong.pas' {frmPong};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPong, frmPong);
  Application.Run;
end.
