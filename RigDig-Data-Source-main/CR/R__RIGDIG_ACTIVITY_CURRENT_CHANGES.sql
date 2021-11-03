alter table OMEGA_TEST_DB.ITD_SCHEMACHANGE_DEMO.RIGDIG_ACTIVITY_CURRENT add column new_column varchar where add column not exists;

alter table OMEGA_TEST_DB.ITD_SCHEMACHANGE_DEMO.RIGDIG_ACTIVITY_CURRENT drop column new_column;