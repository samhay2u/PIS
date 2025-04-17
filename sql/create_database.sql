-- Use mysql main database
use mysql;

-- Drop User and database
drop database IF EXISTS PIS;
drop user IF EXISTS 'PIS'@'localhost';

-- Create user PIS
CREATE USER 'PIS'@'localhost' IDENTIFIED BY 'tset';

-- Create PIS database
CREATE DATABASE IF NOT EXISTS PIS;

-- Give all priviledges to PIS user
GRANT ALL PRIVILEGES ON PIS.* TO 'PIS'@'localhost';
GRANT FILE ON *.* TO 'PIS'@'localhost';

-- Provide proper access to create triggers
set global log_bin_trust_function_creators=1;
SET GLOBAL local_infile = 1;

 
