create or replace TABLE RIGDIG_ACTIVITY_HISTORY (
	RPT_YR NUMBER(4,0),
	RPT_MONTH NUMBER(2,0),
	RRID NUMBER(10,0),
	ACT_SOURCE VARCHAR(50),
	ACT_ID VARCHAR(8),
	ACT_DOC_ID VARCHAR(50),
	ACT_DOC_SQN NUMBER(10,0),
	ACT_YEAR NUMBER(10,0),
	ACT_DATE VARCHAR(30),
	ACT_STATE VARCHAR(50),
	ACT_LOCATION_DESC VARCHAR(50),
	ACT_FIPS VARCHAR(3),
	ACT_COUNTY VARCHAR(20),
	ACT_LICENSE_STATE VARCHAR(50),
	ACT_INSP_FACILITY VARCHAR(50),
	ACT_INSP_VIOL_SEQN NUMBER(10,0),
	ACT_INSP_VIOL_CITED VARCHAR(55),
	ACT_INSP_VIOL VARCHAR(55),
	ACT_INSP_VIOL_OOS VARCHAR(20),
	ACT_ACC_SEQN NUMBER(10,0),
	ACT_ACC_REASON VARCHAR(100),
	ACT_ACC_VEH_INVOLVED NUMBER(10,0),
	ACT_ACC_FATALITIES NUMBER(10,0),
	ACT_ACC_INJURIES NUMBER(10,0),
	ACT_ACC_TOWAWAY VARCHAR(50),
	EQT_VIN_SN VARCHAR(100),
	EQT_VALIDATED_VIN VARCHAR(5),
	EQT_MAKE VARCHAR(50),
	EQT_MODEL_YEAR VARCHAR(4),
	EQT_GVWR_CLASS VARCHAR(50)
);