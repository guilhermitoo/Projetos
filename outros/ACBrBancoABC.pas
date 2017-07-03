{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para interação com equipa- }
{ mentos de Automação Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2016                                        }
{                                                                              }
{ Colaboradores nesse arquivo:   Guilherme Henrique da Cruz Dias               }
{                                Anthero Vieira Neto                           }
{******************************************************************************}

{$I ACBr.inc}

unit ACBrBancoABC;

interface

uses
  Classes, SysUtils, Contnrs,
  ACBrBoleto, ACBrValidador;

type

  { TACBrBancoABC }

  TACBrBancoABC = class(TACBrBancoClass)
  private
  protected
    vTotalTitulos : Double;
  public
    Constructor create(AOwner: TACBrBanco);
    function CalcularDigitoVerificador(const ACBrTitulo:TACBrTitulo): String; override;
    function MontarCodigoBarras(const ACBrTitulo : TACBrTitulo): String; override;
    function MontarCampoNossoNumero(const ACBrTitulo :TACBrTitulo): String; override;
    function MontarContaCorrente(const Cedente: TACBrCedente): String;
    function MontarCampoCodigoCedente( const ACBrTitulo: TACBrTitulo): String; override;
    function GerarRegistroHeader240(NumeroRemessa: Integer): String; override;
    function GerarRegistroTransacao240(ACBrTitulo : TACBrTitulo): String; override;
    function GerarRegistroTrailler240(ARemessa : TStringList): String;  override;
    Procedure LerRetorno240(ARetorno:TStringList); override;

    function TipoOcorrenciaToDescricao(const TipoOcorrencia: TACBrTipoOcorrencia) : String; override;
    function CodOcorrenciaToTipo(const CodOcorrencia:Integer): TACBrTipoOcorrencia; override;
    function TipoOCorrenciaToCod(const TipoOcorrencia: TACBrTipoOcorrencia):String; override;
    function CodMotivoRejeicaoToDescricao(const TipoOcorrencia:TACBrTipoOcorrencia; CodMotivo:Integer): String; override;

    // banco abc
    function PessoaToCod(const TipoInscricao : TACBrPessoa):String;
  end;

implementation

uses
  {$IFDEF COMPILER6_UP} dateutils {$ELSE} ACBrD5 {$ENDIF},
  StrUtils, math,
  ACBrUtil;

{ TACBrBancoABC }

constructor TACBrBancoABC.create(AOwner: TACBrBanco);
begin
   inherited create(AOwner);
   fpDigito                 := 1;    //OK
   fpTamanhoAgencia         := 5;    //OK
   fpNome                   := 'BCO ABC BRASIL';
   fpNumero                 := 246;  //OK
   fpTamanhoMaximoNossoNum  := 11;   //OK
   fpTamanhoCarteira        := 3;    //OK
   fpTamanhoConta           := 13;   //?
   fpCodigosMoraAceitos    := '1234';  // '1'  =  Valor por Dia
                                       // '2'  =  Taxa Mensal
                                       // '3'  =  Isento
                                       // '4'  =  Mora Padrão
end;

function TACBrBancoABC.CalcularDigitoVerificador(const ACBrTitulo: TACBrTitulo ): String;
var
  sDoc : String;
  iTam,iValorFinal,i,x : Integer;
begin
 // AAAA			O código da agência do título, sem dv.
 // CCC			O código da carteira (por exemplo, 121)
 // NNNNNNNNNN 	            O nosso número, sem DV
 //
 // . Multiplica-se cada algarismo do número formado pela composição dos campos
 // acima pela sequência de multiplicadores 2,1,2,1,2,1,2 (posicionados da direita para a esquerda).
 // . Se a multiplicação resultar > 9 (por exemplo = 12), somar os dígitos (1 + 2).
 // . A seguir, somam-se os algarismos dos produtos e o total obtido é dividido
 // por 10. O DV é a diferença entre o divisor (10) e o resto da divisão:
 // 10 - (RESTO DA DIVISAO) = DV. Se o resto da divisão for zero, o DV é zero.

  i := 0;
  iValorFinal := 0;
  iTam := 0;

  sDoc := IntToStrZero(StrToInt(ACBrTitulo.ACBrBoleto.Cedente.Agencia),fpTamanhoAgencia-1) +
          PadLeft(ACBrTitulo.Carteira,fpTamanhoCarteira,'0') +
          IntToStrZero(StrToInt(ACBrTitulo.NossoNumero),fpTamanhoMaximoNossoNum-1);

  iTam := Length(sDoc);

  for i := 1 to iTam do
  begin
    x := 0;
    x := StrToInt(Copy(sDoc,i,1));

    x := x * (( i mod 2 ) + 1 );

    if ( x > 9 ) then
      x := StrToInt( Copy(IntToStr(x),1,1) ) + StrToInt( Copy(IntToStr(x),2,1) );

    iValorFinal := iValorFinal + x;
  end;

  iValorFinal := 10 - (iValorFinal mod 10);

  Result := IntToStr(iValorFinal);
  Result := Copy(Result,Length(Result),1);
end;

function TACBrBancoABC.MontarCodigoBarras ( const ACBrTitulo: TACBrTitulo) : String;
var
  DigitoCodBarras, CampoLivre:String;

  function CodigoBarras(bDigitoVerificador:Boolean=False):string;
  begin
    with ACBrTitulo.ACBrBoleto do
    begin
      CampoLivre   :=  IntToStrZero( StrToInt(OnlyNumber(Cedente.Agencia)), fpTamanhoAgencia-1) +
                       ACBrTitulo.Carteira + // Número Carteira Título
                       IntToStrZero(StrToInt(OnlyNumber(Cedente.CodigoCedente)),7) + //Número da Operação
                       IntToStrZero(StrToInt(OnlyNumber(ACBrTitulo.NossoNumero) +
                                  CalcularDigitoVerificador(ACBrTitulo)),fpTamanhoMaximoNossoNum);


      Result :=  PadLeft(IntToStr(fpNumero), 3, '0') +                    //Identificação do Banco (Sem DV)
                 '9'+                                                     //Moeda (9-Real, 0-Variável)
                 IfThen(bDigitoVerificador,DigitoCodBarras,'' ) +         //Dígito código barras
                 CalcularFatorVencimento(ACBrTitulo.Vencimento) +         //Fator de Vencimento (Item 7)
                 IntToStrZero(Round(ACBrTitulo.ValorDocumento*100),10) +  // Valor nominal do título.
                 CampoLivre;                                              // Campo livre – Utilizado de acordo com as especificações internas do banco. (Item 8)
    end;
  end;
begin
   DigitoCodBarras := CalcularDigitoCodigoBarras(CodigoBarras);
   Result:= CodigoBarras(True);
end;

function TACBrBancoABC.MontarCampoCodigoCedente(
  const ACBrTitulo: TACBrTitulo): String;
begin
   Result := PadLeft(ACBrTitulo.ACBrBoleto.Cedente.Agencia,fpTamanhoAgencia-1,'0')+'/'+
             PadLeft(ACBrTitulo.ACBrBoleto.Cedente.AgenciaDigito,1,'0')+
             PadLeft(ACBrTitulo.ACBrBoleto.Cedente.Conta,fpTamanhoConta-1,'0');
end;

function TACBrBancoABC.MontarCampoNossoNumero (
   const ACBrTitulo: TACBrTitulo ) : String;
begin
  with ACBrTitulo do
  begin
    case StrToIntDef(Carteira,0) of
       5: Carteira := '101';
       6: Carteira := '201';
       4: Carteira := '102';
    end;
  end;

  Result := PadLeft(ACBrTitulo.Carteira,fpTamanhoCarteira,'0') + '/' +
            IntToStrZero(StrToInt(ACBrTitulo.NossoNumero),fpTamanhoMaximoNossoNum-1) + '-' +
            CalcularDigitoVerificador(ACBrTitulo);
end;

function TACBrBancoABC.MontarContaCorrente (
   const Cedente: TACBrCedente ) : String;
begin
   Result := PadLeft(Cedente.Agencia,fpTamanhoAgencia-1,'0')+
             PadLeft(Cedente.AgenciaDigito,1,'0')+
             PadLeft(Cedente.Conta,fpTamanhoConta,'0')+
             PadLeft(Cedente.ContaDigito,2,'0');
end;

