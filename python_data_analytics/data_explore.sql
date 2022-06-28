-- Show first 10 rows
SELECT * FROM retail limit 10;

-- Check # of records
select count(*) 
from retail;

-- number of clients (e.g. unique client ID)
select count(distinct customer_id)  
from retail;

-- invoice date range (e.g. max/min dates)
select min(invoice_date), max(invoice_date) 
from retail;

-- number of SKU/merchants (e.g. unique stock code)
select count(distinct stock_code) 
from retail; 

-- Calculate average invoice amount excluding invoices with a negative amount (e.g. canceled orders have negative amount)
select avg(unit_price) 
from retail
	group by unit_price
	having (unit_price > 0);
	
-- Calculate total revenue (e.g. sum of unit_price * quantity)
select sum(unit_price*quantity) 
from retail;

-- Calculate total revenue by YYYYMM
select to_char(invoice_date,'YYYYMM')as yyyymm, sum(unit_price*quantity)
from retail 
group by 1
order by 1 asc;
