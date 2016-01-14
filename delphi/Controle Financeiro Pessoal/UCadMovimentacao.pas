unit UCadMovimentacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, DBClient, Provider, StdCtrls, DBCtrls, Mask, ComCtrls,
  Buttons, ExtCtrls;

type
  TfrmCadMovimentacao = class(TForm)
    edtDescricao: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    dblkcbbTipoMov: TDBLookupComboBox;
    dsTblTipoMov: TADODataSet;
    dsTipoMov: TDataSource;
    lbl3: TLabel;
    dblkcbbMeioPag: TDBLookupComboBox;
    dsTblMeioPag: TADODataSet;
    dsMeioPag: TDataSource;
    lblGasto: TLabel;
    dblkcbbTipoGast: TDBLookupComboBox;
    dsTblTipoGast: TADODataSet;
    dsTipoGast: TDataSource;
    UsuTblTipoGastCOD_TIPO_GASTO: TAutoIncField;
    UsuTblTipoGastDESCRICAO: TWideStringField;
    UsuTblTipoMovCOD_TIPO_MOV: TAutoIncField;
    UsuTblTipoMovDESCRICAO: TWideStringField;
    lblData: TLabel;
    dtpData: TDateTimePicker;
    Label1: TLabel;
    StaticText1: TStaticText;
    pnlBotoes: TPanel;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    btnProcurar: TBitBtn;
    dsMovimentacao: TDataSource;
    edtValor: TEdit;
    tblMovimentacao: TADOTable;
    UsuMovimentacaoCOD_MOV: TAutoIncField;
    UsuMovimentacaoDESCRICAO: TWideStringField;
    UsuMovimentacaoTIPO_MOV: TIntegerField;
    UsuMovimentacaoMEIO_PAG: TIntegerField;
    UsuMovimentacaoTIPO_GASTO: TIntegerField;
    dtmfldMovimentacaoDATA: TDateTimeField;
    fltfldMovimentacaoVALOR: TFloatField;
    edtCod: TEdit;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure edtValorKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorExit(Sender: TObject);
    procedure dblkcbbTipoMovExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnProcurarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadMovimentacao: TfrmCadMovimentacao;
  cod: integer;

implementation

uses UControleFinanceiro, UBuscaMovimentacao;

{$R *.dfm}


procedure TfrmCadMovimentacao.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadMovimentacao.btnConfirmarClick(Sender: TObject);
var
  cmd: String;
begin
  cmd := '';

  if edtDescricao.Text <> '' then
  begin
    if dblkcbbTipoMov.KeyValue > 0 then
    begin
      if dblkcbbMeioPag.KeyValue > 0 then
      begin
        if dblkcbbTipoGast.KeyValue > 0 then
        begin
          if edtValor.Text <> '' then
          begin
            Try

              tblMovimentacao.Insert;
              tblMovimentacao.FieldByName('DESCRICAO').AsString := edtDescricao.Text;
              tblMovimentacao.FieldByName('TIPO_MOV').AsInteger := dblkcbbTipoMov.KeyValue;
              tblMovimentacao.FieldByName('TIPO_GASTO').AsInteger := dblkcbbTipoGast.KeyValue;
              tblMovimentacao.FieldByName('MEIO_PAG').AsInteger := dblkcbbMeioPag.KeyValue;
              tblMovimentacao.FieldByName('VALOR').AsFloat := StrToFloat(edtValor.Text);
              if (dblkcbbTipoMov.Text = 'Gasto') and (StrToFloat(edtValor.Text) > 0) then
                tblMovimentacao.FieldByName('VALOR').AsFloat := StrToFloat(edtValor.Text) * -1;

              tblMovimentacao.FieldByName('DATA').AsDateTime := dtpData.Date;

              tblMovimentacao.Post;

              frmPrincipal.AtualizaSaldo;
              ShowMessage('Movimentação cadastrada com sucesso!');


              if edtCod.Text <> '' then
              begin
                cod := StrToInt(edtCod.Text);
                if MessageDlg('Deseja excluir o lembrete dessa movimentação?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                begin
                  frmPrincipal.ExcluirLembrete(cod);
                end;
              end;

              edtCod.Text := '';

              Close;
            except
              ShowMessage('Erro ao executar');
            end;

          end
          else
          begin
            ShowMessage('Digite o valor da movimentação.');
            edtValor.SetFocus;
          end;
        end
        else
        begin
          ShowMessage('Selecione com o que foi ganho ou gasto..');
          dblkcbbTipoGast.SetFocus;
        end;
      end
      else
      begin
        ShowMessage('Selecione o meio de pagamento.');
        dblkcbbMeioPag.SetFocus;
      end;
    end
    else
    begin
      ShowMessage('Selecione o tipo de movimentação');
      dblkcbbTipoMov.setFocus;
    end;

  end
  else
  begin
    ShowMessage('Escreva a descrição da movimentação.');
    edtDescricao.SetFocus;
  end;

end;

procedure TfrmCadMovimentacao.edtValorKeyPress(Sender: TObject;
  var Key: Char);
begin
  if ((Key = ',') and (Pos(',', TEdit(Sender).Text) < 1)) // vírgula, apenas uma
    or (Key in ['0'..'9']) // números
    or (Key = Char(VK_BACK)) // backspace
    or ((Key in ['-', '+']) and (TEdit(Sender).SelStart = 0)) // sinal de menos ou mais, somente no começo
  then
  Exit;

  Key := #0;
end;

procedure TfrmCadMovimentacao.edtValorExit(Sender: TObject);
begin
  if edtValor.Text <> '' then
  begin
    edtValor.Text:= FormatFloat('#0.00',StrToFloat(edtValor.Text));
  end;
end;

procedure TfrmCadMovimentacao.dblkcbbTipoMovExit(Sender: TObject);
begin
    {
    if dblkcbbTipoMov.KeyValue = 2 then
    begin
        lblGasto.Visible := True;
        dblkcbbTipoGast.Visible := True;
        dblkcbbTipoGast.SetFocus;
    end
    else
    begin
        lblGasto.Visible := False;
        dblkcbbTipoGast.Visible := False;
        dblkcbbTipoGast.KeyValue := 0;
        //dblkcbbMeioPag.SetFocus;
    end;
    }
end;

procedure TfrmCadMovimentacao.FormShow(Sender: TObject);
begin
  dblkcbbTipoGast.KeyValue := 0;
  dtpData.DateTime := Now;
end;

procedure TfrmCadMovimentacao.btnProcurarClick(Sender: TObject);
begin
  if ( frmBuscaCadMovimentacao = Nil ) then
    frmBuscaCadMovimentacao := TfrmBuscaCadMovimentacao.Create(Application);

  frmBuscaCadMovimentacao.Show;

//    if ( frmProcuraFinRec.ShowModal = mrOk ) then
//    begin
//        ds.DataSet.Close;
//        ( ds.DataSet as TClientDataSet).Params.ParamByName('pID').AsInteger :=
//        frmProcuraFinRec.dsProcura.DataSet.FieldByName('ID').AsInteger;
//        ds.DataSet.Open;
//    end;
end;

procedure TfrmCadMovimentacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  frmCadMovimentacao := nil;

end;

end.
