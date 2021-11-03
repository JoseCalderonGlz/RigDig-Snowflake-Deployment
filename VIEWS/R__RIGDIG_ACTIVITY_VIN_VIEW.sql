CREATE or replace VIEW ITD_SCHEMACHANGE_DEMO.RIGDIG_ACTIVITY_VIN_VIEW AS (
SELECT RRID
      ,ACT_SOURCE
      ,COUNT(DISTINCT(ACT_ID)) AS ACT_ID_DIST
      ,SUM(ACT_DOC_SQN) AS ACT_DOC_SQN_SUM
      ,ACT_YEAR
      ,ACT_STATE
      ,SUM(ACT_ACC_SEQN) AS ACT_ACC_SEQN_SUM
      ,SUM(ACT_ACC_VEH_INVOLVED) AS ACT_ACC_VEH_INVOLVED_SUM
      ,SUM(ACT_ACC_FATALITIES) AS ACT_ACC_FATALITIES_SUM
      ,SUM(ACT_ACC_INJURIES) AS ACT_ACC_INJURIES_SUM
      ,EQT_VIN_SN
      ,OMEGA_TEST_DB.ITD_CUSTOMER_360.VIN_CONFORMITY(EQT_VIN_SN)::VARCHAR(30) AS VIN_CONFORMITY
      ,OMEGA_TEST_DB.ITD_CUSTOMER_360.VIN_CHECKSUM(EQT_VIN_SN) AS VIN_CHECKSUM
FROM ITD_SCHEMACHANGE_DEMO."RIGDIG_ACTIVITY_LATEST"
GROUP BY RRID, ACT_SOURCE, ACT_YEAR, ACT_STATE, EQT_VIN_SN
);