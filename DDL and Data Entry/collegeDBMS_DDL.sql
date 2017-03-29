CREATE DATABASE collegeDBMS;

CREATE TABLE Person
(
	PersonID varchar(6) PRIMARY KEY,
    Fname varchar(20) NOT NULL,
    Mname varchar(20) NOT NULL,
    Lname varchar(20) NOT NULL,
    Dob date NOT NULL,
    Gender varchar(7) NOT NULL,
    StreetAddress varchar(30) NOT NULL,
    PIN varchar(6) NOT NULL,
    FOREIGN KEY (PIN) REFERENCES PINDetails(PIN)
);



CREATE TABLE PINDetails
(
	PIN varchar(6) PRIMARY KEY,
    State varchar(20) NOT NULL,
    City varchar(20) NOT NULL,
    Country varchar(20) NOT NULL,
);

CREATE TABLE EmailAddress
(
	PersonID varchar(6),
    EmailID varchar(30) NOT NULL,
    PRIMARY KEY(PersonID,EmailID),
	FOREIGN KEY (PersonID) REFERENCES Person(PersonID)
);

CREATE TABLE ContactDetails
(
	PersonID varchar(6),
    ContactNo varchar(10),
    PRIMARY KEY(PersonID,ContactNo)
	FOREIGN KEY (PersonID) REFERENCES Person(PersonID)
);




CREATE TABLE CommitteeMember
(
	MemberID varchar(6) NOT NULL,
    Year int NOT NULL,
    CommitteeID varchar(3) NOT NULL,
    MemberPosition varchar(15),
    PRIMARY KEY(MemberID,Year),
    FOREIGN KEY (MemberID) REFERENCES Person(PersonID),
    FOREIGN KEY (CommitteeID) REFERENCES Committee(CommitteeID)
);

CREATE TABLE Forms
(
	MemberID varchar(6) NOT NULL,
    Year int NOT NULL,
    CommitteeID varchar(3) NOT NULL,
    PRIMARY KEY(MemberID,Year,CommitteeID),
    FOREIGN KEY (MemberID,Year) REFERENCES CommitteeMember(MemberID,Year),
    FOREIGN KEY (CommitteeID) REFERENCES Committee(CommitteeID)
);

CREATE TABLE Committee
(
	CommitteeID varchar(3) PRIMARY KEY,
    CommitteeName varchar(25) NOT NULL,
    Since date
);


CREATE TABLE Student
(
	StudentID varchar(6) PRIMARY KEY,
    NameOfSchool varchar(30) NOT NULL,
    GuardianContactNo varchar(10) NOT NULL,
    BoardSeatNo varchar(7) NOT NULL UNIQUE KEY,
    ProgID varchar(6) NOT NULL,
    ACPCNO varchar(6) UNIQUE KEY,
    Attempts int NOT NULL,
    AddressOfSchool varchar(50) NOT NULL,
    HSCBoard varchar(15) NOT NULL,
    GradeObtained varchar(3) NOT NULL,
    JEEROllNO varchar(8) NOT NULL UNIQUE KEY,
    Medium varchar(10) NOT NULL,
    JEEScore int NOT NULL,
    YearOfPassing int NOT NULL,
    Batch int NOT NULL,
    FOREIGN KEY (StudentID) REFERENCES Person(PersonID),
    FOREIGN KEY (progID) REFERENCES Program(ProgID)
);

CREATE TABLE Program
(
	ProgID varchar(6) NOT NULL PRIMARY KEY,
    ProgramName varchar(15) NOT NULL
);

CREATE TABLE Fee
(
	ReceiptNo varchar(8) PRIMARY KEY,
    ChequeNo varchar(15) NOT NULL UNIQUE KEY,
    BankName varchar(25) NOT NULL,
    Date date NOT NULL,
    Amount int NOT NULL,
    AcadYear int NOT NULL,
    Semester int NOT NULL,
    StudentID varchar(6) NOT NULL,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentId)
);


CREATE TABLE Staff
(
	StaffID varchar(6) NOT NULL PRIMARY KEY,
    AppintmentDate date NOT NULL,
    Experience int NOT NULL,
    FOREIGN KEY (StaffID) REFERENCES Person(PersonID)
);



CREATE TABLE Faculty
(
	FacultyID varchar(6) PRIMARY KEY,
    VisingOfNot varchar(1) NOT NULL,
    Designation varchar(25) NOT NULL,
    Specialization varchar(30),
    FOREIGN KEY (FacultyID) REFERENCES Staff(StaffID)
);

CREATE TABLE Courses
(
	CourseID varchar(6) NOT NULL PRIMARY KEY,
    Since date,
    CourseName varchar(30) NOT NULL,
    Credit numeric(10,2) NOT NULL
);


CREATE TABLE Salary
(
	PaySlipNo varchar(8) PRIMARY KEY,
    ChequeNo varchar(15) UNIQUE KEY,
    BankName varchar(25) NOT NULL,
    StaffID varchar(6) NOT NULL,
    Amount int NOT NULL,
    Date date NOT NULL,
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

CREATE TABLE Seller
(
	SellerID varchar(6) PRIMARY KEY,
    SellerMail varchar(30) UNIQUE KEY,
    SellerAddress varchar(40),
    SellerName varchar(25) NOT NULL,
    ContactNo varchar(10) NOT NULL UNIQUE KEY
);

CREATE TABLE Accessories
(
	DeviceID varchar(15) PRIMARY KEY,
    SellerID varchar(6) NOT NULL,
    CompanyName varchar(25) NOT NULL,
    ProductName varchar(25) NOT NULL,
    WarrantyPeriod int NOT NULL,
    InvoiceNo varchar(7) NOT NULL,
    PurchaseDate date NOT NULL,
    PurchaseAmount int NOT NULL,
    FOREIGN KEY (SellerID) REFERENCES Seller(SellerID) 
);
CREATE TABLE WorkType
(
	WorkID varchar(5) PRIMARY KEY,
    TypeOfWork varchar(15)
);

CREATE TABLE DegreeList
(
	StaffID varchar(6) NOT NULL,
    Degree varchar(25) NOT NULL,
    PRIMARY KEY(StaffID,Degree)
);

CREATE TABLE Peon
(
	PeonID varchar(6) PRIMARY KEY,
    WorkID varchar(5),
    FOREIGN KEY (WorkID) REFERENCES WorkType(WorkID)
);


CREATE TABLE SuportStaff
(
	SuportStaffID varchar(6) PRIMARY KEY,
    Designation varchar(25) NOT NULL,
    WorkID varchar(5),
    FOREIGN KEY (SuportStaffID) REFERENCES Staff(StaffID),
    FOREIGN KEY (WorkID) REFERENCES WorkType(WorkID)
);










	CREATE TABLE Registered
	(
		StudentID varchar(6) NOT NULL,
		CourseID varchar(6) NOT NULL,
		Semester int NOT NULL,
		AcadYear int NOT NULL,
		Grade varchar(3) NOT NULL,
		PRIMARY KEY(CourseID,Semester,AcadYear,StudentID),
		FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
		FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
		FOREIGN KEY (CourseId,Semester,AcadYear) REFERENCES Offers(CourseID,Semester,AcadYear)
	);



CREATE TABLE Result
(
	StudentID varchar(6) NOT NULL,
    AcadYear int NOT NULL,
    Semester int NOT NULL,
    GPA numeric(10,2) NOT NULL,
    CGPA numeric(10,2) NOT NULL,
    PRIMARY KEY(StudentID,Semester,AcadYear),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);