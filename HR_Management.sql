-- 1.Employee Table
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    DepartmentID INT,
    Position VARCHAR(100),
    HireDate DATE,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);
-- 2. Department Table
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    Name VARCHAR(100),
    ManagerID INT,
    FOREIGN KEY (ManagerID) REFERENCES Employee(EmployeeID)
);
-- 3. Attendance Table
CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY,
    EmployeeID INT,
    Date DATE,
    TimeIn TIME,
    TimeOut TIME,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);
-- 4. Leave Table
CREATE TABLE Leave (
    LeaveID INT PRIMARY KEY,
    EmployeeID INT,
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);
-- 5.	Payroll Table
CREATE TABLE Payroll (
    PayrollID INT PRIMARY KEY,
    EmployeeID INT,
    Salary DECIMAL(10, 2),
    NetPay DECIMAL(10, 2),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);
-- 6. Training Table
CREATE TABLE Training (
    TrainingID INT PRIMARY KEY,
    EmployeeID INT,
    Title VARCHAR(100),
    Date DATE,
FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);
-- Job Posting
-- 1.	JobPostings Table
CREATE TABLE JobPostings (
    JobID INT PRIMARY KEY,
    Title VARCHAR(100),
    DepartmentID INT,
    Description TEXT,
    PostDate DATE,
    ClosingDate DATE,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);
-- 2.	Candidate Table
CREATE TABLE Candidate (
    CandidateID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(20),
Resume TEXT,  -- Stores resume details or file location
    ApplicationDate DATE
);
-- 3.	ApplicationTracking Table
CREATE TABLE ApplicationTracking (
    TrackingID INT PRIMARY KEY,
    CandidateID INT,
    JobID INT,
    ApplicationStatus VARCHAR(50),  -- e.g., "Applied", "Interviewed", "Offered", "Hired"
    InterviewDate DATE,
    OfferDate DATE,
    HireDate DATE,
    FOREIGN KEY (CandidateID) REFERENCES Candidate(CandidateID),
    FOREIGN KEY (JobID) REFERENCES JobPostings(JobID)
);
-- 4.	InterviewSchedule Table
CREATE TABLE InterviewSchedule (
    ScheduleID INT PRIMARY KEY,
    CandidateID INT,
    JobID INT,
    Interviewer VARCHAR(100),
    InterviewDate DATE,
    InterviewTime TIME,
    FOREIGN KEY (CandidateID) REFERENCES Candidate(CandidateID),
    FOREIGN KEY (JobID) REFERENCES JobPostings(JobID)
);
-- 5.	Analytics Table (Optional)
CREATE TABLE RecruitmentAnalytics (
    AnalyticsID INT PRIMARY KEY,
    JobID INT,
    TotalApplications INT,
    InterviewsScheduled INT,
    OffersMade INT,
    CandidatesHired INT,
    FOREIGN KEY (JobID) REFERENCES JobPostings(JobID) );
