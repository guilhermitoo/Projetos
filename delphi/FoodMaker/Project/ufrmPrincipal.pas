unit ufrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls,
  System.Win.TaskbarCore, Vcl.Taskbar, System.ImageList, Vcl.ImgList,
  Vcl.ToolWin, Vcl.ButtonGroup, System.Actions, Vcl.ActnList, Vcl.Menus;

type
  TfrmPrincipal = class(TForm)
    sbPrincipal: TStatusBar;
    pnlTop: TPanel;
    pnlCenter: TPanel;
    pnlBottom: TPanel;
    pnlRight: TPanel;
    pnlLeft: TPanel;
    ilPrincipal: TImageList;
    mmPrincipal: TMainMenu;
    mniCadastros: TMenuItem;
    mniRelatrios: TMenuItem;
    tlbPrincipal: TToolBar;
    actlstPrincipal: TActionList;
    actClientes: TAction;
    btnClientes: TToolButton;
    mniClientes: TMenuItem;
    btnReceitas: TToolButton;
    actReceitas: TAction;
    actVendas: TAction;
    btnVendas: TToolButton;
    procedure actClientesExecute(Sender: TObject);
    procedure actReceitasExecute(Sender: TObject);
    procedure actVendasExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.actClientesExecute(Sender: TObject);
begin
  ShowMessage('Clientes');
end;

procedure TfrmPrincipal.actReceitasExecute(Sender: TObject);
begin
  ShowMessage('Receitas');
end;

procedure TfrmPrincipal.actVendasExecute(Sender: TObject);
begin
  ShowMessage('Vendas');
end;

end.
