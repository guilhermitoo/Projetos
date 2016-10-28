program RotationEarth;

uses
  System.StartUpCopy,
  FMX.Forms,
  uRotationEarth in 'uRotationEarth.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
