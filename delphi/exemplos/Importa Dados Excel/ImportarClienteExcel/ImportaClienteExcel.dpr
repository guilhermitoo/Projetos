program ImportaClienteExcel;

uses
  Forms,
  uImportaClienteExcel in 'uImportaClienteExcel.pas' {frmImportaClienteExcel};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmImportaClienteExcel, frmImportaClienteExcel);
  Application.Run;
end.
