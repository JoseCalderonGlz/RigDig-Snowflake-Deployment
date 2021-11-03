CREATE or replace EXTERNAL TABLE ITD_SCHEMACHANGE_DEMO.rigdig_entity_files
WITH LOCATION = @OMEGA_TEST_DB.ITD_SCHEMACHANGE_DEMO.rigdig_s3_stage
file_format = OMEGA_TEST_DB.ITD_SCHEMACHANGE_DEMO.rigdig_csv_pipe_windows_file_format
auto_refresh = TRUE
PATTERN = '.*(Entity).*(csv)';