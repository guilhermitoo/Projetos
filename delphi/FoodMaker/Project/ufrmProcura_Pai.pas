unit ufrmProcura_Pai;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmPadrao, Data.DB, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls, System.ImageList,
  Vcl.ImgList, Vcl.StdCtrls, uDM, Data.FMTBcd, Data.SqlExpr, Datasnap.Provider,
  Datasnap.DBClient, Vcl.Mask, uHelper, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxContainer, dxCore, cxDateUtils, cxTextEdit, cxCalendar, cxMaskEdit,
  cxDropDownEdit, cxCalc;

type
  TfrmProcura_Pai = class(TfrmPadrao)
    sb: TStatusBar;
    pnlTop: TPanel;
    pnlCenter: TPanel;
    pnlBottom: TPanel;
    btnOK: TButton;
    il: TImageList;
    btnCancel: TButton;
    btnProcurar: TButton;
    cbbCampo: TComboBox;
    lblCampo: TLabel;
    ds: TDataSource;
    cds: TClientDataSet;
    dsp: TDataSetProvider;
    sql: TSQLDataSet;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    edtCalc: TcxCalcEdit;
    edtDate: TcxDateEdit;
    edtText: TcxTextEdit;
    procedure btnProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbbCampoSelect(Sender: TObject);
    procedure edtDatePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
  private
    { Private declarations }
    FSegundaCondicao: String;
    PrimeiraCondicao: String;
    ListaCampos : TStringList;

    // aplica os filtros na tela de procura
    procedure AplicarFiltro; virtual;

    // executa a busca
    procedure ExecutarFiltro; virtual; abstract;

    // preenche os campos do combobox
    procedure PreencherFiltro;

    // modifica o campo exibido de acordo com o campo selecionado
    procedure MudarFiltro;

    procedure SetSegundaCondicao(const Value: String);
  public
    { Public declarations }

    property SegundaCondicao : String read FSegundaCondicao write SetSegundaCondicao;
  end;

const
  MaskFloat = ',0.00';
  MaskDate = '00/00/0000';

var
  frmProcura_Pai: TfrmProcura_Pai;

implementation

{$R *.dfm}

{ TfrmProcura_Pai }

procedure TfrmProcura_Pai.AplicarFiltro;
var
  sCompara,sField : String;
begin
  if cds.Fields[ListaCampos.IndexOf(cbbCampo.Text)].Origin <> '' then
    sField := cds.Fields[ListaCampos.IndexOf(cbbCampo.Text)].Origin
  else
    sField := cds.Fields[ListaCampos.IndexOf(cbbCampo.Text)].FieldName;

  if cds.Fields[ListaCampos.IndexOf(cbbCampo.Text)] is TStringField then
    sCompara := ' like ''%:p1%'''
  else
    sCompara := ' = :p1';

  PrimeiraCondicao := 'and ('+ sField + sCompara + ')';


  sql.CommandText := AlteraLinhaSelect(sql.CommandText,'PRIMEIRACONDICAO',PrimeiraCondicao);
  sql.CommandText := AlteraLinhaSelect(sql.CommandText,'SEGUNDACONDICAO',SegundaCondicao);

  cds.Close;
  cds.FetchParams;
  if edtText.Visible then
    cds.ParamByName('p1').AsString := edtText.Text
  else if edtCalc.Visible then
    cds.ParamByName('p1').AsFloat := edtCalc.Value
  else if edtDate.Visible then
    cds.ParamByName('p1').AsDate := edtDate.Date;

  AbrirDataSet(ds.DataSet);
end;

procedure TfrmProcura_Pai.btnProcurarClick(Sender: TObject);
begin
  inherited;
  AplicarFiltro;
  ExecutarFiltro;
end;

procedure TfrmProcura_Pai.cbbCampoSelect(Sender: TObject);
begin
  inherited;
  MudarFiltro;
end;

procedure TfrmProcura_Pai.edtDatePropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  CxDateEditValidate(Sender,DisplayValue,Error);
end;

procedure TfrmProcura_Pai.FormCreate(Sender: TObject);
begin
  inherited;
  sql.SQLConnection := DM.conPrincipal;
  ListaCampos := TStringList.Create;
  PreencherFiltro;
end;

procedure TfrmProcura_Pai.FormDestroy(Sender: TObject);
begin
  inherited;
  ListaCampos.Free;
end;

procedure TfrmProcura_Pai.MudarFiltro;
begin
  // verifica o tipo do campo do dataset selecionado no campo e configura o
  edtText.Visible := False;
  edtDate.Visible := False;
  edtCalc.Visible := False;

  if (cds.Fields[ListaCampos.IndexOf(cbbCampo.Text)] is TStringField) then
  begin
    edtText.Visible := True;
  end
  else if (cds.Fields[ListaCampos.IndexOf(cbbCampo.Text)] is TNumericField) or
          (cds.Fields[ListaCampos.IndexOf(cbbCampo.Text)] is TIntegerField) then
  begin
    edtCalc.Visible := True;
  end
  else if (cds.Fields[ListaCampos.IndexOf(cbbCampo.Text)] is TDateField) or
          (cds.Fields[ListaCampos.IndexOf(cbbCampo.Text)] is TSQLTimeStampField) or
          (cds.Fields[ListaCampos.IndexOf(cbbCampo.Text)] is TDateTimeField) then
  begin
    edtDate.Visible := True;
  end;
end;

procedure TfrmProcura_Pai.PreencherFiltro;
var
  I: Integer;
  sCampo : String;
begin
  cbbCampo.Clear;
  // preenche o filtro no combobox
  for I := 0 to cds.Fields.Count-1 do
  begin
    // se o campo tem pfinWhere no provider flags, então deve ser considerado no filtro
    if (pfInWhere in cds.Fields[I].ProviderFlags) then
    begin
      if cds.Fields[I].DisplayLabel <> '' then
        sCampo := cds.Fields[I].DisplayLabel
      else
        sCampo := cds.Fields[I].FieldName;

      cbbCampo.AddItem(sCampo,TObject(nil));
      ListaCampos.Insert(I,sCampo);
    end;
  end;

  cbbCampo.ItemIndex := 0;
end;

procedure TfrmProcura_Pai.SetSegundaCondicao(const Value: String);
begin
  FSegundaCondicao := Value;
end;

end.
