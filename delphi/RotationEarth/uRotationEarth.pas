unit uRotationEarth;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms3D, FMX.Types3D, FMX.Forms, FMX.Graphics, 
  FMX.Dialogs, System.Math.Vectors, FMX.Controls3D, FMX.Objects3D,
  FMX.MaterialSources, FMX.Ani, FMX.Layers3D;

type
  TForm1 = class(TForm3D)
    spMoon: TSphere;
    faRotation: TFloatAnimation;
    spEarth: TSphere;
    PathAnimation1: TPathAnimation;
    Dummy1: TDummy;
    Light1: TLight;
    LightMaterialSource1: TLightMaterialSource;
    tmsMoon: TTextureMaterialSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

end.
