USE cis495;

DROP TABLE IF EXISTS EMPLOYEE;
DROP TABLE IF EXISTS BUILDING;
DROP TABLE IF EXISTS STAFF;
DROP TABLE IF EXISTS PERSON;

CREATE TABLE PERSON (
     ID INT NOT NULL,
     FIRST_NAME VARCHAR(32) NOT NULL,
     LAST_NAME VARCHAR(32) NOT NULL,
     DOB DATE,
     ADDRESS VARCHAR(32),
     CONSTRAINT PK_PERSON_ID PRIMARY KEY (ID));

CREATE TABLE STAFF (
     SALARY DOUBLE PRECISION NOT NULL,
     START_DATE DATE NOT NULL,
     END_DATE DATE DEFAULT NULL,
     EMP_NUM VARCHAR(5) NOT NULL UNIQUE,
     PERSON_ID INT NOT NULL,
     CONSTRAINT PK_STAFF PRIMARY KEY (PERSON_ID),
     CONSTRAINT FK_STAFF_PERSON FOREIGN KEY(PERSON_ID) REFERENCES PERSON(ID));

CREATE TABLE BUILDING (
     ID INT NOT NULL,
     CODE VARCHAR(5) NOT NULL UNIQUE,
     NAME VARCHAR(32) NOT NULL,
     ADDRESS VARCHAR(32),
     MANAGER_ID INT,
     CONSTRAINT PK_BUILDING PRIMARY KEY (ID),
     CONSTRAINT FK_BUILDING_STAFF FOREIGN KEY(MANAGER_ID) REFERENCES STAFF(PERSON_ID));

CREATE TABLE EMPLOYEE (
     ID INT NOT NULL,
     PERSON_ID INT,
     BUILDING_ID INT,
     CONSTRAINT PK_EMPLOYEE PRIMARY KEY (PERSON_ID,BUILDING_ID),
     CONSTRAINT FK_STAFF_ID FOREIGN KEY(PERSON_ID) REFERENCES STAFF(PERSON_ID),
     CONSTRAINT FK_BUILDING_ID FOREIGN KEY(BUILDING_ID) REFERENCES BUILDING(ID));

