create database art_gallary;
use art_gallary;
create table paintings
(
id int,
pname varchar(20),
artist_id int,
listed_price decimal(10,2)
);

insert into paintings values(11,'miracle',1,300.00),(12,'sunshine',1,700.00),(13,'pretty women',2,2800.00),
(14,'handsome man',2,2300.00),(15,'barbie',3,250.00),(16,'cool painting',3,5000.00),
(17,'black square#1000',3,50.00),(18,'mountains',4,1300.00);
select * from paintings;

create table artists
(
id int,
first_name char(20),
last_name char(20)
);

insert into artists values(1,'thomas','black'),(2,'kate','smith'),(3,'natali','wein'),
(4,'francesco','benelli');
select * from artists;

create table sales
(
id int,
s_date date,
painting_id int,
artist_id int,
collector_id int,
sales_price decimal(10,2)
);

insert into sales values(1001,'2021-11-01',13,2,104,2500.00);
select * from sales;
insert into sales values(1002,'2021-11-10',14,2,102,2300.00),
(1003,'2021-11-10',11,1,102,300.00),
(1004,'2021-11-15',16,3,103,4000.00),
(1005,'2021-11-22',15,3,103,200.00),
(1006,'2021-11-22',17,3,103,50.00);
select * from sales;

create table collectors
(
id int,
first_name char(10),
last_name char(20)
);

insert into collectors values(101,'brandom','cooper'),(102,'laura','fisher'),
(103,'christina','buffet'),(104,'steve','stevenson');
select * from collectors;
use art_gallary;

select pname,listed_price from paintings where listed_price>(select avg(listed_price) from paintings);

select first_name,last_name from collectors where id in (select collector_id from sales);

SELECT artists.first_name,artists.last_name,artist_sales.sales from artists
JOIN (SELECT artist_id, SUM(sales_price) as sales from sales group by artist_id) as artist_sales
ON artists.id = artist_sales.artist_id;

SELECT first_name,last_name,(select count(*) from sales where collectors.id=sales.collector_id) as paintings from collectors;
  
SELECT first_name, last_name from artists
WHERE NOT EXISTS (select * from sales where sales.artist_id=artists.id);






























