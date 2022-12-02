drop database mid_sem_case;
drop database if exists university_1;

create database dbms_Rat_12;
show databases;
use bakery_shop_2112;
show tables;
desc Drivers;
select * from drivers;

delete from drivers where address = 'ABCEFGH';



alter table  drivers  add sagar varchar(20);
alter table drivers add primary key(Driverid);

insert into drivers
values (56265965,'sagar',62486521,'ABCEFGH','wedfas');

set sql_safe_updates =1;
 
alter table drivers drop sagar;

show tables;
select * from products;
delete from products where id = 'AAAAA' ;
desc products;


USE DBMS;
SHOW TABLES;
CREATE TABLE DBMS_DP_PROJECT(S_NO NUMERIC,
SUBJECT_NAME VARCHAR(10), Teacher_Name varchar(20));

insert into DBMS_DP_PROJECT
values(1,'IIS','Bahubali Kutta'),
(2,'IIS','Bahubali Kutta'),
(3,'Om_pati','Suraj'),
(4,'Sytem so','Garima');

select * from DBMS_DP_PROJECT;


select Teacher_name, s_no from DBMS_DP_PROJECT
where Teacher_name like 'Bahu%';
alter table dbms_dp_project add salary numeric(10);

insert into DBMS_DP_PROJECT(SALARY)
VALUES(1000),
(20000),
(62215),
(55564);


select Teacher_name, s_no from DBMS_DP_PROJECT
group by Teacher_name;

select * from departments;

select name , subdeptof from departments
where managerid < 15;

select * from emp_details;
select * from product_1;


select items, Product_type from product_1
where sell_price <1000 and items like 'pu%';

use university;
show tables;
select * from instructor;


select * from instructor 
order by salary;
select id, name as n from instructor ;



----------------------
select concat(name, ' - ',dept_name) as name_with_dept from instructor;

----- done from the concate function ref as mysql_tut
