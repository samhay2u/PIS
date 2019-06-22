 SELECT COUNT(*) FROM PATIENTS;

SELECT * FROM procedures where Cost BETWEEN 1000 AND 3000 ORDER BY Cost DESC;

SELECT * FROM procedures where ProcedureName LIKE '%Shoulder%';

-- Find all patients that had surgery on February 1st 2016
-- Type 1 INNER JOIN
SELECT * FROM PATIENTS AS PT, PATIENTHX AS PX
WHERE PT.MedRecNo = PX.MedRecNo
AND PX.DateOfService = '2016-02-01';

-- Type 2 INNER JOIN
SELECT * FROM 
PATIENTS AS PT INNER JOIN PATIENTHX AS PX
ON PT.MedRecNo = PX.MedRecNo
WHERE PX.DateOfService = '2016-02-01';

-- OUTER JOIN
SELECT * FROM 
PATIENTHX AS PX RIGHT OUTER JOIN PATIENTS AS PT
ON PT.MedRecNo = PX.MedRecNo
WHERE PX.MedRecNo IS NULL;

-- INSERT
INSERT INTO patients(MedRecNo, Name, DOB, Address, Insurance)
VALUES (300, 'John Doe', '1978-09-07', '2345 Broad st', 'Anthem');

-- All patient that has surgery
SELECT COUNT(DISTINCT PT.MedRecNo) FROM 
PATIENTS AS PT INNER JOIN PATIENTHX AS PX
ON PT.MedRecNo = PX.MedRecNo;

-- Patient Procedure count, total cost desending order
SELECT PT.MedRecNo, PT.Name, COUNT(*) AS TOTAL_NO_OF_SURGERY, SUM(CostOfVist) AS TOTAL_COST_OF_SURGERY FROM 
PATIENTS AS PT INNER JOIN PATIENTHX AS PX
ON PT.MedRecNo = PX.MedRecNo
GROUP BY PT.MedRecNo, PT.Name
ORDER BY 4 DESC;

-- Each patient has what type of surgery and in March of 2016
SELECT PT.MedRecNo, PT.Name, PS.ProcedureName, PS.Description, PX.DateOfService FROM 
PATIENTS AS PT 
INNER JOIN PATIENTHX AS PX -- The INNER JOIN keyword selects records that have matching values in both tables.
ON PT.MedRecNo = PX.MedRecNo
INNER JOIN procedures AS PS
ON PX.ProcedureID = PS.ProcedureID
WHERE EXTRACT(MONTH FROM PX.DateOfService) = 2
AND EXTRACT(YEAR FROM PX.DateOfService) = 2016
ORDER BY PT.Name;

-- Count the number of surgery by month for 2016


-- CREATE VIEW

-- remember 
-- SQL CREATE VIEW Statement
-- In SQL, a view is a virtual table based on the result-set of an SQL statement.
-- A view contains rows and columns, just like a real table. The fields in a view are fields from one 
-- or more real tables in the database.
-- You can add SQL functions, WHERE, and JOIN statements to a view and present the data as if 
-- the data were coming from one single table.
CREATE VIEW PATIENT_PROCEDURE_COUNT_COST_DESC
AS
SELECT PT.MedRecNo, PT.Name, COUNT(*) AS TOTAL_NO_OF_SURGERY, SUM(CostOfVist) AS TOTAL_COST_OF_SURGERY FROM 
PATIENTS AS PT INNER JOIN PATIENTHX AS PX
ON PT.MedRecNo = PX.MedRecNo
GROUP BY PT.MedRecNo, PT.Name
ORDER BY 4 DESC;

SELECT * from PATIENT_PROCEDURE_COUNT_COST_DESC;

-- Update procedure
UPDATE procedures SET Cost = 2000 WHERE ProcedureID = 11;
COMMIT;

-- Cost cannot be negative
ALTER TABLE `patienthx`
  ADD CONSTRAINT patienthx_chk1 CHECK (CostOfVist > 0);

ALTER TABLE `procedures`
  ADD CONSTRAINT procedures_chk1 CHECK (Cost > 0);
  
UPDATE users SET user_id ='Mcsammer' WHERE user_id ='mcSammer'; 
  
INSERT INTO 
procedures(ProcedureName, ProcedureID, Description, Cost, BillingCode)
VALUES ('test', '300', 'test', 0, 890);

DELETE FROM procedures WHERE ProcedureID = 300;


INSERT INTO `users`
(`user_id`,
`user_password`,
`first_name`,
`middle_name`,
`last_name`,
`user_email`)
VALUES
('Mcsammer',
'tset',
'Sam',
'Hutson',
'Hay',
'samhay2u@gmail.com');

COMMIT;

select *  from employees.user;

-- Develop a query that shows the top ten patient details that has spend most money on surjeries
SELECT P.MedRecNo, P.Name, P.DOB, P.Address, P.Insurance, SUM(H.CostOfVist) AS TOTAL_COST FROM patienthx AS H
INNER JOIN patients AS P
ON H.MedRecNo = P.MedRecNo
GROUP BY P.MedRecNo
ORDER BY TOTAL_COST DESC, P.Name
LIMIT 5



 
 
 