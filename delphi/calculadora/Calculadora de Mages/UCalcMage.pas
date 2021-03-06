unit UCalcMage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmCalcMage = class(TForm)
    edtLevel: TEdit;
    edtMagicLevel: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    btnCalcular: TButton;
    lbl7: TLabel;
    lblInf: TLabel;
    lblGeral: TLabel;
    lbl3: TLabel;
    lblStrike: TLabel;
    lbl4: TLabel;
    lblSD: TLabel;
    lbl9: TLabel;
    lblHmm: TLabel;
    lbl10: TLabel;
    lblIcicle: TLabel;
    lbl11: TLabel;
    lblThunder: TLabel;
    lbl5: TLabel;
    lblGfb: TLabel;
    bvl1: TBevel;
    bvl2: TBevel;
    bvl3: TBevel;
    bvl4: TBevel;
    btnLimpar: TButton;
    lblExura: TLabel;
    lbl12: TLabel;
    lblExuraGran: TLabel;
    lbl14: TLabel;
    lblDruid: TLabel;
    bvl5: TBevel;
    lbl8: TLabel;
    lblIceWave: TLabel;
    lbl16: TLabel;
    lblTerraWave: TLabel;
    lbl18: TLabel;
    lblUearth: TLabel;
    lbl20: TLabel;
    lblUice: TLabel;
    lbl22: TLabel;
    lblMassHealing: TLabel;
    lbl6: TLabel;
    lbl13: TLabel;
    lblFireWave: TLabel;
    lbl17: TLabel;
    lblEnergyWave: TLabel;
    lbl21: TLabel;
    lblUenergy: TLabel;
    lbl24: TLabel;
    lblUfire: TLabel;
    lbl26: TLabel;
    lblEnergyBeam: TLabel;
    lbl28: TLabel;
    lblGEnergyBeam: TLabel;
    bvl6: TBevel;
    lblHP: TLabel;
    lblMP: TLabel;
    lbl32: TLabel;
    lbl33: TLabel;
    lbl15: TLabel;
    lblExuraVita: TLabel;
    lbl23: TLabel;
    lbl19: TLabel;
    lblHealFriend: TLabel;
    lblStrongStrike: TLabel;
    lbl27: TLabel;
    lblUStrike: TLabel;
    lbl30: TLabel;
    lblStrongIceWave: TLabel;
    lbl34: TLabel;
    lblLightning: TLabel;
    lbl37: TLabel;
    lbl38: TLabel;
    bvl7: TBevel;
    lbl39: TLabel;
    lbl42: TLabel;
    cbbTipoBase: TComboBox;
    lbl41: TLabel;
    edtPorc: TEdit;
    lbl40: TLabel;
    lbl25: TLabel;
    lblCap: TLabel;
    procedure btnCalcularClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure CalculaDanoMedio;
    procedure CalculaBasico;
    procedure CalculaResistencia;
    procedure CalculaFraqueza;
    procedure cbbTipoBaseChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCalcMage: TfrmCalcMage;

  //Vari�veis Geral
  iLvl, iML, iHP, iMP: Integer;
  sd, strike,strongStrike,uStrike, hmm, icicle, thunder, gfb, exura, exuraGran, exuraVita, porc: Double;

  //Vari�veis Druid
  iceWave,terraWave,uEarth,uIce,massHealing,healFriend,strongIceWave: Double;

  //Vari�veis Sorcerer
  fireWave,energyWave,energyBeam,gEnergyBeam,uEnergy,uFire,lightning: Double;

implementation

{$R *.dfm}

//bot�o calcular
procedure TfrmCalcMage.btnCalcularClick(Sender: TObject);
begin
  if edtLevel.Text = '' then
  begin
    ShowMessage('Digite o Level.');
    edtLevel.SetFocus;
  end
  else
  if edtMagicLevel.Text = ''  then
  begin
    ShowMessage('Digite o Magic Level.');
    edtMagicLevel.SetFocus;
  end
  else
  begin
    iLvl := StrToInt(edtLevel.Text);
    iML := StrToInt(edtMagicLevel.Text);
    lblCap.Caption := IntToStr(( iLvl * 10 ) + 390);
    CalculaBasico;
    if cbbTipoBase.ItemIndex = 0 then
      CalculaDanoMedio
    else
    begin
      porc := StrToFloat(edtPorc.Text);
      if cbbTipoBase.ItemIndex = 1 then
        CalculaFraqueza
      else
        CalculaResistencia
    end;
  end;
