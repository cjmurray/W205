CREATE EXTERNAL TABLE hospitals(
	ProviderID  string,
	HospitalName  string,
	Address  string,
	City  string,
	State  string,
	ZIPCode  string,
	CountyName  string,
	PhoneNumber  string,
	HospitalType  string,
	HospitalOwnership  string,
	EmergencyServices  string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES( "separatorChar" = ',', "quoteChar" = '"', "escapeChar" = '\\' )
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/';

CREATE EXTERNAL TABLE effective_care( 
	ProviderID  string,
	HospitalName  string,
	Address  string,
	City  string,
	State  string,
	ZIPCode  string,
	CountyName  string,
	PhoneNumber  string,
	Condition  string,
	MeasureID  string,
	MeasureName  string,
	Score  int,
	Sample  int,
	Footnote  string,
	MeasureStartDate  string,
	MeasureEndDate string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES( "separatorChar" = ',', "quoteChar" = '"', "escapeChar" = '\\' )
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/';

CREATE EXTERNAL TABLE readmissions( 
	ProviderID  string,
	HospitalName  string,
	Address  string,
	City  string,
	State  string,
	ZIPCode  string,
	CountyName  string,
	PhoneNumber  string,
	MeasureName  string,
	MeasureID  string,
	ComparedtoNational  string,
	Denominator  string,
	Score  decimal,
	LowerEstimate  decimal,
	HigherEstimate  decimal,
	Footnote  string,
	MeasureStartDate  string,
	MeasureEndDate string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES( "separatorChar" = ',', "quoteChar" = '"', "escapeChar" = '\\' )
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/';

CREATE EXTERNAL TABLE measures( 
	MeasureName  string,
	MeasureID  string,
	MeasureStartQuarter  string,
	MeasureStartDate  string,
	MeasureEndQuarter  string,
	MeasureEndDate string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES( "separatorChar" = ',', "quoteChar" = '"', "escapeChar" = '\\' )
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/';

CREATE EXTERNAL TABLE surveys_responses( 
	ProviderNumber  string,
	HospName  string,
	Address  string,
	City  string,
	State  string,
	ZIPCode  string,
	CountyName  string,
	CommNursesAchvPoints  string,
	CommNursesImprPoints  string,
	CommNursesDimnScore  string,
	CommDoctorsAchvPoints  string,
	CommDoctorsImprPoints  string,
	CommDoctorsDimnScore  string,
	RespHospStaffAchvPoints  string,
	RespHospStaffImprPoints  string,
	RespHospStaffDimnScore  string,
	PainMgmtAchvPoints  string,
	PainMgmtImprPoints  string,
	PainMgmtDimnScore  string,
	CommMediAchvPoints  string,
	CommMediImprPoints  string,
	CommMediDimnScore  string,
	CleanQuietHospEnvAchvPoints  string,
	CleanQuietHospEnvImprPoints  string,
	CleanQuietHospEnvDimnScore  string,
	DischargeInfoAchvPoints  string,
	DischargeInfoImprPoints  string,
	DischargeInfoDimnScore  string,
	OverallRatingHospAchvPoints  string,
	OverallRatingHospImprPoints  string,
	OverallRatingHospDimnScore  string,
	HCAHPSBaseScore  int,
	HCAHPSConsistencyScore int)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES( "separatorChar" = ',', "quoteChar" = '"', "escapeChar" = '\\' )
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/';




