CREATE OR REPLACE VIEW OMEGA_PROD_DB.ITD_SCHEMACHANGE_DEMO.RIGDIG_ACTIVITY_LATEST
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
  FROM ITD_RIG_DIG.RIGDIG_ACTIVITY_ALL
  WHERE RPT_YR != 9999
)
SELECT RPT_YR
      ,RPT_MONTH
      ,RRID
      ,ACT_SOURCE
      ,ACT_ID
      ,ACT_DOC_ID
      ,ACT_DOC_SQN
      ,ACT_YEAR
      ,ACT_DATE
      ,ACT_STATE
      ,ACT_LOCATION_DESC
      ,ACT_FIPS
      ,ACT_COUNTY
      ,ACT_LICENSE_STATE
      ,ACT_INSP_FACILITY
      ,ACT_INSP_VIOL_SEQN
      ,ACT_INSP_VIOL_CITED
      ,ACT_INSP_VIOL
      ,ACT_INSP_VIOL_OOS
      ,ACT_ACC_SEQN
      ,ACT_ACC_REASON
      ,ACT_ACC_VEH_INVOLVED
      ,ACT_ACC_FATALITIES
      ,ACT_ACC_INJURIES
      ,ACT_ACC_TOWAWAY
      ,EQT_VIN_SN
      ,EQT_VALIDATED_VIN
      ,EQT_MAKE
      ,EQT_MODEL_YEAR
      ,EQT_GVWR_CLASS
FROM OMEGA_PROD_DB.ITD_SCHEMACHANGE_DEMO.RIGDIG_ACTIVITY_ALL a
INNER JOIN MAX_RPT_YR_MONTH b
ON a.RPT_YR = LEFT(b.MAX_RPT_YR_MONTH,4)::NUMBER(4,0)
AND a. RPT_MONTH = RIGHT(b.MAX_RPT_YR_MONTH,2)::NUMBER(2,0);