function TACBrBancoABC.GerarRegistroHeader240(NumeroRemessa: Integer): String;
begin
   with ACBrBanco.ACBrBoleto.Cedente do
   begin
      { REGISTRO HEADER DO ARQUIVO REMESSA }  // FEITO - Guilherme Henrique da Cruz Dias - 03/11/2016
      Result := IntToStr(fpNumero)                         + // 001 - 003 / Código do Banco na compensação
                '0000'                                     + // 004 - 007 / Lote de serviço
                '0'                                        + // 008 - 008 / Tipo de registro
                Space(9)                                   + // 009 - 017 / Reservado (uso Banco FEBRABAN)
                PessoaToCod(TipoInscricao)                 + // 018 - 018 / Tipo de inscrição da empresa
                PadLeft(trim(OnlyNumber(CNPJCPF)),14,'0')  + // 019 - 032 / Nº de inscrição da empresa
                MontarContaCorrente(ACBrBoleto.Cedente)    + // 033 - 052 / Código do convênio
                MontarContaCorrente(ACBrBoleto.Cedente)    + // 053 - 072 / dados do cliente (AgenciaContaCorrente)
                PadRight(Nome, 30)                         + // 073 - 102 / Nome da Empresa
                PadRight(fpNome, 30)                       + // 103 - 132 / Nome do Banco
                Space(10)                                  + // 133 - 142 / Reservado (uso Banco)
                '1'                                        + // 143 - 143 / Código remessa = 1
                FormatDateTime('ddmmyyyyhhnnss',Now)       + // 144 - 157 / Data e hora de geração do arquivo. Ex: 03112016103351
                PadLeft(IntToStr(NumeroRemessa), 6, '0')   + // 158 - 163 / Nº seqüencial do arquivo
                '040'                                      + // 164 - 166 / Nº da versão do layout do arquivo
                Space(74)                                  ; // 167 - 240 / Reservado (uso Banco)

      { REGISTRO HEADER DO LOTE REMESSA }     // FEITO - Guilherme Henrique da Cruz Dias - 03/11/2016
      Result := Result + #13#10 +
                IntToStr(fpNumero)                         + // 001 - 003 / Código do Banco na compensação
                '0001'                                     + // 004 - 007 / Numero do lote remessa
                '1'                                        + // 008 - 008 / Tipo de registro
                'R'                                        + // 009 - 009 / Tipo de operação
                '01'                                       + // 010 - 011 / Tipo de serviço
                Space(2)                                   + // 012 - 013 / Reservado (uso Banco)
                '030'                                      + // 014 - 016 / Nº da versão do layout do lote
                Space(1)                                   + // 017 - 017 / Reservado (uso Banco)
                PessoaToCod(TipoInscricao)                 + // 018 - 018 / Tipo de inscrição da empresa
                PadLeft(trim(OnlyNumber(CNPJCPF)),15,'0')  + // 019 - 033 / Nº de inscrição da empresa
                MontarContaCorrente(ACBrBoleto.Cedente)    + // 034 - 053 / Reservado (uso Banco)
                MontarContaCorrente(ACBrBoleto.Cedente)    + // 054 - 073 / dados do cliente (AgenciaContaCorrente)
                PadRight(Nome, 30)                         + // 074 - 103 / Nome do Cedente
                Space(40)                                  + // 104 - 143 / Mensagem 1
                Space(40)                                  + // 144 - 183 / Mensagem 2
                PadLeft(IntToStr(NumeroRemessa), 8, '0')   + // 184 - 191 / Nº temessa
                FormatDateTime('ddmmyyyy',Now)             + // 192 - 199 / Data de geração do arquivo
                Space(41)                                  ; // 200 - 240 / Reservado (uso Banco)

      Result := UpperCase(Result);
   end;
end;

function TACBrBancoABC.GerarRegistroTransacao240(ACBrTitulo: TACBrTitulo): String;
var
  ISequencia: Integer;
  sCodMovimento: String;
  sDigitoNossoNumero, sTipoCobranca, sTipoDocto, sTipoCarteira, sEmisBloq: String;
  sEspecie, sDataMoraJuros, sDataDesconto: String;
  STipoJuros, sTipoDesconto, sDiasProtesto, sDiasBaixaDevol: String;
  sTipoInscricao, sEndereco : String;
  aTipoInscricao: Char;
  function MontarInstrucoes1: string;
  begin
    with ACBrTitulo do
    begin
      if Mensagem.Count = 0 then
      begin
        Result := PadRight('', 80, ' '); // 2 registros
        Exit;
      end;

      Result := '';
      if Mensagem.Count >= 1 then
      begin
        Result := Result +
                  Copy(PadRight(Mensagem[0], 40, ' '), 1, 40);
      end;

      if Mensagem.Count >= 2 then
      begin
        Result := Result +
                  Copy(PadRight(Mensagem[1], 40, ' '), 1, 40)
      end
      else
      begin
        if (Result <> EmptyStr) then
          Result := Result + PadRight('', 40, ' ')  // 1 registro
        else
          Result := Result + PadRight('', 80, ' '); // 2 registros
        Exit;
      end;
    end;
  end;

  function MontarInstrucoes2: string;
  begin
    with ACBrTitulo do
    begin
      if Mensagem.Count <= 2 then
      begin
        // Somente duas linhas, foi montado o MontarInstrucoes1
        Result := PadRight('', 200, ' '); // 5 registros
        Exit;
      end;

      Result := '';
      if Mensagem.Count >= 3 then
      begin
        Result := Copy(PadRight(Mensagem[2], 40, ' '), 1, 40);
      end;

      if Mensagem.Count >= 4 then
      begin
        Result := Result +
                  Copy(PadRight(Mensagem[3], 40, ' '), 1, 40)
      end;

      if Mensagem.Count >= 5 then
      begin
        Result := Result +
                  Copy(PadRight(Mensagem[4], 40, ' '), 1, 40)
      end;

      if Mensagem.Count >= 6 then
      begin
        Result := Result +
                  Copy(PadRight(Mensagem[5], 40, ' '), 1, 40)
      end;

      if Mensagem.Count >= 7 then
      begin
        Result := Result +
                  Copy(PadRight(Mensagem[6], 40, ' '), 1, 40)
      end;

      // Acertar a quantidade de caracteres
      Result := PadRight(Result, 200);
    end;
  end;

begin
 aTipoInscricao := ' ';
// by Anthero Vieira Neto - WindSoft - 04/11/2016
  with ACBrTitulo do
  begin
    case OcorrenciaOriginal.Tipo of
      toRemessaBaixar                        : sCodMovimento := '02'; {Pedido de Baixa}
      toRemessaConcederAbatimento            : sCodMovimento := '04'; {Concessão de Abatimento}
      toRemessaCancelarAbatimento            : sCodMovimento := '05'; {Cancelamento de Abatimento concedido}
      toRemessaAlterarVencimento             : sCodMovimento := '06'; {Alteração de vencimento}
      toRemessaAlterarControleParticipante   : sCodMovimento := '07'; {Alteração Número Controle Cedente}
      toRemessaAlterarNumeroControle         : sCodMovimento := '08'; {Alteração de seu número}
      toRemessaProtestar                     : sCodMovimento := '09'; {Pedido de protesto}
      toRemessaCancelarInstrucaoProtesto     : sCodMovimento := '18'; {Sustar protesto e manter na carteira}
      toRemessaConcederDesconto              : sCodMovimento := '10'; {Concessão de Desconto}
      toRemessaCancelarDesconto              : sCodMovimento := '11'; {Cancelamento de Desconto}
      toRemessaNaoProtestar                  : sCodMovimento := '98'; {Não Protestar (Antes de iniciar o ciclo de protesto )}
    else
      sCodMovimento := '01';                                          {Remessa}
    end;

    sDigitoNossoNumero := CalcularDigitoVerificador(ACBrTitulo);

    case CaracTitulo of
      tcSimples     : sTipoCobranca  := '1'; {Cobrança Simples (Sem Registro e Eletrônica com Registro)}
      tcVinculada   : sTipoCobranca  := '2'; {Cobrança Vinculada}
      tcCaucionada  : sTipoCobranca  := '3'; {Cobrança Caucionada (Eletrônica com Registro e Convencional com Registro)}
      tcDescontada  : sTipoCobranca  := '4'; {Cobrança Descontada (Eletrônica com Registro)}
    end;

    case ACBrBoleto.Cedente.TipoCarteira of
      tctSimples: sTipoCarteira := '2';
      tctRegistrada: sTipoCarteira := '1';
      else
       sTipoCarteira := '2';
    end;

    case ACBrBoleto.Cedente.TipoDocumento of
      Tradicional: sTipoDocto := '1';
      Escritural: sTipoDocto := '2';
    end;

    if sTipoDocto = '' then
      sTipoDocto := '1'; // Tradicional

    case ACBrBoleto.Cedente.ResponEmissao of
      tbBancoEmite :      sEmisBloq := '1';
      tbCliEmite :        sEmisBloq := '2';
      tbBancoReemite :    sEmisBloq := '4';
      tbBancoNaoReemite : sEmisBloq := '5';
    else
      sEmisBloq := '3'; // Banco pré-emite e Cliente Complementa
    end;

    if Trim(EspecieDoc)      = 'DM' then {DM - DUPLICATA MERCANTIL}
      sEspecie := '02'
    else if Trim(EspecieDoc) = 'DS' then {DS - DUPLICATA DE SERVICO}
      sEspecie := '04'
    else if Trim(EspecieDoc) = 'NP' then {NP - NOTA PROMISSORIA}
      sEspecie := '12'
    else if Trim(EspecieDoc) = 'NR' then {NR - NOTA PROMISSORIA RURAL}
      sEspecie := '13'
    else if Trim(EspecieDoc) = 'RC' then {RC - RECIBO}
      sEspecie := '17'
    else if Trim(EspecieDoc) = 'AP' then {AP – APOLICE DE SEGURO}
      sEspecie := '20'
    else if Trim(EspecieDoc) = 'CH' then {CH - CHEQUE}
      sEspecie := '97'
    else if Trim(EspecieDoc) = 'CH' then {ND - NOTA PROMISSORIA DIRETA}
      sEspecie := '98'
    else
    begin
      if not MatchText(EspecieDoc, ['02', '04', '12', '13', '17', '20', '97', '98']) then
        raise Exception.Create('Espécie de documento informada incorretamente!');

      sEspecie := EspecieDoc;
    end;

    if (ValorMoraJuros > 0) then
    begin
      STipoJuros := '1';  // Valor por dia
