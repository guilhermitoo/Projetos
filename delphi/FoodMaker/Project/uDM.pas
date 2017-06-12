unit uDM;

interface

uses
  System.SysUtils, System.Classes, Data.DBXOdbc, Data.DB, Data.SqlExpr;

type
  TDM = class(TDataModule)
    conPrincipal: TSQLConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
