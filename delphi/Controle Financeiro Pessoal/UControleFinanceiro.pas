unit UControleFinanceiro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, StdCtrls, DB, Grids, DBGrids, ADODB, Provider,
  DBClient, DBCtrls, Buttons, ComCtrls;

type
  TfrmPrincipal = class(TForm)
    pnlMenu: TPanel;
    mmMenu: TMainMenu;
    Movimentao1: TMenuItem;
    CadastrarEntrada1: TMenuItem;
    ipodeGasto1: TMenuItem;
    Lembrete1: TMenuItem;
    Sair1: TMenuItem;
    btnCadLembrete: TButton;
    conexao: TADOConnection;
    qryLembrete: TADOQuery;
    dtstprvdr1: TDataSetProvider;
    dsLembretes: TDataSource;
    dtmfldLembreteData: TDateTimeField;
    UsuLembreteDescricao: TWideStringField;
    lblSaldodesc: TLabel;
    qrySaldo: TADOQuery;
    dsSaldo: TDataSource;
    lblSaldoAtual: TLabel;
    fltfldSaldoExpr1000: TFloatField;
    tmrAtualiza: TTimer;
    btnCadMovimentacao: TBitBtn;
    pgcLembretes: TPageControl;
    ts1: TTabSheet;
    dbgrdLembrete: TDBGrid;
    ts2: TTabSheet;
    ts3: TTabSheet;
    dbgrdReceber: TDBGrid;
    dbgrdPagar: TDBGrid;
    qryReceber: TADOQuery;
    dsReceber: TDataSource;
    dtmfldReceberData: TDateTimeField;
    UsuReceberDescricao: TWideStringField;
    fltfldReceberValor: TFloatField;
    qryPagar: TADOQuery;
    dtmfld1: TDateTimeField;
    Usu1: TWideStringField;
    fltfld2: TFloatField;
    dsPagar: TDataSource;
    UsuLembreteCOD_LEMBRETE: TAutoIncField;
    UsuPagarCOD_LEMBRETE: TAutoIncField;
    UsuReceberCOD_LEMBRETE: TAutoIncField;
    btnExcluirPagar: TBitBtn;
    dsExcluir: TDataSource;
    qryExcluir: TADOQuery;
    Usu2: TAutoIncField;
    dtmfld2: TDateTimeField;
    Usu3: TWideStringField;
    fltfld3: TFloatField;
    btnExcluirReceber: TBitBtn;
    btnExcluirLembrete: TBitBtn;
    Listar1: TMenuItem;
    Movimentaes1: TMenuItem;
    iposdeGastoGanho1: TMenuItem;
    procedure btnCadMovimentacaoClick(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure btnCadLembreteClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CadastrarEntrada1Click(Sender: TObject);
    procedure AtualizaSaldo();
    procedure AtualizaLembrete();
    procedure FormShow(Sender: TObject);
    procedure tmrAtualizaTimer(Sender: TObject);
    procedure Lembrete1Click(Sender: TObject);
    procedure ipodeGasto1Click(Sender: TObject);
    procedure btnCadTipoGastoClick(Sender: TObject);
    procedure AtualizaPagarReceber();
    procedure DefinirExclusaoLembrete(grd: TDBGrid);
    procedure ExcluirLembrete(var cod: Integer);
    procedure btnExcluirPagarClick(Sender: TObject);
    procedure btnExcluirReceberClick(Sender: TObject);
    procedure btnExcluirLembreteClick(Sender: TObject);
    procedure btnSaldosClick(Sender: TObject);
    procedure Movimentaes1Click(Sender: TObject);
    procedure iposdeGastoGanho1Click(Sender: TObject);
    procedure AdicionaLembreteMov(var grd: TDBGrid);
    procedure dbgrdPagarDblClick(Sender: TObject);
    procedure dbgrdReceberDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;
  cod: Integer;

implementation

uses UCadMovimentacao, UCadLembrete, UCadTipoGasto, USaldos,
  UBuscaMovimentacao, UBuscaTipoGastoGanho;

{$R *.dfm}

procedure TfrmPrincipal.btnCadMovimentacaoClick(Sender: TObject);
begin
  if ( frmCadMovimentacao = Nil ) then
    frmCadMovimentacao := TfrmCadMovimentacao.Create(Application);

  frmCadMovimentacao.Show;

end;

procedure TfrmPrincipal.Sair1Click(Sender: TObject);
begin
  Close();
end;

procedure TfrmPrincipal.btnCadLembreteClick(Sender: TObject);
begin
  if ( frmCadLembrete = Nil ) then
      frmCadLembrete := TfrmCadLembrete.Create(Application);

  frmCadLembrete.Show;
end;

procedure TfrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_F5 then
  begin
       AtualizaLembrete;
       AtualizaSaldo;
       AtualizaPagarReceber;
  end;
end;

procedure TfrmPrincipal.CadastrarEntrada1Click(Sender: TObject);
begin
  if ( frmCadMovimentacao = Nil ) then
      frmCadMovimentacao := TfrmCadMovimentacao.Create(Application);

  frmCadMovimentacao.Show;
end;

procedure TfrmPrincipal.AtualizaSaldo;
begin
  qrySaldo.Open;
  qrySaldo.Requery();

  lblSaldoAtual.Caption := FormatFloat('0.00',qrySaldo.FieldValues['Expr1000']);

  if (qrySaldo.FieldValues['Expr1000']) < 0 then
        lblSaldoAtual.Font.Color := clRed
  else
        lblSaldoAtual.Font.Color := clBlue;

end;

procedure TfrmPrincipal.AtualizaLembrete;
begin
  qryLembrete.Open;
  qryLembrete.Requery();
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  AtualizaLembrete;
  AtualizaSaldo;
  AtualizaPagarReceber;
end;

procedure TfrmPrincipal.tmrAtualizaTimer(Sender: TObject);
begin
  AtualizaSaldo;
  AtualizaLembrete;
  AtualizaPagarReceber
end;

procedure TfrmPrincipal.Lembrete1Click(Sender: TObject);
begin
  if ( frmCadLembrete = Nil ) then
      frmCadLembrete := TfrmCadLembrete.Create(Application);

  frmCadLembrete.Show;

end;

procedure TfrmPrincipal.ipodeGasto1Click(Sender: TObject);
begin
  if ( frmCadTipoGasto = Nil ) then
      frmCadTipoGasto := TfrmCadTipoGasto.Create(Application);

  frmCadTipoGasto.show;

end;

procedure TfrmPrincipal.btnCadTipoGastoClick(Sender: TObject);
begin
  if ( frmCadTipoGasto = Nil ) then
      frmCadTipoGasto := TfrmCadTipoGasto.Create(Application);

  frmCadTipoGasto.Show;

end;

procedure TfrmPrincipal.AtualizaPagarReceber;
begin
  qryPagar.Open;
  qryReceber.Open;
  qryPagar.Requery();
  qryReceber.Requery();
end;

procedure TfrmPrincipal.DefinirExclusaoLembrete(grd: TDBGrid);
var
    cmd: string;
begin
  //tratamento da exclusão, validação
  if not(grd.DataSource.DataSet.FieldByName('COD_LEMBRETE').IsNull)  then
  begin
    cod := grd.Columns.Items[grd.SelectedIndex].Field.Value;

    ExcluirLembrete(cod);

  end
  else
  begin
    ShowMessage('Sem registro para ser excluído.');
  end;


end;

procedure TfrmPrincipal.btnExcluirPagarClick(Sender: TObject);
begin

  DefinirExclusaoLembrete(dbgrdPagar);

end;

procedure TfrmPrincipal.btnExcluirReceberClick(Sender: TObject);
begin
  DefinirExclusaoLembrete(dbgrdReceber);
end;

procedure TfrmPrincipal.btnExcluirLembreteClick(Sender: TObject);
begin
  DefinirExclusaoLembrete(dbgrdLembrete);
end;

procedure TfrmPrincipal.btnSaldosClick(Sender: TObject);
begin
//    if ( frmSaldos = nil ) then
//        frmSaldos := TfrmSaldos.Create(Application);
//
//    frmSaldos.Show;
end;

procedure TfrmPrincipal.Movimentaes1Click(Sender: TObject);
begin
  if ( frmBuscaCadMovimentacao = Nil ) then
    frmBuscaCadMovimentacao := TfrmBuscaCadMovimentacao.Create(Application);

  frmBuscaCadMovimentacao.Show;
end;

procedure TfrmPrincipal.iposdeGastoGanho1Click(Sender: TObject);
begin
  if ( frmBuscaTipoGastoGanho = Nil ) then
    frmBuscaTipoGastoGanho := TfrmBuscaTipoGastoGanho.Create(Application);

  frmBuscaTipoGastoGanho.Show;
end;

procedure TfrmPrincipal.AdicionaLembreteMov(var grd: TDBGrid);
begin

  if ( frmCadMovimentacao = Nil ) then
    frmCadMovimentacao := TfrmCadMovimentacao.Create(Application);

  frmCadMovimentacao.dtpData.DateTime := grd.Columns[1].Field.Value;
  frmCadMovimentacao.edtDescricao.Text := grd.Columns[2].Field.Value;

  if grd.Columns[3].Field.Value < 0 then
    frmCadMovimentacao.dblkcbbTipoMov.KeyValue := 2
  else
    frmCadMovimentacao.dblkcbbTipoMov.KeyValue := 1;

  frmCadMovimentacao.edtValor.Text := grd.Columns[3].Field.Value;
  frmCadMovimentacao.edtCod.Text := grd.Columns[0].Field.Value;

  frmCadMovimentacao.Show;

end;

procedure TfrmPrincipal.dbgrdPagarDblClick(Sender: TObject);
begin
  AdicionaLembreteMov(dbgrdPagar);
end;

procedure TfrmPrincipal.dbgrdReceberDblClick(Sender: TObject);
begin
  AdicionaLembreteMov(dbgrdReceber);
end;

procedure TfrmPrincipal.ExcluirLembrete(var cod: Integer);
begin
  if MessageDlg('Deseja mesmo excluir esse lembrete?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    cmd := 'delete * from TbLembrete where COD_LEMBRETE = ' + IntToStr(cod) + ';';

    qryExcluir.SQL.Text := cmd;

    qryExcluir.ExecSQL;

    AtualizaPagarReceber;
    AtualizaLembrete;
  end;
end;

end.