end;


// bot�o limpar
procedure TfrmCalcMage.btnLimparClick(Sender: TObject);
begin
  edtLevel.Clear();
  edtMagicLevel.Clear();
  edtLevel.SetFocus;

  lblStrike.Caption := '';
  lblSD.Caption := '';
  lblHmm.Caption := '';
  lblIcicle.Caption := '';
  lblThunder.Caption := '';
  lblGfb.Caption := '';
  lblExura.Caption := '';
  lblIceWave.Caption := '';
  lblTerraWave.Caption := '';
  lblMassHealing.Caption := '';
  lblFireWave.Caption := '';
  lblEnergyWave.Caption := '';
  lblUenergy.Caption := '';
  lblUfire.Caption := '';
  lblEnergyBeam.Caption := '';
  lblGEnergyBeam.Caption := '';
  lblHP.Caption := IntToStr(0);
  lblMP.Caption := IntToStr(0);
  lblExuraVita.Caption := '';
  lblHealFriend.Caption := '';
  lblExuraGran.Caption := '';
  lblUearth.Caption := '';
  lblUice.Caption := '';
  lblStrongStrike.Caption := '';
  lblUStrike.Caption := '';
  lblStrongIceWave.Caption := '';
  lblLightning.Caption := '';
  edtPorc.Text := '';
  cbbTipoBase.ItemIndex := 0;
end;



// faz os c�lculos b�sicos de vida, mana e curas
procedure TfrmCalcMage.CalculaBasico;
begin
 // Vida, Mana e Cura b�sica.
  iMP := (30*(iLvl-8))+90;
  iHP := (5*(iLvl-8))+185;
  exura := Int((((iLvl*0.2)+(iML*1.795)+11) + ((iLvl*0.2)+(iML*1.4)+8)) / 2.0) ;
  exuraGran := Int((((iLvl*0.2)+(iML*5.59)+35) + ((iLvl*0.2)+(iML*3.184)+20)) / 2.0);
  exuraVita := Int((((iLvl*0.2)+(iML*12.79)+79) + ((iLvl*0.2)+(iML*7.22)+44)) / 2.0);
  healFriend := Int((((iLvl/5)+(iML*10.0)) + ((iLvl/5)+(iML*14.0))) / 2.0);
  massHealing := Int((((iLvl*0.2)+(iML*10.43)+62) + ((iLvl*0.2)+(iML*5.7)+26)) / 2.0);

  lblMP.Caption := IntToStr(iMP);
  lblHP.Caption := IntToStr(iHP);
  lblExura.Caption := FloatToStr(exura);
  lblExuraGran.Caption := FloatToStr(exuraGran);
  lblExuraVita.Caption := FloatToStr(exuraVita);
  lblHealFriend.Caption := FloatToStr(healFriend);
  lblMassHealing.Caption := FloatToStr(massHealing);
end;

