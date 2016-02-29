SELECT DISTINCT AVG(Score) OVER (PARTITION BY State) AS avgScore, State
FROM effective_care_x 
WHERE Score > 0 AND Score <= 100 
GROUP BY State, Score 
ORDER BY avgScore DESC 
LIMIT 10;
