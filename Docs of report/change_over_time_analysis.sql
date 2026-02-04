

-- Analyze sales performence over time --
select 
   month(order_date) as order_year,
   sum(sales_amount) as total_sales,
   count(distinct customer_key) as total_customers,
   sum(quantity) as total_quantity
from Gold.fact_sales
where order_date is not null
group by month(order_date)
order by month(order_date)