procedure TfrmCalcMage.CalculaDanoMedio;
begin
  // GERAL
  strike := Int((((iLvl*0.2)+(iML*2.203)+13) + ((iLvl*0.2)+(iML*1.403)+8)) / 2.0) ;
  strongStrike :=  Int((iLvl/5) + (iML * 3.6) + 22);
  uStrike := Int((iLvl/5) + (iML * 5.9) + 45);
  sd := Int((((iLvl*0.2)+(iML*7.395)+46) + ((iLvl*0.2)+(iML*4.605)+28)) / 2.0) ;
  hmm :=  Int((((iLvl*0.2)+(iML*0.81)+4) + ((iLvl*0.2)+(iML*1.59)+10)) / 2.0) ;
  icicle :=  Int((((iLvl*0.2)+(iML*1.81)+10) + ((iLvl*0.2)+(iML*3)+18)) / 2.0) ;
  thunder :=  Int((((iLvl*0.2)+(iML*1)+6) + ((iLvl*0.2)+(iML*2.6)+16)) / 2.0) ;
  gfb := Int((((iLvl*0.2)+(iML*2.8)+17) + ((iLvl*0.2)+(iML*1.2)+7)) / 2.0) ;

  lblStrike.Caption := FloatToStr(strike);
  lblStrongStrike.Caption := FloatToStr(strongStrike);
  lblUStrike.Caption := FloatToStr(uStrike);
  lblSD.Caption := FloatToStr(sd);
  lblHmm.Caption := FloatToStr(hmm);
  lblIcicle.Caption := FloatToStr(icicle);
  lblThunder.Caption := FloatToStr(Thunder);
  lblGfb.Caption := FloatToStr(gfb);


  // DRUID
  iceWave := Int((((iLvl*0.2)+(iML*2)+12) + ((iLvl*0.2)+(iML*0.81)+4)) / 2.0);
  terraWave := Int((((iLvl/5)+(iML*3.5)) + ((iLvl/5)+(iML*7.0))) / 2.0);
  uEarth :=  Int((((iLvl/5)+(iML*5.0)) + ((iLvl/5)+(iML*10.0))) / 2.0);
  uIce :=  Int((((iLvl/5)+(iML*6.0)) + ((iLvl/5)+(iML*12.0))) / 2.0);
  strongIceWave := Int((iLvl/5) + (iML * 6.05) + 34);

  lblIceWave.Caption := FloatToStr(iceWave);
  lblTerraWave.Caption := FloatToStr(terraWave);
  lblUearth.Caption := FloatToStr(uEarth);
  lblUice.Caption := FloatToStr(uIce);
  lblStrongIceWave.Caption := FloatToStr(strongIceWave);

  // SORCERER
  fireWave := Int((((iLvl*0.2)+(iML*2)+12)+((iLvl*0.2)+(iML*1.25)+4)) / 2.0);
  energyWave := Int((((iLvl/5)+(iML*4.5)) + ((iLvl/5)+(iML*9.0))) / 2.0);
  energyBeam := Int((((iLvl/5)+(iML*2.5)) + ((iLvl/5)+(iML*4.0))) / 2.0);
  gEnergyBeam := Int((((iLvl/5)+(iML*4.0)) + ((iLvl/5)+(iML*7.0))) / 2.0);
  uEnergy := Int((((iLvl/5)+(iML*5.0)) + ((iLvl/5)+(iML*12.0))) / 2.0);
  uFire := Int((((iLvl/5)+(iML*7.0)) + ((iLvl/5)+(iML*14.0))) / 2.0);
  lightning := Int((iLvl/5) + (iML * 2.8) + 17);

  lblFireWave.Caption := FloatToStr(fireWave);
  lblEnergyWave.Caption := FloatToStr(energyWave);
  lblEnergyBeam.Caption := FloatToStr(energyBeam);
  lblGEnergyBeam.Caption := FloatToStr(gEnergyBeam);
  lblUenergy.Caption := FloatToStr(uEnergy);
  lblUfire.Caption := FloatToStr(uFire);
  lblLightning.Caption := FloatToStr(lightning);
end;


