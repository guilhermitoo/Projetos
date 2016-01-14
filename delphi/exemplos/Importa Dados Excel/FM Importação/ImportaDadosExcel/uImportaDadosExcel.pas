unit uImportaDadosExcel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBXpress, FMTBcd, DBClient, Provider, DB, SqlExpr, StdCtrls, Comobj,
  Grids, DBGrids, MaskUtils, Buttons, ComCtrls, StrUtils;

type
  TfrmImportaDadosExcel = class(TForm)
    lblFileName: TLabel;
    lbl1: TLabel;
    btnSelecionar: TButton;
    btnCarregar: TButton;
    dlgOpen1: TOpenDialog;
    con1: TSQLConnection;
    sqlFor: TSQLQuery;
    dpsFor: TDataSetProvider;
    cdsFor: TClientDataSet;
    strngfldForCODIGO: TStringField;
    strngfldForRAZAO: TStringField;
    strngfldForFANTASIA: TStringField;
    strngfldForCGC: TStringField;
    strngfldForTIPOINS: TStringField;
    strngfldForINSCR: TStringField;
    strngfldForFONE: TStringField;
    strngfldForFAX: TStringField;
    strngfldForEMAIL: TStringField;
    strngfldForENDERECO: TStringField;
    UsuForNUMERO: TIntegerField;
    strngfldForCOMPLEMENTO: TStringField;
    strngfldForBAIRRO: TStringField;
    strngfldForCEP: TStringField;
    strngfldForCIDADE: TStringField;
    strngfldForESTADO: TStringField;
    strngfldForCODCID: TStringField;
    sqlForOBS: TMemoField;
    strngfldForCONTATO: TStringField;
    strngfldForFONECONT: TStringField;
    strngfldForTIPO: TStringField;
    UsuForATIVO: TIntegerField;
    sqlForLEMBRETE: TMemoField;
    strngfldForLEMB_ATIVO: TStringField;
    strngfldForSTATUS: TStringField;
    strngfldForCODIGO1: TStringField;
    strngfldForRAZAO1: TStringField;
    strngfldForFANTASIA1: TStringField;
    strngfldForCGC1: TStringField;
    strngfldForTIPOINS1: TStringField;
    strngfldForINSCR1: TStringField;
    strngfldForFONE1: TStringField;
    strngfldForFAX1: TStringField;
    strngfldForEMAIL1: TStringField;
    strngfldForENDERECO1: TStringField;
    UsuForNUMERO1: TIntegerField;
    strngfldForCOMPLEMENTO1: TStringField;
    strngfldForBAIRRO1: TStringField;
    strngfldForCEP1: TStringField;
    strngfldForCIDADE1: TStringField;
    strngfldForESTADO1: TStringField;
    strngfldForCODCID1: TStringField;
    cdsForOBS: TMemoField;
    strngfldForCONTATO1: TStringField;
    strngfldForFONECONT1: TStringField;
    strngfldForTIPO1: TStringField;
    UsuForATIVO1: TIntegerField;
    cdsForLEMBRETE: TMemoField;
    strngfldForLEMB_ATIVO1: TStringField;
    strngfldForSTATUS1: TStringField;
    lbl2: TLabel;
    lbl3: TLabel;
    dbgrd1: TDBGrid;
    dsFor: TDataSource;
    btn1: TSpeedButton;
    sqlCli: TSQLQuery;
    strngfldsql1CODIGO: TStringField;
    strngfldsql1RAZAO: TStringField;
    strngfldsql1FANTASIA: TStringField;
    strngfldsql1CGC: TStringField;
    strngfldsql1TIPOINS: TStringField;
    strngfldsql1INSCR: TStringField;
    strngfldsql1FONE: TStringField;
    strngfldsql1FAX: TStringField;
    strngfldsql1EMAIL: TStringField;
    strngfldsql1ENDENTR: TStringField;
    Ususql1NUMENTR: TIntegerField;
    strngfldsql1COMENTR: TStringField;
    strngfldsql1BAIENTR: TStringField;
    strngfldsql1CEPENTR: TStringField;
    strngfldsql1CIDENTR: TStringField;
    strngfldsql1ESTENTR: TStringField;
    strngfldsql1ENDCOBR: TStringField;
    Ususql1NUMCOBR: TIntegerField;
    strngfldsql1COMCOBR: TStringField;
    strngfldsql1BAICOBR: TStringField;
    strngfldsql1CEPCOBR: TStringField;
    strngfldsql1CIDCOBR: TStringField;
    strngfldsql1ESTCOBR: TStringField;
    strngfldsql1CODBAN: TStringField;
    strngfldsql1REGIAO: TStringField;
    strngfldsql1CODVEND: TStringField;
    strngfldsql1COBRANCA: TStringField;
    Ususql1NUM_COMPRA: TIntegerField;
    strngfldsql1OBS: TStringField;
    Ususql1CARTORIOS: TIntegerField;
    Ususql1PROTESTOS: TIntegerField;
    strngfldsql1COMPRADOR: TStringField;
    strngfldsql1FONE_COMP: TStringField;
    sqlCliCLI_DESDE: TDateField;
    sqlCliULT_COMPRA: TDateField;
    Ususql1NEGATIVADO: TIntegerField;
    fmtbcdfldsql1LIM_CRED: TFMTBCDField;
    sqlCliLIM_VENCTO: TDateField;
    Ususql1BLOQ_VEN: TIntegerField;
    strngfldsql1MOTIVO_NEG: TStringField;
    strngfldsql1DESBL_VEN: TStringField;
    sqlCliCOMPLEMENT: TMemoField;
    strngfldsql1INTERNET: TStringField;
    strngfldsql1MALADIR: TStringField;
    strngfldsql1TIPOCLI: TStringField;
    strngfldsql1TIPOCAD: TStringField;
    sqlCliTVULTCONT: TDateField;
    sqlCliTVPROXCONT: TDateField;
    Ususql1TVCOMPROU: TIntegerField;
    Ususql1TVFREQPED: TIntegerField;
    sqlCliTVOBS: TMemoField;
    strngfldsql1TVOPERADOR: TStringField;
    strngfldsql1TVDIFICULD: TStringField;
    strngfldsql1TVRAMOATIV: TStringField;
    strngfldsql1TVCODIGO: TStringField;
    Ususql1FICHAS: TIntegerField;
    sqlCliLEMBRETE: TMemoField;
    Ususql1LEMBATIVO: TIntegerField;
    strngfldsql1TABELA: TStringField;
    strngfldsql1SITUACAO_ICMS: TStringField;
    strngfldsql1CODCID: TStringField;
    strngfldsql1CODPAIS: TStringField;
    sqlCliCONTANIVER: TDateField;
    strngfldsql1INSCRITO_SUFRAMA: TStringField;
    strngfldsql1SUFRAMA: TStringField;
    sqlVend: TSQLQuery;
    strngfldsql2CODIGO: TStringField;
    strngfldsql2NOME: TStringField;
    strngfldsql2TIPO: TStringField;
    strngfldsql2TELEFONE: TStringField;
    strngfldsql2ENDERECO: TStringField;
    strngfldsql2BAIRRO: TStringField;
    strngfldsql2CEP: TStringField;
    strngfldsql2CIDADE: TStringField;
    strngfldsql2ESTADO: TStringField;
    strngfldsql2EMAIL: TStringField;
    fmtbcdfldsql2COMISSAO: TFMTBCDField;
    Ususql2CONTROLE: TIntegerField;
    fmtbcdfldsql2COMIS_A: TFMTBCDField;
    fmtbcdfldsql2COMIS_I: TFMTBCDField;
    sqlVendNASCTO: TDateField;
    dpsVend: TDataSetProvider;
    dpsCli: TDataSetProvider;
    cdsCli: TClientDataSet;
    strngfldcds1CODIGO: TStringField;
    strngfldcds1RAZAO: TStringField;
    strngfldcds1FANTASIA: TStringField;
    strngfldcds1CGC: TStringField;
    strngfldcds1TIPOINS: TStringField;
    strngfldcds1INSCR: TStringField;
    strngfldcds1FONE: TStringField;
    strngfldcds1FAX: TStringField;
    strngfldcds1EMAIL: TStringField;
    strngfldcds1ENDENTR: TStringField;
    Usucds1NUMENTR: TIntegerField;
    strngfldcds1COMENTR: TStringField;
    strngfldcds1BAIENTR: TStringField;
    strngfldcds1CEPENTR: TStringField;
    strngfldcds1CIDENTR: TStringField;
    strngfldcds1ESTENTR: TStringField;
    strngfldcds1ENDCOBR: TStringField;
    Usucds1NUMCOBR: TIntegerField;
    strngfldcds1COMCOBR: TStringField;
    strngfldcds1BAICOBR: TStringField;
    strngfldcds1CEPCOBR: TStringField;
    strngfldcds1CIDCOBR: TStringField;
    strngfldcds1ESTCOBR: TStringField;
    strngfldcds1CODBAN: TStringField;
    strngfldcds1REGIAO: TStringField;
    strngfldcds1CODVEND: TStringField;
    strngfldcds1COBRANCA: TStringField;
    Usucds1NUM_COMPRA: TIntegerField;
    strngfldcds1OBS: TStringField;
    Usucds1CARTORIOS: TIntegerField;
    Usucds1PROTESTOS: TIntegerField;
    strngfldcds1COMPRADOR: TStringField;
    strngfldcds1FONE_COMP: TStringField;
    cdsCliCLI_DESDE: TDateField;
    cdsCliULT_COMPRA: TDateField;
    Usucds1NEGATIVADO: TIntegerField;
    fmtbcdfldcds1LIM_CRED: TFMTBCDField;
    cdsCliLIM_VENCTO: TDateField;
    Usucds1BLOQ_VEN: TIntegerField;
    strngfldcds1MOTIVO_NEG: TStringField;
    strngfldcds1DESBL_VEN: TStringField;
    cdsCliCOMPLEMENT: TMemoField;
    strngfldcds1INTERNET: TStringField;
    strngfldcds1MALADIR: TStringField;
    strngfldcds1TIPOCLI: TStringField;
    strngfldcds1TIPOCAD: TStringField;
    cdsCliTVULTCONT: TDateField;
    cdsCliTVPROXCONT: TDateField;
    Usucds1TVCOMPROU: TIntegerField;
    Usucds1TVFREQPED: TIntegerField;
    cdsCliTVOBS: TMemoField;
    strngfldcds1TVOPERADOR: TStringField;
    strngfldcds1TVDIFICULD: TStringField;
    strngfldcds1TVRAMOATIV: TStringField;
    strngfldcds1TVCODIGO: TStringField;
    Usucds1FICHAS: TIntegerField;
    cdsCliLEMBRETE: TMemoField;
    Usucds1LEMBATIVO: TIntegerField;
    strngfldcds1TABELA: TStringField;
    strngfldcds1SITUACAO_ICMS: TStringField;
    strngfldcds1CODCID: TStringField;
    strngfldcds1CODPAIS: TStringField;
    cdsCliCONTANIVER: TDateField;
    strngfldcds1INSCRITO_SUFRAMA: TStringField;
    strngfldcds1SUFRAMA: TStringField;
    cdsVend: TClientDataSet;
    lbl4: TLabel;
    lblTipo: TLabel;
    dsCli: TDataSource;
    strngfldVendCODIGO: TStringField;
    strngfldVendNOME: TStringField;
    strngfldVendTIPO: TStringField;
    strngfldVendTELEFONE: TStringField;
    strngfldVendENDERECO: TStringField;
    strngfldVendBAIRRO: TStringField;
    strngfldVendCEP: TStringField;
    strngfldVendCIDADE: TStringField;
    strngfldVendESTADO: TStringField;
    strngfldVendEMAIL: TStringField;
    fmtbcdfldVendCOMISSAO: TFMTBCDField;
    UsuVendCONTROLE: TIntegerField;
    fmtbcdfldVendCOMIS_A: TFMTBCDField;
    fmtbcdfldVendCOMIS_I: TFMTBCDField;
    cdsVendNASCTO: TDateField;
    statusBar: TStatusBar;
    sqlPro: TSQLQuery;
    cdsPro: TClientDataSet;
    dsPro: TDataSource;
    dpsPro: TDataSetProvider;
    sqlClassFiscal: TSQLQuery;
    dpsClassFiscal: TDataSetProvider;
    cdsClassFiscal: TClientDataSet;
    UsuClassFiscalID: TIntegerField;
    strngfldClassFiscalCLASS_FISCAL: TStringField;
    strngfldClassFiscalDESCRICAO: TStringField;
    fmtbcdfldClassFiscalIPI: TFMTBCDField;
    strngfldClassFiscalCST_IPI: TStringField;
    strngfldClassFiscalTRIBUTACAO: TStringField;
    sqlTribut: TSQLQuery;
    dpsTribut: TDataSetProvider;
    cdsTribut: TClientDataSet;
    strngfldTributCODIGO_TRI: TStringField;
    strngfldTributDESCRICAO_TRI: TStringField;
    fmtbcdfldTributMARGEM_ST: TFMTBCDField;
    sqlCadEst: TSQLQuery;
    dpsCadEst: TDataSetProvider;
    cdsCadEst: TClientDataSet;
    UsuClassFiscalID1: TIntegerField;
    strngfldClassFiscalCLASS_FISCAL1: TStringField;
    strngfldClassFiscalDESCRICAO1: TStringField;
    fmtbcdfldClassFiscalIPI1: TFMTBCDField;
    strngfldClassFiscalCST_IPI1: TStringField;
    strngfldClassFiscalTRIBUTACAO1: TStringField;
    strngfldTributCODIGO_TRI1: TStringField;
    strngfldTributDESCRICAO_TRI1: TStringField;
    fmtbcdfldTributMARGEM_ST1: TFMTBCDField;
    strngfldCadEstCODIGO: TStringField;
    strngfldCadEstESTADO: TStringField;
    strngfldCadEstNOME: TStringField;
    fmtbcdfldCadEstICMS: TFMTBCDField;
    fmtbcdfldCadEstREDUCAO: TFMTBCDField;
    sqlCadEstOBS: TMemoField;
    UsuCadEstSUBST_TRIB: TIntegerField;
    fmtbcdfldCadEstMARGEM_SUBST: TFMTBCDField;
    fmtbcdfldCadEstALIQ_SUBST: TFMTBCDField;
    fmtbcdfldCadEstICMS_NC: TFMTBCDField;
    fmtbcdfldCadEstREDUCAO_NC: TFMTBCDField;
    sqlCadEstOBS_NC: TMemoField;
    UsuCadEstSUBST_TRIB_NC: TIntegerField;
    fmtbcdfldCadEstMARGEM_SUBST_NC: TFMTBCDField;
    fmtbcdfldCadEstALIQ_SUBST_NC: TFMTBCDField;
    strngfldCadEstCODIGO1: TStringField;
    strngfldCadEstESTADO1: TStringField;
    strngfldCadEstNOME1: TStringField;
    fmtbcdfldCadEstICMS1: TFMTBCDField;
    fmtbcdfldCadEstREDUCAO1: TFMTBCDField;
    cdsCadEstOBS: TMemoField;
    UsuCadEstSUBST_TRIB1: TIntegerField;
    fmtbcdfldCadEstMARGEM_SUBST1: TFMTBCDField;
    fmtbcdfldCadEstALIQ_SUBST1: TFMTBCDField;
    fmtbcdfldCadEstICMS_NC1: TFMTBCDField;
    fmtbcdfldCadEstREDUCAO_NC1: TFMTBCDField;
    cdsCadEstOBS_NC: TMemoField;
    UsuCadEstSUBST_TRIB_NC1: TIntegerField;
    fmtbcdfldCadEstMARGEM_SUBST_NC1: TFMTBCDField;
    fmtbcdfldCadEstALIQ_SUBST_NC1: TFMTBCDField;
    strngfldProCODIGO: TStringField;
    strngfldProCLASSE: TStringField;
    strngfldProCATEGORIA: TStringField;
    strngfldProDESCRICAO: TStringField;
    strngfldProDESCRICAO_REDUZIDA: TStringField;
    strngfldProREFER: TStringField;
    strngfldProUNIDADE: TStringField;
    strngfldProCODTRIB: TStringField;
    fmtbcdfldProEST_MIN: TFMTBCDField;
    fmtbcdfldProEST_ATUAL: TFMTBCDField;
    fmtbcdfldProQTD_RESER: TFMTBCDField;
    fmtbcdfldProCUSTO_MED: TFMTBCDField;
    fmtbcdfldProULT_CUSTO: TFMTBCDField;
    sqlProDATA_PRECO: TDateField;
    fmtbcdfldProPRECO_VEND: TFMTBCDField;
    fmtbcdfldProPRECO_PROMO: TFMTBCDField;
    UsuProPROMOCIONAL: TIntegerField;
    sqlProPROMO_INICIO: TDateField;
    sqlProPROMO_FIM: TDateField;
    fmtbcdfldProPESO: TFMTBCDField;
    fmtbcdfldProPESO_LIQUIDO: TFMTBCDField;
    fmtbcdfldProIPI: TFMTBCDField;
    strngfldProC_ESTOQUE: TStringField;
    fmtbcdfldProMARGEM: TFMTBCDField;
    strngfldProESPESSURA: TStringField;
    strngfldProCOMPRIM: TStringField;
    fmtbcdfldProTABELAIND: TFMTBCDField;
    fmtbcdfldProBASE_CUSTO: TFMTBCDField;
    fmtbcdfldProMARGEMATAC: TFMTBCDField;
    fmtbcdfldProPRECO_ATAC: TFMTBCDField;
    strngfldProTRIBUTACAO: TStringField;
    strngfldProOLD_CLASS_FISCAL: TStringField;
    UsuProCLASSIF_FISCAL: TIntegerField;
    sqlProDATABAL: TDateField;
    fmtbcdfldProESTOQUEBAL: TFMTBCDField;
    fmtbcdfldProBALANCO: TFMTBCDField;
    fmtbcdfldProBALVALOR: TFMTBCDField;
    strngfldProEMBALAGEM: TStringField;
    UsuProATIVO: TIntegerField;
    strngfldProORIGEM_PRODUTO: TStringField;
    strngfldProCODIGOBARRAS: TStringField;
    UsuProID_COMPCUSTO: TIntegerField;
    sqlProADICIONAIS_NF: TMemoField;
    UsuProNUMEROS_DE_SERIE: TIntegerField;
    UsuProNUMEROS_DE_SERIE_ENTRADA: TIntegerField;
    strngfldProSITUACAO_SIMPLES: TStringField;
    strngfldProTIPOPROD: TStringField;
    strngfldProSTATUS: TStringField;
    strngfldProTIPO_ITEM: TStringField;
    strngfldProCADASTROSITE: TStringField;
    fmtbcdfldProID_INTEGRA_SITE: TFMTBCDField;
    fmtbcdfldProID_INTEGRA_SITE_FOTO: TFMTBCDField;
    strngfldProDESCRICAO_SITE: TStringField;
    strngfldProLANCAMENTO: TStringField;
    strngfldProSITE_DESTAQUE: TStringField;
    sqlProFICHATECNICA_SITE: TMemoField;
    strngfldProDIMENSOES: TStringField;
    fmtbcdfldProMARGEM_SITE: TFMTBCDField;
    fmtbcdfldProPRECO_SITE: TFMTBCDField;
    fmtbcdfldProPRECO_PROMO_SITE: TFMTBCDField;
    sqlProPROMO_INI_SITE: TSQLTimeStampField;
    sqlProPROMO_FIM_SITE: TSQLTimeStampField;
    strngfldProENDERECO_ESTOQUE: TStringField;
    fmtbcdfldProCUSTO_UNIT: TFMTBCDField;
    fmtbcdfldProCUSTO_VLR_FRETE: TFMTBCDField;
    fmtbcdfldProCUSTO_VLR_SEGURO: TFMTBCDField;
    fmtbcdfldProCUSTO_VLR_OUTROS: TFMTBCDField;
    fmtbcdfldProCUSTO_VLR_ICMS_ST: TFMTBCDField;
    fmtbcdfldProCUSTO_VLR_IPI: TFMTBCDField;
    fmtbcdfldProESTOQUE_INDISP: TFMTBCDField;
    strngfldProCST_IPI: TStringField;
    strngfldProCODIGO1: TStringField;
    strngfldProCLASSE1: TStringField;
    strngfldProCATEGORIA1: TStringField;
    strngfldProDESCRICAO1: TStringField;
    strngfldProDESCRICAO_REDUZIDA1: TStringField;
    strngfldProREFER1: TStringField;
    strngfldProUNIDADE1: TStringField;
    strngfldProCODTRIB1: TStringField;
    fmtbcdfldProEST_MIN1: TFMTBCDField;
    fmtbcdfldProEST_ATUAL1: TFMTBCDField;
    fmtbcdfldProQTD_RESER1: TFMTBCDField;
    fmtbcdfldProCUSTO_MED1: TFMTBCDField;
    fmtbcdfldProULT_CUSTO1: TFMTBCDField;
    cdsProDATA_PRECO: TDateField;
    fmtbcdfldProPRECO_VEND1: TFMTBCDField;
    fmtbcdfldProPRECO_PROMO1: TFMTBCDField;
    UsuProPROMOCIONAL1: TIntegerField;
    cdsProPROMO_INICIO: TDateField;
    cdsProPROMO_FIM: TDateField;
    fmtbcdfldProPESO1: TFMTBCDField;
    fmtbcdfldProPESO_LIQUIDO1: TFMTBCDField;
    fmtbcdfldProIPI1: TFMTBCDField;
    strngfldProC_ESTOQUE1: TStringField;
    fmtbcdfldProMARGEM1: TFMTBCDField;
    strngfldProESPESSURA1: TStringField;
    strngfldProCOMPRIM1: TStringField;
    fmtbcdfldProTABELAIND1: TFMTBCDField;
    fmtbcdfldProBASE_CUSTO1: TFMTBCDField;
    fmtbcdfldProMARGEMATAC1: TFMTBCDField;
    fmtbcdfldProPRECO_ATAC1: TFMTBCDField;
    strngfldProTRIBUTACAO1: TStringField;
    strngfldProOLD_CLASS_FISCAL1: TStringField;
    UsuProCLASSIF_FISCAL1: TIntegerField;
    cdsProDATABAL: TDateField;
    fmtbcdfldProESTOQUEBAL1: TFMTBCDField;
    fmtbcdfldProBALANCO1: TFMTBCDField;
    fmtbcdfldProBALVALOR1: TFMTBCDField;
    strngfldProEMBALAGEM1: TStringField;
    UsuProATIVO1: TIntegerField;
    strngfldProORIGEM_PRODUTO1: TStringField;
    strngfldProCODIGOBARRAS1: TStringField;
    UsuProID_COMPCUSTO1: TIntegerField;
    cdsProADICIONAIS_NF: TMemoField;
    UsuProNUMEROS_DE_SERIE1: TIntegerField;
    UsuProNUMEROS_DE_SERIE_ENTRADA1: TIntegerField;
    strngfldProSITUACAO_SIMPLES1: TStringField;
    strngfldProTIPOPROD1: TStringField;
    strngfldProSTATUS1: TStringField;
    strngfldProTIPO_ITEM1: TStringField;
    strngfldProCADASTROSITE1: TStringField;
    fmtbcdfldProID_INTEGRA_SITE1: TFMTBCDField;
    fmtbcdfldProID_INTEGRA_SITE_FOTO1: TFMTBCDField;
    strngfldProDESCRICAO_SITE1: TStringField;
    strngfldProLANCAMENTO1: TStringField;
    strngfldProSITE_DESTAQUE1: TStringField;
    cdsProFICHATECNICA_SITE: TMemoField;
    strngfldProDIMENSOES1: TStringField;
    fmtbcdfldProMARGEM_SITE1: TFMTBCDField;
    fmtbcdfldProPRECO_SITE1: TFMTBCDField;
    fmtbcdfldProPRECO_PROMO_SITE1: TFMTBCDField;
    cdsProPROMO_INI_SITE: TSQLTimeStampField;
    cdsProPROMO_FIM_SITE: TSQLTimeStampField;
    strngfldProENDERECO_ESTOQUE1: TStringField;
    fmtbcdfldProCUSTO_UNIT1: TFMTBCDField;
    fmtbcdfldProCUSTO_VLR_FRETE1: TFMTBCDField;
    fmtbcdfldProCUSTO_VLR_SEGURO1: TFMTBCDField;
    fmtbcdfldProCUSTO_VLR_OUTROS1: TFMTBCDField;
    fmtbcdfldProCUSTO_VLR_ICMS_ST1: TFMTBCDField;
    fmtbcdfldProCUSTO_VLR_IPI1: TFMTBCDField;
    fmtbcdfldProESTOQUE_INDISP1: TFMTBCDField;
    strngfldProCST_IPI1: TStringField;
    procedure btnSelecionarClick(Sender: TObject);
    procedure SelecionarArquivo();
    procedure con1Login(Database: TSQLConnection; LoginParams: TStrings);
    procedure ImportarDadosFornecedor();
    procedure ImportarDadosCliente();
    procedure ImportarDadosProduto();
    procedure btn1Click(Sender: TObject);
    procedure CarregaArquivo();
    procedure btnCarregarClick(Sender: TObject);
    procedure CarregandoBarraStatus(iCont: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImportaDadosExcel: TfrmImportaDadosExcel;
  planilha, sheet: OleVariant;
  linha: Integer;
  coluna: string;

implementation

uses WSUtils;

{$R *.dfm}

procedure TfrmImportaDadosExcel.btnSelecionarClick(Sender: TObject);
begin
  SelecionarArquivo;
end;

procedure TfrmImportaDadosExcel.SelecionarArquivo;
begin
  btnCarregar.Enabled := False;
  if dlgOpen1.Execute then
  begin
    lblFileName.Caption := dlgOpen1.FileName;

    statusBar.Panels.Items[0].Text := 'Selecionando arquivo.';

    planilha := CreateOleObject('Excel.Application');
    planilha.WorkBooks.open(dlgOpen1.FileName);
    sheet:= planilha.WorkSheets[1];

    lbl1.Color := clRed;
    lbl1.Caption := 'XX';
    btnCarregar.Enabled := False;

    //verifica se o arquivo é correto, de fornecedor
    if ( sheet.cells[3, 'A'].Text = 'Relatório de Fornecedores  - ORDEM: FORNECEDOR' ) and ( sheet.cells[10, 'A'].Text <> '' ) then
    begin
      lbl1.Color := clGreen;
      lbl1.Caption := 'OK';
      lblTipo.Caption := 'Fornecedores';

      btnCarregar.Enabled := True;

    end
    else
    begin
      //verifica se é o arquivo correto, de clientes
      if ( sheet.cells[3, 'A'].Text = 'Relatório de clientes  - ORDEM: CLIENTE' ) and ( sheet.cells[18, 'A'].Text <> '' ) then
      begin
        lbl1.Color := clGreen;
        lbl1.Caption := 'OK';
        lblTipo.Caption := 'Clientes';

        btnCarregar.Enabled := True;

        statusBar.Panels.Items[0].Text := 'Arquivo selecionado: ' + dlgOpen1.FileName;
      end
      else
      begin
        //verifica se é o arquivo correto, de produtos
        if ( sheet.cells[6, 'A'].Text = 'Código' ) and ( sheet.cells[6, 'C'].Text = 'Descrição' ) and ( sheet.cells[6, 'L'].Text = 'NCM' ) then
        begin
          lbl1.Color := clGreen;
          lbl1.Caption := 'OK';
          lblTipo.Caption := 'Produtos';

          btnCarregar.Enabled := True;

          statusBar.Panels.Items[0].Text := 'Arquivo selecionado: ' + dlgOpen1.FileName;
        end
        else
        begin
          ShowMessage('Arquivo Inválido! Selecione somente planilhas de clientes, de fornecedores ou de produtos.');
          statusBar.Panels.Items[0].Text := '';
        end;
      end;
    end



  end;
end;

procedure TfrmImportaDadosExcel.con1Login(Database: TSQLConnection;
  LoginParams: TStrings);
begin
  LoginParams.Add('user_name=sysdba');
  LoginParams.Add('password=carmofae');
end;

procedure TfrmImportaDadosExcel.ImportarDadosFornecedor;
var
  iCont, iTipoIns: Integer;
  sCGC, sCEP: string;
begin

  linha := 10;
  coluna := 'A';

  dbgrd1.DataSource := dsFor;

  iCont := 0;
  cdsFor.Open;
  if sheet.cells[linha, coluna].Text <> '' then
  begin
    statusBar.Panels.Items[0].Text := 'Importando fornecedores.';
    while( sheet.cells[linha, coluna].Text <> '' ) do
    begin

      CarregandoBarraStatus(iCont);

      cdsFor.Append;
      cdsFor.FieldByName('CODIGO').Value := StrZero( sheet.cells[linha, coluna].Text , 5 );

      coluna := 'B'; //Coluna da Razão social
      cdsFor.FieldByName('RAZAO').Value := Trim(sheet.cells[linha, coluna].Text);

      coluna := 'E'; //Coluna da Cidade
      cdsFor.FieldByName('CIDADE').Value := Trim(sheet.cells[linha, coluna].Text);

      coluna := 'H'; //Coluna do Estado
      cdsFor.FieldByName('ESTADO').Value := Trim(sheet.cells[linha, coluna].Text);

      coluna := 'I'; //Coluna do CNPJ
      if sheet.cells[linha, coluna].Text <> '' then
      begin
        sCGC := Trim(sheet.cells[linha, coluna].Text);
        sCGC := ExtractNum(sCGC);
        iTipoIns := Valida_CGC_CPF(sCGC); // Verifica se é CPF ou CNPJ, formata e passa o tipo de inscrição

        if iTipoIns = 0 then
        begin
          Delete(sCGC,1,3);
          iTipoIns := Valida_CGC_CPF(sCGC);
        end;

        cdsFor.FieldByName('TIPOINS').Value := iTipoIns; // Tipo de inscrição

        cdsFor.FieldByName('CGC').Value := sCGC; // CPF ou CNPJ

      end;

      coluna := 'J'; //Coluna do Nome Fantasia
      cdsFor.FieldByName('FANTASIA').Value := Trim(sheet.cells[linha, coluna].Text);

      linha := linha + 1; // linha e coluna do endereço
      coluna := 'A';
      cdsFor.FieldByName('ENDERECO').Value := Trim(sheet.cells[linha, coluna].Text);

      coluna := 'D'; // coluna do bairro
      cdsFor.FieldByName('BAIRRO').Value := Trim(sheet.cells[linha, coluna].Text);

      coluna := 'F'; // coluna do CEP
      if sheet.cells[linha, coluna].Text <> '' then
      begin
        sCEP := ExtractNum(sheet.cells[linha, coluna].Text);
        cdsFor.FieldByName('CEP').Value := FormatMaskText('99999-999;0;*',sCEP);
      end;

      coluna := 'G'; // coluna da Inscrição Estadual
      cdsFor.FieldByName('INSCR').Value := Trim(sheet.cells[linha, coluna].Text);

      coluna := 'H'; // coluna do telefone
      cdsFor.FieldByName('FONE').Value := Trim(sheet.cells[linha, coluna].Text);

      coluna := 'I'; // coluna do FAX
      cdsFor.FieldByName('FAX').Value := Trim(sheet.cells[linha, coluna].Text);

      linha := linha + 1;
      coluna := 'A'; // coluna do Contato
      cdsFor.FieldByName('CONTATO').Value := Trim(sheet.cells[linha, coluna].Text);

      coluna := 'H'; // coluna da Observação
      cdsFor.FieldByName('OBS').Value := Trim(sheet.cells[linha, coluna].Text);

      linha := linha + 1;
      coluna := 'A'; // coluna do Email
      cdsFor.FieldByName('EMAIL').Value := Trim(sheet.cells[linha, coluna].Text);

      cdsFor.FieldByName('LEMB_ATIVO').Value := IntToStr(0);
      cdsFor.FieldByName('STATUS').Value := 'A';

      linha := linha + 1;
      coluna := 'A';

      iCont := iCont + 1;

      lbl2.Caption := IntToStr(iCont);

      cdsFor.Post;

    end;

    ShowMessage('Foram adicionados ' + IntToStr(iCont) + ' registros.');
    statusBar.Panels.Items[0].Text := ''+IntToStr(iCont) + ' registros adicionados.';

  end;
end;

procedure TfrmImportaDadosExcel.btn1Click(Sender: TObject);
begin
  Close();
end;

procedure TfrmImportaDadosExcel.ImportarDadosCliente;
var
  iCont, iCodVend: integer;
  sCodVend, sCEP: String;
begin
  iCodVend := 1;

  linha := 18;
  coluna := 'A';

  dbgrd1.DataSource := dsCli;
  iCont := 0;
  cdsCli.Open;

  if sheet.cells[linha, coluna].Text <> '' then
  begin

    statusBar.Panels.Items[0].Text := 'Importando clientes.';

    while( sheet.cells[linha, coluna].Text <> '' ) do
    begin

      CarregandoBarraStatus(iCont);

      cdsCli.Append;
      cdsCli.FieldByName('CODIGO').Value := StrZero( sheet.cells[linha, coluna].Text , 5 );

      coluna := 'B'; //Coluna da Razão social
      cdsCli.FieldByName('RAZAO').Value := Trim(sheet.cells[linha, coluna].Text);

      coluna := 'F'; //Coluna da Cidade
      cdsCli.FieldByName('CIDENTR').Value := Trim(sheet.cells[linha, coluna].Text);

      coluna := 'M'; //Coluna do Estado
      cdsCli.FieldByName('ESTENTR').Value := Trim(sheet.cells[linha, coluna].Text);

      coluna := 'O'; //Coluna do Nome Fantasia
      cdsCli.FieldByName('FANTASIA').Value := Trim(sheet.cells[linha, coluna].Text);

      coluna := 'P'; //Coluna do Vendedor
      if sheet.cells[linha, coluna].Text <> '' then
      begin

        sqlVend.SQL.Text := 'Select * from CADVEND where NOME = ' + QuotedStr(sheet.cells[linha, coluna].Text) + ' ';
        sqlVend.Open;
        sqlVend.Refresh;

        if sqlVend.FieldByName('CODIGO').Value = '' then
        begin // Vendedor não cadastrado

          //cadastra o vendedor

          sCodVend := IntToStr(iCodVend);
          sCodVend := StrZero(sCodVend,3);

          cdsVend.Open;
          cdsVend.Insert;

          cdsVend.FieldByName('CODIGO').Value := sCodVend;
          cdsVend.FieldByName('NOME').AsString := Trim(sheet.cells[linha, coluna].Text);
          cdsVend.FieldByName('CONTROLE').Value := 0;

          cdsVend.Post;
          iCodVend := iCodVend + 1;

        end;
        sqlVend.Close;

        sqlVend.SQL.Text := 'Select * from CADVEND where NOME = ' + QuotedStr(sheet.cells[linha, coluna].Text) + ' ';
        sqlVend.Open;
        sqlVend.Refresh;

        cdsCli.FieldByName('CODVEND').Value := sqlVend.FieldByName('CODIGO').Value;

      end;

      linha := linha + 1; // linha e coluna do endereço
      coluna := 'A';
      cdsCli.FieldByName('ENDENTR').Value := Trim(sheet.cells[linha, coluna].Text);

      coluna := 'D'; // coluna do bairro
      cdsCli.FieldByName('BAIENTR').Value := Trim(sheet.cells[linha, coluna].Text);

      coluna := 'M'; // coluna do CEP
      if sheet.cells[linha, coluna].Text <> '' then
      begin
        sCEP := ExtractNum(sheet.cells[linha, coluna].Text);
        cdsCli.FieldByName('CEPENTR').Value := FormatMaskText('99999-999;0;*',sCEP);
      end;

      coluna := 'N'; // inscrição estadual
      cdsCli.FieldByName('INSCR').Value := Trim(sheet.cells[linha, coluna].Text);

      coluna := 'O'; //telefone
      cdsCli.FieldByName('FONE').Value := Trim(sheet.cells[linha, coluna].Text);

      coluna := 'A';
      linha := linha + 1;  //celular
      cdsCli.FieldByName('FONE').Value := cdsCli.FieldByName('FONE').AsString + ' - ' + Trim(sheet.cells[linha, coluna].Text);

      coluna := 'C';
      cdsCli.FieldByName('FAX').Value := Trim(sheet.cells[linha, coluna].Text);

      coluna := 'D'; // cliente desde <data>
      cdsCli.FieldByName('CLI_DESDE').Value := Trim(sheet.cells[linha, coluna].Text);

      coluna := 'F'; // Observações
      cdsCli.FieldByName('OBS').Value := Trim(sheet.cells[linha, coluna].Text);


      coluna := 'A';
      linha := linha + 1;  // Endereço de cobrança
      cdsCli.FieldByName('ENDCOBR').Value := Trim(sheet.cells[linha, coluna].Text);

      coluna := 'E'; // Bairro de Cobrança
      cdsCli.FieldByName('BAICOBR').Value := Trim(sheet.cells[linha, coluna].Text);

      coluna := 'G'; // Cidade de cobrança
      cdsCli.FieldByName('CIDCOBR').Value := Trim(sheet.cells[linha, coluna].Text);

      coluna := 'P'; // CEP cobrança
      if sheet.cells[linha, coluna].Text <> '' then
      begin
        sCEP := ExtractNum(sheet.cells[linha, coluna].Text);
        cdsCli.FieldByName('CEPCOBR').Value := FormatMaskText('99999-999;0;*',sCEP);
      end;

      coluna := 'J';
      linha := linha +3;
      cdsCli.FieldByName('COMPRADOR').Value := Trim(sheet.cells[linha, coluna].Text);

      linha := linha + 1;
      coluna := 'L';
      cdsCli.FieldByName('LIM_CRED').Value := Trim(sheet.cells[linha, coluna].Text);

      coluna := 'N';
      cdsCli.FieldByName('EMAIL').Value := Trim(sheet.cells[linha, coluna].Text);


      // descendo para o próximo cliente
      linha := linha + 4;
      coluna := 'A';

      iCont := iCont + 1;

      lbl2.Caption := IntToStr(iCont);

      cdsCli.Post;

    end;
    ShowMessage('Foram adicionados ' + IntToStr(iCont) + ' registros.');
    statusBar.Panels.Items[0].Text := ''+IntToStr(iCont) + ' registros adicionados.';
  end;
end;

procedure TfrmImportaDadosExcel.CarregaArquivo;
begin
  cdsFor.Close;
  cdsCli.Close;

  if lblTipo.Caption = 'Fornecedores' then
    ImportarDadosFornecedor;

  if lblTipo.Caption = 'Clientes' then
    ImportarDadosCliente;

  if lblTipo.Caption = 'Produtos' then
    ImportarDadosProduto;

end;

procedure TfrmImportaDadosExcel.btnCarregarClick(Sender: TObject);
begin
  CarregaArquivo;
end;

procedure TfrmImportaDadosExcel.CarregandoBarraStatus(iCont :Integer);
var
  sStatus: String;
begin
  // essa procedure faz o efeito de carregamento na barra de status, com reticências
  if ( iCont MOD 25 ) = 0 then
  begin
    sStatus := statusBar.Panels.Items[0].Text;

    if RightStr(sStatus, 3) = '...' then
        Delete(sStatus, Length(sStatus) - 2, 3);

    statusBar.Panels.Items[0].Text := sStatus + '.';
  end;
end;

procedure TfrmImportaDadosExcel.ImportarDadosProduto;
var
  iCont, iCodTrib: integer;
  sCod: String;
begin
  iCodTrib := 1;

  linha := 7;
  coluna := 'A';

  dbgrd1.DataSource := dsPro;
  iCont := 0;

  cdsPro.Open;

  statusBar.Panels.Items[0].Text := 'Importando produtos.';

  while ( sheet.cells[linha, coluna].Text <> 'Total de Registros:' ) do
  begin

    sCod := ExtractNum(sheet.cells[linha, coluna].Text);

    if Length(sCod) = 6 then
    begin

      CarregandoBarraStatus(iCont);

      cdsPro.Append;
      cdsPro.FieldByName('CODIGO').Value := StrZero(sCod,8);

      cdsPro.FieldByName('CLASSE').Value := '000';
      cdsPro.FieldByName('CATEGORIA').Value := '000';

      coluna := 'C';
      cdsPro.FieldByName('DESCRICAO').Value := Trim(sheet.cells[linha, coluna].Text);

      coluna := 'D'; // Origem do produto. Ex: nacional.
      cdsPro.FieldByName('ORIGEM_PRODUTO').Value := Copy(sheet.cells[linha, coluna].Text,1,1);

      coluna := 'L'; // NCM

      // verifica se existe a classificação fiscal cadastrada
      sqlClassFiscal.SQL.Text := 'Select * from CLASS_FISCAL where CLASS_FISCAL LIKE ' + QuotedStr(ExtractNum(sheet.cells[linha, coluna].Text)) + ' ';
      sqlClassFiscal.Open;
      sqlClassFiscal.Refresh;

      if sqlClassFiscal.FieldByName('CLASS_FISCAL').Value = '' then  // se não existir, cadastra a classificacao fiscal
      begin

        cdsClassFiscal.Open;
        cdsClassFiscal.Append;
        cdsClassFiscal.FieldByName('CLASS_FISCAL').Value := ExtractNum(sheet.cells[linha, coluna].Text);

        // verifica se existe tributacao cadastrada para essa classificacao, se nao houver, cadastra
        sqlTribut.SQL.Text := 'Select * from TRIBUTACAO where DESCRICAO = ' + QuotedStr(ExtractNum(sheet.cells[linha, coluna].Text));
        sqlTribut.Open;
        sqlTribut.Refresh;

        if sqlTribut.FieldByName('CODIGO').Value = '' then
        begin
          cdsTribut.Open;
          cdsTribut.Append;
          cdsTribut.FieldByName('CODIGO_TRI').Value := StrZero(IntToStr(iCodTrib),3);
          cdsTribut.FieldByName('DESCRICAO_TRI').Value := ExtractNum(sheet.cells[linha, coluna].Text);
          cdsTribut.FieldByName('MARGEM_ST').Value := ExtractNum(sheet.cells[linha, 'O'].Text);
          cdsTribut.Post;

          iCodTrib := iCodTrib + 1;

        end;

        //verifica a tributacao apos cadastrada
        sqlTribut.SQL.Text := 'Select * from TRIBUTACAO where DESCRICAO = ' + QuotedStr(ExtractNum(sheet.cells[linha, coluna].Text));
        sqlTribut.Open;
        sqlTribut.Refresh;

        //como a tributacao foi cadastrada, utiliza o codigo dela para a classificacao e para o produto
        cdsClassFiscal.FieldByName('TRIBUTACAO').Value := sqlTribut.FieldByName('CODIGO_TRI').Value;
        cdsPro.FieldByName('TRIBUTACAO').Value := sqlTribut.FieldByName('CODIGO_TRI').Value;
        cdsClassFiscal.Post;

        // PARA CADA TABELA DE TRIBUTACAO CADASTRADA É NECESSÁRIO CADASTRAR UM ESTADO NA TABELA CADEST
        cdsCadEst.Open;
        cdsCadEst.Append;
        cdsCadEst.FieldByName('CODIGO').Value := sqlTribut.FieldByName('CODIGO_TRI').Value;
        cdsCadEst.FieldByName('ESTADO').Value := 'SP';
        cdsCadEst.FieldByName('NOME').Value := 'São Paulo';
        cdsCadEst.FieldByName('ICMS').Value := ExtractNum(sheet.cells[linha, 'N'].Text);
        cdsCadEst.FieldByName('ICMS_NC').Value := ExtractNum(sheet.cells[linha, 'N'].Text);
        cdsCadEst.FieldByName('REDUCAO').Value := ExtractNum(sheet.cells[linha, 'P'].Text);
        cdsCadEst.FieldByName('REDUCAO_NC').Value := ExtractNum(sheet.cells[linha, 'P'].Text);

        coluna := 'E'; // ST
        if sheet.cells[linha, coluna].Text = 'Sim' then
          cdsCadEst.FieldByName('SUBST_TRIB').Value := 1
        else
          cdsCadEst.FieldByName('SUBST_TRIB').Value := 0;

        cdsCadEst.FieldByName('SUBST_TRIB_NC').Value := cdsCadEst.FieldByName('SUBST_TRIB').Value;

        cdsCadEst.FieldByName('MARGEM_SUBST').Value := 0;
        cdsCadEst.FieldByName('MARGEM_SUBST_NC').Value := 0;
        cdsCadEst.FieldByName('ALIQ_SUBST').Value := 0;
        cdsCadEst.FieldByName('ALIQ_SUBST_NC').Value := 0;
        cdsCadEst.Post;

      end;

      //verifica a classificacao que foi cadastrada
      sqlClassFiscal.SQL.Text := 'Select * from CLASS_FISCAL where CLASS_FISCAL LIKE ' + QuotedStr(ExtractNum(sheet.cells[linha, coluna].Text)) + ' ';
      sqlClassFiscal.Open;
      sqlClassFiscal.Refresh;

      //passa a classificacao para o produto
      cdsPro.FieldByName('CLASSIF_FISCAL').AsInteger := sqlClassFiscal.FieldByName('ID').AsInteger;

      cdsPro.FieldByName('ATIVO').Value := 1;

      cdsPro.Post;

      iCont := iCont + 1;

      lbl2.Caption := IntToStr(iCont);

    end;

    coluna := 'A';
    linha := linha + 1;

  end;
  ShowMessage('Foram adicionados ' + IntToStr(iCont) + ' registros.');
  statusBar.Panels.Items[0].Text := ''+IntToStr(iCont) + ' registros adicionados.';
end;

end.
