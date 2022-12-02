show databases;
use  dbms;
select * from cat_dt;
create table Emp_Details(Name varchar(24), Age int, sex char(1), City char(8),Salary float);
insert into Emp_Details
values('Sagar',25,'M','Pichhore',35000),
('Suhani',14,'F','Shivpuri',40550),
('raghav',48,'M','Pune',45789);
select distinct city  from Emp_Details;
select count(name) as count from Emp_Details;
insert into Emp_Details values('tejas',10,'T','Pichhore',45789);
select avg(salary) from Emp_Details;
select name , age, city from emp_details;
describe emp_details;
select * from emp_details where age>30;
select name,sex,city from emp_details where sex='M';
select * from emp_details where city='pichhore' or city='pune';


select * from emp_details where city in ('pichhore','pune');
select name ,age,salary from emp_details where age between 10 and 25;

-- this code for And and Or Operator
select * from emp_details where age>=25 and sex='m';

drop database sagar;

-- Group Statement -  group by
select sex , sum(salary) from emp_details group by sex;

-- sorting in desending  way- Order By Commond
select * from emp_details order by salary;

select (10+20) as addition;
select (10-14) as sub;

select upper('india');
select lower('india');

select curdate();
select now();

# String Functions
select upper('RaghaV');
select lower('RaghaV');
select lcase('RaghSa');
select length('SAGAR') AS total_len;
select  concat('sagar', ' is' , " a", " good") as merged;
select reverse('merged');
select reverse(name) from emp_details;

select replace ('orange is a vegetable','vegetable','fruit') as replace_1; 
select length("            india   ");

# left Trim
select ltrim("            india      ");

select ascii('a');
select ascii(5);

create table employee_1(emp_id int primary key , emp_name varchar(25),
age int, gender char(1), doj date, department varchar(20), city varchar(20),
salary float);
desc employee_1;

insert into employee_1 
values(101,'Sagar',24,'M','2003-05-24','Marketing','pichhore',15000),
(102,'raj',30,'M','2005-06-25','selling','shivpuri',47822),
(103,'tejas',45,'M','2001-09-02','Networking','Mumbai',46579),
(104,'Ramesh',50,'M','2005-09-02','Cooking','Kalyan',6079),
(105,'Sarita',55,'F','2010-07-07','Talking','pichhore',20000),
(106,'Virendra',44,'M','2021-01-02','Data Administrator','Dubai',80000),
(107,'Rashmi',38,'F','2018-01-15','Selling','Ayodhya',46579),
(108,'Sagargupta',18,'M','2022-03-06','cooking','delhi',25789),
(109,'Ram',50,'M','2039-09-02','making','karera',45899),
(111,'Sahjadi',48,'F','2001-09-02','shopping','Khaniyadhana',65679),
(112,'Rani',29,'F','2000-09-02','sex','kk',65579);

select * from employee_1;
select distinct city from employee_1;

select distinct department from employee_1;

select avg(age) from employee_1;

# Group by  - I want avg age  in each department
select department, round(avg(age)) AS avg_age from employee_1
group by department;

# i want to find avg salary in each departement 
select department, avg(salary) as avg_salary from employee_1 
group by department; 

# i want to find full salary of each department
select department, sum(salary) as avg_salary from employee_1 
group by department; 

# group by and order by commomd both use parrally 
# order by = it is used to present number represent in the asssending way
# we want in desentnding order so we have to write desc along with order by

select count( emp_id) , city from employee_1
group by city
order by  count(emp_id) desc;


select count(emp_id), year (doj) from employee_1
group by doj
order by count(emp_id) desc;

# create table that is sales 
create table sale_1(sale_id int primary key, sell_price float, quantity int(20), state
varchar(20));
describe sale_1;
insert into sale_1
values (101,1000,50,'mp'),
(102,1050,60,'rajistan'),
(103,2000,100,'Pichhore'),
(104,1056,12,'Pune'),
(107,190,15,'Shivpuri'),
(90,190,175,'Shrinath'),
(91,30,80,'Rajshree');
describe sale_1;

select * from sale_1;
SELECT * FROM EMPLOYEE_1;

#  hAVING FUNCTION---- 
select department, avg(salary) as average_salary
from employee_1
group by salary
having avg(salary)>45000;

# we want to find those cities where salary is greater than 200000
select city, sum(salary) as total from 
employee_1
group by city
having sum(salary)>70000;

# find departmnet who have more than 2 employee
select department, count(*) from employee_1
group by department
having count(*)>=2;