procedure TfrmCalcMage.CalculaFraqueza;
begin
  // GERAL
  strike := Int(((((iLvl*0.2)+(iML*2.203)+13) + ((iLvl*0.2)+(iML*1.403)+8)) / 2.0) * ((100 + porc)/100)) ;
  strongStrike :=  Int(((iLvl/5) + (iML * 3.6) + 22) * ((100 + porc)/100));
  uStrike := Int(((iLvl/5) + (iML * 5.9) + 45) * ((100 + porc)/100));
  sd := Int(((((iLvl*0.2)+(iML*7.395)+46) + ((iLvl*0.2)+(iML*4.605)+28)) / 2.0) * ((100 + porc)/100)) ;
  hmm :=  Int(((((iLvl*0.2)+(iML*0.81)+4) + ((iLvl*0.2)+(iML*1.59)+10)) / 2.0) * ((100 + porc)/100)) ;
  icicle :=  Int(((((iLvl*0.2)+(iML*1.81)+10) + ((iLvl*0.2)+(iML*3)+18)) / 2.0) * ((100 + porc)/100)) ;
  thunder :=  Int(((((iLvl*0.2)+(iML*1)+6) + ((iLvl*0.2)+(iML*2.6)+16)) / 2.0) * ((100 + porc)/100)) ;
  gfb := Int(((((iLvl*0.2)+(iML*2.8)+17) + ((iLvl*0.2)+(iML*1.2)+7)) / 2.0)  * ((100 + porc)/100)) ;

  lblStrike.Caption := FloatToStr(strike);
  lblStrongStrike.Caption := FloatToStr(strongStrike);
  lblUStrike.Caption := FloatToStr(uStrike);
  lblSD.Caption := FloatToStr(sd);
  lblHmm.Caption := FloatToStr(hmm);
  lblIcicle.Caption := FloatToStr(icicle);
  lblThunder.Caption := FloatToStr(Thunder);
  lblGfb.Caption := FloatToStr(gfb);


  // DRUID
  iceWave := Int(((((iLvl*0.2)+(iML*2)+12) + ((iLvl*0.2)+(iML*0.81)+4)) / 2.0) * ((100 + porc)/100));
  terraWave := Int(((((iLvl/5)+(iML*3.5)) + ((iLvl/5)+(iML*7.0))) / 2.0) * ((100 + porc)/100));
  uEarth :=  Int(((((iLvl/5)+(iML*5.0)) + ((iLvl/5)+(iML*10.0))) / 2.0) * ((100 + porc)/100));
  uIce :=  Int(((((iLvl/5)+(iML*6.0)) + ((iLvl/5)+(iML*12.0))) / 2.0) * ((100 + porc)/100));
  strongIceWave := Int(((iLvl/5) + (iML * 6.05) + 34) * ((100 + porc)/100));

  lblIceWave.Caption := FloatToStr(iceWave);
  lblTerraWave.Caption := FloatToStr(terraWave);
  lblUearth.Caption := FloatToStr(uEarth);
  lblUice.Caption := FloatToStr(uIce);
  lblStrongIceWave.Caption := FloatToStr(strongIceWave);

  // SORCERER
  fireWave := Int(((((iLvl*0.2)+(iML*2)+12)+((iLvl*0.2)+(iML*1.25)+4)) / 2.0) * ((100 + porc)/100) );
  energyWave := Int(((((iLvl/5)+(iML*4.5)) + ((iLvl/5)+(iML*9.0))) / 2.0) * ((100 + porc)/100) );
  energyBeam := Int(((((iLvl/5)+(iML*2.5)) + ((iLvl/5)+(iML*4.0))) / 2.0) * ((100 + porc)/100) );
  gEnergyBeam := Int(((((iLvl/5)+(iML*4.0)) + ((iLvl/5)+(iML*7.0))) / 2.0) * ((100 + porc)/100) );
  uEnergy := Int(((((iLvl/5)+(iML*5.0)) + ((iLvl/5)+(iML*12.0))) / 2.0) * ((100 + porc)/100) );
  uFire := Int(((((iLvl/5)+(iML*7.0)) + ((iLvl/5)+(iML*14.0))) / 2.0) * ((100 + porc)/100) );
  lightning := Int(((iLvl/5) + (iML * 2.8) + 17) * ((100 + porc)/100) );

  lblFireWave.Caption := FloatToStr(fireWave);
  lblEnergyWave.Caption := FloatToStr(energyWave);
  lblEnergyBeam.Caption := FloatToStr(energyBeam);
  lblGEnergyBeam.Caption := FloatToStr(gEnergyBeam);
  lblUenergy.Caption := FloatToStr(uEnergy);
  lblUfire.Caption := FloatToStr(uFire);
  lblLightning.Caption := FloatToStr(lightning);
end;

