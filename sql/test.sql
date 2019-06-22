use PIS;

DROp TABLE TEST;
CREATE TABLE TEST (
  ID int not null primary key AUTO_INCREMENT,
  Description VARCHAR(30) NOT NULL,
  CREATED_DATE TIMESTAMP NOT NULL DEFAULT NOW()
);

SELECT * FROM pis.test;

	DELETE FROM pis.test  WHERE ID = 3;
    -- DELETE FROM pis.test  WHERE ID = (2-5); will try to delete -3 id number
    
    DELETE FROM pis.test  WHERE ID BETWEEN 2 AND 5; 
    
    INSERT into PIS.TEST(DESCRIPTION) VALUES('Question18');
    
    INSERT into PIS.TEST(DESCRIPTION) VALUES('Question10');

-- BEFORE INSERT
delimiter //
-- this trigger will reset the ID number to a correct incremented sequence of numbers
-- should we insert/delete id numbers to/from the table
  
-- because we could have changed this defiition drop it and make it ready for new one
drop trigger if exists check_id_before_insert //

-- now recreate it for new definition
create trigger check_id_before_insert before insert on test
for each row

-- begin consideration loop with initializing usable variables
begin    
 DECLARE v_id INTEGER DEFAULT 1; 			-- current loop integer
 DECLARE v_max_id INTEGER DEFAULT 0;		-- max loop kickout integer
 DECLARE v_cnt INTEGER DEFAULT 0;			-- running count
 
 -- store v_max_id from TEST table to aggregate function MAX(ID)
 SELECT MAX(ID) INTO v_max_id FROM TEST;
 
 -- while condition test to see if you hit the MAX loop kick out..if not do stuff
 CHECKID_LOOP: WHILE v_id  <= v_max_id DO   
  -- grab and count total of all collum values from table test = to the number when you kicked out tof loop
   SELECT COUNT(*) INTO v_cnt FROM TEST WHERE ID = v_id; 
   
   -- if theere never was anything to count
   IF v_cnt = 0 THEN
      SET NEW.id = v_id;   -- then reset the ID to next available unused
      LEAVE CHECKID_LOOP;  -- leave because there are no values to convert
   END IF;
   
   SET  v_id = v_id + 1; 	-- increment next availablr ID   
 END WHILE CHECKID_LOOP; 	-- exit
end
//


INSERT INTO `pis`.`test`
(`Description`)
VALUES
('Question1'),
('Question2'),
('Question3'),
('Question4'),
('Question5');

SELECT NOW();

SELECT CURRENT_DATE();

use employees;

-- Show me all employees, their departments and salaries
	CREATE OR REPLACE VIEW employee_salary_view AS
    select e.*, 
           s.salary, 
           de.from_date de_from_date, 
           de.to_date de_to_date, 
           s.from_date, 
           s.to_date, 
           d.* from employees e 
    left outer join dept_emp as de on e.emp_no = de.emp_no
    left outer join salaries as s on de.emp_no = s.emp_no    
    left outer join departments d on de.dept_no = d.dept_no;
    
    
    select de.dept_no, de.emp_no, s.salary 
    from dept_emp as de
    inner join salaries as s on de.emp_no = s.emp_no    
    WHERE de.dept_no = 'd002';
    
    -- select count(*)
   -- from dept_emp as de
    inner join salaries as s on de.emp_no = s.emp_no    
    --  WHERE de.dept_no = 'd002';    

-- Give me all average salaries by department?
SELECT * AVG(salaries)

-- What is the average salary of Finance Department ?
    select AVG(salary) from dept_emp as de
    -- 
    inner join salaries as s on de.emp_no = s.emp_no    
    --WHERE de.dept_no = 'd002';



-- from google    
-- SELECT AVG(no_page)
-- FROM book_mast;
    
-- List all Baby Boomers ( > 65) ?
SELECT * FROM Baby Boomers WHERE (age > 65);


-- from google
-- root@host# mysql -u root -p password;
-- Enter password:*******
-- mysql> use TUTORIALS;
-- Database changed
-- mysql> SELECT * from tutorials_tbl WHERE tutorial_author = 'Sanjay';
-- +-------------+----------------+-----------------+-----------------+
-- | tutorial_id | tutorial_title | tutorial_author | submission_date |
-- +-------------+----------------+-----------------+-----------------+
-- |      3      | JAVA Tutorial  |      Sanjay     |    2007-05-21   |      
-- +-------------+----------------+-----------------+-----------------+
-- 1 rows in set (0.01 sec)
--
-- mysql>





	
-- List all Millenials ( Born 1977 & 2000) ?

SELECT * Millenials Where(Born    )
	
-- Show me average salaries by department ?
	
-- Which employee is currently making the least salary. Provide the full name and the department he/she is working for ?
	
-- Which department manager manages the largest number of employees ?  
    
-- Give me all average salaries by department?   
    select 	 
             d.dept_name,
			 AVG(s.salary)
    from 	 dept_emp as de
			 inner join salaries as s on de.emp_no = s.emp_no    
			 inner join departments d on de.dept_no = d.dept_no
	GROUP BY d.dept_name
    ORDER BY d.dept_name;
    
    select 	 d.dept_name,   -- get 	all deptpartment names found in department table
             de.emp_no,		-- 		all employee numbers found in dept_employee table
			 s.salary		-- 		all salaries found in Salariries table             
    from 	 dept_emp as de -- from  department employees  table
			 inner join salaries as s on de.emp_no = s.emp_no    
			 inner join departments d on de.dept_no = d.dept_no
	-- GROUP BY d.dept_name
    ORDER BY d.dept_nam;
    