create or replace materialized view OMEGA_TEST_DB.ITD_SCHEMACHANGE_DEMO.RIGDIG_LINEAGE_ALL as
select SPLIT_PART(metadata$filename,'/',-1)::VARCHAR(250) AS FILE_NAME
      ,('20'|| SUBSTRING(SPLIT_PART(metadata$filename,'/',-1),LEN(SPLIT_PART(metadata$filename,'/',-1))-5,2))::NUMBER(4,0) AS RPT_YR
      ,CASE SUBSTRING(SPLIT_PART(metadata$filename,'/',-1),LEN(SPLIT_PART(metadata$filename,'/',-1))-8,3)::VARCHAR(3)
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
      ,NULLIF(value:c2,'')::VARCHAR(100) AS EQT_VIN_SN
      ,NULLIF(value:c3,'')::VARCHAR(50) AS EQT_MAKE
      ,NULLIF(value:c4,'')::VARCHAR(4) AS EQT_MODEL_YEAR
      ,NULLIF(value:c5,'')::VARCHAR(50) AS EQT_GVWR_CLASS
      ,TRY_TO_DATE(AS_VARCHAR(value:c6)) AS EQT_DOMRA_ENT
      ,TRY_TO_DATE(AS_VARCHAR(value:c7)) AS EQT_DOMRA_VIN
      ,TRY_TO_NUMERIC(AS_VARCHAR(value:c8),10,0) AS EQT_OUT_OF_FLEET_FLAG
from OMEGA_TEST_DB.ITD_SCHEMACHANGE_DEMO.rigdig_lineage_files;