CREATE TABLE effective_care_x AS SELECT ProviderID, HospitalName, Score FROM effective_care;

ALTER TABLE effective_care_x CHANGE Score Score INT;
