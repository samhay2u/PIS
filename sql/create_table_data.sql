--
-- Database: `pis`
--
use PIS;
-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

set names utf8;

DROP TABLE IF EXISTS patienthx;
DROP TABLE IF EXISTS patients;
DROP TABLE IF EXISTS procedures;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS zip_city;

CREATE TABLE `patients` (
  `MedRecNo` int(11) NOT NULL PRIMARY KEY,
  `Name` varchar(225) DEFAULT NULL,
  `DOB` varchar(225) DEFAULT NULL,
  `Address` varchar(225) DEFAULT NULL,
  `Insurance` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`MedRecNo`, `Name`, `DOB`, `Address`, `Insurance`) VALUES
(1, 'Joe Rogan', '02/01/1988', '401 Winston Ave Wilmington, DE 19018', 'Aetna'),
(2, 'Adam Smith', '01/02/1952', '145 Rake Street Secane, PA 19804', 'Cigna'),
(103, 'John Smitt', '03/04/1967', '14 Greet street CLifton, PA 19803', 'Bluecross'),
(104, 'Mark Domenic', '08/19/1974', '167 South ave Norwood, PA 19804', 'Cigna'),
(105, 'Yarmish Squan', '12/02/1954', '10 Lake street Wilmington, DE 19802', 'Aetna'),
(106, 'John Anthony', '07/02/1966', '565 Dade street Broomall, PA 19845', 'Bluecross'),
(107, 'Patty Crackle', '07/30/1982', '5702  Highland ct. Elsmere, PA 19804', 'UHC'),
(108, 'Shannon White', '10/02/1951', '155 Blanchard street SSpringfield, PA 19018', 'Medicare'),
(109, 'Jackie Wooter', '09/02/1986', '654 Park ave Brighton, PA 19704', 'Cigna'),
(110, 'Adam Sandler', '01/28/1977', '145 Champlain street Newark, DE 19801', 'Cigna'),
(111, 'Charlene Parker', '11/22/1998', '8 Washington street Philadelphia, PA 19012', 'UHC'),
(112, 'Lenny Bison', '10/21/1966', '14 Jefferson street Philadelphia, PA 19012', 'UHC'),
(113, 'Jose Martinez', '05/22/1989', '452 Linkin ave Philadelphia, PA 19012', 'Medicaid'),
(114, 'Chris Angel', '01/01/1945', '15655 New Jersey Ave Philadelphia, PA 19012', 'Medicaid'),
(115, 'Chris Smith', '11/15/1988', '57 Green street Philadelphia, PA 19012', 'Bluecross'),
(116, 'Denise Logo', '12/25/2011', '45623 South street Philadelphia, PA 19012', 'UHC'),
(117, 'Craig Ocean', '04/16/1998', '789 Jessup street Clifton, PA 19018', 'Aetna'),
(118, 'Charlie Wagner', '07/07/1997', '781 James Place Philadelphia, PA 19012', 'UHC'),
(119, 'Suzanne Lane', '09/22/1951', '841 North Circle Bala Cynwood, PA 19715', 'Bluecross'),
(120, 'Jill Ryan', '10/22/1978', '8th ave Philadelphia, PA 19014', 'UHC'),
(121, 'Connor Ryan', '04/17/1976', '8th ave Philadelphia, PA 19014', 'UHC'),
(122, 'Joanne Taylor', '10/22/1967', 'W. 14th street Philadelphia, PA 19014', 'Medicare'),
(123, 'Markeisha Black', '03/30/2001', '765 bright ave Folsom, PA 19084', 'Bluecross'),
(124, 'Ryan Sores', '04/17/1978', 'Lake ave Philadelphia, PA 19018', 'Medicade'),
(125, 'Brian Proks', '12/04/1945', 'Oak ave Fine Acres, PA 19714', 'UHC'),
(126, 'Michelle Briggs', '06/14/1999', '401 Union ave Northern Liberties, PA 19014', 'Aetna'),
(127, 'Stacy Williams', '04/29/1978', 'West 18th ave Wildwood, NJ 17414', 'Bluecross'),
(128, 'Jack McCullen', '12/31/1991', 'McMiller ave Wilmington, DE 19804', 'UHC'),
(129, 'Samantha Davenport', '10/04/1998', '4056 Strives ave Philadelphia, PA 19014', 'Aetna'),
(130, 'Jermey Coleman', '11/11/1911', '8th Park ave New York, NY 16645', 'UHC'),
(131, 'Steve Ryan', '04/15/1976', '10th ave Philadelphia, PA 19014', 'UHC'),
(132, 'Joanne Cross', '10/22/1998', 'S. 16th street Philadelphia, PA 19014', 'Aetna'),
(133, 'Latoya Brown', '03/14/2001', '698 Red ave Folsom, PA 19084', 'Bluecross'),
(134, 'Scott Sires', '07/19/1978', 'Lincoln Street Philadelphia, PA 19018', 'Medicade'),
(135, 'Jason Brokes', '09/04/1948', 'Woodlawn ave Fine Acres, PA 19714', 'UHC'),
(136, 'Daniel Briggs', '08/18/1988', '888 fairacres lane Northern Liberties, PA 19014', 'Aetna'),
(137, 'Carney Williams', '12/19/1945', 'West 16th ave Wildwood, NJ 17414', 'Bluecross'),
(138, 'Brad McGowan', '10/31/1991', 'Wayne ave Wilmington, DE 19804', 'UHC'),
(139, 'Samantha Graven', '11/04/1996', '40 Strive ave Philadelphia, PA 19014', 'Aetna'),
(140, 'Jessica Coleman', '11/11/1989', '1997 Lawrence rd New York, NY 16645', 'UHC'),
(141, 'Gavin Parke', '09/22/1994', '811 Washington street Philadelphia, PA 19012', 'UHC'),
(142, 'Linda Harrison', '07/15/1966', '14 Monroe street Wilmington, DE 19805', 'UHC'),
(143, 'Crystal Gonzalez', '04/21/1989', '4599 Park ave Philadelphia, PA 19014', 'Medicaid'),
(144, 'Angel Rodriguez', '04/01/1997', '156 New York Ave Philadelphia, PA 19014', 'Medicaid'),
(145, 'Chaelynn White', '12/14/1989', '5775 Mean street Philadelphia, PA 19012', 'Bluecross'),
(146, 'Debra Williams', '01/15/2012', '45623 Witchert street Philadelphia, PA 19014', 'UHC'),
(147, 'Frank Greentree', '04/16/1997', '987 Jessup street Clifton, PA 19018', 'Aetna'),
(148, 'Amanda Wagner', '04/07/1997', '78 Granger Place Philadelphia, PA 19012', 'UHC'),
(149, 'Christine Lane', '03/23/1953', '841 Winner Circle Bala Cynwood, PA 19715', 'Bluecross'),
(150, 'Jill Nagel', '08/22/1987', '16th ave Philadelphia, PA 19014', 'UHC'),
(151, 'Kristin Parker', '09/22/1984', '811 Birch street Philadelphia, PA 19012', 'UHC'),
(152, 'Brian Harrison', '04/15/1966', '1445 Monroe street Wilmington, DE 19805', 'UHC'),
(153, 'Miguel Gonzalez', '05/25/1989', '1111 Jefferson ave Philadelphia, PA 19014', 'Medicaid'),
(154, 'Shelly Ferguson', '04/05/1957', '14563 New York Ave Philadelphia, PA 19014', 'Medicaid'),
(155, 'Cheryl White', '08/14/1949', '5 Highland street Philadelphia, PA 19012', 'Bluecross'),
(156, 'Thomas McClean', '11/15/2000', '46 Witchert ave Philadelphia, PA 19014', 'UHC'),
(157, 'Stephanie Greentree', '04/16/1994', '9 Jessup street Clifton, PA 19018', 'Aetna'),
(158, 'Steven Wright', '05/07/1989', '78 Granger Street Philadelphia, PA 19012', 'UHC'),
(159, 'Christy Mack', '03/20/1956', '836773 Winner Circle Bala Cynwood, PA 19715', 'Bluecross'),
(160, 'Dani Daniels', '08/22/1989', 'West 41st Clearview, PA 19014', 'UHC'),
(161, 'Steve Smith', '12/15/1976', 'W. 10th ave Philadelphia, PA 19014', 'UHC'),
(162, 'Joe Rivers', '10/22/1967', 'North 11th street Philadelphia, PA 19014', 'Aetna'),
(163, 'Matthew Grimes', '12/14/2001', '698 Red River rd Folsom, PA 19084', 'Bluecross'),
(164, 'Joy Sires', '07/19/1968', '654 Clinton Street Philadelphia, PA 19018', 'Medicade'),
(165, 'Wayne Brady', '04/04/1948', '456 Woodlawn ave Fine Acres, PA 19714', 'UHC'),
(166, 'Chirs Owen', '08/24/1984', '845 fairacres lane Northern Liberties, PA 19014', 'Aetna'),
(167, 'Mark Whalberg', '12/19/1976', 'West 16th ave Newark, DE 19414', 'Bluecross'),
(168, 'Casey Neistat', '10/31/1977', '45 Clearview ave Wilmington, DE 19804', 'UHC'),
(169, 'Samantha Jacklin', '05/04/1978', '576 west ridge rd Philadelphia, PA 19014', 'Aetna'),
(170, 'Bonnie Akira', '11/12/1989', '1997 Buttercup rd New York, NY 16645', 'UHC'),
(171, 'James Parka', '07/22/1994', '118 Garrison street Philadelphia, PA 19012', 'UHC'),
(172, 'Sean Crimson', '07/15/1986', '45652 Craten street Wilmington, DE 19805', 'UHC'),
(173, 'Todd Beacher', '05/25/1989', 'West 11th Street Philadelphia, PA 19014', 'Medicaid'),
(174, 'Melissa Moore', '04/04/1951', '782 Maine Ave Philadelphia, PA 19014', 'Medicaid'),
(175, 'Evan White', '01/14/1988', '5775 Main street Philadelphia, PA 19012', 'Bluecross'),
(176, 'Natalie Gunner', '01/22/2001', '45 Shine street Philadelphia, PA 19014', 'UHC'),
(177, 'Mark Thunderson', '12/16/1967', '789 Jessup street Clifton, PA 19018', 'Aetna'),
(178, 'Amy Casala', '02/07/1978', '87 Zion Place Philadelphia, PA 19012', 'UHC'),
(179, 'James Dean', '03/01/1978', '78 Learner Circle Green States, PA 19715', 'Bluecross'),
(180, 'Eva Angelina', '09/22/1947', '20th ave Philadelphia, PA 19014', 'UHC'),
(181, 'Stephanie Robinson', '04/16/1996', '9 Garson rd Clifton, PA 19018', 'Aetna'),
(182, 'Matt Ridds', '05/01/1989', '78 Poplar Street Philadelphia, PA 19012', 'UHC'),
(183, 'Anne Stevens', '03/20/1965', '845 Longwood Circle Bala Cynwood, PA 19715', 'Bluecross'),
(184, 'Dan Taylor', '07/22/1989', 'West 41st Pottstown, PA 19014', 'UHC'),
(185, 'Grechen Grizwald', '08/15/1976', '45 10th ave Philadelphia, PA 19014', 'UHC'),
(186, 'John Jones', '04/14/1967', 'North 21st street Philadelphia, PA 19014', 'Aetna'),
(187, 'Matthew Cravens', '12/14/1997', '698 Green River dr Folsom, PA 19084', 'Bluecross'),
(188, 'Grace Evans', '09/19/1969', '654 Wilburt Street Philadelphia, PA 19018', 'Medicade'),
(189, 'Tom Brady', '01/04/1981', '456 Greenson ave Fine Acres, PA 19714', 'UHC'),
(190, 'John Hudson', '04/15/1989', '11 King street Wilmington, DE 19805', 'UHC'),
(191, 'Clive Owen', '07/24/1982', '845 Hundson Park lane Northern Liberties, PA 19014', 'Aetna'),
(192, 'Tracy Hunnington', '05/19/1997', 'West 111th ave Newark, DE 19414', 'Bluecross'),
(193, 'Kasandra Jeffreys', '10/31/1972', '767 kirkwood ave Wilmington, DE 19804', 'UHC'),
(194, 'Jennifer Cooper', '04/05/1988', '576 Whine ridge rd Philadelphia, PA 19014', 'Aetna'),
(195, 'Brook Winters', '10/15/1971', '123 Brick rd New York, NY 16645', 'UHC'),
(196, 'Jen Jenson', '07/22/1994', '118 Garrison street Philadelphia, PA 19012', 'UHC'),
(197, 'Eugene Papagillio', '07/15/1986', '4565 Harrison street Wilmington, DE 19805', 'UHC'),
(198, 'Harry Smedly', '05/25/1961', '1604 w 11th Street Philadelphia, PA 19014', 'Medicaid'),
(199, 'Marissa Hill', '04/03/1951', '45 Campbridge Ave Philadelphia, PA 19014', 'Medicaid'),
(200, 'Christy Wallace', '01/14/1945', '5775 Red Robin street Philadelphia, PA 19012', 'Bluecross');

