unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.SqlExpr, Data.DBXMySQL,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.StdCtrls, StrUtils, Vcl.ComCtrls, Datasnap.DBClient;

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
    procedure btnRunVehiclesClick(Sender: TObject);
    procedure btnRunCommentsClick(Sender: TObject);
    procedure fdqCommentsComentarioGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure btnConnectClick(Sender: TObject);
    procedure FDConnection1AfterConnect(Sender: TObject);
    procedure btnOpenVehiclesClick(Sender: TObject);
    procedure btnOpenCommentsClick(Sender: TObject);
  private
    { Private declarations }
    function ExtractFirstWord( var Source : String ) : String;
    function Exists( cds : TClientDataSet ) : Boolean;
    procedure AddToCds( cds : TClientDataSet );
    procedure DeleteComments;
    function InsertOrGetIdModel( sModel : String ; iIdBrand : Integer ) : Integer;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnRunVehiclesClick(Sender: TObject);
var
  sModel, sDescription : string;
begin
  // roda o código
  if chkDesabilitaControles.Checked then    
    dsVehicles.DataSet.DisableControls;
  try
    dsVehicles.DataSet.First;
    while not dsVehicles.DataSet.Eof do
    begin
      sDescription := dsVehicles.DataSet.FieldByName('description').AsString;
      sModel := ExtractFirstWord(sDescription);
      if Length(sModel) < 2 then
        sModel := sModel + ' ' + ExtractFirstWord(sDescription);

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

procedure TForm1.btnOpenCommentsClick(Sender: TObject);
begin
  fdqComments.Open;
end;

procedure TForm1.btnOpenVehiclesClick(Sender: TObject);
begin  
  fdqVehicles.Open;
end;

function TForm1.ExtractFirstWord( var Source : String ) : String;
begin
  // extrai a primeira palavra, remove da string e retorna a palavra.
  if Pos(' ',Source) = 0 then
    Result := Source
  else
  begin
    Result := Copy(Source,1,Pos(' ',Source)-1);
    Source := Copy(Source,Pos(' ',Source)+1,Length(Source)-Pos(' ',Source));
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

end.
