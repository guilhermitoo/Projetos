unit UCadTipoGasto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB;

type
  TfrmCadTipoGasto = class(TForm)
    pnlBotoes: TPanel;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    btnProcurar: TBitBtn;
    edtDescricao: TEdit;
    txt1: TStaticText;
    lbl4: TLabel;
    dsTipoGasto: TDataSource;
    tblTipoGasto: TADOTable;
    conexao: TADOConnection;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadTipoGasto: TfrmCadTipoGasto;

implementation

uses UControleFinanceiro, UBuscaTipoGastoGanho;

{$R *.dfm}

procedure TfrmCadTipoGasto.btnCancelarClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmCadTipoGasto.btnConfirmarClick(Sender: TObject);
begin
      try
          if edtDescricao.Text <> '' then
          begin


            tblTipoGasto.Insert;

            tblTipoGasto.FieldByName('DESCRICAO').AsString := edtDescricao.Text;

            tblTipoGasto.Post;

            ShowMessage('Tipo de gasto cadastrado com sucesso!');

            frmCadTipoGasto := nil;
            Close;
          end
          else
          begin
            ShowMessage('Digite a descrição.');
            edtDescricao.SetFocus();
          end;
        except

            ShowMessage('Erro ao executar');

        end;
end;

procedure TfrmCadTipoGasto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    frmCadTipoGasto := nil;
end;

procedure TfrmCadTipoGasto.btnProcurarClick(Sender: TObject);
begin
  if ( frmBuscaTipoGastoGanho = Nil ) then
    frmBuscaTipoGastoGanho := TfrmBuscaTipoGastoGanho.Create(Application);

  frmBuscaTipoGastoGanho.Show;
end;

end.
