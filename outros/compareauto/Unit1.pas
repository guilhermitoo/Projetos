unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.SqlExpr, Data.DBXMySQL, System.UITypes,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.StdCtrls, StrUtils, Vcl.ComCtrls, Datasnap.DBClient, System.Win.ComObj;

type
  TForm1 = class(TForm)
    FDConnection1: TFDConnection;
    fdqVehicles: TFDQuery;
    dsVehicles: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    btnRunVehicles: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid2: TDBGrid;
    fdqComments: TFDQuery;
    Panel2: TPanel;
    btnRunComments: TButton;
    dsComments: TDataSource;
    cdsComments_ok: TClientDataSet;
    fdqCommentsid: TLargeintField;
    fdqCommentsMarca: TStringField;
    fdqCommentsModelo: TStringField;
    fdqCommentsComentario: TMemoField;
    cdsComments_okid: TIntegerField;
    cdsComments_okcomentario: TMemoField;
    cdsComments_okMODELO: TStringField;
    cdsComments_okMARCA: TStringField;
    cdsComments_del: TClientDataSet;
    IntegerField1: TIntegerField;
    MemoField1: TMemoField;
    StringField1: TStringField;
    StringField2: TStringField;
    fdqAux: TFDQuery;
    pnlcon: TPanel;
    pnl1: TPanel;
    lbl1: TLabel;
    edtPassword: TEdit;
    Panel3: TPanel;
    Label2: TLabel;
    edtPort: TEdit;
    Panel4: TPanel;
    Label3: TLabel;
    edtDatabase: TEdit;
    Panel5: TPanel;
    Label4: TLabel;
    edtServer: TEdit;
    Panel6: TPanel;
    Label5: TLabel;
    edtUser: TEdit;
    btnConnect: TButton;
    btnOpenVehicles: TButton;
    btnOpenComments: TButton;
    stat1: TStatusBar;
    chkDesabilitaControles: TCheckBox;
    Button1: TButton;
    fdqCommentsmodel_id: TLargeintField;
    tsImportarComentarios: TTabSheet;
    dbgrdImpComments: TDBGrid;
    cdsImportComments: TClientDataSet;
    cdsImportCommentsid_comentario: TIntegerField;
    cdsImportCommentsmarca_ok: TStringField;
    cdsImportCommentsmodelo_ok: TStringField;
    cdsImportCommentspositivo: TMemoField;
    cdsImportCommentsnegativo: TMemoField;
    cdsImportCommentsestrelas: TIntegerField;
    dsImportComments: TDataSource;
    pnl2: TPanel;
    Panel7: TPanel;
    btnOpenFile: TButton;
    btnReadFile: TButton;
    dlgOpen1: TOpenDialog;
    edtFile: TEdit;
    btnUpdateDatabase: TButton;
    btnLoadBrandAndModelId: TButton;
    cdsImportCommentsmarca_id: TIntegerField;
    cdsImportCommentsmodelo_id: TIntegerField;
    procedure btnRunVehiclesClick(Sender: TObject);
    procedure btnRunCommentsClick(Sender: TObject);
    procedure fdqCommentsComentarioGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure btnConnectClick(Sender: TObject);
    procedure FDConnection1AfterConnect(Sender: TObject);
    procedure btnOpenVehiclesClick(Sender: TObject);
    procedure btnOpenCommentsClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cdsImportCommentspositivoGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsImportCommentsnegativoGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure btnOpenFileClick(Sender: TObject);
    procedure btnUpdateDatabaseClick(Sender: TObject);
    procedure btnLoadBrandAndModelIdClick(Sender: TObject);
    procedure btnReadFileClick(Sender: TObject);
  private
    { Private declarations }
    function ExtractFirstWord( var Source : String ; Separator : string = ' ') : String;
    function Exists( cds : TClientDataSet ) : Boolean;
    procedure AddToCds( cds : TClientDataSet );
    procedure DeleteComments;
    function InsertOrGetIdModel( sModel : String ; iIdBrand : Integer ) : Integer;
    procedure PrepareExceptions;
    function IsException(s : string) : Boolean;
    function GetSecValue( s : string ) : String;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  arquivo : TStringStream;
  a, b : array of String;

