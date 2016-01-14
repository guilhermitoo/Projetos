program ImportaFornecedorExcel;

uses
  Forms,
  ufrmAguarde in '..\..\..\..\..\Programas\rei\PROGS\Delphi\Codigo Compartilhado\ufrmAguarde.pas' {frmAguarde},
  ufrmLembreteFaturamento in '..\..\..\..\..\Programas\rei\PROGS\Delphi\Codigo Compartilhado\ufrmLembreteFaturamento.pas' {frmLembreteFaturamento},
  ufrmSalvarRelatorioComo in '..\..\..\..\..\Programas\rei\PROGS\Delphi\Codigo Compartilhado\ufrmSalvarRelatorioComo.pas' {frmSalvarRelatorioComo},
  WSUtils in '..\..\..\..\..\Programas\rei\PROGS\Delphi\Codigo Compartilhado\WSUtils.pas',
  ufrmComunicaSefaz in '..\..\..\..\..\Programas\rei\PROGS\Delphi\Codigo Compartilhado\ufrmComunicaSefaz.pas' {frmComunicaSefaz},
  ufrmAlertaClienteNegativado in '..\..\..\..\..\Programas\rei\PROGS\Delphi\Codigo Compartilhado\ufrmAlertaClienteNegativado.pas' {frmAlertaClienteNegativado},
  uImportaDadosExcel in 'uImportaDadosExcel.pas' {frmImportaDadosExcel};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmImportaDadosExcel, frmImportaDadosExcel);
  Application.Run;
end.
