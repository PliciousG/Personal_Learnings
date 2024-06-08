/*
Select Statement
*, Top, Distinct, Count, As, Max, Min, Avg
*/

-- Return First Name and Last Name of all employees
SELECT FirstName,
		LastName
FROM EmployeeDemographics

-- Return all columns in EmployeeDemographic table
SELECT *
FROM EmployeeDemographics

-- Return Top 5 columns in EmployeeDemographic table
SELECT TOP 5 *
FROM EmployeeDemographics

-- Return all unique EmployeeID in EmployeeDemographic table
SELECT DISTINCT (EmployeeID)
FROM EmployeeDemographics

-- Return all unique Gender in EmployeeDemographic table
SELECT DISTINCT Gender
FROM EmployeeDemographics

-- Count of LastName
SELECT COUNT(LastName) AS LastNameCount
From EmployeeDemographics

-- Maximum salary in EmployeeSalary table
SELECT MAX(Salary)
From EmployeeSalary

-- Minimum salary in EmployeeSalary table
SELECT MIN(Salary)
From EmployeeSalary

-- Average salary in EmployeeSalary table
SELECT AVG(Salary)
From EmployeeSalary

-- WHERE Statement
-- Variant 1
SELECT *
FROM EmployeeDemographics
WHERE FirstName = 'Jim'

-- Variant 2 (NOT EQUAL TO <>)
SELECT *
FROM EmployeeDemographics
WHERE FirstName <> 'Jim'

-- Variant 3 (REATER THAN)
SELECT *
FROM EmployeeDemographics
WHERE Age > 30

-- Variant 4 (GREATER THAN OR EQUAL TO)
SELECT *
FROM EmployeeDemographics
WHERE Age >= 30

-- Variant 5 (LESS THAN)
SELECT *
FROM EmployeeDemographics
WHERE Age < 32

-- Variant 6 (LESS THAN OR EQUAL TO)
SELECT *
FROM EmployeeDemographics
WHERE Age <= 32

-- Variant 7 (AND)
SELECT *
FROM EmployeeDemographics
WHERE Age <= 32 AND Gender = 'Male'

-- Variant 8 (OR)
SELECT *
FROM EmployeeDemographics
WHERE Age <= 32 OR Gender = 'Male'

-- Variant 9 (LIKE/WILDCARD %)
SELECT *
FROM EmployeeDemographics
WHERE LastName LIKE 'S%'

-- Variant 10 (LIKE/WILDCARD %)
SELECT *
FROM EmployeeDemographics
WHERE LastName LIKE '%S%'

-- Variant 11 (LIKE/WILDCARD %)
SELECT *
FROM EmployeeDemographics
WHERE LastName LIKE 'S%o%'

-- Variant 12 (NULL)
SELECT *
FROM EmployeeDemographics
WHERE FirstName IS NULL

-- Variant 13 (NOT NULL)
SELECT *
FROM EmployeeDemographics
WHERE FirstName IS NOT NULL

-- Variant 14 (IN)
SELECT *
FROM EmployeeDemographics
WHERE FirstName IN ('Jim', 'Michael')

-- GROUP BY Statements
SELECT Gender, 
		Age, 
		COUNT(Gender) AS GenderCount
FROM EmployeeDemographics
WHERE Age > 31
GROUP BY Gender,
		Age

-- GROUP BY and ORDER BY Statements
SELECT Gender,  
		COUNT(Gender) AS GenderCount
FROM EmployeeDemographics
WHERE Age > 31
GROUP BY Gender
ORDER BY GenderCount DESC

SELECT *
FROM EmployeeDemographics
ORDER BY Age DESC, 
		Gender DESC

SELECT *
FROM EmployeeDemographics
ORDER BY 4 DESC, 
		5 DESC