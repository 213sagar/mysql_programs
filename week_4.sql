use university;
(select course_id from section where semester = 'Fall' and year = 2009)
union
(select course_id from section where semester = 'Spring' and year = 2010);
select * from section;
select * from instructor;

select distinct T.salary
from instructor as T, instructor as S
where T.salary < S.salary;

select distinct salary from instructor;

select * from instructor ;
select 5<null;
select null<> null ;


select avg(salary) from instructor where dept_name ='comp_sci';
select count(*) from course;
select * from course;

select  dept_name, avg(salary) as avg_salary
from instructor
group by  dept_name;

select  avg(salary) as avg_salary
from instructor;

select dept_name,avg(salary) from instructor
group by dept_name
having avg(salary)>42000;

select * from instructor;
select sum(salary) from instructor;

select distinct course_id
from section
where semester = 'Fall' and year= 2009 and
course_id in (select course_id
from section
where semester = 'Spring' and year= 2010);

select count(distinct(ID))
from takes
where (course_id, sec_id, semester, year) in
(select course_id, sec_id, semester, year
from teaches
where teaches.ID= 10101);

select name
from instructor
where salary > some (select salary
from instructor
where dept_name = 'Biology');

select name
from instructor
where salary > all (select salary
from instructor
where dept_name = 'Biology');

select course_id
from section as S
where semester = 'Fall' and year = 2009 and  exists 
(select * from section as T
where semester = 'Spring' and year= 2010
and S.course_id = T.course_id);

select dept_name, avg_salary
from (select dept_name, avg (salary)
from instructor
group by dept_name) as dept_avg (dept_name, avg_salary)
where avg_salary > 42000;






