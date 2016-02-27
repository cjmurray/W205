CREATE TABLE readmissions_x AS SELECT * FROM readmissions;

ALTER TABLE readmissions_x CHANGE Score Score decimal(10,1);
ALTER TABLE readmissions_x CHANGE LowerEstimate LowerEstimate decimal(10,1);
ALTER TABLE readmissions_x CHANGE HigherEstimate HigherEstimate decimal(10,1);