implementation

{$R *.dfm}

procedure TForm1.btnRunVehiclesClick(Sender: TObject);
var
  sModel, sDescription, sWord : string;
begin
  // roda o código
  if chkDesabilitaControles.Checked then    
    dsVehicles.DataSet.DisableControls;
  try
    dsVehicles.DataSet.First;
    while not dsVehicles.DataSet.Eof do
    begin
      sWord := '';
      sDescription := dsVehicles.DataSet.FieldByName('description').AsString;
      sModel := ExtractFirstWord(sDescription);
      if ( Length(sModel) < 2 ) or ( sModel.ToLower.Trim = 'grand' ) then
        sModel := sModel + ' ' + ExtractFirstWord(sDescription)
      else
      begin
        if ( IsException(sModel) ) then
        begin
          sWord := GetSecValue(sModel);
          sDescription := sDescription.ToLower;

          if Pos(sWord.Trim.ToLower,sDescription) > 0 then
          begin
            sModel := sModel + ' ' + sWord;
          end;          
        end;        
      end;

      dsVehicles.DataSet.Edit;
      dsVehicles.DataSet.FieldByName('model_id').AsInteger := 
          InsertOrGetIdModel(sModel,dsVehicles.DataSet.FieldByName('brand_id').AsInteger);
      dsVehicles.DataSet.Post;

      dsVehicles.DataSet.Next;
    end;    
  finally
    if chkDesabilitaControles.Checked then    
      dsVehicles.DataSet.EnableControls;
  end;
end;

procedure TForm1.btnUpdateDatabaseClick(Sender: TObject);
begin
  cdsImportComments.First;
  while not cdsImportComments.Eof do
  begin
//    fdqAux.SQL.Text := 'update vehicle_comments set model_id = :model_id where id = :id';
//    fdqAux.Params.Clear;
//    with fdqAux.Params.Add do
//    begin
//      DataType := ftInteger;
//      Name := 'model_id';
//      Value := dsComments.DataSet.FieldByName('model_id').Value;
//    end;
//    with fdqAux.Params.Add do
//    begin
//      DataType := ftInteger;
//      Name := 'id';
//      Value := dsComments.DataSet.FieldByName('ID').Value;
//    end;
//    fdqAux.Execute;

    cdsImportComments.Next;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if chkDesabilitaControles.Checked then
    dsComments.DataSet.DisableControls;
  try
    dsComments.DataSet.First;
    while not dsComments.DataSet.Eof do
    begin
      fdqAux.SQL.Text := 'update vehicle_comments set model_id = :model_id where id = :id';
      fdqAux.Params.Clear;
      with fdqAux.Params.Add do
      begin
        DataType := ftInteger;
        Name := 'model_id';
        Value := dsComments.DataSet.FieldByName('model_id').Value;
      end;
      with fdqAux.Params.Add do
      begin
        DataType := ftInteger;
        Name := 'id';
        Value := dsComments.DataSet.FieldByName('ID').Value;
      end;
      fdqAux.Execute;

      dsComments.DataSet.Next;
    end;
  finally
    if chkDesabilitaControles.Checked then
      dsComments.DataSet.EnableControls;
  end;
end;

procedure TForm1.cdsImportCommentsnegativoGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  Text := Sender.AsString;
end;

procedure TForm1.cdsImportCommentspositivoGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  Text := Sender.AsString;
end;

procedure TForm1.btnReadFileClick(Sender: TObject);
var
  value, sFile : String;
  eof : Boolean;
  next_separator : String;
  counter : Integer;
begin
  if edtFile.Text = '' then
    Exit;

  eof := False;

  sFile := arquivo.DataString;

  counter := 0;
  next_separator := ',';
  while not eof do
  begin
    value := ExtractFirstWord(sFile,next_separator);

    counter := counter + 1;
    if next_separator = '",' then
      next_separator := ',';

    if next_separator = ',"' then
      next_separator := '",';

    if (counter mod 7) = 0 then
      next_separator := ',"';



    if sFile.IsEmpty then
      eof := True;
  end;

end;

