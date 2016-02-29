DROP TABLE hospital_scores;

CREATE TABLE hospital_scores AS 
SELECT DISTINCT AVG(Score) OVER (PARTITION BY ProviderID) AS avgScore, ProviderID, HospitalName 
FROM effective_care_x 
WHERE Score > 0 AND Score <= 100 
GROUP BY ProviderID, HospitalName, Score 
ORDER BY avgScore DESC;

SELECT h.ProviderID, ROUND(h.avgScore, 1), s.HCAHPSBaseScore 
FROM hospital_scores h, surveys_responses s 
WHERE h.ProviderID = s.ProviderNumber AND s.HCAHPSBaseScore > 0 
SORT BY h.avgScore DESC 
LIMIT 10;

SELECT h.ProviderID, ROUND(h.avgScore, 1), s.HCAHPSBaseScore 
FROM hospital_scores h, surveys_responses s 
WHERE h.ProviderID = s.ProviderNumber AND s.HCAHPSBaseScore > 0 
SORT BY h.avgScore 
LIMIT 10;
