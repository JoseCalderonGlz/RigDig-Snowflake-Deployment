CREATE or replace VIEW ITD_SCHEMACHANGE_DEMO.RIGDIG_ENTITY_VIEW_ALL AS
with RDENT as (
  select RRID, max(RPT_YR::VARCHAR(4)||case when RPT_MONTH < 10 then '0' else '' end||RPT_MONTH::VARCHAR(2)) as RPT_YR_MONTH
  from ITD_SCHEMACHANGE_DEMO.RIGDIG_ENTITY_ALL
  group by RRID
)
SELECT a.RRID::VARCHAR(30) AS RRID
      ,USDOT
      ,EDABUYID
      ,ENT_COMPANY1
      ,ENT_COMPANY2
      ,DNB_COMPANY_NAME
      ,ENT_CONTACT1_FIRST
      ,ENT_CONTACT1_LAST
      ,ENT_CONTACT2_FIRST
      ,ENT_CONTACT2_LAST
      ,ENT_PHONE_OFFICE
      ,ENT_PHONE_ALTERNATE
      ,ENT_EMAIL_AVAILABLE
      ,ENT_EMAIL_COUNT
      ,ENT_PHY_ADDRESS
      ,ENT_PHY_CITY
      ,ENT_PHY_STATE
      ,ENT_PHY_ZIP
      ,ENT_PHY_COUNTRY
      ,ENT_PHY_FIPS
      ,ENT_PHY_COUNTY_STATE
      ,ENT_PHY_DPV
      ,ENT_DOMRA
      ,ENT_DOMRA_SOURCE
      ,ENT_MCS150_DATE
      ,ENT_OP_TYPE_DESC
      ,ENT_OP_CLASS_DESC
      ,ENT_OP_SEGMENT
      ,ENT_OP_AUTH
      ,ACT_STATES_OPERATED
      ,ACT_LICENSE_STATES
      ,DNB_DUNS
      ,DNB_DUNS_ULTIMATE_DOM_PARENT
      ,DNB_LOCATION_TYPE
      ,DNB_FAMILY_MEMBERS
      ,DNB_SUBSIDIARY
      ,DNB_MAJOR_INDUSTRY_DESC
      ,DNB_PRIMARY_SIC
      ,DNB_PRIMARY_SIC_DESC
      ,DNB_NAICS
      ,DNB_EMPL_HERE
      ,DNB_EMPL_HERE_CODE
      ,DNB_ANNUAL_SALES
      ,DNB_ANNUAL_SALES_CODE
      ,DNB_YEAR_STARTED
      ,DNB_OUT_OF_BUSINESS
      ,DNB_RISK_FLAG
      ,ZEROIFNULL(TRY_TO_NUMBER(ENT_CARGO_BEVERAGES))::NUMBER(10,0) AS ENT_CARGO_BEVERAGES
      ,ZEROIFNULL(TRY_TO_NUMBER(ENT_CARGO_GENFREIGHT))::NUMBER(10,0) AS ENT_CARGO_GENFREIGHT
      ,ZEROIFNULL(TRY_TO_NUMBER(ENT_CARGO_HOUSEHOLD))::NUMBER(10,0) AS ENT_CARGO_HOUSEHOLD
      ,ZEROIFNULL(TRY_TO_NUMBER(ENT_CARGO_PAPERPROD))::NUMBER(10,0) AS ENT_CARGO_PAPERPROD
      ,ZEROIFNULL(TRY_TO_NUMBER(ENT_CARGO_USMAIL))::NUMBER(10,0) AS ENT_CARGO_USMAIL
      ,ZEROIFNULL(TRY_TO_NUMBER(ENT_CARGO_COLDFOOD))::NUMBER(10,0) AS ENT_CARGO_COLDFOOD
      ,ZEROIFNULL(TRY_TO_NUMBER(ENT_CARGO_MEAT))::NUMBER(10,0) AS ENT_CARGO_MEAT
      ,ZEROIFNULL(TRY_TO_NUMBER(ENT_CARGO_PRODUCE))::NUMBER(10,0) AS ENT_CARGO_PRODUCE
      ,ZEROIFNULL(TRY_TO_NUMBER(ENT_CARGO_BLDGMAT))::NUMBER(10,0) AS ENT_CARGO_BLDGMAT
      ,ZEROIFNULL(TRY_TO_NUMBER(ENT_CARGO_LOGPOLE))::NUMBER(10,0) AS ENT_CARGO_LOGPOLE
      ,ZEROIFNULL(TRY_TO_NUMBER(ENT_CARGO_MACHLRG))::NUMBER(10,0) AS ENT_CARGO_MACHLRG
      ,ZEROIFNULL(TRY_TO_NUMBER(ENT_CARGO_METALSHEET))::NUMBER(10,0) AS ENT_CARGO_METALSHEET
      ,ZEROIFNULL(TRY_TO_NUMBER(ENT_CARGO_OILFIELD))::NUMBER(10,0) AS ENT_CARGO_OILFIELD
      ,ZEROIFNULL(TRY_TO_NUMBER(ENT_CARGO_CHEM))::NUMBER(10,0) AS ENT_CARGO_CHEM
      ,ZEROIFNULL(TRY_TO_NUMBER(ENT_CARGO_DRYBULK))::NUMBER(10,0) AS ENT_CARGO_DRYBULK
      ,ZEROIFNULL(TRY_TO_NUMBER(ENT_CARGO_LIQGAS))::NUMBER(10,0) AS ENT_CARGO_LIQGAS
      ,ZEROIFNULL(TRY_TO_NUMBER(ENT_CARGO_COALCOKE))::NUMBER(10,0) AS ENT_CARGO_COALCOKE
      ,ZEROIFNULL(TRY_TO_NUMBER(ENT_CARGO_GRAINFEED))::NUMBER(10,0) AS ENT_CARGO_GRAINFEED
      ,ZEROIFNULL(TRY_TO_NUMBER(ENT_CARGO_CONSTRUCT))::NUMBER(10,0) AS ENT_CARGO_CONSTRUCT
      ,ZEROIFNULL(TRY_TO_NUMBER(ENT_CARGO_DRIVETOW))::NUMBER(10,0) AS ENT_CARGO_DRIVETOW
      ,ZEROIFNULL(TRY_TO_NUMBER(ENT_CARGO_FARMSUPP))::NUMBER(10,0) AS ENT_CARGO_FARMSUPP
      ,ZEROIFNULL(TRY_TO_NUMBER(ENT_CARGO_GARBAGE))::NUMBER(10,0) AS ENT_CARGO_GARBAGE
      ,ZEROIFNULL(TRY_TO_NUMBER(ENT_CARGO_NUMBERERMODAL))::NUMBER(10,0) AS ENT_CARGO_NUMBERERMODAL
      ,ZEROIFNULL(TRY_TO_NUMBER(ENT_CARGO_LIVESTOCK))::NUMBER(10,0) AS ENT_CARGO_LIVESTOCK
      ,ZEROIFNULL(TRY_TO_NUMBER(ENT_CARGO_MOBILEHOME))::NUMBER(10,0) AS ENT_CARGO_MOBILEHOME
      ,ZEROIFNULL(TRY_TO_NUMBER(ENT_CARGO_MOTORVEH))::NUMBER(10,0) AS ENT_CARGO_MOTORVEH
      ,ZEROIFNULL(TRY_TO_NUMBER(ENT_CARGO_PASSENGERS))::NUMBER(10,0) AS ENT_CARGO_PASSENGERS
      ,ZEROIFNULL(TRY_TO_NUMBER(ENT_CARGO_UTILITY))::NUMBER(10,0) AS ENT_CARGO_UTILITY
      ,ZEROIFNULL(TRY_TO_NUMBER(ENT_CARGO_WATERWELL))::NUMBER(10,0) AS ENT_CARGO_WATERWELL
      ,ZEROIFNULL(TRY_TO_NUMBER(ENT_CARGO_OTHER))::NUMBER(10,0) AS ENT_CARGO_OTHER
      ,ENT_CARGO_OTHER_DESC
      ,ZEROIFNULL(TRY_TO_NUMBER(ENT_CARGO_HAZMAT))::NUMBER(10,0) AS ENT_CARGO_HAZMAT
      ,ENT_DRVR_LESS_100
      ,ENT_DRVR_GREATER_100
      ,ENT_DRVR_TOTAL
      ,ENT_DRVR_GREATER_100_RATIO
      ,ENT_DRVR_GREATER_100_PROPENSITY
      ,ENT_DRVR_TOTAL_CDL
      ,ENT_UNITS_EST_PWR
      ,ENT_UNITS_EST_PWR_RANGE
      ,ZEROIFNULL(ENT_USDOT_OWN_TRUCK) AS ENT_USDOT_OWN_TRUCK
      ,ZEROIFNULL(ENT_USDOT_OWN_TRACT) AS ENT_USDOT_OWN_TRACT
      ,ZEROIFNULL(ENT_USDOT_OWN_TRK) AS ENT_USDOT_OWN_TRK
      ,ZEROIFNULL(ENT_USDOT_TERM_LEASE_TRUCK) AS ENT_USDOT_TERM_LEASE_TRUCK
      ,ZEROIFNULL(ENT_USDOT_TERM_LEASE_TRACT) AS ENT_USDOT_TERM_LEASE_TRACT
      ,ZEROIFNULL(ENT_USDOT_TERM_LEASE_TRK) AS ENT_USDOT_TERM_LEASE_TRK
      ,ZEROIFNULL(ENT_USDOT_TOTAL_TRUCK) AS ENT_USDOT_TOTAL_TRUCK
      ,ZEROIFNULL(ENT_USDOT_TOTAL_TRACT) AS ENT_USDOT_TOTAL_TRACT
      ,ZEROIFNULL(ENT_USDOT_TOTAL_TRK) AS ENT_USDOT_TOTAL_TRK
      ,ZEROIFNULL(ENT_USDOT_TOTAL_PWR) AS ENT_USDOT_TOTAL_PWR
      ,ZEROIFNULL(ENT_USDOT_TOTAL_TRAIL) AS ENT_USDOT_TOTAL_TRAIL
      ,ENT_USDOT_TRACT_RATIO
      ,ENT_USDOT_LEASE_RATIO
      ,ENT_USDOT_LEASE_PROPENSITY
      ,ENT_TRAIL_TO_PWR_RATIO
      ,ENT_MLG_CALENDAR_YEAR
      ,ENT_AVG_MILES_PWR_UNIT
      ,ZEROIFNULL(EQT_CLASS_3_UNITS) AS EQT_CLASS_3_UNITS
      ,ZEROIFNULL(EQT_CLASS_4_UNITS) AS EQT_CLASS_4_UNITS
      ,ZEROIFNULL(EQT_CLASS_5_UNITS) AS EQT_CLASS_5_UNITS
      ,ZEROIFNULL(EQT_CLASS_6_UNITS) AS EQT_CLASS_6_UNITS
      ,ZEROIFNULL(EQT_CLASS_7_UNITS) AS EQT_CLASS_7_UNITS
      ,ZEROIFNULL(EQT_CLASS_8_UNITS) AS EQT_CLASS_8_UNITS
      ,EQT_CLASS_3TO8_UNITS
      ,EQT_CLASS_ALL_UNITS
      ,EQT_CLASS_AVG_OPERATED
      ,EQT_PREV_OP_VIN_RATIO
      ,EQT_PREV_OP_VIN_PROPENSITY
      ,ZEROIFNULL(EQT_BRAND_FREIGHTLINER) AS EQT_BRAND_FREIGHTLINER
      ,ZEROIFNULL(EQT_BRAND_NUMBERL) AS EQT_BRAND_NUMBERL
      ,ZEROIFNULL(EQT_BRAND_PETERBILT) AS EQT_BRAND_PETERBILT
      ,ZEROIFNULL(EQT_BRAND_KENWORTH) AS EQT_BRAND_KENWORTH
      ,ZEROIFNULL(EQT_BRAND_VOLVO) AS EQT_BRAND_VOLVO
      ,ZEROIFNULL(EQT_BRAND_FORD) AS EQT_BRAND_FORD
      ,ZEROIFNULL(EQT_BRAND_MACK) AS EQT_BRAND_MACK
      ,ZEROIFNULL(EQT_BRAND_CHEVROLET) AS EQT_BRAND_CHEVROLET
      ,ZEROIFNULL(EQT_BRAND_GMC) AS EQT_BRAND_GMC
      ,ZEROIFNULL(EQT_BRAND_STERLING) AS EQT_BRAND_STERLING
      ,ZEROIFNULL(EQT_BRAND_ISUZU) AS EQT_BRAND_ISUZU
      ,ZEROIFNULL(EQT_BRAND_WEST_STAR) AS EQT_BRAND_WEST_STAR
      ,ZEROIFNULL(EQT_BRAND_HINO) AS EQT_BRAND_HINO
      ,ZEROIFNULL(EQT_BRAND_DODGE) AS EQT_BRAND_DODGE
      ,ZEROIFNULL(EQT_BRAND_MITSUBISHI) AS EQT_BRAND_MITSUBISHI
      ,ZEROIFNULL(EQT_ENG_CUMMINS) AS EQT_ENG_CUMMINS
      ,ZEROIFNULL(EQT_ENG_CAT) AS EQT_ENG_CAT
      ,ZEROIFNULL(EQT_ENG_DETROIT) AS EQT_ENG_DETROIT
      ,ZEROIFNULL(EQT_ENG_NAVISTAR) AS EQT_ENG_NAVISTAR
      ,ZEROIFNULL(EQT_ENG_MACK) AS EQT_ENG_MACK
      ,ZEROIFNULL(EQT_ENG_VOLVO) AS EQT_ENG_VOLVO
      ,ZEROIFNULL(EQT_ENG_MERCEDES) AS EQT_ENG_MERCEDES
      ,ZEROIFNULL(EQT_ENG_ISUZU) AS EQT_ENG_ISUZU
      ,ZEROIFNULL(EQT_ENG_HINO) AS EQT_ENG_HINO
      ,ZEROIFNULL(EQT_ENG_PACCAR) AS EQT_ENG_PACCAR
      ,ZEROIFNULL(EQT_ENG_GM) AS EQT_ENG_GM
      ,ZEROIFNULL(EQT_ENG_FORD) AS EQT_ENG_FORD
      ,ZEROIFNULL(EQT_ENG_UD_NISSAN) AS EQT_ENG_UD_NISSAN
      ,EQT_MODEL_AVG_AGE
      ,EQT_MODEL_AVG_AGE_PROPENSITY
      ,UCC_VOCATIONAL_TOTAL
      ,UCC_CEMENTMIXER_UNITS
      ,UCC_DUMPBODY_UNITS
      ,UCC_REFUSEBODY_UNITS
      ,UCC_CONSTTRL_UNITS
      ,UCC_DUMPTRIL_UNITS
      ,UCC_CE_UNITS
      ,UCC_AG_UNITS
      ,UCC_LG_UNITS
      ,UCC_OFFROAD_UNITS
      ,UCC_OFFROAD_UNIT_RANGE
      ,ENT_SFTY_RATING_DESC
      ,ENT_SFTY_RATING_SCORE
      ,ENT_SFTY_EFFECTIVE_DATE
      ,CSA_UNSAFE_DRIV_BASIC_ALERT_SCORE
      ,CSA_FATIGUE_DRIV_BASIC_ALERT_SCORE
      ,CSA_DRIV_FIT_BASIC_ALERT_SCORE
      ,CSA_CONTR_SUBST_BASIC_SCORE
      ,CSA_VEH_MANUMBER_BASIC_ALERT_SCORE
      ,CSA_ANY_BASIC_ALERT_SCORE
      ,INSP_TOTAL
      ,INSP_VIOL_TOTAL
      ,INSP_VIOL_RATIO
      ,INSP_VIOL_RATIO_GROUP
      ,INSP_VIOL_TOTAL_HOURS_OF_SERVICE
      ,INSP_VIOL_TOTAL_HOURS_OF_SERVICE_RATIO
      ,INSP_VIOL_TOTAL_HOURS_OF_SERVICE_RATIO_RELATIVE_GROUP
      ,INSP_VIOL_DRIVER_10_15_HOURS
      ,INSP_VIOL_DRIVER_60_70_80_HOURS
      ,INSP_VIOL_DRIVER_ALL_OTHER_HOURS_OF_SERVICE
      ,INSP_VIOL_DRIVER_FALSE_LOG_BOOK
      ,INSP_VIOL_DRIVER_NO_LOG_BOOK_LOG_NOT_CURRENT
      ,INSP_VIOL_DRIVER_STATE_LOCAL_HOURS_OF_SERVICE
      ,INSP_VIOL_TOTAL_CONTROLLED_SUBSTANCE
      ,INSP_VIOL_TOTAL_CONTROLLED_SUBSTANCE_RATIO
      ,INSP_VIOL_TOTAL_CONTROLLED_SUBSTANCE_RATIO_RELATIVE_GROUP
      ,INSP_VIOL_DRIVER_ALCOHOL
      ,INSP_VIOL_DRIVER_DRUGS
      ,INSP_VIOL_TOTAL_UNSAFE_DRIVING
      ,INSP_VIOL_TOTAL_UNSAFE_DRIVING_RATIO
      ,INSP_VIOL_TOTAL_UNSAFE_DRIVING_RATIO_RELATIVE_GROUP
      ,INSP_VIOL_DRIVER_FAILURE_TO_OBEY_TRAFFIC_CONTROL_DEVICE
      ,INSP_VIOL_DRIVER_FAILURE_TO_YIELD_RIGHT_OF_WAY
      ,INSP_VIOL_DRIVER_FOLLOWING_TOO_CLOSE
      ,INSP_VIOL_DRIVER_IMPROPER_LANE_CHANGE
      ,INSP_VIOL_DRIVER_IMPROPER_PASSING
      ,INSP_VIOL_DRIVER_IMPROPER_TURNS
      ,INSP_VIOL_DRIVER_RADAR_DETECTORS
      ,INSP_VIOL_DRIVER_RECKLESS_DRIVING
      ,INSP_VIOL_DRIVER_SEAT_BELT
      ,INSP_VIOL_DRIVER_SIZE_AND_WEIGHT
      ,INSP_VIOL_DRIVER_SPEEDING
      ,INSP_VIOL_DRIVER_TRAFFIC_ENFORCEMENT
      ,INSP_VIOL_TOTAL_DRIVER_FITNESS
      ,INSP_VIOL_TOTAL_DRIVER_FITNESS_RATIO
      ,INSP_VIOL_TOTAL_DRIVER_FITNESS_RATIO_RELATIVE_GROUP
      ,INSP_VIOL_DRIVER_MEDICAL_CERTIFICATE
      ,INSP_VIOL_DRIVER_DISQUALIFIED_DRIVERS
      ,INSP_VIOL_TOTAL_HAZMAT
      ,INSP_VIOL_TOTAL_HAZMAT_RATIO
      ,INSP_VIOL_TOTAL_HAZMAT_RATIO_RELATIVE_GROUP
      ,INSP_VIOL_HAZMAT_ACCEPTING_SHIPMENT_IMPROPERLY_MARKED
      ,INSP_VIOL_HAZMAT_ALL_OTHER_HAZMAT_VIOLATIONS
      ,INSP_VIOL_HAZMAT_EMERGENCY_RESPONSE
      ,INSP_VIOL_HAZMAT_IMPROPER_BLOCKING_AND_BRACING
      ,INSP_VIOL_HAZMAT_IMPROPER_PLACARDING
      ,INSP_VIOL_HAZMAT_NO_REMOTE_SHUTOFF_CONTROL
      ,INSP_VIOL_HAZMAT_NO_RETEST_AND_INSPECTION_CARGO_TANK
      ,INSP_VIOL_HAZMAT_SHIPPING_PAPER
      ,INSP_VIOL_HAZMAT_USE_OF_NON_SPECIFICATION_CONTAINER
      ,INSP_VIOL_TOTAL_VEH_MANUMBER
      ,INSP_VIOL_TOTAL_VEH_MANUMBER_RATIO
      ,INSP_VIOL_TOTAL_VEH_MANUMBER_RATIO_RELATIVE_GROUP
      ,INSP_VIOL_VEHICLE_ALL_OTHER_BRAKE_VIOLATIONS
      ,INSP_VIOL_VEHICLE_ALL_OTHER_VEHICLE_DEFECTS
      ,INSP_VIOL_VEHICLE_BRAKES_OUT_OF_ADJUSTMENT
      ,INSP_VIOL_VEHICLE_COUPLING_DEVICES
      ,INSP_VIOL_VEHICLE_EMERGENCY_EQUIPMENT
      ,INSP_VIOL_VEHICLE_EXHAUST_DISCHARGE
      ,INSP_VIOL_VEHICLE_FRAMES
      ,INSP_VIOL_VEHICLE_FUEL_SYSTEMS
      ,INSP_VIOL_VEHICLE_LIGHTING
      ,INSP_VIOL_VEHICLE_LOAD_SECUREMENT
      ,INSP_VIOL_VEHICLE_PERIODIC_INSPECTION
      ,INSP_VIOL_VEHICLE_STEERING_MECHANISM
      ,INSP_VIOL_VEHICLE_SUSPENSION
      ,INSP_VIOL_VEHICLE_TIRES
      ,INSP_VIOL_VEHICLE_WHEELS_STUDS_CLAMPS
      ,INSP_VIOL_VEHICLE_WINDSHIELD
      ,INSP_VIOL_TOTAL_OTHER
      ,INSP_VIOL_TOTAL_OTHER_RATIO
      ,INSP_VIOL_DRIVER_ALL_OTHER_DRIVER_VIOLATIONS
      ,INSP_VIOL_UNKNOWN
      ,ACC_TOTAL_COUNT
      ,ACC_TO_PWR_EST_RATIO
      ,ACC_RATIO_GROUP
      ,ACC_FATALITY_COUNT
      ,ACC_FATALITY_TOTAL
      ,ACC_INJURY_COUNT
      ,ACC_INJURY_TOTAL
      ,ACC_PROPERTY_COUNT
      ,ACC_TOWAWAY_COUNT
      ,ACC_ROLLOVER_COUNT
      ,ENT_STATUS
      ,SEGMENT_CONCRETE_MIXER
      ,SEGMENT_DUMP
      ,SEGMENT_HEAVY_HAUL
      ,SEGMENT_REFUSE
      ,a.RPT_YR
      ,a.RPT_MONTH
FROM ITD_SCHEMACHANGE_DEMO.RIGDIG_ENTITY_ALL a
inner join RDENT b
on a.RRID = b.RRID
and a.RPT_YR::VARCHAR(4)||case when a.RPT_MONTH < 10 then '0' else '' end||a.RPT_MONTH::VARCHAR(2) = b.RPT_YR_MONTH;