-- Data
INSERT INTO person (id, first_name, last_name, dob, address) VALUES (1, 'fname11', 'lname11', str_to_date('7/27/1990', '%m/%d/%y'), '527 15th Av CT');
INSERT INTO person (id, first_name, last_name, dob, address) VALUES (2, 'fname12', 'lname12', str_to_date('12/5/1966', '%m/%d/%y'), '254 11th St CT');
INSERT INTO person (id, first_name, last_name, dob, address) VALUES (3, 'fname13', 'lname13', str_to_date('8/11/1986', '%m/%d/%y'), '274 13th Av CT');
INSERT INTO person (id, first_name, last_name, dob, address) VALUES (4, 'fname14', 'lname14', str_to_date('2/22/1987', '%m/%d/%y'), '414 19th St PA');
INSERT INTO person (id, first_name, last_name, dob, address) VALUES (5, 'fname15', 'lname15', str_to_date('9/5/1971', '%m/%d/%y'), '410 10th St CT');
INSERT INTO person (id, first_name, last_name, dob, address) VALUES (6, 'fname16', 'lname16', str_to_date('12/27/1979', '%m/%d/%y'), '704 13th St NJ');
INSERT INTO person (id, first_name, last_name, dob, address) VALUES (7, 'fname17', 'lname17', str_to_date('10/18/1967', '%m/%d/%y'), '545 10th St PA');
INSERT INTO person (id, first_name, last_name, dob, address) VALUES (8, 'fname18', 'lname18', str_to_date('10/1/1978', '%m/%d/%y'), '350 16th St NJ');
INSERT INTO person (id, first_name, last_name, dob, address) VALUES (9, 'fname19', 'lname19', str_to_date('7/20/1989', '%m/%d/%y'), '46 8th St NY');
INSERT INTO person (id, first_name, last_name, dob, address) VALUES (10, 'fname20', 'lname20', str_to_date('4/22/1993', '%m/%d/%y'), '911 8th Av NY');
INSERT INTO person (id, first_name, last_name, dob, address) VALUES (11, 'fname21', 'lname21', str_to_date('2/17/1967', '%m/%d/%y'), '926 20th Av CT');
INSERT INTO person (id, first_name, last_name, dob, address) VALUES (12, 'fname22', 'lname22', str_to_date('3/17/1966', '%m/%d/%y'), '930 13th St PA');
INSERT INTO person (id, first_name, last_name, dob, address) VALUES (13, 'fname23', 'lname23', str_to_date('9/12/1994', '%m/%d/%y'), '428 2nd St PA');
INSERT INTO person (id, first_name, last_name, dob, address) VALUES (14, 'fname24', 'lname24', str_to_date('1/19/1962', '%m/%d/%y'), '501 14th Av NJ');
INSERT INTO person (id, first_name, last_name, dob, address) VALUES (15, 'fname25', 'lname25', str_to_date('9/13/1993', '%m/%d/%y'), '541 7th Av PA');
INSERT INTO person (id, first_name, last_name, dob, address) VALUES (16, 'fname26', 'lname26', str_to_date('3/23/1994', '%m/%d/%y'), '840 2nd St NY');
INSERT INTO person (id, first_name, last_name, dob, address) VALUES (17, 'fname27', 'lname27', str_to_date('10/6/1971', '%m/%d/%y'), '971 4th St CT');
INSERT INTO person (id, first_name, last_name, dob, address) VALUES (18, 'fname28', 'lname28', str_to_date('3/7/1999', '%m/%d/%y'), '580 18th Av NY');
INSERT INTO person (id, first_name, last_name, dob, address) VALUES (19, 'fname29', 'lname29', str_to_date('3/26/1964', '%m/%d/%y'), '749 10th Av NJ');
INSERT INTO person (id, first_name, last_name, dob, address) VALUES (20, 'fname30', 'lname30', str_to_date('7/5/1989', '%m/%d/%y'), '294 8th Av NY');
INSERT INTO person (id, first_name, last_name, dob, address) VALUES (21, 'fname31', 'lname31', str_to_date('6/10/1992', '%m/%d/%y'), '184 3rd Av NY');
INSERT INTO person (id, first_name, last_name, dob, address) VALUES (22, 'fname40', 'lname40', str_to_date('2/12/1990', '%m/%d/%y'), '492 9th Av NJ');
INSERT INTO person (id, first_name, last_name, dob, address) VALUES (23, 'fname41', 'lname41', str_to_date('12/8/1982', '%m/%d/%y'), '219 5th Av NJ');
INSERT INTO person (id, first_name, last_name, dob, address) VALUES (24, 'fname42', 'lname42', str_to_date('7/5/1989', '%m/%d/%y'), '111 4th Av NY');
INSERT INTO person (id, first_name, last_name, dob, address) VALUES (25, 'fname43', 'lname43', str_to_date('6/10/1992', '%m/%d/%y'), '107 3rd Av CT');
INSERT INTO person (id, first_name, last_name, dob, address) VALUES (26, 'fname44', 'lname44', str_to_date('2/12/1990', '%m/%d/%y'), '301 6th Av NJ');
INSERT INTO person (id, first_name, last_name, dob, address) VALUES (27, 'fname45', 'lname45', str_to_date('12/8/1982', '%m/%d/%y'), '975 7th Av NJ');

