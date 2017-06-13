program FoodMaker;

uses
  Vcl.Forms,
  ufrmPrincipal in 'ufrmPrincipal.pas' {frmPrincipal},
  uDM in 'uDM.pas' {DM: TDataModule},
  ufrmCRUD_Pai in 'ufrmCRUD_Pai.pas' {frmCadastroPai},
  uHelper in 'uHelper.pas',
  uDB_Controller in 'uDB_Controller.pas',
  ufrmPadrao in 'ufrmPadrao.pas' {frmPadrao},
  ufrmProcura_Pai in 'ufrmProcura_Pai.pas' {frmProcura_Pai};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