//      STipoJuros := '2';  // Taxa Mensal
      if DataMoraJuros <> 0 then
        sDataMoraJuros := FormatDateTime('ddmmyyyy', DataMoraJuros)
      else
        sDataMoraJuros := PadLeft('', 8, '0');
    end
    else
    begin
      sDataMoraJuros := PadLeft('', 8, '0');
      STipoJuros := '3'; // Isento
    end;

    if ValorDesconto > 0 then
    begin
      sTipoDesconto := '1'; // Valor fixo ate a data informada – Informar o valor no campo “valor de desconto a ser concedido”.
      if DataDesconto <> 0 then
      begin
        sDataDesconto := FormatDateTime('ddmmyyyy', DataDesconto);
        sTipoDesconto := '2';
      end
      else
      begin
        sTipoDesconto := '0'; // ISENTO
        sDataDesconto := PadLeft('', 8, '0');
      end;
    end
    else
    begin
      sTipoDesconto := '0'; // ISENTO
      sDataDesconto := PadLeft('', 8, '0');
    end;

    {Instruções}

    Instrucao1 := Trim(Instrucao1);
    Instrucao2 := Trim(Instrucao2);

    if (DataProtesto <> 0) and
       (DataProtesto > Vencimento) then
    begin
      if (Instrucao1 = '') then
        Instrucao1 := '1' // Protestar Dias Corridos
      else
      begin
        if not MatchText(Instrucao1, ['1', '2', '3']) then
          raise Exception.Create('Código de protesto informado incorretamente!');
      end;
      // Calcular os dias para protesto
      sDiasProtesto := PadLeft(IntToStr(Trunc(DataProtesto) - Trunc(Vencimento)), 2, '0');
    end
    else
    begin
      Instrucao1 := '0';  // Não protestar
      SDiasProtesto := '00';
    end;

    // Baixa/Devolução
    if (Instrucao2 = '') then
      Instrucao2 := '2' // NAO BAIXAR / NAO DEVOLVER
    else
    begin
      if not MatchText(Instrucao2, ['1', '2']) then
        raise Exception.Create('Código de Baixa/Devolução informado incorretamente!');
    end;

    sDiasBaixaDevol:= ifthen(DataBaixa > 0,
                             IntToStrZero(DaysBetween(Vencimento,DataBaixa),2),
                             '00');

    sTipoInscricao := PessoaToCod(Sacado.Pessoa);

    if Sacado.SacadoAvalista.CNPJCPF <> '' then
    begin
      aTipoInscricao := PessoaToCod(Sacado.SacadoAvalista.Pessoa)[1];
    end
    else
      aTipoInscricao:= '0';

    sEndereco := PadRight(Sacado.Logradouro + ' ' +
                      Sacado.Numero + ' ' +
                      Sacado.Complemento , 40, ' ');

    ISequencia := (ACBrBoleto.ListadeBoletos.IndexOf(ACBrTitulo) * 4) + 1;

    {SEGMENTO P}          // FEITO - Guilherme Henrique da Cruz Dias - 04/11/2016

              //CONTROLE
    Result := IntToStr(fpNumero)                                      + // 001 - 003 / Código do Banco na compensação
              '0001'                                                  + // 004 - 007 / Numero do lote remessa
              '3'                                                     + // 008 - 008 / Tipo de registro
              //SERVIÇO
              IntToStrZero(ISequencia ,5)                             + // 009 - 013 / Número seqüencial do registro no lote
              'P'                                                     + // 014 - 014 / Cód. Segmento do registro detalhe
              Space(1)                                                + // 015 - 015 / Reservado (uso Banco)
              sCodMovimento                                           + // 016 - 017 / Código de movimento remessa
              //CONTA CORRENTE
              MontarContaCorrente(ACBrBoleto.Cedente)                 + // 018 - 037 / dados do cliente (AgenciaContaCorrente)
              //
              '5'                                                     + // 038 - 038 / Serviço de classificação, direcionamento da cobrança
              '000'                                                   + // 039 - 041 / modalidade c/ correspondentes, modalidade de cobrança em bancos correspondentes
              Space(2)                                                + // 042 - 043 / Reservado (uso Banco)
              '110'                                                   + // 044 - 046 / Modalidade de cobrança (COBRANÇA EXPRESSA - BLOQUETO)
              PadLeft(OnlyNumber(NossoNumero) + OnlyNumber(sDigitoNossoNumero),fpTamanhoMaximoNossoNum,'0') + // 047 – 057 / Identificação do título no Banco (Nosso Número+digito)
              // CARACTERÍSTICA COBRANÇA
              sTipoCobranca                                           + // 058 - 058 / Tipo de cobrança (Código Carteira)
              sTipoCarteira                                           + // 059 - 059 / Forma de Cadastramento = 1 Registrada / 2 Sem Registro
              sTipoDocto                                              + // 060 - 060 / Tipo de documento
              sEmisBloq                                               + // 061 - 061 / Emissão de bloqueto
              '2'                                                     + // 062 - 062 / Distribuição do bloqueto (2 = Cliente Distribui)
              Space(15)                                               + // 063 - 077 / Nº do documento
              FormatDateTime('ddmmyyyy',Vencimento)                   + // 078 - 085 / Data de vencimento do título
              IntToStrZero(round(ValorDocumento * 100), 15)           + // 086 - 100 / Valor nominal do título
              '00000'                                                 + // 101 - 105 / Agência encarregada da cobrança
              PadRight(ACBrBoleto.Cedente.AgenciaDigito,1)            + // 106 - 106   / Dígito da Agência encarregada da cobrança
              sEspecie                                                + // 107 – 108 / Espécie do título
              'N'                                                     + // 109 - 109 / Identif. de título Aceito/Não Aceito
              FormatDateTime('ddmmyyyy',DataDocumento)                + // 110 - 117 / Data da emissão do título
              // JUROS
              STipoJuros                                              + // 118 - 118 / Código do juros de mora
              sDataMoraJuros                                          + // 119 - 126 / Data do juros de mora
              IntToStrZero(round(ValorMoraJuros * 100), 15)           + // 127 - 141 / Valor da mora/dia ou Taxa mensal
              // DESC 1
              sTipoDesconto                                           + // 142 - 142 / Código do desconto 1
              sDataDesconto                                           + // 143 - 150 / Data de desconto 1
              IntToStrZero(round(ValorDesconto * 100), 15)            + // 151 - 165 / Valor ou Percentual do desconto concedido
              //
              IntToStrZero(round(ValorIOF * 100), 15)                 + // 166 - 180 / Valor do IOF a ser recolhido
              IntToStrZero(round(ValorAbatimento * 100), 15)          + // 181 - 195 / Valor do abatimento
              PadRight(NossoNumero, 25)                               + // 196 - 220 / Identificação do título na empresa
              Instrucao1                                              + // 221 - 221 / Código para protesto
              sDiasProtesto                                           + // 222 - 223 / Número de dias para protesto
              Instrucao2                                              + // 224 - 224 / Código para Baixa/Devolução
              PadLeft(sDiasBaixaDevol,3,'0')                          + // 225 - 227 / Número de dias para Baixa/Devolução
              '09'                                                    + // 228 - 229 / Código da moeda
              Space(11)                                               ; // 230 – 240 / Reservado (uso Banco)
    {SEGMENTO P - FIM}

    Inc(ISequencia);
    {SEGMENTO Q}          // FEITO - Guilherme Henrique da Cruz Dias - 05/11/2016
    Result := Result + #13#10 +
              // CONTROLE
              IntToStr(fpNumero)                               + // 001 - 003 / Código do Banco na compensação (BANCO ABC)
              '0001'                                           + // 004 - 007 / Numero do lote remessa
              '3'                                              + // 008 - 008 / Tipo de registro
              // SERVIÇO
              IntToStrZero(ISequencia ,5)                      + // 009 - 013 / Número seqüencial do registro no lote
              'Q'                                              + // 014 - 014 / Cód. Segmento do registro detalhe
              Space(1)                                         + // 015 - 015 / Reservado (uso Banco) (CNAB)
              sCodMovimento                                    + // 016 - 017 / Código de movimento remessa
              // DADOS DO SACADO
              sTipoInscricao                                   + // 018 - 018 / Tipo de inscrição do sacado
              PadLeft(trim(OnlyNumber(Sacado.CNPJCPF)),15,'0') + // 019 - 033 / Número de inscrição do sacado
              PadRight(Trim(Sacado.NomeSacado), 40)            + // 034 - 073 / Nome sacado
              sEndereco                                        + // 074 - 113 / Endereço sacado
              PadRight(Trim(Sacado.Bairro), 15)                   + // 114 - 128 / Bairro sacado
              PadLeft(Copy(OnlyNumber(Sacado.CEP), 1, 5), 5, '0') + // 129 - 133 / Cep sacado
              PadLeft(Copy(OnlyNumber(Sacado.CEP), 6, 3), 3, '0') + // 134 - 136 / Sufixo do Cep do sacado
              PadRight(Trim(Sacado.Cidade), 15)                   + // 137 - 151 / Cidade do sacado
              Sacado.UF                                           + // 152 - 153 / Unidade da federação do sacado
              // SAC. / AVAL.
              aTipoInscricao                                        + // 154 - 154 / Tipo de inscrição sacador/avalista
              PadLeft(Sacado.SacadoAvalista.CNPJCPF, 15,'0')        + // 155 - 169 / Nº de inscrição sacador/avalista
              PadRight(Sacado.SacadoAvalista.NomeAvalista,40,' ')+ // 170 - 209 / Nome do sacador/avalista
              '000'                                            + // 210 – 212 / Código do banco (zeros)
              Space(20)                                        + // 213 – 232 / Identificação do título no Banco (Nosso Número+digito)
              Space(8)                                        ; // 233 – 240 / Reservado (uso Banco)
    {SEGMENTO Q - FIM}

    Inc(ISequencia);
    {SEGMENTO R}          // FEITO - Guilherme Henrique da Cruz Dias - 05/11/2016
    Result := Result + #13#10 +
              // CONTROLE
              IntToStr(fpNumero)                               + // 001 - 003 / Código do Banco na compensação (BANCO ABC)
              '0001'                                           + // 004 - 007 / Numero do lote remessa
              '3'                                              + // 008 - 008 / Tipo de registro
              // SERVIÇO
              IntToStrZero(ISequencia ,5)                      + // 009 - 013 / Número seqüencial do registro no lote
              'R'                                              + // 014 - 014 / Cód. Segmento do registro detalhe
              Space(1)                                         + // 015 - 015 / Reservado (uso Banco) (CNAB)
              sCodMovimento                                    + // 016 - 017 / Código de movimento remessa
              // DESC2
              sTipoDesconto                                              + // 018 - 018 / Código do desconto 2
              sDataDesconto                                              + // 019 - 026 / Data do desconto 2
              IntToStrZero(round(ValorDesconto * 100), 15)               + // 027 - 041 / Valor/Percentual a ser concedido
              // DESC3
              Space(24)                                                  + // 042 – 065 / Reservado (uso Banco) (Desconto 3)
              // MULTA
              '1'                                                        + // 066 - 066 / Código da multa
              sDataMoraJuros                                             + // 067 - 074 / Data da multa
              IntToStrZero(round(ValorDocumento * PercentualMulta), 15)  + // 075 - 089 / Valor/Percentual a ser aplicado
              //
              Space(10)                                                  + // 090 - 099 / Reservado (uso Banco)
              Space(40)                                                  + // 100 - 139 / Mensagem 3
              Space(40)                                                  + // 140 - 179 / Mensagem 4
              Space(20)                                                  + // 180 - 199 / Uso exclusivo FEBRABAN
              PadLeft('',8,'0')                                          + // 200 - 207 / Codigo Ocorrência Sacado
              PadLeft('',23,'0')                                         + // 208 - 230 / Dados para débito (em branco)
              '0'                                                        + // 231 - 231 / Aviso para débito automático
              PadLeft('',9,'0')                                          ; // 232 - 240 / Uso exclusivo FEBRABAN
    {SEGMENTO R - FIM}

    Inc(ISequencia);
    {SEGMENTO S}          // FEITO - Guilherme Henrique da Cruz Dias - 05/11/2016
    Result := Result + #13#10 +
              // CONTROLE
              IntToStr(fpNumero)                               + // 001 - 003 / Código do Banco na compensação (BANCO ABC)
              '0001'                                           + // 004 - 007 / Numero do lote remessa
              '3'                                              + // 008 - 008 / Tipo de registro
              // SERVIÇO
              IntToStrZero(ISequencia ,5)                      + // 009 - 013 / Número seqüencial do registro no lote
              'S'                                              + // 014 - 014 / Cód. Segmento do registro detalhe
              Space(1)                                         + // 015 - 015 / Reservado (uso Banco) (CNAB)
              sCodMovimento                                    + // 016 - 017 / Código de movimento remessa

              '1'                                              + // 018 - 018 / Identificação da impressão
              '01'                                             + // 019 - 020 / Nº da linha de impressão
              Space(140)                                       + // 021 - 160 / Mensagem
              '01'                                             + // 161 - 162 / Tipo de fonte (01 normal)
              Space(78)                                        ; // 163 - 240 / Reservado (uso Banco)
    {SEGMENTO S - FIM}

    Inc(ISequencia);
    {SEGMENTO Y-01}          // FEITO - Guilherme Henrique da Cruz Dias - 05/11/2016
    Result := Result + #13#10 +
              // CONTROLE
              IntToStr(fpNumero)                               + // 001 - 003 / Código do Banco na compensação (BANCO ABC)
              '0001'                                           + // 004 - 007 / Numero do lote remessa
              '3'                                              + // 008 - 008 / Tipo de registro
              // SERVIÇO
              IntToStrZero(ISequencia ,5)                      + // 009 - 013 / Número seqüencial do registro no lote
              'Y'                                              + // 014 - 014 / Cód. Segmento do registro detalhe
              Space(1)                                         + // 015 - 015 / Reservado (uso Banco) (CNAB)
              sCodMovimento                                    + // 016 - 017 / Código de movimento remessa
              '01'                                             + // 018 - 019 / Identificação registro opcional
              // DADOS DO SACADO
              sTipoInscricao                                   + // 020 - 020 / Tipo de inscrição do sacado
              PadLeft(trim(OnlyNumber(Sacado.CNPJCPF)),15,'0') + // 021 - 035 / Número de inscrição do sacado
              PadRight(Trim(Sacado.NomeSacado), 40)            + // 036 - 075 / Nome sacado
              sEndereco                                        + // 076 - 115 / Endereço sacado
              PadRight(Trim(Sacado.Bairro), 15)                + // 116 - 130 / Bairro sacado
              PadLeft(Copy(OnlyNumber(Sacado.CEP), 1, 5), 5, '0') + // 131 - 135 / Cep sacado
              PadLeft(Copy(OnlyNumber(Sacado.CEP), 6, 3), 3, '0') + // 136 - 138 / Sufixo do Cep do sacado
              PadRight(Trim(Sacado.Cidade), 15)                   + // 139 - 153 / Cidade do sacado
              Sacado.UF                                           + // 154 - 155 / Unidade da federação do sacado
              Space(85)                                        ; // 233 – 240 / Uso exclusivo FEBRABAN
    {SEGMENTO Y-01 - FIM}
  end;
