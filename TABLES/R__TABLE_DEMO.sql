create TABLE if not exists ITD_SCHEMACHANGE_DEMO.TABLE_DEMO (
	FIELD_NAME VARCHAR(16777216)
);

--TABLE NAME, COLUMN NAME, TYPE
call PUBLIC.SafeAddColumn('ITD_SCHEMACHANGE_DEMO.TABLE_DEMO', 'new_column', 'varchar(12312313)');
