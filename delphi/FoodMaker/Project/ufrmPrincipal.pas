unit ufrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls,
  System.Win.TaskbarCore, Vcl.Taskbar;

type
  TfrmPrincipal = class(TForm)
    sbPrincipal: TStatusBar;
    pnlTop: TPanel;
    pnlCenter: TPanel;
    pnlBottom: TPanel;
    pnlRight: TPanel;
    pnlLeft: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

end.
