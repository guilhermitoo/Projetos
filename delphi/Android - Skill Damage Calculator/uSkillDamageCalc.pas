unit uSkillDamageCalc;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects, FMX.Edit, FMX.EditBox, FMX.NumberBox,
  FMX.ListBox, FMX.Layouts, System.ImageList, FMX.ImgList, uCharacters, Data.DB,
  FMX.ListView, FMX.ListView.Types, FMX.ListView.Appearances, FMX.ScrollBox, System.Math;

type
  TfrmSkillDamageCalc = class(TForm)
    Header: TToolBar;
    Footer: TToolBar;
    HeaderLabel: TLabel;
    img1: TImageControl;
    gplValores: TGridPanelLayout;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    gplPrincipal: TGridPanelLayout;
    grpPostura: TGroupBox;
    ilOffensive: TImageList;
    ilBalanced: TImageList;
    ilDefensive: TImageList;
    btnCalcular: TButton;
    grdlyt1: TGridLayout;
    imgOffensive: TImage;
    imgBalanced: TImage;
    imgDefensive: TImage;
    vsbPrincipal: TVertScrollBox;
    edtLevel: TEdit;
    edtMagicLevel: TEdit;
    edtSkill: TEdit;
    edtWeaponDmg: TEdit;
    procedure imgOffensiveClick(Sender: TObject);
    procedure imgBalancedClick(Sender: TObject);
    procedure imgDefensiveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCalcularClick(Sender: TObject);
    procedure FormVirtualKeyboardHidden(Sender: TObject;
      KeyboardVisible: Boolean; const [Ref] Bounds: TRect);
    procedure FormVirtualKeyboardShown(Sender: TObject;
      KeyboardVisible: Boolean; const [Ref] Bounds: TRect);
  private
    FCombatMode: TCombatMode;
    FKBBounds: TRectF;
    FNeedOffset: Boolean;
    procedure SetCombatMode(const Value: TCombatMode);
    procedure CalcContentBoundsProc(Sender: TObject;
                                    var ContentBounds: TRectF);
    procedure UpdateKBBounds;
    procedure RestorePosition;
    { Private declarations }
  public
    { Public declarations }
    property CombatMode : TCombatMode read FCombatMode write SetCombatMode;

  end;

var
  frmSkillDamageCalc: TfrmSkillDamageCalc;

implementation

{$R *.fmx}

uses ufrmResults, uPaladin;
{$R *.LgXhdpiPh.fmx ANDROID}

procedure TfrmSkillDamageCalc.btnCalcularClick(Sender: TObject);
var
  Paladin : TPaladin;

  procedure Cad(Sk : TSkill);
  var
    ms : TMemoryStream;
  begin
    frmResults.fdmtSkills.Append;

    frmResults.fdmtSkills.FieldByName('Skill').AsString := Sk.Name;
    frmResults.fdmtSkills.FieldByName('Damage').AsString := TCharacter.GetMinMax(Sk);

    ms := TMemoryStream.Create;
    try
      frmResults.ilSkills.Source.Items[frmResults.ilSkills.Source.IndexOf(sk.Name)].MultiResBitmap.Bitmaps[1].SaveToStream(ms);
      TBlobField(frmResults.fdmtSkills.FieldByName('Image')).LoadFromStream(ms);
    finally
      ms.Free;
    end;

    frmResults.fdmtSkills.Post;
  end;
begin
  if ( frmResults = nil ) then
    frmResults := TfrmResults.Create(Application);

  frmResults.fdmtSkills.Open;
  frmResults.ClearAllData;

  Paladin := TPaladin.Create;
  try
    Paladin.DistanceFighting := StrToInt(edtSkill.Text);
    Paladin.Level := StrToInt(edtLevel.Text);
    Paladin.CombatMode := CombatMode;
    Paladin.MagicLevel := StrToInt(edtMagicLevel.Text);
    Paladin.WeaponDamage := StrToInt(edtWeaponDmg.Text);
    Paladin.Calculate;

    Cad(Paladin.DivineCaldera);
    Cad(Paladin.DivineHealing);
    Cad(Paladin.DivineMissile);
    Cad(Paladin.EtherealSpear);
    Cad(Paladin.AttackDamage);
    Cad(Paladin.Salvation);
  finally
    Paladin.Free;
  end;

  frmResults.Show;
