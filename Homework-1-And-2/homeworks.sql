-- Homework #1

CREATE TABLE IF NOT EXISTS Student (
  ID SERIAL PRIMARY KEY,
  FirstName VARCHAR(50) NOT NULL,
  LastName VARCHAR(50) NOT NULL,
  DateOfBirth DATE,
  EnrolledDate DATE,
  Gender VARCHAR(10),
  NationalIDNumber VARCHAR(20),
  StudentCardNumber VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS Course (
  ID SERIAL PRIMARY KEY,
  Name VARCHAR(50) NOT NULL,
  Credit INT,
  AcademicYear INT,
  Semester VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS Teacher (
  ID SERIAL PRIMARY KEY,
  FirstName VARCHAR(50) NOT NULL,
  LastName VARCHAR(50) NOT NULL,
  DateOfBirth DATE,
  AcademicRank VARCHAR(100),
  HireDate DATE
);

CREATE TABLE IF NOT EXISTS Grade (
  ID SERIAL PRIMARY KEY,
  StudentID INT REFERENCES Student(ID),
  CourseID INT REFERENCES Course(ID),
  TeacherID INT REFERENCES Teacher(ID),
  Grade SMALLINT,
  Comment TEXT,
  CreatedDate DATE
);

CREATE TABLE IF NOT EXISTS AchievementType (
  ID SERIAL PRIMARY KEY,
  Name VARCHAR(50) NOT NULL,
  Description TEXT,
  ParticipationRate INT
);

CREATE TABLE IF NOT EXISTS GradeDetails (
  ID SERIAL PRIMARY KEY,
  GradeID INT REFERENCES Grade(ID),
  AchievementTypeID INT REFERENCES AchievementType(ID),
  AchievementPoints INT,
  AchievementMaxPoints INT,
  AchievementDate DATE
);

-- Homework #2

-- Requirement 1

SELECT * FROM Employee WHERE FirstName = 'Antonio';

SELECT * FROM Employee WHERE DateOfBirth > '1979-01-01';

SELECT * FROM Employee WHERE Gender = 'M';

SELECT * FROM Employee WHERE LastName LIKE 'T%';

SELECT * FROM Employee WHERE HireDate BETWEEN '1988-01-01' AND '1988-01-31'


-- Requirement 2

SELECT * FROM Employee WHERE FirstName = 'Antonio' ORDER BY LastName;

SELECT * FROM Employee ORDER BY FirstName;

SELECT * FROM Employee WHERE Gender = 'M' ORDER BY HireDate DESC;

-- Requirement 3

SELECT Region FROM BusinessEntity
UNION ALL
SELECT RegionName FROM Customer;

SELECT Region FROM BusinessEntity
UNION
SELECT RegionName FROM Customer;

SELECT Region FROM BusinessEntity
INTERSECT
SELECT RegionName FROM Customer;

-- Requirement 4 & 5

CREATE TABLE IF NOT EXISTS Customer (
	CustomerID INT PRIMARY KEY
)

CREATE TABLE IF NOT EXISTS Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE CHECK (OrderDate >= '2010-01-01'),
	CustomerID INT,
	ProductID INT,
	FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Product (ProductID)
	-- "Order" thats why I named it "Orders" is reserved
);

CREATE TABLE IF NOT EXISTS Product (
    ProductID INT PRIMARY KEY,
    Cost DECIMAL(10, 2),
    Price DECIMAL(10, 2) CHECK (Price >= Cost * 1.2),
	Description VARCHAR(255) UNIQUE
);




