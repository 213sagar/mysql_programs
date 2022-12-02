create database mid_1;
use mid_1;
create table student(
	snum numeric(9,0) primary key,
	sname varchar(30),
	major varchar(25),
	standing varchar(2),
	age numeric(3,0)
	);
create table faculty(
	fid numeric(9,0) primary key,
	fname varchar(30),
	deptid numeric(2,0)
	);
create table class(
	name varchar(40) primary key,
	meets_at varchar(20),
	room varchar(10),
	fid numeric(9,0),
	foreign key(fid) references faculty(fid)
	);
create table enrolled(
	snum numeric(9,0),
	cname varchar(40),
	primary key(snum,cname),
	foreign key(snum) references student(snum),
	foreign key(cname) references class(name)
	);
create table emp(
	eid numeric(9,0) primary key,
	ename varchar(30),
	age numeric(3,0),
	salary numeric(10,2)
	);
create table dept(
	did numeric(2,0) primary key,
	dname varchar(20),
	budget numeric(10,2),
	managerid numeric(9,0),
	foreign key(managerid) references emp(eid)
	);
create table works(
	eid numeric(9,0),
	did numeric(2,0),
	pct_time numeric(3,0),
	primary key(eid,did),
	foreign key(eid) references emp(eid),
	foreign key(did) references dept(did)
	);
create table flights(
	flno numeric(4,0) primary key,
	origin varchar(20),
	destination varchar(20),
	distance numeric(6,0),
	departs date,
	arrives date,
	price numeric(7,2)
	);
create table aircraft(
	aid numeric(9,0) primary key,
	aname varchar(30),
	crusingrange numeric(6,0)
	);
create table employees(
	eid numeric(9,0) primary key,
	ename varchar(30),
	salary numeric(10,2)
	);
create table certified(
	eid numeric(9,0),
	aid numeric(9,0),
	primary key(eid,aid),
	foreign key(eid) references employees(eid),
	foreign key(aid) references aircraft(aid)
	);
create table suppliers(
	sid numeric(9,0) primary key,
	sname varchar(30),
	address varchar(40)
	);
create table parts(
	pid numeric(9,0) primary key,
	pname varchar(40),
	color varchar(15)
	);
create table catalog(
	sid numeric(9,0),
	pid numeric(9,0),
	cost numeric(10,2),
	primary key(sid,pid),
	foreign key(sid) references suppliers(sid),
	foreign key(pid) references parts(pid)
	);
create table sailors(
	sid numeric(9,0) primary key,
	sname varchar(30),
	rating numeric(2,0),
	age numeric(4,1)
);

describe suppliers;
describe parts;
describe catalog;

insert into suppliers values( 1,'Acme Widget Suppliers','1 Grub St. Potemkin Village');  
insert into suppliers values(2,'Big Red Tool and Die','4 My Way, Bermuda Shorts'); 
insert into suppliers values(3,'Perfunctory Parts','99999 Short Pier, Terra Del Fuego'); 
insert into suppliers values(4,'Alien Aircaft Inc.','2 Groom Lake, Rachel');  
#parts
insert into parts values(1,'Left Handed Bacon Stretcher Cover', 'Red');
insert into parts values(2,'Smoke Shifter End','Black');
insert into parts values(3,'Acme Widget Washer','Red');
insert into parts values(4,'Acme Widget Washer','Silver');
insert into parts values(5,'I Brake for Crop Circles Sticker','Translucent');
insert into parts values(6,'Anti-Gravity Turbine Generator','Cyan');
insert into parts values(7,'Anti-Gravity Turbine Generator','Magenta');
insert into parts values(8,'Fire Hydrant Cap','Red');
insert into parts values(9,'7 Segment Display','Green'); 
#catalog
insert into catalog values(1,3,0.50);
insert into catalog values(1,4,0.50);
insert into catalog values(1,8,11.70);
insert into catalog values(2,3,0.55);
insert into catalog values(2,8,7.95);
insert into catalog values(2,1,16.50);
insert into catalog values(3,8,12.50);
insert into catalog values(3,9,1.00);
insert into catalog values(4,5,2.20);
insert into catalog values(4,6,1247548.23);
insert into catalog values(4,7,1247548.23);


#Q.1
select suppliers.sname from suppliers where sid in (
	select sid from catalog where pid in ( select pid from parts where color='Red'));
    
# Q.2
select suppliers.sid from suppliers where sid in  
( select sid from catalog where pid in  
(select pid from parts where color='Red' or color='Green') 
); 

----------------------------------------------------



insert into emp
values (142519864,'Susan Martin',39,56990),
(242518965,'James Smith',68,27099),
(141582651,'Mary Johnson',44,94011),
(011564812,'John Williams',35,74098),
(254099823,'Patricia Jones',28,42783),
(356187925,'Robert Brown',28,35431),
(489456522,'Linda Davis',26,25971),
(287321212,'Michael Miller',62,131072),
(248965255,'Barbara Wilson',48,95021),
(159542516,'Matt Nelson',33,48990),
(090873519,'Elizabeth Taylor',27,33055),
(486512566,'David Anderson',20,25199),
(619023588,'Jennifer Thomas',24,34654),
(112348546,'Joseph Thompson',26,24998),
(115987938,'Christopher Garcia',60,24998),
(132977562,'Angela Martinez',31,24998),
(269734834,'Rick Carter',38,249980),
(280158572,'Margaret Clark',40,24998),
(301221823,'Juan Rodriguez',30,32175),
(318548912,'Ann Mitchell',23,32175);

insert into aircraft values(1,'Boeing 747-400',8430);
insert into aircraft values(2,'Boeing 737-800',3383);
insert into aircraft values(3,'Airbus A340-300',7120);
insert into aircraft values(4,'British Aerospace Jetstream 41',1502);
insert into aircraft values(5,'Embraer ERJ-145',1530);
insert into aircraft values(6,'SAAB 340',2128);
insert into aircraft values(7,'Piper Archer III',520);
insert into aircraft values(8,'Tupolev 154',4103);
insert into aircraft values(16,'Schwitzer 2-33',30);
insert into aircraft values(9,'Lockheed L1011',6900);
insert into aircraft values(10,'Boeing 757-300',4010);
insert into aircraft values(11,'Boeing 777-300',6441);
insert into aircraft values(12,'Boeing 767-400ER',6475);
insert into aircraft values(13,'Airbus A320',2605);
insert into aircraft values(14,'Airbus A319',1805);
insert into aircraft values(15,'Boeing 727',1504);



insert into employees
values
(242518965,'James Smith',120433),
(141582651,'Mary Johnson',178345),
(011564812,'John Williams',153972),
(567354612,'Lisa Walker',256481),
(552455318,'Larry West',101745),
(550156548,'Karen Scott',205187),
(390487451,'Lawrence Sperry',212156),
(274878974,'Michael Miller',99890),
(254099823,'Patricia Jones',24450),
(356187925,'Robert Brown',44740),
(355548984,'Angela Martinez',212156);


insert into certified
values
(567354612,1),
(567354612,10),
(567354612,11),
(567354612,12),
(567354612,15),
(567354612,7),
(567354612,9),
(567354612,3),
(567354612,4);
#Q.2
SELECT E.ename
FROM certified C, Employees E, Aircraft A
WHERE A.aid = C.aid AND E.eid = C.eid AND
A.crusingrange>3000
AND E.eid NOT IN (SELECT C2.eid
FROM Certified C2, Aircraft A2
WHERE C2.aid = A2.aid AND A2.aname = 'Boeing');

drop database mid1;
show tables;
select * from aircraft;