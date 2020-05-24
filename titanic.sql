 DROP DATABASE IF EXISTS titanic;
 CREATE DATABASE titanic;
 USE DATABASE titanic;
 CREATE TABLE passenger(PNumber int NOT NULL PRIMARY KEY,
                      PGender varchar(6) NOT NULL,
                      PAge int NOT NULL);
					  

					   
 CREATE TABLE Survival(PNumber int NOT NULL PRIMARY KEY,
                     Survived char(1) NOT NULL,
					  FOREIGN KEY(PNumber) REFERENCES passenger(PNumber));
	
 CREATE TABLE Companions(PNumber int NOT NULL PRIMARY KEY,
                        PSib char(1) NOT NULL,
	    				PPOC char(1) NOT NULL,
						FOREIGN KEY(PNumber) REFERENCES passenger(PNumber));
						
 CREATE TABLE PassengerName(PNumber int NOT NULL PRIMARY KEY,
                        PName varchar(255) NOT NULL,
						FOREIGN KEY(PNumber) REFERENCES passenger(PNumber));
						
 CREATE TABLE Ticketing(PNumber int NOT NULL PRIMARY KEY,
                       PClass char(1) NOT NULL,
					   TicketNumber varchar(15) NOT NULL,
					   FarePrice DECIMAL(6,2) NOT NULL,
					   Cabin varchar(15) NOT NULL,
					   Embarked char(1) NOT NULL,
					   FOREIGN KEY (PNumber) REFERENCES passenger(PNumber));
					   
					 
SELECT COUNT(PNumber) FROM passenger
WHERE PGender = 'female';

SELECT COUNT(PNumber) FROM passenger
WHERE PGender = 'male';

SELECT COUNT(PNumber) FROM passenger
WHERE PAge > 30;

SELECT COUNT(PNumber) FROM passenger
WHERE PAge < 30;

-- 561 + 305 = 866 beacause 25 = peopl who are exactly 30 year old


					 
SELECT COUNT(S.PNumber)
FROM passenger P, Survival S 
WHERE P.PNumber = S.PNumber
AND P.PGender = 'female'
AND S.survived = '1';

SELECT COUNT(S.PNumber)
FROM passenger P, Survival S 
WHERE P.PNumber = S.PNumber
AND P.PGender = 'male'
AND S.survived = '1';

SELECT COUNT(S.PNumber)
FROM passenger P, Survival S 
WHERE P.PNumber = S.PNumber
AND P.PGender = 'female'
AND S.survived = '1'
AND P.PAge > 30;


SELECT COUNT(T.PNumber)
FROM Survival S, Ticketing T
WHERE S.PNumber = T.PNumber
AND S.Survived = '1'
AND T.PClass = '1';
					
SELECT COUNT(T.PNumber)
FROM Survival S, Ticketing T, passenger P
WHERE S.PNumber = T.PNumber AND T.PNumber = P.PNumber
AND S.Survived = '1'
AND T.PClass = '1'
AND P.PGender = 'female';					
						
SELECT COUNT(T.PNumber)
FROM Survival S, Ticketing T, passenger P
WHERE S.PNumber = T.PNumber AND T.PNumber = P.PNumber
AND S.Survived = '1'
AND T.PClass = '1'
AND P.PGender = 'male';

                        


