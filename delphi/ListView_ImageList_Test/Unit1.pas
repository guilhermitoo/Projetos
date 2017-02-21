unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.DBScope, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FMX.StdCtrls, FMX.ListView, FMX.Controls.Presentation, System.ImageList,
  FMX.ImgList, FMX.Edit, FireDAC.UI.Intf, FireDAC.FMXUI.Wait, FireDAC.Comp.UI,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FMX.Objects;

type
  TForm1 = class(TForm)
    ilOffensive: TImageList;
    pnl1: TPanel;
    pnl2: TPanel;
    lv1: TListView;
    btnRefresh: TButton;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    edtID: TEdit;
    edtNome: TEdit;
    edtIMAGEINDEX: TEdit;
    lbl1: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    btnPost: TButton;
    lnkcntrltfld2: TLinkControlToField;
    lnkcntrltfld3: TLinkControlToField;
    fdgxwtcrsr1: TFDGUIxWaitCursor;
    FDMemTable1: TFDMemTable;
    intgrfldFDMemTable1ID: TIntegerField;
    FDMemTable1NOME: TStringField;
    btnAppend: TButton;
    btnOpen: TButton;
    btnCancel: TButton;
    Label3: TLabel;
    edtIMGNAME: TEdit;
    btnIdx: TButton;
    blbfldFDMemTable1IMAGE: TBlobField;
    img1: TImage;
    procedure btnRefreshClick(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnAppendClick(Sender: TObject);
    procedure btnOpenClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnIdxClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.btnRefreshClick(Sender: TObject);
begin
  FDMemTable1.Refresh;
end;

procedure TForm1.btnAppendClick(Sender: TObject);
begin
  FDMemTable1.Append;
end;

procedure TForm1.btnCancelClick(Sender: TObject);
begin
  FDMemTable1.Cancel;
end;

procedure TForm1.btnIdxClick(Sender: TObject);
var
  ms : TMemoryStream;
begin
  img1.Bitmap := ilOffensive.Source.Items[ilOffensive.Source.IndexOf(edtIMGNAME.Text)].MultiResBitmap.Bitmaps[1];

  ms := TMemoryStream.Create;
  try
    ilOffensive.Source.Items[ilOffensive.Source.IndexOf(edtIMGNAME.Text)].MultiResBitmap.Bitmaps[1].SaveToStream(ms);

    TBlobField(FDMemTable1.FieldByName('IMAGE')).LoadFromStream(ms);
  finally
    ms.Free;
  end;
end;

procedure TForm1.btnOpenClick(Sender: TObject);
begin
  FDMemTable1.Open;
end;

procedure TForm1.btnPostClick(Sender: TObject);
begin
  FDMemTable1.Post;
end;

end.
