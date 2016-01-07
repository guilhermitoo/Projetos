unit uNextLevelExp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmNextLevelExp = class(TForm)
    edt1: TEdit;
    btn1: TButton;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNextLevelExp: TfrmNextLevelExp;

implementation

{$R *.dfm}

procedure TfrmNextLevelExp.btn1Click(Sender: TObject);
var
  lvl : Integer;
  exp : Double;
begin
  try
    lvl := StrToInt(edt1.Text);
    exp := ( 50*( lvl*lvl ) ) - (150*lvl) + 200;
    lbl1.Caption := FormatFloat('0,00', exp);
  except
    on E : Exception do
      ShowMessage(E.ClassName+' error gerado, com a mensagem : '+E.Message);
  end;
end;

end.
