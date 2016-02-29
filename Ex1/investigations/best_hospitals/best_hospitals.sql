SELECT DISTINCT AVG(Score) OVER (PARTITION BY ProviderID) AS avgScore, ProviderID, HospitalName 
FROM effective_care_x 
WHERE Score > 0 AND Score <= 100 
GROUP BY ProviderID, HospitalName, Score 
ORDER BY avgScore DESC 
LIMIT 10;
