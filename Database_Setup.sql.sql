CREATE DATABASE StudentPerformanceDB;


CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Username NVARCHAR(50),
    Password NVARCHAR(50),
    Role NVARCHAR(20)
);

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name NVARCHAR(100),
    Major NVARCHAR(50),
    GPA FLOAT,
    TotalHours INT,
    FacultyName NVARCHAR(50),
    FOREIGN KEY (StudentID) REFERENCES Users(UserID)
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
    Year INT,
    GradeType NVARCHAR(20), 
    Score FLOAT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);



INSERT INTO Users (UserID, Username, Password, Role) VALUES 
(101, 'ahmed_student', 'pass123', 'Student'),
(102, 'sara_student', 'pass456', 'Student'),
(201, 'dr_mohamed', 'admin789', 'Faculty');

INSERT INTO Students (StudentID, Name, Major, GPA, TotalHours, FacultyName) VALUES 
(101, 'Ahmed Ali', 'Computer Science', 3.8, 15, 'Engineering'),
(102, 'Sara Hassan', 'Information Systems', 3.5, 12, 'Computing');

INSERT INTO Courses (CourseID, CourseCode, CourseName, CreditHours) VALUES 
(1, 'CS101', 'Intro to Programming', 3),
(2, 'IS201', 'Database Systems', 3),
(3, 'OOP202', 'Object Oriented Programming', 4);


INSERT INTO Enrollments (StudentID, CourseID, Semester, Year, GradeType, Score) VALUES 
(101, 1, 'Fall', 2024, 'Midterm', 85.5),
(101, 1, 'Fall', 2024, 'Final', 90.0),
(102, 2, 'Fall', 2024, 'Midterm', 78.0);