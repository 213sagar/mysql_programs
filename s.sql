create database case_study;
use case_study;
show tables;
select * from tr_orderdetails;

# Q1 find max quantity in the order_details table
select  max(quantity)
from tr_orderdetails;

# Q2
select distinct productid from tr_orderdetails;

# q3
select quantity,productid from 
tr_orderdetails
where productid=3
order by productid asc;

# q4
 select distinct propertyid from tr_orderdetails;
 
 #Q5
 select productcategory, count(*)
 
 from  tr_products
 group by productcategory 
;
 
 
