alter table OMEGA_TEST_DB.ITD_SCHEMACHANGE_DEMO.RIGDIG_ACTIVITY_CURRENT add column if not exists new_column varchar;

alter table OMEGA_TEST_DB.ITD_SCHEMACHANGE_DEMO.RIGDIG_ACTIVITY_CURRENT drop column new_column;