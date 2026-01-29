
/* 
===========================================================================================
DDL script: Create Gold Views
===========================================================================================
Script Purpose:
       This script creates views for the Gold layer in the data warehouse.
       The Gold layer represents the final dimension and fact tables (star schema)

       Each view performs transformations and combines data from the Silver layer
       to product a clean, enriched, and business-ready datset.


Usage:
       - These views can be queried directly for analytics and reporting.
===========================================================================================

*/


-- ========================================================================================
-- Create Dimension: Gold.dimension_customers
-- ========================================================================================

if object_id ('Gold.dimension_customers', 'V') IS NOT NULL
   DROP VIEW Gold.dimension_customers;

GO

create view Gold.dimension_customers as
select 
      row_number() over (order by cst_id) as customer_key,   -- surrogate key
      ci.cst_id as customer_id,
      ci.cst_key as customer_number,
      ci.cst_first_name as first_name,
      ci.cst_last_name as last_name,
      la.country,
      ci.cst_marital_status as marital_status,
case when ci.cst_gender != 'N/A' then ci.cst_gender -- CRM is the master for gender integration --
     else coalesce (ca.gender, 'N/A')
end as gender,
      ca.birth_date,
      ci.cst_create_date as create_date   
from Silver.crm_cust_info ci
left join Silver.erp_cust_az12 ca
on    ci.cst_key = ca.cid
left join Silver.erp_loc_a101 la
on    ci.cst_key = la.cid
GO;

if object_id ('Gold.dimension_products', 'V') IS NOT NULL
   DROP VIEW Gold.dimension_products;

GO

create view Gold.dimension_products as
select 
row_number() over (order by pn.product_start_date, pn.product_key) as product_key,   -- Surrogate key
      pn.product_id,
      pn.product_key as product_number,
      pn.product_name,
      pn.category_id,
      pc.category,
      pc.subcategory,
      pc.maintenance,
      pn.product_cost as cost,
      pn.product_line,
      pn.product_start_date as start_date
from Silver.crm_prd_info pn
left join Silver.erp_px_cat_glv2 pc
on pn.category_id = pc.id
where product_end_date is null   -- filter out all historical date --
GO;

if object_id ('Gold.fact_sales', 'V') IS NOT NULL
   DROP VIEW Gold.fact_sales;

GO

create view Gold.fact_sales as
select 
      sd.sls_order_number as order_number,
      pr.product_key,
      cu.customer_key,
      sd.sls_order_date as order_date,
      sd.sls_ship_date as shipping_date,
      sd.sls_due_date as due_date,
      sd.sls_sales as sales_amount,
      sd.sls_quantity as quantity,
      sd.sls_price as price
from Silver.crm_sales_details sd
left join Gold.dimension_products pr
on sd.sls_product_key = pr.product_number
left join Gold.dimension_customers cu
on sd.sls_customer_id = cu.customer_id
GO;
