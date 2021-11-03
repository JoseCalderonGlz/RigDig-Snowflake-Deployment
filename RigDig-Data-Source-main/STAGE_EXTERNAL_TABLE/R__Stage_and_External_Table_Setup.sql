-- Setup External Tables
-- Creat file formats for Polk and RigDig
create file format if not exists OMEGA_TEST_DB.ITD_SCHEMACHANGE_DEMO.rigdig_csv_pipe_windows_file_format
 TYPE = CSV
 FIELD_DELIMITER = '|'
 SKIP_HEADER = 1
 VALIDATE_UTF8 = TRUE
 ENCODING = 'Windows-1252'
 FIELD_OPTIONALLY_ENCLOSED_BY = '"'
 ESCAPE_UNENCLOSED_FIELD = NONE
 ERROR_ON_COLUMN_COUNT_MISMATCH = TRUE
 REPLACE_INVALID_CHARACTERS = FALSE
 NULL_IF = ('','NULL','\\N')
 COMPRESSION = NONE
 RECORD_DELIMITER = '\n'
 FILE_EXTENSION = 'csv'
 DATE_FORMAT = 'YYYY-MM-DD'
 TIME_FORMAT = 'HH24:MI:SS.FF3'
 TIMESTAMP_FORMAT = 'YYYY-MM-DDTHH24:MI:SS.FF3'
 BINARY_FORMAT = UTF8
 TRIM_SPACE = TRUE
 EMPTY_FIELD_AS_NULL = TRUE
 SKIP_BYTE_ORDER_MARK = FALSE;

create file format if not exists ITD_SCHEMACHANGE_DEMO.rigdig_csv_pipe_noquote_windows_file_format
 TYPE = CSV
 FIELD_DELIMITER = '|'
 SKIP_HEADER = 1
 VALIDATE_UTF8 = TRUE
 ENCODING = 'Windows-1252'
 FIELD_OPTIONALLY_ENCLOSED_BY = NONE
 ESCAPE_UNENCLOSED_FIELD = NONE
 ERROR_ON_COLUMN_COUNT_MISMATCH = TRUE
 REPLACE_INVALID_CHARACTERS = FALSE
 NULL_IF = ('','NULL','\\N')
 COMPRESSION = NONE
 RECORD_DELIMITER = '\n'
 FILE_EXTENSION = 'csv'
 DATE_FORMAT = 'YYYY-MM-DD'
 TIME_FORMAT = 'HH24:MI:SS.FF3'
 TIMESTAMP_FORMAT = 'YYYY-MM-DDTHH24:MI:SS.FF3'
 BINARY_FORMAT = UTF8
 TRIM_SPACE = TRUE
 EMPTY_FIELD_AS_NULL = TRUE
 SKIP_BYTE_ORDER_MARK = FALSE;

-- create stages
CREATE STAGE if not exists ITD_SCHEMACHANGE_DEMO.rigdig_s3_stage
    storage_integration = ITD_DATA_ENGINEERING_S3_INT_TEST
    url='s3://itd-us-west-2-drc-dataengineering/incoming-RigDig/'
    FILE_FORMAT = OMEGA_TEST_DB.ITD_SCHEMACHANGE_DEMO.rigdig_csv_pipe_windows_file_format
;

-- create external tables
CREATE EXTERNAL TABLE if not exists ITD_SCHEMACHANGE_DEMO.rigdig_activity_files
WITH LOCATION = @OMEGA_TEST_DB.ITD_SCHEMACHANGE_DEMO.rigdig_s3_stage
file_format = OMEGA_TEST_DB.ITD_SCHEMACHANGE_DEMO.rigdig_csv_pipe_windows_file_format
auto_refresh = TRUE
PATTERN = '.*(Activity).*(csv)';

CREATE EXTERNAL TABLE if not exists ITD_SCHEMACHANGE_DEMO.rigdig_entity_files
WITH LOCATION = @OMEGA_TEST_DB.ITD_SCHEMACHANGE_DEMO.rigdig_s3_stage
file_format = OMEGA_TEST_DB.ITD_SCHEMACHANGE_DEMO.rigdig_csv_pipe_windows_file_format
auto_refresh = TRUE
PATTERN = '.*(Entity).*(csv)';

CREATE EXTERNAL TABLE if not exists ITD_SCHEMACHANGE_DEMO.rigdig_lineage_files
WITH LOCATION = @OMEGA_TEST_DB.ITD_SCHEMACHANGE_DEMO.rigdig_s3_stage
file_format = OMEGA_TEST_DB.ITD_SCHEMACHANGE_DEMO.rigdig_csv_pipe_windows_file_format
auto_refresh = TRUE
PATTERN = '.*(Vin).*(csv)';


