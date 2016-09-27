unit uSkillDamageCalc;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects, FMX.Edit, FMX.EditBox, FMX.NumberBox,
  FMX.ListBox;

type
  TfrmSkillDamageCalc = class(TForm)
    Header: TToolBar;
    Footer: TToolBar;
    HeaderLabel: TLabel;
    img1: TImageControl;
    nmbrbxLevel: TNumberBox;
    lblLevel: TLabel;
    nmbrbxMagicLevel: TNumberBox;
    lblML: TLabel;
    cbbClasse: TComboBox;
    lblClasses: TLabel;
    pnlDanoFisico: TPanel;
    nmbrbxSkill: TNumberBox;
    lblSkill: TLabel;
    nmbrbxAtaqueArma: TNumberBox;
    lblAtaqueArma: TLabel;
    btnLimpar: TButton;
    btnCalcular: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSkillDamageCalc: TfrmSkillDamageCalc;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

end.