end;

function TACBrBancoABC.GerarRegistroTrailler240(
  ARemessa: TStringList): String;
begin
   {REGISTRO TRAILER DO LOTE}             // FEITO - Guilherme Henrique da Cruz Dias - 03/11/2016
   Result:= IntToStrZero(fpNumero, 3)                                  + // 001 - 003 / Código do Banco na compensação
            '0001'                                                     + // 004 - 007 / Numero do lote remessa
            '5'                                                        + // 008 - 008 / Tipo de registro
            Space(9)                                                   + // 009 - 017 / Reservado (uso Banco)
            IntToStrZero((4 * (ARemessa.Count -1)) + 2, 6)             + // 018 - 023 / Quantidade de registros do lote
            space(217)                                                 ; // 024 - 240 / Reservado (uso Banco)

   {GERAR REGISTRO TRAILER DO ARQUIVO}    // FEITO - Guilherme Henrique da Cruz Dias - 03/11/2016
   Result:= Result + #13#10 +
            IntToStrZero(fpNumero, 3)                                  + // 001 - 003 / Código do Banco na compensação
            '9999'                                                     + // 004 - 007 / Numero do lote remessa
            '9'                                                        + // 008 - 008 / Tipo de registro
            space(9)                                                   + // 009 - 017 / Reservado (uso Banco)
            '000001'                                                   + // 018 - 023 / Quantidade de lotes do arquivo
            IntToStrZero((4 * (ARemessa.Count -1)) + 4, 6)             + // 024 - 029 / Quantidade de registros do arquivo
            '000000'                                                   + // 030 - 035 / Qtd de contas para conc. (preencher zeros)
            space(205)                                                 ; // 036 - 240 / Reservado (uso Banco)
