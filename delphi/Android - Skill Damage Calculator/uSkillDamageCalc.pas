unit uSkillDamageCalc;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects, FMX.Edit, FMX.EditBox, FMX.NumberBox,
  FMX.ListBox, FMX.Layouts, System.ImageList, FMX.ImgList, uCharacters;

type
  TfrmSkillDamageCalc = class(TForm)
    Header: TToolBar;
    Footer: TToolBar;
    HeaderLabel: TLabel;
    img1: TImageControl;
    gplValores: TGridPanelLayout;
    edtLevel: TNumberBox;
    lbl1: TLabel;
    lbl2: TLabel;
    edtMagicLevel: TNumberBox;
    lbl3: TLabel;
    edtSkill: TNumberBox;
    lbl4: TLabel;
    edtWeaponDmg: TNumberBox;
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
    procedure imgOffensiveClick(Sender: TObject);
    procedure imgBalancedClick(Sender: TObject);
    procedure imgDefensiveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FCombatMode: TCombatMode;
    procedure SetCombatMode(const Value: TCombatMode);
    { Private declarations }
  public
    { Public declarations }
    property CombatMode : TCombatMode read FCombatMode write SetCombatMode;

  end;

var
  frmSkillDamageCalc: TfrmSkillDamageCalc;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

procedure TfrmSkillDamageCalc.FormCreate(Sender: TObject);
begin
  CombatMode := cmOffensive;
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

end.
