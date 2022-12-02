create database  VehicleFleet1;
use VehicleFleet1;
create table vehicle(model_no varchar(10), Model_name varchar(10), 
Engine_type varchar(10), Color varchar (8), Price numeric(10));

insert into vehicle
values('1dfe678','Bmw','Mastro','Red',10000000),
('1dfe898','Swipt','V-engin','Blue',1800000),
('1r323e678','Auto','flat','Purple',5000200),
('458975wrT','Honda','Three_cyn','bleack',550000),
('1dfeuii8','Hero','Gas','white',850000),
('1d335678','Ismart','mixed_gas','Yello',550080);

select * from vehicle;
describe vehicle;

create table drivers(Driverid numeric,driver_name varchar(20),mob_no numeric,
address varchar(30));
insert into drivers
values(123,'bmw',10000000,'kankane'),
(124,'swipt',1800000,'kankaneJ'),
(125,'auto',5000200,'kankanji'),
(126,'honda',550000,'kaneMan'),
(127,'hero',850000,'Mumbai'),
(128,'Ismart',550080,'delhi');

select * from drivers;
desc drivers;

create table manufactures(man_name varchar(20),man_id varchar (20),cus_name varchar(10),
mob numeric(10));
select * from manufactures;
insert into manufactures
values('sagar','12457','suhana',10000000),
('suhana','18228','Omkar_nak',1800000),
('sagar_1','124963','amahesh',5000200),
('Narendra','124565','Mohan',550000),
('Sono','124csx','Ram',850000),
('ram','1245vff','Sarika',5500800);
drop table manufactures;
show tables;

create table driver_license(dri_name varchar (10), driver_id numeric(10));
insert into driver_license
values('om_pati',123),
('Shreash',124),
('om_pai',125),
('Prashatsin',126),
('Pramod',127),
('vaishnav',128);



---------------- update the primary and foriegn key
alter table vehicle add primary key(price);
alter table driver_license add primary key(dri_name); 
alter table drivers add primary key(driverid);

ALTER TABLE drivers ADD foreign key(mob_no) references vehicle(price);
ALTER TABLE driver_license ADD foreign key(driver_id) references drivers(driverid);

select * from drivers;
select * from vehicle;
select * from driver_license;
select * from manufactures;