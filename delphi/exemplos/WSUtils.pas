unit WSUtils;

interface

uses DBGrids, JvDBGrid, DBClient, Graphics, DB, Dialogs, Controls, StdCtrls, dxAlertWindow,
  {$IFDEF SERVICE_APPLICATION}
    SvcMgr,
  {$ELSE}
    ShellAPI, cxPC, cxStyles,
    frxClass, frxPrinter, ActnList, Printers,
    cxGridCustomTableView, cxGraphics, dxBar, cxDBEdit, cxCalendar,
  {$ENDIF}
  Forms, Windows, SysUtils, Classes, JvComCtrls, ComCtrls,
  Variants, DateUtils, Math, MaskUtils, ACBrUtil,
  SqlExpr, pcnConversao, Messages, Registry, Buttons, typInfo,
  ShlObj, IniFiles, ACBrCEP, DBXCommon, System.UITypes, System.Rtti, StrUtils,
  uUsuarios_Controller;

type
  TConsisteInscricaoEstadual  = function (const Insc, UF: AnsiString): Integer; stdcall;
  TVersaoDLL                  = function : Integer; stdcall;
  TExec = procedure of object;
  TModeloDFE = ( mNFe, mCTe, mNFSe, mMDFe, mEventoNFe, mEventoCTe, mEventoMDFe );

procedure OrdenaGrid(const Grid: TDBGrid; const Column: TColumn = nil);
procedure RestauraOrdem(const Grid: TDBGrid );
procedure MarcarTodos( Field : TField; NewValue : Variant );
function Acesso(Operacao,Permissoes: Integer;msg: Boolean) : Boolean;
procedure AbrirDataSet( ds : TDataSet );
procedure RefreshDataSet( ds : TDataSet; bSQLWaitCursor : Boolean = True );
function VersaoExe( Arquivo : string ): String;
procedure ExecutaPrograma(sExecutavel: string; const sParametros : string = '');
function KeyIsDown(const Key: integer): boolean;
function StrZero(Zeros:string;Quant:integer):String;
function ExtractNum( str: string) : String;
function ExtractLetter( str: string ) : String;
procedure DigitoEan13(var sCodigo: String);
function LimpaString( const s: String ): String;
procedure InativaControles( cOwner : TWinControl; InativarFilhos: Boolean = False; Inativar : Boolean = True );
function wsFileSize( const sFileName : string): Integer;
function CompletaData ( const sData : String; bFinal : Boolean = False ): string;
function GetStatusConferencia( const Conferencia : String ): string;
procedure GetCorStatusConferencia( const Conferencia, ControlaEmbalagem,
  Expedicao_Autorizado : String; var CorFonte, CorFundo : TColor; const BloqFin : string = '0' );
function GetStatusConferenciaNFE( const Conferencia : String ): string;
procedure GetCorStatusConferenciaNFE( const Conferencia : String; var CorFonte, CorFundo : TColor );
function FormatValue(Format : String; Value : Variant): String;
function GetNFeStatus( const iStatus : Integer ): string;
function GetTipoFone( const sTipoFone : string ): string;
function GetTipoContato( const sTipoContato : string ): string;
function Cripta(Arg1: Integer;Arg2: String) : String;
function WSRound(nValor : Double;nDecimais: Byte):Double;
function WSTrunc(nValor : Double;nDecimais: Byte):Double;
function Valida_CGC_CPF(var nDoc: String): Byte;
function VerifCGC_CPF(sCGC: String;eh_CPF: Boolean): Boolean;
function GetSituacaoNFE( const Situacao : String ): string;
function GetOrigemProduto ( const Origem : string ) : string;
function GetTpEventoCTe( iTpEventoCTe: Integer ): String;
procedure ExecMethod(OnObject: TObject; MethodName: string);
function AbreTransacao( Conn : TSQLConnection ): TDBXTransaction;
procedure FechaTransacao( Conn : TSQLConnection; Transacao: TDBXTransaction; Commit : Boolean );
function ValidaNomeArquivo( sFileName : String ): String;
function ExtractHtmlTag(const sHTML, sBeginTag, sEndTag: String) : string;
function ExtraiDDDTelefone(s: String): string;
function ExtraiTelefone(s: string):string;
function FormataTelefone(s: string): string;
function RemoveAspas( s: String ): String; // remove " (aspas) e ; (ponto e virgula) da string
function SecondsToString( iSegundos : Integer ): String; // Retorna no formato 3d 4h 2m 0s
procedure DeleteColumGrid( DBGrid : TDBGrid; FieldName : String ); // excluir uma coluna de uma grid
function DBGridColumnByName( DBGrid : TDBGrid; FieldName : string ): TColumn; // Retorna uma coluna de um dbgrid pelo nome
function GetStatusCadastro( const Status : string ): string; // retorna o status do cadastro detalhado
function Feriado(dData : TDateTime=0) : Boolean; // retorna os feriados fixos e moveis do ano
function DiaUtil( dData : TDateTime ) : Boolean; // Informa se a data informada � um dia util
function GetTpEventoNFe( sTpEventoNFe: String ): String;
procedure MakeRounded( Control : TWinControl );
function GetSQLConnection( sConnectionName : string = 'SQLConnection1'; sDMName : String = 'DM' ): TSQLConnection;
procedure SetCampoConfig( FieldName: string ; Value : Variant);
procedure FormataCampo( Campo : TNumericField; Mascara : String );
function DecimaisVlrUnit: Integer;
function MascaraDecimaisVlrUnit: String;
function MascaraDecimaisVlrUnitFast: String;
function GetCampoConfig( FieldName: string ): TField;
function GetUsuario: TUsuario;
procedure AtualizarUsuario;
procedure CriarUsuario;
procedure LimparUsuario;
function ArredInteligente( nValor : Double; nFator: Double; bArredParaCima: Boolean): Double;
function StrEmptyToNull( s : String ) : Variant;
function GetCTeStatus( const iStatus : Integer ): string;
procedure DeleteFieldByName ( DataSet : TDataSet; sFieldName: string );
function FormataXMLString( const sTexto : String ) : String;
function GeraID_Mov_NSerie: Integer;
function GeraID_Erros_Expedicao: Integer;
function PAD(Text: String; Size: Integer; FillChar: String = ' '): String;
function PADL(Text: String; Size: Integer; FillChar: Char = ' '): String;
function PADC(Text: String; Size: Integer; FillChar: Char = ' '): String;
function GetEndEstoque( sEndereco : String ): String;
function GetTipoTribIPI( sTipo : String ): String;
function GetTipoOcorrenciaCobranca( sOcorrencia : String ): String;
function RemoveAcentos( s : String; sSubsTituiPor : String = '' ) : String;
function DataHoraServidor: TDateTime;
function GetTipoBloqFaturamento( const sTipo : string): String;
function GeraProxNum( Documento : string; Incremento : Integer = 1; con: TSQLConnection = nil): Integer;
procedure SetProxNum( Documento : string; Valor : Integer; con: TSQLConnection = nil);
function VarIsNumber( const Value : Variant ): Boolean;
function VarToFloatDef( const Value : Variant; Default : Double = 0 ): Double;
function DateString(dData: TDateTime): String;
function CmToPixel(nCm : Double): Integer;
function PixelToCM(nPixels : Integer): Double;
function VerificaIE(const sIE, sUF: string): Boolean;
function GetSpecialFolder(const CSIDL : integer) : string;
function Formatar(Texto : string; TamanhoDesejado : integer; AcrescentarADireita : boolean = true; CaracterAcrescentar : char = ' ') : string;
function GetTipoEndereco( const sTipoEnd : string ): string;
function SomaDiasUteis(dData: TDateTime; iDias: Integer) : TDateTime;
function CalculaDVCorreio( sCodigo: string) : String;
function Dias_Uteis(const DataI,DataF:TDateTime): Integer;
function GetClassificacaoCli( const sClassific : string): String;
function GetTipoDocFiscal( iModeloNF : Integer ): String;
function BoolToChar( bValor : Boolean ): string;
function GetStatusPedidoCompra( const sStatus : String ): String;
function ConditionalDefined( sDefine : String ): Boolean;
function Gen_ID(Generator: string; Increment : Integer = 1; con: TSQLConnection = nil): Integer;
function DiretorioTemporario : string;
function SitConfToStr(Situacao: String): String;
function TpeToSitConf(tp : TpcnTpEvento) : Integer;
function SitNFeToStr(Situacao: String): String;
function SeparaNCM( var sNCM : String; iID_NCM : Integer = 0 ) : string;
function IntToBool( iValue: Integer): Boolean;
function BoolToInt( bValue: Boolean ): Integer;
function IntToBoolDef( iValue: Integer; bPadrao : Boolean): Boolean;
function TempoAsStr( nSegundos : Double ): String;
function GetLocalEstoque( const LocalEstoque : Variant ) : string;
function WSModDouble( Dividendo : Double; Divisor : Double ): Double;
function PrecoLiqProduto(const Preco, Desc1, Desc2, Desc3, Desc4, Desc5, Desc6: Double): Double;
function AlteraLinhaSelect(sSql : string; sIdLinha : String; sNovaLinha: String) : String;
function IAmAConsoleApp: Boolean;
function Instanciar(const Str_Class: TValue): TObject;
function StrIsBool(text : String) : Boolean;
procedure IgnoreMethod( Instance: TObject; const PropName: string; CallBack : TProc);
procedure KeepBookmark(DataSet: TDataSet; CallBack : TProc);
procedure DisableControlsForThis(DataSet: TDataSet; CallBack : TProc);


{$IFNDEF SERVICE_APPLICATION}
  function GetCorStatusConferenciaCx( const Conferencia, ControlaEmbalagem, Expedicao_Autorizado : String; const BloqFin : string = '0' ) : TcxStyle;
  function GetCorStatusConferenciaNFEcx( const Conferencia : String ): TcxStyle;
  procedure CriarAbaMainForm( InstanceClass : TComponentClass; var Reference;
    Active : Boolean = False ; HighLight : Boolean = False);
  procedure AddLog( Texto : string ; slLog : TStrings = nil; sFilename : String = '';
    iMaxLinhas : Integer = 5000);
  function RevealHint( Control: TControl ): THintWindow;
  procedure RemoveHint( var Hint : THintWindow );
  procedure AcessaTelaCadastro(sFormName: String; Campo: TField = nil);
  procedure AcessaTelaCadastroStr(sFormName: String; Campo: string);
  procedure GetFileInfo(AExt : string; var AInfo : TSHFileInfo; ALargeIcon : boolean = false);
  function GetPermissoesUsuario( IDUsuario : Integer; Formulario : String ): Integer; overload;
  function GetPermissoesUsuario( sUsuario : string; Formulario : String ): Integer; overload;
  procedure ValidaID(ds: TDataSet; sTabela: String; sCampo: String; bGeraAutoNumeracao: boolean = true);
  procedure ValidaIDComposto(ds: TDataSet; sTabela: String; sCampo1: String; sCampo2: String);
  function InputCombo(const ACaption, APrompt: string; const AList: TStrings;iIndex : Integer = 0): string;
  function GetCharSize(Canvas: TCanvas): TPoint;
  function GetTipoFrete( const sCodFrete : String ): String;
  function ValidaDataLancamento( Sender : TField; Acao : Integer ): Boolean; overload;
  function ValidaDataLancamento( Value : Variant; Acao : Integer ): Boolean; overload;
  function VerificaPrazoLancamento(Sender:TField):Boolean; overload;
  function VerificaPrazoLancamento(Value:Variant):Boolean; overload;
  function TemPermissao(NomeAction: String; TipoPermissao: Integer ): Boolean;
  function GetcxStyleByName( StyleName : string ): TcxStyle;
  function WSSelecionaImpressora(const sImpressora : string = ''): String;
  // seleciona impressoras para relatorios criados com fast report
  function WSSelecionaImpressoraFR(const sImpressora : string = ''): String;
  // le configura��o de impressora para (pedido, pedidobobina e NotaFiscal)
  procedure WSGetPrinter(const sSecao: string; var sImpressora: String;
    var iCopias : Integer; var iFiltro : Integer); overload;
  procedure WSGetPrinter(const sSecao: string; var sImpressora: String); overload;
  // grava configura��o de impressora para (pedido, pedidobobina e NotaFiscal)
  procedure WSSetPrinter(const sSecao, sImpressora: string; iCopias: Integer; iFiltro : Integer=1);
  procedure VerificaAliqICMS;
  function GeraVencimentoAliqICMS : TDate;
  function ModeloDFe( XML : String ): TModeloDFE;
  function GetSituacaoOrcamento( const Situacao : String ): string;
  function IsMouseOverControl( Ctrl : TControl ): Boolean;
  function PermitePersonalizarCondPagto: Boolean;
  procedure DisableProcessWindowsGhosting;
  procedure ListarMenu( ItemLinks : TdxBarItemLinks ;
    var sl : TStringList ; Caminho : String ; Separador : String);
  procedure FinalizarAplicacao;
  procedure CxDateEditValidate(Sender : TObject; var DisplayValue : Variant; var Error : Boolean);
  procedure PreencherData(var Data : String; bDataHora : Boolean);
{$ENDIF}

var
  bBusca_Dinamica : Boolean;
  s_Versao_Sistema : string;
  s_Path_Servidor : String;
  s__Email : String; // Vari�vel utilizada no envio de e-mails pelo Fortes Report
  Myhint : THintWindow;

const
  ACESSA_GU = 8;
  INCLUI_GU = 16;
  ALTERA_GU = 32;
  CONSULTA_GU = 64;
  EXCLUI_GU = 128;
  LIQUIDA_GU = 256;
  IMPRIME_GU = 512;
  MascaraTelefone = '9999\-9999;0;_';
  SOFTWARE_HOUSE = 'WindSoft Sistemas - (17) 3215-6809';
  {$IFDEF WS_TRANSPEX}
    REGISTRY_SECTION = '\Software\WindSoft\WS-Transpex';
  {$ELSE}
    {$IFDEF WS_CAIXA}
      REGISTRY_SECTION = '\Software\WindSoft\WS-Caixa';
    {$ELSE}
      REGISTRY_SECTION = '\Software\WindSoft\WS-SisCom';
    {$ENDIF}
  {$ENDIF}
  {@const ScreenPPI - Resolu��o do monitor em pixels por polegada.
   Representa a quantidade de pixels por polegada do v�deo. O valor real varia de monitor para monitor mas,
   para facilitar c�lculos e tornar os projetos independentes do terminal, essa valor � assumido como sendo 96. :/}
  ScreenPPI=96;

  {@const InchAsMM - Fator de convers�o de polegada para mil�metros.
   Este fator � utilizado em diversos pontos para convers�es de coordenadas. :/}
  InchAsMM=254/10;

  {@const MMAsPixels - Fator de convers�o de mil�metros para pixels de tela.
   @links ScreenPPI, InchAsMM. :/}
  MMAsPixels=ScreenPPI/InchAsMM;

  // constants para se trabalhar com horas/minutos e segundos
  SEGUNDOS_DIA = ( 60 * 60 * 24 );
  SEGUNDOS_HORA = ( 60 * 60 );
  SEGUNDOS_MINUTO = 60;

implementation

uses uDB_Controller, uManipulaClasses;

procedure OrdenaGrid(const Grid: TDBGrid; const Column: TColumn);
var
  i : Integer;
  OldAggActive : Boolean;
  OldFiltered : Boolean;
  bIndexExist : Boolean;
  cdsGrid : TClientDataSet;
  index : integer;

  procedure LimpaIndice;
  var
    i : integer;
  begin
    // corrige a cor dos t�tulos das abas
    if ( Grid is TJvDBGrid ) and ( TJvDBGrid(Grid).UseXPThemes ) then
    begin
      ( Grid as TJvDBGrid ).SortMarker := smNone;
      ( Grid as TJvDBGrid ).SortedField := '';
    end
    else
    begin
      if ( Grid is TJvDBGrid ) then
          ( Grid as TJvDBGrid ).SortMarker := smNone;
    end;
    for i := 0 to Grid.Columns.Count -1 do
      Grid.Columns.Items[i].Title.Font.Style := Grid.Columns.Items[i].Title.Font.Style - [fsUnderline];

    cdsGrid.IndexName := '';
    cdsGrid.IndexDefs.Clear;
  end;

  procedure PintaTitulo(seta : TSortMarker);
  var
    i : integer;
  begin
    // limpa as colunas para poder pintar novamente
    for i := 0 to Grid.Columns.Count -1 do
      Grid.Columns.Items[i].Title.Font.Style := Grid.Columns.Items[i].Title.Font.Style - [fsUnderline];

    if ( Grid is TJvDBGrid ) then
    begin
      ( Grid as TJvDBGrid ).SortMarker := seta;
      ( Grid as TJvDBGrid ).SortedField := Column.FieldName;
    end;
    Column.Title.Font.Style := Column.Title.Font.Style + [fsUnderline];
  end;

begin
  OldAggActive := TClientDataSet( Grid.DataSource.DataSet ).AggregatesActive;
  OldFiltered := TClientDataSet( Grid.DataSource.DataSet ).Filtered;
  TClientDataSet( Grid.DataSource.DataSet ).DisableControls;
  TClientDataSet( Grid.DataSource.DataSet ).Filtered := False;

  try
    try
      // Desativa os campos aggregate para evitar erros de somatoria
      TClientDataSet( Grid.DataSource.DataSet ).AggregatesActive := False;

      cdsGrid := (Grid.DataSource.DataSet as TClientDataSet);

      if ( Assigned(Column) ) then
      begin
        try
          cdsGrid.IndexDefs.Find(Column.FieldName);
          bIndexExist := True;
        except
          bIndexExist := False;
        end;

        index := cdsGrid.IndexDefs.IndexOf(Column.FieldName);
        // verifica se existe indice e se o �ndice existente � do campo clicado
        if ( ( bIndexExist ) and ( cdsGrid.IndexDefs[index].Fields = Column.FieldName ) ) then
        begin
          // verifica se o indice DESC FOI CRIADO
          try
            cdsGrid.IndexDefs.Find(Column.FieldName+'DESC');
            bIndexExist := True;
          except
            bIndexExist := False;
          end;

          // se o indice decrescente n�o existir, cria
          if ( not bIndexExist ) then
          begin
            // cria o �ndice decrescente
            with cdsGrid.IndexDefs.AddIndexDef do
            begin
              Name := Column.FieldName+'DESC';
              Fields := Column.FieldName;
              Options := [ixDescending];
            end;
            cdsGrid.IndexName := Column.FieldName+'DESC';
            // modifica o visual da grid, mudando cor e �cone da coluna
            PintaTitulo(smUp);
          end
          else
          begin
            // se n�o, limpa os indices
            LimpaIndice;
          end;
        end
        else
        begin
          // se n�o existir �ndice: cria o �ndice
          // se existir, MAS n�o for do mesmo campo, exclui o �ndice e cria um novo
          LimpaIndice;
          // cria o �ndice normal
          with cdsGrid.IndexDefs.AddIndexDef do
          begin
            Name := Column.FieldName;
            Fields := Column.FieldName;
          end;
          cdsGrid.IndexName := Column.FieldName;
          // modifica o visual da grid, mudando cor e �cone da coluna
          PintaTitulo(smDown);
        end;
      end
      else
      begin
        LimpaIndice;
      end;
    finally
      cdsGrid.Filtered := OldFiltered;
      cdsGrid.EnableControls;
      cdsGrid.AggregatesActive := OldAggActive;
    end;
  except
  end;
end;

procedure RestauraOrdem(const Grid: TDBGrid );
var
  nCount : Integer;
begin
  try
    if ( (Grid.DataSource.DataSet as TClientDataSet).IndexFieldNames <> '' ) then
    begin
      for nCount := 0 to Grid.Columns.Count -1 do
      begin
        if ( ( Grid.DataSource.DataSet as TClientDataSet).IndexFieldNames = Grid.Columns.Items[nCount].FieldName ) then
        begin
          if ( Grid is TJvDBGrid ) then
          begin
            ( Grid as TJvDBGrid ).SortMarker := smDown;
            ( Grid as TJvDBGrid ).SortedField := Grid.Columns.Items[nCount].FieldName;
          end
          else
          begin
            Grid.Columns.Items[nCount].Title.Color := clSilver;
          end;
        end
      end;
    end;
  except
  end;
end;

procedure MarcarTodos( Field : TField; NewValue : Variant );
var
  bm : TBookmark;
  sOldIndex : string;
begin
  if not( Field.DataSet.Active ) then
    Exit;

  sOldIndex := TClientDataSet( Field.DataSet ).IndexFieldNames;
  TClientDataSet( Field.DataSet ).IndexFieldNames := '';
  bm := Field.DataSet.GetBookmark;
  try
    Field.DataSet.DisableControls;
    Field.DataSet.First;
    while not Field.DataSet.Eof do
    begin
      if ( Field.Value <> NewValue ) then
      begin
        if not ( Field.DataSet.State in [dsInsert, dsEdit] ) then
          Field.DataSet.Edit;
        Field.Value := NewValue;
        if ( Field.DataSet.State in [dsInsert, dsEdit] ) then
          Field.DataSet.Post;
      end;
      Field.DataSet.Next;
    end;
  finally
    Field.DataSet.GotoBookmark( bm );
    Field.DataSet.FreeBookmark( bm );
    TClientDataSet( Field.DataSet ).IndexFieldNames := sOldIndex;
    Field.DataSet.EnableControls;
  end;
end;

function Acesso(Operacao,Permissoes: Integer;msg: Boolean) : Boolean;
begin
  Acesso  := False;
  if ( Permissoes >= IMPRIME_GU ) then
  begin
    if ( Operacao = IMPRIME_GU ) then
      Acesso := True;
    Permissoes := ( Permissoes - IMPRIME_GU );
  end;
  if ( Permissoes >= LIQUIDA_GU ) then
  begin
    if ( Operacao = LIQUIDA_GU ) then
      Acesso := True;
    Permissoes := ( Permissoes - LIQUIDA_GU );
  end;
  if ( Permissoes >= EXCLUI_GU ) then
  begin
    if ( Operacao = EXCLUI_GU ) then
      Acesso := True;
    Permissoes := ( Permissoes - EXCLUI_GU );
  end;
  if ( Permissoes >= CONSULTA_GU ) then
  begin
    if ( Operacao = CONSULTA_GU ) then
      Acesso := True;
    Permissoes := ( Permissoes - CONSULTA_GU );
  end;
  if ( Permissoes >= ALTERA_GU ) then
  begin
    if ( Operacao = ALTERA_GU ) then
      Acesso := True;
    Permissoes := ( Permissoes - ALTERA_GU );
  end;
  if ( Permissoes >= INCLUI_GU ) then
  begin
    if ( Operacao = INCLUI_GU ) then
      Acesso := True;
    Permissoes := ( Permissoes - INCLUI_GU );
  end;
  if ( Permissoes >= ACESSA_GU ) then
  begin
    if ( Operacao = ACESSA_GU ) then
      Acesso := True;
    Permissoes := ( Permissoes - ACESSA_GU );
  end;
  if ( Result = False ) and msg then
    MessageDlg('Desculpe, voc� n�o est� autorizado!',mtWarning,[mbOk],0);
end;

procedure AbrirDataSet( ds : TDataSet );
var
  crOldCursor : TCursor;
  db : TDB;
  bAbriuTransacaoAqui : Boolean;
begin
  {$IFNDEF SERVICE_APPLICATION}
    crOldCursor := Screen.Cursor;
    Screen.Cursor := crSqlWait;
  {$ENDIF}
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
    {$IFNDEF SERVICE_APPLICATION}
      Screen.Cursor := crOldCursor;
    {$ENDIF}
  end;
end;

procedure RefreshDataSet( ds : TDataSet; bSQLWaitCursor : Boolean = True );
var
  crOldCursor : TCursor;
begin
  if not( ds.Active ) then
    AbrirDataSet( ds )
  else
  begin
    {$IFNDEF SERVICE_APPLICATION}
      crOldCursor := Screen.Cursor;
      if ( bSQLWaitCursor ) then
        Screen.Cursor := crSqlWait;
    {$ENDIF}
    try
      if ( ds.State in [dsInsert, dsEdit] ) then
        ds.Cancel;

      if ( ds is TClientDataSet ) then
      begin
        if ( TClientDataSet(ds).ChangeCount > 0 ) then
          TClientDataSet( ds ).CancelUpdates;
      end;

      ds.Refresh;
    finally
      {$IFNDEF SERVICE_APPLICATION}
        if ( bSQLWaitCursor ) then
          Screen.Cursor := crOldCursor;
      {$ENDIF}
    end;
  end;
end;

function VersaoExe( Arquivo : string ): String;
type
  PFFI = ^vs_FixedFileInfo;
var
  F : PFFI;
  Handle : Dword;
  Len : Longint;
  Data : Pchar;
  Buffer : Pointer;
  Tamanho : Dword;
  Parquivo: Pchar;
