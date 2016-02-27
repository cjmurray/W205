CREATE TABLE surveys_responses_x AS SELECT * FROM surveys_responses;

ALTER TABLE surveys_responses_x CHANGE HCAHPSBaseScore HCAHPSBaseScore INT;
ALTER TABLE surveys_responses_x CHANGE HCAHPSConsistencyScore HCAHPSConsistencyScore INT;
