unit USaldos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB;

type
  TfrmSaldos = class(TForm)
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lblContaCorrente: TLabel;
    lblDinheiro: TLabel;
    lblTotal: TLabel;
    btnOk: TBitBtn;
    qrySaldo: TADOQuery;
    conexao: TADOConnection;
    fltfldSaldoExpr1000: TFloatField;
    procedure AtualizaSaldos();
    procedure btnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSaldos: TfrmSaldos;

implementation

{$R *.dfm}

procedure TfrmSaldos.AtualizaSaldos;
var
    ganho,gasto: Double;
begin
      ganho := 00;
      gasto := 00;

      // --------------------- Dinheiro ----------------------
      //select de toda a receita


      //select de todo o gasto
//      qrySaldoGasto.sql.Text := 'select SUM(VALOR) from TbMovimentacao where TIPO_MOV = 2 and MEIO_PAG = 1;';
//      qrySaldoGasto.Open;
//      qrySaldoGasto.Requery();
//      gasto := qrySaldoGasto.FieldValues['Expr1000'];
//
//      lblDinheiro.Caption := FormatFloat('0.00',(ganho - gasto));
//      if (ganho - gasto) < 0 then
//            lblDinheiro.Font.Color := clRed
//      else
//            lblDinheiro.Font.Color := clBlue;


      // --------------------- Conta Corrente ------------------
      //select de toda a receita
//      qrySaldoGanho.SQL.Text := 'select SUM(VALOR) from TbMovimentacao where TIPO_MOV = 1 and MEIO_PAG = 2;';
//      qrySaldoGanho.Open;
//      qrySaldoGanho.Requery();
//      ganho := qrySaldoGanho.FieldValues['Expr1000'];
//
//
//      lblContaCorrente.Caption := FormatFloat('0.00',(ganho - gasto));
//      if (ganho - gasto) < 0 then
//            lblContaCorrente.Font.Color := clRed
//      else
//            lblContaCorrente.Font.Color := clBlue;



      // ---------------------- Saldo Total -----------------------
      //select de toda a receita
      qrySaldo.SQL.Strings[2] := '';
      qrySaldo.Open;
      qrySaldo.Requery();

      lblTotal.Caption := FormatFloat('0.00', qrySaldo.FieldValues['Expr1000'] );
      if (qrySaldo.FieldValues['Expr1000']) < 0 then
            lblTotal.Font.Color := clRed
      else
            lblTotal.Font.Color := clBlue;


end;

procedure TfrmSaldos.btnOkClick(Sender: TObject);
begin
    Close;
    
end;

procedure TfrmSaldos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    frmSaldos := nil;
end;

procedure TfrmSaldos.FormCreate(Sender: TObject);
begin
    AtualizaSaldos;
end;

end.
