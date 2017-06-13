unit ufrmProcura_Pai;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmPadrao, Data.DB, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls, System.ImageList,
  Vcl.ImgList, Vcl.StdCtrls;

type
  TfrmProcura_Pai = class(TfrmPadrao)
    sb: TStatusBar;
    pnlTop: TPanel;
    pnlCenter: TPanel;
    dbgrd: TDBGrid;
    pnlBottom: TPanel;
    btnOK: TButton;
    il: TImageList;
    btnCancel: TButton;
    btnText: TButtonedEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProcura_Pai: TfrmProcura_Pai;

implementation

{$R *.dfm}

end.
