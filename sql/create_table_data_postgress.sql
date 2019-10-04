
drop TABLE patients;
CREATE TABLE patients (
  MedRecNo integer NOT NULL PRIMARY KEY,
  Name text DEFAULT NULL,
  DOB text DEFAULT NULL,
  Address text DEFAULT NULL,
  Insurance text DEFAULT NULL
);

INSERT INTO patients (MedRecNo, Name, DOB, Address, Insurance) VALUES
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


select * from patients;