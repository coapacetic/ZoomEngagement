WITH attendance AS (
    SELECT "index", date, teacher,
    CASE
        WHEN result == 'A' THEN 0
        WHEN result == 'Y' THEN 1
        WHEN result == 'N' THEN 1
        ELSE NULL
    END AS att
    FROM observations),

perc_attend AS (SELECT observations."index", observations.Student_ID_Number, observations.First_Name, observations.Last_Name, observations.date, (sum(attendance.att) / round(count(attendance.att))) AS 'Zoom_attendance'
FROM observations
LEFT JOIN attendance ON observations."index" == attendance."index"
WHERE ((observations.date IS '2020-03-27 00:00:00') AND {observations.att IS NOT NULL)
GROUP BY 2
ORDER BY 4)

SELECT *
FROM perc_attend
WHERE Zoom_attendance < 1