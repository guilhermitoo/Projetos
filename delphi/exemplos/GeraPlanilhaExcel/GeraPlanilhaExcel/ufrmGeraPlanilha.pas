unit ufrmGeraPlanilha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComObj, DBClient, DBXpress, DB, SqlExpr, FMTBcd, Provider,
  StdCtrls, ExtCtrls, DBCtrls, Buttons, ComCtrls, FileCtrl, dxSkinsCore,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxLabel, Mask, ToolEdit, JvExMask, JvToolEdit,
  JvExComCtrls, JvProgressBar;

type
  TfrmGeraPlanilha = class(TForm)
    con1: TSQLConnection;
    ds1: TSQLDataSet;
    dsp1: TDataSetProvider;
    cds1: TClientDataSet;
    dsc1: TDataSource;
    pnl1: TPanel;
    lbl1: TLabel;
    pnl2: TPanel;
    txtCaminho: TJvComboEdit;
    lbl2: TLabel;
    rgSelecionar: TRadioGroup;
    pb1: TJvProgressBar;
    stat1: TStatusBar;
    btn1: TBitBtn;
    btnGerar: TBitBtn;
    procedure con1Login(Database: TSQLConnection; LoginParams: TStrings);
    procedure txtCaminhoButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnGerarClick(Sender: TObject);
    procedure txtCaminhoExit(Sender: TObject);
    procedure txtCaminhoKeyPress(Sender: TObject; var Key: Char);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure GerarPlanilha(cdsDados : TCustomSQLDataSet; sPath : String; sNomeArquivo : String);
    procedure VerificaFiltro;
    procedure Status(sMsg : String);
    { Public declarations }
  end;

