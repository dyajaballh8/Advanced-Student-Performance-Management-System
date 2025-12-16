CREATE DATABASE StudentPerformanceDB;

CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Username NVARCHAR(50) NOT NULL,
    Password NVARCHAR(50) NOT NULL,
    Role NVARCHAR(20) 
);

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name NVARCHAR(100),
    Major NVARCHAR(50),
    GPA FLOAT DEFAULT 0.0,
    TotalHours INT,
    FacultyName NVARCHAR(50),
    FOREIGN KEY (StudentID) REFERENCES Users(UserID)
);

CREATE TABLE Faculty (
    FacultyID INT PRIMARY KEY,
    Name NVARCHAR(100),
    Department NVARCHAR(50),
    FOREIGN KEY (FacultyID) REFERENCES Users(UserID)
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseCode NVARCHAR(20),
    CourseName NVARCHAR(100),
    CreditHours INT
);

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY IDENTITY(1,1),
    StudentID INT,
    CourseID INT,
    Semester NVARCHAR(20),
    GradeType NVARCHAR(20), 
    Score FLOAT,
    Year INT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY IDENTITY(1,1),
    StudentID INT,
    TotalDays INT DEFAULT 80,
    AttendedDays INT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

INSERT INTO Users (UserID, Username, Password, Role) VALUES 
(101, 'ahmed_student', 'pass123', 'Student'),
(102, 'sara_student', 'pass456', 'Student'),
(201, 'dr_ali', 'doc456', 'Faculty');

INSERT INTO Students (StudentID, Name, Major, GPA, TotalHours, FacultyName) VALUES 
(101, 'Ahmed Ali', 'Computer Science', 3.8, 15, 'Engineering'),
(102, 'Sara Hassan', 'Information Systems', 3.5, 12, 'Computing');

INSERT INTO Faculty (FacultyID, Name, Department) VALUES 
(201, 'Dr. Ali Mohamed', 'Computer Science');

INSERT INTO Courses (CourseID, CourseCode, CourseName, CreditHours) VALUES 
(1, 'CS101', 'Java Programming', 3),
(2, 'DB202', 'SQL Database', 3),
(3, 'OOP202', 'Object Oriented Programming', 4);

INSERT INTO Enrollments (StudentID, CourseID, Semester, GradeType, Score, Year) VALUES 
(101, 1, 'Fall', 'Midterm', 85.0, 2025),
(101, 1, 'Fall', 'Final', 90.0, 2025),
(102, 2, 'Fall', 'Midterm', 78.0, 2025);

INSERT INTO Attendance (StudentID, TotalDays, AttendedDays) VALUES 
(101, 80, 65), 
(102, 80, 50); 
