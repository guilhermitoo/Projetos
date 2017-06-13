unit ufrmCRUD_Pai;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, System.Actions,
  Vcl.ActnList, Vcl.ToolWin, System.ImageList, Vcl.ImgList, Vcl.ExtCtrls,
  Data.DB, Datasnap.DBClient, uHelper, ufrmPadrao;

type
  TfrmCadastroPai = class(TfrmPadrao)
    sbCRUD: TStatusBar;
    pnlTop: TPanel;
    pnlCenter: TPanel;
    actlstCRUD: TActionList;
    ilCRUD: TImageList;
    tlbCRUD: TToolBar;
    actInserir: TAction;
    actProcurar: TAction;
    actImprimir: TAction;
    actSalvar: TAction;
    actCancelar: TAction;
    actExcluir: TAction;
    btnInserir: TToolButton;
    btnEditar: TToolButton;
    btnSeparador1: TToolButton;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    btnSeparador2: TToolButton;
    btnExcluir: TToolButton;
    btnImprimir: TToolButton;
    ds: TDataSource;
    procedure dsStateChange(Sender: TObject);
    procedure actInserirExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroPai: TfrmCadastroPai;

implementation

{$R *.dfm}

procedure TfrmCadastroPai.actExcluirExecute(Sender: TObject);
begin
  ds.DataSet.Delete;
end;

procedure TfrmCadastroPai.actInserirExecute(Sender: TObject);
begin
  if not ds.DataSet.Active then
    ds.DataSet.Open;
  ds.DataSet.Insert;
end;

procedure TfrmCadastroPai.actSalvarExecute(Sender: TObject);
var
  iErros : Integer;
begin
  ds.DataSet.Post;

  iErros := TClientDataSet(ds.DataSet).ApplyUpdates(0);
  if iErros > 0 then
    raise Exception.Create('Erro ao salvar o registro!');
end;

procedure TfrmCadastroPai.dsStateChange(Sender: TObject);
begin
  actInserir.Enabled := ds.DataSet.State in [dsBrowse,dsInactive];
  actProcurar.Enabled := ds.DataSet.State in [dsBrowse,dsInactive];
  actSalvar.Enabled := ds.DataSet.State in [dsInsert,dsEdit];
  actCancelar.Enabled := ds.DataSet.State in [dsInsert,dsEdit];
  actImprimir.Enabled := ds.DataSet.State in [dsBrowse];
  actExcluir.Enabled := ds.DataSet.State in [dsBrowse];
end;

end.