procedure TForm1.btnRunCommentsClick(Sender: TObject);
begin
  // percorra: para cada comentário
  //  verifica se ele existe na lista de comentários_definitivos
  //  caso exista, então salva o ID do comentário na lista de comentarios_excluidos
  if chkDesabilitaControles.Checked then      
    dsComments.DataSet.DisableControls;
  try
    dsComments.DataSet.First;
    while not dsComments.DataSet.Eof do
    begin
      if not Exists(cdsComments_ok) then
        AddToCds(cdsComments_ok)
      else
        AddToCds(cdsComments_del);

      dsComments.DataSet.Next;
    end;
  finally
    if chkDesabilitaControles.Checked then
      dsComments.DataSet.EnableControls;
  end;

  // percorre a lista de comentários_excluidos e exclui eles do banco de dados.
  DeleteComments;
end;

procedure TForm1.btnConnectClick(Sender: TObject);
begin
  try
    FDConnection1.Params.Values['Server'] := edtServer.Text;
    FDConnection1.Params.Values['Database'] := edtDatabase.Text;
    FDConnection1.Params.Values['Port'] := edtPort.Text;
    FDConnection1.Params.Values['User_Name'] := edtUser.Text;
    FDConnection1.Params.Values['Password'] := edtPassword.Text;

    FDConnection1.Connected := True;
  except
    on E: Exception do
    begin
      stat1.Panels.Items[0].Text := E.Message;
    end;
  end;
end;

procedure TForm1.btnLoadBrandAndModelIdClick(Sender: TObject);
begin
  if chkDesabilitaControles.Checked then
    dsComments.DataSet.DisableControls;

  try
    cdsImportComments.First;
    while not cdsImportComments.Eof do
    begin
      // obtem o id da marca
      fdqAux.SQL.Text := 'select id from brands where description = :dsc';
      fdqAux.Params.Clear;
      with fdqAux.Params.Add do
      begin
        DataType := ftString;
        Name := 'dsc';
        Value := cdsImportComments.FieldByName('marca_ok').Value;
      end;
      fdqAux.Open;

      cdsImportComments.Edit;
      cdsImportComments.FieldByName('marca_id').Value := fdqAux.FieldByName('id').Value;
      cdsImportComments.Post;

      // obtem o id do modelo
      fdqAux.SQL.Text := 'select id from models where description = :dsc';
      fdqAux.Params.Clear;
      with fdqAux.Params.Add do
      begin
        DataType := ftString;
        Name := 'dsc';
        Value := cdsImportComments.FieldByName('modelo_ok').Value;
      end;
      fdqAux.Open;

      cdsImportComments.Edit;
      cdsImportComments.FieldByName('modelo_id').Value := fdqAux.FieldByName('id').Value;
      cdsImportComments.Post;

      cdsImportComments.Next;
    end;
  finally
    if chkDesabilitaControles.Checked then
      dsComments.DataSet.EnableControls;
  end;
end;

procedure TForm1.btnOpenCommentsClick(Sender: TObject);
begin
  fdqComments.Open;
end;

procedure TForm1.btnOpenFileClick(Sender: TObject);
begin
  // usa dlgOpen1 para abrir a planilha e carregar na memória
  if dlgOpen1.Execute then
    edtFile.Text := dlgOpen1.FileName;

  arquivo.LoadFromFile(edtFile.Text);
end;

procedure TForm1.btnOpenVehiclesClick(Sender: TObject);
begin
  fdqVehicles.Open;
end;

function TForm1.ExtractFirstWord( var Source : String ; Separator : string = ' ') : String;
begin
  // extrai a primeira palavra, remove da string e retorna a palavra.
  if Pos(' ',Source) = 0 then
    Result := Source
  else
  begin
    Result := Copy(Source,1,Pos(Separator,Source)-1);
    Source := Copy(Source,Pos(Separator,Source)+1,Length(Source)-Pos(Separator,Source));
  end;
end;

procedure TForm1.FDConnection1AfterConnect(Sender: TObject);
begin
  stat1.Panels.Items[0].Text := 'database '+FDConnection1.Params.Values['Database']+' connected';
end;