INSERT INTO staff (person_id, emp_num, start_date, end_date, salary) VALUES (1, 'WZIAE', str_to_date('7/1/1965', '%m/%d/%y'), null,70000);
INSERT INTO staff (person_id, emp_num, start_date, end_date, salary) VALUES (2, 'EWEMU', str_to_date('11/18/1980', '%m/%d/%y'), str_to_date('12/26/1970', '%m/%d/%y'),80000);
INSERT INTO staff (person_id, emp_num, start_date, end_date, salary) VALUES (3, 'KJHSN', str_to_date('2/26/1991', '%m/%d/%y'), null,40000);
INSERT INTO staff (person_id, emp_num, start_date, end_date, salary) VALUES (4, 'UDFZR', str_to_date('8/1/1988', '%m/%d/%y'), null,450000);
INSERT INTO staff (person_id, emp_num, start_date, end_date, salary) VALUES (5, 'FGYPE', str_to_date('12/20/1971', '%m/%d/%y'), null,90000);
INSERT INTO staff (person_id, emp_num, start_date, end_date, salary) VALUES (6, 'XWHYQ', str_to_date('2/18/1995', '%m/%d/%y'), null,10000);
INSERT INTO staff (person_id, emp_num, start_date, end_date, salary) VALUES (7, 'JKBDV', str_to_date('7/4/1994', '%m/%d/%y'), null,60000);
INSERT INTO staff (person_id, emp_num, start_date, end_date, salary) VALUES (8, 'MAIIY', str_to_date('2/23/1998', '%m/%d/%y'), null,850000);
INSERT INTO staff (person_id, emp_num, start_date, end_date, salary) VALUES (9, 'XDRIW', str_to_date('2/19/1983', '%m/%d/%y'), null,950000);
INSERT INTO staff (person_id, emp_num, start_date, end_date, salary) VALUES (10, 'YQOAA', str_to_date('7/3/1971', '%m/%d/%y'), null,80000);
INSERT INTO staff (person_id, emp_num, start_date, end_date, salary) VALUES (11, 'UVBDD', str_to_date('7/19/1971', '%m/%d/%y'), null,50000);
INSERT INTO staff (person_id, emp_num, start_date, end_date, salary) VALUES (12, 'RGTEM', str_to_date('2/26/1997', '%m/%d/%y'), null,550000);
INSERT INTO staff (person_id, emp_num, start_date, end_date, salary) VALUES (13, 'SEUBO', str_to_date('12/10/1969', '%m/%d/%y'), null,850000);
INSERT INTO staff (person_id, emp_num, start_date, end_date, salary) VALUES (14, 'TZZRS', str_to_date('7/11/1966', '%m/%d/%y'), str_to_date('9/9/1997', '%m/%d/%y'),60000);
INSERT INTO staff (person_id, emp_num, start_date, end_date, salary) VALUES (15, 'QFNWW', str_to_date('10/8/1961', '%m/%d/%y'), null,10000);
INSERT INTO staff (person_id, emp_num, start_date, end_date, salary) VALUES (16, 'IPPNC', str_to_date('4/16/1984', '%m/%d/%y'), null,30000);
INSERT INTO staff (person_id, emp_num, start_date, end_date, salary) VALUES (17, 'QPIAA', str_to_date('11/12/1984', '%m/%d/%y'), null,60000);
INSERT INTO staff (person_id, emp_num, start_date, end_date, salary) VALUES (18, 'AJGIA', str_to_date('6/23/1978', '%m/%d/%y'), null,250000);
INSERT INTO staff (person_id, emp_num, start_date, end_date, salary) VALUES (19, 'QACIZ', str_to_date('11/23/1987', '%m/%d/%y'), null,80000);
INSERT INTO staff (person_id, emp_num, start_date, end_date, salary) VALUES (20, 'SLBUO', str_to_date('3/27/1991', '%m/%d/%y'), null,20000);
INSERT INTO staff (person_id, emp_num, start_date, end_date, salary) VALUES (24, '00000', str_to_date('2/3/1992', '%m/%d/%y'), null,0);
INSERT INTO staff (person_id, emp_num, start_date, end_date, salary) VALUES (25, '00001', str_to_date('5/21/1994', '%m/%d/%y'), null,0);
INSERT INTO staff (person_id, emp_num, start_date, end_date, salary) VALUES (26, '00002', str_to_date('7/19/1985', '%m/%d/%y'), null,0);
INSERT INTO staff (person_id, emp_num, start_date, end_date, salary) VALUES (27, '00003', str_to_date('9/7/2001', '%m/%d/%y'), null,0);

INSERT INTO building (id, code, name, address, manager_id) VALUES (1, 'XUAJ', 'Building 0', '121 5th St NJ', 1);
INSERT INTO building (id, code, name, address, manager_id) VALUES (2, 'PMCX', 'Building 1', '594 6th Av CT', 2);
INSERT INTO building (id, code, name, address, manager_id) VALUES (3, 'GLVS', 'Building 2', '228 14th St CT', 3);
INSERT INTO building (id, code, name, address, manager_id) VALUES (4, 'DWEH', 'Building 3', '811 2nd St PA', 4);
INSERT INTO building (id, code, name, address, manager_id) VALUES (5, 'HYDB', 'Building 4', '888 5th St NJ', 4);
INSERT INTO building (id, code, name, address, manager_id) VALUES (6, 'VWLG', 'Building 5', '488 20th Av CT', 5);
INSERT INTO building (id, code, name, address, manager_id) VALUES (7, 'DMRH', 'Building 6', '502 4th Av CT', 6);
INSERT INTO building (id, code, name, address, manager_id) VALUES (8, 'IWJJ', 'Building 7', '117 3rd Av PA', 7);
INSERT INTO building (id, code, name, address, manager_id) VALUES (9, 'WQKK', 'Building 8', '765 20th St NY', 8);
INSERT INTO building (id, code, name, address, manager_id) VALUES (10, 'POEI', 'Building 9', '213 17th Av PA', 9);
INSERT INTO building (id, code, name, address, manager_id) VALUES (11, 'JOIH', 'Building 10', '334 20th Av CT', 10);
INSERT INTO building (id, code, name, address, manager_id) VALUES (12, 'KDDP', 'Building 11', '913 18th St NJ', 11);
INSERT INTO building (id, code, name, address, manager_id) VALUES (13, 'XLED', 'Building 12', '295 13th St CT', 12);
INSERT INTO building (id, code, name, address, manager_id) VALUES (14, 'RCIU', 'Building 13', '394 15th Av PA', 14);
INSERT INTO building (id, code, name, address, manager_id) VALUES (15, 'GYHX', 'Building 14', '390 17th Av NJ', 15);

