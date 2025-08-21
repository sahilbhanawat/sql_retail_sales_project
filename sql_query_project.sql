create table retail_sales (
transactions_id int primary key,
sale_date date,
sale_time time ,
customer_id	int ,
gender 	varchar(6) ,
age	int ,
category varchar(15),
quantiy	int,
price_per_unit float,
cogs float,
total_sale float
);

select count(*) from retail_sales
select count (distinct customer_id ) from retail_sales
select distinct category from retail_sales

delete from retail_sales
where transactions_id is null or
sale_date is null or
sale_time is null or
customer_id	 is null or
gender is null or
age is null or
category is null or
quantiy	is null or
price_per_unit is null or
cogs is null or
total_sale is null

select * from retail_sales
where sale_date='2022-11-05'

select * from retail_sales
where category='Clothing'
and quantiy >= 4 
and to_char( sale_date , 'yyyy-mm' ) = '2022-11'

select category , sum(total_sale) from retail_sales
group by category

select  round(avg(age),2) from retail_sales
where category = 'Beauty'

select * from retail_sales
where total_sale > 1000

select category , gender ,count(transactions_id) from retail_sales
group by category, gender


select 
year , month , avg
from (
select 
EXTRACT(YEAR from sale_date) as year ,
EXTRACT(MONTH from sale_date) as month ,
avg(total_sale) ,
rank () over(partition by EXTRACT(YEAR from sale_date) order by avg(total_sale) desc) as rank
from retail_sales
group by  year , month)
where rank = 1

select customer_id , sum(total_sale) as total
from retail_sales
group by customer_id
order by total desc
limit 5

select category , count(distinct customer_id) as unique_customers
from retail_sales
group by 


select
count(transactions_id) as orders , shift
from (
select 
* ,
case 
when extract(hour from sale_time) < 12 then 'morning'
when extract(hour from sale_time) >= 12 and  extract(hour from sale_time)<= 17 then 'afternoon'
else 'evening'
end as shift
from retail_sales)
group by shift










