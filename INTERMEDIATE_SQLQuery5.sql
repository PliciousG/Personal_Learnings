/*
Inner Joins, Full/Left/Right Outer Joins
*/

-- INNER JOIN
SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics
Inner Join SQLTutorial.dbo.EmployeeSalary
		ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;

SELECT EmployeeDemographics.EmployeeID,
		FirstName,
		LastName,
		JobTitle,
		Salary
FROM SQLTutorial.dbo.EmployeeDemographics
Inner Join SQLTutorial.dbo.EmployeeSalary
		ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;

-- Employee with the highest salary other than Michael Scott 
SELECT EmployeeDemographics.EmployeeID,
		FirstName,
		LastName,
		Salary
FROM SQLTutorial.dbo.EmployeeDemographics
Inner Join SQLTutorial.dbo.EmployeeSalary
		ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE FirstName <> 'Michael'
ORDER BY Salary DESC;

-- FULL OUTER JOIN
SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics
Full Outer Join SQLTutorial.dbo.EmployeeSalary
		ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;

-- LEFT OUTER JOIN
SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics
Left Outer Join SQLTutorial.dbo.EmployeeSalary
		ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;


SELECT EmployeeDemographics.EmployeeID,
		FirstName,
		LastName,
		JobTitle,
		Salary
FROM SQLTutorial.dbo.EmployeeDemographics
Left Outer Join SQLTutorial.dbo.EmployeeSalary
		ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;

-- Variant 2:EmployeeSalary.EmployeeID
SELECT EmployeeSalary.EmployeeID,
		FirstName,
		LastName,
		JobTitle,
		Salary
FROM SQLTutorial.dbo.EmployeeDemographics
Left Outer Join SQLTutorial.dbo.EmployeeSalary
		ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;

-- RIGHT OUTER JOIN
SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics
Right Outer Join SQLTutorial.dbo.EmployeeSalary
		ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;

-- RIGHT OUTER JOIN
SELECT EmployeeDemographics.EmployeeID,
		FirstName,
		LastName,
		JobTitle,
		Salary
FROM SQLTutorial.dbo.EmployeeDemographics
Right Outer Join SQLTutorial.dbo.EmployeeSalary
		ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;

-- Variant 2: EmployeeSalary.EmployeeID
SELECT EmployeeSalary.EmployeeID,
		FirstName,
		LastName,
		JobTitle,
		Salary
FROM SQLTutorial.dbo.EmployeeDemographics
Right Outer Join SQLTutorial.dbo.EmployeeSalary
		ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;

-- FULL OUTER JOIN
SELECT EmployeeSalary.EmployeeID,
		FirstName,
		JobTitle,
		Salary
FROM SQLTutorial.dbo.EmployeeDemographics
FULL Outer Join SQLTutorial.dbo.EmployeeSalary
		ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;

/*
Union, Union All
*/

Create Table WareHouseEmployeeDemographics 
(EmployeeID int, 
FirstName varchar(50), 
LastName varchar(50), 
Age int, 
Gender varchar(50)
)

Insert into WareHouseEmployeeDemographics VALUES
(1013, 'Darryl', 'Philbin', NULL, 'Male'),
(1050, 'Roy', 'Anderson', 31, 'Male'),
(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
(1052, 'Val', 'Johnson', 31, 'Female')


-- UNION
-- Variant 1 (Two tables with similar columns)
SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics
	UNION
SELECT *
FROM SQLTutorial.dbo.WareHouseEmployeeDemographics;

-- Variant 2 (Two tables with dissimilar columns)
SELECT EmployeeID,
		FirstName,
		Age
FROM SQLTutorial.dbo.EmployeeDemographics
	UNION
SELECT EmployeeID,
		JobTitle,
		Salary
FROM SQLTutorial.dbo.EmployeeSalary
ORDER BY EmployeeID;


-- UNION ALL
SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics
	UNION ALL
SELECT *
FROM SQLTutorial.dbo.WareHouseEmployeeDemographics
ORDER BY EmployeeID;


/*
Aggregate Function
*/
-- AGGREGATE FUNCTION (AVERAGE)
SELECT EmployeeSalary.JobTitle,
		AVG(EmployeeSalary.Salary) AS AverageSalesmanSalary
FROM SQLTutorial.dbo.EmployeeDemographics
Inner Join SQLTutorial.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE EmployeeSalary.JobTitle = 'Salesman'
GROUP BY JobTitle;

/*
Case Statement
*/

SELECT FirstName,
		LastName,
		Age,
	CASE
		WHEN Age > 30 Then 'Old'
		WHEN Age BETWEEN 27 AND 30 THEN 'Young'
		ELSE 'Baby'
	END AS AgeCategory
FROM SQLTutorial.dbo.EmployeeDemographics
WHERE Age is NOT NULL
ORDER BY Age


SELECT 
	FirstName,
	LastName,
	JobTitle,
	Salary,
	CASE
		WHEN JobTitle = 'Salesman' THEN Salary + (Salary * .10)
		WHEN JobTitle = 'Accountant' THEN Salary + (Salary * .05)
		WHEN JobTitle ='HR' THEN Salary + (Salary * .000001)
		ELSE Salary + (Salary * .03)
		END AS SalaryAfterRaise
FROM SQLTutorial.dbo.EmployeeDemographics
JOIN SQLTutorial.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

/*
Having Clause
*/

SELECT 
	JobTitle,
	COUNT(JobTitle) AS JobTitleCount
FROM SQLTutorial.dbo.EmployeeDemographics
JOIN SQLTutorial.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING COUNT(JobTitle) > 1

SELECT 
	JobTitle,
	AVG(Salary) AS AverageSalary
FROM SQLTutorial.dbo.EmployeeDemographics
JOIN SQLTutorial.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING AVG(Salary) > 45000
ORDER BY AVG(Salary)

/*
Updating/Deleting Data
*/

SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics

UPDATE SQLTutorial.dbo.EmployeeDemographics
SET EmployeeID = 1012
WHERE FirstName = 'Holly' AND LastName = 'Flax'

UPDATE SQLTutorial.dbo.EmployeeDemographics
SET Age = 31, Gender = 'Female'
WHERE FirstName = 'Holly' AND LastName = 'Flax'

DELETE FROM SQLTutorial.dbo.EmployeeDemographics
WHERE EmployeeID = 1012