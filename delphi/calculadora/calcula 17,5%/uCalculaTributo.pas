unit uCalculaTributo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    edt1: TEdit;
    lbl1: TLabel;
    btn1: TButton;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
var
  valor1, resultado: Double;
begin
  valor1 := StrToFloatDef(edt1.Text,1);
  resultado := valor1 * 0.1725;
  lbl1.Caption := FloatToStr(resultado);
end;

end.
