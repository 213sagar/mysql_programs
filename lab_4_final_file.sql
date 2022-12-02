# Lab 4 - Database- Restaurant
create database restaurant;
use restaurant;
---------------

create table partof(mealid int, itemid int,
quantity float,discount varchar(50));
------------------------------

create table meals(mealid int, name varchar(10),
description varchar(50));
----------------------------
create table ads(slogan varchar(30));
-----------------------------------

create table menuitems(itemid int , name varchar(11),
price float , dateadded date);

--------------------
create table madewith(itemid int, ingredientid int, 
quantity float);

----------------------
create table ingredients(ingredientid int, name varchar(34), unit int, 
unitprice float, foodgroup varchar(5), inventory varchar(100), vendorid varchar
(30));

--------------
create table vendors(vendorid varchar(14), companyname varchar (20),
repfname varchar (30), replname varchar(13), referredby varchar(16));

----------------------
# inserting tuple into the tables
insert into  partof(mealid,itemid,quantity,discount)
values(101,1000,30,'20 Per'),
(102,1001,100,'56_per'),
(103,1002,1000,'78_per'),
(104,1003,150,'50_per'),
(105,1004,200,'16_per');

insert into meals( mealid,name,description)
values(101,'sara_gupta','this is our food palza'),
(102,'suresh_ji','this is our regular customer'),
(103,'prathmesh','he is living in indore'),
(104,'PRITI_pati','she is bery polite lady'),
(105,'Rashmi_vir','she is cooking food our restaurant');

insert into ads(slogan)
values('khao piyo or yesh karo'),
('Khayega india to badega india'),
('manchaha food item khao');


insert into menuitems(itemid,name,price,dateadded)
values(1000,'Pav_bhaji',100,'2002-05-25'),
(1001,'Samosa_jale',250,'2020-08-21'),
(1002,'RasMalaiRic',350,'2022-08-21'),
(1003,'Rotimithai',400,'2021-08-21'),
(1004,'Dosa_Idli',500,'2023-01-21');

insert into madewith(itemid,ingredientid,quantity)
values(1000,1,123),
(1001,2,5000),
(1002,3,250),
(1003,4,750),
(1004,5,150);

INSERT INTO ingredients(ingredientid, name, unit,unitprice,foodgroup,
inventory,vendorid)
values(1,'Potato',2,250,'Grape','1000','Bahubali'),
(2,'capcicum',10,80,'salad','150','Neera_bansala'),
(3,'Dahi',15,100,'south','1100','Jayshree'),
(4,'Panner',20,250,'veg','200','shweata'),
(5,'Patta_gobi',188,50,'Punja','500','Yudhishter');


insert into vendors(vendorid,companyname,repfname,replname,
referredby)
values('Bahubali','KGF','Virendra','Gupta','Bahubali'),
('Neera_bansala','Zomato','Suresh','Gupta','Neera_bansala'),
('Jayshree','swiggy','Nasir','Khilgi','Jayshree'),
('shweata','eggwid','Viren_dra','Gupta','shweata'),
('Yudhishter','zomato','Rakesh','Gupta','Yudhishter');
insert into vendors(vendorid,companyname,repfname,replname,
referredby)
VALUES('VGRUS','zomato','Rakesh','Gupta','VGRUS');


-----------------------------------------------------------
## adding  primary key on different tables 
alter table meals
add constraint pk_1 primary key(mealid);

alter table menuitems
add constraint pk_2 primary key(itemid);

alter table ingredients
add constraint pk_3 primary key(ingredientid);

alter table vendors
add constraint pk_4 primary key(vendorid);
--------------------------------------------------------------------
### adding foreign key on differnt table records

alter table partof
add constraint fk_1 foreign key(mealid) references meals(mealid);

alter table partof
add constraint fk_2 foreign key(itemid) references 
menuitems(itemid);

alter table madewith
add constraint fk_3 foreign key(itemid) references 
menuitems(itemid);

alter table madewith 
add constraint fk_4 foreign key(ingredientid) references
ingredients(ingredientid);

alter table ingredients
add constraint fk_5 foreign key(vendorid) references vendors(vendorid);

alter table vendors
add constraint fk_6 foreign key(referredby) references vendors(vendorid);

---------------------------------------------------------------------------------------
## Q.1 Find the ID of the vendor who supplies grape.
select ingredientid from ingredients
where foodgroup = 'grape';

# Q.2  Find all of the ingredients from the fruit food group with an inventory greater than 100 
select * from  ingredients
where inventory > 100;

# Q.3 Display all the food groups from ingredients, in which ‘grape’ is not a member.
select * from ingredients
where foodgroup <> 'grape';

# Q.4  Find the ingredients, unit price supplied by ‘VGRUS’(vendor ID) order by unit price(asc) 
select ingredientid, unitprice from ingredients
where vendorid = 'VGRUS'
ORDER BY unitPRICE asc;

# Q.5 find the date on which the last item was added.
select dateadded from menuitems order by dateadded desc;

# Q.6  Find the number of vendors each vendor referred, and only report the vendors referring more than
select referredby as vendors,count(referredby) as number_of_vendors from vendors group by 
referredby;

#  Q.7 Find the list of vendor representative first names that begin with ‘s’
select repfname from vendors where repfname like 's%';


# Q.8 Find all vendor names containing an ‘_’.
select companyname from vendors where companyname regexp'_';

# Q.9 Find the name of all of the food items other than salads.
select name from ingredients where name!='salads';

# Q.10 Find the ingredient ID, name, and unit of items not sold in pieces or strips.
select ingredientid,name,unit from ingredients where unit != 'piece' and unit != 'strips';

# Q.11 Find the details of all vendors not referred by anyone.
select * from vendors where referredby is null;

# Q.12 Find the average and total price for all items
select avg(price) as average_price,sum(price) as total_price from menuitems;

# Q. 13 Find the total number of ingredient units in inventory.
select sum(inventory) as total_unit from ingredients;

show tables;
select * from ingredients;
select * from madewith;
select * from meals;
select * from menuitems;
select * from partof;
select * from vendors;