end;

procedure TACBrBancoABC.LerRetorno240(ARetorno: TStringList);
var
  Titulo: TACBrTitulo;
  Linha, rCodigoCedente, rConvenio, rCedente, rAgencia, rAgenciaDigito, rConta, rContaDigito, rCNPJCPF : String;
  iLinha, iInicioData : Integer;
  procedure DoVerOcorrencia(AOcorrencia: string);
  var
    pMotivoRejeicao, CodMotivo, I: Integer;
  begin
    with Titulo.OcorrenciaOriginal do
    begin
      if MatchText(AOcorrencia, ['03', '26', '30'])  then
      begin
       pMotivoRejeicao:= 209;
       for I:= 0 to 4 do
       begin
         CodMotivo:= StrToIntDef(copy(Linha,pMotivoRejeicao,2),0);
         if CodMotivo > 0 then
         begin
           Titulo.MotivoRejeicaoComando.Add(copy(Linha, pMotivoRejeicao, 2));
           Titulo.DescricaoMotivoRejeicaoComando.Add(CodMotivoRejeicaoToDescricao(
                                                     Titulo.OcorrenciaOriginal.Tipo,CodMotivo));
         end;
         Inc(pMotivoRejeicao, 2);
       end;
       if AOcorrencia = '03' then
         Tipo:= toRetornoRegistroRecusado
       else if AOcorrencia = '26' then
         Tipo := toRetornoInstrucaoRejeitada
       else if AOcorrencia = '30' then
         Tipo := toRetornoAlteracaoDadosRejeitados;
      end
      else if MatchText(AOcorrencia, ['02', '06', '09', '11', '12', '13', '14'])  then
      begin
        Tipo := CodOcorrenciaToTipo(StrToInt(AOcorrencia));
      end
      else
      begin
        if AOcorrencia = '04' then
          Tipo := toRetornoTransferenciaCarteiraEntrada
        else if AOcorrencia = '05' then
          Tipo := toRetornoTransferenciaCarteiraBaixa
        else if AOcorrencia = '17' then
          Tipo := toRetornoLiquidadoAposBaixaOuNaoRegistro
        else if AOcorrencia = '19' then
          Tipo := toRetornoRecebimentoInstrucaoProtestar
        else if AOcorrencia = '20' then
          Tipo := toRetornoRecebimentoInstrucaoSustarProtesto
        else if AOcorrencia = '23' then
          Tipo := toRetornoEntradaEmCartorio
        else if AOcorrencia = '24' then
          Tipo := toRetornoRetiradoDeCartorio
        else if AOcorrencia = '25' then
          Tipo := toRetornoBaixaPorProtesto
        else if AOcorrencia = '27' then
          Tipo := toRetornoAlteracaoUsoCedente
        else if AOcorrencia = '28' then
          Tipo := toRetornoDebitoTarifas
        else if AOcorrencia = '29' then
          Tipo := toRetornoOcorrenciasDoSacado
        else if AOcorrencia = '32' then
          Tipo := toRetornoIOFInvalido
        else if AOcorrencia = '51' then
          Tipo := toRetornoTituloDDAReconhecidoPagador
        else if AOcorrencia = '52' then
          Tipo := toRetornoTituloDDANaoReconhecidoPagador
        else if AOcorrencia = '53' then
          Tipo := toRetornoTituloDDARecusadoCIP;
      end;
    end;
  end;
begin
  { RECEBE SEGMENTO 'T' E 'U', QUE SÃO MODELOS DE RETORNO }

  // Verificar se o retorno é do banco selecionado
  if StrToIntDef(copy(ARetorno.Strings[0], 1, 3),-1) <> Numero then
    raise Exception.create(ACBrStr(ACBrBanco.ACBrBoleto.NomeArqRetorno +
                           'não é um arquivo de retorno do banco' + sLineBreak + Nome));

//  rCodigoCedente := Copy(ARetorno[0], 53, 9);   //Não consta no layout Banco ABC
  rCedente       := Copy(ARetorno[0], 74, 30);
  rConvenio      := Copy(ARetorno[0], 34, 20);
  rAgencia       := Copy(ARetorno[0], 54, 5);
  rAgenciaDigito := Copy(ARetorno[0], 59, 1);
  rConta         := PadLeft(OnlyNumber(Copy(ARetorno[0], 60, 12)), fpTamanhoConta, '0');
  rContaDigito   := Copy(ARetorno[0], 72, 1);
  rCNPJCPF       := RightStr(OnlyNumber(Copy(ARetorno[0], 19, 14)), 14);


  with ACBrBanco.ACBrBoleto do
  begin
    if (not LeCedenteRetorno) and (rCNPJCPF <> OnlyNumber(Cedente.CNPJCPF)) then
       raise Exception.create(ACBrStr('CNPJ\CPF do arquivo inválido'));

    if (not LeCedenteRetorno) and ((rAgencia <> OnlyNumber(Cedente.Agencia)) or
        (rConta <> OnlyNumber(Cedente.Conta))) then
       raise Exception.Create(ACBrStr('Agencia\Conta do arquivo inválido'));

//    Cedente.CodigoCedente := rCodigoCedente;  //Não consta no layout Banco ABC
    Cedente.Convenio      := rConvenio;
    Cedente.Nome          := rCedente;
    Cedente.CNPJCPF       := rCnpjCpf;

    if StrToIntDef(copy(ARetorno[0], 18, 1), 0) = 1 then
      Cedente.TipoInscricao := pFisica
    else
      Cedente.TipoInscricao := pJuridica;

    Cedente.Agencia       := rAgencia;
    Cedente.AgenciaDigito := rAgenciaDigito;
    Cedente.Conta         := rConta;
    Cedente.ContaDigito   := rContaDigito;

    ACBrBanco.ACBrBoleto.ListadeBoletos.Clear;
  end;

  ACBrBanco.ACBrBoleto.NumeroArquivo := StrToIntDef(Copy(ARetorno[0],184,8),0);

  iInicioData := 192;
  ACBrBanco.ACBrBoleto.DataArquivo := StringToDateTimeDef(Copy(ARetorno[0],iInicioData  ,2)+'/'+
                                                          Copy(ARetorno[0],iInicioData+2,2)+'/'+
                                                          Copy(ARetorno[0],iInicioData+4,4),0, 'DD/MM/YYYY' );

  ACBrBanco.TamanhoMaximoNossoNum := 11;

  for iLinha := 1 to ARetorno.Count - 2 do
  begin
    Linha := ARetorno[iLinha];

    if copy(Linha, 14, 1) = 'T' then
      Titulo := ACBrBanco.ACBrBoleto.CriarTituloNaLista;

    with Titulo do
    begin
      if copy(Linha, 14, 1) = 'T' then
      begin
        NossoNumero          := Copy(Linha, 47, ACBrBanco.TamanhoMaximoNossoNum);
        SeuNumero            := Copy(Linha, 59, 15);
        NumeroDocumento      := Copy(Linha, 59, 15);
        Carteira             := Copy(Linha, 58, 1);
        ValorDocumento       := StrToFloatDef(copy(Linha, 82, 15), 0) / 100;
        ValorDespesaCobranca := StrToFloatDef(copy(Linha, 199, 15), 0) / 100;
        // Sacado
        if Copy(Linha, 133, 1) = '1' then
          Sacado.Pessoa := pFisica
        else
          Sacado.Pessoa := pJuridica;
        Sacado.CNPJCPF    := Trim(Copy(Linha, 14, 15));
        Sacado.NomeSacado := Trim(Copy(Linha, 149, 40));

        // Algumas ocorrências estão diferentes do cnab400, farei uma separada aqui
        DoVerOcorrencia(Copy(Linha, 16, 2));
      end
      else if copy(Linha, 14, 1) = 'U' then
      begin
        ValorDocumento      := max(ValorDocumento,StrToFloatDef(copy(Linha, 82, 15), 0) / 100);
        ValorMoraJuros      := StrToFloatDef(copy(Linha, 18, 15), 0) / 100;
        ValorDesconto       := StrToFloatDef(copy(Linha, 33, 15), 0) / 100;
        ValorAbatimento     := StrToFloatDef(copy(Linha, 48, 15), 0) / 100;
        ValorIOF            := StrToFloatDef(copy(Linha, 63, 15), 0) / 100;
        ValorRecebido       := StrToFloatDef(copy(Linha, 78, 15), 0) / 100;
        ValorOutrasDespesas := StrToFloatDef(copy(Linha, 108, 15), 0) / 100;
        ValorOutrosCreditos := StrToFloatDef(copy(Linha, 123, 15), 0) / 100;
        DataOcorrencia      := StringToDateTimeDef(Copy(Linha, 138, 2)+'/'+
                                                   Copy(Linha, 140, 2)+'/'+
                                                   Copy(Linha, 142,4),0, 'DD/MM/YYYY' );
        DataCredito := StringToDateTimeDef(Copy(Linha, 146, 2)+'/'+
                                           Copy(Linha, 148, 2)+'/'+
                                           Copy(Linha, 150,4),0, 'DD/MM/YYYY' );
      end;
    end;
  end;
