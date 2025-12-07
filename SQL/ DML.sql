USE StudentPerformanceDB;
GO

INSERT INTO [User] (Username, PasswordHash, UserRole) VALUES 
('s_ali', 'pass123', 'Student'),
('s_lama', 'pass456', 'Student'),
('s_ahmad', 'pass789', 'Student'),
('f_dr_sami', 'faculty1', 'Faculty'),
('f_dr_hend', 'faculty2', 'Faculty'),
('admin', 'adminpass', 'Admin');
GO

INSERT INTO Student (StudentID, Name, Major, AcademicYear) VALUES
(1, N'علي محمد', N'هندسة برمجيات', 3),
(2, N'لمى خالد', N'علوم حاسب', 3),
(3, N'أحمد سعيد', N'ذكاء اصطناعي', 2);

INSERT INTO Faculty (FacultyID, Name, Department) VALUES
(4, N'د. سامي فؤاد', N'نظم المعلومات'),
(5, N'د. هند عادل', N'شبكات الحاسوب');
GO

INSERT INTO Course (CourseCode, CourseName, CreditHours, FacultyID) VALUES
('OOP101', N'برمجة شيئية متقدمة', 4, 4),
('DB202', N'تصميم قواعد بيانات', 3, 5),
('NET303', N'أساسيات الشبكات', 3, 5);
GO

INSERT INTO Enrollment (StudentID, CourseID, Semester, Year) VALUES
(1, 1, N'خريف', 2025),
(1, 2, N'خريف', 2025);

INSERT INTO Enrollment (StudentID, CourseID, Semester, Year) VALUES
(2, 1, N'خريف', 2025),
(2, 3, N'خريف', 2025);

INSERT INTO Enrollment (StudentID, CourseID, Semester, Year) VALUES
(3, 2, N'خريف', 2025);
GO

INSERT INTO Grade (EnrollmentID, GradeType, Score, GradeDate) VALUES
(1, 'Quiz', 15.00, '2025-11-01'),
(1, 'Midterm', 35.50, '2025-11-15');

INSERT INTO Grade (EnrollmentID, GradeType, Score, GradeDate) VALUES
(3, 'Quiz', 18.00, '2025-11-01'),
(3, 'Midterm', 38.00, '2025-11-15');

INSERT INTO Grade (EnrollmentID, GradeType, Score, GradeDate) VALUES
(5, 'Assignment', 8.50, '2025-11-20');
GO

INSERT INTO Attendance (EnrollmentID, SessionDate, Status) VALUES
(1, '2025-11-05', 'Present'),
(1, '2025-11-12', 'Absent'),
(1, '2025-11-19', 'Present');

INSERT INTO Attendance (EnrollmentID, SessionDate, Status) VALUES
(3, '2025-11-05', 'Present'),
(3, '2025-11-12', 'Present'),
(3, '2025-11-19', 'Present');
GO

INSERT INTO Alert (UserID, AlertType, Message, DateTimeSent, IsSent) VALUES
(1, 'Absence', N'تم تسجيل غيابك في مقرر برمجة شيئية متقدمة بتاريخ 2025-11-12.', GETDATE(), 0);

INSERT INTO Alert (UserID, AlertType, Message, DateTimeSent, IsSent) VALUES
(2, 'ExamDue', N'تذكير: لديك اختبار نهائي في مقرر أساسيات الشبكات الأسبوع القادم.', GETDATE(), 0);
GO


