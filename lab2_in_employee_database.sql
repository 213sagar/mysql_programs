create database employee;
use employee;
create table employees(employeeid numeric (9), firstname varchar(10),
lastname varchar(20), deptcode char(5), salary numeric(9,2));
create table departments(code char (5), name varchar(30),
managerid numeric(9),
subdeptof char(5));

create table projects(projectid char(8),
deptcode char(5),
description varchar(200),
startdate date,
stopdate date,
revenue numeric(12,2));

create table workson (employeeid numeric(9),
projectid char(8),
assignedtime numeric(3,2));

alter table employees add constraint PK primary key(employeeid);
alter table departments add constraint PK primary key(code);
alter table projects add constraint PK primary key(projectid);


alter table employees add constraint FK foreign key(deptcode) references departments(code);
alter table departments add constraint FK_1 foreign key(managerid) references employees(employeeid);

alter table departments add constraint FK_2 foreign key(subdeptof) references departments(code);
alter table projects add constraint FK_3 foreign key(deptcode) references departments(code);
alter table workson add constraint FK_4 foreign key(employeeid) references employees(employeeid);
alter table workson add constraint FK_5 foreign key(projectid) references projects(projectid);


