CREATE DATABASE Company

USE Company

CREATE TABLE [Countries] (
    Id INT PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(50) NOT NULL
)

CREATE TABLE [Cities] (
    Id INT PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(50) NOT NULL,
    CountryId INT FOREIGN KEY REFERENCES Countries(Id)
)

CREATE TABLE [Employees] (
    Id INT PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(40) NOT NULL,
    Surname NVARCHAR(40) NOT NULL,
    Age INT NOT NULL,
    Salary DECIMAL,
    Position NVARCHAR(60),
    IsDeleted BIT,
    CityId INT FOREIGN KEY REFERENCES Cities(Id)
)

INSERT INTO [Countries] VALUES
('Russia'),
('Italy'),
('Brazil'),
('UK')

INSERT INTO [Cities] VALUES
('Moscow', 1),
('Roma', 2),
('Rio', 3),
('Liverpool', 4)

INSERT INTO [Employees] VALUES
('Alex', 'Iobey', '25', 2000, 'FrontEnd Developer', 0, 1),
('Rebeca', 'Halsey', '39', 5000, 'SQL Developer', 0, 1),
('Danilel', 'Fellaini', '23', 2700, 'BackEnd Developer', 0, 1),
('Marco', 'Veratti', '27', 2400, 'Social marketing', 0, 4),
('Billy', 'Adams', '20', 2000, 'FullStack  Developer', 0, 3),
('Alex', 'Hunter', '21', 1500, 'Social marketing', 1, 2),
('Halsey', 'Quuen', '28', 1000, 'Reception', 1, 4)





SELECT e.Id AS EmployeeId, e.Name AS EmployeeName, e.Surname, e.Age, e.Salary, e.Position, e.IsDeleted, ct.Id AS CityId, ct.Name AS CityName, cr.Id AS CountryId, cr.Name AS CountryName FROM Employees e
JOIN Cities ct
ON ct.Id = e.CityId
JOIN Countries cr
ON cr.Id = ct.CountryId




SELECT e.Name AS EmployeeName, cr.Name AS CountryName FROM Employees e
JOIN Cities ct
ON ct.Id = e.CityId
JOIN Countries cr
ON cr.Id = ct.CountryId
WHERE e.Salary > 2000




SELECT ct.Name AS CityName, cr.Name AS CountryName FROM Cities ct
JOIN Countries cr
ON cr.Id = ct.CountryId



SELECT e.Name AS EmployeeName, e.Surname, e.Age, e.Salary, e.Position, e.IsDeleted, ct.Name AS CityName, cr.Name AS CountryName FROM Employees e
JOIN Cities ct
ON ct.Id = e.CityId
JOIN Countries cr
ON cr.Id = ct.CountryId
WHERE e.Position = 'Reception'





SELECT e.Name AS EmployeeName, e.Surname, ct.Name AS CityName, cr.Name AS CountryName FROM Employees e
JOIN Cities ct
ON ct.Id = e.CityId
JOIN Countries cr
ON cr.Id = ct.CountryId
WHERE e.IsDeleted = 1