end;

function TACBrBancoABC.TipoOcorrenciaToDescricao(const TipoOcorrencia: TACBrTipoOcorrencia): String;
var
 CodOcorrencia: Integer;
begin
  Result := '';
  CodOcorrencia := StrToIntDef(TipoOCorrenciaToCod(TipoOcorrencia),0);

  { Atribuindo Ocorrências divergêntes entre CNAB240 e CNAB400 }
  if (ACBrBanco.ACBrBoleto.LayoutRemessa = c240) then
  begin
    case CodOcorrencia of
      17: Result := '17-Liq. Após Baixa/Liq.Tít. não Registrado';
      24: Result := '24-Retirada de Cartório/Manutenção em Carteira';
      25: Result := '25-Protestado e Baixado';
      26: Result := '26-Instrução Rejeitada';
      51: Result := '51-Título DDA Reconhecido Pelo Sacado';
      52: Result := '52-Título DDA Não Reconhecido Pelo Sacado';
      53: Result := '53-Título DDA Recusado Pela CIP';
    end;
  end
  else
  begin
    case CodOcorrencia of
      17: Result := '17-Liquidado em Cartório';
      24: Result := '24-Custas de Cartório';
      25: Result := '25-Protestar Título';
      26: Result := '26-Sustar Protesto';
      35: Result := '35-Título DDA Reconhecido Pelo Sacado';
      36: Result := '36-Título DDA Não Reconhecido Pelo Sacado';
      37: Result := '37-Título DDA Recusado Pela CIP';
    end;
  end;

  if (Result <> '') then
    Exit;

  case CodOcorrencia of
    01: Result := '01-Título Não Existe';
    02: Result := '02-Entrada Tít.Confirmada';
    03: Result := '03-Entrada Tít.Rejeitada';
    04: Result := '04-Transf. de Carteira/Entrada';
    05: Result := '05-Transf. de Carteira/Baixa';
    06: Result := '06-Liquidação';
    07: Result := '07-Liquidação por Conta';
    08: Result := '08-Liquidação por Saldo';
    09: Result := '09-Baixa Automática';
    10: Result := '10-Tít.Baix.Conf.Instrução';
    11: Result := '11-Em Ser';
    12: Result := '12-Abatimento Concedido';
    13: Result := '13-Abatimento Cancelado';
    14: Result := '14-Prorrogação de Vencimento';
    15: Result := '15-Confirmação de Protesto';
    16: Result := '16-Tít.Já Baixado/Liquidado';
    19: Result := '19-Recebimento da Instrução Protesto';
    20: Result := '20-Recebimento da Instrução Não Protestar';
    21: Result := '21-Tít. Enviado a Cartório';
    22: Result := '22-Tít. Retirado de Cartório';
    23: Result := '23-Remessa a Cartório';
    27: Result := '27-Confirmação alt.de outros dados';
    28: Result := '28-Débito de tarifas e custas';
    29: Result := '29-Ocorrência do sacado';
    30: Result := '30-Alteração de dados rejeitada';
    32: Result := '32-Código IOF Inválido';
    38: Result := '38-Recebimento da Instrução Não Protestar'
  end;
end;

function TACBrBancoABC.CodOcorrenciaToTipo(const CodOcorrencia:
   Integer ) : TACBrTipoOcorrencia;
begin
  // DONE -oJacinto Junior: Ajustar para utilizar as ocorrências corretas.
  Result := toTipoOcorrenciaNenhum;

  { Atribuindo Ocorrências divergêntes entre CNAB240 e CNAB400 }
  if (ACBrBanco.ACBrBoleto.LayoutRemessa = c240) then
  begin
    case CodOcorrencia of
      17: Result := toRetornoLiquidadoAposBaixaOuNaoRegistro;
      24: Result := toRetornoRetiradoDeCartorio;
      25: Result := toRetornoProtestado;
      26: Result := toRetornoInstrucaoRejeitada;
      35: Result := toRetornoTituloDDAReconhecidoPagador;
      36: Result := toRetornoTituloDDANaoReconhecidoPagador;
      37: Result := toRetornoTituloDDARecusadoCIP;
    end;
  end
  else
  begin
    case CodOcorrencia of
      17: Result := toRetornoLiquidadoEmCartorio;
      24: Result := toRetornoCustasCartorio;
      25: Result := toRetornoRecebimentoInstrucaoProtestar;
      26: Result := toRetornoRecebimentoInstrucaoSustarProtesto;
      51: Result := toRetornoTituloDDAReconhecidoPagador;
      52: Result := toRetornoTituloDDANaoReconhecidoPagador;
      53: Result := toRetornoTituloDDARecusadoCIP;
    end;
  end;

  if (Result <> toTipoOcorrenciaNenhum) then
    Exit;

  case CodOcorrencia of
    01: Result := toRetornoTituloNaoExiste;
    02: Result := toRetornoRegistroConfirmado;
    03: Result := toRetornoRegistroRecusado;
    04: Result := toRetornoTransferenciaCarteiraEntrada;
    05: Result := toRetornoTransferenciaCarteiraBaixa;
    06: Result := toRetornoLiquidado;
    07: Result := toRetornoLiquidadoPorConta;
    08: Result := toRetornoLiquidadoSaldoRestante;
    09: Result := toRetornoBaixaAutomatica;
    10: Result := toRetornoBaixadoInstAgencia;
    11: Result := toRetornoTituloEmSer;
    12: Result := toRetornoAbatimentoConcedido;
    13: Result := toRetornoAbatimentoCancelado;
    14: Result := toRetornoVencimentoAlterado;
    15: Result := toRetornoProtestado;
    16: Result := toRetornoTituloJaBaixado;
    19: Result := toRetornoRecebimentoInstrucaoProtestar;
    20: Result := toRetornoRecebimentoInstrucaoSustarProtesto;
    21: Result := toRetornoEncaminhadoACartorio;
    22: Result := toRetornoRetiradoDeCartorio;
    23: Result := toRetornoEntradaEmCartorio;
    27: Result := toRetornoAlteracaoUsoCedente;
    28: Result := toRetornoDebitoTarifas;
    29: Result := toRetornoOcorrenciasDoSacado;
    30: Result := toRetornoAlteracaoDadosRejeitados;
    32: Result := toRetornoIOFInvalido;
    38: Result := toRetornoRecebimentoInstrucaoNaoProtestar;
  else
    Result := toRetornoOutrasOcorrencias;
  end;
end;

function TACBrBancoABC.TipoOCorrenciaToCod (
   const TipoOcorrencia: TACBrTipoOcorrencia ) : String;
begin
  case TipoOcorrencia of
    toRetornoTituloNaoExiste                   : Result := '01';
    toRetornoRegistroConfirmado                : Result := '02';
    toRetornoRegistroRecusado                  : Result := '03';
    toRetornoTransferenciaCarteiraEntrada      : Result := '04';
    toRetornoTransferenciaCarteiraBaixa        : Result := '05';
    toRetornoLiquidado                         : Result := '06';
    toRetornoLiquidadoPorConta                 : Result := '07';
    toRetornoLiquidadoSaldoRestante            : Result := '08';
    toRetornoBaixaAutomatica                   : Result := '09';
    toRetornoBaixadoInstAgencia                : Result := '10';
    toRetornoTituloEmSer                       : Result := '11';
    toRetornoAbatimentoConcedido               : Result := '12';
    toRetornoAbatimentoCancelado               : Result := '13';
    toRetornoVencimentoAlterado                : Result := '14';
    toRetornoProtestado                        : Result := '15';
    toRetornoTituloJaBaixado                   : Result := '16';
    toRetornoLiquidadoAposBaixaOuNaoRegistro   : Result := '17';
    toRetornoRecebimentoInstrucaoProtestar     : Result := '19';
    toRetornoRecebimentoInstrucaoSustarProtesto: Result := '20';
    toRetornoEntradaEmCartorio                 : Result := '23';
    toRetornoRetiradoDeCartorio                : Result := '24';
    toRetornoBaixaPorProtesto                  : Result := '25';
    toRetornoInstrucaoRejeitada                : Result := '26';
    toRetornoAlteracaoUsoCedente               : Result := '27';
    toRetornoDebitoTarifas                     : Result := '28';
    toRetornoOcorrenciasDoSacado               : Result := '29';
    toRetornoAlteracaoDadosRejeitados          : Result := '30';
    toRetornoIOFInvalido                       : Result := '32';
    toRetornoTituloDDAReconhecidoPagador       : Result := '51';
    toRetornoTituloDDANaoReconhecidoPagador    : Result := '52';
    toRetornoTituloDDARecusadoCIP              : Result := '53';
  else
    Result := '02';
  end;
