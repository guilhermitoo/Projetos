unit uHelper;

interface

uses Data.DB, System.UITypes, Vcl.Forms, uDB_Controller;

implementation

procedure AbrirDataSet( ds : TDataSet );
var
  crOldCursor : TCursor;
  db : TDB;
  bAbriuTransacaoAqui : Boolean;
begin
  crOldCursor := Screen.Cursor;
  Screen.Cursor := crSqlWait;
  try
    bAbriuTransacaoAqui := False;

    db := TDB.Create;
    try
      if ( db.TransacaoAtiva ) then
        bAbriuTransacaoAqui := False
      else
      begin
        db.AbreTransacao;
        bAbriuTransacaoAqui := True;
      end;

      if ( ds.Active ) then
        ds.Close;
      ds.Open;

    finally
      if ( bAbriuTransacaoAqui ) then
        db.Commit;
      db.Free;
    end;
  finally
    Screen.Cursor := crOldCursor;
  end;
end;

end.
