SELECT DISTINCT STDDEV_POP(Score) OVER (PARTITION BY ProviderID) AS stddevScore, MeasureID, MeasureName 
FROM effective_care_x 
WHERE Score > 0 AND Score <= 100 
GROUP BY MeasureID, MeasureName, Score 
ORDER BY stddevScore DESC 
LIMIT 10;
