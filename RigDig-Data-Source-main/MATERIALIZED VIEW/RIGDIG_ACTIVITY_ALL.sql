-- Create Materialized Views
-- RigDig Activity
create or replace materialized view ITD_RIG_DIG.RIGDIG_ACTIVITY_ALL as
select SPLIT_PART(metadata$filename,'/',-1)::VARCHAR(250) AS FILE_NAME
      ,CASE SUBSTRING(SPLIT_PART(metadata$filename,'/',-1),LEN(SPLIT_PART(metadata$filename,'/',-1))-5,2)
            WHEN '00' THEN 9999
            ELSE '20'|| SUBSTRING(SPLIT_PART(metadata$filename,'/',-1),LEN(SPLIT_PART(metadata$filename,'/',-1))-5,2) END::NUMBER(4,0) AS RPT_YR
      ,CASE SUBSTRING(SPLIT_PART(metadata$filename,'/',-1),LEN(SPLIT_PART(metadata$filename,'/',-1))-8,3)::VARCHAR(3)
            WHEN '000' THEN 99
            WHEN 'JAN' THEN 1
            WHEN 'FEB' THEN 2
            WHEN 'MAR' THEN 3
            WHEN 'APR' THEN 4
            WHEN 'MAY' THEN 5
            WHEN 'JUN' THEN 6
            WHEN 'JUL' THEN 7
            WHEN 'AUG' THEN 8
            WHEN 'SEP' THEN 9
            WHEN 'OCT' THEN 10
            WHEN 'NOV' THEN 11
            WHEN 'DEC' THEN 12
            ELSE 0 END::NUMBER(2,0) AS RPT_MONTH
      ,TRY_TO_NUMERIC(AS_VARCHAR(value:c1),10,0) AS RRID
      ,NULLIF(value:c2,'')::VARCHAR(50) AS ACT_SOURCE
      ,NULLIF(value:c3,'')::VARCHAR(8) AS ACT_ID
      ,NULLIF(value:c4,'')::VARCHAR(50) AS ACT_DOC_ID
      ,TRY_TO_NUMERIC(AS_VARCHAR(value:c5),10,0) AS ACT_DOC_SQN
      ,TRY_TO_NUMERIC(AS_VARCHAR(value:c6),10,0) AS ACT_YEAR
      ,NULLIF(value:c7,'')::VARCHAR(30) AS ACT_DATE
      ,NULLIF(value:c8,'')::VARCHAR(50) AS ACT_STATE
      ,NULLIF(value:c9,'')::VARCHAR(50) AS ACT_LOCATION_DESC
      ,NULLIF(value:c10,'')::VARCHAR(3) AS ACT_FIPS
      ,NULLIF(value:c11,'')::VARCHAR(20) AS ACT_COUNTY
      ,NULLIF(value:c12,'')::VARCHAR(50) AS ACT_LICENSE_STATE
      ,NULLIF(value:c13,'')::VARCHAR(50) AS ACT_INSP_FACILITY
      ,TRY_TO_NUMERIC(AS_VARCHAR(value:c14),10,0) AS ACT_INSP_VIOL_SEQN
      ,NULLIF(value:c15,'')::VARCHAR(55) AS ACT_INSP_VIOL_CITED
      ,NULLIF(value:c16,'')::VARCHAR(55) AS ACT_INSP_VIOL
      ,NULLIF(value:c17,'')::VARCHAR(20) AS ACT_INSP_VIOL_OOS
      ,TRY_TO_NUMERIC(AS_VARCHAR(value:c18),10,0) AS ACT_ACC_SEQN
      ,NULLIF(value:c19,'')::VARCHAR(100) AS ACT_ACC_REASON
      ,TRY_TO_NUMERIC(AS_VARCHAR(value:c20),10,0) AS ACT_ACC_VEH_INVOLVED
      ,TRY_TO_NUMERIC(AS_VARCHAR(value:c21),10,0) AS ACT_ACC_FATALITIES
      ,TRY_TO_NUMERIC(AS_VARCHAR(value:c22),10,0) AS ACT_ACC_INJURIES
      ,NULLIF(value:c23,'')::VARCHAR(50) AS ACT_ACC_TOWAWAY
      ,NULLIF(value:c24,'')::VARCHAR(100) AS EQT_VIN_SN
      ,NULLIF(value:c25,'')::VARCHAR(5) AS EQT_VALIDATED_VIN
      ,NULLIF(value:c26,'')::VARCHAR(50) AS EQT_MAKE
      ,NULLIF(value:c27,'')::VARCHAR(4) AS EQT_MODEL_YEAR
      ,NULLIF(value:c28,'')::VARCHAR(50) AS EQT_GVWR_CLASS
from ITD_RIG_DIG.rigdig_activity_files;
