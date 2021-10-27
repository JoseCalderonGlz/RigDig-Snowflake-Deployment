-- Setup External Tables
-- Creat file formats for Polk and RigDig
create or replace file format ITD_RIG_DIG.rigdig_csv_pipe_windows_file_format
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

create or replace file format ITD_RIG_DIG.rigdig_csv_pipe_noquote_windows_file_format
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
CREATE OR REPLACE STAGE ITD_RIG_DIG.rigdig_s3_stage
    storage_integration = ITD_DATA_ENGINEERING_S3_INT_PROD
    url='s3://itd-us-west-2-prc-dataengineering/incoming-RigDig/'
    FILE_FORMAT = ITD_RIG_DIG.rigdig_csv_pipe_windows_file_format
;

-- create external tables
CREATE OR REPLACE EXTERNAL TABLE ITD_RIG_DIG.rigdig_activity_files
WITH LOCATION = @ITD_RIG_DIG.rigdig_s3_stage
file_format = ITD_RIG_DIG.rigdig_csv_pipe_windows_file_format
auto_refresh = TRUE
PATTERN = '.*(Activity).*(csv)';

CREATE OR REPLACE EXTERNAL TABLE ITD_RIG_DIG.rigdig_entity_files
WITH LOCATION = @ITD_RIG_DIG.rigdig_s3_stage
file_format = ITD_RIG_DIG.rigdig_csv_pipe_windows_file_format
auto_refresh = TRUE
PATTERN = '.*(Entity).*(csv)';

CREATE OR REPLACE EXTERNAL TABLE ITD_RIG_DIG.rigdig_lineage_files
WITH LOCATION = @ITD_RIG_DIG.rigdig_s3_stage
file_format = ITD_RIG_DIG.rigdig_csv_pipe_windows_file_format
auto_refresh = TRUE
PATTERN = '.*(Vin).*(csv)';


