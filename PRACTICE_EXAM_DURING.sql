show databases;
use university;
show tables;

select name from instructor;
select distinct dept_name from instructor;
select '437';

select id,name,salary from instructor;
select * from instructor;
---------------------------- Cartian Product----------
select name,dept_name , salary from instructor
where salary > 72000 ;
select * from instructor , teaches;

select name,course_id from instructor,teaches 
where instructor.id = teaches.id;

select name from instructor;
------------------ middle element find
select name from instructor where name like '%vas%';
----------- begninng finding
select name from instructor where name like 'sri%';
select ascii('+');

select distinct name from instructor
order by name desc limit 5;

select * from department;
select dept_name, budget from department 
where budget between 80000 and 100000;
show tables;
select * from student;
select name, id , tot_cred from student 
where tot_cred = 0;
select max(tot_cred ),dept_name from student; 

select avg(salary) from instructor 
where dept_name ='physics';

select count(distinct id) as id
from teaches  where semester in('spring','2010'); 


select * from instructor;
select dept_name ,ROUND(avg(salary),1) as ave_salary FROM INSTRUCTOR
group by dept_NAME ;

select dept_name ,ROUND(avg(salary),1) as ave_salary FROM INSTRUCTOR
group by dept_NAME 
having avg(salary) >70000;