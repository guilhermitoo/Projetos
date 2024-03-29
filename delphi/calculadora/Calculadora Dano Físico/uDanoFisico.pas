unit uDanoFisico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  TfrmDanoFisico = class(TForm)
    edtLevel: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    cbbVoc: TComboBox;
    lbl3: TLabel;
    edtAtq: TEdit;
    lbl4: TLabel;
    btnCalcular: TBitBtn;
    btnLimpar: TBitBtn;
    lbl6: TLabel;
    edtSkill: TEdit;
    rgPost: TRadioGroup;
    lbl8: TLabel;
    pnlKnight: TPanel;
    lbl27: TLabel;
    lblHurMin: TLabel;
    lblMasMin: TLabel;
    lbl30: TLabel;
    lblExoriMin: TLabel;
    lbl32: TLabel;
    lblGranMin: TLabel;
    lbl34: TLabel;
    lbl35: TLabel;
    lbl36: TLabel;
    lblIcoMin: TLabel;
    lblHurMax: TLabel;
    lbl39: TLabel;
    lbl40: TLabel;
    lblMasMax: TLabel;
    lblExoriMax: TLabel;
    lblGranMax: TLabel;
    lblIcoMax: TLabel;
    lblMin: TLabel;
    lblMax: TLabel;
    lbl7: TLabel;
    pnlPaladin: TPanel;
    lbl5: TLabel;
    lblConMin: TLabel;
    lblSanMin: TLabel;
    lbl11: TLabel;
    lblMasSanMin: TLabel;
    lbl13: TLabel;
    lblExuraMin: TLabel;
    lbl15: TLabel;
    lbl17: TLabel;
    lblConMax: TLabel;
    lbl20: TLabel;
    lbl21: TLabel;
    lblSanMax: TLabel;
    lblMasSanMax: TLabel;
    lblExuraMax: TLabel;
    lblPalaMin: TLabel;
    lblPalaMax: TLabel;
    lbl46: TLabel;
    edtML: TEdit;
    lbl9: TLabel;
    lblPalaHP: TLabel;
    lblPalaMP: TLabel;
    lblKinaHP: TLabel;
    lblKinaMP: TLabel;
    lbl10: TLabel;
    lblCap: TLabel;
    procedure Melee(AtqArma: Integer;Skill: Integer; Level: Integer; FatorDano: Double; ML: Integer);
    procedure Distance(AtqArma: Integer;Skill: Integer; Level: Integer; FatorDano: Double; ML: Integer);
    procedure Calcular();
    procedure btnCalcularClick(Sender: TObject);
    procedure LimparCampos();
    procedure btnLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDanoFisico: TfrmDanoFisico;
  dFatorDano: Double;
  iAtqArma, iSkill, iLevel, iMagic: Integer;

implementation

{$R *.dfm}

procedure TfrmDanoFisico.Calcular;
begin
  if edtLevel.Text <> '' then
  begin
    if edtAtq.Text <> '' then
    begin
      if edtSkill.Text <> '' then
      begin
        iLevel := StrToInt(edtLevel.Text);
        iAtqArma := StrToInt(edtAtq.Text);
        iSkill := StrToInt(edtSkill.Text);
        iMagic := StrToInt(edtML.Text);
        if rgPost.ItemIndex = 0 then
          dFatorDano := 1
        else
        begin
          if rgPost.ItemIndex = 1 then
            dFatorDano := 0.75
          else
            dFatorDano := 0.5;
        end;
        if cbbVoc.ItemIndex = 0 then
          Melee(iAtqArma,iSkill,iLevel,dFatorDano,iMagic)
        else
          Distance(iAtqArma,iSkill,iLevel,dFatorDano,iMagic);
      end
      else
      begin
        ShowMessage('Digite o skill.');
        edtSkill.SetFocus;
      end;
    end
    else
    begin
      ShowMessage('Digite o ataque da arma.');
      edtAtq.SetFocus;
    end;
  end
  else
  begin
    ShowMessage('Digite o level.');
    edtLevel.SetFocus;
  end;
end;

procedure TfrmDanoFisico.Distance(AtqArma, Skill, Level: Integer;
  FatorDano: Double; ML: Integer);
var
  iMax,iMin, iConMin, iConMax, iSanMin, iSanMax, iMasSanMin, iMasSanMax, iExuraMin, iExuraMax,iHP,iMP,iCap: integer;
begin
  // Dano � dist�ncia

  //exibindo painel dos resultados de paladin
  pnlPaladin.Width := 345;
  pnlKnight.Width := 1;
  frmDanoFisico.Width := 660;

  //HP e MP
  iHP := Round(((Level - 8) * 10) + 185);
  iMP := Round(((Level - 8) * 15) + 35);

  iConMin := Round(((Skill + 25) / 3 ) + ( Level / 5 ));
  iConMax := Round((Skill + 25) + ( Level / 5 ));
  iSanMin := Round((Level*0.2)+(ML*1.79)+11);
  iSanMax := Round((Level*0.2)+(ML*3)+18);
  iMasSanMin := Round(( Level / 5 ) + ( ML * 4 ));
  iMasSanMax := Round(( Level / 5 ) + ( ML * 6 ));
  iExuraMin := Round(( Level / 5 ) + ( ML * 18.5 ));
  iExuraMax := Round(( Level / 5 ) + ( ML * 25 ));
  iMin := Round( Level / 5 );
  iMax := Round( 0.09 * FatorDano * Skill * AtqArma ) + iMin;
  iCap := Round((Level * 20)+310);

  lblPalaMin.Caption := IntToStr(iMin);
  lblPalaMax.Caption := IntToStr(iMax);
  lblConMin.Caption := IntToStr(iConMin);
  lblConMax.Caption := IntToStr(iConMax);
  lblSanMin.Caption := IntToStr(iSanMin);
  lblSanMax.Caption := IntToStr(iSanMax);
  lblMasSanMin.Caption := IntToStr(iMasSanMin);
  lblMasSanMax.Caption := IntToStr(iMasSanMax);
  lblExuraMin.Caption := IntToStr(iExuraMin);
  lblExuraMax.Caption := IntToStr(iExuraMax);
  lblPalaHP.Caption := IntToStr(iHP);
  lblPalaMP.Caption := IntToStr(iMP);
  lblCap.Caption := IntToStr(iCap);

