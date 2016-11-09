unit uPong;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Ani, FMX.Controls.Presentation, FMX.StdCtrls, Windows;

const
  OFFSET = 2;

type
  TfrmPong = class(TForm)
    pnlFundo: TPanel;
    rrBola: TRoundRect;
    stylbk1: TStyleBook;
    FloatAnimation1: TFloatAnimation;
    rectBaseTopo: TRectangle;
    rectBaseBaixo: TRectangle;
    tmr1: TTimer;
    txtStatus: TText;
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure tmr1Timer(Sender: TObject);
    procedure FloatAnimation1Process(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    function KeyIsDown(const Key: integer): boolean;
    function CheckCollision(r1 , r2 : TShape): boolean;
    function Between( v1, c1, c2 : Single ): boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPong: TfrmPong;

implementation

{$R *.fmx}

function TfrmPong.Between(v1, c1, c2: Single): boolean;
begin
  // OFFSET = margem de erro
  c1 := c1 - OFFSET;
  c2 := c2 + OFFSET;
  Result := (( v1 >= c1 ) and ( v1 <= c2 ));
end;

function TfrmPong.CheckCollision(r1 , r2 : TShape): boolean;
var
  r1y,r2y,r1x,r2x,r1yh,r2yh,r1xw,r2xw : Single;
begin
  r1y := r1.Position.Y;
  r1x := r1.Position.X;
  r2y := r2.Position.Y;
  r2x := r2.Position.X;

  r1yh := r1.Position.Y + r1.Height;
  r1xw := r1.Position.X + r1.Width;
  r2yh := r2.Position.Y + r2.Height;
  r2xw := r2.Position.X + r2.Width;

  Result := ( Between(r1y, r2y, r2yh) or Between(r1yh, r2y, r2yh) ) and
            ( Between(r1x, r2x, r2xw) or Between(r1xw, r2x, r2xw) );
end;

procedure TfrmPong.FloatAnimation1Process(Sender: TObject);
begin
  if CheckCollision(rrBola,rectBaseTopo) then
    FloatAnimation1.Inverse := False;
  if CheckCollision(rrBola,rectBaseBaixo) then
    FloatAnimation1.Inverse := True;
end;

procedure TfrmPong.FormCreate(Sender: TObject);
begin
  FloatAnimation1.StopValue := pnlFundo.Height;
  FloatAnimation1.StartValue := 0;
end;

procedure TfrmPong.FormKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);

  const fMovimento : Double = 10;

  procedure R( var Rect : TRectangle );
  begin // RIGHT
    Rect.Position.X := Rect.Position.X + fMovimento;
  end;

  procedure L( var Rect : TRectangle );
  begin // LEFT
    Rect.Position.X := Rect.Position.X - fMovimento;
  end;

  procedure U( var Rect : TRectangle );
  begin // UP
    Rect.Position.Y := Rect.Position.Y - fMovimento;
  end;

  procedure D( var Rect : TRectangle );
  begin // DOWN
    Rect.Position.Y := Rect.Position.Y + fMovimento;
  end;
begin
  // faz a movimentação das barras
  if ( KeyChar = 'a' ) then
    L(rectBaseTopo);
  if ( KeyChar = 'd' ) then
    R(rectBaseTopo);
  if ( KeyChar = 'w' ) then
    U(rectBaseTopo);
  if ( KeyChar = 's' ) then
    D(rectBaseTopo);

  if ( KeyChar = '1' ) then
    L(rectBaseBaixo);
  if ( KeyChar = '3' ) then
    R(rectBaseBaixo);
  if ( KeyChar = '5' ) then
    U(rectBaseBaixo);
  if ( KeyChar = '2' ) then
    D(rectBaseBaixo);
end;

function TfrmPong.KeyIsDown(const Key: integer): boolean;
begin
  Result := GetKeyState(Key) and 128 > 0;
end;

procedure TfrmPong.tmr1Timer(Sender: TObject);
begin
  txtStatus.Text := 'azul   Y:  ' + rectBaseTopo.Position.Y.ToString + #13#10 +
                    'azul   X:  ' + rectBaseTopo.Position.X.ToString + #13#10 +
                    'azul   YH: ' + (rectBaseTopo.Position.Y + rectBaseTopo.Height).ToString + #13#10 +
                    'azul   XW: ' + (rectBaseTopo.Position.X + rectBaseTopo.Width).ToString + #13#10 +
                    'cinza  Y:  ' + rectBaseBaixo.Position.Y.ToString + #13#10 +
                    'cinza  X:  ' + rectBaseBaixo.Position.X.ToString + #13#10 +
                    'cinza  YH: ' + (rectBaseBaixo.Position.Y + rectBaseBaixo.Height).ToString + #13#10 +
                    'cinza  XW: ' + (rectBaseBaixo.Position.X + rectBaseBaixo.Width).ToString;
end;

end.