var
  frmGeraPlanilha: TfrmGeraPlanilha;
  sMsg : String;
  sSqlCli : String = 'select' + #13#10 +
                  'C.CODIGO as "Número do Cliente",' + #13#10 + 
                  'case C.TIPOINS when ''1'' then ''PJ'' else ''PF'' end as "Tipo", C.CGC as "CGC ou CPF", C.INSCR as "Inscrição Estadual",' + #13#10 + 
                  'C.RAZAO as "Nome", C.FANTASIA as "Nome Fantasia", C.CEPENTR as "CEP", C.ENDENTR as "Endereço",C.NUMENTR as "Número",' + #13#10 + 
                  'C.COMENTR as "Complemento", '' '' as "Ponto de Referência",C.BAIENTR as "Bairro",C.CIDENTR as "Cidade", C.ESTENTR as "EstadoSigla",' + #13#10 +
                  'P.NOME as "País", '' '' as "DDD" , C.FONE as "Fone1", '' '' as "DDD2", '' '' as "Fone2", '' '' as "DDD3", '' '' as "Fone3",' + #13#10 +
                  ''' '' as "DDD_Fax", C.FAX as "Fax", C.EMAIL as "E-mail", C.COMPRADOR as "Contato", C.OBS as "Observação",' + #13#10 +
                  'C.LEMBFAT as "Observação financeira", V.NOME as "Vendedor do Cliente", C.CLI_DESDE as "Data Inclusão", '' '' as "Cnae"' + #13#10 + 
                  'from cadcli C' + #13#10 + 
                  'left join PAISES P on ( P.CODIGO = C.CODPAIS )' + #13#10 + 
                  'left join CADVEND V on ( V.CODIGO = C.CODVEND )';

  sSqlFor : String = 'select' + #13#10 +
                  'F.CODIGO as "Número do Cliente",''FO'' as "Tipo",F.CGC as "CGC", F.INSCR as "Inscrição Estadual", F.RAZAO as "Nome",' + #13#10 + 
                  'F.FANTASIA as "Nome Fantasia", F.CEP as "Cep", F.ENDERECO as "Endereço", F.NUMERO as "Número", F.COMPLEMENTO as "Complemento",' + #13#10 + 
                  ''' '' as "Ponto de Referência", F.BAIRRO as "Bairro", F.CIDADE as "Cidade", F.ESTADO as "EstadoSigla", ''BR'' as "País",' + #13#10 +
                  ''' '' as "DDD" , F.FONE as "Fone1", '' '' as "DDD2", F.FONECONT as "Fone2", '' '' as "DDD3", '' '' as "Fone3",' + #13#10 +
                  ''' '' as "DDD_Fax", F.FAX as "Fax", F.EMAIL as "E-mail", F.CONTATO as "Contato",' + #13#10 +
                  'F.OBS as "Observação", F.LEMBRETE as "Observação Financeira", '' '' as "Vendedor do Cliente", '' '' as "Data Inclusão", '' '' as "Cnae"' + #13#10 +
                  'from CADFOR F';

  sSqlVend : string = 'select' + #13#10 +
                  'V.CODIGO as "Número do Cliente", ''FU'' as "Tipo", V.CGC as "CPF", '' '' as "RG", '' '' as "Inscrição Estadual", V.NOME as "Nome",' + #13#10 +
                  'V.FANTASIA as "Nome Fantasia", V.CEP as "Cep", V.ENDERECO as "Endereço", V.NUMERO as "Número", V.COMPLEMENTO as "Complemento",' + #13#10 + 
                  ''' '' as "Ponto de Referência", V.BAIRRO as "Bairro", V.CIDADE as "Cidade", V.ESTADO as "EstadoSigla", ''BR'' as "País",' + #13#10 +
                  ''' '' as "DDD", V.FONES as "Fone1", '' '' as "DDD2", '' '' as "Fone2", '' '' as "DDD3", '' '' as "Fone3",' + #13#10 +
                  ''' '' as "DDD_Fax", '' '' as "Fax", V.EMAIL as "E-mail", '' '' as "Contato" ,V.OBS as "Observação",' + #13#10 +
                  ''' '' as "Observação Financeira", '' '' as "Vendedor do Cliente", '' '' as "Data Inclusão", '' '' as "Cnae"' + #13#10 +
                  'from CADVEND V';

  sSqlPro : String = 'select' + #13#10 +
                  ''' '' as "Código Antigo", P.CODIGO as "Código Atual", P.DESCRICAO as "Descrição do Produto", P.CODIGOBARRAS as "Partnumber",' + #13#10 +
                  ''' '' as "País de Origem", '' '' as "Fabricante", '' '' as "Linha", P.CLASSIF_FISCAL as "Classificação Fiscal", CL.DESCRICAO as "Família",' + #13#10 +
                  'P.IPI as "IPI Aliquota", T.S_ALIQ as "Pis Aliquota", C.S_ALIQ as "Cofins Aliquota", CT.DESCRICAO as "Categoria",' + #13#10 + 
                  'P.CUSTO_MED as "Custo Atual", P.PRECO1 as "Preço Mínimo", P.PRECO2 as "Tabela de Preço", P.GARANTIA as "Garantia",' + #13#10 + 
                  'UN.DESCRICAO as "Unidade de Medida", P.PESO_LIQUIDO as "Peso Liquido", P.PESO as "Peso Bruto", '' '' as "Qtde Embalagem",' + #13#10 +
                  ''' '' as "Largura", '' '' as "Altura/Espessura", '' '' as "Comprimento", '' '' as "Diametro", '' '' as "Uso"' + #13#10 + 
                  'from CADPRO P' + #13#10 +
                  'left join TABELA_PIS T on ( T.ID = P.TRIB_PIS )' + #13#10 +
                  'left join TABELA_COFINS C on ( C.ID = P.TRIB_COFINS )' + #13#10 +
                  'left join CADCLA as CL on ( CL.CODIGO = P.CLASSE )' + #13#10 +
                  'left join CADCAT as CT on ( CT.CODIGO = P.CATEGORIA) and ( P.CLASSE = CT.CLASSE )' + #13#10 +
                  'left join CADUNI as UN on ( UN.CODIGO = P.UNIDADE)';
  sSqlRec : string = 'select' + #13#10 +
                  'C.CGC as "Cnpj", R.VENCTO as "Vencimento", ( R.NUMDOC || '' - '' || R.NUMVENCTO || '' - '' ||  C.RAZAO) as "Descrição",' + #13#10 + 
                  'R.NUMDOC as "Documento", R.VALOR as "Valor", R.NUMVENCTO as "Parcela", CB.DESCRICAO as "Forma de Pagamento",' + #13#10 + 
                  '''Crédito'' as "Tipo de Lançamento", '' '' as "Conta Corrente", '' '' as "Plano de Contas"' + #13#10 + 
                  'from CADDUP R' + #13#10 + 
                  'left join CADCLI C on ( C.CODIGO = R.CLIENTE )' + #13#10 + 
                  'left join CADCOB CB on ( CB.CODIGO = R.COBRANCA )';

  sSqlTran : string = 'select' + #13#10 +
                  'T.CODIGO as "Número do Cliente", ''TR'' as "Tipo", T.CGC as "CGC", T.INSCR as "Inscrição Estadual", T.NOME as "Nome",' + #13#10 + 
                  'T.FANTASIA as "Nome Fantasia", T.CEP as "Cep", T.ENDERECO as "Endereço", T.NUMERO as "Número", T.COMPLEMENTO as "Complemento",' + #13#10 + 
                  ''' '' as "Ponto de Referência", T.BAIRRO as "Bairro", T.CIDADE as "Cidade", T.ESTADO as "EstadoSigla", ''BR'' as "País",' + #13#10 +
                  ''' '' as "DDD", T.FONE as "Fone1", '' '' as "DDD2", '' '' as "Fone2", '' '' as "DDD3", '' '' as "Fone3",' + #13#10 +
                  ''' '' as "DDD_Fax", '' '' as "Fax", T.EMAIL as "E-mail", T.CONTATO as "Contato", T.OBS as "Observação",' + #13#10 +
                  'T.LEMBRETE as "Observação Financeira", '' '' as "Vendedor do Cliente", '' '' as "Data Inclusão", '' '' as "Cnae"' + #13#10 +
                  'from CADTRAN T';
  

implementation

{$R *.dfm}

{ TfrmGeraPlanilha }

procedure TfrmGeraPlanilha.GerarPlanilha(cdsDados: TCustomSQLDataSet; sPath : String; sNomeArquivo : String);
var
  iColuna, iLinha: Integer;
  excel: variant;
  sValor :string;
begin
  // cria a planilha virtual
  try
    excel:=CreateOleObject('Excel.Application');
    excel.Workbooks.add(1);
    excel.Caption := sNomeArquivo; // nome da planilha
  except
    Application.MessageBox ('Versão do Ms-Excel'+'Incompatível','Erro',MB_OK+MB_ICONEXCLAMATION);
  end;

  cdsDados.First;
  try
    try
      Screen.Cursor := crSQLWait;
      // exibe a barra de progresso
      pb1.Visible := True;
      // percorre os dados do dataset para poder criar as colunas do excel
      for iLinha:=0 to cdsDados.RecordCount-1 do
      begin
        for iColuna:=1 to cdsDados.FieldCount do
        begin
          sValor:= cdsDados.Fields[iColuna-1].AsString;
          excel.cells [iLinha+2,iColuna]:= sValor;
        end;
        cdsDados.Next;
        pb1.Position := pb1.Position + 1;
      end;
      // percorre os dados do dataset para atribuir os valores para a planilha
      for iColuna :=1 to cdsDados.FieldCount do
      begin
        sValor := cdsDados.Fields[iColuna-1].DisplayLabel;
        excel.cells[1,iColuna]:= sValor;
      end;
      // ajusta as colunas do excel de acordo com os dados que estão preenchidos, ou seja, executa o autosize
      excel.columns.AutoFit;

      // salva a planilha no caminho específico
      excel.ActiveWorkbook.SaveAs(sPath+sNomeArquivo);
      if ( rgSelecionar.ItemIndex <> 6 ) then
      begin
        // mostrar uma mensagem avisando que salvou na pasta e pergunta se deseja abrir o arquivo.
        if (MessageDlg('O arquivo foi salvo em '+sPath+sNomeArquivo+'.xls'+#13+#10+'Deseja abrir a planilha?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
          excel.visible:=true
        else
          excel.quit;
        // muda o status da tela
        Status('Planilha gerada com sucesso!');
      end
      else
      begin
        sMsg := sMsg + sNomeArquivo+'.xls'+#10+#13;
        excel.quit;
      end;
    except
      Application.MessageBox ('Erro durante a conversão','Erro',MB_OK+MB_ICONEXCLAMATION);
      Status('Operação cancelada.');
      excel.quit;
    end;
  finally
    excel := null;
    excel := Unassigned;
    Screen.Cursor := crDefault;
    // oculta a barra de progresso
    pb1.Visible := False;
  end;
end;

procedure TfrmGeraPlanilha.con1Login(Database: TSQLConnection;
  LoginParams: TStrings);
begin
  LoginParams.Add('user_name=sysdba');
  LoginParams.Add('password=carmofae');
end;

procedure TfrmGeraPlanilha.VerificaFiltro;
var
  sSql,sNomeArquivo,sPath : String;
  qry : TCustomSQLDataSet;
  x,i : Integer;
begin
  i := rgSelecionar.ItemIndex;
  x := i;
  if ( i = 6 ) then
  begin
    x := 0;
    sMsg := 'Planilhas geradas: '+#10+#13;
  end;
  while ( x <= i ) do
  begin
    sPath := txtCaminho.Text;
    if (Copy(sPath,Length(sPath),Length(sPath)) <> '\') then
      sPath := sPath+'\';
    sNomeArquivo := rgSelecionar.Items.Strings[x];
    Status('Gerando planilha "'+sNomeArquivo+'.xls"');
    case (x) of
      0 : sSql := sSqlCli;
      1 : sSql := sSqlFor;
      2 : sSql := sSqlVend;
      3 : sSql := sSqlPro;
      4 : sSql := sSqlRec;
      5 : sSql := sSqlTran;
      6 : begin
            // irá mostrar quais planilhas foram geradas corretamente
            sMsg := sMsg + 'Arquivos salvos em: '+sPath;
            MessageDlg(sMsg, mtInformation, [mbOK], 0);
            Status('Planilhas geradas com sucesso!');
            Abort;
          end;
    end;
    try
      con1.Execute(sSql,nil,@qry);
      if not qry.IsEmpty then
      begin
        pb1.Max := qry.RecordCount;
        pb1.Position := 1;
        GerarPlanilha(qry,sPath,sNomeArquivo);
      end;
    finally
      qry.Free;
    end;
    Inc(x);
  end;
end;

procedure TfrmGeraPlanilha.txtCaminhoButtonClick(Sender: TObject);
var
  sPath : String;
begin
  Status('Selecionando pasta.');
  if SelectDirectory('Selecione uma pasta','C:\',sPath) then
    txtCaminho.Text := sPath;
  Status('Pronto para gerar planilha.');
end;

procedure TfrmGeraPlanilha.FormCreate(Sender: TObject);
var
  sPath : string;
begin
  // ao atribuir o caminho do executável para o edit retira o último caractere
  // que no caso é a barrao ( \ )
  // pois ao selecionar o caminho com o botão, ela vem sem a barra no final
  // retirando daqui permite que eu adicione a barra na função que gera a planilha
  sPath := ExtractFilePath(Application.ExeName);
  delete(sPath,length(sPath),1);
  txtCaminho.Text := sPath;
  rgSelecionar.ItemIndex := 0;
  // muda o status do formulário
  Status('Pronto para gerar planilha.');
end;

procedure TfrmGeraPlanilha.btnGerarClick(Sender: TObject);
begin
  VerificaFiltro;
end;

procedure TfrmGeraPlanilha.Status(sMsg: String);
begin
  stat1.Panels[0].Text := sMsg;
end;

procedure TfrmGeraPlanilha.txtCaminhoExit(Sender: TObject);
begin
  if not DirectoryExists(txtCaminho.Text) then
  begin
    ShowMessage('Caminho inválido! selecione outro diretório.');
    txtCaminho.SetFocus;
    Status('Selecionando o caminho.');
    Abort;
  end;
end;

procedure TfrmGeraPlanilha.txtCaminhoKeyPress(Sender: TObject;
  var Key: Char);
begin
  // Não permite que o usuário digite qualquer coisa no caminho, obrigando a clicar no botão
  // para realizar a busca do caminho
  Abort;
end;

procedure TfrmGeraPlanilha.btn1Click(Sender: TObject);
begin
  Close;
end;

end.