end;

procedure TfrmDanoFisico.Melee(AtqArma, Skill, Level: Integer; FatorDano: Double; ML: Integer);
var
  iMax,iMin,iHurMin,iHurMax,iMasMin,iMasMax,iExoriMin,iExoriMax,iGranMin,iGranMax,iIcoMin,iIcoMax,iHP,iMP,iCap: integer;
begin
  // Dano corpo a corpo

  // exibindo o painel dos resultados de knight
  pnlPaladin.Width := 1;
  pnlKnight.Width := 320;
  frmDanoFisico.Width := 660;

  //HP e MP
  iHP := Round(((Level - 8) * 15) + 185);
  iMP := Round((Level - 1) * 5);

  iHurMin := Round((( Skill + AtqArma ) / 3) + (Level / 5));
  iHurMax := Round(( Skill + AtqArma ) + (Level / 5));
  iMasMin := Round((0.5 * (Skill + AtqArma)) + (Level/5));
  iMasMax := Round((1.1 * (Skill + AtqArma)) + (Level/5));
  iExoriMin := Round(((Skill + AtqArma) * 0.5) +(Level/5));
  iExoriMax := Round(((Skill + AtqArma) * 1.5) +(Level/5));
  iGranMin := Round(((Skill + ( AtqArma * 2 )) * 1.1) +(Level/5));
  iGranMax := Round(((Skill + ( AtqArma * 2 )) * 3) +(Level/5));
  iIcoMin := Round((Level*0.2)+(ML*4)+25);
  iIcoMax := Round((Level*0.2)+(ML*7.95)+51);
  iMin := 0;
  iMax := Round(( 0.085 * FatorDano * AtqArma * Skill ) + ( Level / 5 ));
  iCap := Round((Level*25)+270);

  lblMin.Caption := IntToStr(iMin);
  lblMax.Caption := IntToStr(iMax);
  lblHurMin.Caption := IntToStr(iHurMin);
  lblHurMax.Caption := IntToStr(iHurMax);
  lblMasMin.Caption := IntToStr(iMasMin);
  lblMasMax.Caption := IntToStr(iMasMax);
  lblExoriMin.Caption := IntToStr(iExoriMin);
  lblExoriMax.Caption := IntToStr(iExoriMax);
  lblGranMin.Caption := IntToStr(iGranMin);
  lblGranMax.Caption := IntToStr(iGranMax);
  lblIcoMin.Caption := IntToStr(iIcoMin);
  lblIcoMax.Caption := IntToStr(iIcoMax);
  lblKinaHP.Caption := IntToStr(iHP);
  lblKinaMP.Caption := IntToStr(iMP);
  lblCap.Caption := IntToStr(iCap);
end;

procedure TfrmDanoFisico.btnCalcularClick(Sender: TObject);
begin
  Calcular;
end;

procedure TfrmDanoFisico.LimparCampos;
begin
  edtLevel.Clear;
  edtAtq.Clear;
  edtSkill.Clear;
  lblMin.Caption := '';
  lblMax.Caption := '';
  cbbVoc.ItemIndex := 0;
  rgPost.ItemIndex := 0;
  pnlKnight.Width := 1;
  pnlPaladin.Width := 1;
  frmDanoFisico.Width := 315;
  frmDanoFisico.Height := 345;
  edtML.Clear;
  lblHurMin.Caption := '';
  lblMasMin.Caption := '';
  lblExoriMin.Caption := '';
  lblGranMin.Caption := '';
  lblIcoMin.Caption := '';
  lblHurMax.Caption := '';
  lblMasMax.Caption := '';
  lblExoriMax.Caption := '';
  lblGranMax.Caption := '';
  lblConMin.Caption := '';
  lblSanMin.Caption := '';
  lblMasSanMin.Caption := '';
  lblExuraMin.Caption := '';
  lblConMax.Caption := '';
  lblSanMax.Caption := '';
  lblMasSanMax.Caption := '';
  lblExuraMax.Caption := '';
  lblPalaMax.Caption := '';
  lblKinaHP.Caption := '';
  lblPalaHP.Caption := '';
  lblPalaMin.Caption := '';
  lblPalaMP.Caption := '';
  lblKinaMP.Caption := '';
  lblCap.Caption := '';
end;

procedure TfrmDanoFisico.btnLimparClick(Sender: TObject);
begin
  LimparCampos;
end;

procedure TfrmDanoFisico.FormCreate(Sender: TObject);
begin
  pnlKnight.Width := 1;
  pnlPaladin.Width := 1;
  frmDanoFisico.Width := 315;
  frmDanoFisico.Height := 345;
end;

end.
