unit uNextLevelExp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Math;

type
  TfrmNextLevelExp = class(TForm)
    edt1: TEdit;
    btn1: TButton;
    lblProxLevel: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lblManaNecGasta: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    edtML: TEdit;
    btn2: TButton;
    lblExpAtual: TLabel;
    lbl7: TLabel;
    cbbClasses: TComboBox;
    lbl1: TLabel;
    lblDinheiroMP: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    lblQtd: TLabel;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
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
    //calcula exp level atual
    exp := ( ( 50 * Power((lvl-1),3) ) - (150 * Power((lvl-1),2) ) + ( 400*(lvl - 1) ) )/3;
    lblExpAtual.Caption := FormatFloat('0,00', exp);
    //calcula prox level
    exp := ( 50*( lvl*lvl ) ) - (150*lvl) + 200;
    lblProxLevel.Caption := FormatFloat('0,00', exp);
  except
    on E : Exception do
      ShowMessage(E.ClassName+' error gerado, com a mensagem : '+E.Message);
  end;
end;

procedure TfrmNextLevelExp.btn2Click(Sender: TObject);
var
  lvl : Integer;
  exp, dinheiro, qtd : Double;
  vBase : array of Double;
begin
  SetLength(vBase,3);
  vBase[0] := 1.1;
  vBase[1] := 3;
  vBase[2] := 1.4;
  try
    lvl := StrToInt(edtML.Text);
    exp := 1600 * Power(vBase[cbbClasses.ItemIndex],lvl);
    lblManaNecGasta.Caption := FormatFloat('0,00', exp);
    qtd := Trunc( exp / 100 );
    dinheiro := ( exp / 100 ) * 50;
    lblDinheiroMP.Caption := FormatFloat('0,00', dinheiro);
    lblQtd.Caption := FloatToStr(qtd);
  except
    on E : Exception do
      ShowMessage(E.ClassName+' error gerado, com a mensagem : '+E.Message);
  end;
end;

end.
