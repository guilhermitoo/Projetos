unit ufrmResults;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, System.ImageList, FMX.ImgList;

type
  TfrmResults = class(TForm)
    lv1: TListView;
    il1: TImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmResults: TfrmResults;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

end.
