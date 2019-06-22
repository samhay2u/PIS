-- Create stored Procesdure for registering user
DROP PROCEDURE `register_user`;

-- Srat creating the stored procedure
DELIMITER $$
CREATE DEFINER=`PIS`@`localhost` PROCEDURE `register_user`(
                                  IN p_user_id       varchar(225), 
                                  IN p_user_password varchar(225), 								
                                  IN p_first_name    varchar(225),
                                  IN p_middle_name   varchar(225),
								  IN p_last_name     varchar(225),
                                  IN p_user_email	   varchar(225))
BEGIN
	-- Declare necessary variables
    DECLARE v_count INT DEFAULT 0;
    DECLARE v_message VARCHAR(255) DEFAULT CONCAT('User ', p_user_id, ' already exists');    
    DECLARE EXIT HANDLER FOR 1048 SELECT 'Parameters cannot be null';
    DECLARE EXIT HANDLER FOR 1062 SELECT v_message;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQLException encountered';
    
    -- Insert users
	INSERT INTO `users`
	(`user_id`,
	`user_password`,
	`first_name`,
	`middle_name`,
	`last_name`,
	`user_email`)
	VALUES
	(user_id,
	user_password,
	first_name,
	middle_name,
	last_name,
	user_email);
  
END$$
DELIMITER ;

-- Running the above stored Procesdure for registering user 'testuser'
CALL `pis`.`register_user`('testuser', 'tset', 'test', 'u', 'user', 'a@test.com');


/*

  Old Tutorial Stuff
  
*/

SELECT * FROM procedures;

UPDATE procedures set cost = -2000 where ProcedureID = 11;

INSERT INTO procedures(ProcedureName, ProcedureID, Description, Cost, BillingCode) VALUES ('test', 900, 'test', -90, 890);

-- Stored Precudure
DELIMITER $$
CREATE DEFINER=`PIS`@`localhost` PROCEDURE `check_cost`(IN cost decimal)
BEGIN
    if cost < 0 then
        signal sqlstate '45000' set message_text = 'Cost must be positive';
    end if;  
END$$
DELIMITER ;

-- All possible trigger events
-- AFTER/BEFORE INSERT
-- AFTER/BEFORE UPDATE
-- AFTER/BEFORE DELETE


-- BEFORE INSERT
delimiter //

drop trigger if exists check_cost_before_insert //
create trigger check_cost_before_insert before insert on procedures
for each row
begin    
    call check_cost(new.cost);
end
//

-- BEFORE UPDATE
delimiter //

drop trigger if exists check_cost_before_update //
create trigger check_cost_before_update before update on procedures
for each row
begin
    call check_cost(new.cost);
end
//

SELECT PIS.some_func();

DELIMITER $$
CREATE DEFINER=`PIS`@`localhost` PROCEDURE `cost_mismatch`(INOUT patient_list TEXT)
BEGIN
  DECLARE v_finished INTEGER DEFAULT 0;
  DECLARE v_patient_name VARCHAR(255);
  DECLARE v_cost_of_visit DECIMAL;
  DECLARE v_cost DECIMAL;
  DECLARE v_date_of_service DATE;
  
  DECLARE p_cursor CURSOR FOR 
  SELECT PT.NAME, PX.CostOfVist, PC.Cost , PX.DateOfService FROM PATIENTHX AS PX
  INNER JOIN PROCEDURES AS PC
  ON PX.ProcedureID = PC.ProcedureID
  INNER JOIN PATIENTS AS PT
  ON PX.MedRecNo = PT.MedRecNo
  WHERE PX.CostOfVist <> PC.Cost;
  
  -- Decide what happens when we are at the end of the cursor
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_finished = 1;
 
  -- ***********************
  OPEN p_cursor;  -- opens the concept of a reusable curser
  
  get_patient_list:  LOOP   -- creates a level named get_patient_list: and defines that as the begin og the LOOP
  
	  FETCH p_cursor INTO v_patient_name, v_cost_of_visit, v_cost, v_date_of_service;  -- grabs the above defined curser
																					--  and pulls the expected curser info (IN ITS EXPECTED ORDE fROM ABOVE)
																					 -- into the curser
	  IF v_finished = 1 THEN                     -- condition to test for end of row
		 LEAVE get_patient_list;                 -- no more data available
	  END IF;            -- exit
  
      -- We have vaid data
      SET patient_list = CONCAT(patient_list, v_patient_name, ' ', v_cost_of_visit, ' ', v_cost, ' ', v_date_of_service, '\r\n');
  
  -- End of LOOP
  END LOOP get_patient_list;
  
  CLOSE p_cursor;
  
END$$
DELIMITER ;

-- Run the above stored procedure
SET @output = '';
CALL cost_mismatch(@output);
SELECT @output;

-- Better way to do the abover version
DELIMITER $$
CREATE DEFINER=`PIS`@`localhost` FUNCTION `get_cost_mismatch` () RETURNS INTEGER
BEGIN
  --  Return count variable
  DECLARE CNT INT DEFAULT 0;
  
  -- Create temporary table to store the data
  CREATE TEMPORARY TABLE IF NOT EXISTS get_cost_mismatch_data (
     Name varchar(225) NOT NULL,
     CostOfVisit decimal(10, 2) NOT NULL,
     Cost decimal(10,2) NOT NULL,
     DateOfService date NOT NULL);
  
  -- Delete any existing data (from previous run)
  DELETE FROM get_cost_mismatch_data;
  
  -- Insert new data based on the logic
  INSERT INTO get_cost_mismatch_data (Name, CostOfVisit, Cost, DateOfService)
  SELECT PT.NAME, PX.CostOfVist, PC.Cost , PX.DateOfService FROM PATIENTHX AS PX
	  INNER JOIN PROCEDURES AS PC
	  ON PX.ProcedureID = PC.ProcedureID
	  INNER JOIN PATIENTS AS PT
	  ON PX.MedRecNo = PT.MedRecNo
	  WHERE PX.CostOfVist <> PC.Cost;  
  
  -- Populate the total count
  SELECT COUNT(*) into CNT from get_cost_mismatch_data;
  
RETURN CNT;
END$$
DELIMITER ;


-- Running the fucntion
SELECT get_cost_mismatch();
SELECT * from get_cost_mismatch_data;
