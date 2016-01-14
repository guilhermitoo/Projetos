unit UCadLembrete;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB, DBCtrls, ComCtrls;

type
  TfrmCadLembrete = class(TForm)
    pnlBotoes: TPanel;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    btnProcurar: TBitBtn;
    txt1: TStaticText;
    lbl1: TLabel;
    edtDescricao: TEdit;
    lblData: TLabel;
    dtpData: TDateTimePicker;
    lblValor: TLabel;
    edtValor: TEdit;
    lbl4: TLabel;
    tblLembrete: TADOTable;
    dsLembrete: TDataSource;
    UsuLembreteCOD_LEMBRETE: TAutoIncField;
    dtmfldLembreteDATA: TDateTimeField;
    UsuLembreteDESCRICAO: TWideStringField;
    bcdfldLembreteVALOR: TBCDField;
    dblkcbbTipoLembrete: TDBLookupComboBox;
    dsTbTipoLembrete: TADODataSet;
    dsTipoLembrete: TDataSource;
    UsuLembreteTIPO_LEMBRETE: TIntegerField;
    procedure btnCancelarClick(Sender: TObject);
    procedure edtValorExit(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure dblkcbbTipoLembreteExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure edtValorKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadLembrete: TfrmCadLembrete;

implementation

uses UControleFinanceiro;

{$R *.dfm}

procedure TfrmCadLembrete.btnCancelarClick(Sender: TObject);
begin
    
    Close;
end;

procedure TfrmCadLembrete.edtValorExit(Sender: TObject);
begin
      if edtValor.Text <> '' then
     begin
          edtValor.Text:= FormatFloat('#0.00',StrToFloat(edtValor.Text));
     end;
end;

procedure TfrmCadLembrete.btnConfirmarClick(Sender: TObject);
begin
  if edtDescricao.Text <> '' then
  begin
    if ((dblkcbbTipoLembrete.KeyValue > 1) and (edtValor.Text <> '')) or (dblkcbbTipoLembrete.KeyValue = 1) then
    begin
      try
        tblLembrete.Insert;

        tblLembrete.FieldByName('DESCRICAO').AsString := edtDescricao.Text;
        tblLembrete.FieldByName('DATA').AsDateTime := dtpData.DateTime;
        tblLembrete.FieldByName('TIPO_LEMBRETE').AsInteger := dblkcbbTipoLembrete.KeyValue;
        if edtValor.Text <> '' then
        begin
          tblLembrete.FieldByName('VALOR').AsFloat := StrToFloat(edtValor.Text);

          if (dblkcbbTipoLembrete.Text = 'Lembrete Pagar') and (StrToFloat(edtValor.Text) > 0) then
            tblLembrete.FieldByName('VALOR').AsFloat := StrToFloat(edtValor.Text) * -1;
        end;
        tblLembrete.Post;

        frmPrincipal.AtualizaLembrete;
        frmPrincipal.AtualizaPagarReceber;

        ShowMessage('Lembrete cadastrado com sucesso!');

        frmCadLembrete := nil;
        close;

      except
        ShowMessage('Erro ao executar');

      end;
    end
    else
    begin
        ShowMessage('Se for cobrança ou recebimento, o valor deve ser preenchido.');
        edtValor.SetFocus;
    end;
  end
  else
  begin
      ShowMessage('Digite a descrição do lembrete.');
      edtDescricao.SetFocus;
  end;
end;

procedure TfrmCadLembrete.dblkcbbTipoLembreteExit(Sender: TObject);
begin
      if dblkcbbTipoLembrete.KeyValue > 1 then
     begin
          lblValor.Enabled := True;
          edtValor.Enabled := True;
     end
     else
     begin
          lblValor.Enabled := False;
          edtValor.Enabled := False;
     end;
end;

procedure TfrmCadLembrete.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    frmCadLembrete := nil;
end;

procedure TfrmCadLembrete.FormShow(Sender: TObject);
begin
    dtpData.DateTime := Now;
end;

procedure TfrmCadLembrete.edtValorKeyPress(Sender: TObject;
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

end.
