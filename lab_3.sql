# LAB 3
CREATE DATABASE lab_3;
use lab_3;
SHOW TABLES;

CREATE TABLE Employees (
EmployeeID numeric(9),
Firstname varchar(10),
Lastname varchar(20),
Deptcode char(5),
Salary numeric(9,2)
);
DESCRIBE Employees;

CREATE TABLE Departments (
Codee char(5),
Namee varchar(30),
Managerid numeric(9),
Subdeptof char(5)
);
DESCRIBE Departments;

CREATE TABLE Projects (
ProjectID char(8),
Firstname varchar(10),
Deptcode char(5),
Descriptionn varchar(200),
Startdate date,
Stopdate date,
Revenue numeric(12,2)
);
DESCRIBE Projects;

CREATE TABLE Workson (
EmployeeID numeric(9),
ProjectID char(8),
Assignedtime numeric(3,2)
);
DESCRIBE Workson;

INSERT INTO Employees(EmployeeID, Firstname, Lastname, Deptcode, Salary)
VALUES (101,'Paratham','Dhas','CS101',100000),
(102,'Rohit','Sharma','CS102',500000),
(103,'Surya','Yadaware','CS103',1000000),
(104,'Ishan','Kishan','CS104',75000);
SELECT * from Employees;

INSERT INTO Departments(Codee,Namee,Managerid,Subdeptof)
VALUES ('CS101','Kartik',101,'phy01'),
('CS102','Himesh',102,'phy02'),
('CS103','Ritesh',103,'phy03'),
('CS104','OM',104,null);
SELECT * from Departments;

INSERT INTO Projects(ProjectID,Firstname,Deptcode,Descriptionn,Startdate,stopdate,Revenue)
VALUES ('20200101','Prathamesh','CS101','Project based learning',"2000-01-01","2010-01-01",80000.00),
('20200102','Rohit','CS102','Pratical knowledge',"2000-02-01","2005-02-01",3000.00),
('20200103','Suryaa','CS103','Dupiu campus',"2011-02-01","2015-02-01",10000.00),
('20200104','Ishann','CS104','Industry Knowledge',"2015-02-01","2019-02-01",110000.00);
SELECT * from Projects;

INSERT 	INTO Workson(EmployeeID,ProjectID,Assignedtime)
VALUES(101,'20200101',6.32),
(102,'20200102',5.23),
(103,'20200103',9.52),
(104,'20200104',7.05);
SELECT * from Workson;

ALTER TABLE Employees
ADD PRIMARY KEY (EmployeeID);
DESCRIBE Employees;

ALTER TABLE Departments
ADD PRIMARY KEY (Codee);
DESCRIBE Departments;

ALTER TABLE Projects
ADD PRIMARY KEY (ProjectID);
DESCRIBE Projects;

ALTER TABLE Workson
ADD PRIMARY KEY (EmployeeID);
DESCRIBE Workson;

ALTER TABLE Employees
ADD FOREIGN KEY (Deptcode) REFERENCES Departments(codee);
DESCRIBE Employees;

ALTER TABLE Departments
ADD FOREIGN KEY (Managerid) REFERENCES Employees(EmployeeID);
DESCRIBE Departments;

ALTER TABLE Projects
ADD FOREIGN KEY (Deptcode) REFERENCES Departments(codee);
DESCRIBE Projects;

ALTER TABLE Workson
ADD FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID);
DESCRIBE Workson;


use lab_3;

# Question no. 1
SELECT Firstname , Lastname
FROM employees;

#Question2
SELECT * FROM Projects 
WHERE Revenue>40000;

# Questin 3 
SELECT Deptcode FROM Projects 
WHERE Revenue>100000 AND Revenue<150000;

# question 4
SELECT ProjectID FROM Projects 
WHERE Startdate<='2004-07-01';

# Question 5
SELECT Namee FROM Departments 
WHERE Subdeptof is NULL;

#Question 6 
SELECT ProjectID, Descriptionn FROM Projects 
WHERE Deptcode = 'ACCNT' OR 'CNSLT' OR 'HDWRE';

#Question 7
SELECT Lastname FROM Employees 
WHERE Length(Lastname)=8 and Lastname LIKE '%ware';

#Question 8
SELECT EmployeeID, Lastname FROM Employees 
WHERE deptcode ='ACTING' AND Salary<30000;

# Question 9
SELECT Startdate FROM Projects 
WHERE Startdate is NULL AND Revenue is NOT NULL;

# Question 10
SELECT ProjectID FROM Projects 
WHERE Deptcode = 'ACTING' AND Stopdate IS NULL AND Revenue >= 500000;

# Question 11
SELECT Firstname AS Name FROM Employees ;

# Question 12
SELECT DISTINCT Deptcode FROM Projects;

# Question 13
SELECT ProjectID, datediff(Stopdate, Startdate) FROM Projects;

# Question 14
SELECT ProjectID , datediff(Stopdate, Startdate) FROM Projects 
WHERE Stopdate is NULL AND Stopdate = curdate();

# Question 15
SELECT ProjectID, Revenue/datediff(Stopdate, Startdate) AS "Average Revenue"
FROM Projects WHERE Stopdate < curdate();

# Question 16
SELECT distinct extract(year FROM Startdate) FROM Projects;

# Question 17
SELECT Projects.ProjectID FROM Projects, Workson
WHERE Projects.ProjectID = Workson.ProjectID AND Assignedtime > 16.78;

# Question 18
SELECT EmployeeID, Assignedtime AS "PART TIME" 
FROM Workson WHERE Assignedtime < 0.33;

SELECT EmployeeID, Assignedtime AS "SPLIT TIME" 
FROM Workson WHERE Assignedtime <= 0.33 AND Assignedtime < 0.67;

SELECT EmployeeID, Assignedtime AS "FULL TIME" 
FROM Workson WHERE Assignedtime >=0.67;

# Question 19
SELECT CONCAT(upper(substring(Descriptionn,1,3)),"-",Deptcode) FROM Projects;

# Question 20
SELECT ProjectID, EXTRACT(YEAR FROM Startdate) 
FROM Projects ORDER BY Startdate ASC;

# Question 21
SELECT Lastname, Salary*(1+0.05) as "New Salary" 
FROM Employees WHERE "New Salary" > 50000;

# Question 22
SELECT EmployeeID, Firstname, Lastname, Salary*(1+0.10) AS "Next Year" 
FROM Employees WHERE Deptcode = "CS101";

# Question 23
SELECT Deptcode, Lastname, Firstname 
FROM Employees ORDER BY Deptcode ASC, Lastname ASC, Lastname ASC;

# Question 24
SELECT AVG(Salary) FROM Employees;

# Question 25
SELECT max(Revenue),min(Revenue) FROM Projects;

# Question 26
SELECT count(ProjectID) 
FROM Projects WHERE Stopdate < curdate();

# Question 27
SELECT count(ProjectID) 
FROM Projects 
WHERE Startdate <= curdate() OR Stopdate > curdate();

# Question 28
SELECT Lastname 
FROM Employees ORDER BY Lastname DESC LIMIT 1;

# Question 29
SELECT stddev(Salary) FROM Employees;

# Question 30
SELECT Salary*(1+0.10) as "New_Salary" 
FROM Employees WHERE Lastname!= '%re';

