use lab_3;
-- show tables;
-- select * from departments;
-- -- select * from employees;
-- -- select * from projects;
-- -- select * from workson;
-- -- #-------------------------------------Q1
-- -- start transaction;
-- -- select max(Salary) from employees;
-- -- describe employees;
-- -- commit;

-- # Delete whose name those name start from y and save the changes using commit
-- -- Start transaction;

-- -- delete from employees where firstname like 'Y%';
-- -- select * from employees;
-- -- commit;
-- SET FOREIGN_KEY_CHECKS=0;
-- # Q	3
-- start transaction;

-- delete from employees where lastname like 'K%';
-- select * from employees;
-- rollback;

-- -- Q4
start transaction;
select * from departments;
delete   from departments  where subdeptof  is not null;
select * from departments;
commit;




