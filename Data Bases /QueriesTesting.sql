USE StudentPerformanceDB;
GO

SELECT
    S.Name AS StudentName,
    C.CourseName,
    SUM(G.Score) AS TotalAchievedScore,
    C.CreditHours
FROM
    Student S
JOIN
    Enrollment E ON S.StudentID = E.StudentID
JOIN
    Course C ON E.CourseID = C.CourseID
JOIN
    Grade G ON E.EnrollmentID = G.EnrollmentID
WHERE
    S.Name = N'علي محمد' 
GROUP BY
    S.Name, C.CourseName, C.CreditHours
ORDER BY
    TotalAchievedScore DESC;




SELECT
    C.CourseCode,
    C.CourseName,
    COUNT(CASE WHEN A.Status = 'Absent' THEN 1 END) AS TotalAbsences
FROM
    Course C
JOIN
    Enrollment E ON C.CourseID = E.CourseID
JOIN
    Attendance A ON E.EnrollmentID = A.EnrollmentID
GROUP BY
    C.CourseCode, C.CourseName
HAVING
    COUNT(CASE WHEN A.Status = 'Absent' THEN 1 END) > 0 
ORDER BY
    TotalAbsences DESC;
