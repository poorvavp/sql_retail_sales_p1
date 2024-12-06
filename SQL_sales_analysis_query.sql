
-- SQL RETAIL SALES ANALYSIS 

use practice

select * from sales_analysis

-- fetch total no. of rows present in the table
select count(*) from sales_analysis

-- find total customers from each gender
select gender, count(*) as total_customers from sales_analysis group by gender



-- sql query to find any null value in transactions_id column
select * from sales_analysis where transactions_id is NULL

-- finding any null values present in the dataset
select * from sales_analysis 
  where transactions_id is NULL
  or sale_date is NULL 
  or sale_time is NULL 
  or customer_id is NULL
    or gender is NULL
  or age is NULL
  or category is NULL
    or quantiy is NULL
  or price_per_unit is NULL
  or cogs is NULL
    or total_sale is NULL

-- deleting null value's column
delete from sales_analysis 
  where transactions_id is NULL
  or sale_date is NULL 
  or sale_time is NULL 
  or customer_id is NULL
    or gender is NULL
  or age is NULL
  or category is NULL
    or quantiy is NULL
  or price_per_unit is NULL
  or cogs is NULL
    or total_sale is NULL

-- how many sales record are present?
select count(*) as total_sales from sales_analysis

-- how many total customers are there?
select count(distinct customer_id) as total_customers from sales_analysis

-- unique categories
select distinct category  from sales_analysis




-- BUSINESS PROBLEMS

-- Q1  sql query to retrieve all columns for sales made on '2022-11-05'

select * from sales_analysis where sale_date='2022-11-05'


-- Q2 sql query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of nov 2022

select * from sales_analysis 
where category = 'Clothing'
 and quantiy>10 
 and format (sale_date,'YYYY-MM') ='2022-11'

 -- Q3 find avg age of customers who purchased items from 'Beauty' category
 select round(avg(age),2) from sales_analysis
 where category='Beauty'


 -- Q4 find all transactions where the total sales is greater than 1000
 select * from sales_analysis where total_sale > 1000
 

-- Q5 find total number of transactions made by each gender in each caterory
select category, gender, count(*) as total_transactions 
 from sales_analysis
 group by category, gender


 -- Q6 calculate the average sale for each month. find out best selling month in each year. 
 
 select * from sales_analysis where total_sale > (select * from sales_analysis avg(total_sale)) 


-- Q7 find the top 5 customers based on the highest total sales 

SELECT top 5
    customer_id,
    SUM(total_sale) as total_sales
FROM sales_analysis
GROUP BY customer_id
ORDER BY total_sales DESC


-- Q8 find the 'number' of unique customers who purchased items from each category

SELECT 
    category,    
    COUNT(DISTINCT customer_id) as cnt_unique_cs
FROM sales_analysis
GROUP BY category


