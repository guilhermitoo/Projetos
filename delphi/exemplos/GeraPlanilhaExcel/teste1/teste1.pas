unit teste1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBXpress, FMTBcd, StdCtrls, DB, DBClient, SqlExpr, Provider,
  Grids, DBGrids, ComObj;

type
  TForm1 = class(TForm)
    con1: TSQLConnection;
    dbgrd1: TDBGrid;
    dsp1: TDataSetProvider;
    ds1: TSQLDataSet;
    cds1: TClientDataSet;
    cdsds1ACAO: TStringField;
    cdsds1DESCRICAO: TStringField;
    intgrfldds1CODIGO_WINDSOFT: TIntegerField;
    cds1ACAO: TStringField;
    cds1DESCRICAO: TStringField;
    intgrfldcds1CODIGO_WINDSOFT: TIntegerField;
    ds2: TDataSource;
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
  coluna, linha: integer;
  excel: variant;
  valor: string;
  sPasta : String;
begin
  try
    excel:=CreateOleObject('Excel.Application');
    excel.Workbooks.add(1);
  except
    Application.MessageBox ('Versão do Ms-Excel'+'Incompatível','Erro',MB_OK+MB_ICONEXCLAMATION);
  end;

  ds2.DataSet.First;
  try
    for linha:=0 to ds2.DataSet.RecordCount-1 do
    begin
      for coluna:=1 to ds2.DataSet.FieldCount do
      begin
        valor:= ds2.DataSet.Fields[coluna-1].AsString;
        excel.cells [linha+2,coluna]:= valor;
      end;
      ds2.DataSet.Next;
    end;
    for coluna:=1 to ds2.DataSet.FieldCount do
    begin
      valor:= ds2.DataSet.Fields[coluna-1].DisplayLabel;
      excel.cells[1,coluna]:=valor;
    end;
    excel.columns.AutoFit;
    excel.visible:=true;
    sPasta := ExtractFilePath(Application.ExeName);
    excel.ActiveWorkbook.SaveAs(sPasta+'TestePlanilha.xls');
    excel.Kill('Plan1.xls');
    // mostrar uma mensagem avisando que salvou na sPasta
  except
    Application.MessageBox ('Aconteceu um erro desconhecido durante a conversão'+
      'da tabela para o Ms-Excel','Erro',MB_OK+MB_ICONEXCLAMATION);
  end;
end;

end.