begin
  Parquivo := StrAlloc(Length(Arquivo) + 1);
  StrPcopy(Parquivo, Arquivo);
  Len := GetFileVersionInfoSize(Parquivo, Handle);
  Result := '';
  if Len > 0 then
  begin
    Data:=StrAlloc(Len+1);
    if GetFileVersionInfo(Parquivo,Handle,Len,Data) then
    begin
      VerQueryValue(Data, '\',Buffer,Tamanho);
      F := PFFI(Buffer);
      Result := Format('%d.%d.%d.%d',
        [HiWord(F^.dwFileVersionMs),
        LoWord(F^.dwFileVersionMs),
        HiWord(F^.dwFileVersionLs),
        Loword(F^.dwFileVersionLs)]);
    end;
    StrDispose(Data);
  end;
  StrDispose(Parquivo);
end;

procedure ExecutaPrograma(sExecutavel: string; const sParametros : string = '');
var
  Programa : array [0..512] of char;
  sPath : array[0..512] of char;
  StartupInfo : TStartupInfo;
  ProcessInfo : TProcessInformation;
begin
  if ( FileExists( sExecutavel ) ) then
  begin
    StrPCopy( sPath, ExtractFilePath( sExecutavel ) );
    if ( sParametros <> '' ) then
      sExecutavel := sExecutavel + ' ' + sParametros;
    StrPCopy (Programa, sExecutavel);
    FillChar (StartupInfo, Sizeof (StartupInfo), #0);
    StartupInfo.cb := sizeof (StartupInfo);
    StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
    StartupInfo.wShowWindow := SW_SHOWNORMAL;
    CreateProcess(nil, Programa, nil, nil, false, CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, nil, sPath , StartupInfo, ProcessInfo);
  end
  else
  begin
    MessageDlg('O programa '+ sExecutavel +#13+#10+'N�o foi encontrado!', mtWarning, [mbOK], 0);
  end;
end;

function KeyIsDown(const Key: integer): boolean;
begin
  Result := GetKeyState(Key) and 128 > 0;
end;


function StrZero(Zeros:string;Quant:integer):String;
{Insere Zeros � frente de uma string}
var
  i : Integer;
begin
  Zeros := Trim(Zeros);
  if ( Length(Zeros) > Quant ) then
    Zeros := Copy(Zeros,(Length(Zeros)-Quant)+1,Quant);
  Result:= Zeros;
  for i := Length(Zeros) to (Quant-1) do Result := '0'+Result;
end;


function ExtractNum( str: string) : String;
var
  i : Integer;
begin
  Result := '';
  for i := 1 to Length(str) do
  begin
    if ( str[i] in ['0'..'9'] ) then
      Result := Result + str[i];
  end;
end;

function ExtractLetter( str: string ) : String;
var
  i : Integer;
begin
  Result := '';
  for i := 1 to Length(str) do
  begin
    if ( str[i] in ['A'..'Z'] ) then
      Result := Result + str[i];
  end;
end;

procedure DigitoEan13(var sCodigo: String);
var
  i, iDigito, iSoma, iMulti : Integer;
begin
  sCodigo := ExtractNum(sCodigo);
  sCodigo := StrZero(Copy(sCodigo,1,12),12);
  iSoma := 0;
  iMulti := 1;
  for i := 1 to 12 do
  begin
    iSoma := iSoma + ( StrToInt(sCodigo[i]) * iMulti );
    if ( iMulti = 1 ) then
      iMulti := 3
    else
      iMulti := 1;
  end;
  iDigito := 10 - ( iSoma mod 10 );
  if ( iDigito > 9 ) then
    iDigito := 0;
  sCodigo := sCodigo + IntToStr(iDigito);
end;

function LimpaString( const s: String ): String;
begin
  Result := S;
  Result := StringReplace(Result,'|',' ',[rfReplaceAll]); // Limpa PIPEs
  Result := StringReplace(Result,#13,';',[rfReplaceAll]); // Limpa CR
  Result := StringReplace(Result,#10,';',[rfReplaceAll]); // Limpa LF
  Result := StringReplace(Result,#9,' ',[rfReplaceAll]); // Limpa TAB
  // limpa espa�os no inicio e no final
  Result := TrimLeft(TrimRight(Result));
end;

procedure InativaControles( cOwner : TWinControl; InativarFilhos: Boolean = False; Inativar : Boolean = True );
var
  i : Integer;
begin
  for i := 0 to cOwner.ControlCount -1 do
  begin
    if ( cOwner.Controls[i] is TControl ) then
      TControl(cOwner.Controls[i]).Enabled := not( Inativar );
    if ( cOwner.Controls[i] is TSpeedButton ) then
      TSpeedButton(cOwner.Controls[i]).Enabled := not( Inativar );
    if ( InativarFilhos ) then
    begin
      if ( cOwner.Controls[i] is TWinControl ) then
        InativaControles(TWinControl(cOwner.Controls[i]),InativarFilhos,Inativar);
    end;
  end;
end;

function wsFileSize( const sFileName : string): Integer;
var
  SR: TSearchRec;
  I: integer;
begin
  I := FindFirst(sFileName, faArchive, SR);
  try
    if I = 0 then
      Result := SR.Size
    else
      Result := -1;
  finally
    FindClose(SR);
  end;
end;

function CompletaData ( const sData : String; bFinal : Boolean ): string;
const
  HIni = '00';
  HFim = '23';
  MIni = '00';
  MFim = '59';
  SIni = '00';
  SFim = '59';
begin
  Result := sData;
  // Verifica se foi informada o mes
  if ( Trim(Copy(Result,4,2)) = '' ) then
    Result := Copy(Result,1,3)+FormatFloat('00',MonthOf(Date))+Copy(Result,6,13);
  // Verifica se foi informada o ano
  if ( Trim(Copy(Result,7,4)) = '' ) then
    Result := Copy(Result,1,6)+IntToStr(CurrentYear)+Copy(Result,11,8);

  // Verifica se foi informado a hora
  if ( Trim(Copy(Result,12,2)) = '' ) then
  begin
    if not( bFinal ) then
      Result := Copy(Result,1,11)+HIni+Copy(Result,14,6)
    else
      Result := Copy(Result,1,11)+HFim+Copy(Result,14,6);
  end;
  // Verifica se foi informado minutos
  if ( Trim(Copy(Result,15,2)) = '' ) then
  begin
    if not( bFinal ) then
      Result := Copy(Result,1,14)+MIni+Copy(Result,17,6)
    else
      Result := Copy(Result,1,14)+MFim+Copy(Result,17,6);
  end;
  // Verifica se foi informado segundos
  if ( Trim(Copy(Result,18,2)) = '' ) then
  begin
    if not( bFinal ) then
      Result := Copy(Result,1,17)+SIni
    else
      Result := Copy(Result,1,17)+SFim;
  end;
  try
    StrToDateTime(Result);
  except
    Result := '';
  end;
end;

function GetStatusConferencia( const Conferencia : String ): string;
begin
  Result := Conferencia;
  case  AnsiIndexStr(Conferencia,['I','R','N','s','S','c','C','e','E'])  of
    0 : Result := 'Enviado expedi��o';
    1 : Result := 'Retirado da expedi��o';
    2 : Result := 'N�o Conferido';
    3 : Result := 'Separando';
    4 : Result := 'Separado';
    5 : Result := 'Conferindo';
    6 : Result := 'Conferido';
    7 : Result := 'Embalando';
    8 : Result := 'Embalado';
  end;
end;

procedure GetCorStatusConferencia( const Conferencia, ControlaEmbalagem,
  Expedicao_Autorizado : String; var CorFonte, CorFundo : TColor; const BloqFin : string = '0' );
begin
  CorFonte := clWindowText;
  CorFundo := clWindow;

  // se o pedido est� bloqueado para faturamento n�o importa os demais status
  if ( BloqFin = '1' ) then
  begin
    CorFonte := clWhite;
    CorFundo := $003135C8;
  end
  else
  if (Conferencia = 'S') then
  begin
    CorFonte := clWhite;
    CorFundo := $000080FF;
  end
  else
  if (Conferencia = 's') then
  begin
    CorFonte := clWindowText;
    CorFundo :=   $0094D3FE;
  end
  else
  if (Conferencia = 'C') then
  begin
    if ( ControlaEmbalagem = '0' ) then
    begin
      CorFonte := clWhite;
      CorFundo := clGreen;
    end
    else
    begin
      CorFonte := clWindowText;
      CorFundo := clYellow;
    end;
  end
  else
  if (Conferencia = 'c') then
  begin
    if ( ControlaEmbalagem = '0' ) then
    begin
      CorFonte := clWindowText;
      CorFundo := $008CFF8C;
    end
    else
    begin
      CorFonte := clWindowText;
      CorFundo := $009FFFFB;
    end;
  end
  else
  if (Conferencia = 'E') then
  begin
    CorFonte := clWhite;
    CorFundo := clGreen;
  end
  else
  if (Conferencia = 'e') then
  begin
    CorFonte := clWindowText;
    CorFundo := $008CFF8C;
  end
  else
  begin
    if (Expedicao_Autorizado = '1') then
    begin
      CorFonte := clWindowText;
      CorFundo := $00F7E0D2;
    end;
  end;
end;

function FormatValue(Format : String; Value : Variant): String;
var
  n : Double;
begin
  n := 0;
  if ( Value <> null ) then
  begin
    try
      n := Value;
    except
      n := 0;
    end;
  end;
  Result := FormatFloat(Format,n);
end;

function GetNFeStatus( const iStatus : Integer ): string;
begin
  Result := '';
  case iStatus of
    -1 : Result := 'N�mero inexistente';
    0  : Result := 'N�o Enviada';
    100 : Result := '100-Autorizado o uso da NF-e';
    101 : Result := '101-Cancelamento de NF-e homologado';
    102 : Result := '102-Inutiliza��o de n�mero homologado';
    103 : Result := '103-Lote recebido com sucesso';
    104 : Result := '104-Lote processado';
    105 : Result := '105-Lote em processamento';
    106 : Result := '106-Lote n�o localizado';
    107 : Result := '107-Servi�o em Opera��o';
    108 : Result := '108-Servi�o Paralisado Momentaneamente (curto prazo)';
    109 : Result := '109-Servi�o Paralisado sem Previs�o';
    110 : Result := '110-Uso Denegado';
    111 : Result := '111-Consulta cadastro com uma ocorr�ncia';
    112 : Result := '112-Consulta cadastro com mais de uma ocorr�ncia';
    113 : Result := '113-SCAN ser� desabilitado para a UF �s hh:mm';
    114 : Result := '114-SCAN desabilitado pela SEFAZ Origem';
    128 : Result := '128-Lote de Evento Processado';
    135 : Result := '135-Evento registrado e vinculado a NF-e';
    136 : Result := '136-Evento registrado, mas n�o vinculado a NF-e';
    137 : Result := '137-Nenhum documento localizado para o Destinat�rio';
    138 : Result := '138-Documento localizado para o Destinat�rio';
    139 : Result := '139-Pedido de Download processado';
    140 : Result := '140-Download disponibilizado';
    150 : Result := '150-Autorizado o uso da NF-e';
    151 : Result := '151-Cancelamento de NF-e homologado fora de prazo';
    155 : Result := '155-Cancelamento de NF-e homologado fora de prazo';
    201 : Result := '201-Rejei��o: O numero m�ximo de numera��o de NF-e a inutilizar ultrapassou o limite';
    202 : Result := '202-Rejei��o: Falha no reconhecimento da autoria ou integridade do arquivo digital';
    203 : Result := '203-Rejei��o: Emissor n�o habilitado para emiss�o da NF-e';
    204 : Result := '204-Rejei��o: Duplicidade de NF-e';
    205 : Result := '205-Rejei��o: NF-e est� denegada na base de dados da SEFAZ';
    206 : Result := '206-Rejei��o: NF-e j� est� inutilizada na Base de dados da SEFAZ';
    207 : Result := '207-Rejei��o: CNPJ do emitente inv�lido';
    208 : Result := '208-Rejei��o: CNPJ do destinat�rio inv�lido';
    209 : Result := '209-Rejei��o: IE do emitente inv�lida';
    210 : Result := '210-Rejei��o: IE do destinat�rio inv�lida';
    211 : Result := '211-Rejei��o: IE do substituto inv�lida';
    212 : Result := '212-Rejei��o: Data de emiss�o NF-e posterior a data de recebimento';
    213 : Result := '213-Rejei��o: CNPJ-Base do Emitente difere do CNPJ-Base do Certificado Digital';
    214 : Result := '214-Rejei��o: Tamanho da mensagem excedeu o limite estabelecido';
    215 : Result := '215-Rejei��o: Falha no schema XML';
    216 : Result := '216-Rejei��o: Chave de Acesso difere da cadastrada';
    217 : Result := '217-Rejei��o: NF-e n�o consta na base de dados da SEFAZ';
    218 : Result := '218-Rejei��o: NF-e j� esta cancelada na base de dados da SEFAZ';
    219 : Result := '219-Rejei��o: Circula��o da NF-e verificada';
    220 : Result := '220-Rejei��o: Prazo de Cancelamento Superior ao Previsto na Legisla��o';
    221 : Result := '221-Rejei��o: Confirmado o recebimento da NF-e pelo destinat�rio';
    222 : Result := '222-Rejei��o: Protocolo de Autoriza��o de Uso difere do cadastrado';
    223 : Result := '223-Rejei��o: CNPJ do transmissor do lote difere do CNPJ do transmissor da consulta';
    224 : Result := '224-Rejei��o: A faixa inicial � maior que a faixa final';
    225 : Result := '225-Rejei��o: Falha no Schema XML da NFe';
    226 : Result := '226-Rejei��o: C�digo da UF do Emitente diverge da UF autorizadora';
    227 : Result := '227-Rejei��o: Erro na Chave de Acesso - Campo ID';
    228 : Result := '228-Rejei��o: Data de Emiss�o muito atrasada';
    229 : Result := '229-Rejei��o: IE do emitente n�o informada';
    230 : Result := '230-Rejei��o: IE do emitente n�o cadastrada';
    231 : Result := '231-Rejei��o: IE do emitente n�o vinculada ao CNPJ';
    232 : Result := '232-Rejei��o: IE do destinat�rio n�o informada';
    233 : Result := '233-Rejei��o: IE do destinat�rio n�o cadastrada';
    234 : Result := '234-Rejei��o: IE do destinat�rio n�o vinculada ao CNPJ';
    235 : Result := '235-Rejei��o: Inscri��o SUFRAMA inv�lida';
    236 : Result := '236-Rejei��o: Chave de Acesso com d�gito verificador inv�lido';
    237 : Result := '237-Rejei��o: CPF do destinat�rio inv�lido';
    238 : Result := '238-Rejei��o: Cabe�alho - Vers�o do arquivo XML superior a Vers�o vigente';
    239 : Result := '239-Rejei��o: Cabe�alho - Vers�o do arquivo XML n�o suportada';
    240 : Result := '240-Rejei��o: Cancelamento/Inutiliza��o - Irregularidade Fiscal do Emitente';
    241 : Result := '241-Rejei��o: Um n�mero da faixa j� foi utilizado';
    242 : Result := '242-Rejei��o: Cabe�alho - Falha no Schema XML';
    243 : Result := '243-Rejei��o: XML Mal Formado';
    244 : Result := '244-Rejei��o: CNPJ do Certificado Digital difere do CNPJ da Matriz e do CNPJ do Emit';
    245 : Result := '245-Rejei��o: CNPJ Emitente n�o cadastrado';
    246 : Result := '246-Rejei��o: CNPJ Destinat�rio n�o cadastrado';
    247 : Result := '247-Rejei��o: Sigla da UF do Emitente diverge da UF autorizadora';
    248 : Result := '248-Rejei��o: UF do Recibo diverge da UF autorizadora';
    249 : Result := '249-Rejei��o: UF da Chave de Acesso diverge da UF autorizadora';
    250 : Result := '250-Rejei��o: UF diverge da UF autorizadora';
    251 : Result := '251-Rejei��o: UF/Munic�pio destinat�rio n�o pertence a SUFRAMA';
    252 : Result := '252-Rejei��o: Ambiente informado diverge do Ambiente de recebimento';
    253 : Result := '253-Rejei��o: Digito Verificador da chave de acesso composta inv�lida';
    254 : Result := '254-Rejei��o: NF-e complementar n�o possui NF referenciada';
    255 : Result := '255-Rejei��o: NF-e complementar possui mais de uma NF referenciada';
    256 : Result := '256-Rejei��o: Uma NF-e da faixa j� est� inutilizada na Base de dados da SEFAZ';
    257 : Result := '257-Rejei��o: Solicitante n�o habilitado para emiss�o da NF-e';
    258 : Result := '258-Rejei��o: CNPJ da consulta inv�lido';
    259 : Result := '259-Rejei��o: CNPJ da consulta n�o cadastrado como contribuinte na UF';
    260 : Result := '260-Rejei��o: IE da consulta inv�lida';
    261 : Result := '261-Rejei��o: IE da consulta n�o cadastrada como contribuinte na UF';
    262 : Result := '262-Rejei��o: UF n�o fornece consulta por CPF';
    263 : Result := '263-Rejei��o: CPF da consulta inv�lido';
    264 : Result := '264-Rejei��o: CPF da consulta n�o cadastrado como contribuinte na UF';
    265 : Result := '265-Rejei��o: Sigla da UF da consulta difere da UF do Web Service';
    266 : Result := '266-Rejei��o: S�rie utilizada fora da faixa permitida no SCAN (0-889)';
    267 : Result := '267-Rejei��o: Chave de Acesso referenciada inexistente';
    268 : Result := '268-Rejei��o: NF Complementar referencia uma outra NF-e Complementar';
    269 : Result := '269-Rejei��o: CNPJ Emitente da NF Complementar difere do CNPJ da NF Referenciada';
    270 : Result := '270-Rejei��o: C�digo Munic�pio do Fato Gerador: d�gito inv�lido';
    271 : Result := '271-Rejei��o: C�digo Munic�pio do Fato Gerador: difere da UF do emitente';
    272 : Result := '272-Rejei��o: C�digo Munic�pio do Emitente: d�gito inv�lido';
    273 : Result := '273-Rejei��o: C�digo Munic�pio do Emitente: difere da UF do emitente';
    274 : Result := '274-Rejei��o: C�digo Munic�pio do Destinat�rio: d�gito inv�lido';
    275 : Result := '275-Rejei��o: C�digo Munic�pio do Destinat�rio: difere da UF do Destinat�rio';
    276 : Result := '276-Rejei��o: C�digo Munic�pio do Local de Retirada: d�gito inv�lido';
    277 : Result := '277-Rejei��o: C�digo Munic�pio do Local de Retirada: difere da UF do Local de Retirada';
    278 : Result := '278-Rejei��o: C�digo Munic�pio do Local de Entrega: d�gito inv�lido';
    279 : Result := '279-Rejei��o: C�digo Munic�pio do Local de Entrega: difere da UF do Local de Entrega';
    280 : Result := '280-Rejei��o: Certificado Transmissor inv�lido';
    281 : Result := '281-Rejei��o: Certificado Transmissor Data Validade';
    282 : Result := '282-Rejei��o: Certificado Transmissor sem CNPJ';
    283 : Result := '283-Rejei��o: Certificado Transmissor - erro Cadeia de Certifica��o';
    284 : Result := '284-Rejei��o: Certificado Transmissor revogado';
    285 : Result := '285-Rejei��o: Certificado Transmissor difere ICP-Brasil';
    286 : Result := '286-Rejei��o: Certificado Transmissor erro no acesso a LCR';
    287 : Result := '287-Rejei��o: C�digo Munic�pio do FG - ISSQN: d�gito inv�lido';
    288 : Result := '288-Rejei��o: C�digo Munic�pio do FG - Transporte: d�gito inv�lido';
    289 : Result := '289-Rejei��o: C�digo da UF informada diverge da UF solicitada';
    290 : Result := '290-Rejei��o: Certificado Assinatura inv�lido';
    291 : Result := '291-Rejei��o: Certificado Assinatura Data Validade';
    292 : Result := '292-Rejei��o: Certificado Assinatura sem CNPJ';
    293 : Result := '293-Rejei��o: Certificado Assinatura - erro Cadeia de Certifica��o';
    294 : Result := '294-Rejei��o: Certificado Assinatura revogado';
    295 : Result := '295-Rejei��o: Certificado Assinatura difere ICP-Brasil';
    296 : Result := '296-Rejei��o: Certificado Assinatura erro no acesso a LCR';
    297 : Result := '297-Rejei��o: Assinatura difere do calculado';
    298 : Result := '298-Rejei��o: Assinatura difere do padr�o do Projeto';
    299 : Result := '299-Rejei��o: XML da �rea de cabe�alho com codifica��o diferente de UTF-8';
    301 : Result := '301-Uso Denegado : Irregularidade fiscal do emitente';
    302 : Result := '302-Uso Denegado : Irregularidade fiscal do destinat�rio';
    303 : Result := '303-Uso Denegado : Destinat�rio n�o habilitado a operar na UF';
    304 : Result := '304-Rejei��o: Pedido de Cancelamento para NF-e com evento da Suframa';
    321 : Result := '321-Rejei��o: NF-e de devolu��o n�o possui conhecimento fiscal referenciado';
    322 : Result := '322-Rejei��o: NF-e de devolu��o com mais de um documento fiscal referenciado';
    323 : Result := '323-Rejei��o: CNPJ autorizado para download inv�lido';
    324 : Result := '324-Rejei��o: CNPJ do destinat�rio ja autorizado para download';
    325 : Result := '325-Rejei��o: CPF autorizado para download inv�lido';
    326 : Result := '326-Rejei��o: CPF do destinat�rio autorizado para download';
    327 : Result := '327-Rejei��o: CFOP inv�lido para NF-e com finalidade de devolu��o';
    328 : Result := '328-Rejei��o: CFOP inv�lido para NF-e que n�o tem finalidade de devolu��o';
    329 : Result := '329-Rejei��o: N�mero da DI/DSI inv�lido';
    330 : Result := '330-Rejei��o: Informar o valor da AFRMM na importa��o por via mar�tima';
    331 : Result := '331-Rejei��o: Informar o CNPJ do adquirente ou do encomendante nesta forma de importa��o';
    332 : Result := '332-Rejei��o: CNPJ do adquirente ou do encomendante da importa��o inv�lido';
    333 : Result := '333-Rejei��o: Informar a UF do adquirente ou do encomendante nesta forma de importa��o';
    334 : Result := '334-Rejei��o: N�mero do processo de drawback n�o informado na importa��o';
    335 : Result := '335-Rejei��o: N�mero do processo de drawback na importa��o inv�lido';
    336 : Result := '336-Rejei��o: Informado o grupo de exporta��o no item para CFOP que n�o � de exporta��o';
    337 : Result := '337-Rejei��o: N�o informado o grupo de exporta��o no item';
    338 : Result := '338-Rejei��o: N�mero de processo de drawback n�o informado na exporta��o';
    339 : Result := '339-Rejei��o: N�mero de processo de drawback na exporta��o inv�lido';
    340 : Result := '340-Rejei��o: N�o informado o grupo de exporta��o indireta no item';
    341 : Result := '341-Rejei��o: N�mero do registro de exporta��o inv�lido';
    342 : Result := '342-Rejei��o: Chave de acesso informada na exporta��o indireta com DV inv�lido';
    343 : Result := '343-Rejei��o: Modelo da NF-e informada na exporta��o indireta diferente de 55';
    344 : Result := '344-Rejei��o: Duplicidade de NF-e informada na exporta��o indireta (chave acesso informada mais de uma vez)';
    345 : Result := '345-Rejei��o: Chave de acesso informada na exporta��o indireta n�o consta como NF-e referenciada';
    346 : Result := '346-Rejei��o: Somat�rio quantidades informadas na exporta��o indireta n�o corresponde total do item';
    347 : Result := '347-Rejei��o: Descri��o do combust�vel diverge da descri��o adotada pela ANP';
    348 : Result := '348-Rejei��o: NFC-e com grupo RECOPI';
    349 : Result := '349-Rejei��o: N�mero RECOPI n�o informado';
    350 : Result := '350-Rejei��o: N�mero RECOPI inv�lido';
    351 : Result := '351-Rejei��o: Valor do ICMS da opera��o no ICMS-ST=51 difere do produto BC e al�quota';
    352 : Result := '352-Rejei��o: Valor do ICMS diferido no CST=51 difere do produto Valor ICMS opera��o e ICMS diferido';
    353 : Result := '353-Rejei��o: Valor do ICMS no CST=51 n�o corresponde a diferen�a do ICMS opera��o e ICMS diferido';
    354 : Result := '354-Rejei��o: Informado grupo de devolu��ode tributos para NF-e e que n�o tem finalidade de devolu��o';
    355 : Result := '355-Rejei��o: Informar o local de sa�da do pa�s no caso de exporta��o';
    356 : Result := '356-Rejei��o: Informar o clocal de sa�da do p�s somente no caso de exporta��o';
    357 : Result := '357-Rejei��o: Chave de acesso do grupo de exporta��o indireta inexistente';
    358 : Result := '358-Rejei��o: Chave de acesso no grupo de exporta��o indireta cancelada ou denegada';
    359 : Result := '359-Rejei��o: NF-e de venda a �rg�o p�blico sem informar a Nota de Empenho';
    360 : Result := '360-Rejei��o: NF-e com Nota de Empenho inv�lida para UF';
    361 : Result := '361-Rejei��o: NF-e com Nota de Empenho inexistente na UF';
    362 : Result := '362-Rejei��o: Venda de combust�vel sem informa��o do Transportador';
    363 : Result := '363-Rejei��o: Total do ISS difere do somat�rio dos itens';
    364 : Result := '364-Rejei��o: Total do valor da dedu��o do ISS difere do somat�rio dos itens';
    365 : Result := '365-Rejei��o: Total de outras reten��es difere do somat�rio dos itens';
    366 : Result := '366-Rejei��o: Total do desconto incondicionado do ISS difere do somat�rio dos itens';
    367 : Result := '367-Rejei��o: Total do desconto condicionado do ISS difere do somat�rio dos itens';
    368 : Result := '368-Rejei��o: Total do ISS retido difere do somat�rio dos itens';
    369 : Result := '369-Rejei��o: N�o informado o grupo avulsa na emiss�o pelo Fisco';
    370 : Result := '370-Rejei��o: Nota Fiscal Avusa com tipo de emiss�o inv�lido';
    401 : Result := '401-Rejei��o: CPF do remetente inv�lido';
    402 : Result := '402-Rejei��o: XML da �rea de dados com codifica��o diferente de UTF-8';
    403 : Result := '403-Rejei��o: O grupo de informa��es da NF-e avulsa � de uso exclusivo do Fisco';
    404 : Result := '404-Rejei��o: Uso de prefixo de namespace n�o permitido';
    405 : Result := '405-Rejei��o: C�digo do pa�s do emitente: d�gito inv�lido';
    406 : Result := '406-Rejei��o: C�digo do pa�s do destinat�rio: d�gito inv�lido';
    407 : Result := '407-Rejei��o: O CPF s� pode ser informado no campo emitente para a NF-e avulsa';
    409 : Result := '409-Rejei��o: Campo cUF inexistente no elemento nfeCabecMsg do SOAP Header';
    410 : Result := '410-Rejei��o: UF informada no campo cUF n�o � atendida pelo Web Service';
    411 : Result := '411-Rejei��o: Campo versaoDados inexistente no elemento nfeCabecMsg do SOAP Header';
    417 : Result := '417-Rejei��o: Total do ICMS superior ao valor limite estabelecido';
    418 : Result := '418-Rejei��o: Total do ICMS-ST superior ao limite estabelecido';
    420 : Result := '420-Rejei��o: Cancelamento para NF-e j� cancelada';
    450 : Result := '450-Rejei��o: Modelo da NF-e diferente de 55';
    451 : Result := '451-Rejei��o: Processo de emiss�o informado inv�lido';
    452 : Result := '452-Rejei��o: Tipo Autorizador do Recibo diverge do �rg�o Autorizador';
    453 : Result := '453-Rejei��o: Ano de inutiliza��o n�o pode ser superior ao Ano atual';
    454 : Result := '454-Rejei��o: Ano de inutiliza��o n�o pode ser inferior a 2006';
    461 : Result := '461-Rejei��o: Informado percentual de g�s natural na mistura para produto diferente de GLP';
    465 : Result := '465-Rejei��o: N�mero de controle da FCI inexistente';
    471 : Result := '471-Rejei��o: Informado NCM=00 indevidamente';
    478 : Result := '478-Rejei��o: Local da entrega n�o informado para faturamto direto de ve�culos novos';
    479 : Result := '479-Rejei��o: Emissor em situa��o irregular peranto o fisco';
    480 : Result := '480-Rejei��o: CNPJ da Chave de acesso da NF-e informada diverge do CNPJ do emitente';
    481 : Result := '481-Rejei��o: UF da Chave de acesso diverge do c�digo da UF informada';
    482 : Result := '482-Rejei��o: AA da Chave de acesso inv�lida';
    483 : Result := '483-Rejei��o: MM da Chave de acesso inv�lido';
    484 : Result := '484-Rejei��o: DPEC com tipo de emiss�o diferente de "4"(posi��o 35 da Chave de Acess';
    485 : Result := '485-Rejei��o: N�mero DPEC j� existe no cadastro de DPEC';
    486 : Result := '486-Rejei��o: DPEC n�o localizada para o n�mero de registro de DPEC informado';
    487 : Result := '487-Rejei��o: Nenhuma DPEC localizada para a chave de acesso informada';
    488 : Result := '488-Rejei��o: Requisitante de Consulta n�o tem o mesmo CNPJ base do emissor da DPEC';
    489 : Result := '489-Rejei��o: CNPJ informado inv�lido (DV ou zeros)';
    490 : Result := '490-Rejei��o: CPF informado inv�lido (DV ou zeros)';
    491 : Result := '491-Rejei��o: O tpEvento informado inv�lido';
    492 : Result := '492-Rejei��o: O verEvento informado inv�lido';
    493 : Result := '493-Rejei��o: Evento n�o atende o Schema XML espec�fico';
    494 : Result := '494-Rejei��o: Chave de Acesso inexistente';
    501 : Result := '501-Rejei��o: Verificar NFe autorizada h� mais de 30 dias (720) horas';
    502 : Result := '502-Rejei��o: Erro Chave Acesso - Campo Id � corresponde � conct. dos campos corresp';
    503 : Result := '503-Rejei��o: S�rie utilizada fora da faixa permitida no SCAN (900-999)';
    504 : Result := '504-Rejei��o: Data de Entrada/Sa�da posterior ao permitido';
    505 : Result := '505-Rejei��o: Data de Entrada/Sa�da anterior ao permitido';
    506 : Result := '506-Rejei��o: Data de Sa�da menor que a Data de Emiss�o';
    507 : Result := '507-Rejei��o: CNPJ destinat�rio/remetente � deve ser inform. em opera��o c/ exterior';
    508 : Result := '508-Rejei��o: CNPJ com conte�do nulo s� � v�lido em opera��o com exterior';
    509 : Result := '509-Rejei��o: Inform. c�d.munic�pio diferente de "9999999" para opera��o c/ exterior';
    510 : Result := '510-Rejei��o: Oper.c/ Exterior e C�d.Pa�s destinat�rio � 1058(Brasil) ou � informado';
    511 : Result := '511-Rejei��o: N�o � Oper.c/ Exterior e C�d.Pa�s destinat�rio difere de 1058 (Brasil)';
    512 : Result := '512-Rejei��o: CNPJ do Local de retirada inv�lido';
    513 : Result := '513-Rejei��o: C�digo Munic�pio Local Retirada deve ser 9999999 para UF retirada = EX';
    514 : Result := '514-Rejei��o: CNPJ do Local de Entrega inv�lido';
    515 : Result := '515-Rejei��o: C�digo Munic. do Local de Entrega deve ser 9999999 p/ UF entrega=EX';
    516 : Result := '516-Rejei��o: Falha no schema XML - inexiste a tag raiz esperada para a mensagem';
    517 : Result := '517-Rejei��o: Falha no schema XML - inexiste atributo versao na tag raiz da mensagem';
    518 : Result := '518-Rejei��o: CFOP de entrada para NF-e de sa�da';
    519 : Result := '519-Rejei��o: CFOP de sa�da para NF-e de entrada';
    520 : Result := '520-Rejei��o: CFOP de Opera��o com Exterior e UF destinat�rio difere de EX';
    521 : Result := '521-Rejei��o: CFOP n�o � de Opera��o com Exterior e UF destinat�rio � EX';
    522 : Result := '522-Rejei��o: CFOP de opera��o estadual e UF emitente <> da UF remetente contribuinte ICMS';
    523 : Result := '523-Rejei��o: CFOP n�o � de Opera��o Estadual e UF emitente igual a UF destinat�rio';
    524 : Result := '524-Rejei��o: CFOP de Opera��o com Exterior e n�o informado NCM';
    525 : Result := '525-Rejei��o: CFOP de Importa��o e n�o informado dados da DI';
    526 : Result := '526-Rejei��o: CFOP de Exporta��o e n�o informado Local de Embarque';
    527 : Result := '527-Rejei��o: Opera��o de Exporta��o com informa��o de ICMS incompat�vel';
    528 : Result := '528-Rejei��o: Valor do ICMS difere do produto BC e Al�quota';
    529 : Result := '529-Rejei��o: NCM de informa��o obrigat�ria para produto tributado pelo IPI';
    530 : Result := '530-Rejei��o: Opera��o com tributa��o de ISSQN sem informar a Inscri��o Municipal';
    531 : Result := '531-Rejei��o: Total da BC ICMS difere do somat�rio dos itens';
    532 : Result := '532-Rejei��o: Total do ICMS difere do somat�rio dos itens';
    533 : Result := '533-Rejei��o: Total da BC ICMS-ST difere do somat�rio dos itens';
    534 : Result := '534-Rejei��o: Total do ICMS-ST difere do somat�rio dos itens';
    535 : Result := '535-Rejei��o: Total do Frete difere do somat�rio dos itens';
    536 : Result := '536-Rejei��o: Total do Seguro difere do somat�rio dos itens';
    537 : Result := '537-Rejei��o: Total do Desconto difere do somat�rio dos itens';
    538 : Result := '538-Rejei��o: Total do IPI difere do somat�rio dos itens';
    539 : Result := '539-Rejei��o: Duplicidade de NF-e, com diferen�a na Chave de Acesso';
    540 : Result := '540-Rejei��o: CPF do Local de Retirada inv�lido';
    541 : Result := '541-Rejei��o: CPF do Local de Entrega inv�lido';
    542 : Result := '542-Rejei��o: CNPJ do Transportador inv�lido';
    543 : Result := '543-Rejei��o: CPF do Transportador inv�lido';
    544 : Result := '544-Rejei��o: IE do Transportador inv�lida';
    545 : Result := '545-Rejei��o: Falha schema XML - vers�o inform.na Dados do SOAPHeader difere da msg';
    546 : Result := '546-Rejei��o: Erro na Chave de Acesso - Campo Id - falta a literal NFe';
    547 : Result := '547-Rejei��o: D�gito Verificador da Chave de Acesso da NF-e Referenciada inv�lido';
    548 : Result := '548-Rejei��o: CNPJ da NF referenciada inv�lido.';
    549 : Result := '549-Rejei��o: CNPJ da NF referenciada de produtor inv�lido.';
    550 : Result := '550-Rejei��o: CPF da NF referenciada de produtor inv�lido.';
    551 : Result := '551-Rejei��o: IE da NF referenciada de produtor inv�lido.';
    552 : Result := '552-Rejei��o: D�gito Verificador da Chave de Acesso do CT-e Referenciado inv�lido';
    553 : Result := '553-Rejei��o: Tipo autorizador do recibo diverge do �rg�o Autorizador';
    554 : Result := '554-Rejei��o: S�rie difere da faixa 0-899';
    555 : Result := '555-Rejei��o: Tipo autorizador do protocolo diverge do �rg�o Autorizador';
    556 : Result := '556-Rejei��o: Justific.de entrada em conting.n�o deve ser informada p/tp.emis.normal';
    557 : Result := '557-Rejei��o: A Justificativa de entrada em conting�ncia deve ser informada';
    558 : Result := '558-Rejei��o: Data de entrada em conting�ncia posterior a data de emiss�o';
    559 : Result := '559-Rejei��o: UF do Transportador n�o informada';
    560 : Result := '560-Rejei��o: CNPJ base do emitente <> CNPJ base da primeira NF-e do lote recebido';
    561 : Result := '561-Rejei��o: M�s de Emiss�o informado na Chave de Acesso difere do M�s de Emiss�o d';
    562 : Result := '562-Rejei��o: C�digo Num�rico informado da Chave de Acesso <> C�digo Num�rico da NFe';
    563 : Result := '563-Rejei��o: J� existe pedido de Inutiliza��o com a mesma faixa de inutiliza��o';
    564 : Result := '564-Rejei��o: Total do Produto / Servi�o difere do somat�rio dos itens';
    565 : Result := '565-Rejei��o: Falha no schema XML - inexiste a tag raiz esperada para o lote de NF-e';
    567 : Result := '567-Rejei��o: Falha schema XML - vers�o inform.na Dados do SOAPHeader difere do lote';
    568 : Result := '568-Rejei��o: Falha schema XML inexiste atributo vers�o na tag raiz do lote de NF-e';
    569 : Result := '569-Rejei��o: Data de entrada em conting�ncia muito atrasada';
    570 : Result := '570-Rejei��o: Tipo de emiss�o 3, 6 e 7 s� � valido nas conting�ncis SCAN/SVC';
    571 : Result := '571-Rejei��o:  O tpEmis informado diferente de 3 para conting�ncia SCAN';
    572 : Result := '572-Rejei��o: Erro Atributo ID do evento erro concatena��o dos campos (�ID� + tpEvento + chNFe + nSeq)';
    573 : Result := '573-Rejei��o: Duplicidade de Evento';
    574 : Result := '574-Rejei��o: O autor do evento diverge do emissor da NF-e';
    575 : Result := '575-Rejei��o: O autor do evento diverge do destinat�rio da NF-e';
    576 : Result := '576-Rejei��o: O autor do evento n�o � um �rg�o autorizado a gerar o evento';
    577 : Result := '577-Rejei��o: A data do evento n�o pode ser menor que a data de emiss�o da NF-e';
    578 : Result := '578-Rejei��o: A data do evento n�o pode ser maior que a data do processamento';
    579 : Result := '579-Rejei��o: A data do evento n�o pode ser menor que a data de autoriza��o para NF-e n�o emitida em conting�ncia';
    580 : Result := '580-Rejei��o: O evento exige uma NF-e autorizada';
    587 : Result := '587-Rejei��o: Usar somente o namespace padr�o da NF-e';
    588 : Result := '588-Rejei��o: N�o � permitida a presen�a de caracteres de edi��o no in�cio/fim da mensagem ou entre as tags da mensagem';
    589 : Result := '589-Rejei��o: N�mero do NSU informado superior ao maior NSU da base de dados da SEFAZ';
    590 : Result := '590-Rejei��o: Informado CST para emissor do Simples Nacional';
    591 : Result := '591-Rejei��o: Informado CSOSN para emissor que n�o � do Simples Nacional (CRT diferente de 1)';
    592 : Result := '592-Rejei��o: A NF-e deve ter pelo menos um item de produto sujeito ao ICMS';
    593 : Result := '593-Rejei��o: CNPJ-Base consultado difere do CNPJ-Base do Certificado Digital';
    594 : Result := '594-Rejei��o: O n�mero de sequencia do evento informado � maior que o permitido';
    595 : Result := '595-Rejei��o: Rejei��o: A vers�o do leiaute da NF-e utilizada n�o � mais v�lida';
    596 : Result := '596-Rejei��o: Rejei��o: Ambiente de homologa��o indispon�vel para recep��o de NF-e da vers�o 1.10.';
    597 : Result := '597-Rejei��o: CFOP de Importa��o e n�o informado dados de IPI';
    598 : Result := '598-Rejei��o: NF-e emitida em ambiente de homologa��o com raz�o social <> de NF-e (Emitida homologa��o - S/vlr fiscal)';
    599 : Result := '599-Rejei��o: CFOP de Importa��o e n�o informado dados de II';
    600 : Result := '600-Rejei��o: CSOSN incompat�vel na opera��o com N�o contribuinte';
    601 : Result := '601-Rejei��o: Total do II difere do somat�rio dos itens';
    602 : Result := '602-Rejei��o: Total do PIS difere do somat�rio dos itens sujeitos ao ICMS';
    603 : Result := '603-Rejei��o: Total do COFINS difere do somat�rio dos itens sujeitos ao ICMS';
    604 : Result := '604-Rejei��o: Total do vOutro difere do somat�rio dos itens';
    605 : Result := '605-Rejei��o: Total do vServ difere do somat�rio do vProd dos itens sujeitos ao ISSQN';
    606 : Result := '606-Rejei��o: Total do vBC do ISS difere do somat�rio dos itens';
    607 : Result := '607-Rejei��o: Total do ISS difere do somat�rio dos itens';
    608 : Result := '608-Rejei��o: Total do PIS difere do somat�rio dos itens sujeitos ao ISSQN';
    609 : Result := '609-Rejei��o: Total do COFINS difere do somat�rio dos itens sujeitos ao ISSQN';
    610 : Result := '610-Rejei��o: Total da NF difere do somat�rio dos Valores comp�e o valor Total da NF';
    611 : Result := '611-Rejei��o: cEAN inv�lido';
    612 : Result := '612-Rejei��o: cEANTrib inv�lido';
    613 : Result := '613-Rejei��o: Chave de Acesso difere da existente em BD';
    614 : Result := '614-Rejei��o: Chave de Acesso inv�lida (C�digo UF inv�lido)';
    615 : Result := '615-Rejei��o: Chave de Acesso inv�lida (Ano < 05 ou Ano maior que Ano corrente)';
    616 : Result := '616-Rejei��o: Chave de Acesso inv�lida (M�s < 1 ou M�s > 12)';
    617 : Result := '617-Rejei��o: Chave de Acesso inv�lida (CNPJ zerado ou d�gito inv�lido)';
    618 : Result := '618-Rejei��o: Chave de Acesso inv�lida (modelo diferente de 55 e 65 )';
    619 : Result := '619-Rejei��o: Chave de Acesso inv�lida (n�mero NF = 0)';
    620 : Result := '620-Rejei��o: Chave de Acesso difere da existente em BD';
    621 : Result := '621-Rejei��o: CPF Emitente n�o cadastrado';
    622 : Result := '622-Rejei��o: IE emitente n�o vinculada ao CPF';
    623 : Result := '623-Rejei��o: CPF Destinat�rio n�o cadastrado';
    624 : Result := '624-Rejei��o: IE Destinat�rio n�o vinculada ao CPF';
    625 : Result := '625-Rejei��o: Inscri��o SUFRAMA deve ser informada na venda com isen��o para ZFM';
    626 : Result := '626-Rejei��o: O CFOP de opera��o isenta para ZFM diferente do previsto';
    627 : Result := '627-Rejei��o: O valor do ICMS desonerado deve ser informado';
    628 : Result := '628-Rejei��o: Total da NF superior ao valor limite estabelecido pela SEFAZ [Limite]';
    629 : Result := '629-Rejei��o: Vlr Produto difere do produto Valor Unit�rio de Comercializa��o e quantidade comercial';
    630 : Result := '630-Rejei��o: Vlr Produto difere do produto Valor Unit�rio de Tributa��o e quantidade tribut�vel';
    631 : Result := '631-Rejei��o: CNPJ-Base do Destinat�rio difere do CNPJ-Base do Certificado Digital';
    632 : Result := '632-Rejei��o: Solicita��o fora de prazo, a NF-e n�o est� mais dispon�vel para download';
    633 : Result := '633-Rejei��o: NF-e indispon�vel para download devido a aus�ncia de Manifesta��o do Destinat�rio';
    634 : Result := '634-Rejei��o: Destinat�rio da NF-e n�o tem o mesmo CNPJ raiz do solicitante do download';
    635 : Result := '635-Rejei��o: NF-e com mesmo n�mero e s�rie j� transmitida e aguardando processamento';
    650 : Result := '650-Rejei��o: Evento de "Ci�ncia da Opera��o" para NF-e Cancelada ou Denegada';
    651 : Result := '651-Rejei��o: Evento de "Desconhecimento da Opera��o" para NF-e Cancelada ou Denegada';
    653 : Result := '653-Rejei��o: NF-e Cancelada, arquivo indispon�vel para download';
    654 : Result := '654-Rejei��o: NF-e Denegada, arquivo indispon�vel para download';
    655 : Result := '655-Rejei��o: Evento de Ci�ncia da Opera��o informado ap�s a manifesta��o final do destinat�rio';
    656 : Result := '656-Rejei��o: Consumo indevido (repetidas tentativas de consulta da NFe). Aguarde 30 min antes de consultar novamente';
    657 : Result := '657-Rejei��o: C�digo do �rg�o diverge do �rg�o autorizador';
    658 : Result := '658-Rejei��o: UF do destinat�rio da Chave de Acesso diverge da UF autorizadora';
    660 : Result := '660-Rejei��o: CFOP de Combust�vel e n�o informado grupo de combust�vel da NF-e';
    661 : Result := '661-Rejei��o: NF-e j� existente para o n�mero da DPEC informada';
    662 : Result := '662-Rejei��o: Numera��o da DPEC est� inutilizada na Base de Dados da SEFAZ';
    663 : Result := '663-Rejei��o: Al�q. ICMS maior que 4% na sa�da interestadual com produtos importados';
    678 : Result := '678-Rejei��o: NF referenciada com UF diferente da UF da NF-e complementar';
    679 : Result := '679-Rejei��o: Modelo da NF-e referenciada diferente de 55';
    680 : Result := '680-Rejei��o: Duplicidade de NF-e referenciada (chave de acesso ref mais de uma vez)';
    681 : Result := '681-Rejei��o: Duplicidade de NF Modelo 1 referenciada (CNPJ, Modelo S�rie e N�mero)';
    682 : Result := '682-Rejei��o: Duplicidade de NF de produtor referenciada (IE, Modelo, S�rie e N�mero)';
    683 : Result := '683-Rejei��o: Modelo do CT-e referenciado diferente de 57';
    684 : Result := '684-Rejei��o: Duplicidade de Cupom Fiscal referenciado (Modelo, N�mero e Ordem e COO)';
    685 : Result := '685-Rejei��o: Total do valor aproximado dos tributos difere do somat�rio dos itens';
    686 : Result := '686-Rejei��o: NF complementar referencia uma NF-e cancelada';
    687 : Result := '687-Rejei��o: NF complementar referencia uma NF-e denegada';
    688 : Result := '688-Rejei��o: NF referenciada de produtor com IE inexistente (nREF: xxx)';
    689 : Result := '689-Rejei��o: NF referenciada de produtor com IE n�o vinculada ao CNPJ/CPF informado (nREF: xxx)';
    690 : Result := '690-Rejei��o: Pedido de cancelamento para NF-e com CT-e ou MDF-e';
    701 : Result := '701-Rejei��o: NF-e n�o pode utilizar ver�o 3.00';
    702 : Result := '702-Rejei��o: NFC-e n�o � aceita pela UF do Emitente';
    703 : Result := '703-Rejei��o: Data-hora de emiss�o posterior ao hor�rio de recebimento';
    704 : Result := '704-Rejei��o: NFC-e com data-hora de emiss�o atrasada';
    705 : Result := '705-Rejei��o: NFC-e com data de entrada/saida';
    706 : Result := '706-Rejei��o: NFC-e para opera��o de entrada';
    707 : Result := '707-Rejei��o: NFC-e para opera��o interestadual ou com o exterior';
    708 : Result := '708-Rejei��o: NFC-e nao pode referenciar um documento fiscal';
    709 : Result := '709-Rejei��o: NFC-e com formato de DANFE inv�lido';
    710 : Result := '710-Rejei��o: NF-e com formado de DANFE inv�lido';
    711 : Result := '711-Rejei��o: NF-e com conting�ncia off-line';
    712 : Result := '712-Rejei��o: NFC-e com conting�ncia off-line para a UF';
    713 : Result := '713-Rejei��o: Tipo de emiss�o diferente de 6 ou 7 para conting�ncia da SVC acessada';
    714 : Result := '714-Rejei��o: NFC-e com conting�ncia DPEC inexistente';
    715 : Result := '715-Rejei��o: NFC-e com finalidade inv�lida';
    716 : Result := '716-Rejei��o: NFC-e em opera�o� n�o destinada a consumidor final';
    717 : Result := '717-Rejei��o: NFC-e em opera��o n�o presencial';
    718 : Result := '718-Rejei��o: NFC-e n�o deve informar IE de substituto tribut�rio';
    719 : Result := '719-Rejei��o: NF-e sem identifica��o do destinat�rio';
    720 : Result := '720-Rejei��o: Na opera��o com exterior deve ser informada tag id Estrangeiro';
    721 : Result := '721-Rejie��o: Opera��o interestadual deve informar CNPJ ou CPF';
    722 : Result := '722-Rejei��o: Opera��o interna com idEstrangeiro informado deve ser presencial';
    723 : Result := '723-Rejei��o: Opera��o interna com idEstrangeiro informado deve ser para consumidor final';
    724 : Result := '724-Rejei��o: NF-e sem o nome do destinat�rio';
    725 : Result := '725-Rejei��o: NFC-e com CFOP inv�lido';
    726 : Result := '726-Rejei��o: NF-e sem a informa��o de endere�o do destinat�rio';
    727 : Result := '727-Rejei��o: Opera��o com exterior e UF diferente de EX';
    728 : Result := '728-Rejei��o: NF-e sem informa��o da IE do destinat�rio';
    729 : Result := '729-Rejei��o: NFC-e sem informa��o da IE do destinat�rio';
    730 : Result := '730-Rejei��o: NFC-e com inscri��o SUFRAMA';
    731 : Result := '731-Rejei��o: CFOP de opera��o com exterior e idDest <> 3';
    732 : Result := '732-Rejei��o: CFOP de opera��o com interestadual e idDest <> 2';
    733 : Result := '733-Rejei��o: CFOP de opera��o interna e idDest <> 1';
    734 : Result := '734-Rejei��o: NFC-e com unidade de comercializa��o inv�lida';
    735 : Result := '735-Rejei��o: NFC-e com unidade de tributa��o inv�lida';
    736 : Result := '736-Rejei��o: NFC-e com grupo de ve�culos novos';
    737 : Result := '737-Rejei��o: NFC-e com grupo de medicamentos';
    738 : Result := '738-Rejei��o: NFC-e com grupo de armamentos';
    739 : Result := '739-Rejei��o: NFC-e com grupo de combust�veis';
    740 : Result := '740-Rejei��o: NFC-e com CST 51 - diferimento';
    741 : Result := '741-Rejei��o: NFC-e com partilha de CIMS entre UF';
    742 : Result := '742-Rejei��o: NFC-e com grupo do IPI';
    743 : Result := '743-Rejei��o: NFC-e com grupo do II';
    745 : Result := '745-Rejei��o: NF-e sem grupo do PIS';
    746 : Result := '746-Rejei��o: NFC-e com grupo do PIS-ST';
    748 : Result := '748-Rejei��o: NF-e sem grupo do COFINS';
    749 : Result := '749-Rejei��o: NF-e sem grupo do COFINS-ST';
    750 : Result := '750-Rejei��o: NFC-e com valor total superior ao permitido para destinat�rio n�o identificado (c�digo)';
    751 : Result := '751-Rejei��o: NFC-e com valor total superior ao permitido para destinat�rio n�o identificado (nome)';
    752 : Result := '752-Rejei��o: NFC-e com valor total superior ao permitido para destinat�rio n�o identificado (endere�o)';
    753 : Result := '753-Rejei��o: NFC-e sem frete';
    754 : Result := '754-Rejei��o: NFC-e com dados do transportador';
    755 : Result := '755-Rejei��o: NFC-e com dados de reten��o do ICMS no transporte';
    756 : Result := '756-Rejei��o: NFC-e com dados do ve�culo de transporte';
    757 : Result := '757-Rejei��o: NFC-e com dados de reboque do ve�culo de transporte';
    758 : Result := '758-Rejei��o: NFC-e com dados do vag�o de transporte';
    759 : Result := '759-Rejei��o: NFC-e co dados da balsa de transporte';
    760 : Result := '760-Rejei��o: NFC-e com dados de cobran�a (fatura, duplicata)';
    762 : Result := '762-Rejei��o: NFC-e com dados de compra (empenho, pedido, contrato)';
    763 : Result := '763-Rejei��o: NFC-e com dados de aquisi��od e cana';
    765 : Result := '765-Rejei��o: Lote s� poder� conter NF-e ou NFC-e';
    766 : Result := '766-Rejei��o: NFC-e com CST 50-suspen��o';
    767 : Result := '767-Rejei��o: NFC-e com somat�rio dos pagamentos diferente do total da Nota Fiscal';
    768 : Result := '768-Rejei��o: NF-e n�o deve possuir o grupo de formas de pagamento';
    769 : Result := '769-Rejei��o: NFC-e deve possuir o grupo de formas de pagamento';
    771 : Result := '771-Rejei��o: Opera��o interestadual e UF de destino com EX';
    772 : Result := '772-Rejei��o: Opera��o interestadual e UF de destino igual � UF do emitente';
    773 : Result := '773-Rejei��o: Opera��o interna e UF de destino difere da UF do emitente';
    774 : Result := '774-Rejei��o: NFC-e com indicador de item n�o participante do total';
    775 : Result := '775-Rejei��o: Modelo da NFC-e diferente de 65';
    777 : Result := '777-Rejei��o: NFC-e deve informar NCM completo';
    778 : Result := '778-Rejei��o: Informado NCM inexistente';
    779 : Result := '779-Rejei��o:NFC-e com NCM incompat�vel';
    780 : Result := '780-Rejei��o: Total da NFC-e superior ao valor limite estabelecido pela SEFAZ';
    781 : Result := '781-Rejei��o: Emissor n�o habilitado para emiss�o de NFC-e';
    782 : Result := '782-Rejei��o: NFC-e n�o � autorizada pelo SCAN';
    783 : Result := '783-Rejei��o: NFC-e n�o � autorizada pelo SVC';
    784 : Result := '784-Rejei��o: NF-e com indicativo de NFC-e com entrega a domicilio';
    785 : Result := '785-Rejei��o: NFC-e com entrega a domicilio n�o permitida pela UF';
    786 : Result := '786-Rejei�ao: NFC-e de entrega a domicilio sem dados dos transportador';
    787 : Result := '787-Rejei��o: NFC-e de entrega a domicilio sem a identifica��o do destinat�rio';
    788 : Result := '788-Rejei��o: NFC-e de entrega a domic�lio sem o endere�o do destinat�rio';
    789 : Result := '789-Rejei��o: NFC-e para destinat�rio contribuinte de ICMS';
    790 : Result := '790-Rejei��o: Opera��o com exterior para destinat�rio contribuinte do ICMS';
    791 : Result := '791-Rejei��o: NF-e com indica��o de destinat�rio isento de IE, com a informa��o da IE do destinatario';
    792 : Result := '792-Rejei��o: Informada a IE do destinat�rio para opera��o com destinat�rio do exterior';
    793 : Result := '793-Rejei��o: Informado cap�tulo do NCM inexistente';
    999 : Result := '999-Rejei��o: Erro n�o catalogado';
  else
    Result := IntToStr(iStatus)+'-Status desconhecido';
  end;
end;

function GetTipoFone( const sTipoFone : string ): string;
begin
  Result := sTipoFone;
  try
    case sTipoFone[1] of
      'C' : Result := 'Comercial';
      'F' : Result := 'Fax';
      'M' : Result := 'Celular';
      'R' : Result := 'Residencial';
      'O' : Result := 'Outros';
    end;
  except
  end;
end;

function GetTipoContato( const sTipoContato : string ): string;
begin
  Result := sTipoContato;
  try
    case sTipoContato[1] of
      'C' : Result := 'Compras';
      'V' : Result := 'Vendas';
      'F' : Result := 'Financeiro';
      'N' : Result := 'XML NFe';
      'O' : Result := 'Outros';
    end;
  except
  end;
end;

function Cripta(Arg1: Integer;Arg2: String) : String;
{ Fun��o Cripta()
  Objetivo: Encriptar ou desencriptar uma string passada por
            Parametro.
  Parametros: Se Arg1 = 1 (encriptar string)
              Se Arg1 = 2 (desencriptar string)
              Arg2 = string a ser encriptada ou desencriptada
}
var
  Varia: Array[1..50] of integer;
  sVar,sVar2: String;
  sA : Char;
  iW : Integer;
begin
   varia[01]     := 5;
   varia[02]     := 3;
   varia[03]     := 4;
   varia[04]     := 2;
   varia[05]     := 1;
   varia[06]     := 8;
   varia[07]     := 1;
   varia[08]     := 6;
   varia[09]     := 7;
   varia[10]     := 8;
   varia[11]     := 8;
   varia[12]     := 4;
   varia[13]     := 2;
   varia[14]     := 3;
   varia[15]     := 4;
   varia[16]     := 5;
   varia[17]     := 6;
   varia[18]     := 5;
   varia[19]     := 5;
   varia[20]     := 6;
   varia[21]     := 6;
   varia[22]     := 7;
   varia[23]     := 7;
   varia[24]     := 5;
   varia[25]     := 7;
   varia[26]     := 3;
   varia[27]     := 5;
   varia[28]     := 4;
   varia[29]     := 5;
   varia[30]     := 3;
   varia[31]     := 5;
   varia[32]     := 2;
   varia[33]     := 3;
   varia[34]     := 8;
   varia[35]     := 9;
   varia[36]     := 2;
   varia[37]     := 1;
   varia[38]     := 2;
   varia[39]     := 3;
   varia[40]     := 5;
   varia[41]     := 4;
   varia[42]     := 3;
   varia[43]     := 6;
   varia[44]     := 7;
   varia[45]     := 7;
   varia[46]     := 2;
   varia[47]     := 3;
   varia[48]     := 4;
   varia[49]     := 3;
   varia[50]     := 2;
   sVar  := arg2;
   sVar2 := '';
   if (Arg1 = 1) then
   begin
      for iW := 1 to Length(Arg2) do
      begin
         sA := sVar[iW];
         sVar2 := sVar2 + Chr(Ord(sA)-varia[iW]);
      end;
   end
   else
   begin
      for iW := 1 to Length(Arg2) do
      begin
         sA := sVar[iW];
         sVar2 := sVar2 + Chr(Ord(sA)+varia[iW]);
      end;
   end;
   Cripta := sVar2;
end;

function WSRound(nValor : Double;nDecimais: Byte):Double;
var
   Pow, PowValue, RestPart, FracValue : Extended;
   IntCalc, FracCalc, LastNumber, IntValue : Int64;
   nValorAArredondar : Double;
   bValorNegativo : Boolean;
Begin
   // Utiliza uma variavel pois quando � passado uma express�o
   // para o valor ocorrem resultados inesperados
   nValorAArredondar := nValor;
   // O arredondamento n�o funciona bem com valores negativos
   // Passo o valor para positivo para torna-lo negativo ap�s arredondado
   bValorNegativo := ( nValorAArredondar < 0 );
   if ( bValorNegativo ) then
     nValorAArredondar := ( nValorAArredondar * -1 );

   Pow       := intpower(10, abs(nDecimais) );
   PowValue  := nValorAArredondar / 10 ;
   IntValue  := trunc(PowValue);
   FracValue := frac(PowValue);

   PowValue := SimpleRoundTo( FracValue * 10 * Pow, -9) ; // SimpleRoundTo elimina dizimas ;
   IntCalc  := trunc( PowValue );
   FracCalc := trunc( frac( PowValue ) * 100);

   if (FracCalc >= 50) then
      Inc( IntCalc );

   Result := ((IntValue*10) + (IntCalc / Pow));
   if ( bValorNegativo ) then
     Result := ( Result * -1 );
end;

function WSTrunc(nValor : Double;nDecimais: Byte):Double;
var
  n, nValorATruncar : Double;
  i : Integer;
begin
  n := 1;
  for i := 1 to nDecimais do
    n := ( n * 10 );

  // Utiliza uma variavel pois quando � passado uma express�o
  // para o valor ocorrem resultados inesperados
  nValorATruncar := nValor;

  Result := ( nValorATruncar * n );
  Result := TruncFix( Result ) /n;
end;

function Valida_CGC_CPF(var nDoc: String): Byte;
var
  r:Integer;
  xDoc: String;
begin
// RETORNOS
// 0 = INV�LIDO
// 1 = PESSOA JUR�DICA
// 2 = PESSOA F�SICA
// PASSA O C�DIGO POR REFER�NCIA NO PAR�METRO
  Valida_CGC_CPF := 0;
  xDoc  := '';
  for r := 1 to Length(nDoc) do
  begin
    if ( nDoc[r] in ['0'..'9'] ) then
      xDoc := xDoc + Copy(nDoc,r,1);
  end;
  if (Length(xDoc) = 11)  then // CPF
  begin
    if not VerifCGC_CPF(xDoc,True) then
      Valida_CGC_CPF := 0
    else
    begin
      nDoc       := FormatMaskText('999.999.999.999999;0;*',xDoc);
      Valida_CGC_CPF  := 2;
    end;
  end
  else if (Length(xDoc) = 14) then // CGC
  begin
    if not VerifCGC_CPF(xDoc,False) then
      Valida_CGC_CPF := 0
    else
    begin
      nDoc       := FormatMaskText('99.999.999/9999-99;0;*',xDoc);
      Valida_CGC_CPF  := 1;
    end;
  end;

end;

function VerifCGC_CPF(sCGC: String;eh_CPF: Boolean): Boolean;
var
  iI: Integer;
  sL: Char;
  iM1: Integer;
  iM2: Integer;
  iV: Integer;
  iS1: Integer;
  iS2: Integer;
  iD1: Integer;
  iD2: Integer;
  sDigito : String;
begin
  iS1 := 0;
  iS2 := 0;
  iM2 := 2;
  for iI := (Length(sCgc)-2) downto 1 do
  begin
    sL := sCGC[iI];
    if (sL in ['0'..'9']) then
    begin
      iM1 := iM2;
      if eh_Cpf or (iM2 < 9) then
        iM2 := iM2 + 1
      else
        iM2 := 2;
      iV := StrToInt(sL);
      iS1 := iS1 + (iV*iM1);
      iS2 := iS2 + (iV*iM2);
    end;
  end;
  iS1 := iS1 mod 11;
  if iS1 < 2 then
    iD1 := 0
  else
    iD1 := 11 - iS1;
  iS2 := ( iS2+(2*iD1) ) mod 11;
  if iS2 < 2 then
    iD2 := 0
  else
    iD2 := 11-iS2;
  sDigito :=Copy(sCGC,Length(sCGC)-1,2);
  VerifCGC_CPF := (Copy(sCGC,Length(sCGC)-1,2) = (IntToStr(iD1)+IntToStr(iD2)));
end;

function GetStatusConferenciaNFE( const Conferencia : String ): string;
begin
  Result := Conferencia;
  try
    case Conferencia[1] of
      'N' : Result := 'N�o Conferido';
      'c' : Result := 'Conferindo';
      'C' : Result := 'Conferido';
      'r' : Result := 'Recebendo';
      'R' : Result := 'Recebido';
      'D' : Result := 'Recusado/Devolvido';
    end;
  except
  end;
end;

procedure GetCorStatusConferenciaNFE( const Conferencia : String; var CorFonte, CorFundo : TColor );
begin
  CorFonte := clWindowText;
  CorFundo := clWindow;

  if (Conferencia = 'C') then // CONFERIDO
  begin
    CorFonte := clWhite;
    CorFundo := clGreen;
  end
  else
  if (Conferencia = 'c') then // CONFERINDO
  begin
    CorFonte := clWindowText;
    CorFundo := $00D0FEFF;
  end
  else
  if (Conferencia = 'R') then // RECEBIDO
  begin
    CorFonte := clWhite;
    CorFundo := $000080FF;
  end;
end;

function GetSituacaoNFE( const Situacao : String ): string;
begin
  Result := Situacao;
  try
    case Situacao[1] of
      'F' : Result := 'Fechada';
      'A' : Result := 'Aberta';
    end
  except
  end;

end;

function GetOrigemProduto( const Origem : string ): string;
begin
  Result := Origem;
  try
    case Origem[1] of
      '0' : Result := '0-Nacional, exceto as indicadas nos c�digos 3,4,5 e 8';
      '1' : Result := '1-Estrangeira - Importa��o direta, exceto a indicada no c�digo 6';
      '2' : Result := '2-Estrangeira - Adquirida no mercado interno, exceto a indicada no c�digo 7';
      '3' : Result := '3-Nacional, mercadoria ou bem com Conte�do de Importa��o superior a 40% e inferior ou igual a 70%';
      '4' : Result := '4-Nacional, cuja produ��o tenha sido feita em conf.com os processos produtivos b�sicos de que tratam as legisla��es';
      '5' : Result := '5-Nacional, mercadoria ou bem com Conte�do de Importa��o inferior ou igual a 40%';
      '6' : Result := '6-Estrangeira - Importa��o direta, sem similar nacional, constante em lista da CAMEX';
      '7' : Result := '7-Estrangeira - Adquirida no mercado interno, sem similar nacional, constante em lista da CAMEX';
      '8' : Result := '8-Nacional - Mercadoria ou bem com conte�do de importa��o superior a 70%';
    end;
  except
  end;

end;

procedure ExecMethod(OnObject: TObject; MethodName: string);
var
  Routine: TMethod;
  Exec: TExec;
begin
  Routine.Data := Pointer(OnObject);
  Routine.Code := OnObject.MethodAddress(MethodName);
  if NOT Assigned(Routine.Code) then
    Exit;
  Exec := TExec(Routine);
  Exec;
end;

function AbreTransacao( Conn : TSQLConnection ): TDBXTransaction;
var
  Transacao : TDBXTransaction;
begin
  if not Conn.InTransaction then
  begin
    if not Conn.Connected then
      Conn.Open;

    Transacao := Conn.BeginTransaction( TDBXIsolations.ReadCommitted );
  end;

  Result := Transacao;
end;

procedure FechaTransacao( Conn : TSQLConnection; Transacao: TDBXTransaction;
  Commit : Boolean );
begin
  if ( Conn.InTransaction ) then
  begin
    if ( Commit ) then
      Conn.CommitFreeAndNil( Transacao )
    else
      Conn.RollbackFreeAndNil( Transacao );
  end;
end;

function ValidaNomeArquivo( sFileName : String ): String;
var
  i : Integer;
begin
  Result := '';
  for i := 1 to Length(sFileName) do
  begin
    if ( sFileName[i] in ['a'..'z','A'..'Z','0'..'9','_','-','.',' '] ) then
      Result := Result + sFileName[i]
    else
      Result := Result + '_';
  end;
end;

function ExtractHtmlTag(const sHTML, sBeginTag, sEndTag: String) : string;
var
  i, iInicio, iFim: integer;
  s : String;
begin
  Result := '';
  iInicio := Pos(LowerCase(sBeginTag), LowerCase(sHTML));
  if (iInicio > 0 )then
  begin
    s := Copy(sHTML, iInicio, Length(sHTML) );
    iFim := Pos(LowerCase(sEndTag),LowerCase(s));
    Result := Copy(s,1,iFim+Length(sEndTag));
  end;
end;

function FormataTelefone(s: string): string;
var
  ddd, tel : String;
begin
  ddd := ExtraiDDDTelefone(s);
  tel := ExtraiTelefone(s);
  s := tel;
  tel := Copy(s,Length(s)-7,8); // aqui eu tenho 99999999
  tel := FormatMaskText(MascaraTelefone, tel); // aqui eu tenho 9999-9999
  tel := Copy(s,1,Length(s)-8)+tel; // se o telefone tiver mais de 8 digitos adiciona os demais digitos na frente
  Result := '('+ddd+')'+tel;
end;

function ExtraiDDDTelefone(s: String): string;
var
  ddd, tel : String;
begin
  s := ExtractNum(s);
  // Remove o 0 do DDD
  if ( Copy(s,1,1) = '0' ) then
    s := Copy(s,2,Length(s));

  tel := Copy(s,Length(s)-7,8); // aqui eu tenho 99999999
  tel := FormatMaskText(MascaraTelefone, tel); // aqui eu tenho 9999-9999

  ddd := Copy(s,1,Length(s)-8); // aqui eu tenho 99
  // Se o DDD tem mais de 2 digitos indica que o telefone tem 9 digitos
  if ( Length(ddd) > 2 ) then
    tel := Copy(ddd,3,Length(ddd))+tel;
  ddd := Copy(ddd,1,2);
  Result := ddd;
end;

function ExtraiTelefone(s: string):string;
var
  ddd, tel : String;
begin
  s := ExtractNum(s);
  // Remove o 0 do DDD
  if ( Copy(s,1,1) = '0' ) then
    s := Copy(s,2,Length(s));

  tel := Copy(s,Length(s)-7,8); // aqui eu tenho 99999999

  ddd := Copy(s,1,Length(s)-8); // aqui eu tenho 99
  // Se o DDD tem mais de 2 digitos indica que o telefone tem 9 digitos
  if ( Length(ddd) > 2 ) then
    tel := Copy(ddd,3,Length(ddd))+tel;
  Result := tel;
end;

function RemoveAspas( s: String ): String; // remove aspas " da string
begin
  Result := S;
  Result := StringReplace(Result,'"',' ',[rfReplaceAll]); // Limpa aspas
  Result := StringReplace(Result,';',' ',[rfReplaceAll]); // Limpa ponto e virgula
end;

function SecondsToString( iSegundos : Integer ): String; // Retorna no formato 3d 4h 2m 0s
var
  d, h, m, s : Integer;
begin
  d := 0;
  h := 0;
  m := 0;
  s := iSegundos;
  while ( s >= 60 ) do
  begin
    Dec(s,60);
    Inc(m);
    if ( m >= 60 ) then
    begin
      m := 0;
      Inc(h);
      if ( h >= 24 ) then
      begin
        h := 0;
        Inc(d);
      end;
    end;
  end;
  Result := '';
  if ( d > 0 ) then
    Result := IntToStr(d)+'d ';
  if ( h > 0 ) or ( Result <> '' ) then
    Result := Result + IntToStr(h)+'h ';
  if ( m > 0 ) or ( Result <> '' ) then
    Result := Result + IntToStr(m)+'min ';
  if ( s > 0 ) or ( Result <> '' ) then
    Result := Result + IntToStr(s)+'s';
end;

procedure DeleteColumGrid( DBGrid : TDBGrid; FieldName : String ); // excluir uma coluna de uma grid
var
  i : Integer;
begin
  for i := 0 to DBGrid.Columns.Count -1 do
  begin
    if ( UpperCase(DBGrid.Columns.Items[i].FieldName) = UpperCase(FieldName) ) then
    begin
      DBGrid.Columns.Delete(i);
      Break;
    end;
  end;
end;

function DBGridColumnByName( DBGrid : TDBGrid; FieldName : string ): TColumn; // Retorna uma coluna de um dbgrid pelo nome
var
  i : Integer;
begin
  Result := nil;
  for i := 0 to DBGrid.Columns.Count -1 do
  begin
    if ( UpperCase(DBGrid.Columns.Items[i].FieldName) = UpperCase(FieldName) ) then
    begin
      Result := DBGrid.Columns.Items[i];
      Break;
    end;
  end;
end;


function GetStatusCadastro( const Status : string ): string; // retorna o status do cadastro detalhado
begin
  Result := Status;
  try
    {$IFDEF Teleflex}
      case Status[1] of
        '1' : Result := 'Ativo';
        '0' : Result := 'Inativo';
      end;
    {$ELSE}
      case Status[1] of
        'A' : Result := 'Ativo';
        'I' : Result := 'Inativo';
        'M' : Result := 'Arquivo Morto';
      end;
    {$ENDIF}
  except
  end;
end;

function Feriado(dData : TDateTime=0) : Boolean;
var
  nMes : Integer;
  y,m,d:Word;
  G,I,J,C,H,L: Integer;
  E:TDateTime;
  dSexta : TDateTime;
  dCarnaval : TDateTime;
  dCorpusChristi : TDateTime;
  ano : integer;
Const
   FERIADOSFIXOS  : Array [1..12] of String =('01~',       // Jan
                                              '',          // Fev
                                              '',          // Mar
                                              '21~',       // Abr
                                              '01~',       // Mai
                                              '',          // Jun
                                              '',          // Jul
                                              '',          // Ago
                                              '07~',       // Set
                                              '12~',       // Out
                                              '02~15~',    // Nov
                                              '25~');      // Dez
Begin
  If dData=0 then
     Result:=False
  else
  Begin
     Try
       nMes  :=StrToInt(FormatDateTime('mm',dData));
     except
       nMes  :=0;
     end;
     If (nMes<1) or (nMes>12) then
        Result:=False
     else
        Result:=Pos(FormatDateTime('dd',dData),FERIADOSFIXOS[nMes] )<>0;
  end;
//---- Calcula o Feriado de Carnaval, Sexta-Feira Santa e Corpus Christi
  DecodeDate(dData, Y, M, D);
  ano := y;
  G := ano mod 19;
  C := ano div 100;
  H := (C-C div 4-(8*C+13) div 25 + 19*G+15)mod 30;
  I := H-(H div 28)*(1-(H div 28)*(29 div(H+1))*((21-G)div 11));
  J := (ano + ano div 4 +I+2-C+C div 4) mod 7;
  L := I-J;
  m := 3+(L+40) div 44;
  d := L+28-31*(m div 4);
  //y := ano;
  E := EncodeDate(y,m,d);
  While DayOfWeek(E)>1 do
    E := E+1;
  //--- Sexta-feira Santa
  dSexta := E - 2;
  //--- Carnaval
  dCarnaval := E - 47;
  //--- Corpus Christi
  dCorpusChristi := E + 60;
  If (dData = dSexta) Or (dData = dCarnaval) or ( dData = dCorpusChristi ) then
     Result := True;
end;

function DiaUtil( dData : TDateTime ) : Boolean; // Informa se a data informada � um dia util
begin
  // se for domingo ou sabado entao nao � dia util
  if ( DayOfWeek( dData ) in [1,7] ) then
    Result := False
  else
    Result := not Feriado( dData );
end;

function GetTpEventoNFe( sTpEventoNFe: string ): String;
var
  tpEvento : TpcnTpEvento;
  bOk : Boolean;
begin
  Result := sTpEventoNFe;
  try
    tpEvento := StrToTpEvento(bOk,sTpEventoNFe);
    if not bOk then
      Exit;
    Result := TpEventoToDescStr(tpEvento);
  except
  end;
end;

function GetTpEventoCTe( iTpEventoCTe: Integer ): String;
var
  tpEvento : TpcnTpEvento;
  bOk : Boolean;
begin
  Result := IntToStr(iTpEventoCTe);
  try
    tpEvento := StrToTpEvento(bOk,IntToStr(iTpEventoCTe));
    if not bOk then
      Exit;
    case tpEvento of
      teCCe                       : Result := 'Carta de corre��o eletr�nica';
      teCancelamento              : Result := 'Cancelamento de CTe';
      teManifDestConfirmacao      : Result := 'Manif.Destinat�rio Confirma��o';
      teManifDestCiencia          : Result := 'Manif.Destinat�rio Ci�ncia';
      teManifDestDesconhecimento  : Result := 'Manif.Destinat�rio Desconhecimento';
      teManifDestOperNaoRealizada : Result := 'Manif.Destinat�rio Op.n�o realizada';
      teEncerramento              : Result := 'Encerramento';
      teEPEC                      : Result := 'EPEC';
    end
  except
  end;
end;

procedure FormataCampo( Campo : TNumericField; Mascara : String );
begin
  Campo.DisplayFormat := Mascara;
  // na mascara de edi��o retira a virgula de milhar
  Campo.EditFormat := StringReplace(Mascara,',','',[rfReplaceAll]);
end;

function DecimaisVlrUnit: Integer;
var
  fldDecimais : TField;
begin
  fldDecimais := GetCampoConfig('DECIMAIS_VLRUNIT');
  if Assigned( fldDecimais ) then
    Result := fldDecimais.AsInteger
  else
    Result := 2;
end;

function MascaraDecimaisVlrUnit: String;
begin
  Result := '#,##0.00';
  case DecimaisVlrUnit of
    2 : Result := '#,##0.00';
    3 : Result := '#,##0.00#';
    4 : Result := '#,##0.00##';
  end;
end;

function MascaraDecimaisVlrUnitFast: String;
begin
  // Fun��o que retorna a m�scara do valor Unit�rio para o FastReports
  Result := '%2.'+IntToStr(DecimaisVlrUnit)+'n';
end;

function GetCampoConfig( FieldName: string ): TField;
var
  cdsCadEmp : TClientDataSet;
  DM : TDataModule;
  {$IF DEFINED(TELEFLEX) OR DEFINED(FAMIL) OR DEFINED(WS_TRANSPEX)}
    const sTabelaConfig = 'cdsConfig';
  {$ELSE}
    const sTabelaConfig = 'cdsCadEmp';
  {$ENDIF}
begin
  DM := TDataModule( Application.FindComponent('DM') );
  if not Assigned(DM) then
  begin
    raise Exception.Create('N�o foi encontrado o m�dulo de dados ''DM'' '+#13#10+
                           'Reinicie a aplica��o ou entre em contato com o suporte t�cnico!');
  end;

  cdsCadEmp := TClientDataSet( DM.FindComponent(sTabelaConfig) );
  if not Assigned( cdsCadEmp ) then
  begin
    raise Exception.Create('N�o foi encontrada a tabela de configura��es do sistema '+QuotedStr(sTabelaConfig)+' '+#13#10+
                           'Reinicie a aplica��o ou entre em contato com o suporte t�cnico!');
  end;

  if not( cdsCadEmp.Active ) then
    AbrirDataSet( cdsCadEmp );

  Result := cdsCadEmp.FindField(FieldName);
  // Descomente as linhas abaixo para ajudar a achar erros de
  // Access Violation que ocorrem quando o campo n�o � encontrado na tabela de
  // configura��es do sistema.
//  if ( DebugHook > 0 ) then
//  begin
//    if not Assigned( Result ) then
//    begin
//      ShowMessage('Campo: "'+FieldName+'" n�o encontrado na tabela '+sTabelaConfig+#13#10+
//                  'Esta mensagem n�o � necessariamente um erro, ela s� aparecer� se o projeto estiver sendo Debugado!');
//    end;
//  end;
end;

procedure MakeRounded(Control: TWinControl);
var
   R: TRect;
   Rgn: HRGN;
begin
   with Control do
   begin
     R := ClientRect;
     rgn := CreateRoundRectRgn(R.Left, R.Top, R.Right, R.Bottom, 15, 15);
     Perform(EM_GETRECT, 0, lParam(@r));
     InflateRect(r, - 5, - 5);
     Perform(EM_SETRECTNP, 0, lParam(@r));
     SetWindowRgn(Handle, rgn, True);
     Invalidate;
   end;
end;

function GetSQLConnection( sConnectionName : string = 'SQLConnection1'; sDMName : String = 'DM' ): TSQLConnection;
var
  DM : TDataModule;
begin
  Result := nil;

  DM := TDataModule( Application.FindComponent( sDMName ) );
  if not Assigned( DM ) then
    Exit;

  Result := TSQLConnection( DM.FindComponent( sConnectionName ) );
end;

procedure SetCampoConfig( FieldName: string ; Value : Variant);
var
  cdsCadEmp : TClientDataSet;
  DM : TDataModule;
  Field : TField;
  OldMethod : TMethod;
  {$IF DEFINED(Teleflex) OR DEFINED(FAMIL) OR DEFINED(WS_TRANSPEX)}
    const sTabelaConfig = 'cdsConfig';
  {$ELSE}
    const sTabelaConfig = 'cdsCadEmp';
  {$ENDIF}
begin
  DM := TDataModule( Application.FindComponent('DM') );
  if not Assigned(DM) then
  begin
    raise Exception.Create('N�o foi encontrado o m�dulo de dados ''DM'' '+#13#10+
                           'Reinicie a aplica��o ou entre em contato com o suporte t�cnico!');
  end;

  cdsCadEmp := TClientDataSet( DM.FindComponent(sTabelaConfig) );
  if not Assigned( cdsCadEmp ) then
  begin
    raise Exception.Create('N�o foi encontrada a tabela de configura��es do sistema ''cdsCadEmp'' '+#13#10+
                           'Reinicie a aplica��o ou entre em contato com o suporte t�cnico!');
  end;

  if not( cdsCadEmp.Active ) then
    AbrirDataSet( cdsCadEmp );

  if ( cdsCadEmp.State in [dsEdit,dsInsert] ) then
  begin
    raise Exception.Create('A tabela de configura��es do sistema est� sendo editada!'+#13#10+
                           'Feche a tela de cadastro da empresa, reinicie a aplica��o ou entre em contato com o suporte t�cnico!');
  end;

  Field := cdsCadEmp.FindField(FieldName);
  if not Assigned( Field ) then
  begin
    raise Exception.Create('N�o foi encontrado o campo '''+FieldName+''' na tabela de configura��es do sistema!'+#13#10+
                           'Entre em contato com o suporte t�cnico!');
  end;

  cdsCademp.Edit;
  OldMethod := GetMethodProp(cdsCadEmp,'BeforePost');
  try
    cdsCadEmp.BeforePost := nil;
    Field.Value := Value;
    cdsCadEmp.Post;
    if ( cdsCadEmp.ApplyUpdates(0) > 0 ) then
    begin
      raise Exception.Create('N�o foi poss�vel salvar o campo '''+FieldName+''' na tabela de configura��es do sistema!'+#13#10+
                             'Entre em contato com o suporte t�cnico!');
    end;
  finally
    SetMethodProp(cdsCadEmp,'BeforePost',OldMethod);
  end;
end;

function GetUsuario: TUsuario;
begin
  if not Assigned(Usuario) or ( Usuario = nil ) then
    CriarUsuario;

  Result := Usuario;
end;

procedure AtualizarUsuario;
begin
  TUsuario.AtualizarUsuario;
end;

procedure CriarUsuario;
begin
  TUsuario.CriarUsuario;
end;

procedure LimparUsuario;
begin
  TUsuario.LimparUsuario;
end;

function ArredInteligente( nValor : Double; nFator: Double; bArredParaCima: Boolean ): Double;
var
  nSobra, nAux, nDecimais, nValorInteiro : Double;
begin
  // Esta fun�ao faz o arredondamento dos valores de forma configuravel
  // de acordo com o Fator informado
  // Exemplo: Se o fator for igual a 0,05 arredonda os valores sempre de 0,05 em 0,05
  // ou seja, valores entre 0,00 e 0,02 s�o arredondados para 0,00
  //          valores entre 0,03 e 0,07 s�o arredondados para 0,05
  //        e valores entre 0,08 e 0,09 s�o arredondados para 0,10
  if ( nFator = 0 ) then
  begin
    Result := nValor;
    Exit;
  end;

  nValorInteiro := Trunc(nValor);
  nSobra := ( nValor - nValorInteiro );
  nAux := ( nSobra / nFator );
  nAux := WSRound( nAux ,0 );
  nDecimais := ( nAux * nFator );
  Result := ( nValorInteiro + nDecimais );
  // Se deve arredondar sempre para cima nunca o valor
  // arredondado pode ficar abaixo do valor inicial
  if ( bArredParaCima ) then
  begin
    if ( nValor > Result ) then
      Result := ( Result + nFator );
  end;
end;

function StrEmptyToNull( s : String ) : Variant;
begin
  if (s = '') then
    Result := null
  else
    Result := s;
end;

function GetCTeStatus( const iStatus : Integer ): string;
begin
  Result := '';
  try
    case iStatus of
      -1 : Result := 'N�mero inexistente';
      0  : Result := 'N�o Enviada';
      // C�DIGO  RESULTADO DO PROCESSAMENTO DA SOLICITA��O
      100 : Result := '100-Autorizado o uso do CT-e';
      101 : Result := '101-Cancelamento de CT-e homologado';
      102 : Result := '102-Inutiliza��o de n�mero homologado';
      103 : Result := '103-Lote recebido com sucesso';
      104 : Result := '104-Lote processado';
      105 : Result := '105-Lote em processamento';
      106 : Result := '106-Lote n�o localizado';
      107 : Result := '107-Servi�o em Opera��o';
      108 : Result := '108-Servi�o Paralisado Momentaneamente (curto prazo)';
      109 : Result := '109-Servi�o Paralisado sem Previs�o';
      110 : Result := '110-Uso Denegado';
      111 : Result := '111-Consulta cadastro com uma ocorr�ncia';
      112 : Result := '112-Consulta cadastro com mais de uma ocorr�ncia';
      113 : Result := '113-Servi�o SVC em opera��o. Desativa��o prevista para a UF em dd/mm/aa, �s hh:mm horas';
      114 : Result := '114-SVC-[SP/RS] desabilitada pela SEFAZ de Origem';
      134 : Result := '134-Evento registrado e vinculado ao CT-e com alerta para situa��o do documento.';
      135 : Result := '135-Evento registrado e vinculado a CT-e';
      136 : Result := '136-Evento registrado, mas n�o vinculado a CT-e';

      // C�DIGO  MOTIVOS DE N�O ATENDIMENTO DA SOLICITA��O
      201 : Result := '201-Rejei��o: O n�mero m�ximo de numera��o de CT-e a inutilizar ultrapassou o limite';
      202 : Result := '202-Rejei��o: Falha no reconhecimento da autoria ou integridade do arquivo digital';
      203 : Result := '203-Rejei��o: Emissor n�o habilitado para emiss�o do CT-e';
      204 : Result := '204-Rejei��o: Duplicidade de CT-e';
      205 : Result := '205-Rejei��o: CT-e est� denegado na base de dados da SEFAZ';
      206 : Result := '206-Rejei��o: N�mero de CT-e j� est� inutilizado na Base de dados da SEFAZ';
      207 : Result := '207-Rejei��o: CNPJ do emitente inv�lido';
      208 : Result := '208-Rejei��o: CNPJ do destinat�rio inv�lido';
      209 : Result := '209-Rejei��o: IE do emitente inv�lida';
      210 : Result := '210-Rejei��o: IE do destinat�rio inv�lida';
      211 : Result := '211-Rejei��o: IE do substituto inv�lida';
      212 : Result := '212-Rejei��o: Data de emiss�o CT-e posterior a data de recebimento';
      213 : Result := '213-Rejei��o: CNPJ-Base do Emitente difere do CNPJ-Base do Certificado Digital';
      214 : Result := '214-Rejei��o: Tamanho da mensagem excedeu o limite estabelecido';
      215 : Result := '215-Rejei��o: Falha no schema XML';
      216 : Result := '216-Rejei��o: Chave de Acesso difere da cadastrada';
      217 : Result := '217-Rejei��o: CT-e n�o consta na base de dados da SEFAZ';
      218 : Result := '218-Rejei��o: CT-e j� est� cancelado na base de dados da SEFAZ';
      219 : Result := '219-Rejei��o: Circula��o do CT-e verificada';
      220 : Result := '220-Rejei��o: CT-e autorizado h� mais de 7 dias (168 horas)';
      221 : Result := '221-Rejei��o: Confirmado a presta��o do servi�o do CT-e pelo destinat�rio';
      222 : Result := '222-Rejei��o: Protocolo de Autoriza��o de Uso difere do cadastrado';
      223 : Result := '223-Rejei��o: CNPJ do transmissor do lote difere do CNPJ do transmissor da consulta';
      224 : Result := '224-Rejei��o: A faixa inicial � maior que a faixa final';
      225 : Result := '225-Rejei��o: Falha no Schema XML do CT-e';
      226 : Result := '226-Rejei��o: C�digo da UF do Emitente diverge da UF autorizadora';
      227 : Result := '227-Rejei��o: Erro na composi��o do Campo ID';
      228 : Result := '228-Rejei��o: Data de Emiss�o muito atrasada';
      229 : Result := '229-Rejei��o: IE do emitente n�o informada';
      230 : Result := '230-Rejei��o: IE do emitente n�o cadastrada';
      231 : Result := '231-Rejei��o: IE do emitente n�o vinculada ao CNPJ';
      232 : Result := '232-Rejei��o: IE do destinat�rio n�o informada';
      233 : Result := '233-Rejei��o: IE do destinat�rio n�o cadastrada';
      235 : Result := '235-Rejei��o: Inscri��o SUFRAMA inv�lida';
      236 : Result := '236-Rejei��o: Chave de Acesso com d�gito verificador inv�lido';
      237 : Result := '237-Rejei��o: CPF do destinat�rio inv�lido';
      238 : Result := '238-Rejei��o: Cabe�alho - Vers�o do arquivo XML superior a Vers�o vigente';
      239 : Result := '239-Rejei��o: Cabe�alho - Vers�o do arquivo XML n�o suportada';
      240 : Result := '240-Rejei��o: Cancelamento/Inutiliza��o - Irregularidade Fiscal do Emitente';
      241 : Result := '241-Rejei��o: Um n�mero da faixa j� foi utilizado';
      242 : Result := '242-Rejei��o: Elemento cteCabecMsg inexistente no SOAP Header';
      243 : Result := '243-Rejei��o: XML Mal Formado';
      245 : Result := '245-Rejei��o: CNPJ Emitente n�o cadastrado';
      246 : Result := '246-Rejei��o: CNPJ Destinat�rio n�o cadastrado';
      247 : Result := '247-Rejei��o: Sigla da UF do Emitente diverge da UF autorizadora';
      248 : Result := '248-Rejei��o: UF do Recibo diverge da UF autorizadora';
      249 : Result := '249-Rejei��o: UF da Chave de Acesso diverge da UF autorizadora';
      250 : Result := '250-Rejei��o: UF diverge da UF autorizadora';
      251 : Result := '251-Rejei��o: UF/Munic�pio destinat�rio n�o pertence a SUFRAMA';
      252 : Result := '252-Rejei��o: Ambiente informado diverge do Ambiente de recebimento';
      253 : Result := '253-Rejei��o: D�gito Verificador da chave de acesso composta inv�lido';
      254 : Result := '254-Rejei��o: CT-e a ser complementado n�o informado para CT-e complementar';
      256 : Result := '256-Rejei��o: Um n�mero de CT-e da faixa est� inutilizado na Base de dados da SEFAZ';
      257 : Result := '257-Rejei��o: Solicitante n�o habilitado para emiss�o do CT-e';
      258 : Result := '258-Rejei��o: CNPJ da consulta inv�lido';
      259 : Result := '259-Rejei��o: CNPJ da consulta n�o cadastrado como contribuinte na UF';
      260 : Result := '260-Rejei��o: IE da consulta inv�lida';
      261 : Result := '261-Rejei��o: IE da consulta n�o cadastrada como contribuinte na UF';
      262 : Result := '262-Rejei��o: UF n�o fornece consulta por CPF';
      263 : Result := '263-Rejei��o: CPF da consulta inv�lido';
      264 : Result := '264-Rejei��o: CPF da consulta n�o cadastrado como contribuinte na UF';
      265 : Result := '265-Rejei��o: Sigla da UF da consulta difere da UF do Web Service';
      266 : Result := '266-Rejei��o: S�rie utilizada n�o permitida no Web Service';
      267 : Result := '267-Rejei��o: CT-e Complementar referencia um CT-e inexistente';
      268 : Result := '268-Rejei��o: CT-e Complementar referencia outro CT-e Complementar';
      269 : Result := '269-Rejei��o: CNPJ Emitente do CT-e Complementar difere do CNPJ do CT complementado';
      270 : Result := '270-Rejei��o: C�digo Munic�pio do Fato Gerador: d�gito inv�lido';
      271 : Result := '271-Rejei��o: C�digo Munic�pio do Fato Gerador: difere da UF do emitente';
      272 : Result := '272-Rejei��o: C�digo Munic�pio do Emitente: d�gito inv�lido';
      273 : Result := '273-Rejei��o: C�digo Munic�pio do Emitente: difere da UF do emitente';
      274 : Result := '274-Rejei��o: C�digo Munic�pio do Destinat�rio: d�gito inv�lido';
      275 : Result := '275-Rejei��o: C�digo Munic�pio do Destinat�rio: difere da UF do Destinat�rio';
      276 : Result := '276-Rejei��o: C�digo Munic�pio do Local de Retirada: d�gito inv�lido';
      277 : Result := '277-Rejei��o: C�digo Munic�pio do Local de Retirada: difere da UF do Local de Retirada';
      278 : Result := '278-Rejei��o: C�digo Munic�pio do Local de Entrega: d�gito inv�lido';
      279 : Result := '279-Rejei��o: C�digo Munic�pio do Local de Entrega: difere da UF do Local de Entrega';
      280 : Result := '280-Rejei��o: Certificado Transmissor inv�lido';
      281 : Result := '281-Rejei��o: Certificado Transmissor Data Validade';
      282 : Result := '282-Rejei��o: Certificado Transmissor sem CNPJ';
      283 : Result := '283-Rejei��o: Certificado Transmissor - erro Cadeia de Certifica��o';
      284 : Result := '284-Rejei��o: Certificado Transmissor revogado';
      285 : Result := '285-Rejei��o: Certificado Transmissor difere ICP-Brasil';
      286 : Result := '286-Rejei��o: Certificado Transmissor erro no acesso a LCR';
      289 : Result := '289-Rejei��o: C�digo da UF informada diverge da UF solicitada';
      290 : Result := '290-Rejei��o: Certificado Assinatura inv�lido';
      291 : Result := '291-Rejei��o: Certificado Assinatura Data Validade';
      292 : Result := '292-Rejei��o: Certificado Assinatura sem CNPJ';
      293 : Result := '293-Rejei��o: Certificado Assinatura - erro Cadeia de Certifica��o';
      294 : Result := '294-Rejei��o: Certificado Assinatura revogado';
      295 : Result := '295-Rejei��o: Certificado Assinatura difere ICP-Brasil';
      296 : Result := '296-Rejei��o: Certificado Assinatura erro no acesso a LCR';
      297 : Result := '297-Rejei��o: Assinatura difere do calculado';
      298 : Result := '298-Rejei��o: Assinatura difere do padr�o do Projeto';
      299 : Result := '299-Rejei��o: XML da �rea de cabe�alho com codifica��o diferente de UTF-8';
      // DENEGA��O DE USO
      301 : Result := '301-Uso Denegado : Irregularidade fiscal do emitente';
      302 : Result := '302-Uso Denegado : Irregularidade fiscal do remetente';
      303 : Result := '303-Uso Denegado : Irregularidade fiscal do destinat�rio';
      304 : Result := '304-Uso Denegado : Irregularidade fiscal do expedidor';
      305 : Result := '305-Uso Denegado : Irregularidade fiscal do recebedor';
      306 : Result := '306-Uso Denegado : Irregularidade fiscal do tomado';
      //
      401 : Result := '401-Rejei��o: CPF do remetente inv�lido';
      402 : Result := '402-Rejei��o: XML da �rea de dados com codifica��o diferente de UTF-8';
      404 : Result := '404-Rejei��o: Uso de prefixo de namespace n�o permitido';
      405 : Result := '405-Rejei��o: C�digo do pa�s do emitente: d�gito inv�lido';
      406 : Result := '406-Rejei��o: C�digo do pa�s do destinat�rio: d�gito inv�lido';
      407 : Result := '407-Rejei��o: O CPF s� pode ser informado no campo emitente para o CT-e avulso';
      408 : Result := '408-Rejei��o: Lote com CT-e de diferentes UF';
      409 : Result := '409-Rejei��o: Campo cUF inexistente no elemento cteCabecMsg do SOAP Header';
      410 : Result := '410-Rejei��o: UF informada no campo cUF n�o � atendida pelo WebService';
      411 : Result := '411-Rejei��o: Campo versaoDados inexistente no elemento cteCabecMsg do SOAP Header';
      413 : Result := '413-Rejei��o: C�digo de Munic�pio de t�rmino da presta��o: d�gito inv�lido';
      414 : Result := '414-Rejei��o: C�digo de Munic�pio diverge da UF de t�rmino da presta��o';
      415 : Result := '415-Rejei��o: CNPJ do remetente inv�lido';
      416 : Result := '416-Rejei��o: CPF do remetente inv�lido';
      417 : Result := '417-Rejei��o: C�digo de Munic�pio de localiza��o remetente: d�gito inv�lido';
      418 : Result := '418-Rejei��o: C�digo de Munic�pio diverge da UF de localiza��o remetente';
      419 : Result := '419-Rejei��o: IE do remetente inv�lida';
      420 : Result := '420-Rejei��o: CNPJ remetente n�o cadastrado';
      421 : Result := '421-Rejei��o: IE do remetente n�o cadastrada';
      422 : Result := '422-Rejei��o: IE do remetente n�o vinculada ao CNPJ';
      423 : Result := '423-Rejei��o: C�digo de Munic�pio de localiza��o destinat�rio: d�gito inv�lido';
      424 : Result := '424-Rejei��o: C�digo de Munic�pio diverge da UF de localiza��o destinat�rio';
      425 : Result := '425-Rejei��o: CNPJ destinat�rio n�o cadastrado';
      426 : Result := '426-Rejei��o: IE do destinat�rio n�o cadastrada';
      427 : Result := '427-Rejei��o: IE do destinat�rio n�o vinculada ao CNPJ';
      428 : Result := '428-Rejei��o: CNPJ do expedidor inv�lido';
      429 : Result := '429-Rejei��o: CPF do expedidor inv�lido';
      430 : Result := '430-Rejei��o: C�digo de Munic�pio de localiza��o expedidor: d�gito inv�lido';
      431 : Result := '431-Rejei��o: C�digo de Munic�pio diverge da UF de localiza��o expedidor';
      432 : Result := '432-Rejei��o: IE do expedidor inv�lida';
      433 : Result := '433-Rejei��o: CNPJ expedidor n�o cadastrado';
      434 : Result := '434-Rejei��o: IE do expedidor n�o cadastrada';
      435 : Result := '435-Rejei��o: IE do expedidor n�o vinculada ao CNPJ';
      436 : Result := '436-Rejei��o: CNPJ do recebedor inv�lido';
      437 : Result := '437-Rejei��o: CPF do recebedor inv�lido';
      438 : Result := '438-Rejei��o: C�digo de Munic�pio de localiza��o do recebedor: d�gito inv�lido';
      439 : Result := '439-Rejei��o: C�digo de Munic�pio diverge da UF de localiza��o recebedor';
      440 : Result := '440-Rejei��o: IE do recebedor inv�lida';
      441 : Result := '441-Rejei��o: CNPJ recebedor n�o cadastrado';
      442 : Result := '442-Rejei��o: IE do recebedor n�o cadastrada';
      443 : Result := '443-Rejei��o: IE do recebedor n�o vinculada ao CNPJ';
      444 : Result := '444-Rejei��o: CNPJ do tomador inv�lido';
      445 : Result := '445-Rejei��o: CPF do tomador inv�lido';
      446 : Result := '446-Rejei��o: C�digo de Munic�pio de localiza��o tomador: d�gito inv�lido';
      447 : Result := '447-Rejei��o: C�digo de Munic�pio diverge da UF de localiza��o tomador';
      448 : Result := '448-Rejei��o: IE do tomador inv�lida';
      449 : Result := '449-Rejei��o: CNPJ tomador n�o cadastrado';
      450 : Result := '450-Rejei��o: D�gito Verificador inv�lido na Chave de acesso de CT-e referenciado';
      451 : Result := '451-Rejei��o: Chave de acesso de CT-e referenciado inv�lida (Ano < 2009 ou Ano maior que Ano corrente)';
      452 : Result := '452-Rejei��o: Chave de acesso de CT-e referenciado inv�lida (M�s = 0 ou M�s > 12)';
      453 : Result := '453-Rejei��o: Chave de acesso de CT-e referenciado inv�lida (CNPJ zerado ou digito inv�lido)';
      454 : Result := '454-Rejei��o: Chave de acesso de CT-e referenciado inv�lida (modelo diferente de 57)';
      455 : Result := '455-Rejei��o: C�digo de Munic�pio de in�cio da presta��o: d�gito inv�lido';
      456 : Result := '456-Rejei��o: C�digo de Munic�pio diverge da UF de in�cio da presta��o';
      457 : Result := '457-Rejei��o: O lote cont�m CT-e de mais de um estabelecimento emissor';
      458 : Result := '458-Rejei��o: Grupo de CT-e normal n�o informado para CT-e normal';
      459 : Result := '459-Rejei��o: Grupo de CT-e complementar n�o informado para CT-e complementar';
      460 : Result := '460-Rejei��o: N�o informado os dados do remetente indicado como tomador do servi�o';
      461 : Result := '461-Rejei��o: N�o informado os dados do expedidor indicado como tomador do servi�o';
      462 : Result := '462-Rejei��o: N�o informado os dados do recebedor indicado como tomador do servi�o';
      463 : Result := '463-Rejei��o: N�o informado os dados do destinat�rio indicado como tomador do servi�o';
      469 : Result := '469-Rejei��o: Remetente deve ser informado para tipo de servi�o diferente de redespacho intermedi�rio ou Servi�o vinculado a multimodal';
      470 : Result := '470-Rejei��o: Destinat�rio deve ser informado para tipo de servi�o diferente de redespacho intermedi�rio ou servi�o vinculado a multimodal';
      471 : Result := '471-Rejei��o: Ano de inutiliza��o n�o pode ser superior ao Ano atual';
      472 : Result := '472-Rejei��o: Ano de inutiliza��o n�o pode ser inferior a 2008';
      473 : Result := '473-Rejei��o: Tipo Autorizador do Recibo diverge do �rg�o Autorizador';
      474 : Result := '474-Rejei��o: Expedidor deve ser informado para tipo de servi�o de redespacho intermedi�rio e servi�o vinculado a multimodal';
      475 : Result := '475-Rejei��o: Recebedor deve ser informado para tipo de servi�o de redespacho intermedi�rio e servi�o vinculado a multimodal';
      478 : Result := '478-Rejei��o: Chave de acesso de CT-e referenciado inv�lida (numero CT = 0)';
      479 : Result := '479-Rejei��o: Chave de acesso de CT-e referenciado inv�lida (Tipo de emiss�o inv�lido)';
      480 : Result := '480-Rejei��o: Chave de Acesso de CT-e anterior inv�lida (Tipo de emiss�o inv�lido)';
      489 : Result := '489-Rejei��o: IE do tomador n�o cadastrada';
      490 : Result := '490-Rejei��o: IE do tomador n�o vinculada ao CNPJ';
      491 : Result := '491-Rejei��o: CT-e complementado � diferente de Normal ou Substitui��o';
      492 : Result := '492-Rejei��o: C�digo de Munic�pio de envio: d�gito inv�lido';
      493 : Result := '493-Rejei��o: C�digo de Munic�pio diverge da UF de envio';
      494 : Result := '494-Rejei��o: Processo de emiss�o informado inv�lido';
      495 : Result := '495-Rejei��o: Solicitante n�o autorizado para consulta';
      496 : Result := '496-Rejei��o: Grupo CT-e de Anula��o n�o informado para o CT-e de Anula��o';
      497 : Result := '497-Rejei��o: CT-e objeto da anula��o inexistente';
      498 : Result := '498-Rejei��o: CT-e objeto da anula��o deve estar com a situa��o autorizada (n�o pode estar cancelado ou denegado)';
      499 : Result := '499-Rejei��o: CT-e de anula��o deve ter tipo de emiss�o = normal';
      500 : Result := '500-Rejei��o: CT-e objeto da anula��o deve ter Tipo = 0 (normal) ou 3 (Substitui��o)';
      501 : Result := '501-Rejei��o: Data de emiss�o do CT-e de Anula��o deve ocorrer em at� 60 dias';
      502 : Result := '502-Rejei��o: CT-e de anula��o deve ter o valor do ICMS e de presta��o iguais ao CT-e original';
      503 : Result := '503-Rejei��o: CT-e substituto deve ter tipo de emiss�o = normal';
      505 : Result := '505-Rejei��o: Grupo CT-e de Substitui��o n�o informado para o CT-e de Substitui��o';
      504 : Result := '504-Rejei��o: Chave de acesso de NF-e inv�lida (UF inv�lida)';
      507 : Result := '507-Rejei��o: Chave de Acesso inv�lida (Tipo de emiss�o inv�lido)';
      508 : Result := '508-Rejei��o: Chave de Acesso de NF-e inv�lida (Tipo de emiss�o inv�lido)';
      510 : Result := '510-Rejei��o: CNPJ do emitente do CT-e substituto deve ser igual ao informado no CT-e substitu�do';
      511 : Result := '511-Rejei��o: CNPJ/CPF do remetente do CT-e substituto deve ser igual ao informado no CT-e substitu�do';
      512 : Result := '512-Rejei��o: CNPJ/CPF do destinat�rio do CT-e substituto deve ser igual ao informado no CT-e substitu�do';
      513 : Result := '513-Rejeicao: UF nao atendida pela SVC-[SP/RS]';
      514 : Result := '514-Rejei��o: vers�o da mensagem n�o suportada na SVC';
      515 : Result := '515-Rejei��o: O tpEmis informado s� � v�lido na conting�ncia SVC';
      516 : Result := '516-Rejei��o: O tpEmis informado � incompat�vel com SVC-[SP/RS]';
      517 : Result := '517-Rejei��o: CT-e informado em SVC deve ser Normal';
      518 : Result := '518-Rejei��o: Servi�o indispon�vel na SVC';
      527 : Result := '527-Rejei��o: NF-e duplicada no CT-e';
      528 : Result := '528-Rejei��o: Vedado cancelamento se exitir MDF-e autorizado para o CT-e';
      529 : Result := '529-Rejei��o: Vedado cancelamento do CT-e Multimodal se existir CT-e de servi�o vinculado autorizado referenciando o Multimodal.';
      530 : Result := '530-Rejei��o: Se ambiente SVC, rejeitar eventos diferentes de EPEC e Cancelamento';
      531 : Result := '531-Rejei��o: Valor a receber deve ser menor ou igual Valor da Presta��o';
      532 : Result := '532-Rejei��o: Munic�pio do Rementente inexistente';
      533 : Result := '533-Rejei��o: Munic�pio do Destinat�rio inexistente';
      534 : Result := '534-Rejei��o: Munic�pio do Expedidor inexistente';
      535 : Result := '535-Rejei��o: Munic�pio do Recebedor inexistente';
      536 : Result := '536-Rejei��o: Munic�pio do Tomador inexistente';
      537 : Result := '537-Rejei��o: Munic�pio de Envio inexistente';
      538 : Result := '538-Rejei��o: Chave de acesso de CT-e anterior inv�lida (UF inv�lida)';
      539 : Result := '539-Rejeicao: Duplicidade de CT-e, com diferen�a na Chave de Acesso';
      540 : Result := '540-Rejei��o: Grupo de documentos informado inv�lido para remetente que emite NF-e';
      541 : Result := '541-Rejei��o: Munic�pio de in�cio da presta��o inexistente';
      542 : Result := '542-Rejei��o: Munic�pio de t�rmino da presta��o inexistente';
      543 : Result := '543-Rejei��o: Chave de CT-e duplicada em documentos anteriores';
      544 : Result := '544-Rejei��o: D�gito Verificador inv�lido na Chave de acesso de CT-e anterior';
      545 : Result := '545-Rejei��o: Chave de acesso de CT-e anterior inv�lida (Ano < 2009 ou Ano maior que Anocorrente)';
      546 : Result := '546-Rejei��o: Chave de acesso de CT-e anterior inv�lida (M�s = 0 ou M�s > 12)';
      547 : Result := '547-Rejei��o: Chave de acesso de CT-e anterior inv�lida (CNPJ zerado ou digito inv�lido)';
      548 : Result := '548-Rejei��o: Chave de acesso de CT-e anterior inv�lida (modelo diferente de 57)';
      549 : Result := '549-Rejei��o: Chave de acesso de CT-e anterior inv�lida (numero CT = 0)';
      550 : Result := '550-Rejei��o: O CNPJ/CPF do expedidor do CT-e substituto deve ser igual ao informado no CT-e substitu�do';
      551 : Result := '551-Rejei��o: O CNPJ/CPF do recebedor do CT-e substituto deve ser igual ao informado no CT-e substitu�do';
      552 : Result := '552-Rejei��o: O CNPJ/CPF do tomador do CT-e substituto deve ser igual ao informado no CT-e substitu�do';
      553 : Result := '553-Rejei��o: A IE do emitente do CT-e substituto deve ser igual ao informado no CT-e substitu�do';
      554 : Result := '554-Rejei��o: A IE do remetente do CT-e substituto deve ser igual ao informado no CT-e substitu�do';
      555 : Result := '555-Rejei��o: A IE do destinat�rio do CT-e substituto deve ser igual ao informado no CT-e substitu�do';
      556 : Result := '556-Rejei��o: A IE do expedidor do CT-e substituto deve ser igual ao informado no CT-e substitu�do';
      557 : Result := '557-Rejei��o: A IE do recebedor do CT-e substituto deve ser igual ao informado no CT-e substitu�do';
      558 : Result := '558-Rejei��o: A IE do tomador do CT-e substituto deve ser igual ao informado no CT-e substitu�do';
      559 : Result := '559-Rejei��o: A UF de in�cio da presta��o deve ser igual ao informado no CT-e substitu�do';
      560 : Result := '560-Rejei��o: A UF de fim da presta��o deve ser igual ao informado no CT-e substitu�do';
      561 : Result := '561-Rejei��o: O valor da presta��o do servi�o deve ser menor ou igual ao informado no CT-e substitu�do';
      562 : Result := '562-Rejei��o: O valor do ICMS do CT-e substituto deve ser menor ou igual ao informado no CT-e substitu�do';
      563 : Result := '563-Rejei��o: A substitui��o de um CT-e deve ocorrer no prazo m�ximo de 90 dias contados da data de emiss�o do CT-e objeto de Substitui��o';
      564 : Result := '564-Rejei��o: O CT-e de anula��o n�o pode ser cancelado';
      565 : Result := '565-Rejei��o: O CT-e s� pode ser anulado pelo emitente';
      566 : Result := '566-Rejei��o: CT-e objeto da anula��o n�o pode ter sido anulado anteriormente';
      567 : Result := '567-Rejei��o: CT-e objeto da anula��o n�o pode ter sido substitu�do anteriormente';
      568 : Result := '568-Rejei��o: CT-e a ser substitu�do inexistente';
      569 : Result := '569-Rejei��o: CT-e a ser substitu�do deve estar com a situa��o autorizada (n�o pode estar cancelado ou denegado)';
      570 : Result := '570-Rejei��o: CT-e a ser substitu�do n�o pode ter sido substitu�do anteriormente';
      571 : Result := '571-Rejei��o: CT-e a ser substitu�do deve ter Tipo = 0 (normal) ou 3 (Substitui��o)';
      572 : Result := '572-Rejei��o: CT-e de anula��o informado no grupo �Tomador n�o � contribuinte do ICMS� inexistente';
      573 : Result := '573-Rejei��o: CT-e de anula��o informado no grupo �Tomador n�o � contribuinte do ICMS� deve ter Tipo=2(Anula��o)';
      574 : Result := '574-Rejei��o: Vedado o cancelamento de CT-e do tipo substituto (tipo=3)';
      575 : Result := '575-Rejei��o: Vedado o cancelamento se possuir CT-e de Anula��o associado';
      576 : Result := '576-Rejei��o: Vedado o cancelamento se possuir CT-e de Substitui��o associado';
      577 : Result := '577-Rejei��o: CT-e a ser substitu�do n�o pode ter sido anulado anteriormente';
      578 : Result := '578-Rejei��o: Chave de acesso do CT-e anulado deve ser igual ao substitu�do';
      579 : Result := '579-Rejei��o: Vers�o informada para o modal n�o suportada';
      580 : Result := '580-Rejei��o: Falha no Schema XML espec�fico para o modal';
      581 : Result := '581-Rejei��o: Campo Valor da Carga deve ser informado para o modal';
      582 : Result := '582-Rejei��o: Grupo Tr�fego M�tuo deve ser informado';
      583 : Result := '583-Rejei��o: Ferrovia emitente deve ser a de origem quando respFat=1';
      584 : Result := '584-Rejei��o: Referenciar o CT-e que foi emitido pela ferrovia de origem';
      585 : Result := '585-Rejei��o: IE Emitente n�o autorizada a emitir CT-e para o modal informado';
      586 : Result := '586-Rejei��o: Data e Justificativa de entrada em conting�ncia n�o devem ser informadas para tipo de emiss�o normal.';
      587 : Result := '587-Rejei��o: Data e Justificativa de entrada em conting�ncia devem ser informadas';
      588 : Result := '588-Rejei��o: Data de entrada em conting�ncia posterior a data de emiss�o.';
      589 : Result := '589-Rejei��o: O lote cont�m CT-e de mais de um modal';
      590 : Result := '590-Rejei��o: O lote cont�m CT-e de mais de uma vers�o de modal';
      591 : Result := '591-Rejei��o: D�gito Verificador inv�lido na Chave de acesso de NF-e transportada';
      592 : Result := '592-Rejei��o: Chave de acesso inv�lida (Ano < 2009 ou Ano maior que Ano corrente)';
      593 : Result := '593-Rejei��o: Chave de acesso inv�lida (M�s = 0 ou M�s > 12)';
      594 : Result := '594-Rejei��o: Chave de acesso inv�lida (CNPJ zerado ou digito inv�lido)';
      595 : Result := '595-Rejei��o: Chave de acesso inv�lida (modelo diferente de 57)';
      596 : Result := '596-Rejei��o: Chave de acesso inv�lida (numero CT = 0)';
      598 : Result := '598-Rejeicao: Usar somente o namespace padrao do CT-e';
      599 : Result := '599-Rejeicao: Nao eh permitida a presenca de caracteres de edicao no inicio/fim da mensagem ou entre as tags da mensagem';
      600 : Result := '600-Rejeicao: Chave de Acesso difere da existente em BD';
      601 : Result := '601-Rejei��o: Quantidade de documentos informados no remetente excede limite de 2000';
      602 : Result := '602-Rejei��o: Chave de acesso de NF-e inv�lida (Ano < 2005 ou Ano maior que Ano corrente)';
      603 : Result := '603-Rejei��o: Chave de acesso de NF-e inv�lida (M�s = 0 ou M�s > 12)';
      604 : Result := '604-Rejei��o: Chave de acesso de NF-e inv�lida (CNPJ zerado ou digito inv�lido)';
      605 : Result := '605-Rejei��o: Chave de acesso de NF-e inv�lida (modelo diferente de 55)';
      606 : Result := '606-Rejei��o: Chave de acesso de NF-e inv�lida (numero NF = 0)';
      608 : Result := '608-Rejei��o: Chave de acesso de CT-e referenciado inv�lida (UF inv�lida)';
      610 : Result := '610-Rejei��o: Chave de acesso inv�lida (UF inv�lida)';
      627 : Result := '627-Rejei��o: CNPJ do autor do evento inv�lido';
      628 : Result := '628-Rejei��o: Erro Atributo ID do evento n�o corresponde a concatena��o dos campos (�ID� + tpEvento + chCTe + nSeqEvento)';
      629 : Result := '629-Rejei��o: O tpEvento informado inv�lido';
      630 : Result := '630-Rejei��o: Falha no Schema XML espec�fico para o evento';
      631 : Result := '631-Rejei��o: Duplicidade de evento';
      632 : Result := '632-Rejei��o: O autor do evento diverge do emissor do CT-e';
      633 : Result := '633-Rejei��o: O autor do evento n�o � um �rg�o autorizado a gerar o evento';
      634 : Result := '634-Rejei��o: A data do evento n�o pode ser menor que a data de emiss�o do CT-e';
      635 : Result := '635-Rejei��o: A data do evento n�o pode ser maior que a data do processamento';
      636 : Result := '636-Rejei��o: O numero sequencial do evento � maior que o permitido';
      637 : Result := '637-Rejei��o: A data do evento n�o pode ser menor que a data de autoriza��o do CT-e';
      638 : Result := '638-Rejei��o: J� existe CT-e autorizado com esta numera��o';
      639 : Result := '639-Rejei��o: Existe EPEC emitido h� mais de 7 dias (168h) sem a emiss�o do CT-e no ambiente normal de autoriza��o';
      640 : Result := '640-Rejei��o: Tipo de emiss�o do CT-e difere de EPEC com EPEC autorizado na SVC-XX para este documento.';
      641 : Result := '641-Rejei��o: O evento pr�vio deste CT-e n�o foi autorizado na SVC ou ainda n�o foi sincronizado.[OBS: Em caso de atraso na sincroniza��o, favor aguardar alguns instantes para nova tentativa de transmiss�o]';
      642 : Result := '642-Rejei��o: Os valores de ICMS, Presta��o e Total da Carga do CT-e devem ser iguais aos informados no EPEC.';
      643 : Result := '643-Rejei��o: As informa��es do tomador de servi�o do CT-e devem ser iguais as informadas no EPEC';
      644 : Result := '644-Rejei��o: A informa��o do modal do CT-e deve ser igual a informada no EPEC';
      645 : Result := '645-Rejei��o: A UF de inicio e fim de presta��o do CT-e devem ser iguais as informadas no EPEC.';
      646 : Result := '646-Rejei��o: CT-e emitido em ambiente de homologa��o com Raz�o Social do remetente diferente de CT-E EMITIDO EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL';
      647 : Result := '647-Rejei��o: CT-e emitido em ambiente de homologa��o com Raz�o Social do expedidor diferente de CT-E EMITIDO EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL';
      648 : Result := '648-Rejei��o: CT-e emitido em ambiente de homologa��o com Raz�o Social do recebedor diferente de CT-E EMITIDO EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL';
      649 : Result := '649-Rejei��o: CT-e emitido em ambiente de homologa��o com Raz�o Social do destinat�rio diferente de CT-E EMITIDO EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL';
      650 : Result := '650-Rejei��o: Valor total do servi�o superior ao limite permitido (R$ 9.999.999,99)';
      651 : Result := '651-Rejei��o: Referenciar o CT-e Multimodal que foi emitido pelo OTM';
      652 : Result := '652-Rejei��o: NF-e n�o pode estar cancelada ou denegada';
      653 : Result := '653-Rejei��o: Tipo de evento n�o � permitido em ambiente de autoriza��o Normal';
      654 : Result := '654-Rejei��o: Tipo de evento n�o � permitido em ambiente de autoriza��o SVC';
      655 : Result := '655-Rejei��o: CT-e complementado deve estar com a situa��o autorizada (n�o pode estar cancelado ou denegado)';
      656 : Result := '656-Rejei��o: CT-e complementado n�o pode ter sido anulado';
      657 : Result := '657-Rejei��o: CT-e complementado n�o pode ter sido substitu�do';
      658 : Result := '658-Rejei��o: CT-e objeto da anula��o n�o pode ter sido complementado';
      659 : Result := '659-Rejei��o: CT-e substitu�do n�o pode ter sido complementado';
      660 : Result := '660-Rejei��o: Vedado o cancelamento se possuir CT-e Complementar associado';
      661 : Result := '661-Rejei��o: NF-e inexistente na base de dados da SEFAZ';
      662 : Result := '662-Rejei��o: NF-e com diferen�a de Chave de Acesso';
      663 : Result := '663-Rejei��o: CT-e autorizado h� mais de 30 dias';
      664 : Result := '664-Rejei��o: Evento n�o permitido para CT-e Substituido/Anulado';
      665 : Result := '665-Rejei��o: As informa��es do seguro da carga devem ser preenchidas para o modal rodovi�rio';
      666 : Result := '666-Rejei��o: O respons�vel pelo seguro da carga indicado n�o foi relacionado no CT-e';
      667 : Result := '667-Rejei��o: CNPJ-Base do Tomador deve ser igual ao CNPJ-Base do Emitente do CT-e Multimodal';
      668 : Result := '668-Rejei��o: CPF do funcion�rio do registro de passagem inv�lido';
      669 : Result := '669-Rejei��o: Segundo c�digo de barras deve ser informado para CT-e emitido em conting�ncia FS-DA';
      670 : Result := '670-Rejei��o: S�rie utilizada n�o permitida no webservice';
      671 : Result := '671-Rejei��o: CT-e referenciado no CT-e Complementar com diferen�a de Chave de Acesso';
      672 : Result := '672-Rejei��o: CT-e de Anula��o com diferen�a de Chave de Acesso';
      673 : Result := '673-Rejei��o: CT-e Substitu�do com diferen�a de Chave de Acesso';
      674 : Result := '674-Rejei��o: CT-e Objeto de Anula��o com diferen�a de Chave de Acesso';
      675 : Result := '675-Rejei��o: Valor do imposto n�o corresponde a base de calculo X aliquota';
      676 : Result := '676-Rejei��o: CFOP informado inv�lido';
      677 : Result := '677-Rejei��o: �rg�o de recep��o do evento inv�lido';
      678 : Result := '678-Rejei��o: Consumo Indevido. Aguarde 30 min antes de consultar novamente';
      679 : Result := '679-Rejei��o: O modal do CT-e deve ser Multimodal para Evento Registros do Multimodal';
      680 : Result := '680-Rejei��o: Tipo de Emiss�o diferente de EPEC';
      681 : Result := '681-Rejei��o: Informa��o n�o pode ser alterada por carta de corre��o';
      682 : Result := '682-Rejei��o: J� existe pedido de inutiliza��o com a mesma faixa de inutiliza��o';
      683 : Result := '683-Rejei��o: Chave de acesso de MDF-e inv�lida (Ano < 2012 ou Ano maior que Ano corrente)';
      684 : Result := '684-Rejei��o: Chave de acesso de MDF-e inv�lida (M�s = 0 ou M�s > 12)';
      685 : Result := '685-Rejei��o: Chave de acesso de MDF-e inv�lida (CNPJ zerado ou digito inv�lido)';
      686 : Result := '686-Rejei��o: Chave de acesso de MDF-e inv�lida (modelo diferente de 58)';
      687 : Result := '687-Rejei��o: Chave de acesso de MDF-e inv�lida (numero MDF = 0)';
      688 : Result := '688-Rejei��o: Grupo de informa��es do veiculo deve ser informado para Carga Lota��o';
      689 : Result := '689-Rejei��o: CT-e de anula��o n�o � permitido para CT-e cujo tomador � Contribuinte de ICMS.';
      690 : Result := '690-Rejei��o: CT-e Multimodal referenciado inexistente na base de dados da SEFAZ';
      691 : Result := '691-Rejei��o: CT-e Multimodal referenciado existe com diferen�a de chave de acesso';
      692 : Result := '692-Rejei��o: CT-e Multimodal referenciado n�o pode estar cancelado ou denegado';
      693 : Result := '693-Rejei��o: Grupo Documentos Transportados deve ser informado para tipo de servi�o diferente de redespacho intermedi�rio e servi�o vinculado a multimodal';
      694 : Result := '694-Rejei��o: Grupo Documentos Transportados n�o pode ser informado para tipo de servi�o redespacho intermedi�rio e servi�o vinculado a multimodal';
      695 : Result := '695-Rejei��o: CT-e com emiss�o anterior ao evento pr�vio (EPEC)';
      696 : Result := '696-Rejei��o: Existe EPEC aguardando CT-e nessa faixa de numera��o';
      697 : Result := '697-Rejei��o: Data de emiss�o do CT-e deve ser menor igual � data de autoriza��o da EPEC';
      698 : Result := '698-Rejei��o: Evento Pr�vio autorizado h� mais de 7 dias (168 horas)';
      699 : Result := '699-Rejei��o: CNPJ autorizado para download inv�lido';
      700 : Result := '700-Rejei��o: CPF autorizado para download inv�lido';
      712 : Result := '712-Rejei��o: C�digo de Munic�pio diverge da UF de localiza��o do emitente';
      713 : Result := '713-Rejei��o: Munic�pio do Emitente inexistente';
      715 : Result := '715-Rejei��o: Documento autorizado ao XML duplicado no CT-e';
      720 : Result := '720-Rejei��o: CT-e EPEC deve ser do tipo Normal';
      731 : Result := '731-Rejei��o: Consulta a uma Chave de Acesso muito antiga';
      733 : Result := '733-Rejei��o: CNPJ do documento anterior deve ser o mesmo indicado no grupo emiDocAnt';
      745 : Result := '745-Rejei��o: CNPJ base do tomador deve ser igual ao CNPJ base indicado no grupo emiDocAnt';
      746 : Result := '746-Rejei��o: Tipo de Servi�o inv�lido para o tomador informado';
      747 : Result := '747-Rejei��o: Documentos anteriores eletr�nicos informados para Tipo de Servi�o Normal';
      748 : Result := '748-Rejei��o: CT-e referenciado em documentos anteriores inexistente na base de dados da SEFAZ';
      749 : Result := '749-Rejei��o: CT-e referenciado em documentos anteriores existe com diferen�a de chave de acesso';
      750 : Result := '750-Rejei��o: CT-e referenciado em documentos anteriores n�o pode estar cancelado ou denegado';
      762 : Result := '762-Rejei��o: Chave de acesso de CT-e objeto da anula��o inv�lida (Ano < 2009 ou Ano maior que Ano corrente)';
      763 : Result := '763-Rejei��o: Chave de acesso de CT-e objeto da anula��o inv�lida (M�s = 0 ou M�s > 12)';
      764 : Result := '764-Rejei��o: Chave de acesso de CT-e objeto da anula��o inv�lida (CNPJ zerado ou digito inv�lido)';
      765 : Result := '765-Rejei��o: Chave de acesso de CT-e objeto da anula��o inv�lida (modelo diferente de 57)';
      766 : Result := '766-Rejei��o: Chave de acesso de CT-e objeto da anula��o inv�lida (n�mero CT = 0)';
      767 : Result := '767-Rejei��o: Chave de acesso de CT-e objeto da anula��o inv�lida (Tipo de emiss�o inv�lido)';
      768 : Result := '768-Rejei��o: Chave de acesso de CT-e objeto da anula��o inv�lida (UF inv�lida)';
      769 : Result := '769-Rejei��o: D�gito Verificador inv�lido na Chave de acesso de CT-e substitu�do';
      770 : Result := '770-Rejei��o: Chave de acesso de CT-e substitu�do inv�lida (Ano < 2009 ou Ano maior que Ano corrente)';
      771 : Result := '771-Rejei��o: Chave de acesso de CT-e substitu�do inv�lida (M�s = 0 ou M�s > 12)';
      772 : Result := '772-Rejei��o: Chave de acesso de CT-e substitu�do inv�lida (CNPJ zerado ou digito inv�lido)';
      773 : Result := '773-Rejei��o: Chave de acesso de CT-e substitu�do inv�lida (modelo diferente de 57)';
      774 : Result := '774-Rejei��o: Chave de acesso de CT-e substitu�do inv�lida (n�mero CT = 0)';
      775 : Result := '775-Rejei��o: Chave de acesso de CT-e substitu�do inv�lida (Tipo de emiss�o inv�lido)';
      776 : Result := '776-Rejei��o: Chave de acesso de CT-e substitu�do inv�lida (UF inv�lida)';
      777 : Result := '777-Rejei��o: D�gito Verificador inv�lido na Chave de acesso de CT-e complementado';
      778 : Result := '778-Rejei��o: Chave de acesso de CT-e complementado inv�lida (Ano < 2009 ou Ano maior que Ano corrente)';
      779 : Result := '779-Rejei��o: Chave de acesso de CT-e complementado inv�lida (M�s = 0 ou M�s > 12)';
      780 : Result := '780-Rejei��o: Chave de acesso de CT-e complementado inv�lida (CNPJ zerado ou digitoinv�lido)';
      781 : Result := '781-Rejei��o: Chave de acesso de CT-e complementado inv�lida (modelo diferente de 57)';
      782 : Result := '782-Rejei��o: Chave de acesso de CT-e complementado inv�lida (n�mero CT = 0)';
      783 : Result := '783-Rejei��o: Chave de acesso de CT-e complementado inv�lida (Tipo de emiss�o inv�lido)';
      784 : Result := '784-Rejei��o: Chave de acesso de CT-e complementado inv�lida (UF inv�lida) ';
      998 : Result := '998-Rejei��o: CT-e Multimodal e Servi�o Vinculado a Multimodal n�o est�o liberados no ambiente de produ��o. *** Regra provis�ria';
      999 : Result := '999-Rejei��o: Erro n�o catalogado (informar a mensagem de erro capturado no tratamento da exce��o)';    else
      case iStatus of
        201..299,401..999 : Result := IntToStr(iStatus)+'-CTe Rejeitado';
        301..399 : Result := IntToStr(iStatus)+'-Denega��o de Uso';
      else
        Result := IntToStr(iStatus)+'-Status desconhecido';
      end;
    end;
  except
  end;
end;


function FormataXMLString( const sTexto: String): String;
var
  slTexto : TStringList;
  i : Integer;
  c : Char;
begin
  // substitui caracteres em grego por caracteres reconhecidos em XML
  slTexto := TStringList.Create;
  try
    // CHR(3)
    slTexto.Add('3=');
    // Maiusculas
    slTexto.Add('913=&Alpha;');
    slTexto.Add('914=&Beta;');
    slTexto.Add('915=&Gamma;');
    slTexto.Add('916=&Delta;');
    slTexto.Add('917=&Epsilon;');
    slTexto.Add('918=&Zeta;');
    slTexto.Add('919=&Eta;');
    slTexto.Add('920=&Theta;');
    slTexto.Add('921=&Iota;');
    slTexto.Add('922=&Kappa;');
    slTexto.Add('923=&Lambda;');
    slTexto.Add('924=&Mu;');
    slTexto.Add('925=&Nu;');
    slTexto.Add('926=&Xi;');
    slTexto.Add('927=&Omicron;');
    slTexto.Add('928=&Pi;');
    slTexto.Add('929=&Rho;');
    slTexto.Add('931=&Sigma;');
    slTexto.Add('932=&Tau;');
    slTexto.Add('933=&Upsilon;');
    slTexto.Add('934=&Phi;');
    slTexto.Add('935=&Chi;');
    slTexto.Add('936=&Psi;');
    slTexto.Add('937=&Omega;');

    // Minusculas
    slTexto.Add('945=&alpha;');
    slTexto.Add('946=&beta;');
    slTexto.Add('947=&gamma;');
    slTexto.Add('948=&delta;');
    slTexto.Add('949=&epsilon;');
    slTexto.Add('950=&zeta;');
    slTexto.Add('951=&eta;');
    slTexto.Add('952=&theta;');
    slTexto.Add('953=&iota;');
    slTexto.Add('954=&kappa;');
    slTexto.Add('955=&lambda;');
    slTexto.Add('956=&mu;');
    slTexto.Add('957=&nu;');
    slTexto.Add('958=&xi;');
    slTexto.Add('959=&omicron;');
    slTexto.Add('960=&pi;');
    slTexto.Add('961=&rho;');
    slTexto.Add('962=&sigmaf;');
    slTexto.Add('963=&sigma;');
    slTexto.Add('964=&tau;');
    slTexto.Add('965=&upsilon;');
    slTexto.Add('966=&phi;');
    slTexto.Add('967=&chi;');
    slTexto.Add('968=&psi;');
    slTexto.Add('969=&omega;');

    Result := sTexto;
    for i := 0 to slTexto.Count -1 do
    begin
      c := Char(StrToIntDef(slTexto.Names[i],0));
      Result := StringReplace(Result,c,slTexto.ValueFromIndex[i],[rfReplaceAll]);
    end;
  finally
    slTexto.Free;
  end;
end;

procedure DeleteFieldByName ( DataSet : TDataSet; sFieldName: string );
var
  i : Integer;
begin
  DataSet.Fields.Remove( DataSet.FieldByName(sFieldName) );
end;

function PAD(Text: String; Size: Integer ;FillChar: String = ' '): String;
var
  i: Integer;
begin
  if ( Length(Text) > Size ) then
    Result := Copy(Text,1,Size)
  else
  begin
    Result := Text;
    for i := Length(Text) to ( Size - 1 ) do
      Result := Result + FillChar;
  end;
end;

function PADL(Text: String; Size: Integer ;FillChar: Char = ' '): String;
var
  i: Integer;
begin
  if ( Length(Text) > Size ) then
    Result := Copy(Text,( Length(Text)-Size+1 ),Size)
  else
  begin
    Result := Text;
    for i := Length(Text) to ( Size - 1 ) do
      Result := FillChar + Result;
  end;
end;

function PADC(Text: String; Size: Integer ;FillChar: Char = ' '): String;
var
  bDireita : Boolean;
begin
  Text := TrimLeft( TrimRight( Text ) );
  if ( Length(Text) > Size ) then
    Result := Copy(Text,(( Length(Text) div 2 ) - ( Size div 2 )),Size)
  else
  begin
    Result := Text;
    bDireita := True;
    repeat
      if bDireita then
        Result := PAD(Result, Length(Result)+1,FillChar)
      else
        Result := PADL(Result, Length(Result)+1,FillChar);
      bDireita := ( bDireita = False );
    until ( Length(Result) >= Size );
  end;
end;


function GetEndEstoque( sEndereco : String ): String;
begin
  Result := sEndereco;
  // Verifica se est� configurado para formatar o endere�o de estoque automaticamente
  if ( GetCampoConfig('FORMATAR_END_ESTOQUE').AsString = '1' ) then
  begin
    if ( sEndereco <> '' ) then
      Result := FormatMaskText('cc-ccc-cc-ccc;0;*', sEndereco);
  end;
end;

function GeraID_Mov_NSerie: Integer;
begin
  Result := Gen_ID('GEN_MOV_NSERIE_ID');
end;

function GeraID_Erros_Expedicao: Integer;
begin
  Result := Gen_ID('GEN_EXPEDICAO_ERROS_ID');
end;

function GetTipoTribIPI( sTipo : String ): String;
begin
  try
    case sTipo[1] of
      '0' : Result := '0-Tributada';
      '1' : Result := '1-Tributada com Al�quota Zero';
      '2' : Result := '2-Isenta';
      '3' : Result := '3-N�o Tributada';
      '4' : Result := '4-Imune';
      '5' : Result := '5-Com Suspens�o';
      '9' : Result := '9-Outras';
    else
      Result := sTipo;
    end;
  except
    Result := sTipo;
  end;
end;

function GetTipoOcorrenciaCobranca( sOcorrencia : String ): String;
var
  sl : TStrings;
  s : String;
begin
  sl := TStringList.Create;
  try
    sl.Add('01=Entrada');
    sl.Add('02=Baixa');
    sl.Add('04=Conceder Abatimento');
    sl.Add('05=Cancelar Abatimento');
    sl.Add('06=Alterar Vencto');
    sl.Add('07=Conceder Desconto');
    sl.Add('08=Cancelar Desconto');
    sl.Add('09=Protestar');
    sl.Add('10=Sustar protesto');
    Result := sOcorrencia;
    s := sl.Values[sOcorrencia];
    if ( s <> '' ) then
      Result := Result + '-' + s;
  finally
    sl.Free;
  end;
end;

procedure ValidaID(ds: TDataSet; sTabela: String; sCampo: String; bGeraAutoNumeracao: Boolean = True);
var
  sCodigoNovo,sCodigoAntigo : String;
  db : TDB;
begin
  if ( TClientDataSet(ds).UpdateStatus = usInserted ) and
     not( ds.FieldByName(sCampo).IsNull ) then
  begin
    db := TDB.Create;
    try
      db.CodigoSQL := 'select '+sCampo+' from '+sTabela+' where '+sCampo+' = :pID';
      TParam( db.Parametros.Add ).AssignFieldValue(ds.FieldByName(sCampo), ds.FieldByName(sCampo).Value);
      db.Abrir;
      // Se o c�digo j� existir, mostra a mensagem
      if not db.IsEmpty then
      begin
        ds.FieldByName(sCampo).FocusControl;
        Raise Exception.Create('O c�digo informado j� est� cadastrado.'+#13#10+
                               'Informe um c�digo v�lido.');
      end;
    finally
      db.Free;
    end;
  end
  else if ( VarIsClear(ds.FieldByName(sCampo).NewValue) ) then
  begin
    if bGeraAutoNumeracao then
    begin
      // Aqui valida com o bGeraAutoNumeracao
      // para gerar automaticamente, ser� necess�rio passar o valor True
      db := TDB.Create;
      try
        db.CodigoSQL := 'select coalesce(MAX(C.'+sCampo+'),''0'') as '+sCampo+' from '+sTabela+' C';
        db.Abrir;
        sCodigoAntigo := Trim(db.FieldByName(sCampo).AsString);
        // faz a convers�o do c�digo antigo pro novo,
        // se existir letras surgir� um erro e esse erro ser� tratado.
        try
          sCodigoNovo := IntToStr(StrToInt(sCodigoAntigo) + 1);
        except
          ds.FieldByName(sCampo).FocusControl;
          Raise Exception.Create('N�o foi poss�vel gerar o c�digo automaticamente.'+#13+#10+
                     'Verifique se existem c�digos formados por letras e se este for o caso,'+#13+#10+
                     'informe o c�digo manualmente.');
        end;
        //Se o campo n�o for inteiro, verifica se est� dentro do limite do campo (Size)
        if ( not ( db.FieldByName(sCampo) Is TIntegerField ) ) then
        begin
          //faz a valida��o se o pr�ximo n�mero est� dentro do limite da tabela
          if ( Length(sCodigoNovo) > db.FieldByName(sCampo).Size ) then
          begin
            ds.FieldByName(sCampo).FocusControl;
            Raise Exception.Create('Aparentemente, todos os c�digos dispon�veis para cadastro foram utilizados, verifique os c�digos cadastrados,'+#13#10+
                                    ' digite manualmente um c�digo dispon�vel ou entre em contato com o suporte.');
          end;
          sCodigoNovo := StrZero(sCodigoNovo,ds.FieldByName(sCampo).Size);
        end;
        ds.FieldByName(sCampo).AsString := sCodigoNovo;
      finally
        db.Free;
      end;
    end;
  end;
end;

procedure ValidaIDComposto(ds: TDataSet; sTabela: String; sCampo1: String; sCampo2: String);
var
  sSql : String;
  qry : TCustomSQLDataSet;
  pParams : TParams;
begin
  if ( ds.State in [dsInsert] ) and
     not( ds.FieldByName(sCampo1).IsNull ) then
  begin
    sSQL := 'select '+sCampo1+' from '+sTabela+' where '+sCampo1+' = :pParam1 and '+sCampo2+' = :pParam2 ';
    pParams := TParams.Create;
    try
      TParam(pParams.Add).AssignFieldValue(ds.FieldByName(sCampo1), ds.FieldByName(sCampo1).Value);
      TParam(pParams.Add).AssignFieldValue(ds.FieldByName(sCampo2), ds.FieldByName(sCampo2).Value);
      GetSQLConnection.Execute(sSQL,pParams,@qry);
      try
        // Se o c�digo j� existir, mostra a mensagem
        if not qry.IsEmpty then
        begin
          MessageDlg('Os c�digos informados j� est�o cadastrados no sistema. Insira valores v�lidos.', mtInformation, [mbOK], 0);
          ds.FieldByName(sCampo1).FocusControl;
          Abort;
        end;
      finally
        qry.Free;
      end;
    finally
      pParams.Free;
    end;
  end;
end;

function RemoveAcentos( s : String; sSubsTituiPor : String ): String;
// Remove caracteres acentuados de uma string
const
  ComAcento = '���������������������������������������������Ǻ�';
  SemAcento = 'aaaaaAAAAAeeeeEEEEiiiiIIIIoooooOOOOOuuuuUUUUcCoa';
var
  i : Integer;
begin
  for i := 1 to Length(s) do
  Begin
    if ( Pos(s[i],ComAcento) <> 0 ) then
    begin
      // Se n�o for informado um caractere para substitui��o,
      // substitui pela propria letra sem acento
      if ( sSubsTituiPor = '' ) then
        s[i] := SemAcento[Pos(s[i],ComAcento)]
      else
        s[i] := sSubsTituiPor[1];
    end;
  end;
  Result := s;
end;

function DataHoraServidor: TDateTime;
var
  db : TDB;
begin
  db := TDB.Create;
  try
    db.CodigoSQL := 'select current_timestamp as DATA_HORA from RDB$DATABASE';
    {$IFDEF MYSQL}
      db.CodigoSQL := 'select current_timestamp as DATA_HORA';
    {$ENDIF}
    db.Abrir;
    Result := db.Qry.FieldByName('DATA_HORA').AsDateTime;
  finally
    db.Free;
  end;
end;

function AlteraLinhaSelect(sSql : string; sIdLinha : String; sNovaLinha: String) : String;
var
  sl : TStringList;
  i, iIndex : Integer;
  sIDAtual, sLinhaAtual : String;
begin
  // Fun��o utilizada para modificar v�rias linhas em um select espec�fico
  // *detalhe: a fun��o altera TODAS as linhas que ela encontrar com o
  // prefixo utilizado
  // muito �til para utilizar no fast reports
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
        // Verifica se o ID informado � exatamente igual ao ID encontrado
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

function IAmAConsoleApp: Boolean;
var
  Stdout: THandle;
begin
  Stdout := GetStdHandle(Std_Output_Handle);
  Win32Check(Stdout <> Invalid_Handle_Value);
  Result := Stdout <> 0;
end;

function GetTipoBloqFaturamento( const sTipo : string): String;
begin
  Result := sTipo;
  try
    case sTipo[1] of
      'F': Result := 'F-Financeiro';
      'C': Result := 'C-Comercial';
      'N': Result := 'N-Nenhum';
    end;
  except
  end;
end;

function GeraProxNum( Documento : string; Incremento : Integer; con: TSQLConnection): Integer;
var
  db : TDB;
  bAbriuTransacaoAqui : Boolean;
begin
  db := TDB.Create(con);
  try

    if not db.TransacaoAtiva then
    begin
      bAbriuTransacaoAqui := True;
      db.AbreTransacao;
    end
    else
      bAbriuTransacaoAqui := False;
    try
      db.CodigoSQL := 'select PROXNUM from GERAPROXNUM(:pDocumento, :pIncremento)';
      db.AddParametro(Documento, ftString);
      db.AddParametro(Incremento, ftInteger);
      db.Abrir;
      Result := db.Qry.FieldByName('PROXNUM').AsInteger;
      if bAbriuTransacaoAqui then
        db.Commit;
    except
      if bAbriuTransacaoAqui then
        db.Rollback;
      raise;
    end;
  finally
    db.Free;
  end;
end;

procedure SetProxNum( Documento : string; Valor : Integer; con: TSQLConnection = nil);
var
  db : TDB;
begin
  db := TDB.Create(con);
  try
    db.CodigoSQL := 'update PARAM set PROXNUM = :pValor where DOCUMENTO = :pDocumento';
    db.AddParametro(Documento, ftString);
    db.AddParametro(Valor    , ftInteger);
    db.Executar;
  finally
    db.Free;
  end;
end;

function VarIsNumber( const Value : Variant ): Boolean;
var
  s : String;
begin
  s := VarToStrDef( Value, '' );
  try
    StrToFloat( s );
    Result := True;
  except
    Result := False;
  end;
  if not Result then
  begin
    try
      StrToInt( s );
      Result := True;
    except
      Result := False;
    end;
  end;
end;

function VarToFloatDef( const Value : Variant; Default : Double = 0 ): Double;
var
  s : String;
begin
  Result := Default;
  if VarIsNumber( Value ) then
  begin
    s := VarToStrDef( Value, '0');
    Result := StrToFloat( s );
  end;
end;

function DateString(dData: TDateTime): String;
var
  Dia,Mes,Ano : Word;
begin
  DecodeDate(dData,Ano,Mes,Dia);
  DateString := Format('%.4d%.2d%.2d',[Ano,Mes,Dia]);
end;


function CmToPixel(nCm : Double): Integer;
begin
  Result := Round( nCM * MMAsPixels );
end;

function PixelToCM(nPixels : Integer): Double;
begin
  Result := ( nPixels / MMAsPixels );
end;

function VerificaIE(const sIE, sUF: string): Boolean;
var
  iRet, iOk, iErro, iPar    : Integer;
  LibHandle : THandle;
  ConsisteInscricaoEstadual : TConsisteInscricaoEstadual;
begin
  try
    LibHandle :=  LoadLibrary (PChar (Trim ('DllInscE32.Dll')));
    if  LibHandle <=  HINSTANCE_ERROR then
      raise Exception.Create ('N�o foi poss�vel validar a Inscri��o estadual!'+#13+#10+
                              'Dll: DllInscE32.Dll n�o carregada!');

    @ConsisteInscricaoEstadual  :=  GetProcAddress (LibHandle,
                                                    'ConsisteInscricaoEstadual');
    if  @ConsisteInscricaoEstadual  = nil then
      raise Exception.Create ('N�o foi poss�vel validar a Inscri��o estadual!'+#13+#10+
                              'Entrypoint Download n�o encontrado na Dll');

    iRet := ConsisteInscricaoEstadual (ExtractNum(sIE), sUF);
    if IRet = 0 then
      Result := True
    else if Iret = 1 then
      Result := False
    else
      Result := False;
  finally
    FreeLibrary (LibHandle);
  end;
end;

function GetSpecialFolder(const CSIDL : integer) : string;
var
  {$IFDEF VER150}
    RecPath : PAnsiChar;
  {$ELSE}
    RecPath : PWideChar;
  {$ENDIF}
begin
  RecPath := StrAlloc(MAX_PATH);
  try
    FillChar(RecPath^,MAX_PATH,0);
    if SHGetSpecialFolderPath(0,RecPath,CSIDL,false) then
     result := RecPath
    else
      result := '';
  finally
    StrDispose(RecPath);
  end;
end;

function Formatar(Texto : string; TamanhoDesejado : integer; AcrescentarADireita : boolean = true; CaracterAcrescentar : char = ' ') : string;
{
   OBJETIVO: Eliminar caracteres inv�lidos e acrescentar caracteres � esquerda ou � direita do texto original para que a string resultante fique com o tamanho desejado

   Texto : Texto original
   TamanhoDesejado: Tamanho que a string resultante dever� ter
   AcrescentarADireita: Indica se o car�cter ser� acrescentado � direita ou � esquerda
      TRUE - Se o tamanho do texto for MENOR que o desejado, acrescentar car�cter � direita
             Se o tamanho do texto for MAIOR que o desejado, eliminar �ltimos caracteres do texto
      FALSE - Se o tamanho do texto for MENOR que o desejado, acrescentar car�cter � esquerda
             Se o tamanho do texto for MAIOR que o desejado, eliminar primeiros caracteres do texto
   CaracterAcrescentar: Car�cter que dever� ser acrescentado
}
var
   QuantidadeAcrescentar,
   TamanhoTexto,
   PosicaoInicial,
   i : integer;

begin
   case CaracterAcrescentar of
      '0'..'9','a'..'z','A'..'Z' : ;{N�o faz nada}
      else
         CaracterAcrescentar := ' ';
   end;

   Texto := Trim(AnsiUpperCase(Texto));
   TamanhoTexto := Length(Texto);
{$WARNINGS OFF}
   for i := 1 to (TamanhoTexto) do
   begin
      if Pos(Texto[i],' 0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ`~''"!@#$%^&*()_-+=|/\{}[]:;,.<>') = 0 then
      begin
         case Texto[i] of
            '�','�','�','�','�' : Texto[i] := 'A';
            '�','�','�','�' : Texto[i] := 'E';
            '�','�','�','�' : Texto[i] := 'I';
            '�','�','�','�','�' : Texto[i] := 'O';
            '�','�','�','�' : Texto[i] := 'U';
            '�' : Texto[i] := 'C';
            '�' : Texto[i] := 'N';
            else Texto[i] := ' ';
         end;
      end;
   end;
   QuantidadeAcrescentar := TamanhoDesejado - TamanhoTexto;
   if QuantidadeAcrescentar < 0 then
      QuantidadeAcrescentar := 0;
   if CaracterAcrescentar = '' then
      CaracterAcrescentar := ' ';
   if TamanhoTexto >= TamanhoDesejado then
      PosicaoInicial := TamanhoTexto - TamanhoDesejado + 1
   else
      PosicaoInicial := 1;

   if AcrescentarADireita then
      Texto := Copy(Texto,1,TamanhoDesejado) + StringOfChar(CaracterAcrescentar,QuantidadeAcrescentar)
   else
      Texto := StringOfChar(CaracterAcrescentar,QuantidadeAcrescentar) + Copy(Texto,PosicaoInicial,TamanhoDesejado);

   Result := AnsiUpperCase(Texto);
end;

function GetTipoEndereco( const sTipoEnd : string ): string;
begin
  Result := sTipoEnd;
  try
    case sTipoEnd[1] of
      'P' : Result := 'Pessoal';
      'C' : Result := 'Comercial';
      'O' : Result := 'Outros';
    end;
  except
  end;
end;


function SomaDiasUteis(dData: TDateTime; iDias: Integer) : TDateTime;
var
  i : Integer;
  iIncrementa : Integer;
begin
  iIncrementa := 1;
  if ( iDias < 0 ) then
    iIncrementa := -1;

  i := 0;

  Result := dData;
  while ( i <> iDias ) do
  begin
    Result := ( Result + iIncrementa );
    while Feriado(Result) or ( DayOfWeek(Result) in [1,7] ) do
      Result := ( Result + iIncrementa );
    i := ( i + iIncrementa );
  end;
end;

function GetTipoFrete( const sCodFrete: String ):String;
begin
  Result := sCodFrete+'-Desconhecido!';
  try
    case sCodFrete[1] of
      '0' : Result := sCodFrete+'-Remetente';
      '1' : Result := sCodFrete+'-Destinat�rio';
      '2' : Result := sCodFrete+'-Terceiros';
      '9' : Result := sCodFrete+'-Sem Frete';
    end;
  except
  end;
end;

function CalculaDVCorreio( sCodigo: string) : String;
var
  a, sDV : string;
  i : Integer;
  aN : Array[1..8] of Integer;
begin
  For i:=1 to 8 do
  begin
    a := copy(sCodigo,i,1);
    aN[i] := StrToIntDef(a,0);
  end;

  Result := FloatToStr( ( ((aN[1])*8) + ((aN[2])*6) + ((aN[3])*4) + ((aN[4])*2) + ((aN[5])*3) +
            ((aN[6])*5) + ((aN[7])*9) + ((aN[8])*7) ) mod 11 );

  if (Result = '0') then
    sDV := '5'
  else if(Result = '1') then
    sDV := '0'
  else
    sDV := FloatToStr( 11 - StrToFloat( Result ) );

  Result := sCodigo + sDV;
end;

function Dias_Uteis(const DataI,DataF:TDateTime):Integer;
var
  iInc : Integer;
  dData : TDateTime;
begin
  Result := 0;
  iInc   := 1;
  dData  := DataI;
  if ( DataI > DataF ) then
    iInc := -1;

  while ( dData <> DataF) do
  begin
    if DiaUtil(dData) then
      Result := Result + iInc;
    dData := dData + iInc;
  end;
end;

function GetClassificacaoCli( const sClassific : string): String;
begin
  Result := sClassific;
  try
    case sClassific[1] of
      'R': Result := 'R-Revendedor';
      'C': Result := 'C-Consumidor';
      'I': Result := 'I-Ind�stria';
      'A': Result := 'A-Atacadista c/regime especial';
    end;
  except
  end;
end;

function GetTipoDocFiscal(iModeloNF: Integer): String;
begin
  case iModeloNF of
    1 : Result := '1-NF Modelo 1';
    2 : Result := '2-Cupom Fiscal';
    4 : Result := '4-NF Produtor';
    55: Result := '55-NFe';
    57: Result := '57-CTe';
  else
    Result := IntToStr( iModeloNF )+'-Desconhecido';
  end;
end;

function BoolToChar( bValor : Boolean ): string;
begin
  if ( bValor ) then
    Result := '1'
  else
    Result := '0';
end;

function GetStatusPedidoCompra( const sStatus : String ): string;
begin
  Result := sStatus;
  try
    case sStatus[1] of
      'N' : Result := 'N-N�o recebido';
      'R' : Result := 'R-Recebido totalmente';
      'P' : Result := 'P-Recebido parcialmente';
      'C' : Result := 'C-Pedido Cancelado';
    end
  except
  end;
end;

function ConditionalDefined( sDefine : String ): Boolean;
begin
  sDefine := UpperCase( sDefine );
  if ( sDefine = 'WS_SISCOM' ) then
  begin
    {$IFDEF WS_SISCOM}
      Result := True;
    {$ELSE}
      Result := False;
    {$ENDIF}
  end
  else if ( sDefine = 'WS_INTERTEK' ) then
  begin
    {$IFDEF WS_INTERTEK}
      Result := True;
    {$ELSE}
      Result := False;
    {$ENDIF}
  end
  else if ( sDefine = 'REINOVO' ) then
  begin
    {$IFDEF REINOVO}
      Result := True;
    {$ELSE}
      Result := False;
    {$ENDIF}
  end
  else if ( sDefine = 'WS_CAIXA' ) then
  begin
    {$IFDEF WS_CAIXA}
      Result := True;
    {$ELSE}
      Result := False;
    {$ENDIF}
  end
  else if ( sDefine = 'CADTRAN' ) then
  begin
    {$IFDEF CADTRAN}
      Result := True;
    {$ELSE}
      Result := False;
    {$ENDIF}
  end
  else if ( sDefine = 'SERVICE_APPLICATION' ) then
  begin
    {$IFDEF SERVICE_APPLICATION}
      Result := True;
    {$ELSE}
      Result := False;
    {$ENDIF}
  end
  else if ( sDefine = 'TELEFLEX' ) then
  begin
    {$IFDEF TELEFLEX}
      Result := True;
    {$ELSE}
      Result := False;
    {$ENDIF}
  end;
end;

function Gen_ID(Generator: string; Increment : Integer; con: TSQLConnection): Integer;
var
  db : TDB;
begin
  db := TDB.Create(con);
  try
    db.CodigoSQL := 'select gen_id('+Generator+','+IntToStr(Increment)+') as ID'+#13#10+
                    'from rdb$database';
    db.Abrir;
    Result := db.FieldByName('ID').AsInteger;
  finally
    db.Free;
  end;
end;

function DiretorioTemporario : string;
var
  DiretorioTemp : PChar;
  TempBuffer    : Dword;
begin
  // fun��o que retorna o caminho do diret�rio tempor�rio do windows
  // http://www.planetadelphi.com.br/dica/6666/pegar-diretorio-temporario-do-windows-(tempdir)
  TempBuffer := 255;
  GetMem(DiretorioTemp,255);
  try
    GetTempPath(tempbuffer,diretoriotemp);
    result := DiretorioTemp;
  finally
    FreeMem(diretoriotemp);
  end;
end;

function SitConfToStr(Situacao: String): String;
begin
  try
    case Situacao[1] of
      '1' : Result := 'Confirmado';
      '2' : Result := 'Desconhecido';
      '3' : Result := 'N�o Realizado';
      '4' : Result := 'Ci�ncia';
    else
      Result := 'Sem Manifesta��o';
    end;
  except
    Result := '';
  end;
end;

function TpeToSitConf(tp: TpcnTpEvento): Integer;
var
  i : Integer;
begin
  i := 0;
  case tp of
    teManifDestConfirmacao :      i := 1;
    teManifDestDesconhecimento :  i := 2;
    teManifDestOperNaoRealizada : i := 3;
    teManifDestCiencia :          i := 4;
  end;
  Result := i;
end;

function SitNFeToStr(Situacao: String): String;
var
  b : Boolean;
  cSitDFE : TSituacaoDFe;
begin
  cSitDFE := StrToSituacaoDFe(b,Situacao);
  case cSitDFE of
    snAutorizado : Result := Situacao+'-Autorizado';
    snDenegado   : Result := Situacao+'-Denegado';
    snCancelado  : Result := Situacao+'-Cancelado';
    snEncerrado  : Result := Situacao+'-Encerrado';
  else
    Result := Situacao + '-Desconhecido';
  end;
end;

{$IFNDEF SERVICE_APPLICATION}
  procedure FinalizarAplicacao;
  begin
    if not Application.Terminated then
    begin
      Application.Terminate;
      Abort;
    end;
  end;

  function GetCorStatusConferenciaCx( const Conferencia, ControlaEmbalagem, Expedicao_Autorizado : String;
      const BloqFin : string = '0' ) : TcxStyle;
  var
    Style : TcxStyle;
  begin
    // pega o estilo padr�o, com fundo branco (clWindow) e texto preto (clWindowText)
    Style := GetcxStyleByName('cxStyleDefault');

    // se o pedido est� bloqueado para faturamento n�o importa os demais status
    if ( BloqFin = '1' ) then
    begin
      Style := GetcxStyleByName('cxStyleBloqFin');
    end
    else
    // S = SEPARADO
    if (Conferencia = 'S') then
    begin
      Style := GetcxStyleByName('cxStyleSeparado');
    end
    else
    // s = SEPARANDO
    if (Conferencia = 's') then
    begin
      Style := GetcxStyleByName('cxStyleSeparando');
    end
    else
    // C = CONFERIDO
    if (Conferencia = 'C') then
    begin
      // controla embalagem
      if ( ControlaEmbalagem = '0' ) then
      begin
        Style := GetcxStyleByName('cxStyleConferido');
      end
      else // ConferidoEmb
      begin
        Style := GetcxStyleByName('cxStyleConferidoEmb');
      end;
    end
    else
    // c = CONFERINDO
    if (Conferencia = 'c') then
    begin
      if ( ControlaEmbalagem = '0' ) then
      begin
        Style := GetcxStyleByName('cxStyleConferindo');
      end
      else // ConferindoEmb
      begin
        Style := GetcxStyleByName('cxStyleConferindoEmb');
      end;
    end
    else
    // EMBALADO
    if (Conferencia = 'E') then
    begin
      Style := GetcxStyleByName('cxStyleEmbalado');
    end
    else
    // EMBALANDO
    if (Conferencia = 'e') then
    begin
      Style := GetcxStyleByName('cxStyleEmbalando');
    end
    else
    begin
      // autorizado para expedi��o
      if (Expedicao_Autorizado = '1') then
      begin
        Style := GetcxStyleByName('cxStyleAutorizadoExped');
      end;
    end;

    Result := Style;
  end;

  function GetCorStatusConferenciaNFEcx( const Conferencia : String ): TcxStyle;
  var
    sStyle : TcxStyle;
  begin
    // pega o estilo padr�o, com fundo branco (clWindow) e texto preto (clWindowText)
    // N�O CONFERIDO
    sStyle := GetcxStyleByName('cxStyleDefault');

    if (Conferencia = 'C') then // CONFERIDO
    begin
      sStyle := GetcxStyleByName('cxStyleConferidoEntrada');
    end
    else
    if (Conferencia = 'c') then // CONFERINDO
    begin
      sStyle := GetcxStyleByName('cxStyleConferindoEntrada');
    end
    else
    if (Conferencia = 'R') then // RECEBIDO
    begin
      sStyle := GetcxStyleByName('cxStyleRecebidoEntrada');
    end;
    if (Conferencia = 'D') then // RECUSADO / DEVOLVIDO
    begin
      sStyle := GetcxStyleByName('cxStyleRecusadoEntrada');
    end;

    Result := sStyle;
  end;

  procedure CriarAbaMainForm( InstanceClass : TComponentClass; var Reference;
    Active : Boolean = False ; HighLight : Boolean = False);
  var
    pgControl : TcxPageControl;
    Instance: TComponent;
    i, PageIndex, iImageIndex : Integer;
    ImageList : TImageList;
  begin
    pgControl := TcxPageControl(Application.MainForm.FindComponent('pcPrincipal'));

    if not( Assigned(pgControl) ) then
      Exit;

    if ( TComponent(Reference) = nil ) then
    begin
      Instance := TComponent(InstanceClass.NewInstance);
      TComponent(Reference) := Instance;
      try
        Instance.Create(Application);
      except
        TComponent(Reference) := nil;
        raise;
      end;
    end;
    // Altera o tamanho do form para que ele n�o "pisque" na tela antes de ser dockado
    TForm(Reference).BorderStyle := bsNone;
    TForm(Reference).Width := 0;
    TForm(Reference).Height := 0;
    TForm(Reference).Show;

    iImageIndex := -1;
    if ( TForm(Reference).HostDockSite = nil ) then
    begin
      if ( TForm(Reference).Visible ) then
        TForm(Reference).Visible := False;
      TForm(Reference).ManualDock( pgControl );
      if Assigned( TForm(Reference).Icon ) then
      begin
        ImageList := TImageList( Application.MainForm.FindComponent('ilAbas') );
        if Assigned(ImageList) then
          iImageIndex := ImageList.AddIcon( TForm(Reference).Icon );
      end;
    end;

    PageIndex := 0;
    if ( TForm(Reference).HostDockSite is TcxPageControl ) then
    begin
      for i := 0 to pgControl.PageCount - 1 do
      begin
        if ( pgControl.Pages[i].ControlCount > 0 ) then
        begin
          if ( pgControl.Pages[i].Controls[0].ClassType = TForm(Reference).ClassType ) then
          begin
            PageIndex := i;
            pgControl.Pages[i].ImageIndex := iImageIndex;
            Break;
          end;
        end;
      end;
    end;
    if ( Active ) then
      pgControl.ActivePageIndex := PageIndex;

    pgControl.Pages[i].Highlighted := HighLight;

    TForm(Reference).Show;
  end;

  procedure AddLog( Texto : string ; slLog : TStrings = nil; sFilename : String = '';
    iMaxLinhas : Integer = 5000);
  var
    sl : TStringList;
    s : String;
  begin
    if ( sFilename = '' ) then
      sFileName := ChangeFileExt(Application.ExeName,'.log');
    sl := TStringList.Create;
    try
      if FileExists(sFileName) then
        sl.LoadFromFile(sFileName);
      s := DateTimeToStr( Now )+' - '+ Texto;
      sl.Add( s );
      if ( slLog <> nil ) then
        slLog.Add( s );
      while ( sl.Count > iMaxLinhas ) do
        sl.Delete(0);
      sl.SaveToFile(sFileName);
    finally
      sl.Free;
    end;

  end;

  function RevealHint( Control: TControl ): THintWindow;
  var
    ShortHint : String;
    AShortHint : array[0..255] of Char;
    HintPos: TPoint;
    HintBox : TRect;
  begin
    Result := THintWindow.Create(Control);
    ShortHint := GetShortHint( Control.Hint );
    HintPos := Control.ClientOrigin;
    Inc(HintPos.Y,Control.Height+6);
    HintBox := Bounds(0,0,Screen.Width,0);
    DrawText(Result.Canvas.Handle,StrPCopy(AShortHint,ShortHint),
      -1,HintBox,DT_CALCRECT or DT_LEFT or DT_WORDBREAK or DT_NOPREFIX);
    OffsetRect(HintBox,HintPos.X,HintPos.Y);
    Inc(HintBox.Right,6);
    Inc(HintBox.Bottom,2);
    if ( ShortHint <> '' ) then
      Result.ActivateHint(HintBox,ShortHint);
  end;

  procedure RemoveHint( var Hint : THintWindow );
  begin
    Hint.ReleaseHandle;
    Hint.Free;
    Hint := nil;
  end;

  procedure AcessaTelaCadastro(sFormName: String; Campo: TField = nil);
  var
    act : TAction;
    ds : TDataSource;
    iParam,iField : Integer;
    pParam : TParam;
    Formulario: TComponent;
  begin

    act := TAction( Application.MainForm.FindComponent('act' + sFormName ));

    if Assigned(act) and act.Execute then
    begin

      Formulario := Application.FindComponent(sFormName);

      ds := TDataSource( Formulario.FindComponent('ds'));

      if Assigned(ds) then
      begin
        ds.DataSet.Close;

        // Se n�o foi informado o campo chave, simplesmente abre o dataset
        if Assigned( Campo ) then
        begin
          // tenta encontrar os parametros e os campos chaves automaticamente
          iParam := 0;
          for iField := 0 to ( TClientDataSet(ds.DataSet).Fields.Count -1 ) do
          begin
            if ( pfInWhere in TClientDataSet(ds.DataSet).Fields.Fields[iField].ProviderFlags ) then
            begin
              pParam := TClientDataSet(ds.DataSet).Params.Items[iParam];
              // Se encontrou o parametro sai fora do la�o for
              Break;
            end;
          end;

          if ( Assigned(pParam)) then
          begin
            // Se n�o for informado o campo, limpa o parametro para
            // que a tela seja aberta em branco
            if Assigned( Campo ) then
              pParam.AssignFieldValue(Campo, Campo.Value)
            else
            begin
              pParam.Clear;
              pParam.Bound := True;
            end;
            AbrirDataSet( ds.DataSet );
          end
          else
          begin
            ShowMessage('Par�metro n�o encontrado.');
          end;
        end
        else
          AbrirDataSet( ds.DataSet );
      end;
    end
    else
    begin
      MessageDlg('Desculpe, voc� n�o tem permiss�o.', mtInformation, [mbOK], 0);
    end;
  end;


  procedure AcessaTelaCadastroStr(sFormName,Campo: String);
  var
    act : TAction;
    ds : TDataSource;
    iParam,iField : Integer;
    FieldSize : Integer;
    pParam : TParam;
    Formulario: TComponent;
  begin

    act := TAction( Application.MainForm.FindComponent('act' + sFormName ));

    if Assigned(act) and act.Execute then
    begin

      Formulario := Application.FindComponent(sFormName);

      ds := TDataSource( Formulario.FindComponent('ds'));

      if Assigned(ds) then
      begin
        ds.DataSet.Close;

        // tenta encontrar os parametros e os campos chaves automaticamente
        iParam := 0;
        for iField := 0 to ( TClientDataSet(ds.DataSet).Fields.Count -1 ) do
        begin
          if ( pfInWhere in TClientDataSet(ds.DataSet).Fields.Fields[iField].ProviderFlags ) then
          begin
            //Pega o tamanho do campo ( se o campo for do tipo Varchar )
            if ( TClientDataSet(ds.DataSet).Fields.Fields[iField].DataType = ftString ) then
              FieldSize := TClientDataSet(ds.DataSet).Fields.Fields[iField].Size;

            pParam := TClientDataSet(ds.DataSet).Params.Items[iParam];
            // Se encontrou o parametro sai fora do la�o for
            Break;
          end;
        end;

        if ( Assigned(pParam)) then
        begin

          if Campo <> '' then
          begin
            //Atribui o tamanho do campo ( se o campo for do tipo Varchar )
            if ( pParam.DataType = ftString ) then
              Campo := StrZero(Campo, FieldSize);

            pParam.Value := Campo;
          end
          else
            pParam.Value := null;

          AbrirDataSet( ds.DataSet );

        end
        else
        begin
          ShowMessage('Par�metro n�o encontrado.');
        end;
      end;
    end
    else
    begin
      MessageDlg('Desculpe, voc� n�o tem permiss�o.', mtInformation, [mbOK], 0);
    end;
  end;

  procedure GetFileInfo(AExt: string; var AInfo: TSHFileInfo;
    ALargeIcon: boolean);
  var
    uFlags : Integer;
  begin
    FillMemory(@AInfo,SizeOf(TSHFileInfo),0);
    uFlags := SHGFI_ICON+SHGFI_TYPENAME+SHGFI_USEFILEATTRIBUTES;
    if ALargeIcon then
      uFlags := uFlags + SHGFI_LARGEICON
    else
      uFlags := uFlags + SHGFI_SMALLICON;
    SHGetFileInfo(PChar(AExt),FILE_ATTRIBUTE_NORMAL,AInfo,SizeOf(TSHFileInfo),uFlags);
  end;

  function GetPermissoesUsuario( IDUsuario : Integer; Formulario : String ): Integer;
  var
    db : TDB;
  begin
    db := TDB.Create;
    try
      db.CodigoSQL := 'select P.PERMISSAO  '+
                      'from USUARIOS U '+
                      'join PUSUARIO P on ( P.CODIGO_PU = U.CAMPO04 ) '+
                      'where ( U.ID = '+ IntToStr( IDUsuario )+ ' ) '+
                      'and ( UPPER(P.FORMULARIO) = '+QuotedStr(UpperCase(Formulario))+' ) ';
      db.Abrir;
      Result := db.FieldByName('PERMISSAO').AsInteger;
    finally
      db.Free;
    end;
  end;

  function GetPermissoesUsuario( sUsuario : string; Formulario : string ): Integer;
  var
    db : TDB;
  begin
    db := TDB.Create;
    try
      sUsuario := PAD(sUsuario,20,' ');
      db.CodigoSQL := 'select U.CAMPO03, P.FORMULARIO, P.PERMISSAO '+
                      'from USUARIOS U '+
                      'join PUSUARIO P on ( P.CODIGO_PU = U.CAMPO04 ) '+
                      'where ( U.CAMPO03 = '+QuotedStr(Cripta(1,sUsuario))+ ' ) '+
                      'and ( UPPER(P.FORMULARIO) = '+QuotedStr(UpperCase(Formulario))+' ) ';
      db.Abrir;
      Result := db.FieldByName('PERMISSAO').AsInteger;
    finally
      db.Free;
    end;
  end;

  function GetCharSize(Canvas: TCanvas): TPoint; //� utilizado no InputCombo.
  var
    I: Integer;
    Buffer: array[0..51] of Char;
  begin
    for I := 0 to 25 do Buffer[I] := Chr(I + Ord('A'));
    for I := 0 to 25 do Buffer[I + 26] := Chr(I + Ord('a'));
    GetTextExtentPoint(Canvas.Handle, Buffer, 52, TSize(Result));
    Result.X := Result.X div 52;
  end;

  function InputCombo(const ACaption, APrompt: string; const AList: TStrings;iIndex : Integer = 0): string;
  var
    Form: TForm;
    Prompt: TLabel;
    Combo: TComboBox;
    DialogUnits: TPoint;
    ButtonTop, ButtonWidth, ButtonHeight: Integer;
  begin
    // fun��o para criar um pequeno formul�rio com um combobox
    // necess�rio passar uma lista de par�metros
    Result := '';
    Form   := TForm.Create(Application);
    with Form do
    try
      Canvas.Font := Font;
      DialogUnits := GetCharSize(Canvas);
      BorderStyle := bsDialog;
      Caption     := ACaption;
      ClientWidth := MulDiv(180, DialogUnits.X, 4);
      Position    := poScreenCenter;
      Prompt      := TLabel.Create(Form);
      with Prompt do
      begin
        Parent   := Form;
        Caption  := APrompt;
        Left     := MulDiv(8, DialogUnits.X, 4);
        Top      := MulDiv(8, DialogUnits.Y, 8);
        Constraints.MaxWidth := MulDiv(164, DialogUnits.X, 4);
        WordWrap := True;
      end;
      Combo := TComboBox.Create(Form);
      with Combo do
      begin
        Parent := Form;
        Style  := csDropDownList; // Caso o item possa ser digitado, altere aqui para csDropDowns
        Items.Assign(AList);
        Left      := Prompt.Left;
        Top       := Prompt.Top + Prompt.Height + 5;
        Width     := MulDiv(164, DialogUnits.X, 4);
        if ( Items.Count > iIndex ) then
          ItemIndex := iIndex
        else
          ItemIndex := 0;
      end;
      ButtonTop    := Combo.Top + Combo.Height + 15;
      ButtonWidth  := MulDiv(50, DialogUnits.X, 4);
      ButtonHeight := MulDiv(14, DialogUnits.Y, 8);
      with TButton.Create(Form) do
      begin
        Parent      := Form;
        Caption     := 'OK';
        ModalResult := mrOk;
        default     := True;
        SetBounds(MulDiv(38, DialogUnits.X, 4), ButtonTop, ButtonWidth,
          ButtonHeight);
      end;
      with TButton.Create(Form) do
      begin
        Parent      := Form;
        Caption     := 'Cancelar';
        ModalResult := mrCancel;
        Cancel      := True;
        SetBounds(MulDiv(92, DialogUnits.X, 4), Combo.Top + Combo.Height + 15,
          ButtonWidth, ButtonHeight);
        Form.ClientHeight := Top + Height + 13;
      end;
      if ShowModal = mrOk then
      begin
        Result := Combo.Text;
      end;
    finally
      Form.Free;
    end;
  end;

  function GetcxStyleByName( StyleName : string ): TcxStyle;
  var
    DM : TDataModule;
  begin
    DM := TDataModule( Application.FindComponent('DMCompartilhado') );
    if not Assigned(DM) then
      Exit;

    Result := TcxStyle( DM.FindComponent(StyleName) );
  end;

  function ValidaDataLancamento( Sender : TField; Acao : Integer ): Boolean;
  begin
    Result := ValidaDataLancamento( Sender.Value, Acao );
  end;

  function ValidaDataLancamento( Value : Variant; Acao : Integer ): Boolean;
  var
    act : TAction;
    sAcao : string;
  begin
    // ESSA FUN��O TRATA COM MENSAGENS O QUE A FUN��O 'VerificaPrazoLan�amento' VALIDA
    sAcao := '?';
    case Acao of
      ACESSA_GU   : sAcao := 'ACESSAR';
      INCLUI_GU   : sAcao := 'INCLUIR';
      ALTERA_GU   : sAcao := 'ALTERAR';
      CONSULTA_GU : sAcao := 'CONSULTAR';
      EXCLUI_GU   : sAcao := 'EXCLUIR';
      IMPRIME_GU  : sAcao := 'IMPRIMIR';
    end;

    Result := True;
    if not VarIsNull(Value) then
    begin
      if ( not VerificaPrazoLancamento(Value) ) then
      begin
        if TemPermissao('actFinanceiroQualquerData', Acao ) then
        begin
          if ( MessageDlg('A configura��o do sistema n�o permite '+ sAcao +' lan�amentos com esta data,'+#13#10+
                          'mas voc� tem permiss�o especial para continuar assim mesmo. '+#13#10+
                          'Deseja continuar?',mtConfirmation, [mbYes, mbNo],0) = mrYes ) then
          begin
            Result := True;
          end
          else
          begin
            Result := False;
          end;
        end
        else
        begin
          MessageDlg('Voc� n�o tem permiss�o de '+sAcao+ ' lan�amentos com esta data.', mtWarning, [mbOK], 0);
          Result := False;
        end;
      end;
    end;
  end;

  function VerificaPrazoLancamento(Sender:TField):Boolean;
  begin
    Result := VerificaPrazoLancamento(Sender.Value);
  end;

  function VerificaPrazoLancamento(Value:Variant):Boolean;
  var
    iDiferenca,i,iCont,iDiasLancFinanceiro : integer;
    dDataAtual, dValue : TDateTime;
  begin
    //  traz a data do servidor e o campo da configura��o da empresa para validar se
    //  a data digitada est� dentro do limite do campo DIAS_LANC_FINANCEIRO. se estiver dentro
    //  do prazo retorna TRUE, se n�o, FALSE
    dDataAtual := DateOf(DataHoraServidor); // pega a data de hoje
    iCont := 0;
    iDiasLancFinanceiro := GetCampoConfig('DIAS_LANC_FINANCEIRO').AsInteger;
    Result := False;
    if not VarIsNull(Value) then
    begin
      dValue := VarToDateTime(Value);
      if ( dValue <> dDataAtual ) then
      begin
        // CALCULA A DIFEREN�A ENTRE A DATA DE HOJE E A DATA DIGITADA
        // VERIFICANDO OS DIAS QUE S�O �TEIS E OS QUE N�O S�O
        iDiferenca := Round(dValue - dDataAtual);
        if ( iDiferenca < 0 ) then
        begin
          for i := -1 downto iDiferenca do
          begin
            dDataAtual := dDataAtual - 1;
            // SE O PRAZO M�XIMO PERMITIDO FOR 0, ENT�O ELE INCREMENTA INDEPENDENTE SE
            // � DIA �TIL OU N�O
            if ( DiaUtil(dDataAtual)) then
              Inc(iCont)
            else if ( iDiasLancFinanceiro = 0 ) then
              Inc(iCont);
          end;
        end
        else
        begin
          for i := 1 to iDiferenca do
          begin
            dDataAtual := dDataAtual + 1;
            // SE O PRAZO M�XIMO PERMITIDO FOR 0, ENT�O ELE INCREMENTA INDEPENDENTE SE
            // � DIA �TIL OU N�O
            if ( DiaUtil(dDataAtual)) then
              Inc(iCont)
            else if ( iDiasLancFinanceiro = 0 ) then
              Inc(iCont);
          end;
        end;
        Result := True;
        if ( iCont > iDiasLancFinanceiro ) then
          Result := False;
      end
      else
        Result := True;
    end;
  end;

  function TemPermissao(NomeAction: String; TipoPermissao: Integer ): Boolean;
  var
    act : TAction;
  begin
    // fun��o que verifica a permiss�o daquele usu�rio na action do par�metro
    act := TAction( Application.MainForm.FindComponent(NomeAction));
    Result := ( Assigned(act) and ( Acesso(TipoPermissao,act.Tag,False) ) );
  end;

  function WSSelecionaImpressora(const sImpressora : string ): String;
  begin
    if ( sImpressora <> '' ) then
    begin
      if ( Printer.Printers.IndexOf(sImpressora) >= 0 ) then
      begin
        Printer.PrinterIndex := Printer.Printers.IndexOf(sImpressora);
      end
      else
      begin
        MessageDlg('N�o foi poss�vel selecionar a impressora automaticamente!'+#13+#10+
                   'Voc� dever� selecionar a impressora desejada na caixa de di�logo de impress�o!', mtInformation, [mbOK], 0);
      end;
    end;
    // retorna a impressora selecionada atualmente
    Result := Printer.Printers.Strings[Printer.PrinterIndex];
  end;

  // seleciona impressora para relatorios criados com fastreport
  function WSSelecionaImpressoraFR(const sImpressora : string ): String;
  begin
    if ( sImpressora <> '' ) then
    begin
      if ( frxPrinters.IndexOf(sImpressora) >= 0 ) then
      begin
        frxPrinters.PrinterIndex := frxPrinters.IndexOf(sImpressora);
      end
      else
      begin
        MessageDlg('N�o foi poss�vel selecionar a impressora automaticamente!'+#13+#10+
                   'Voc� dever� selecionar a impressora desejada na caixa de di�logo de impress�o!', mtInformation, [mbOK], 0);
      end;
    end;
    // retorna a impressora selecionada atualmente
    Result := frxPrinters.Printers.Strings[frxPrinters.PrinterIndex];
  end;

  procedure WSGetPrinter(const sSecao: string; var sImpressora: String;
    var iCopias : Integer; var iFiltro : Integer); overload;
  var
    Reg : TRegIniFile;
  begin
    Reg := TRegIniFile.Create(REGISTRY_SECTION);
    try
      sImpressora := Reg.ReadString('Impressoras',sSecao,'');
      iCopias := Reg.ReadInteger('Impressoras',sSecao+'Copias',1);
      iFiltro := Reg.ReadInteger('Impressoras',sSecao+'Filtro',1);
    finally
      Reg.Free;
    end;
  end;

  procedure WSGetPrinter(const sSecao: string; var sImpressora: String); overload;
  var
    iCopias, iFiltro : Integer;
  begin
    WSGetPrinter( sSecao, sImpressora, iCopias, iFiltro );
  end;

  procedure WSSetPrinter(const sSecao, sImpressora: string; iCopias: Integer; iFiltro : Integer=1);
  var
    Reg : TRegIniFile;
  begin
    Reg := TRegIniFile.Create(REGISTRY_SECTION);
    try
      Reg.WriteString('Impressoras',sSecao,sImpressora);
      Reg.WriteInteger('Impressoras',sSecao+'Copias',iCopias);
      Reg.WriteInteger('Impressoras',sSecao+'Filtro',iFiltro);
    finally
      Reg.Free;
    end;
  end;

  procedure VerificaAliqICMS;
  var
    iRegimeEmpresa : Integer;
    dDataAliq : TDate;
    dxAlert : TdxAlertWindowManager;
  begin
    iRegimeEmpresa := GetCampoConfig('CRT').AsInteger;
    dDataAliq := GetCampoConfig('VENCTO_ALIQ_ICMS_SIMPLES').AsDateTime;
    // se a empresa n�o for optante pelo simples
    if ( iRegimeEmpresa <> 3 ) then
    begin
      // se a al�quota de icms estiver vencida
      if ( dDataAliq < DataHoraServidor ) then
      begin
        // se a configura��o de exibir o lembrete estiver marcada
        if ( GetCampoConfig('LEMBRETE_ALIQ_SIMPLES').AsInteger = 1 ) then
        begin
          // exibe o lembrete para atualizar a al�quota de ICMS do simples
          if ( TemPermissao('actfrmParamEmpresa',ALTERA_GU) ) then
          begin
            if (MessageDlg('A al�quota de aproveitamento do ICMS do simples est� vencida, '+#13+#10+
                            'verifique se houve altera��o na al�quota e atualize os dados'+#13+#10+
                            'antes de realizar qualquer faturamento. '+#13+#10+
                            'Deseja atualizar agora?', mtWarning, [mbYes, mbNo], 0) = mrYes ) then
            begin
              // se o cliente clicar em sim (deseja alterar), abre a tela dos par�metros de empresa
              // e define o focu para o campo da aliquota
              AcessaTelaCadastro('frmParamEmpresa');
              GetCampoConfig('SIMPLES_ALIQ_ICMS').FocusControl;
            end;
          end
          else
          begin
            // se o usu�rio n�o tiver permiss�o de alterar a al�quota, o sistema simplesmente
            // exibe uma janelinha com a mensagem
            dxAlert := TdxAlertWindowManager( Application.MainForm.FindComponent('dxAlertWindowManager1') );
            dxAlert.Show('Al�quota ICMS Vencida','A al�quota de aproveitamento do ICMS do simples est� vencida, '+#13+#10+
                         'verifique com o seu departamento fiscal se houve altera��o na '+#13+#10+
                         'al�quota antes de realizar qualquer faturamento.',23);
          end;
        end;
      end;
    end;
  end;

  function GeraVencimentoAliqICMS : TDate;
  var
    dDataIni, dDataFin, dDifFinalMes : TDate;
  begin
    // fun��o que verifica a data do vencimento da aliqICMS e incrementa a data
    dDataIni := GetCampoConfig('VENCTO_ALIQ_ICMS_SIMPLES').AsDateTime;
    dDataFin := IncMonth(dDataIni);
    if dDataIni <= DataHoraServidor then
    begin
      // conta os dias entre o dia e o ultimo dia da data atual
      // incrementa 1 m�s e atribui o dia de acordo com a diferen�a para o m�s final
      dDifFinalMes := EndOfTheMonth(dDataIni) - dDataIni;
      dDataFin := EndOfTheMonth(dDataFin) - dDifFinalMes;
      ShowMessage('Data de vencimento da al�quota do ICMS simples alterada de '+DateToStr(dDataIni)+
                    ' para '+ DateToStr(dDataFin));
    end
    else
      dDataFin := dDataIni;
    // retorna a nova data
    Result := dDataFin;
  end;

  function ModeloDFe( XML : String ): TModeloDFE;
  begin
    if pos('<infNFe', XML) > 0 then
      Result := mNFe;
    if pos('<infCte', XML) > 0 then
      Result := mCTe;
    if pos('InfNfse', XML) > 0 then
      Result := mNFSe;
    if pos('infMDFe', XML) > 0 then
      Result := mMDFe;
    if pos('procEventoNFe', XML) > 0 then
      Result := mEventoNFe;
    if pos('procEventoCTe', XML) > 0 then
      Result := mEventoCTe;
    if pos('procEventoMDFe', XML) > 0 then
      Result := mEventoMDFe;
  end;
  function GetSituacaoOrcamento( const Situacao : String ): string;
  begin
    Result := Situacao;
    try
      {$IFDEF Teleflex}
        case AnsiIndexStr(Situacao,['0','1','2','3']) of
          0 : Result := '0-Aguardando';
          1 : Result := '1-Aprovado';
          2 : Result := '2-N�o aprovado';
          3 : Result := '3-Faturado';
        end;
      {$ELSE}
        case AnsiIndexStr(Situacao,['0','1','P']) of
          0 : Result := '0-Pendente';
          1 : Result := '1-Faturado Totalmente';
          2 : Result := 'P-Faturado Parcialmente';
        end;
      {$ENDIF}
    except
    end;
  end;

  function IsMouseOverControl( Ctrl : TControl ): Boolean;
  var
    sr : TRect;
  begin
    try
      sr := Rect(ctrl.ClientToScreen(Point(0, 0)), ctrl.ClientToScreen(Point(ctrl.Width, ctrl.Height)));

      result := PtInRect(sr, Mouse.CursorPos);
    except
      Result := False;
    end;
  end;

  function PermitePersonalizarCondPagto: Boolean;
  var
    act : TAction;
    fldCOND_PAGTO_LIVRE : TField;
  begin
    // se a condi��o de pagamento n�o for livre
    // ent�o n�o permite que seja informada condi��es de pagamento manualmente
    fldCOND_PAGTO_LIVRE := GetCampoConfig('COND_PAGTO_LIVRE');
    Result := not Assigned( fldCOND_PAGTO_LIVRE) or ( fldCOND_PAGTO_LIVRE.AsString = '1' );
    if not Result then
    begin
      act := TAction( Application.MainForm.FindComponent('actfrmPedidos_PersonalizaCondPagto') );
      Result := Assigned(act) and Acesso(ACESSA_GU,act.Tag,False);
    end;
  end;

  procedure DisableProcessWindowsGhosting;
  var
    DisableProcessWindowsGhostingProc: procedure;
  begin
    DisableProcessWindowsGhostingProc := GetProcAddress(
      GetModuleHandle('user32.dll'),
      'DisableProcessWindowsGhosting');
    if Assigned(DisableProcessWindowsGhostingProc) then
      DisableProcessWindowsGhostingProc;
  end;

  procedure ListarMenu( ItemLinks : TdxBarItemLinks ;
    var sl : TStringList ; Caminho : String ; Separador : String);
  var
    I: Integer;
    actCaption, sAcao, sCaminho: String;
    Item : TdxBarItem;
  begin
    // fun��o recursiva, percorre um ItemLinks inserindo seus itens na stringlist
    // no formato DESCRICAO=ACAO
    // OBS: APENAS ADICIONA NA STRINGLIST OS ITENS QUE TEM ACTION
    for I := 0 to ItemLinks.Count-1 do
    begin
      Item := ItemLinks.Items[I].Item;
      if Assigned(Item) then
      begin
        if Item is TdxBarSubItem then
        begin
          sCaminho := StringReplace(TdxBarSubItem(Item).Caption, '&', '', [rfReplaceAll]);
          if Caminho <> '' then
            sCaminho := Caminho + Separador + sCaminho;
          ListarMenu(TdxBarSubItem(Item).ItemLinks,sl,sCaminho,Separador);
        end
        else if Item is TdxBarItem then
        begin
          if Assigned(Item.Action) then
          begin
            // pega a descri��o da action (texto bonito, caption)
            actCaption := StringReplace(TAction(Item.Action).Caption, '&', '', [rfReplaceAll]);
            if (Caminho <> '') then
              actCaption := Caminho + Separador + actCaption;

            // pega nome da action
            sAcao := TAction(Item.Action).Name;
            // remove ACT do nome da action
            sAcao := Copy(sAcao,4,Length(sAcao));
            sl.Add(actCaption+'='+sAcao);
          end;
        end;
      end;
    end;
  end;

  procedure CxDateEditValidate(Sender : TObject; var DisplayValue : Variant; var Error : Boolean);
  var
    bDataHora : Boolean;
    data : String;
  begin
    // PARA FUNCIONAR, EXIGE M�SCARA NO COMPONENTE
    // Properties->InputKind := ikMask

    // auto completa data
    // verifica se � somente data ou tem datahora
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

  procedure PreencherData(var Data : String; bDataHora : Boolean);
  var
    SeparadorTempo,SeparadorData,dia,mes,ano,hora,dataFinal : String;
    Agora : TDateTime;
    barra1,barra2,espaco,doispontos1,doispontos2 : Integer;
    fs : TFormatSettings;

    function Empty(s : String):Boolean;  begin Result := (s=EmptyStr); end;
  begin
    // pega a data/hora de agora para utilizar l� em baixo
    Agora := Now;

    // pega os separadores de data e hora
    GetLocaleFormatSettings(LOCALE_SYSTEM_DEFAULT, fs);
    SeparadorData := fs.DateSeparator;
    SeparadorTempo := fs.TimeSeparator;

    dia := '';
    mes := '';
    ano := '';
    hora := '00'+SeparadorTempo+'00'+SeparadorTempo+'00';

    // PERCORRE A MASCARA PEGANDO A POSI��O DOS SEPARADORES
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

    // verifica se a data digitada � vazia
    // SE DATA DIGITADA = VAZIO, SAI DO VALIDATE
    if Empty(dia) and Empty(mes) and Empty(ano) then
      Exit;

    // pega os dados da data se n�o forem digitados
    if Empty(dia) then
      dia := StrZero(DayOf(Agora).ToString,2);
    if Empty(mes) then
      mes := StrZero(MonthOf(Agora).ToString,2);
    if Empty(ano) then
      ano := YearOf(Agora).ToString;

    // MONTA A DATA FINAL
    dataFinal := dia+SeparadorData+mes+SeparadorData+ano;
    // SE TEM HORA, ENT�O MONTA A HORA FINAL
    if bDataHora then
    begin
      hora := Copy(Data,espaco+1,Length(hora));
      dataFinal := dataFinal+' '+hora;
    end;

    // atribui a datafinal para a vari�vel de refer�ncia
    Data := dataFinal;
  end;
{$ENDIF}

function IntToBool( iValue: Integer {0 -> FALSE 1 -> TRUE} ): Boolean;
begin
  case iValue of
    0: Result := False;
    1: Result := True;
  end;
end;
function BoolToInt( bValue: Boolean ): Integer;
begin
  if bValue then
    Result := 1
  else
    Result := 0;
end;
function IntToBoolDef( iValue: Integer; bPadrao : Boolean): Boolean;
begin
  case iValue of
    0: Result := False;
    1: Result := True;
    else Result := bPadrao;
  end;
end;

function TempoAsStr( nSegundos : Double ): String;
var
  iDias, iHoras, iMinutos, iSegundos : Integer;
  sTexto: String;
begin
  // Inicializa as variaveis
  iDias := 0;
  iHoras := 0;
  iMinutos := 0;
  iSegundos := Round( nSegundos );
  sTexto := '';

  if ( iSegundos >= SEGUNDOS_DIA ) then
  begin
    iDias := iSegundos div SEGUNDOS_DIA;
    iSegundos := iSegundos - ( iDias * SEGUNDOS_DIA );
  end;
  if ( iSegundos >= SEGUNDOS_HORA ) then
  begin
    iHoras := iSegundos div SEGUNDOS_HORA;
    iSegundos := iSegundos - ( iHoras * SEGUNDOS_HORA );
  end;
  if ( iSegundos >= SEGUNDOS_MINUTO ) then
  begin
    iMinutos := iSegundos div SEGUNDOS_MINUTO;
    iSegundos := iSegundos - ( iMinutos * SEGUNDOS_MINUTO );
  end;

  if ( iDias > 0 ) then
    sTexto := IntToStr( iDias ) + ' dias, ';
  sTexto := sTexto + IntToStr(iHoras)    + ' h, ';
  sTexto := sTexto + IntToStr(iMinutos)  + ' min';
  if (iSegundos > 0) then
    sTexto := sTexto + ' e ' + FloatToStr(iSegundos) + ' s';

  Result := sTexto;
end;

function GetLocalEstoque( const LocalEstoque : Variant ) : string;
begin
  Result := VarToStrDef(LocalEstoque,'');

  // No ws-servi�o procuro por um ID (integer) no banco
  // nos demais projetos � fixo

  if VarIsNumber(LocalEstoque) then
  begin
    Result := VarToStrDef(TDB.BuscaCampo('DESCRICAO','LOCAL_ESTOQUE',LocalEstoque,'ID'),'');
  end
  else if VarIsStr(LocalEstoque) then
  begin
    try
      case AnsiIndexText(VarToStr(LocalEstoque),['V','A','N','C','F','I']) of
        0 : Result := 'Estoque de Venda';
        1 : Result := 'Mercadoria Avariada';
        2 : Result := 'Nenhum';
        3 : Result := 'Cliente';
        4 : Result := 'Fornecedor';
        5 : Result := 'Indispon�vel';
      end
    except
    end;
  end;
end;

function SeparaNCM( var sNCM : String; iID_NCM : Integer ) : String;
var
  i : Integer;
  db : TDB;
begin

  if ( sNCM = '' ) then
  begin
    //Busca o NCM com o ID informado
    db := TDB.Create;
    try
      db.CodigoSQL := 'select CLASS_FISCAL from CLASS_FISCAL where ( ID = :p )';
      db.AddParametro(iID_NCM, ftInteger);
      db.Abrir;
      sNCM := db.FieldByName('CLASS_FISCAL').AsString;
    finally
      db.Free;
    end;
  end;

  sNCM := ExtractNum(sNCM);

  //Separo o NCM digitado para montar a array de compara��o para o CEST
  Result := '';
  for i := 1 to Length(sNCM) do
    Result := Result + QuotedStr(Copy(sNCM,1,i))+', ';

  //Remove a ultima v�rgula e fecha o arry de compara��o
  Result := '(' + Copy(Result,1,Length(Result)-2 ) + ')';

end;

function WSModDouble( Dividendo : Double; Divisor : Double ): Double;
var
  Quociente: integer;
  Resto: double;
begin
  if ( Divisor <> 0 ) then
  begin
    Quociente := Trunc( Dividendo / Divisor );
    Resto := Dividendo - ( Divisor * Quociente );
  end
  else
    Resto := 0;

  Result := Resto;
end;

function PrecoLiqProduto(const Preco, Desc1, Desc2, Desc3, Desc4,
  Desc5, Desc6: Double): Double;
var
  i : Integer;
begin
  i := DecimaisVlrUnit;
  Result := Preco;
  Result := Result - (( Result * Desc1 )/100);
  Result := Result - (( Result * Desc2 )/100);
  Result := Result - (( Result * Desc3 )/100);
  Result := Result - (( Result * Desc4 )/100);
  Result := Result - (( Result * Desc5 )/100);
  Result := Result - (( Result * Desc6 )/100);
  Result := WSRound(Result,i);
end;

function Instanciar(const Str_Class: TValue): TObject;
var
  C: TRttiContext;
  instancia: TRttiInstanceType;
  p: TRttiType;
  Erro: string;
begin
  try
    case Str_Class.Kind of
      tkString, tkLString, tkWString, tkUString:
        begin
          Erro := Str_Class.AsString + 'Classe N�o encontrada' + sLineBreak + '<Lembrete : verifique ortografia / Case Sensitive>' + sLineBreak;
          instancia := (C.FindType(Str_Class.AsString) as TRttiInstanceType);
          result := (instancia.MetaclassType.Create);
        end;
      tkClassRef:
        begin
          Erro := 'O par�metro passado deve ser do tipo Tclass' + sLineBreak;
          p := C.GetType(Str_Class.AsClass);
          instancia := (C.FindType(p.QualifiedName) as TRttiInstanceType);
          result := instancia.MetaclassType.Create;
        end;
    else
      begin
        Erro := 'O par�metro passado n�o � v�lidado para a fun��o' + sLineBreak;
        abort;
      end;
    end;
  except
    on e: Exception do
    begin
      raise Exception.Create(Erro + 'Erro Original: ' + sLineBreak + e.Message);
    end;
  end;
end;

function StrIsBool(text : String) : Boolean;
begin
  // Retorna se o texto � um boolean v�lido ou n�o
  try
    // executa StrToBool, se n�o der erro, ent�o a string � um Boolean v�lido.
    StrToBool(text);
    Result := True;
  except
    // se der erro, n�o � v�lida e ent�o retorna false
    Result := False;
  end;
end;

procedure IgnoreMethod( Instance: TObject; const PropName: string; CallBack : TProc);
var
  mtd : TMethod;
begin
  mtd := GetMethodProp(Instance, PropName);
  try
    TManipulator.SetValueToProperty(Instance, nil, PropName);
    CallBack;
  finally
    SetMethodProp(Instance, PropName, mtd);
  end;
end;

procedure KeepBookmark(DataSet: TDataSet; CallBack : TProc);
var
  bm : TBookmark;
begin
    bm := DataSet.GetBookmark;
    try
      CallBack;
    finally
      DataSet.GotoBookmark(bm);
    end;
end;

procedure DisableControlsForThis(DataSet: TDataSet; CallBack : TProc);
begin
    DataSet.DisableControls;
    try
      CallBack;
    finally
      DataSet.EnableControls;
    end;
end;

initialization
  bBusca_Dinamica := True;
  // Evita que as janelas modais fiquem atras do form principal
//  DisableProcessWindowsGhosting;

end.
