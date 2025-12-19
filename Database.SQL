CREATE DATABASE StudentPerformanceDB;

CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Username NVARCHAR(50) NOT NULL,
    Password NVARCHAR(50) NOT NULL,
    Role NVARCHAR(20) NOT NULL
);

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Major NVARCHAR(50),
    Score FLOAT DEFAULT 0.0,
    TotalHours INT DEFAULT 0,
    EnrollmentsCount INT DEFAULT 0,
    CoursesCount INT DEFAULT 0,
    FacultyName NVARCHAR(100),
    FOREIGN KEY (StudentID) REFERENCES Users(UserID)
);

CREATE TABLE Faculty (
    FacultyID INT PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Section INT,
    GPA FLOAT DEFAULT 0.0,
    FOREIGN KEY (FacultyID) REFERENCES Users(UserID)
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseCode NVARCHAR(20) NOT NULL,
    CourseName NVARCHAR(100) NOT NULL,
    CreditHours INT NOT NULL,
    Section INT
);

CREATE TABLE Attendance (
    StudentID INT PRIMARY KEY,
    TotalDays INT DEFAULT 80,
    AttendedDays INT DEFAULT 0,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

CREATE TABLE CourseAbsence (
    AbsenceID INT PRIMARY KEY IDENTITY(1,1),
    StudentID INT NOT NULL,
    CourseName NVARCHAR(100) NOT NULL,
    TotalLectures INT DEFAULT 0,
    AbsentLectures INT DEFAULT 0,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);


INSERT INTO Users (UserID, Username, Password, Role) VALUES (1, 'ahmed_student', '123', 'Student');
INSERT INTO Users (UserID, Username, Password, Role) VALUES (10, 'dr_admin', 'admin', 'Faculty');

INSERT INTO Students (StudentID, Name, Major, Score, TotalHours, EnrollmentsCount, CoursesCount, FacultyName) 
VALUES (1, 'Ahmed Ali', 'Computer Science', 0.0, 15, 2, 5, 'Engineering');

INSERT INTO Faculty (FacultyID, Name, Section, GPA) 
VALUES (10, 'Dr. Admin', 1, 4.0);

INSERT INTO Attendance (StudentID, TotalDays, AttendedDays) 
VALUES (1, 80, 65);

INSERT INTO Courses (CourseID, CourseCode, CourseName, CreditHours, Section) 
VALUES (101, 'CS101', 'Java Programming', 3, 1);

