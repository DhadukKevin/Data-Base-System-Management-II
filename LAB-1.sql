--CREATE DATABASE STUDENT_INFO

CREATE TABLE STUDENT(
	STUID  INT,
	NAME VARCHAR(50),
	ENROLLMENTNO VARCHAR(12),
	DIVISION VARCHAR(50),
	SEM INT,
	BIRTHDATE DATETIME,
	EMAIL VARCHAR(100),
	CONTACTNO VARCHAR(50),
)

INSERT INTO STUDENT VALUES
--(101,'NAIMISH PATEL','090200107051','BCX-3',3,'1992-12-06','NAIMISHP49@GMAIL.COM',8866205253),
--(102,'FIROZ A S.','090200107090','BCY-3',3,'1994-05-03','FIROZ.ME@GMAIL.COM',8885999922),
--(103,'KRUNAL VYAS','090243107101','BCZ-5',5,'1984-03-01','KRUNAL.VYAS@GMAIL.COM',9990888877),
--(104,'VIJAY PATEL','090200107102','BCX-5',5,'1985-02-15','VIJAY.PATEL123@GMAIL.COM',8787878787)
--(105,'VIMAL TRIVEDI','090200107103','BCY-3',3,'1988-01-20','MAULIK123@GMAIL.COM',8789564512)

SELECT * FROM STUDENT


--1. Display Name of Student who belongs to either Semester 3 or 5. (Use IN & OR)
SELECT NAME FROM STUDENT WHERE SEM  IN(3,5)
SELECT NAME FROM STUDENT WHERE SEM=3 OR SEM=5


--2. Find Student Name & Enrollment No in which Student Id between 103 to 105.
SELECT NAME,ENROLLMENTNO FROM STUDENT WHERE STUID>103 AND STUID<105


--3. Find Student Name & Enrollment No with their Email Who belongs to 5th Semester.
SELECT NAME,ENROLLMENTNO,EMAIL FROM STUDENT WHERE SEM=5


--4. Display All the Details of first three students.
SELECT TOP 3 * FROM STUDENT


--5. Display Name & Enrollment no of first 30% Students who�s contact number ends with 7.
SELECT TOP 30 PERCENT * FROM STUDENT WHERE CONTACTNO LIKE '&7'

--6. Display Unique Semesters.
SELECT DISTINCT(SEM) FROM STUDENT

--7. Retrieve All the Students who have no Enrollment.
SELECT * FROM STUDENT WHERE ENROLLMENTNO IS NULL

--8. Find All Students whose Name does not start with �V�.
SELECT * FROM STUDENT WHERE NAME NOT LIKE 'V%'

--9. Find All Students in which Email Contains �3@G� & Only Six Characters.
SELECT * FROM STUDENT WHERE EMAIL LIKE '%3@G%' AND EMAIL LIKE '______'

--10. Find Out All the Students whose First Name Starts with F And third character must be R.
SELECT * FROM STUDENT WHERE NAME LIKE 'F_R%'

--11. Find All the Student Details whose Contact No contains 877.
SELECT * FROM STUDENT WHERE CONTACTNO LIKE '%877%'

--12. Display Student Name in Which Student belongs to Semester 3 & Contact Number Does Not Contains 8 & 9.
SELECT * FROM STUDENT WHERE SEM=3 AND CONTACTNO NOT LIKE '%8%9%'

--13. Find Students who born after date 01-01-1990.
SELECT * FROM STUDENT WHERE BIRTHDATE>'1990-01-01'

--14. Update Division to BCX-5 & Semester 5 whose Student Id Is 102.
UPDATE STUDENT SET DIVISION='BCX-5', SEM=5 WHERE STUID=102
SELECT * FROM STUDENT

--15. Change the Student�s Name to Firoz Sherasiya in which Email is Firoz.Me@Gmail.Com & Contact No is 8885999922.
UPDATE STUDENT SET NAME='FIROZ SHERASIYA' WHERE EMAIL LIKE 'Firoz.Me@Gmail.Com' AND CONTACTNO LIKE '8885999922'
SELECT * FROM STUDENT

--16. Add one more Column City Varchar (50) in Student Table.
ALTER TABLE STUDENT ADD  CITY VARCHAR(50)

--17. Remove All BCX-3 Division Students.
DELETE FROM STUDENT WHERE DIVISION='BCX-3'
SELECT * FROM STUDENT

--18. Change Column Name Email to EmailAddress.
SP_RENAME 'STUDENT.EMAIL','EMAIL ADDRESS'
SELECT * FROM STUDENT

--19. Write an SQL query to clone a new table Student_New from Student table with all data.
SELECT * INTO STUDENT_NEW FROM STUDENT 
SELECT * FROM STUDENT_NEW

--20. Remove All the Data from Student Table Using Truncate.
TRUNCATE TABLE STUDENT
SELECT * FROM STUDENT