end;

function TACBrBancoABC.COdMotivoRejeicaoToDescricao( const TipoOcorrencia:TACBrTipoOcorrencia ;CodMotivo: Integer) : String;
begin
  case CodMotivo of
    001: Result := '001-NOSSO NUMERO NAO NUMERICO';
    002: Result := '002-VALOR DO ABATIMENTO NAO NUMERICO';
    003: Result := '003-DATA VENCIMENTO NAO NUMERICA';
    004: Result := '004-CONTA COBRANCA NAO NUMERICA';
    005: Result := '005-CODIGO DA CARTEIRA NAO NUMERICO';
    006: Result := '006-CODIGO DA CARTEIRA INVALIDO';
    007: Result := '007-ESPECIE DO DOCUMENTO INVALIDA';
    008: Result := '008-UNIDADE DE VALOR NAO NUMERICA';
    009: Result := '009-UNIDADE DE VALOR INVALIDA';
    010: Result := '010-CODIGO PRIMEIRA INSTRUCAO NAO NUMERICA';
    011: Result := '011-CODIGO SEGUNDA INSTRUCAO NAO NUMERICA';
    012: Result := '012-VALOR DO TITULO EM OUTRA UNIDADE';
    013: Result := '013-VALOR DO TITULO NAO NUMERICO';
    014: Result := '014-VALOR DE MORA NAO NUMERICO';
    015: Result := '015-DATA EMISSAO NÃO NUMERICA';
    016: Result := '016-DATA DE VENCIMENTO INVALIDA';
    017: Result := '017-CODIGO DA AGENCIA COBRADORA NAO NUMERICA';
    018: Result := '018-VALOR DO IOC NAO NUMERICO';
    019: Result := '019-NUMERO DO CEP NAO NUMERICO';
    020: Result := '020-TIPO INSCRICAO NAO NUMERICO';
    021: Result := '021-NUMERO DO CGC OU CPF NAO NUMERICO';
    022: Result := '022-CODIGO OCORRENCIA INVALIDO';
    024: Result := '024-TOTAL PARCELA NAO NUMERICO';
    025: Result := '025-VALOR DESCONTO NAO NUMERICO';
    026: Result := '026-CODIGO BANCO COBRADOR INVALIDO';
    027: Result := '027-NUMERO PARCELAS CARNE NAO NUMERICO';
    028: Result := '028-NUMERO PARCELAS CARNE ZERADO';
    029: Result := '029-VALOR DE MORA INVALIDO';
    030: Result := '030-DT VENC MENOR DE 15 DIAS DA DT PROCES';
    039: Result := '039-PERFIL NAO ACEITA TITULO EM BCO CORRESP';
    041: Result := '041-AGENCIA COBRADORA NAO ENCONTRADA';
    042: Result := '042-CONTA COBRANCA INVALIDA';
    043: Result := '043-NAO BAIXAR,  COMPL. INFORMADO INVALIDO';
    044: Result := '044-NAO PROTESTAR, COMPL. INFORMADO INVALIDO';
    045: Result := '045-QTD DE DIAS DE BAIXA NAO PREENCHIDO';
    046: Result := '046-QTD DE DIAS PROTESTO NAO PREENCHIDO';
    047: Result := '047-TOT PARC. INF. NAO BATE C/ QTD PARC GER';
    048: Result := '048-CARNE COM PARCELAS COM ERRO';
    049: Result := '049-SEU NUMERO NAO CONFERE COM O CARNE';
    051: Result := '051-TITULO NAO ENCONTRADO';
    052: Result := '052-OCOR.  NAO ACATADA, TITULO  LIQUIDADO';
    053: Result := '053-OCOR. NAO ACATADA, TITULO BAIXADO';
    054: Result := '054-TITULO COM ORDEM DE PROTESTO JA EMITIDA';
    055: Result := '055-OCOR. NAO ACATADA, TITULO JA PROTESTADO';
    056: Result := '056-OCOR. NAO ACATADA, TIT. NAO VENCIDO';
    057: Result := '057-CEP DO SACADO INCORRETO';
    058: Result := '058-CGC/CPF INCORRETO';
    059: Result := '059-INSTRUCAO ACEITA SO P/ COBRANCA SIMPLES';
    060: Result := '060-ESPECIE DOCUMENTO NAO PROTESTAVEL';
    061: Result := '061-CEDENTE SEM CARTA DE PROTESTO';
    062: Result := '062-SACADO NAO PROTESTAVEL';
    063: Result := '063-CEP NAO ENCONTRADO NA TABELA DE PRACAS';
    064: Result := '064-TIPO DE COBRANCA NAO PERMITE PROTESTO';
    065: Result := '065-PEDIDO SUSTACAO JA SOLICITADO';
    066: Result := '066-SUSTACAO PROTESTO FORA DE PRAZO';
    067: Result := '067-CLIENTE NAO TRANSMITE REG. DE OCORRENCIA';
    068: Result := '068-TIPO DE VENCIMENTO INVALIDO';
    069: Result := '069-PRODUTO DIFERENTE DE COBRANCA SIMPLES';
    070: Result := '070-DATA PRORROGACAO MENOR QUE DATA VENCTO';
    071: Result := '071-DATA ANTECIPACAO MAIOR QUE DATA VENCTO';
    072: Result := '072-DATA DOCUMENTO SUPERIOR A DATA INSTRUCAO';
    073: Result := '073-ABATIMENTO MAIOR/IGUAL AO VALOR TITULO';
    074: Result := '074-PRIM. DESCONTO MAIOR/IGUAL VALOR TITULO';
    075: Result := '075-SEG. DESCONTO MAIOR/IGUAL VALOR TITULO';
    076: Result := '076-TERC. DESCONTO MAIOR/IGUAL VALOR TITULO';
    077: Result := '077-DESC. POR ANTEC. MAIOR/IGUAL VLR TITULO';
    078: Result := '078-NAO EXISTE ABATIMENTO P/ CANCELAR';
    079: Result := '079-NAO EXISTE PRIM. DESCONTO P/ CANCELAR';
    080: Result := '080-NAO EXISTE SEG. DESCONTO P/ CANCELAR';
    081: Result := '081-NAO EXISTE TERC. DESCONTO P/ CANCELAR';
    082: Result := '082-NAO EXISTE DESC. POR ANTEC. P/ CANCELAR';
    084: Result := '084-JA EXISTE SEGUNDO DESCONTO';
    085: Result := '085-JA EXISTE TERCEIRO DESCONTO';
    086: Result := '086-DATA SEGUNDO DESCONTO INVALIDA';
    087: Result := '087-DATA TERCEIRO DESCONTO INVALIDA';
    089: Result := '089-DATA MULTA MENOR/IGUAL QUE VENCIMENTO';
    090: Result := '090-JA EXISTE DESCONTO POR DIA ANTECIPACAO';
    091: Result := '091-JA EXISTE CONCESSAO DE DESCONTO';
    092: Result := '092-NOSSO NUMERO JA CADASTRADO';
    093: Result := '093-VALOR DO TITULO NAO INFORMADO';
    094: Result := '094-VALOR TIT. EM OUTRA MOEDA NAO INFORMADO';
    095: Result := '095-PERFIL NAO ACEITA VALOR TITULO ZERADO';
    096: Result := '096-ESPECIE DOCTO NAO PERMITE PROTESTO';
    097: Result := '097-ESPECIE DOCTO NAO PERMITE IOC ZERADO';
    098: Result := '098-DATA EMISSAO INVALIDA';
    099: Result := '099-REGISTRO DUPLICADO NO MOVIMENTO DIÁRIO';
    100: Result := '100-DATA EMISSAO MAIOR QUE A DATA VENCIMENTO';
    101: Result := '101-NOME DO SACADO NÃO INFORMADO';
    102: Result := '102-ENDERECO DO SACADO NÃO INFORMADO';
    103: Result := '103-MUNICIPIO DO SACADO NAO INFORMADO';
    104: Result := '104-UNIDADE DA FEDERACAO NAO INFORMADA';
    105: Result := '105-TIPO INSCRICAO NÃO EXISTE';
    106: Result := '106-CGC/CPF NAO INFORMADO';
    107: Result := '107-UNIDADE DA FEDERACAO INCORRETA';
    108: Result := '108-DIGITO CGC/CPF INCORRETO';
    109: Result := '109-VALOR MORA TEM QUE SER ZERO (TIT = ZERO)';
    110: Result := '110-DATA PRIMEIRO DESCONTO INVALIDA';
    111: Result := '111-DATA  DESCONTO NAO NUMERICA';
    112: Result := '112-VALOR DESCONTO NAO INFORMADO';
    113: Result := '113-VALOR DESCONTO INVALIDO';
    114: Result := '114-VALOR ABATIMENTO NAO INFORMADO';
    115: Result := '115-VALOR ABATIMENTO MAIOR VALOR TITULO';
    116: Result := '116-DATA MULTA NAO NUMERICA';
    117: Result := '117-VALOR DESCONTO MAIOR VALOR TITULO';
    118: Result := '118-DATA MULTA NAO INFORMADA';
    119: Result := '119-DATA MULTA MAIOR QUE DATA DE VENCIMENTO';
    120: Result := '120-PERCENTUAL MULTA NAO NUMERICO';
    121: Result := '121-PERCENTUAL MULTA NAO INFORMADO';
    122: Result := '122-VALOR IOF MAIOR QUE VALOR TITULO';
    123: Result := '123-CEP DO SACADO NAO NUMERICO';
    124: Result := '124-CEP SACADO NAO ENCONTRADO';
    126: Result := '126-CODIGO P. BAIXA / DEVOL. INVALIDO';
    127: Result := '127-CODIGO P. BAIXA / DEVOL. NAO NUMERICA';
    128: Result := '128-CODIGO PROTESTO INVALIDO';
    129: Result := '129-ESPEC DE DOCUMENTO NAO NUMERICA';
    130: Result := '130-FORMA DE CADASTRAMENTO NAO NUMERICA';
    131: Result := '131-FORMA DE CADASTRAMENTO INVALIDA';
    132: Result := '132-FORMA CADAST. 2 INVALIDA PARA CARTEIRA 3';
    133: Result := '133-FORMA CADAST. 2 INVALIDA PARA CARTEIRA 4';
    134: Result := '134-CODIGO DO MOV. REMESSA NAO NUMERICO';
    135: Result := '135-CODIGO DO MOV. REMESSA INVALIDO';
    136: Result := '136-CODIGO BCO NA COMPENSACAO NAO NUMERICO';
    138: Result := '138-NUM. LOTE REMESSA(DETALHE) NAO NUMERICO';
    140: Result := '140-COD. SEQUEC.DO REG. DETALHE INVALIDO';
    141: Result := '141-NUM. SEQ. REG. DO LOTE NAO NUMERICO';
    142: Result := '142-NUM.AG.CEDENTE/DIG.NAO NUMERICO';
    144: Result := '144-TIPO DE DOCUMENTO NAO NUMERICO';
    145: Result := '145-TIPO DE DOCUMENTO INVALIDO';
    146: Result := '146-CODIGO P. PROTESTO NAO NUMERICO';
    147: Result := '147-QTDE DE DIAS P. PROTESTO INVALIDO';
    148: Result := '148-QTDE DE DIAS P. PROTESTO NAO NUMERICO';
    149: Result := '149-CODIGO DE MORA INVALIDO';
    150: Result := '150-CODIGO DE MORA NAO NUMERICO';
    151: Result := '151-VL.MORA IGUAL A ZEROS P. COD.MORA 1';
    152: Result := '152-VL. TAXA MORA IGUAL A ZEROS P.COD MORA 2';
    154: Result := '154-VL. MORA NAO NUMERICO P. COD MORA 2';
    155: Result := '155-VL. MORA INVALIDO P. COD.MORA 4';
    156: Result := '156-QTDE DIAS P.BAIXA/DEVOL. NAO NUMERICO';
    157: Result := '157-QTDE DIAS BAIXA/DEV. INVALIDO P. COD. 1';
    158: Result := '158-QTDE DIAS BAIXA/DEV. INVALIDO P.COD. 2';
    160: Result := '160-BAIRRO DO SACADO NAO INFORMADO';
    161: Result := '161-TIPO INSC.CPF/CGC SACADOR/AVAL.NAO NUM.';
    162: Result := '162-INDICADOR DE CARNE NAO NUMERICO';
    163: Result := '163-NUM. TOTAL DE PARC.CARNE NAO NUMERICO';
    164: Result := '164-NUMERO DO PLANO NAO NUMERICO';
    165: Result := '165-INDICADOR DE PARCELAS CARNE INVALIDO';
    166: Result := '166-N.SEQ. PARCELA INV.P.INDIC. MAIOR 0';
    167: Result := '167-N. SEQ.PARCELA INV.P.INDIC.DIF.ZEROS';
    168: Result := '168-N.TOT.PARC.INV.P.INDIC. MAIOR ZEROS';
    169: Result := '169-NUM.TOT.PARC.INV.P.INDIC.DIFER.ZEROS';
    170: Result := '170-FORMA DE CADASTRAMENTO 2 INV.P.CART.5';
    199: Result := '199-TIPO INSC.CGC/CPF SACADOR.AVAL.INVAL.';
    200: Result := '200-NUM.INSC.(CGC)SACADOR/AVAL.NAO NUMERICO';
    201: Result := '201-ALT. DO CONTR. PARTICIPANTE INVALIDO';
    202: Result := '202-ALT. DO SEU NUMERO INVALIDA';
    218: Result := '218-BCO COMPENSACAO NAO NUMERICO (D3Q)';
    219: Result := '219-BCO COMPENSACAO INVALIDO (D3Q)';
    220: Result := '220-NUM. DO LOTE REMESSA NAO NUMERICO(D3Q)';
    221: Result := '221-NUM. SEQ. REG. NO LOTE (D3Q)';
    222: Result := '222-TIPO INSC.SACADO NAO NUMERICO (D3Q)';
    223: Result := '223-TIPO INSC.SACADO INVALIDO (D3Q)';
    224: Result := '224-NUM.INSC.SACADO NAO NUMERICO (D3Q)';
    225: Result := '225-NUM.INSC.SAC.INV.P.TIPO INSC.0 E 9(D3Q)';
    226: Result := '226-NUM.BCO COMPENSACAO NAO NUMERICO (D3R)';
    228: Result := '228-NUM. LOTE REMESSA NAO NUMERICO (D3R)';
    229: Result := '229-NUM. SEQ. REG. LOTE NAO NUMERICO (D3R)';
    246: Result := '246-COD.BCO COMPENSACAO NAO NUMERICO (D3S)';
    247: Result := '247-COD. BANCO COMPENSACAO INVALIDO (D3S)';
    248: Result := '248-NUM.LOTE REMESSA NAO NUMERICO (D3S)';
    249: Result := '249-NUM.SEQ.DO REG.LOTE NAO NUMERICO (D3S)';
    250: Result := '250-NUM.IDENT.DE IMPRESSAO NAO NUMERICO(D3S)';
    251: Result := '251-NUM.IDENT.DE IMPRESSAO INVALIDO (D3S)';
    252: Result := '252-NUM.LINHA IMPRESSA NAO NUMERICO(D3S)';
    253: Result := '253-COD.MSG. P.REC. SAC. NAO NUMERICO (D3S)';
    254: Result := '254-COD.MSG.P.REC.SACADO INVALIDO(D3S)';
    258: Result := '258-VL.MORA NAO NUMERICO P.COD=4(D3P)';
    259: Result := '259-CAD.TXPERM.SK.INV.P.COD.MORA=4(D3P)';
    260: Result := '260-VL.TIT(REAL).INV.P.COD.MORA = 1(DEP)';
    261: Result := '261-VL.OUTROS INV.P.COD.MORA = 1(D3P)';
  else
    Result := IntToStrZero(CodMotivo, 3) + ' - Outros Motivos';
  end;
end;

function TACBrBancoABC.PessoaToCod(const TipoInscricao : TACBrPessoa):String;
begin
  // '0'  =  Isento / Não Informado
  // '1'  =  CPF
  // '2'  =  CGC / CNPJ
  // '3'  =  PIS / PASEP
  // '9'  =  Outros
  case TipoInscricao of
    pFisica :   Result := '1';
    pJuridica : Result := '2';
    pOutras :   Result := '9';
  else
    Result := '0';
  end;
end;

end.


