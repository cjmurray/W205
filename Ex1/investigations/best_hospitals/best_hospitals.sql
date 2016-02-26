SELECT hospname, hcahpsbasescore, hcahpsconsistencyscore FROM surveys_responses WHERE hcahpsbasescore > 10 ORDER BY hcahpsbasescore DESC, hcahpsconsistencyscore DESC LIMIT 10; 