end;

procedure TfrmSkillDamageCalc.CalcContentBoundsProc(Sender: TObject;
  var ContentBounds: TRectF);
begin
  if FNeedOffset and (FKBBounds.Top > 0) then
  begin
    ContentBounds.Bottom := Max(ContentBounds.Bottom,
                                2 * ClientHeight - FKBBounds.Top);
  end;
end;

procedure TfrmSkillDamageCalc.FormCreate(Sender: TObject);
begin
  CombatMode := cmOffensive;
  vsbPrincipal.OnCalcContentBounds := CalcContentBoundsProc;
end;

procedure TfrmSkillDamageCalc.FormVirtualKeyboardHidden(Sender: TObject;
  KeyboardVisible: Boolean; const [Ref] Bounds: TRect);
begin
  FKBBounds.Create(0, 0, 0, 0);
  FNeedOffset := False;
  RestorePosition;
end;

procedure TfrmSkillDamageCalc.FormVirtualKeyboardShown(Sender: TObject;
  KeyboardVisible: Boolean; const [Ref] Bounds: TRect);
begin
  FKBBounds := TRectF.Create(Bounds);
  FKBBounds.TopLeft := ScreenToClient(FKBBounds.TopLeft);
  FKBBounds.BottomRight := ScreenToClient(FKBBounds.BottomRight);
  UpdateKBBounds;
end;

procedure TfrmSkillDamageCalc.imgBalancedClick(Sender: TObject);
begin
  CombatMode := cmBalanced;
end;

procedure TfrmSkillDamageCalc.imgDefensiveClick(Sender: TObject);
begin
  CombatMode := cmDefensive;
end;

procedure TfrmSkillDamageCalc.imgOffensiveClick(Sender: TObject);
begin
  CombatMode := cmOffensive;
end;

procedure TfrmSkillDamageCalc.SetCombatMode(const Value: TCombatMode);
var
  s : TSizeF;
begin
  s.Create(20,20);
  case Value of
    cmOffensive:
    begin
      imgOffensive.Bitmap := ilOffensive.Bitmap(s,1);
      imgBalanced.Bitmap := ilBalanced.Bitmap(s,0);      
      imgDefensive.Bitmap := ilDefensive.Bitmap(s,0);      
    end;
    cmBalanced:
    begin
      imgOffensive.Bitmap := ilOffensive.Bitmap(s,0);
      imgBalanced.Bitmap := ilBalanced.Bitmap(s,1);      
      imgDefensive.Bitmap := ilDefensive.Bitmap(s,0);      
    end;
    cmDefensive:
    begin
      imgOffensive.Bitmap := ilOffensive.Bitmap(s,0);
      imgBalanced.Bitmap := ilBalanced.Bitmap(s,0);      
      imgDefensive.Bitmap := ilDefensive.Bitmap(s,1);      
    end;
  end;

  FCombatMode := Value;
end;

procedure TfrmSkillDamageCalc.UpdateKBBounds;
var
  LFocused : TControl;
  LFocusRect: TRectF;
begin
  FNeedOffset := False;
  if Assigned(Focused) then
  begin
    LFocused := TControl(Focused.GetObject);
    LFocusRect := LFocused.AbsoluteRect;
    LFocusRect.Offset(vsbPrincipal.ViewportPosition);
    if (LFocusRect.IntersectsWith(TRectF.Create(FKBBounds))) and
       (LFocusRect.Bottom > FKBBounds.Top) then
    begin
      FNeedOffset := True;
      gplPrincipal.Align := TAlignLayout.Horizontal;
      vsbPrincipal.RealignContent;
      Application.ProcessMessages;
      vsbPrincipal.ViewportPosition :=
        PointF(vsbPrincipal.ViewportPosition.X,
               LFocusRect.Bottom - FKBBounds.Top);
    end;
  end;
  if not FNeedOffset then
    RestorePosition;
end;

procedure TfrmSkillDamageCalc.RestorePosition;
begin
  vsbPrincipal.ViewportPosition := PointF(vsbPrincipal.ViewportPosition.X, 0);
  gplPrincipal.Align := TAlignLayout.Client;
  vsbPrincipal.RealignContent;
end;

end.
