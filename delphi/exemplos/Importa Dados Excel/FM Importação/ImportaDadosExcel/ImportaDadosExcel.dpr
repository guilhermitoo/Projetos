program ImportaFornecedorExcel;

uses
  Forms,
  uImportaDadosExcel in 'uImportaDadosExcel.pas' {frmImportaDadosExcel},
  WSUtils in '..\..\..\..\..\..\..\..\..\..\Programas\ws-varejo\PROGS\Delphi\Codigo Compartilhado\WSUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmImportaDadosExcel, frmImportaDadosExcel);
  Application.Run;
end.
