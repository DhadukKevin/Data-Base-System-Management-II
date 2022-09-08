SELECT * FROM PERSON
SELECT * FROM DESIGNATION
SELECT * FROM DEPARTMENT


--1


--PR_PERSON_INSERT 108,'KEVIN','DAHDUK',90000,'2006-01-06',3,14
CREATE PROCEDURE PR_PERSON_INSERT
@WORKERID		INT,
@FIRSTNAMAE		VARCHAR(100),
@LASTNAME		VARCHAR(100),
@SALRY			DECIMAL(8,2),
@JOININGDATE	DATETIME,
@DEPARTMENTID	INT,
@DESIGNATIONID	INT

AS
BEGIN

INSERT INTO PERSON VALUES(@WORKERID, @FIRSTNAMAE,@LASTNAME, @SALRY, @JOININGDATE,@DEPARTMENTID, @DESIGNATIONID)
						 					  	
END	


--PR_PERSON_UPDATE 108,80000
CREATE PROCEDURE PR_PERSON_UPDATE
@WORKERID	INT,
@SALARY		DECIMAL(8,2)
AS
BEGIN
	UPDATE PERSON SET SALARY=@SALARY WHERE WORKERID=@WORKERID
END		


--PR_PERSON_DELETE 108
CREATE PROCEDURE PR_PERSON_DELETE	
@WORKERID	INT

AS
BEGIN

DELETE FROM PERSON WHERE WORKERID=@WORKERID
END		



--PR_DEPARTMENT_INSERT 5,ACC
CREATE PROCEDURE PR_DEPARTMENT_INSERT
@DEPARTMENTID	INT,
@DEPARTMENTNAME	VARCHAR(100)

AS
BEGIN
	INSERT INTO DEPARTMENT VALUES(@DEPARTMENTID,@DEPARTMENTNAME)
END


--PR_DEPARTMENT_UPDATE 5,PROJECT
CREATE PROCEDURE PR_DEPARTMENT_UPDATE
	@DEPARTMENTID	INT,
	@DEPARTMENTNAME	VARCHAR(100)
AS
BEGIN
	UPDATE DEPARTMENT SET DEPARTMENTNAME=@DEPARTMENTNAME WHERE DEPARTMENTID=@DEPARTMENTID 
END		


--PR_DEPARTMENT_DELETE 5
CREATE PROCEDURE PR_DEPARTMENT_DELETE	
	@DEPARTMENTID	INT
AS
BEGIN
	DELETE FROM DEPARTMENT WHERE DEPARTMENTID=@DEPARTMENTID
END		


--PR_DEPARTMENT_INSERT 5,ACC
CREATE PROCEDURE PR_DEPARTMENT_INSERT
@DEPARTMENTID	INT,
@DEPARTMENTNAME	VARCHAR(100)

AS
BEGIN
	INSERT INTO DEPARTMENT VALUES(@DEPARTMENTID,@DEPARTMENTNAME)
END


--PR_DESIGNATION_INSERT 16,COO
CREATE PROCEDURE PR_DESIGNATION_INSERT
	@DESIGNATIONID		INT,
	@DESIGNATIONNAME	VARCHAR(100)
AS
BEGIN
	INSERT INTO DESIGNATION VALUES(@DESIGNATIONID,@DESIGNATIONNAME)
END



--PR_DESIGNATION_UPDATE 16,MEHTAJI
CREATE PROCEDURE PR_DESIGNATION_UPDATE
	@DESIGNATIONID		INT,
	@DESIGNATIONNAME	VARCHAR(100)
AS
BEGIN
	UPDATE DESIGNATION SET DESIGNATIONNAME=@DESIGNATIONNAME WHERE DESIGNATIONID=@DESIGNATIONID 
END	


--PR_DESIGNATION_DELETE 16
CREATE PROCEDURE PR_DESIGNATION_DELETE	
	@DESIGNATIONID	INT
