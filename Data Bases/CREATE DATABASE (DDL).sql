CREATE DATABASE StudentPerformanceDB;

CREATE TABLE [User] (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    Username VARCHAR(50) UNIQUE NOT NULL,
    PasswordHash VARCHAR(255) NOT NULL,
    UserRole VARCHAR(10) CHECK (UserRole IN ('Student', 'Faculty', 'Admin')) NOT NULL
);

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Major NVARCHAR(50),
    AcademicYear INT,
    CONSTRAINT FK_Student_User FOREIGN KEY (StudentID) REFERENCES [User](UserID)
);

CREATE TABLE Faculty (
    FacultyID INT PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Department NVARCHAR(50),
    CONSTRAINT FK_Faculty_User FOREIGN KEY (FacultyID) REFERENCES [User](UserID)
);

CREATE TABLE Course (
    CourseID INT IDENTITY(1,1) PRIMARY KEY,
    CourseCode VARCHAR(10) UNIQUE NOT NULL,
    CourseName NVARCHAR(100) NOT NULL,
    CreditHours INT NOT NULL,
    FacultyID INT,
    CONSTRAINT FK_Course_Faculty FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID)
);

CREATE TABLE Enrollment (
    EnrollmentID INT IDENTITY(1,1) PRIMARY KEY,
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    Semester NVARCHAR(20) NOT NULL,
    Year INT NOT NULL,
    CONSTRAINT UQ_Enrollment UNIQUE (StudentID, CourseID, Semester, Year),
    CONSTRAINT FK_Enrollment_Student FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    CONSTRAINT FK_Enrollment_Course FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

CREATE TABLE Grade (
    GradeID INT IDENTITY(1,1) PRIMARY KEY,
    EnrollmentID INT NOT NULL,
    GradeType NVARCHAR(50) CHECK (GradeType IN ('Quiz', 'Midterm', 'Final', 'Assignment')) NOT NULL,
    Score DECIMAL(5, 2) CHECK (Score >= 0) NOT NULL,
    GradeDate DATE,
    CONSTRAINT FK_Grade_Enrollment FOREIGN KEY (EnrollmentID) REFERENCES Enrollment(EnrollmentID)
);

CREATE TABLE Attendance (
    AttendanceID INT IDENTITY(1,1) PRIMARY KEY,
    EnrollmentID INT NOT NULL,
    SessionDate DATE NOT NULL,
    Status VARCHAR(10) CHECK (Status IN ('Present', 'Absent')) NOT NULL,
    CONSTRAINT UQ_Attendance UNIQUE (EnrollmentID, SessionDate),
    CONSTRAINT FK_Attendance_Enrollment FOREIGN KEY (EnrollmentID) REFERENCES Enrollment(EnrollmentID)
);

CREATE TABLE Alert (
    AlertID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT NOT NULL,
    AlertType NVARCHAR(50) CHECK (AlertType IN ('Absence', 'ExamDue', 'AssignmentDue', 'General')) NOT NULL,
    Message NVARCHAR(500) NOT NULL,
    DateTimeSent DATETIME DEFAULT GETDATE(),
    IsSent BIT DEFAULT 0,
    CONSTRAINT FK_Alert_User FOREIGN KEY (UserID) REFERENCES [User](UserID)
);
