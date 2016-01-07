unit uMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, frxpngimage, ExtCtrls, Buttons, JvExExtCtrls,
  JvExtComponent, JvPanel;

type
  TfrmMenu = class(TForm)
    btn4: TSpeedButton;
    btn1: TSpeedButton;
    JvPanel1: TJvPanel;
    img1: TImage;
    procedure btn1Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure img1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMenu: TfrmMenu;

implementation

uses UCalcMage, uDanoFisico;

{$R *.dfm}

procedure TfrmMenu.btn1Click(Sender: TObject);
begin
  //  if frmCalcMage = nil then
//    frmCalcMage := TfrmCalcMage.Create(Application);

  frmDanoFisico.Show;

end;

procedure TfrmMenu.btn3Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmMenu.btn2Click(Sender: TObject);
begin
//  if frmDanoFisico = nil then
//    frmDanoFisico := TfrmDanoFisico.Create(Application);

  

end;

procedure TfrmMenu.btn4Click(Sender: TObject);
begin
  frmCalcMage.Show;
end;

procedure TfrmMenu.img1Click(Sender: TObject);
begin
  Close;
end;

end.
