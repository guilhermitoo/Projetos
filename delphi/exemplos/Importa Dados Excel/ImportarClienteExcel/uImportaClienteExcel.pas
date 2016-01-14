unit uImportaClienteExcel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBXpress, FMTBcd, DBClient, Provider, DB, SqlExpr, Comobj, MaskUtils;

type
  TfrmImportaClienteExcel = class(TForm)
    dlgOpen1: TOpenDialog;
    btnSelecionar: TButton;
    con1: TSQLConnection;
    sqlCli: TSQLQuery;
    strngfldsql1CODIGO: TStringField;
    strngfldsql1RAZAO: TStringField;
    strngfldsql1FANTASIA: TStringField;
    strngfldsql1CGC: TStringField;
    strngfldsql1TIPOINS: TStringField;
    strngfldsql1INSCR: TStringField;
    strngfldsql1FONE: TStringField;
    strngfldsql1FAX: TStringField;
    strngfldsql1EMAIL: TStringField;
    strngfldsql1ENDENTR: TStringField;
    Ususql1NUMENTR: TIntegerField;
    strngfldsql1COMENTR: TStringField;
    strngfldsql1BAIENTR: TStringField;
    strngfldsql1CEPENTR: TStringField;
    strngfldsql1CIDENTR: TStringField;
    strngfldsql1ESTENTR: TStringField;
    strngfldsql1ENDCOBR: TStringField;
    Ususql1NUMCOBR: TIntegerField;
    strngfldsql1COMCOBR: TStringField;
    strngfldsql1BAICOBR: TStringField;
    strngfldsql1CEPCOBR: TStringField;
    strngfldsql1CIDCOBR: TStringField;
    strngfldsql1ESTCOBR: TStringField;
    strngfldsql1CODBAN: TStringField;
    strngfldsql1REGIAO: TStringField;
    strngfldsql1CODVEND: TStringField;
    strngfldsql1COBRANCA: TStringField;
    Ususql1NUM_COMPRA: TIntegerField;
    strngfldsql1OBS: TStringField;
    Ususql1CARTORIOS: TIntegerField;
    Ususql1PROTESTOS: TIntegerField;
    strngfldsql1COMPRADOR: TStringField;
    strngfldsql1FONE_COMP: TStringField;
    sqlCliCLI_DESDE: TDateField;
    sqlCliULT_COMPRA: TDateField;
    Ususql1NEGATIVADO: TIntegerField;
    fmtbcdfldsql1LIM_CRED: TFMTBCDField;
    sqlCliLIM_VENCTO: TDateField;
    Ususql1BLOQ_VEN: TIntegerField;
    strngfldsql1MOTIVO_NEG: TStringField;
    strngfldsql1DESBL_VEN: TStringField;
    sqlCliCOMPLEMENT: TMemoField;
    strngfldsql1INTERNET: TStringField;
    strngfldsql1MALADIR: TStringField;
    strngfldsql1TIPOCLI: TStringField;
    strngfldsql1TIPOCAD: TStringField;
    sqlCliTVULTCONT: TDateField;
    sqlCliTVPROXCONT: TDateField;
    Ususql1TVCOMPROU: TIntegerField;
    Ususql1TVFREQPED: TIntegerField;
    sqlCliTVOBS: TMemoField;
    strngfldsql1TVOPERADOR: TStringField;
    strngfldsql1TVDIFICULD: TStringField;
    strngfldsql1TVRAMOATIV: TStringField;
    strngfldsql1TVCODIGO: TStringField;
    Ususql1FICHAS: TIntegerField;
    sqlCliLEMBRETE: TMemoField;
    Ususql1LEMBATIVO: TIntegerField;
    strngfldsql1TABELA: TStringField;
    strngfldsql1SITUACAO_ICMS: TStringField;
    strngfldsql1CODCID: TStringField;
    strngfldsql1CODPAIS: TStringField;
    sqlCliCONTANIVER: TDateField;
    strngfldsql1INSCRITO_SUFRAMA: TStringField;
    strngfldsql1SUFRAMA: TStringField;
    dpsCli: TDataSetProvider;
    cdsCli: TClientDataSet;
    strngfldcds1CODIGO: TStringField;
    strngfldcds1RAZAO: TStringField;
    strngfldcds1FANTASIA: TStringField;
    strngfldcds1CGC: TStringField;
    strngfldcds1TIPOINS: TStringField;
    strngfldcds1INSCR: TStringField;
    strngfldcds1FONE: TStringField;
    strngfldcds1FAX: TStringField;
    strngfldcds1EMAIL: TStringField;
    strngfldcds1ENDENTR: TStringField;
    Usucds1NUMENTR: TIntegerField;
    strngfldcds1COMENTR: TStringField;
    strngfldcds1BAIENTR: TStringField;
    strngfldcds1CEPENTR: TStringField;
    strngfldcds1CIDENTR: TStringField;
    strngfldcds1ESTENTR: TStringField;
    strngfldcds1ENDCOBR: TStringField;
    Usucds1NUMCOBR: TIntegerField;
    strngfldcds1COMCOBR: TStringField;
    strngfldcds1BAICOBR: TStringField;
    strngfldcds1CEPCOBR: TStringField;
    strngfldcds1CIDCOBR: TStringField;
    strngfldcds1ESTCOBR: TStringField;
    strngfldcds1CODBAN: TStringField;
    strngfldcds1REGIAO: TStringField;
    strngfldcds1CODVEND: TStringField;
    strngfldcds1COBRANCA: TStringField;
    Usucds1NUM_COMPRA: TIntegerField;
    strngfldcds1OBS: TStringField;
    Usucds1CARTORIOS: TIntegerField;
    Usucds1PROTESTOS: TIntegerField;
    strngfldcds1COMPRADOR: TStringField;
    strngfldcds1FONE_COMP: TStringField;
    cdsCliCLI_DESDE: TDateField;
    cdsCliULT_COMPRA: TDateField;
    Usucds1NEGATIVADO: TIntegerField;
    fmtbcdfldcds1LIM_CRED: TFMTBCDField;
    cdsCliLIM_VENCTO: TDateField;
    Usucds1BLOQ_VEN: TIntegerField;
    strngfldcds1MOTIVO_NEG: TStringField;
    strngfldcds1DESBL_VEN: TStringField;
    cdsCliCOMPLEMENT: TMemoField;
    strngfldcds1INTERNET: TStringField;
    strngfldcds1MALADIR: TStringField;
    strngfldcds1TIPOCLI: TStringField;
    strngfldcds1TIPOCAD: TStringField;
    cdsCliTVULTCONT: TDateField;
    cdsCliTVPROXCONT: TDateField;
    Usucds1TVCOMPROU: TIntegerField;
    Usucds1TVFREQPED: TIntegerField;
    cdsCliTVOBS: TMemoField;
    strngfldcds1TVOPERADOR: TStringField;
    strngfldcds1TVDIFICULD: TStringField;
    strngfldcds1TVRAMOATIV: TStringField;
    strngfldcds1TVCODIGO: TStringField;
    Usucds1FICHAS: TIntegerField;
    cdsCliLEMBRETE: TMemoField;
    Usucds1LEMBATIVO: TIntegerField;
    strngfldcds1TABELA: TStringField;
    strngfldcds1SITUACAO_ICMS: TStringField;
    strngfldcds1CODCID: TStringField;
    strngfldcds1CODPAIS: TStringField;
    cdsCliCONTANIVER: TDateField;
    strngfldcds1INSCRITO_SUFRAMA: TStringField;
    strngfldcds1SUFRAMA: TStringField;
    lblFileName: TLabel;
    btnCarregar: TButton;
    lbl1: TLabel;
    sqlVend: TSQLQuery;
    dpsVend: TDataSetProvider;
    cdsVend: TClientDataSet;
    strngfldcds2CODIGO: TStringField;
    strngfldcds2RAZAO: TStringField;
    strngfldcds2FANTASIA: TStringField;
    strngfldcds2CGC: TStringField;
    strngfldcds2TIPOINS: TStringField;
    strngfldcds2INSCR: TStringField;
    strngfldcds2FONE: TStringField;
    strngfldcds2FAX: TStringField;
    strngfldcds2EMAIL: TStringField;
    strngfldcds2ENDENTR: TStringField;
    Usucds2NUMENTR: TIntegerField;
    strngfldcds2COMENTR: TStringField;
    strngfldcds2BAIENTR: TStringField;
    strngfldcds2CEPENTR: TStringField;
    strngfldcds2CIDENTR: TStringField;
    strngfldcds2ESTENTR: TStringField;
    strngfldcds2ENDCOBR: TStringField;
    Usucds2NUMCOBR: TIntegerField;
    strngfldcds2COMCOBR: TStringField;
    strngfldcds2BAICOBR: TStringField;
    strngfldcds2CEPCOBR: TStringField;
    strngfldcds2CIDCOBR: TStringField;
    strngfldcds2ESTCOBR: TStringField;
    strngfldcds2CODBAN: TStringField;
    strngfldcds2REGIAO: TStringField;
    strngfldcds2CODVEND: TStringField;
    strngfldcds2COBRANCA: TStringField;
    Usucds2NUM_COMPRA: TIntegerField;
    strngfldcds2OBS: TStringField;
    Usucds2CARTORIOS: TIntegerField;
    Usucds2PROTESTOS: TIntegerField;
    strngfldcds2COMPRADOR: TStringField;
    strngfldcds2FONE_COMP: TStringField;
    cdsVendCLI_DESDE: TDateField;
    cdsVendULT_COMPRA: TDateField;
    Usucds2NEGATIVADO: TIntegerField;
    fmtbcdfldcds2LIM_CRED: TFMTBCDField;
    cdsVendLIM_VENCTO: TDateField;
    Usucds2BLOQ_VEN: TIntegerField;
    strngfldcds2MOTIVO_NEG: TStringField;
    strngfldcds2DESBL_VEN: TStringField;
    cdsVendCOMPLEMENT: TMemoField;
    strngfldcds2INTERNET: TStringField;
    strngfldcds2MALADIR: TStringField;
    strngfldcds2TIPOCLI: TStringField;
    strngfldcds2TIPOCAD: TStringField;
    cdsVendTVULTCONT: TDateField;
    cdsVendTVPROXCONT: TDateField;
    Usucds2TVCOMPROU: TIntegerField;
    Usucds2TVFREQPED: TIntegerField;
    cdsVendTVOBS: TMemoField;
    strngfldcds2TVOPERADOR: TStringField;
    strngfldcds2TVDIFICULD: TStringField;
    strngfldcds2TVRAMOATIV: TStringField;
    strngfldcds2TVCODIGO: TStringField;
    Usucds2FICHAS: TIntegerField;
    cdsVendLEMBRETE: TMemoField;
    Usucds2LEMBATIVO: TIntegerField;
    strngfldcds2TABELA: TStringField;
    strngfldcds2SITUACAO_ICMS: TStringField;
    strngfldcds2CODCID: TStringField;
    strngfldcds2CODPAIS: TStringField;
    cdsVendCONTANIVER: TDateField;
    strngfldcds2INSCRITO_SUFRAMA: TStringField;
    strngfldcds2SUFRAMA: TStringField;
    strngfldsql2CODIGO: TStringField;
    strngfldsql2NOME: TStringField;
    strngfldsql2TIPO: TStringField;
    strngfldsql2TELEFONE: TStringField;
    strngfldsql2ENDERECO: TStringField;
    strngfldsql2BAIRRO: TStringField;
    strngfldsql2CEP: TStringField;
    strngfldsql2CIDADE: TStringField;
    strngfldsql2ESTADO: TStringField;
    strngfldsql2EMAIL: TStringField;
    fmtbcdfldsql2COMISSAO: TFMTBCDField;
    Ususql2CONTROLE: TIntegerField;
    fmtbcdfldsql2COMIS_A: TFMTBCDField;
    fmtbcdfldsql2COMIS_I: TFMTBCDField;
    sqlVendNASCTO: TDateField;
    procedure btnSelecionarClick(Sender: TObject);
    procedure SelecionarArquivoExcel();
    procedure ImportarDados();
    function StrZero(Zeros:string;Quant:integer):String;
    procedure con1Login(Database: TSQLConnection; LoginParams: TStrings);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImportaClienteExcel: TfrmImportaClienteExcel;
  planilha, sheet: OleVariant;
  linha: Integer;
  coluna: string;


