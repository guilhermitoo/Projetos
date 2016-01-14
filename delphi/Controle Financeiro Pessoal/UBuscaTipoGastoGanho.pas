unit UBuscaTipoGastoGanho;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, ADODB;

type
  TfrmBuscaTipoGastoGanho = class(TForm)
    dbgrdTipoGG: TDBGrid;
    edtParametro: TEdit;
    btnPesquisar: TBitBtn;
    lbl1: TLabel;
    btnExcluirLembrete: TBitBtn;
    txt1: TStaticText;
    btnCancelar: TBitBtn;
    dsExcluirTipoGG: TDataSource;
    qryExcluirTipoGG: TADOQuery;
    dsTipoGG: TDataSource;
    qryTipoGG: TADOQuery;
    conexao: TADOConnection;
    UsuTipoGGCOD_TIPO_GASTO: TAutoIncField;
    UsuTipoGGDESCRICAO: TWideStringField;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure Pesquisar();
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBuscaTipoGastoGanho: TfrmBuscaTipoGastoGanho;

implementation

{$R *.dfm}

procedure TfrmBuscaTipoGastoGanho.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmBuscaTipoGastoGanho.btnPesquisarClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TfrmBuscaTipoGastoGanho.Pesquisar;
var
  cmd: string;
begin

  cmd := ' where DESCRICAO LIKE "%' + edtParametro.Text + '%" ';

  qryTipoGG.SQL[1] := cmd;
  qryTipoGG.Open;
  qryTipoGG.Requery();

end;

end.
