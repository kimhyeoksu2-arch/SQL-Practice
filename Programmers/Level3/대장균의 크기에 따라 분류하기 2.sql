WITH number AS (
    SELECT ID
        , ROW_NUMBER() OVER (ORDER BY SIZE_OF_COLONY) AS rn
        , COUNT(*) OVER () AS cnt
    FROM ECOLI_DATA
)

SELECT ID
        , CASE WHEN rn / cnt <= 0.25 THEN 'LOW'
            WHEN rn / cnt <= 0.5 THEN  'MEDIUM'
            WHEN rn / cnt <= 0.75 THEN  'HIGH'
            ELSE 'CRITICAL' 
            END AS COLONY_NAME
FROM number
ORDER BY ID
