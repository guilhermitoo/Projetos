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
  FMX.ImgList, FMX.Edit;

type
  TForm1 = class(TForm)
    ilOffensive: TImageList;
    pnl1: TPanel;
    pnl2: TPanel;
    lv1: TListView;
    btn1: TButton;
    fdtbl1: TFDTable;
    fdtbl1ID: TStringField;
    fdtbl1NOME: TStringField;
    intgrfldfdtbl1IMAGEINDEX: TIntegerField;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    edtID: TEdit;
    edtNome: TEdit;
    edtIMAGEINDEX: TEdit;
    lbl1: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    btnGravar: TButton;
    lnkcntrltfld1: TLinkControlToField;
    lnkcntrltfld2: TLinkControlToField;
    lnkcntrltfld3: TLinkControlToField;
    procedure btn1Click(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.btn1Click(Sender: TObject);
begin
  fdtbl1.Refresh;
end;

procedure TForm1.btnGravarClick(Sender: TObject);
begin
  fdtbl1.Post;
end;

end.
