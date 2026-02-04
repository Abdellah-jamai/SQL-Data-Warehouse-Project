

/* Analyze the yearly performance of products by comparing their sales to both
the average sales performance of the product and the previous year's sales */

with yearly_product_sales as (
select 
    year (f.order_date) as order_year,
    p.product_name,
    sum (f.sales_amount) as current_sales
from Gold.fact_sales f
left join Gold.dimension_products p
on f.product_key = p.product_key
where f.order_date is not null
group by  year (f.order_date), p.product_name
)
select
    order_year,
    product_name,
    current_sales,
avg (current_sales) over (partition by product_name) as avg_sales,
current_sales - avg (current_sales) over (partition by product_name) as diff_avg,
case when current_sales - avg (current_sales) over (partition by product_name) > 0 then 'above avg'
     when current_sales - avg (current_sales) over (partition by product_name) < 0 then 'below avg'
     else 'avg'
end avg_change,
lag(current_sales) over (partition by product_name order by order_year) previous_sales,
current_sales - lag(current_sales) over (partition by product_name order by order_year) as diff_previous_year,
case when current_sales - lag(current_sales) over (partition by product_name order by order_year) > 0 then 'Increase'
     when current_sales - lag(current_sales) over (partition by product_name order by order_year) < 0 then 'Decrease'
     else 'No change'
end previous_year_change
from yearly_product_sales
order by product_name, order_year

