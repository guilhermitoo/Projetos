unit uMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, frxpngimage, ExtCtrls, Buttons, JvExExtCtrls,
  JvExtComponent, JvPanel;

type
  TfrmMenu = class(TForm)
    btnMage: TSpeedButton;
    btnFisico: TSpeedButton;
    JvPanel1: TJvPanel;
    img1: TImage;
    btnExp: TSpeedButton;
    procedure btnFisicoClick(Sender: TObject);
    procedure btnMageClick(Sender: TObject);
    procedure img1Click(Sender: TObject);
    procedure btnExpClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMenu: TfrmMenu;

implementation

uses UCalcMage, uDanoFisico, uNextLevelExp;

{$R *.dfm}

procedure TfrmMenu.btnFisicoClick(Sender: TObject);
begin
  if frmDanoFisico = nil then
    frmDanoFisico := TfrmDanoFisico.Create(Application);
  frmDanoFisico.Show;
end;

procedure TfrmMenu.btnMageClick(Sender: TObject);
begin
  if frmCalcMage = nil then
    frmCalcMage := TfrmCalcMage.Create(Application);
  frmCalcMage.Show;
end;

procedure TfrmMenu.img1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmMenu.btnExpClick(Sender: TObject);
begin
  if frmNextLevelExp = nil then
    frmNextLevelExp := TfrmNextLevelExp.Create(Application);
  frmNextLevelExp.Show;
end;

procedure TfrmMenu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(frmCalcMage);
  FreeAndNil(frmDanoFisico);
  FreeAndNil(frmNextLevelExp);
end;

end.
