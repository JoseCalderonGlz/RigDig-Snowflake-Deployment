CREATE or replace VIEW ITD_SCHEMACHANGE_DEMO.RIGDIG_LINEAGE_VIEW as
SELECT RRID::VARCHAR(30) AS RRID
      ,EQT_VIN_SN
      ,EQT_MAKE
      ,EQT_MODEL_YEAR
      ,EQT_GVWR_CLASS
      ,EQT_DOMRA_ENT
      ,EQT_DOMRA_VIN
      ,EQT_OUT_OF_FLEET_FLAG
      ,RPT_YR
      ,RPT_MONTH
FROM ITD_SCHEMACHANGE_DEMO.RIGDIG_LINEAGE_LATEST;