AS
BEGIN
	DELETE FROM DESIGNATION WHERE DESIGNATIONID=@DESIGNATIONID
END



--===============================================================================================================

--2

--PR_PERSON_SELECTALL
CREATE PROCEDURE PR_PERSON_SELECTALL

AS
BEGIN
	SELECT P.WORKERID, P.FIRSTNAME,P.LASTNAME, P.SALARY, P.JOININGDATE,  P.DEPARTMENTID, D.DEPARTMENTNAME, P.DESIGNATIONID ,DD.DESIGNATIONNAME
	FROM PERSON P INNER JOIN DEPARTMENT D 
	ON P.DEPARTMENTID=D.DEPARTMENTID
	INNER JOIN DESIGNATION DD
	ON P.DESIGNATIONID=DD.DESIGNATIONID
END	


--PR_DEPARTMENT_SELECTALL
CREATE PROCEDURE PR_DEPARTMENT_SELECTALL

AS
BEGIN
	SELECT * FROM DEPARTMENT
END


--PR_DESIGNATION_SELECTALL
CREATE PROCEDURE PR_DESIGNATION_SELECTALL

AS
BEGIN
	SELECT * FROM DESIGNATION
END



--===============================================================================================================

--3

--PR_PERSON_SELECT_BY_PK 104
CREATE PROCEDURE PR_PERSON_SELECT_BY_PK
	@WORKERID	INT
AS
BEGIN
	SELECT * FROM PERSON WHERE WORKERID=@WORKERID
END


--PR_DEPARTMENT_SELECT_BY_PK 2
CREATE PROCEDURE PR_DEPARTMENT_SELECT_BY_PK
	@DEPARTMENTID	INT
AS
BEGIN
	SELECT * FROM DEPARTMENT WHERE DEPARTMENTID=DEPARTMENTID
END


--PR_DESIGNATION_SELECT_BY_PK 12
ALTER PROCEDURE PR_DESIGNATION_SELECT_BY_PK
	@DESIGNATIONID	INT
AS
BEGIN
	SELECT * FROM DESIGNATION WHERE DESIGNATIONID=@DESIGNATIONID
END



--===============================================================================================================

--4


--PR_DISPLAY_TABLE IT,JOBBER
ALTER PROCEDURE PR_DISPLAY_TABLE
	@DEPARTMENTNAME VARCHAR(100),
	@DESIGNATION	VARCHAR(100)
AS
BEGIN
	SELECT FIRSTNAME,SALARY,JOININGDATE,DEPARTMENT.DEPARTMENTNAME FROM PERSON INNER JOIN DEPARTMENT 
	ON PERSON.DEPARTMENTID=DEPARTMENT.DEPARTMENTID
	WHERE DEPARTMENT.DEPARTMENTNAME=@DEPARTMENTNAME
	
END



--===============================================================================================================

--5

--PR_SELECT_BY_FIRSTNAME BHOOMI
CREATE PROCEDURE PR_SELECT_BY_FIRSTNAME
	@FIRSTNAME	VARCHAR(100)
AS
BEGIN
	SELECT FIRSTNAME,LASTNAME,SALARY,JOININGDATE,DEPARTMENTNAME,DESIGNATIONNAME
	FROM PERSON P INNER JOIN DEPARTMENT D 
	ON P.DEPARTMENTID=D.DEPARTMENTID
	INNER JOIN DESIGNATION DD
	ON P.DESIGNATIONID=DD.DESIGNATIONID

	WHERE FIRSTNAME=@FIRSTNAME

END



--===============================================================================================================

--6

--PR_SELECT
CREATE PROCEDURE PR_SELECT

AS
BEGIN
	SELECT D.DEPARTMENTNAME, MIN(SALARY),MAX(SALARY),SUM(SALARY) FROM PERSON P INNER JOIN DEPARTMENT D ON P.DEPARTMENTID=D.DEPARTMENTID GROUP BY D.DEPARTMENTNAME
END