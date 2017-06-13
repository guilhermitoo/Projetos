unit uHelper;

interface

uses Data.DB, System.UITypes, Vcl.Forms, uDB_Controller, System.SysUtils,
      DateUtils, System.StrUtils, cxDBEdit, cxCalendar, System.Classes;

procedure PreencherData(var Data : String; bDataHora : Boolean);
procedure AbrirDataSet( ds : TDataSet );
function StrZero(Zeros:string;Quant:integer):String;
procedure CxDateEditValidate(Sender : TObject; var DisplayValue : Variant; var Error : Boolean);
function AlteraLinhaSelect(sSql : string; sIdLinha : String; sNovaLinha: String) : String;

implementation

procedure AbrirDataSet( ds : TDataSet );
var
  crOldCursor : TCursor;
  db : TDB;
  bAbriuTransacaoAqui : Boolean;
begin
  crOldCursor := Screen.Cursor;
  Screen.Cursor := crSqlWait;
  try
    bAbriuTransacaoAqui := False;

    db := TDB.Create;
    try
      if ( db.TransacaoAtiva ) then
        bAbriuTransacaoAqui := False
      else
      begin
        db.AbreTransacao;
        bAbriuTransacaoAqui := True;
      end;

      if ( ds.Active ) then
        ds.Close;
      ds.Open;

    finally
      if ( bAbriuTransacaoAqui ) then
        db.Commit;
      db.Free;
    end;
  finally
    Screen.Cursor := crOldCursor;
  end;
end;

procedure PreencherData(var Data : String; bDataHora : Boolean);
var
  SeparadorTempo,SeparadorData,dia,mes,ano,hora,dataFinal : String;
  Agora : TDateTime;
  barra1,barra2,espaco,doispontos1,doispontos2 : Integer;
  fs : TFormatSettings;

  function Empty(s : String):Boolean;  begin Result := (s=EmptyStr); end;
begin
  // pega a data/hora de agora para utilizar lá em baixo
  Agora := Now;

  // pega os separadores de data e hora
  fs := TFormatSettings.Create('pt-BR');
  SeparadorData := fs.DateSeparator;
  SeparadorTempo := fs.TimeSeparator;

  dia := '';
  mes := '';
  ano := '';
  hora := '00'+SeparadorTempo+'00'+SeparadorTempo+'00';

  // PERCORRE A MASCARA PEGANDO A POSIÇÃO DOS SEPARADORES
  // EVITA PROBLEMAS COM MASCARAS DIFERENTES
  // EXEMPLOS DE TIPOS DE MASCARAS
  //  1/5/17 00:00:00
  //  01/05/17 00:00:00
  //  1/5/2017 00:00:00
  barra1 := PosEx(SeparadorData,Data,1);
  barra2 := PosEx(SeparadorData,Data,barra1+1);
  doispontos1 := PosEx(SeparadorTempo,Data,1);
  espaco := doispontos1-3;
  doispontos2 := PosEx(SeparadorTempo,Data,doispontos1+1);

  dia := Trim(Copy(Data,1,barra1-1));
  mes := Trim(Copy(Data,barra1+1,barra2-barra1-1));
  ano := Trim(Copy(Data,barra2+1,espaco-barra2-1));

  // verifica se a data digitada é vazia
  // SE DATA DIGITADA = VAZIO, SAI DO VALIDATE
  if Empty(dia) and Empty(mes) and Empty(ano) then
    Exit;

  // pega os dados da data se não forem digitados
  if Empty(dia) then
    dia := StrZero(DayOf(Agora).ToString,2);
  if Empty(mes) then
    mes := StrZero(MonthOf(Agora).ToString,2);
  if Empty(ano) then
    ano := YearOf(Agora).ToString;

  // MONTA A DATA FINAL
  dataFinal := dia+SeparadorData+mes+SeparadorData+ano;
  // SE TEM HORA, ENTÃO MONTA A HORA FINAL
  if bDataHora then
  begin
    hora := Copy(Data,espaco+1,Length(hora));
    dataFinal := dataFinal+' '+hora;
  end;

  // atribui a datafinal para a variável de referência
  Data := dataFinal;
end;

function StrZero(Zeros:string;Quant:integer):String;
{Insere Zeros à frente de uma string}
var
  i : Integer;
begin
  Zeros := Trim(Zeros);
  if ( Length(Zeros) > Quant ) then
    Zeros := Copy(Zeros,(Length(Zeros)-Quant)+1,Quant);
  Result:= Zeros;
  for i := Length(Zeros) to (Quant-1) do Result := '0'+Result;
end;

procedure CxDateEditValidate(Sender : TObject; var DisplayValue : Variant; var Error : Boolean);
var
  bDataHora : Boolean;
  data : String;
begin
  // PARA FUNCIONAR, EXIGE MÁSCARA NO COMPONENTE
  // Properties->InputKind := ikMask

  // auto completa data
  // verifica se é somente data ou tem datahora
  bDataHora := False;
  if Sender is TcxDBDateEdit then
  begin
    data := TcxDBDateEdit(Sender).Text;
    bDataHora := (TcxDBDateEdit(Sender).Properties.Kind = ckDateTime);
  end
  else if Sender is TcxDateEdit then
  begin
    data := TcxDateEdit(Sender).Text;
    bDataHora := (TcxDateEdit(Sender).Properties.Kind = ckDateTime);
  end;

  PreencherData(data,bDataHora);

  // atribui o valor para o campo
  if Sender is TcxDBDateEdit then
    if bDataHora then
      TcxDBDateEdit(Sender).Date := StrToDateTime(data)
    else
      TcxDBDateEdit(Sender).Date := StrToDate(data)
  else if Sender is TcxDateEdit then
    if bDataHora then
      TcxDateEdit(Sender).Date := StrToDateTime(data)
    else
      TcxDateEdit(Sender).Date := StrToDate(data);

  DisplayValue := data;

  Error := False;
end;

function AlteraLinhaSelect(sSql : string; sIdLinha : String; sNovaLinha: String) : String;
var
  sl : TStringList;
  i, iIndex : Integer;
  sIDAtual, sLinhaAtual : String;
begin
  // Função utilizada para modificar várias linhas em um select específico
  // *detalhe: a função altera TODAS as linhas que ela encontrar com o
  // prefixo utilizado
  // muito útil para utilizar no fast reports
  sl := TStringlist.Create;
  try
    // atribui o select informado para a stringlist
    sl.Text := sSql;
    for i:=0 to sl.Count-1 do
    begin
      sLinhaAtual := sl.Strings[i];
      iIndex := Pos(UpperCase(sIdLinha),UpperCase(sLinhaAtual));
      if ( iIndex >0 ) then
      begin
        // Verifica se o ID informado é exatamente igual ao ID encontrado
        // Desta forma evita que IDs parecidos sejam substituidos indevidamente
        // Ex: CODIGO E CODIGO_CLI
        sIDAtual := Copy(sLinhaAtual,iIndex, MaxInt);
        if ( UpperCase( Trim(sIDAtual) ) = UpperCase( Trim( sIdLinha ) ) ) then
          sl.Strings[i] := sNovaLinha + ' -- '+sIdLinha;
      end;
    end;
    Result := sl.Text;
  finally
    sl.free;
  end;
end;

end.
