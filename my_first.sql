show databases;
use mysql;
show tables;
select * from component;
create table DataStructure
(SerialNo int,
FirstName varchar(255),
LastName varchar(255),
SubjectName varchar(255));
select * from DataStructure;
insert into DataStructure
values(1,'sagar','gupta','python');
insert into DataStructure
values(2,'rahul','gupta','java');
insert into DataStructure
values(3,'Raj','gupta','c++');
insert into DataStructure
values(45,'sdhfd','dsdf','html');
select * from DataStructure;
select * from DataStructure
where FirstName='sagar';
select FirstName from DataStructure;


