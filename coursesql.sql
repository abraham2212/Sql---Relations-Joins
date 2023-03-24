CREATE DATABASE Course
USE Course

CREATE TABLE Students(
	Id INT PRIMARY KEY IDENTITY(1,1),
	FullName NVARCHAR(100) NOT NULL,
	Birthday DATE,
	Address NVARCHAR(100)
)

CREATE TABLE Countries(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Name NVARCHAR(255),
)

CREATE TABLE Cities(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Name NVARCHAR(255),
	CountryId INT FOREIGN KEY REFERENCES Countries(Id)
)

ALTER TABLE Students ADD CityId INT FOREIGN KEY REFERENCES Cities(Id);

CREATE TABLE Teachers(
	Id INT PRIMARY KEY IDENTITY(1,1),
	FullName NVARCHAR(100),
	Email NVARCHAR(100) UNIQUE,
	Address NVARCHAR(100),
	Salary DECIMAL,
	CityId INT FOREIGN KEY REFERENCES Cities(Id)
)

CREATE TABLE Rooms(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Name NVARCHAR(50) UNIQUE,
	Capacity INT
)

CREATE TABLE Educations(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Name NVARCHAR(50) UNIQUE,
	Duration INT
)

CREATE TABLE Groups(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Name NVARCHAR(50) UNIQUE,
	RoomId INT FOREIGN KEY REFERENCES Rooms(Id),
	EducationId INT FOREIGN KEY REFERENCES Educations(Id),
)

CREATE TABLE GroupStudents(
	Id INT PRIMARY KEY IDENTITY(1,1),
	GroupId INT FOREIGN KEY REFERENCES Groups(Id),
	StudentId INT FOREIGN KEY REFERENCES Students(Id),
)

CREATE TABLE WeekDays(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Name NVARCHAR(50) UNIQUE,
)
CREATE TABLE Seanses(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Name NVARCHAR(50) UNIQUE,
)

CREATE TABLE WeekDaySeans(
	Id INT PRIMARY KEY IDENTITY(1,1),
	WeekDayId INT FOREIGN KEY REFERENCES WeekDays(Id),
	SeansId INT FOREIGN KEY REFERENCES Seanses(Id),
)

ALTER TABLE Groups ADD WeekDaySeansId INT FOREIGN KEY REFERENCES WeekDaySeans(Id);

CREATE TABLE GroupTeachers(
	Id INT PRIMARY KEY IDENTITY(1,1),
	GroupId INT FOREIGN KEY REFERENCES Groups(Id),
	TeacherId INT FOREIGN KEY REFERENCES Teachers(Id),
)

CREATE TABLE StaffMembers(
	Id INT PRIMARY KEY IDENTITY(1,1),
	FullName NVARCHAR(100),
	Salary DECIMAL,
	CityId INT FOREIGN KEY REFERENCES Cities(Id)
)

CREATE TABLE Roles(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Name NVARCHAR(100),
)

CREATE TABLE RolesMembers(
	Id INT PRIMARY KEY IDENTITY(1,1),
	RoleId INT FOREIGN KEY REFERENCES Roles(Id),
	MemberId INT FOREIGN KEY REFERENCES StaffMembers(Id),
)