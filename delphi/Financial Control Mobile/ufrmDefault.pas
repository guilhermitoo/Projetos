unit ufrmDefault;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TfrmDefault = class(TForm)
    lytHeader: TLayout;
    lytFooter: TLayout;
    lytCenter: TLayout;
    rtgHeader: TRectangle;
    rtgCenter: TRectangle;
    rtgFooter: TRectangle;
    lblTitle: TLabel;
    btn1: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDefault: TfrmDefault;

implementation

{$R *.fmx}

end.
