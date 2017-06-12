program FoodMaker;

uses
  Vcl.Forms,
  ufrmPrincipal in 'ufrmPrincipal.pas' {frmPrincipal},
  uDM in 'uDM.pas' {DM: TDataModule},
  ufrmCRUD_Pai in 'ufrmCRUD_Pai.pas' {frmCadastroPai};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
