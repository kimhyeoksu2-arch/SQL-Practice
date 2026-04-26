SELECT S.user_id
    , ROUND(AVG(CASE WHEN action = 'timeout' OR action IS NULL THEN 0 ELSE 1 END), 2) AS confirmation_rate 
FROM Signups S
LEFT JOIN Confirmations C ON S.user_id = C.user_id
GROUP BY S.user_id
