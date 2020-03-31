WITH attendance AS (
    SELECT "index", date, teacher,
    CASE
        WHEN result == 'A' THEN 0
        WHEN result == 'Y' THEN 1
        WHEN result == 'N' THEN 1
        ELSE 1
    END AS att
    FROM observations),

teacher_att AS (SELECT observations."index", observations.Teacher, round((1.0*sum(attendance.att) / round(count(attendance.att))),3) AS 'Zoom_attendance'
FROM observations
LEFT JOIN attendance ON observations."index" == attendance."index"
WHERE ((observations.date IS '2020-03-27 00:00:00'))
GROUP BY 2
ORDER BY 2)

SELECT *
FROM teacher_att