procedure TfrmCalcMage.CalculaResistencia;
begin
  // GERAL
  strike := Int(((((iLvl*0.2)+(iML*2.203)+13) + ((iLvl*0.2)+(iML*1.403)+8)) / 2.0) * ((100 - porc)/100)) ;
  strongStrike :=  Int(((iLvl/5) + (iML * 3.6) + 22) * ((100 - porc)/100));
  uStrike := Int(((iLvl/5) + (iML * 5.9) + 45) * ((100 - porc)/100));
  sd := Int(((((iLvl*0.2)+(iML*7.395)+46) + ((iLvl*0.2)+(iML*4.605)+28)) / 2.0) * ((100 - porc)/100)) ;
  hmm :=  Int(((((iLvl*0.2)+(iML*0.81)+4) + ((iLvl*0.2)+(iML*1.59)+10)) / 2.0) * ((100 - porc)/100)) ;
  icicle :=  Int(((((iLvl*0.2)+(iML*1.81)+10) + ((iLvl*0.2)+(iML*3)+18)) / 2.0) * ((100 - porc)/100)) ;
  thunder :=  Int(((((iLvl*0.2)+(iML*1)+6) + ((iLvl*0.2)+(iML*2.6)+16)) / 2.0) * ((100 - porc)/100)) ;
  gfb := Int(((((iLvl*0.2)+(iML*2.8)+17) + ((iLvl*0.2)+(iML*1.2)+7)) / 2.0)  * ((100 - porc)/100)) ;

  lblStrike.Caption := FloatToStr(strike);
  lblStrongStrike.Caption := FloatToStr(strongStrike);
  lblUStrike.Caption := FloatToStr(uStrike);
  lblSD.Caption := FloatToStr(sd);
  lblHmm.Caption := FloatToStr(hmm);
  lblIcicle.Caption := FloatToStr(icicle);
  lblThunder.Caption := FloatToStr(Thunder);
  lblGfb.Caption := FloatToStr(gfb);


  // DRUID
  iceWave := Int(((((iLvl*0.2)+(iML*2)+12) + ((iLvl*0.2)+(iML*0.81)+4)) / 2.0) * ((100 - porc)/100));
  terraWave := Int(((((iLvl/5)+(iML*3.5)) + ((iLvl/5)+(iML*7.0))) / 2.0) * ((100 - porc)/100));
  uEarth :=  Int(((((iLvl/5)+(iML*5.0)) + ((iLvl/5)+(iML*10.0))) / 2.0) * ((100 - porc)/100));
  uIce :=  Int(((((iLvl/5)+(iML*6.0)) + ((iLvl/5)+(iML*12.0))) / 2.0) * ((100 - porc)/100));
  strongIceWave := Int(((iLvl/5) + (iML * 6.05) + 34) * ((100 - porc)/100));

  lblIceWave.Caption := FloatToStr(iceWave);
  lblTerraWave.Caption := FloatToStr(terraWave);
  lblUearth.Caption := FloatToStr(uEarth);
  lblUice.Caption := FloatToStr(uIce);
  lblStrongIceWave.Caption := FloatToStr(strongIceWave);

  // SORCERER
  fireWave := Int(((((iLvl*0.2)+(iML*2)+12)+((iLvl*0.2)+(iML*1.25)+4)) / 2.0) * ((100 - porc)/100) );
  energyWave := Int(((((iLvl/5)+(iML*4.5)) + ((iLvl/5)+(iML*9.0))) / 2.0) * ((100 - porc)/100) );
  energyBeam := Int(((((iLvl/5)+(iML*2.5)) + ((iLvl/5)+(iML*4.0))) / 2.0) * ((100 - porc)/100) );
  gEnergyBeam := Int(((((iLvl/5)+(iML*4.0)) + ((iLvl/5)+(iML*7.0))) / 2.0) * ((100 - porc)/100) );
  uEnergy := Int(((((iLvl/5)+(iML*5.0)) + ((iLvl/5)+(iML*12.0))) / 2.0) * ((100 - porc)/100) );
  uFire := Int(((((iLvl/5)+(iML*7.0)) + ((iLvl/5)+(iML*14.0))) / 2.0) * ((100 - porc)/100) );
  lightning := Int(((iLvl/5) + (iML * 2.8) + 17) * ((100 - porc)/100) );

  lblFireWave.Caption := FloatToStr(fireWave);
  lblEnergyWave.Caption := FloatToStr(energyWave);
  lblEnergyBeam.Caption := FloatToStr(energyBeam);
  lblGEnergyBeam.Caption := FloatToStr(gEnergyBeam);
  lblUenergy.Caption := FloatToStr(uEnergy);
  lblUfire.Caption := FloatToStr(uFire);
  lblLightning.Caption := FloatToStr(lightning);
end;

procedure TfrmCalcMage.cbbTipoBaseChange(Sender: TObject);
begin
  if cbbTipoBase.ItemIndex = 0 then
  begin
    edtPorc.Enabled := False;
    edtPorc.Text := '';
  end
  else
  begin
    if cbbTipoBase.ItemIndex = 1 then
      edtPorc.Enabled := True
    else
      edtPorc.Enabled := True
  end
end;

end.
