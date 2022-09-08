CREATE DATABASE EMPLOYEE_INFO2

CREATE TABLE EMPLOYEE(
	EID INT,
	ENAME VARCHAR(100),
	GENDER VARCHAR(10),
	JOININGDATE DATETIME,
	SALARY DECIMAL(8,2),
	CITY VARCHAR(100)
)

SELECT * FROM EMPLOYEE

--1. Display all the employees whose name starts with “m” and 4 th character is “h”.
SELECT * FROM EMPLOYEE WHERE ENAME LIKE 'M__H%'

--2. Find the value of 3 raised to 5. Label the column as output.
SELECT POWER(3,5) AS OUTPUT 

--3. Write a query to subtract 20 days from the current date.
SELECT GETDATE()-20

--4. Write a query to display name of employees whose name starts with “j” and contains “n” in their name.
SELECT * FROM EMPLOYEE WHERE ENAME LIKE 'J%N%'

--5. Display 2nd to 9th character of the given string “SQL Programming”.
SELECT SUBSTRING('SQL PROGRAMMING',2,7)

--6. Display name of the employees whose city name ends with “ney” &contains six characters.
SELECT * FROM EMPLOYEE WHERE CITY LIKE '___NEY'

--7. Write a query to convert value 15 to string.
SELECT CAST(15 AS VARCHAR)

--8. Add department column with varchar (20) to Employee table.
ALTER TABLE EMPLOYEE ADD DEPARTMENT VARCHAR(20)

--9. Set the value of department to Marketing who belongs to London city.
UPDATE EMPLOYEE SET DEPARTMENT='MARKETING' WHERE CITY='LONDON'
SELECT * FROM EMPLOYEE

--10. Display all the employees whose name ends with either “n” or “y”.
SELECT * FROM EMPLOYEE WHERE ENAME LIKE '&N' OR ENAME LIKE '%Y'
 
--11. Find smallest integer value that is greater than or equal to 63.1, 63.8 and -63.2.
SELECT CEILING(63.1),CEILING(63.8),CEILING(-63.2)

--12. Display all employees whose joining date is not available.
SELECT * FROM EMPLOYEE WHERE JOININGDATE IS NULL

--13. Display name of the employees in capital letters and city in small letters.
SELECT UPPER(ENAME),LOWER(CITY) FROM EMPLOYEE

--14. Change the data type of Ename from varchar (30) to char (30).
ALTER TABLE EMPLOYEE ALTER COLUMN ENAME CHAR(30)

--15. Display city wise maximum salary.
SELECT CITY,MAX(SALARY) FROM EMPLOYEE GROUP BY CITY

--16. Produce output like <Ename> works at <city> and earns <salary> (In single column).
SELECT ENAME+' WORKS AT '+CITY+' AND EARNS '+CAST(SALARY AS VARCHAR) FROM EMPLOYEE

--17. Find total number of employees whose salary is more than 5000.
SELECT COUNT(EID) FROM EMPLOYEE WHERE SALARY>5000

--18. Write a query to display first 4 & last 3 characters of all the employees.
SELECT LEFT(ENAME,4) AS [FIRST 4 CHAR],RIGHT(RTRIM(ENAME),3) AS [LAST 4 CHAR] FROM EMPLOYEE

--19. List the city having total salaries more than 15000 and employees joined after 1st January, 2014.
SELECT CITY FROM EMPLOYEE WHERE JOININGDATE>'2014-01-01' GROUP BY CITY HAVING SUM(SALARY)>15000

--20. Write a query to replace “u” with “oo” in Ename.
SELECT REPLACE(ENAME,'U','OO') FROM EMPLOYEE

--21. Display city with average salaries and total number of employees belongs to each city.
SELECT CITY,AVG(SALARY) AS AVG_SALARY,COUNT(EID) AS COUNT_OF_EMP FROM EMPLOYEE GROUP BY CITY

--22. Display total salaries paid to female employees.
SELECT SUM(SALARY) AS TOTAL_SALARY FROM EMPLOYEE WHERE GENDER='FEMALE'

--23. Display name of the employees and their experience in years.
SELECT ENAME,DATEDIFF(YEAR,JOININGDATE,GETDATE()) FROM EMPLOYEE

--24. Remove column department from employee table.
ALTER TABLE EMPLOYEE DROP COLUMN DEPARTMENT

--25. Update the value of city from syndey to null.
UPDATE EMPLOYEE SET CITY=NULL WHERE CITY='SYDNEY'
SELECT * FROM EMPLOYEE