create database employees_mid2;
use employees_mid2;

CREATE TABLE employees (
    emp_no      INT             NOT NULL,
    birth_date  DATE            NOT NULL,
    first_name  VARCHAR(14)     NOT NULL,
    last_name   VARCHAR(16)     NOT NULL,
    gender      ENUM ('M','F')  NOT NULL,    
    hire_date   DATE            NOT NULL,
    PRIMARY KEY (emp_no)
);

CREATE TABLE departments (
    dept_no     CHAR(4)         NOT NULL,
    dept_name   VARCHAR(40)     NOT NULL,
    PRIMARY KEY (dept_no),
    UNIQUE  KEY (dept_name)
);

CREATE TABLE dept_manager (
   emp_no       INT             NOT NULL,
   dept_no      CHAR(4)         NOT NULL,
   from_date    DATE            NOT NULL,
   to_date      DATE            NOT NULL,
   FOREIGN KEY (emp_no)  REFERENCES employees (emp_no)    ON DELETE CASCADE,
   FOREIGN KEY (dept_no) REFERENCES departments (dept_no) ON DELETE CASCADE,
   PRIMARY KEY (emp_no,dept_no)
); 

CREATE TABLE dept_emp (
    emp_no      INT             NOT NULL,
    dept_no     CHAR(4)         NOT NULL,
    from_date   DATE            NOT NULL,
    to_date     DATE            NOT NULL,
    FOREIGN KEY (emp_no)  REFERENCES employees   (emp_no)  ON DELETE CASCADE,
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no) ON DELETE CASCADE,
    PRIMARY KEY (emp_no,dept_no)
);

CREATE TABLE titles (
    emp_no      INT             NOT NULL,
    title       VARCHAR(50)     NOT NULL,
    from_date   DATE            NOT NULL,
    to_date     DATE,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ON DELETE CASCADE,
    PRIMARY KEY (emp_no,title, from_date)
); 

CREATE TABLE salaries (
    emp_no      INT             NOT NULL,
    salary      INT             NOT NULL,
    from_date   DATE            NOT NULL,
    to_date     DATE            NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ON DELETE CASCADE,
    PRIMARY KEY (emp_no, from_date)
    );

INSERT INTO employees VALUES (10007,'1957-05-23','Tzvetan','Zielinski','F','1989-02-10'),
								(10008,'1958-02-19','Saniya','Kalloufi','M','1994-09-15'),
								(10009,'1952-04-19','Sumant','Peac','F','1985-02-18'),
								(10022,'1952-07-08','Shahaf','Famili','M','1995-08-22');
                                
INSERT INTO departments VALUES ('d004','Production'),
							   ('d005','Development'),
							   ('d006','Quality Management');
                               
INSERT INTO dept_manager VALUES (110114,'d002','1989-12-17','9999-01-01'),
							    (110183,'d003','1985-01-01','1992-03-21'),
								(110228,'d003','1992-03-21','9999-01-01');
                                
INSERT INTO dept_emp VALUES (10007,'d008','1989-02-10','9999-01-01'),
							  (10008,'d005','1998-03-11','2000-07-31'),
							  (10009,'d006','1985-02-18','9999-01-01'),
							  (10010,'d004','1996-11-24','2000-06-26');
                              
INSERT INTO titles VALUES (10005,'Staff','1989-09-12','1996-09-12'),
						  (10006,'Senior Engineer','1990-08-05','9999-01-01'),
						  (10007,'Senior Staff','1996-02-11','9999-01-01'),
						  (10007,'Staff','1989-02-10','1996-02-11');
                          
INSERT INTO salaries VALUES (201773,48686,'1993-05-07','1994-05-07'),
						    (201773,52568,'1994-05-07','1995-05-07'),
						    (201773,55796,'1995-05-07','1996-05-06'),
							(201773,57282,'1996-05-06','1997-05-06');
                            
select * from employees;
select * from departments;
select * from dept_manager;
select * from dept_emp;
select * from titles;
select * from salaries;