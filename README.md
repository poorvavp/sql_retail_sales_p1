# sql_retail_sales_p1

**Objectives**
Set up a retail sales database: Create and populate a retail sales database with the provided sales data.
Data Cleaning: Identify and remove any records with missing or null values.
Exploratory Data Analysis (EDA): Perform basic exploratory data analysis to understand the dataset.
Business Analysis: Use SQL to answer specific business questions and derive insights from the sales data.

'''sql
CREATE DATABASE p1_retail_db;
'''


'''sql
CREATE TABLE retail_sales
(
    transactions_id INT PRIMARY KEY,
    sale_date DATE,	
    sale_time TIME,
    customer_id INT,	
    gender VARCHAR(10),
    age INT,
    category VARCHAR(35),
    quantity INT,
    price_per_unit FLOAT,	
    cogs FLOAT,
    total_sale FLOAT
);
'''


**DATA EXPLORATION**
'''sql
select * from sales_analysis
'''

1. **fetch total no. of rows present in the table**:
'''sql
select count(*) from sales_analysis;

2.  **find total customers from each gender**:
select gender, count(*) as total_customers from sales_analysis group by gender;


3. **sql query to find any null value in transactions_id column**: 
'''sql
select * from sales_analysis where transactions_id is NULL;
'''

4.  **finding any null values present in the dataset**: 
'''sql
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
    or total_sale is NULL;
'''

5. **deleting null value's column**:
'''sql
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
    or total_sale is NULL;
'''

 6. **how many sales record are present?**
'''sql
select count(*) as total_sales from sales_analysis;
'''

7. **how many total customers are there?**
'''sql
select count(distinct customer_id) as total_customers from sales_analysis;
'''

8. **unique categories**
select distinct category  from sales_analysis;




** BUSINESS PROBLEMS**

Q1  **sql query to retrieve all columns for sales made on '2022-11-05'**
'''sql
select * from sales_analysis where sale_date='2022-11-05';
'''

Q2 **sql query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of nov 2022**
'''sql
select * from sales_analysis 
where category = 'Clothing'
 and quantiy>10 
 and format (sale_date,'YYYY-MM') ='2022-11';
'''
 
  Q3 **find avg age of customers who purchased items from 'Beauty' category**
  '''sql
 select round(avg(age),2) from sales_analysis
 where category='Beauty';
'''

 Q4 **find all transactions where the total sales is greater than 1000**
 '''sql
 select * from sales_analysis where total_sale > 1000;
 '''

Q5 **find total number of transactions made by each gender in each caterory**
'''sql
select category, gender, count(*) as total_transactions 
 from sales_analysis
 group by category, gender;
'''

 Q6 **calculate the average sale for each month. find out best selling month in each year.**
 '''sql
 select * from sales_analysis where total_sale > (select * from sales_analysis avg(total_sale)) ;
'''

Q7 **find the top 5 customers based on the highest total sales**
'''sql
SELECT top 5
    customer_id,
    SUM(total_sale) as total_sales
FROM sales_analysis
GROUP BY customer_id
ORDER BY total_sales DESC;
'''

Q8 **find the 'number' of unique customers who purchased items from each category**
'''sql
SELECT 
    category,    
    COUNT(DISTINCT customer_id) as cnt_unique_cs
FROM sales_analysis
GROUP BY category;
'''







