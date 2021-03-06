CREATE or replace VIEW ITD_SCHEMACHANGE_DEMO.RIGDIG_LINEAGE_LATEST
comment = '@file: Views-RigDig.sql
@author: John Pabst Jr.
@email: A-John.Pabst@paccar.com
@project: Customer 360
@repo: https://github.com/PACCAR-Digital/data-solutions
@description: 
    Update Oct 2021 - create latest view using the new materialized view.' 
AS
WITH MAX_RPT_YR_MONTH AS (
  SELECT MAX((RPT_YR::VARCHAR(4)||CASE WHEN RPT_MONTH < 10 THEN '0' ELSE '' END::VARCHAR(1)||RPT_MONTH::VARCHAR(2))::NUMBER(6,0)) AS MAX_RPT_YR_MONTH
  FROM ITD_SCHEMACHANGE_DEMO.RIGDIG_LINEAGE_ALL
)
SELECT RPT_YR
      ,RPT_MONTH
      ,RRID
      ,EQT_VIN_SN
      ,EQT_MAKE
      ,EQT_MODEL_YEAR
      ,EQT_GVWR_CLASS
      ,EQT_DOMRA_ENT
      ,EQT_DOMRA_VIN
      ,EQT_OUT_OF_FLEET_FLAG
FROM ITD_SCHEMACHANGE_DEMO.RIGDIG_LINEAGE_ALL a
INNER JOIN MAX_RPT_YR_MONTH b
ON a.RPT_YR = LEFT(b.MAX_RPT_YR_MONTH,4)::NUMBER(4,0)
AND a. RPT_MONTH = RIGHT(b.MAX_RPT_YR_MONTH,2)::NUMBER(2,0);
