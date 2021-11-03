CREATE or replace STAGE ITD_SCHEMACHANGE_DEMO.rigdig_s3_stage
    storage_integration = ITD_DATA_ENGINEERING_S3_INT_TEST
    url='s3://itd-us-west-2-drc-dataengineering/incoming-RigDig/'
    FILE_FORMAT = OMEGA_TEST_DB.ITD_SCHEMACHANGE_DEMO.rigdig_csv_pipe_windows_file_format
;