--STORED PROCEDURE TO ADD A COLUMN
--TABLE NAME, COLUMN NAME, TYPE
call OMEGA_TEST_DB.ITD_SCHEMACHANGE_DEMO.SafeAddColumn('OMEGA_TEST_DB.ITD_SCHEMACHANGE_DEMO.RIGDIG_ACTIVITY_CURRENT', 'new_column', 'varchar(12312313)');

--STORED PROCEDURE TO REMOVE A COLUMN
--TABLE NAME, COLUMN NAME
call OMEGA_TEST_DB.ITD_SCHEMACHANGE_DEMO.SafeDropColumn('ITD_SCHEMACHANGE_DEMO.RIGDIG_ACTIVITY_CURRENT', 'new_column');