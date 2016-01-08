unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    edt1: TEdit;
    btn1: TButton;
    lbl1: TLabel;
    lbl2: TLabel;
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
  lvl: integer;
begin
  try
    lvl := StrToInt(edt1.Text);
    lbl1.Caption := IntToStr( ( 50*( lvl*lvl ) ) - (150*lvl) + 200 );
  except
    on E : Exception do
      ShowMessage(E.ClassName+' error gerado, com a mensagem : '+E.Message);
  end;
end;

end.
