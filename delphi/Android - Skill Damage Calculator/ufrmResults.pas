unit ufrmResults;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, System.ImageList, FMX.ImgList, FMX.Layouts, FMX.ListBox, FMX.Ani,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmResults = class(TForm)
    ilSkills: TImageList;
    lv1: TListView;
    fdmtSkills: TFDMemTable;
    strngfldSkillsSkill: TStringField;
    BindSourceDB1: TBindSourceDB;
    bdl1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    strngfldSkillsDamage: TStringField;
    fdmtSkillsImage: TBlobField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ClearAllData;
  end;

var
  frmResults: TfrmResults;

implementation

{$R *.fmx}

{$R *.LgXhdpiPh.fmx ANDROID}

{ TfrmResults }

procedure TfrmResults.ClearAllData;
begin
  // limpa os dados de todas as tabelas
  fdmtSkills.First;
  while not fdmtSkills.Eof do
  begin
    fdmtSkills.Delete;
  end;


end;

end.