-- --------------------------------------------------------

--
-- Table structure for table `procedures`
--

CREATE TABLE `procedures` (
  `ProcedureID` int(11) NOT NULL PRIMARY KEY,
  `ProcedureName` varchar(225) DEFAULT NULL,  
  `Description` varchar(225) DEFAULT NULL,
  `Cost` decimal(10,2) NOT NULL,
  `BillingCode` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `procedures`
--

INSERT INTO `procedures` (`ProcedureName`, `ProcedureID`, `Description`, `Cost`, `BillingCode`) VALUES
('Arthroscopy Shoulder', 11, 'Rotator cuff repair', '2000.00', 29827),
('Colonoscopy', 22, 'Colonscopy with biopsy', '1700.00', 45380),
('Colorectal Cancer screening', 33, 'Flexible Sigmoidscopy', '2100.00', 104),
('Knee Arthroscopy', 44, 'Meniscus Repair', '2500.00', 29882),
('Arthroplasty Hip', 55, 'Total hip replacement', '5000.00', 27130),
('Achilles tendon repair', 66, 'Achilles tendon repair', '3000.00', 27650),
('Myringotomy', 77, 'insetion of tubes ear canal', '1200.00', 69421),
('Epidoral injection', 88, 'cervical epidoral injection', '900.00', 62310),
('Epidoral injection', 99, 'lumbar epidoral injection', '900.00', 62311),
('Arthroscopy Shoulder', 1000, 'Superior labrum repair', '2000.00', 29807),
('Arthroscopy Shoulder', 2000, 'Subacromial decompression w/ acromioplasty', '1500.00', 29826),
('Arthroscopy Shoulder', 3000, 'Deberidement extensive', '2000.00', 29823),
('Arthroscopic Knee Scope', 4000, 'Knee scope diagnostic', '1500.00', 29870),
('Carpal Tunnel Surgery', 5000, 'Carpal tunnel surgerical procedure', '1800.00', 64721),
('Ankle repair', 6000, 'Repair of ankle ligament', '2000.00', 27698),
('Tissue Removal', 7000, 'Removal of tissue for graft', '1800.00', 20926),
('Rhinoplasty', 8000, 'Secondary minor revision (small amount of nasal tip work)', '5000.00', 30460),
('Removal of skin tags', 9000, 'Removal skin tags multiple areas', '2000.00', 11200),
('Blepharoplasty', 10000, 'Removal lower eyelid', '3000.00', 15820),
('Blepharoplasty', 11000, 'Removal upper eyelid', '3000.00', 15822),
('Elbow Arthroscopy', 12000, 'Elbow scope diagnostic', '3000.00', 29830),
('Wrist Arthroscopy', 13000, 'Wrist scope diagostic', '2500.00', 29480),
('Wrist Endoscopy', 14000, 'Surical release of transverese carpal ligament', '4000.00', 29484),
('Foot Flexor tendon repair', 15000, 'Primary or secondary', '1450.00', 28200),
('Reconstruction cleft foot', 16000, 'Cleft foot reconstruction', '4020.00', 28360),
('Excision, Tumor, soft tissue', 17000, 'Soft tissue tumor excision of foot or toe', '2500.00', 28039),
('Vein ligation', 18000, 'Stripping of the short saphenous vein', '1875.00', 37718),
('Arthrotomy with biopsy', 19000, 'Intertarsal or tarsometatarsal joint', '2000.00', 28050),
('Neurectomy', 20000, 'Inrinsic musculature of foot', '2500.00', 28055),
('Fasciectomy', 21000, 'Plantar fascia; partial', '2300.00', 28060);

-- --------------------------------------------------------

--
-- Table structure for table `patienthx`
--

CREATE TABLE `patienthx` (
  `MedRecNo` int(11) NOT NULL,
  `DateOfService` date NOT NULL,
  `DoctorSeen` varchar(225) NOT NULL,
  `ProcedureID` int(11) NOT NULL,
  `CostOfVist` decimal(10,2) NOT NULL,
  PRIMARY KEY (`MedRecNo`,`DateOfService`,`DoctorSeen`,`ProcedureID`),
  CONSTRAINT `patienthx_ibfk_1` FOREIGN KEY (`MedRecNo`) REFERENCES `patients` (`MedRecNo`),
  CONSTRAINT `patienthx_ibfk_2` FOREIGN KEY (`ProcedureID`) REFERENCES `procedures` (`ProcedureID`)  
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `patienthx`
--

INSERT INTO `patienthx` (`MedRecNo`, `DateOfService`, `DoctorSeen`, `ProcedureID`, `CostOfVist`) VALUES
(1, '2016-02-01', 'Williams', 12000, '3000.00'),
(1, '2016-02-01', 'Williams', 18000, '3000.00'),
(1, '2016-02-15', 'Williams', 13000, '2100.00'),
(2, '2012-04-15', 'Good', 21000, '3075.00'),
(2, '2012-12-17', 'Jones', 14000, '3250.00'),
(2, '2015-10-27', 'Good', 18000, '4000.00'),
(103, '2012-02-01', 'Emper', 11, '2000.00'),
(103, '2012-02-15', 'Emper', 33, '2100.00'),
(104, '2014-02-01', 'Williams', 11000, '3000.00'),
(104, '2015-02-01', 'Emper', 99, '1700.00'),
(104, '2016-02-01', 'Jones', 88, '1500.00'),
(105, '2010-03-15', 'Emper', 6000, '4100.00'),
(105, '2010-04-01', 'Emper', 9000, '3100.00'),
(105, '2010-07-11', 'Good', 12000, '2750.00'),
(106, '2012-12-01', 'Good', 77, '3050.00'),
(106, '2013-10-01', 'Williams', 2000, '1750.00'),
(106, '2014-01-12', 'Jones', 66, '2500.00'),
(107, '2009-08-27', 'Jones', 7000, '750.00'),
(107, '2010-01-28', 'Jones', 9000, '3800.00'),
(107, '2016-02-09', 'Jones', 21000, '3070.00'),
(108, '2012-12-01', 'Good', 7000, '3050.00'),
(108, '2013-01-12', 'Jones', 33, '2500.00'),
(108, '2015-10-01', 'Williams', 2000, '1750.00'),
(109, '2015-03-01', 'Lele', 12000, '3900.00'),
(109, '2016-04-11', 'Williams', 14000, '2700.00'),
(109, '2016-10-01', 'Emper', 18000, '1850.00'),
(110, '2010-04-01', 'Emper', 9000, '3100.00'),
(110, '2012-03-15', 'Emper', 6000, '4100.00'),
(110, '2015-07-11', 'Good', 12000, '2750.00'),
(111, '2015-10-27', 'Emper', 9000, '4000.00'),
(111, '2016-04-15', 'Good', 21000, '3075.00'),
(111, '2016-12-17', 'Jones', 14000, '3250.00'),
(112, '2013-12-01', 'Good', 7000, '3050.00'),
(112, '2014-01-12', 'Jones', 66, '2500.00'),
(112, '2016-10-01', 'Williams', 2000, '1750.00'),
(113, '2014-03-01', 'Rushton', 14000, '3900.00'),
(113, '2015-04-11', 'Williams', 13000, '2700.00'),
(113, '2015-10-01', 'Emper', 18000, '1850.00'),
(114, '2014-02-01', 'Williams', 11000, '3000.00'),
(114, '2015-02-01', 'Emper', 99, '1700.00'),
(114, '2016-02-01', 'Jones', 88, '1500.00'),
(115, '2010-03-15', 'Emper', 6000, '4100.00'),
(115, '2011-04-01', 'Emper', 9000, '3100.00'),
(115, '2015-07-11', 'Good', 12000, '2750.00'),
(116, '2009-08-28', 'Good', 7000, '750.00'),
(116, '2010-01-29', 'Jones', 18000, '3800.00'),
(116, '2016-02-08', 'Jones', 21000, '3070.00'),
(117, '2012-10-27', 'Good', 18000, '4100.00'),
(117, '2013-04-15', 'Rushton', 20000, '3075.00'),
(117, '2014-12-17', 'Jones', 14000, '3255.00'),
(118, '2015-11-27', 'Smith', 19000, '4000.00'),
(118, '2016-05-15', 'Good', 2000, '3075.00'),
(118, '2016-10-17', 'Jones', 14000, '3250.00'),
(119, '2014-03-02', 'Rushton', 14000, '3900.00'),
(119, '2015-04-13', 'Williams', 17000, '2700.00'),
(119, '2015-10-05', 'Jones', 19000, '1850.00'),
(120, '2014-02-21', 'Williams', 11000, '3100.00'),
(120, '2015-03-11', 'Emper', 3000, '1775.00'),
(120, '2016-04-15', 'Jones', 4000, '1520.00'),
(121, '2008-08-28', 'Good', 9000, '1750.00'),
(121, '2012-01-29', 'Jones', 18000, '3800.00'),
(121, '2016-02-08', 'Emper', 20000, '3070.00'),
(122, '2013-12-01', 'Good', 8000, '3050.00'),
(122, '2014-01-22', 'Jones', 99, '2500.00'),
(122, '2015-10-01', 'Rushton', 2000, '1750.00'),
(123, '2014-10-27', 'Emper', 9000, '4005.00'),
(123, '2015-04-15', 'Good', 12000, '3075.00'),
(123, '2015-12-17', 'Smith', 12000, '3250.00'),
(124, '2014-03-02', 'Rushton', 13000, '3900.00'),
(124, '2015-04-13', 'Williams', 17000, '2700.00'),
(124, '2016-10-05', 'Emper', 15000, '1850.00'),
(125, '2012-10-27', 'Good', 18000, '4100.00'),
(125, '2014-04-15', 'Rushton', 21000, '3175.00'),
(125, '2014-12-24', 'Jones', 15000, '3255.00'),
(126, '2014-03-02', 'Rushton', 1000, '3900.00'),
(126, '2015-04-13', 'Williams', 18000, '2700.00'),
(126, '2016-10-17', 'Good', 19000, '1870.00'),
(127, '2009-08-28', 'Good', 19000, '1750.00'),
(127, '2010-01-29', 'Jones', 18000, '3800.00'),
(127, '2011-02-08', 'Emper', 21000, '3070.00'),
(128, '2014-03-01', 'Smith', 17000, '3000.00'),
(128, '2015-04-01', 'Emper', 99, '1700.00'),
(128, '2016-12-27', 'Jones', 77, '1500.00'),
(129, '2013-01-17', 'Good', 18000, '3050.00'),
(129, '2013-08-12', 'Jones', 99, '2500.00'),
(129, '2015-10-01', 'Williams', 2000, '1750.00'),
(130, '2015-02-21', 'Williams', 12000, '3100.00'),
(130, '2016-03-11', 'Emper', 7000, '1775.00'),
(130, '2016-04-15', 'Jones', 4000, '1520.00'),
(131, '2015-04-13', 'Emper', 1000, '3900.00'),
(131, '2015-04-13', 'Emper', 2000, '2700.00'),
(131, '2015-04-13', 'Emper', 3000, '1870.00'),
(132, '2008-08-28', 'Good', 9000, '2750.00'),
(132, '2010-01-29', 'Jones', 10000, '3800.00'),
(132, '2013-02-08', 'Jones', 21000, '3070.00'),
(133, '2013-10-27', 'Smith', 18000, '4100.00'),
(133, '2014-04-15', 'Rushton', 21000, '3175.00'),
(133, '2014-12-24', 'Williams', 17000, '3255.00'),
(134, '2013-03-02', 'Rushton', 13000, '3900.00'),
(134, '2015-04-13', 'Williams', 17000, '2700.00'),
(134, '2016-10-17', 'Emper', 15000, '1850.00'),
(135, '2014-02-21', 'Williams', 11000, '3100.00'),
(135, '2015-04-13', 'Williams', 17000, '2700.00'),
(135, '2015-10-05', 'Jones', 19000, '1850.00'),
(136, '2013-12-01', 'Good', 8000, '3050.00'),
(136, '2014-01-23', 'Jones', 1000, '2500.00'),
(136, '2016-02-17', 'Emper', 21000, '3070.00'),
(137, '2014-04-15', 'Jones', 4000, '1520.00'),
(137, '2015-04-18', 'Emper', 1000, '3900.00'),
(137, '2016-04-13', 'Emper', 2000, '2700.00'),
(138, '2013-10-17', 'Jones', 14000, '3250.00'),
(138, '2014-03-02', 'Rushton', 4000, '3900.00'),
(138, '2015-04-13', 'Williams', 17000, '2700.00'),
(139, '2013-12-24', 'Jones', 15000, '3255.00'),
(139, '2014-03-02', 'Rushton', 1000, '3900.00'),
(139, '2015-04-13', 'Williams', 18000, '2700.00'),
(140, '2013-10-17', 'Jones', 10000, '3250.00'),
(140, '2014-03-02', 'Rushton', 8000, '3900.00'),
(140, '2015-04-13', 'Williams', 17000, '2700.00'),
(141, '2013-12-01', 'Good', 8000, '3050.00'),
(141, '2014-01-23', 'Jones', 1000, '2500.00'),
(141, '2014-04-15', 'Jones', 6000, '1520.00'),
(142, '2014-02-21', 'Williams', 11000, '3100.00'),
(142, '2014-03-02', 'Rushton', 3000, '3900.00'),
(142, '2016-02-17', 'Emper', 19000, '3070.00'),
(143, '2013-10-17', 'Jones', 12000, '3250.00'),
(143, '2015-10-01', 'Emper', 99, '1700.00'),
(143, '2016-02-17', 'Jones', 88, '1500.00'),
(144, '2012-10-27', 'Good', 18000, '4100.00'),
(144, '2014-04-15', 'Rushton', 21000, '3175.00'),
(144, '2016-10-05', 'Emper', 15000, '1850.00'),
(145, '2008-08-28', 'Good', 9000, '2750.00'),
(145, '2015-04-13', 'Emper', 2000, '2700.00'),
(145, '2015-04-13', 'Emper', 3000, '1870.00'),
(146, '2013-12-24', 'Jones', 15000, '3255.00'),
(146, '2014-03-02', 'Rushton', 1000, '3900.00'),
(146, '2015-04-13', 'Williams', 17000, '2700.00'),
(147, '2013-03-02', 'Rushton', 13000, '3900.00'),
(147, '2014-04-15', 'Rushton', 21000, '3175.00'),
(147, '2014-12-24', 'Williams', 17000, '3255.00'),
(148, '2008-08-28', 'Good', 9000, '1750.00'),
(148, '2015-03-11', 'Emper', 5000, '1775.00'),
(148, '2016-04-15', 'Jones', 4000, '1520.00'),
(149, '2014-07-11', 'Good', 15000, '2750.00'),
(149, '2015-10-27', 'Emper', 19000, '4000.00'),
(149, '2016-04-15', 'Good', 21000, '3075.00'),
(150, '2011-02-08', 'Emper', 21000, '3070.00'),
(150, '2013-03-01', 'Smith', 17000, '3000.00'),
(150, '2015-04-13', 'Emper', 99, '1700.00'),
(151, '2012-01-29', 'Jones', 10000, '3800.00'),
(151, '2013-02-08', 'Jones', 21000, '3070.00'),
(151, '2013-10-27', 'Smith', 4000, '4100.00'),
(152, '2008-03-15', 'Emper', 8000, '4100.00'),
(152, '2011-04-01', 'Emper', 9000, '3100.00'),
(152, '2015-07-13', 'Good', 12000, '2750.00'),
(153, '2013-08-14', 'Jones', 99, '2500.00'),
(153, '2015-10-01', 'Williams', 2000, '1750.00'),
(153, '2016-02-21', 'Williams', 11000, '3100.00'),
(154, '2014-05-02', 'Rushton', 1000, '3900.00'),
(154, '2015-04-13', 'Williams', 18000, '2700.00'),
(154, '2016-10-09', 'Jones', 19000, '1275.00'),
(155, '2013-10-05', 'Jones', 19000, '1850.00'),
(155, '2014-02-21', 'Williams', 11000, '3100.00'),
(155, '2016-02-17', 'Good', 18000, '3070.00'),
(156, '2010-04-01', 'Emper', 9000, '3100.00'),
(156, '2015-07-11', 'Jones', 12000, '2750.00'),
(156, '2016-10-27', 'Emper', 10000, '4000.00'),
(157, '2011-02-09', 'Emper', 8000, '3070.00'),
(157, '2012-03-04', 'Rushton', 9000, '3900.00'),
(157, '2015-04-13', 'Williams', 17000, '2700.00'),
(158, '2012-10-27', 'Good', 18000, '4100.00'),
(158, '2015-04-13', 'Williams', 17000, '2700.00'),
(158, '2016-10-05', 'Emper', 15000, '1850.00'),
(159, '2014-04-15', 'Jones', 4000, '1520.00'),
(159, '2015-04-18', 'Emper', 1000, '3900.00'),
(159, '2016-04-13', 'Jones', 2000, '2700.00'),
(160, '2013-10-17', 'Jones', 10000, '3250.00'),
(160, '2014-03-13', 'Rushton', 7000, '3900.00'),
(160, '2015-05-13', 'Williams', 18000, '2700.00'),
(161, '2012-04-15', 'Good', 21000, '3075.00'),
(161, '2015-10-27', 'Good', 19000, '4000.00'),
(161, '2016-02-01', 'Williams', 12000, '3000.00'),
(162, '2006-08-28', 'Good', 9000, '2750.00'),
(162, '2015-04-13', 'Emper', 2000, '2700.00'),
(162, '2015-04-13', 'Emper', 3000, '1870.00'),
(163, '2014-10-17', 'Emper', 15000, '1850.00'),
(163, '2015-04-13', 'Williams', 17000, '2700.00'),
(163, '2015-10-05', 'Jones', 2000, '1850.00'),
(164, '2014-03-02', 'Rushton', 6000, '3900.00'),
(164, '2014-04-15', 'Rushton', 21000, '3175.00'),
(164, '2014-12-24', 'Jones', 15000, '3255.00'),
(165, '2010-02-08', 'Jones', 21000, '3070.00'),
(165, '2012-10-27', 'Good', 18000, '4100.00'),
(165, '2013-04-15', 'Rushton', 21000, '3075.00'),
(166, '2013-10-17', 'Jones', 12000, '3250.00'),
(166, '2014-03-02', 'Rushton', 9000, '3900.00'),
(166, '2015-04-13', 'Williams', 17000, '2700.00'),
(167, '2013-10-05', 'Jones', 17000, '1850.00'),
(167, '2014-02-21', 'Williams', 11000, '3100.00'),
(167, '2016-02-17', 'Emper', 19000, '3070.00'),
(168, '2014-03-02', 'Rushton', 1000, '3900.00'),
(168, '2015-04-13', 'Williams', 8000, '2700.00'),
(168, '2016-10-17', 'Good', 19000, '1870.00'),
(169, '2012-10-27', 'Good', 18000, '4100.00'),
(169, '2014-04-15', 'Jones', 4000, '1520.00'),
(169, '2016-10-05', 'Emper', 15000, '1850.00'),
(170, '2014-02-03', 'Williams', 11000, '3000.00'),
(170, '2015-10-01', 'Emper', 99, '1700.00'),
(170, '2016-02-17', 'Jones', 88, '1500.00'),
(171, '2013-10-17', 'Jones', 12000, '3250.00'),
(171, '2014-03-02', 'Rushton', 8000, '3900.00'),
(171, '2015-04-17', 'Williams', 17000, '2700.00'),
(172, '2010-04-01', 'Emper', 19000, '3100.00'),
(172, '2012-03-15', 'Emper', 8000, '4100.00'),
(172, '2016-10-01', 'Emper', 18000, '1850.00'),
(173, '2015-10-01', 'Williams', 2000, '1750.00'),
(173, '2015-11-27', 'Smith', 19000, '4000.00'),
(173, '2016-05-15', 'Good', 3000, '3075.00'),
(174, '2012-01-29', 'Jones', 11000, '3800.00'),
(174, '2013-02-08', 'Jones', 21000, '3070.00'),
(174, '2013-10-27', 'Smith', 7000, '4100.00'),
(175, '2008-10-01', 'Williams', 2000, '1750.00'),
(175, '2009-08-27', 'Jones', 17000, '750.00'),
(175, '2010-01-28', 'Jones', 9000, '3800.00'),
(176, '2009-08-28', 'Good', 77, '1750.00'),
(176, '2010-01-29', 'Jones', 18000, '3800.00'),
(176, '2011-03-08', 'Emper', 21000, '3070.00'),
(177, '2009-08-28', 'Good', 9000, '750.00'),
(177, '2010-01-29', 'Jones', 18000, '3800.00'),
(177, '2015-07-11', 'Good', 12000, '2750.00'),
(178, '2014-02-01', 'Jones', 88, '1500.00'),
(178, '2015-03-15', 'Emper', 6000, '4100.00'),
(178, '2016-04-01', 'Emper', 9000, '3100.00'),
(179, '2012-04-15', 'Good', 21000, '3075.00'),
(179, '2015-04-13', 'Emper', 2000, '2700.00'),
(179, '2015-04-13', 'Emper', 3000, '1870.00'),
(180, '2014-04-18', 'Emper', 1000, '3900.00'),
(180, '2015-05-13', 'Williams', 18000, '2700.00'),
(180, '2016-04-13', 'Jones', 2000, '2700.00'),
(181, '2014-01-23', 'Jones', 1000, '2500.00'),
(181, '2014-04-15', 'Jones', 4000, '1520.00'),
(181, '2015-04-18', 'Emper', 1000, '3900.00'),
(182, '2011-02-09', 'Emper', 8000, '3070.00'),
(182, '2015-04-13', 'Williams', 17000, '2700.00'),
(182, '2016-10-05', 'Emper', 15000, '1850.00'),
(183, '2013-10-05', 'Jones', 19000, '1850.00'),
(183, '2014-02-21', 'Williams', 11000, '3100.00'),
(183, '2016-10-09', 'Jones', 19000, '1275.00'),
(184, '2011-04-13', 'Williams', 17000, '2700.00'),
(184, '2013-10-05', 'Jones', 10000, '1850.00'),
(184, '2014-02-21', 'Williams', 11000, '3100.00'),
(185, '2013-04-15', 'Jones', 6000, '1520.00'),
(185, '2014-02-21', 'Williams', 11000, '3100.00'),
(185, '2016-02-17', 'Emper', 19000, '3070.00'),
(186, '2014-04-15', 'Rushton', 20000, '3175.00'),
(186, '2015-04-13', 'Williams', 18000, '2700.00'),
(186, '2015-10-05', 'Jones', 2000, '1850.00'),
(187, '2013-10-17', 'Jones', 10000, '3250.00'),
(187, '2014-03-02', 'Rushton', 8000, '3900.00'),
(187, '2015-04-13', 'Williams', 18000, '2700.00'),
(188, '2008-08-28', 'Good', 9000, '1750.00'),
(188, '2012-01-29', 'Jones', 19000, '3800.00'),
(188, '2016-04-15', 'Jones', 4000, '1520.00'),
(189, '2010-01-29', 'Jones', 18000, '3800.00'),
(189, '2014-02-01', 'Jones', 88, '1500.00'),
(189, '2015-03-15', 'Emper', 6000, '4100.00'),
(190, '2014-01-22', 'Jones', 99, '2500.00'),
(190, '2014-10-27', 'Emper', 9000, '4005.00'),
(190, '2015-10-01', 'Rushton', 2000, '1750.00'),
(191, '2013-02-01', 'Jones', 99, '1500.00'),
(191, '2015-03-15', 'Emper', 7000, '4100.00'),
(191, '2016-04-01', 'Emper', 9000, '3100.00'),
(192, '2013-03-02', 'Rushton', 13000, '3900.00'),
(192, '2014-12-24', 'Williams', 17000, '3255.00'),
(192, '2015-03-11', 'Emper', 5000, '1775.00'),
(193, '2013-03-02', 'Rushton', 4000, '3900.00'),
(193, '2015-10-01', 'Emper', 99, '1700.00'),
(193, '2016-02-17', 'Emper', 17000, '3070.00'),
(194, '2014-03-02', 'Rushton', 1000, '3900.00'),
(194, '2014-04-15', 'Rushton', 21000, '3175.00'),
(194, '2014-12-24', 'Williams', 12000, '3255.00'),
(195, '2013-12-01', 'Good', 8000, '3050.00'),
(195, '2014-01-23', 'Jones', 12000, '2500.00'),
(195, '2015-04-13', 'Emper', 3000, '1870.00'),
(196, '2013-10-17', 'Jones', 10000, '3250.00'),
(196, '2015-05-13', 'Williams', 18000, '2700.00'),
(196, '2016-04-13', 'Jones', 2000, '2700.00'),
(197, '2014-04-15', 'Rushton', 21000, '3175.00'),
(197, '2014-12-24', 'Jones', 15000, '3255.00'),
(197, '2015-10-05', 'Jones', 2000, '1850.00'),
(198, '2013-03-02', 'Rushton', 13000, '3900.00'),
(198, '2014-04-15', 'Rushton', 21000, '3175.00'),
(198, '2014-12-24', 'Williams', 17000, '3255.00'),
(199, '2013-02-09', 'Emper', 8000, '3070.00'),
(199, '2015-04-13', 'Williams', 17000, '2700.00'),
(199, '2016-10-05', 'Emper', 16000, '1850.00'),
(200, '2009-08-28', 'Good', 77, '1750.00'),
(200, '2010-01-28', 'Jones', 9000, '3800.00'),
(200, '2010-01-29', 'Jones', 18000, '3800.00');

DROP VIEW IF EXISTS TOPFIVE;

CREATE VIEW TOPFIVE
AS
SELECT P.MedRecNo, P.Name, P.DOB, P.Address, P.Insurance, SUM(H.CostOfVist) AS TOTAL_COST 
FROM patienthx AS H 
INNER JOIN patients AS P ON H.MedRecNo = P.MedRecNo 
GROUP BY P.MedRecNo 
ORDER BY TOTAL_COST DESC, P.Name LIMIT 5;

DROP VIEW IF EXISTS TOPZIP;

Create view TOPZIP
as
select zipcode, procedurename, cnt
from 
(
SELECT  SUBSTRING(Address, LENGTH(address)-5, 6) AS zipCode, ProcedureName, count(*) as cnt
FROM patients as pt, patienthx as hx, procedures as px
     WHERE pt.MedRecNo = hx.MedRecNo 
     And hx.ProcedureId = px.ProcedureID 
     group By SUBSTRING(Address, LENGTH(address)-5, 6), ProcedureName
) as a order by cnt desc;

 CREATE TABLE `users`(
   `user_id`            	varchar(225) NOT NULL, 
   `user_password`		   	varchar(225) NOT NULL,
   `role`		   	        varchar(5)   NOT NULL DEFAULT 'USER' CHECK(`role` IN ('USER', 'ADMIN')),
   `active`		   	        boolean      NOT NULL DEFAULT 1,
   `first_name` 	    	varchar(225) NOT NULL,
   `middle_name`	    	varchar(225) NOT NULL, 
   `last_name`		    	varchar(225) NOT NULL,
   `user_email`				varchar(225) NOT NULL,
   `created`				TIMESTAMP DEFAULT NOW(),
   PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `users`
(`user_id`,
`user_password`,
`role`,
`first_name`,
`middle_name`,
`last_name`,
`user_email`)
VALUES
('Mcsammer',
'90 -78 29 -105 92 13 106 76 71 122 119 -55 36 -23 97 -71 71 -34 47 8 6 -56 61 -125 -40 124 -82 36 -49 123 -52 -88',
'ADMIN',
'Sam',
'Hutson',
'Hay',
'samhay2u@gmail.com'),
('Staylor',
'127 -37 -108 31 -126 -32 38 -100 120 35 -106 54 -33 51 -88 74 -56 8 71 -50 55 -10 24 -17 53 -85 23 -62 -103 -69 -106 11',
'ADMIN',
'Steve',
'Lane',
'Taylor',
'steve@IC-Cap.com'),
('jdoe',
'9 64 12 65 -54 -13 97 -94 11 33 64 127 68 11 103 101 42 41 106 -71 -62 111 -95 -47 -11 65 21 30 -118 32 -34 -84',
'USER',
'John',
'K',
'Doe',
'jdoe@gmail.com');

 CREATE TABLE `zip_city`
 (`zip` int(5) NOT NULL,
 `countyname` varchar(50) NOT NULL,
 `state` char(2) NOT NULL,
 `stcountyfp` int(5) NOT NULL,
 `classfp` char(2) NOT NULL,
 PRIMARY KEY (`zip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- LOAD DATA LOCAL INFILE '/tmp/zipStateCounty.csv'
LOAD DATA LOCAL INFILE 'C:\\Users\\samha\\OneDrive\\Desktop\\SummerProjects\\PIS\\sql\\zipStateCounty.csv'
INTO TABLE zip_city
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


/*DROP VIEW IF EXISTS TOPZIP;

Create view TOPZIP
as
select zipcode, procedurename, cnt
from 
(
SELECT  SUBSTRING(Address, LENGTH(address)-5, 6) AS zipCode, ProcedureName, count(*) as cnt
FROM patients as pt, patienthx as hx, procedures as px
     WHERE pt.MedRecNo = hx.MedRecNo 
     And hx.ProcedureId = px.ProcedureID 
     group By SUBSTRING(Address, LENGTH(address)-5, 6), ProcedureName
) as a order by cnt desc;

 
*/
 




