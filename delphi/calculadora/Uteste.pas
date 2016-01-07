unit Uteste;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,Math;

type
  TForm1 = class(TForm)
    edty: TEdit;
    edtx: TEdit;
    edt3: TEdit;
    btn1: TButton;
    lbl1: TLabel;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  result, x, y: Double;

implementation

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
begin

    x := StrToFloat(edtx.Text);
    y := StrToFloat(edty.Text);

    result := 50 * Power(y,(x-10));

    edt3.Text :=  FormatFloat(',0.00',result);

end;

end.