INSERT INTO employee (id, person_id, building_id) VALUES (1, 1, 1);
INSERT INTO employee (id, person_id, building_id) VALUES (2, 2, 2);
INSERT INTO employee (id, person_id, building_id) VALUES (3, 3, 3);
INSERT INTO employee (id, person_id, building_id) VALUES (4, 4, 4);
INSERT INTO employee (id, person_id, building_id) VALUES (5, 5, 5);
INSERT INTO employee (id, person_id, building_id) VALUES (6, 6, 6);
INSERT INTO employee (id, person_id, building_id) VALUES (7, 7, 7);
INSERT INTO employee (id, person_id, building_id) VALUES (8, 8, 8);
INSERT INTO employee (id, person_id, building_id) VALUES (9, 9, 9);
INSERT INTO employee (id, person_id, building_id) VALUES (10, 10, 10);
INSERT INTO employee (id, person_id, building_id) VALUES (11, 11, 11);
INSERT INTO employee (id, person_id, building_id) VALUES (12, 12, 12);
INSERT INTO employee (id, person_id, building_id) VALUES (13, 13, 13);
INSERT INTO employee (id, person_id, building_id) VALUES (14, 14, 14);
INSERT INTO employee (id, person_id, building_id) VALUES (15, 15, 15);
INSERT INTO employee (id, person_id, building_id) VALUES (16, 16, 1);
INSERT INTO employee (id, person_id, building_id) VALUES (17, 17, 2);
INSERT INTO employee (id, person_id, building_id) VALUES (18, 18, 3);
INSERT INTO employee (id, person_id, building_id) VALUES (19, 19, 4);
INSERT INTO employee (id, person_id, building_id) VALUES (20, 20, 5);
INSERT INTO employee (id , person_id, building_id) VALUES (2, 20, 2);
INSERT INTO employee (id , person_id, building_id) VALUES (3, 1, 3);
INSERT INTO employee (id , person_id, building_id) VALUES (4, 2, 4);
INSERT INTO employee (id , person_id, building_id) VALUES (5, 3, 5);
INSERT INTO employee (id , person_id, building_id) VALUES (6, 4, 6);
INSERT INTO employee (id , person_id, building_id) VALUES (7, 5, 7);
INSERT INTO employee (id , person_id, building_id) VALUES (8, 6, 8);
INSERT INTO employee (id , person_id, building_id) VALUES (9, 7, 9);
INSERT INTO employee (id , person_id, building_id) VALUES (10, 8, 10);
INSERT INTO employee (id , person_id, building_id) VALUES (11, 9, 11);
INSERT INTO employee (id , person_id, building_id) VALUES (12, 10, 12);
INSERT INTO employee (id , person_id, building_id) VALUES (13, 11, 13);
INSERT INTO employee (id , person_id, building_id) VALUES (14, 12, 14);
INSERT INTO employee (id , person_id, building_id) VALUES (15, 13, 15);
INSERT INTO employee (id , person_id, building_id) VALUES (16, 14, 1);
INSERT INTO employee (id , person_id, building_id) VALUES (17, 15, 2);
INSERT INTO employee (id , person_id, building_id) VALUES (18, 16, 3);
INSERT INTO employee (id , person_id, building_id) VALUES (19, 17, 4);
INSERT INTO employee (id , person_id, building_id) VALUES (20, 18, 5);
INSERT INTO employee (id , person_id, building_id) VALUES (21, 18, 4);


COMMIT;

-- Check Queries
SELECT "Building" AS "Table Name", COUNT(building.id) AS "Row Count"
FROM building
UNION
SELECT "Employee" AS "Table Name", COUNT(employee.id) AS "Row Count"
FROM employee
UNION
SELECT "Person" AS "Table Name", COUNT(person.id) AS "Row Count"
FROM person
UNION
SELECT "Staff" AS "Table Name", COUNT(staff.person_id) AS "Row Count"
FROM staff;