implementation

{$R *.dfm}

procedure TfrmImportaClienteExcel.btnSelecionarClick(Sender: TObject);
begin
  SelecionarArquivoExcel;
end;

procedure TfrmImportaClienteExcel.SelecionarArquivoExcel;
begin
  linha := 18;
  coluna := 'A';

  if dlgOpen1.Execute then
  begin
    lblFileName.Caption := dlgOpen1.FileName;

    planilha := CreateOleObject('Excel.Application');
    planilha.WorkBooks.open(dlgOpen1.FileName);
    sheet:= planilha.WorkSheets[1];

    lbl1.Color := clRed;
    lbl1.Caption := 'XX';
    btnCarregar.Enabled := False;
    if ( sheet.cells[3, coluna].Text = 'Relatório de clientes  - ORDEM: CLIENTE' ) and ( sheet.cells[linha, coluna].Text <> '' ) then
    begin
      lbl1.Color := clGreen;
      lbl1.Caption := 'OK';

      btnCarregar.Enabled := True;

    end
    else
      ShowMessage('Arquivo Inválido!');

  end;
end;


procedure TfrmImportaClienteExcel.ImportarDados;
begin
  if sheet.cells[linha, coluna].Text <> '' then
  begin
    cdsCli.FieldByName('CODIGO').Value := StrZero( sheet.cells[linha, coluna].Text , 5 );

    coluna := 'B'; //Coluna da Razão social
    cdsCli.FieldByName('RAZAO').Value := sheet.cells[linha, coluna].Text;

    coluna := 'F'; //Coluna da Cidade
    cdsCli.FieldByName('CIDENTR').Value := sheet.cells[linha, coluna].Text;
    cdsCli.FieldByName('CIDCOBR').Value := sheet.cells[linha, coluna].Text;

    coluna := 'M'; //Coluna do Estado
    cdsCli.FieldByName('ESTENTR').Value := sheet.cells[linha, coluna].Text;
    cdsCli.FieldByName('ESTCOBR').Value := sheet.cells[linha, coluna].Text;

    coluna := 'O'; //Coluna do Nome Fantasia
    cdsCli.FieldByName('FANTASIA').Value := sheet.cells[linha, coluna].Text;

    coluna := 'P'; //Coluna do Vendedor
    if sheet.cells[linha, coluna].Text <> '' then
    begin

      sqlVend.SQL[2] := 'where V.NOME = "' + sheet.cells[linha, coluna].Text + '"
      sqlVend.Open;
      sqlVend.Refresh;

      if sqlVend.FieldByName('CODIGO').Value = '' then
      begin // Vendedor não cadastrado

        //cadastra o vendedor
        sqlVend.Insert;
        sqlVend.FieldByName('NOME').Value := sheet.cells[linha, coluna].Text;
        sqlVend.Post;

      end
      else
      begin //Vendedor já cadastrado
        cdsCli.FieldByName('CODVEND').Value := sqlVend.FieldByName('CODIGO').Value;
      end;
    end;

    linha := linha + 1; // linha e coluna do endereço
    coluna := 'A';
    cdsCli.FieldByName('ENDENTR').Value := sheet.cells[linha, coluna].Text;
    cdsCli.FieldByName('ENDCOBR').Value := sheet.cells[linha, coluna].Text;

    coluna := 'D'; // coluna do bairro
    cdsCli.FieldByName('BAIENTR').Value := sheet.cells[linha, coluna].Text;
    cdsCli.FieldByName('BAICOBR').Value := sheet.cells[linha, coluna].Text;



  end;
end;


function TfrmImportaClienteExcel.StrZero(Zeros: string;
  Quant: integer): String;
var
  i : Integer;
begin
  Zeros := Trim(Zeros);
  if ( Length(Zeros) > Quant ) then
    Zeros := Copy(Zeros,(Length(Zeros)-Quant)+1,Quant);
  Result:= Zeros;
  for i := Length(Zeros) to (Quant-1) do Result := '0'+Result;
end;

procedure TfrmImportaClienteExcel.con1Login(Database: TSQLConnection;
  LoginParams: TStrings);
begin
  LoginParams.Add('user_name=sysdba');
  LoginParams.Add('password=carmofae');
end;

end.
