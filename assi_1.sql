use sagar;
create table Category_details (category_id numeric (2), category_name varchar (30)); 
create table Sub_category_details (sub_category_id numeric (2),category_id numeric (2), sub_category_name varchar (30));
create table Product_details (Product_id numeric (6), category_id numeric(2),sub_category_id numeric(2), product_name varchar(30));
alter table Category_details
add primary key (category_id);
alter table Sub_category_details
add primary key (sub_category_id);
alter table Sub_category_details
add foreign key (category_id) references  Category_details(category_id);
alter table Product_details
add primary key(Product_id);
alter table Product_details
add foreign key (category_id) references Category_details(category_id);
alter table Product_details
add foreign key (sub_category_id) references Sub_Category_details(category_id);
alter table Product_details
add (price numeric(2));
alter table  Product_details
modify column price numeric(6,2);
alter table Product_details
drop column price;
describe Category_details;
insert into Category_details(category_id,category_name)
values(2,'sagar'),
(3,'suhana'),
(4,'raj'),
(5,'tanish');
select * from Category_details;
alter table Product_details
add (BRANDNAME varchar(20) not null);
RENAME TABLE  category_details to Cat_dt;



