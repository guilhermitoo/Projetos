unit UBuscaMovimentacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Buttons, Grids, DBGrids, DB, ADODB, ComCtrls;

type
  TfrmBuscaCadMovimentacao = class(TForm)
    dbgrdMovimentacao: TDBGrid;
    lbl1: TLabel;
    edtParametro: TEdit;
    lbl2: TLabel;
    txt1: TStaticText;
    conexao: TADOConnection;
    qryMovimentacao: TADOQuery;
    dsMovimentacao: TDataSource;
    UsuMovimentacaoMDESCRICAO: TWideStringField;
    UsuMovimentacaoTMDESCRICAO: TWideStringField;
    UsuMovimentacaoMPDESCRICAO: TWideStringField;
    UsuMovimentacaoTGDESCRICAO: TWideStringField;
    fltfldMovimentacaoVALOR: TFloatField;
    dtmfldMovimentacaoDATA: TDateTimeField;
    UsuMovimentacaoCOD_MOV: TAutoIncField;
    cbbFiltro: TComboBox;
    btnCancelar: TBitBtn;
    btnPesquisar: TBitBtn;
    btnExcluir: TBitBtn;
    dsExcluirMov: TDataSource;
    qryExcluirMov: TADOQuery;
    lbl4: TLabel;
    lblTotal: TLabel;
    lbl3: TLabel;
    dtpData1: TDateTimePicker;
    dtpData2: TDateTimePicker;
    lbl5: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure ExcluirMovimentacao(var cod: Integer);
    procedure cbbFiltroChange(Sender: TObject);
    procedure Pesquisar();
    procedure edtParametroKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBuscaCadMovimentacao: TfrmBuscaCadMovimentacao;
  cmd,filtro,parametro: string;
  cod: integer;

implementation

{$R *.dfm}

procedure TfrmBuscaCadMovimentacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //dsMovimentacao.DataSet.Close;
  frmBuscaCadMovimentacao := nil;
  Action := caFree;
end;

procedure TfrmBuscaCadMovimentacao.btnPesquisarClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TfrmBuscaCadMovimentacao.FormCreate(Sender: TObject);
begin
    cbbFiltro.ItemIndex := 0;
    filtro := 'M.COD_MOV';
    Pesquisar;
    dtpData1.DateTime := Now;
    dtpData2.DateTime := Now;
end;


procedure TfrmBuscaCadMovimentacao.btnCancelarClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmBuscaCadMovimentacao.btnExcluirClick(Sender: TObject);
begin
  if dbgrdMovimentacao.DataSource.DataSet.FieldValues['COD_MOV'] > 0 then
  begin
    if not(dbgrdMovimentacao.DataSource.DataSet.FieldByName('COD_MOV').IsNull)  then
    begin
      cod := dbgrdMovimentacao.Columns.Items[dbgrdMovimentacao.SelectedIndex].Field.Value;

      if MessageDlg('Deseja mesmo excluir esse registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
          ExcluirMovimentacao(cod);
      end;
    end
    else
    begin
        ShowMessage('Sem registro para ser excluído.');
    end;
  end
  else
  begin
      ShowMessage('Selecione uma linha para excluir.')    
  end;
end;

procedure TfrmBuscaCadMovimentacao.ExcluirMovimentacao(var cod: Integer);
begin

  cmd := 'delete * from TbMovimentacao where COD_MOV = ' + IntToStr(cod) + ';';

  qryExcluirMov.SQL.Text := cmd;

  qryExcluirMov.ExecSQL;

  btnPesquisarClick(Self);

end;

procedure TfrmBuscaCadMovimentacao.cbbFiltroChange(Sender: TObject);
begin
    edtParametro.SetFocus;
end;

procedure TfrmBuscaCadMovimentacao.Pesquisar;
var
  soma: Double;
begin

  parametro := edtParametro.Text;

  if cbbFiltro.ItemIndex = 0 then
  begin
      filtro := 'M.COD_MOV';
  end
  else if cbbFiltro.ItemIndex = 1 then
  begin
      filtro := 'M.DESCRICAO';
      parametro := QuotedStr('%'+parametro+'%');
  end
  else if cbbFiltro.ItemIndex = 2 then
  begin
      filtro := 'TM.DESCRICAO';
      parametro := QuotedStr('%'+parametro+'%');
  end
  else if cbbFiltro.ItemIndex = 3 then
  begin
      filtro := 'MP.DESCRICAO';
      parametro := QuotedStr('%'+parametro+'%');
  end
  else if cbbFiltro.ItemIndex = 4 then
  begin
      filtro := 'TG.DESCRICAO';
      parametro := QuotedStr('%'+parametro+'%');
  end
  else
  begin
    filtro := 'M.VALOR';
  end;

  cmd := 'select M.COD_MOV, M.DESCRICAO, TM.DESCRICAO, MP.DESCRICAO, TG.DESCRICAO, M.VALOR, M.DATA ' +
          'from TbMovimentacao M, TbTipoGasto TG, TbTipoMov TM, TbMeioPagamento MP ' +
          'where M.TIPO_GASTO = TG.COD_TIPO_GASTO ' +
          'and M.TIPO_MOV = TM.COD_TIPO_MOV ' +
          'and M.MEIO_PAG = MP.COD_MEIO ';

  if edtParametro.Text <> '' then
      cmd := cmd + ' and ' + filtro + ' LIKE ' + parametro + ' ';


  if dtpData1.DateTime <> null and dtpData2.DateTime <> null then
  begin
    cmd := cmd + ' and (M.DATA BETWEEN :dtini and :dtfin) ';
  end;

  cmd := cmd + ' order by M.DATA';

  qryMovimentacao.SQL.Clear;
  qryMovimentacao.SQL.Add(cmd);
  qryMovimentacao.Parameters.ParamByName('dtini').Value := dtpData1.DateTime;
  qryMovimentacao.Parameters.ParamByName('dtfin').Value := dtpData2.DateTime;
  qryMovimentacao.Open;
  qryMovimentacao.Requery();

  soma := 0;

  qryMovimentacao.First;
  while not( qryMovimentacao.Eof ) do
  begin
    soma := soma + qryMovimentacao.FieldByName('VALOR').AsFloat;

    qryMovimentacao.Next;

  end;

  lblTotal.Caption := FormatFloat('##.##',soma);

end;

procedure TfrmBuscaCadMovimentacao.edtParametroKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then begin
    Pesquisar;
  end;
end;

end.
