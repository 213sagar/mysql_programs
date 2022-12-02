drop database sagar;
drop database sagar1;
drop database sa1;
drop database student1;
show databases;
create database DBMS;
use DBMS;
create table Category_details(category_id numeric (2), category_name varchar (30));
select * from Category_details;
create table Sub_category_details (sub_category_id numeric(2), category_id numeric(2),sub_category_name varchar(30));
select * from Sub_category_details;
create table Product_details (Product_id numeric (6), category_id numeric(2),sub_category_id numeric(2), product_name varchar(30));
select* from Product_details;
alter table  Category_details
add primary key(category_id);
describe Category_details;
alter table  Sub_category_details
add primary key(sub_category_id );
describe Sub_category_details;
alter table Sub_category_details
add foreign key (category_id) references Category_details(category_id);
describe Sub_category_details;
alter table Product_details
add primary key(Product_id);
alter table Product_details
add foreign key (category_id) references Category_details(category_id);
alter table Product_details
add foreign key (sub_category_id) references Sub_Category_details(category_id);
describe Product_details;
alter table Product_details
add (price numeric(2));
select * from Product_details;
alter table Product_details
modify price numeric(6,2);
describe Product_details;
insert into Category_details
values(1,'sagar'),
(2,'suhana'),
(3,'raj'),
(4,'rahul');
select * from Category_details;
alter table Product_details
drop price;
alter table Product_details
add (BRANDNAME varchar(20) not null);
select * from Product_details;

rename table Category_details to Cat_dt ;
describe Cat_dt;





