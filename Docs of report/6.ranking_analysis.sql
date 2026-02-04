
-- Which 5 products generate the highest revenue?
select top 5
     p.product_name,
     sum(f.sales_amount) total_revenue
from Gold.fact_sales f
left join Gold.dimension_products p
on p.product_key = f.product_key
group by p.product_name
order by total_revenue desc


-- What are the 5 worst-performing products in terms of sales?
select top 5
     p.product_name,
     sum(f.sales_amount) total_revenue
from Gold.fact_sales f
left join Gold.dimension_products p
on p.product_key = f.product_key
group by p.product_name
order by total_revenue 

-- Find the top 10 customers who have generated the highest revenue
select top 10
     c.customer_key,
     c.first_name,
     c.last_name,
     sum(f.sales_amount) as total_revenue
from Gold.fact_sales f
left join Gold.dimension_customers c
on c.customer_key = f.customer_key
group by
     c.customer_key,
     c.first_name,
     c.last_name
order by total_revenue desc

-- the 3 customers with the fewest orders placed
select top 3
     c.customer_key,
     c.first_name,
     c.last_name,
     count(distinct order_number) as total_orders
from Gold.fact_sales f
left join Gold.dimension_customers c
on c.customer_key = f.customer_key
group by
     c.customer_key,
     c.first_name,
     c.last_name
order by total_orders 