procedure TForm1.fdqCommentsComentarioGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  Text := Sender.AsString;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  cdsComments_ok.CreateDataSet;
  cdsComments_del.CreateDataSet;
  cdsImportComments.CreateDataSet;
  arquivo := TStringStream.Create;
  PrepareExceptions;
end;

function TForm1.Exists(cds : TClientDataSet ) : Boolean;
begin
  // verifica se o registro selecionado no dsComments existe no cds informado
  Result := False;
  cds.First;
  while not cds.Eof do
  begin
    if ( (cds.FieldByName('COMENTARIO').AsString  = dsComments.DataSet.FieldByName('COMENTARIO').AsString) and
         (cds.FieldByName('MARCA').AsString       = dsComments.DataSet.FieldByName('MARCA').AsString) and
         (cds.FieldByName('MODELO').AsString      = dsComments.DataSet.FieldByName('MODELO').AsString) ) then
    begin
      Result := True;
      Break;
    end;

    cds.Next;
  end;
end;

procedure TForm1.AddToCds( cds : TClientDataSet );
begin
  // adiciona o registro selecionado no dsComments para o cds informado
  cds.Append;
  cds.FieldByName('ID').Value := dsComments.DataSet.FieldByName('ID').Value;
  cds.FieldByName('COMENTARIO').Value := dsComments.DataSet.FieldByName('COMENTARIO').Value;
  cds.FieldByName('MARCA').Value := dsComments.DataSet.FieldByName('MARCA').Value;
  cds.FieldByName('MODELO').Value := dsComments.DataSet.FieldByName('MODELO').Value;
  cds.Post;
end;

procedure TForm1.DeleteComments;
begin
  fdqAux.SQL.Text := 'delete from vehicle_comments where ( id = :id )';
  cdsComments_del.Last;
  while not cdsComments_del.Bof do
  begin
    fdqAux.Params.Clear;
    with fdqAux.Params.Add do
    begin
      Name := 'id';
      Value := cdsComments_del.FieldByName('id').Value;
    end;
    fdqAux.Execute;

    cdsComments_del.Delete;
  end;

end;

function TForm1.InsertOrGetIdModel( sModel : String ; iIdBrand : Integer ) : Integer;
begin
  fdqAux.SQL.Text := 'select * from models where (description = :dsc) and (brand_id = :bdi)';
  fdqAux.Params.Clear;
  with fdqAux.Params.Add do
  begin
    DataType := ftString;
    Name := 'dsc';
    Value := sModel;
  end;
  with fdqAux.Params.Add do
  begin
    DataType := ftInteger;
    Name := 'bdi';
    Value := iIdBrand;
  end;
  fdqAux.Open;

  if fdqAux.IsEmpty then
  begin
    fdqAux.SQL.Text := 'insert into models (description,brand_id) values(:dsc, :bdi)';
    fdqAux.Execute;

    fdqAux.Params.Clear;
    fdqAux.SQL.Text := 'SELECT LAST_INSERT_ID() AS id';
    fdqAux.Open;
  end;
  Result := fdqAux.FieldByName('id').Value;
end;

procedure TForm1.PrepareExceptions;
begin
  SetLength(a,9);
  SetLength(b,9);

  a[0] := 'A4';
  a[1] := 'Santa';
  a[2] := 'Range';
  a[3] := 'Palio';
  a[4] := 'Palio';
  a[5] := 'Eclipse';
  a[6] := 'L200';
  a[7] := 'M3';
  a[8] := 'SLK';

  b[0] := 'Avant';
  b[1] := 'Fé';
  b[2] := 'Rover';
  b[3] := 'Weekend';
  b[4] := 'Week.';
  b[5] := 'Cross';
  b[6] := 'Triton';
  b[7] := 'E36';
  b[8] := '250';
end;

function TForm1.IsException(s : string) : Boolean;
var
  I : integer;
begin
  Result := False;

  for I := 0 to Length(a)-1 do
  begin
    if s.Trim.ToLower = a[I].Trim.ToLower then
      Result := True;
  end;
end;

function TForm1.GetSecValue( s : string ) : String;
var
  I : Integer;
begin
  for I := 0 to Length(a)-1 do
  begin
    if s.Trim.ToLower = a[I].Trim.ToLower then
      Result := b[I];
  end;
end;

end.
