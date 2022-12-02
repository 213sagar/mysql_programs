create database Sagar_Bakery_Shop;
use sagar_bakery_shop;
----------------
create table customers(cid numeric (20), fname varchar(20),laname varchar (15));

create table products (pid numeric (10),flavor varchar(20), food varchar(15),price numeric(5));

create table receipts(rno numeric(8),rdate date, cid numeric(7));

create table item_lists(rno numeric(5), ordinal varchar (20), item varchar (150));

--------------------------------------------------------
# insert data into the tables
insert into customers(cid,fname,laname)
values(100,'Sagar','Gupta'),
(101,'raj','lodhi'),
(102,'Raghav','luthra'),
(103,'mohan','bhagvat'),
(104,'diuekjd','bhddd'),
(106,'yukti','gypta');

insert into products( pid , flavor , food, price)
values(11111,'Apple', 'Apple_cake', 250),
(22222,'mango', 'cake', 50),
(33333,'Butterscotch', 'Tart', 20),
(44444,'', 'cake_orange', 09),
(55555,'tart', 'Bear_claw', 30),
(66666,'soft', 'pie', 100),
(77777,'Chhezy', 'Pizza', 350);

insert into receipts(rno,rdate,cid)
values(123,'2020-05-21',100),
(124,'2020-05-21',101),
(125,'2020-1-18',102),
(126,'2022-03-06',103),
(127,'2022-05-21',104),
(128,'2021-01-26',105);

insert into item_lists(rno,ordinal,item)
values (123,'Fish' 'Cuury',11111),
(124,'VadaPav' "Roti pav",22222),
(125,'alu paratha' 'gobi',33333),
(126,'dalRoti' 'cake',44444),
(127,'Toant' 'Pav',55555),
(128,'White bread ' 'pav',66666),
(129,'pav' 'biscuit',77777);

show tables ;
select * from customers;
select * from item_lists;
select * from products;
select * from receipts;

# Define the primary key ---------------
alter table customers 
add constraint pk_1 primary key(cid);

alter table customers 
add constraint pk_1 primary key(cid);

