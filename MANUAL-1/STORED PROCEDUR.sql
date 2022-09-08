CREATE TABLE MSDT_STATE(
	STATE_TD	INT,
	STATENAME	VARCHAR(50) NOT NULL
)

CREATE TABLE MST_CITY(
	CityID		Int ,
	City_name	Varchar(250) Not Null,
	Pincode		Varchar(6) Null,
	StateID		Int Not Null, 
	CityRemarks Varchar(500) Null
)

SELECT * FROM MST_CITY INNER JOIN MSDT_STATE ON STATE_TD=StateID\

--1. Select All
--PR_MST_CITY_SELECTALL 1
CREATE PROCEDURE PR_MST_CITY_SELECTALL
@CITYID INT

AS
BEGIN
SELECT CityID, City_name, Pincode, CityRemarks, StateID, StateName
FROM MST_CITY INNER JOIN MSDT_STATE
ON STATE_TD=StateID
WHERE CityID=@CITYID

END
																  
																  
--2. Insert	
--PR_MST_CITY_INSERT 7,'AHMEDABAD','300002','VERYGOOD',1	
CREATE PROCEDURE PR_MST_CITY_INSERT	
@CityID		INT,
@City_name	VARCHAR(250), 
@Pincode	VARCHAR(6), 
@CityRemarks VARCHAR(500), 
@StateID	INT
AS
BEGIN
INSERT INTO MST_CITY VALUES(@CityID,@City_name,	@Pincode,@StateID,@CityRemarks )	

END	

						  
--3. Update														  
--PR_MST_CITY_UPDATE 7,'PATAN','300001','VERYGOOD',1
CREATE PROCEDURE PR_MST_CITY_UPDATE
@CityID		INT,
@City_name	VARCHAR(250), 
@Pincode	VARCHAR(6), 
@CityRemarks VARCHAR(500), 
@StateID	INT
AS
BEGIN
UPDATE MST_CITY SET City_name=@City_name,Pincode=@Pincode,CityRemarks=@CityRemarks,StateID=@StateID
WHERE CityID=@CityID

END


--4. Delete
--PR_MST_CITY_DELETE 7
CREATE PROCEDURE PR_MST_CITY_DELETE
@CITYID	INT

AS
BEGIN

DELETE FROM MST_CITY WHERE CITYID=@CITYID
END


--5. SelectByPK
--PR_MST_CITY_SELECTBYPK 1
CREATE PROCEDURE PR_MST_CITY_SELECTBYPK
@CITYID	INT

AS
BEGIN

SELECT * FROM MST_CITY WHERE CityID=@CITYID

END


--6. SelectByPincodeStartWith360
--PR_MST_CITY_SELECTBYPINCODE
CREATE PROCEDURE PR_MST_CITY_SELECTBYPINCODE

AS
BEGIN

SELECT * FROM MST_CITY WHERE PINCODE LIKE '360%'

END


--7. SelectByCityNamePincode
--PR_MST_CITY_SELECT_BY_CITYNAME_PINCODE 'KANPUR','320002'
CREATE PROCEDURE PR_MST_CITY_SELECT_BY_CITYNAME_PINCODE
@CITYNAME	VARCHAR(250),
@PINCODE	VARCHAR(6)

AS
BEGIN

SELECT * FROM MST_CITY WHERE CITY_NAME=@CITYNAME AND PINCODE=@PINCODE

END


--8. SelectByCityRemarks
--PR_MST_CITY_SELECT_BY_CITY_REMARK 'GOOD'
CREATE PROCEDURE PR_MST_CITY_SELECT_BY_CITY_REMARK
@CITYREMARK		varchar(500)

AS
BEGIN

SELECT * FROM MST_CITY WHERE CityRemarks=@CITYREMARK

END


--9. SelectByStateID
--PR_MST_CITY_SELECT_STATEID 3
CREATE PROCEDURE PR_MST_CITY_SELECT_STATEID
@STATEID	INT

AS
BEGIN

SELECT * FROM MST_CITY WHERE STATEID=@STATEID
END


--10. SelectByStateIDCityID
--PR_MST_CITY_StateID_CityID '3','3'
CREATE PROCEDURE PR_MST_CITY_StateID_CityID
@STATEID	INT,
@CITYID		INT

AS
BEGIN

SELECT * FROM MST_CITY WHERE STATEID=@STATEID AND CITYID=@CITYID

END