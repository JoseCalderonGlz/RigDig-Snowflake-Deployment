create TABLE if not exists ITD_SCHEMACHANGE_DEMO.RIGDIG_ACTIVITY_DATA_DICTIONARY (
	FIELD_NAME VARCHAR(16777216),
	DESCRIPTION VARCHAR(16777216)
);

INSERT INTO ITD_SCHEMACHANGE_DEMO.RIGDIG_ACTIVITY_DATA_DICTIONARY VALUES
('RRID','RRID: The Randall-Reilly ID is a unique ID that represents a single entity. The RRID enables linking of data elements from various data sources to a unique site. In most cases, the entity will hbe for the main headquarters location. However, if an entity operates more than one USDOT, we will also have a separate RRID for each separate USDOT.'),
('ACT_SOURCE','Source of activity detail (i.e. Inspection, Crash, UCC).'),
('ACT_ID','For FMCSA Inspection and Crash activity, this is a unique identifying number assigned to the recor. For UCC activity, this is an incremental number assigned by EDA to every processed UCC (used for internal tracking). The combination of ACT_ID, ACT_SOURCE, and ACT_YEAR indicates a unique Activity record.'),
('ACT_DOC_ID','For FMCSA Inspection and Crash activity, this is the Inspection or Crash report number. For UCC activity, this is the transactional ID assigned by the Secretary of State\'s office in which the UCC was filed.'),
('ACT_DOC_SQN','Since more than one unit can be listed on Inspection, Crash, and UCC financing statements, this is the sequence number on the report.'),
('ACT_YEAR','Year in which the activity occurred.'),
('ACT_DATE','Date of inspection, date of crash, or date the UCC was filed with the Secretary of State\'s office.'),
('ACT_STATE','For FMCSA Inspection and Crash activity, this is the state in which the Inspection or Crash occurred. For UCC activity, this is the state where the buyer resides.'),
('ACT_LOCATION_DESC','Physical location where Inspection or Crash occurred. This field will be blank for UCC financing statements. '),
('ACT_FIPS','For FMCSA Inspection and Crash Activity, this is the FIPS (county) code for the county in which the Inspection or Crash occurred. For UCC activity, this is the FIPS (county) code for the county in which the buyer resides.'),
('ACT_COUNTY','For FMCSA Inspection and Crash Activity, this is the county in which the Inspection or Crash occurred. For UCC activity, this is the county in which the buyer resides.'),
('ACT_LICENSE_STATE','For FMCSA Inspection and Crash Activity, this is the state issuing the license plate on the vehicle. While the entity may be in one state, their equipment may be licensed out of many different states.'),
('ACT_INSP_FACILITY','Type of facility where the inspection was conducted (F = Fixed, R = Roadside)'),
('ACT_INSP_VIOL_SEQN','Since more than one violation can be reported on an Inspection, this is the sequence number on the report corresponding to that specific violation.'),
('ACT_INSP_VIOL_CITED','The specific violation reported.'),
('ACT_INSP_VIOL','A description of the specific violation reported.'),
('ACT_INSP_VIOL_OOS','Indicates whether the specific violation resulted in an Out-Of-Service (OOS) event'),
('ACT_ACC_SEQN','Since more than one accident reason can be attributed, this is the sequence number in the accident report corresponding to the accident reason.'),
('ACT_ACC_REASON','Description of the accident.'),
('ACT_ACC_VEH_INVOLVED','Total number of vehicles or vehicle combinations involved in the crash, including all trucks, buses, and other vehicles, such as cars and pedalcycles.'),
('ACT_ACC_FATALITIES','Number of persons killed inside or outside a vehicle at the scene of the crash.'),
('ACT_ACC_INJURIES','Number of persons injured inside or outside a vehicle at the scene of the crash who were transported to a medical facility for immediate medical attention.'),
('ACT_ACC_TOWAWAY','Indicates whether one or more motor vehicles were disabled and transported away from the scene by a tow truck or another vehicle (Y = Yes, N = No).'),
('EQT_VIN_SN','Either the Vehicle Identification Number (VIN) or the Serial Number (SN) of the unit.'),
('EQT_VALIDATED_VIN','RigDig Business Intelligence runs each 17-digit VIN through a VIN decoding software. When it is a valid, recognized VIN, we can append additional equipment related information to the record, such as Make, Model, Engine Mfr, etc. To ensure we are providing accurate data, we also validate the accuracy of the VIN. There are four categories: Y = Valid VIN, N = Invalid VIN, INC = Incomplete or Missing VIN, UCC = Equipment that does not have a VIN (such as a Dump Body, Cement Mixer)'),
('EQT_MAKE','The equipment make defined through our VIN decode process (e.g. Freightliner, Mack, Peterbilt).'),
('EQT_MODEL_YEAR','The equipment model year defined through our VIN decode process.'),
('EQT_GVWR_CLASS','The equipment GVWR defined through our VIN decode process.');
