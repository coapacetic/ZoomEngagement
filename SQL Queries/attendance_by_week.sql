WITH attendance (obs_id, date, present) AS (
SELECT obs_id, date,
CASE
    WHEN result = 'Y' THEN 1
    WHEN result = 'N' THEN 1
    WHEN result = 'A' THEN 0
    ELSE 1
END AS present
FROM observations
)

SELECT observations.Student_Name, sum(present)
FROM observations
LEFT JOIN attendance ON observations.obs_id = attendance.obs_id
WHERE observations.date BETWEEN '2020-03-23 00:00:00' AND '2020-03-27 00:00:00'
GROUP BY observations.ID_Number
ORDER BY observations.date;