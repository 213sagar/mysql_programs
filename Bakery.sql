Create database Bakery_Shop_2112;
use Bakery_Shop_2112;

Create table customers(cid char(5),fname varchar(50),lname varchar(50));
Alter table customers ADD Primary key(cid);

Create table products(id char(5),flavour varchar(50),food varchar(50),price numeric(10));
ALTER TABLE products ADD Primary key(id);

Create table receipts(receipt_no numeric(10),rdate DATE,cid char(5));
Alter table receipts ADD primary key(receipt_no);
Alter table receipts ADD foreign key(cid) references customers(cid);

Create table itemlist(rno numeric(10),ordinal numeric(10),item char(5));
ALTER TABLE itemlist ADD foreign key(rno) references receipts(receipt_no);
Alter table itemlist ADD foreign key(item) references products(id);

DESCRIBE customers;
DESCRIBE products;
DESCRIBE receipts;
DESCRIBE itemlist;

insert into customers values(11111,'Harshal','Gujarathi');
insert into customers values(22222,'Chirag','Jain');
insert into customers values(33333,'Tanmay','Jha');
insert into customers values(44444,'Sonu','lokhande');
Select * from customers;

insert into products values('AAAAA','chocolate','meringue',50);
insert into products values('BBBBB','lemon','tart',60);
insert into products values('CCCCC','blueberry','bearclaw',15);
insert into products values('DDDDD','apple','pie',50);
Select * from products;

insert into receipts values(1,'2022-03-07',11111);
insert into receipts values(2,'2022-03-07',22222);
insert into receipts values(3,'2022-02-28',33333);
insert into receipts values(4,'2022-01-01',44444);
Select * from receipts;

insert into itemlist values(1,4,'AAAAA');
insert into itemlist values(2,2,'BBBBB');
insert into itemlist values(3,1,'CCCCC');
insert into itemlist values(4,5,'DDDDD');
Select * from itemlist;

Select distinct(food) from products where id not in (Select item from itemlist);

Select * from customers where cid in(Select cid from receipts group by rdate having Count(rdate)>=2);

Select * from products where id = (Select item from itemlist group by item order by count(item) DESC limit 1);

Select customers.cid,customers.fname,customers.lname,itemlist.rno,itemlist.item FROM customers inner join receipts
on receipts.cid = customers.cid inner join itemlist on itemlist.rno = receipts.receipt_no where item = (select item from itemlist
group by item order by count(*) ASC limit 1);

Select customers.cid,customers.lname,customers.fname, receipts.receipt_no,receipts.rdate from customers inner join receipts on 
receipts.cid=customers.cid where rdate = (select rdate from receipts order by rdate desc limit 1);
#7
Select customers.cid,customers.fname,customers.lname,itemlist.rno,itemlist.item from customers inner join receipts on 
receipts.cid = customers.cid inner join itemlist on itemlist.rno = receipts.receipt_no where item = (Select item from itemlist
group by item order by count(*) ASC limit 1);
#9
Select * From products where food='pie' UNION SELECT * FROM products where food = 'bearclaw';
#11
Select food from products where flavour in(Select flavour from products where food='tart' and food='meringue');
#13
Create view cheap_food as SELECT id,flavour,food,price from products where price<1;
Select * from cheap_food;
#15
Create view Pie_food as Select c.lname,p.flavour,r.receipt_no,r.rdate,i.ordinal from customers c,products p, receipts r,itemlist i
where p.food='pie' and c.cid=r.cid and i.item=p.id and i.rno=r.receipt_no;
Select * from Pie_food;