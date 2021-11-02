create TABLE if not exists RIGDIG_LINEAGE_DATA_DICTIONARY (
	FIELD_NAME VARCHAR(16777216),
	DESCRIPTION VARCHAR(16777216)
);


INSERT INTO RIGDIG_LINEAGE_DATA_DICTIONARY VALUES
('RRID','RRID: The Randall-Reilly ID is a unique ID that represents a single entity. The RRID enables linking of data elements from various data sources to a unique site. In most cases, the entity will hbe for the main headquarters location. However, if an entity operates more than one USDOT, we will also have a separate RRID for each separate USDOT.'),
('EQT_VIN_SN','Either the Vehicle Identification Number (VIN) or the Serial Number (SN) of the unit.'),
('EQT_MAKE','When the VIN is validated, this is the make for that specific VIN. When the VIN is not validated, the make is defined based on the make listed on the inspection document or the UCC financing statement."'),
('EQT_MODEL_YEAR','The equipment model year defined through our VIN decode process.'),
('EQT_GVWR_CLASS','The equipment GVWR defined through our VIN decode process. '),
('EQT_DOMRA_ENT','The Date of Most Recent Activity (DOMRA) that a specific VIN was associated with an entity. As a standard business rule, the provided equipment level information is based on the valid VINs each entity has operated in the last rolling 24 months.'),
('EQT_DOMRA_VIN','The Date of Most Recent Activity (DOMRA) for the VIN.'),
('EQT_OUT_OF_FLEET_FLAG','The activity for each VIN is monitored, and the entities operating the VIN are tracked. When a VIN is identified as operated by a new entity (RRID), the historical records will be flagged to indicate that the VIN is now being operated by a new entity, to identify VINs which may no longer be in an entity\'s fleet.');
