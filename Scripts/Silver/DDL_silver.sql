/*
********************************************************************************
DDL SCRIPT: Silver tables
********************************************************************************
Script purpose:
     This script creates tables in the 'silver' schema, dropping existing tables
     if they already exist
     Run this script to re-define the DDL structure of 'Bronze' tables
********************************************************************************
*/



if object_id ('Silver.crm_cust_info', 'U') is not null
   drop table Silver.crm_cust_info;

Go

create table Silver.crm_cust_info
(
     cst_id int,
     cst_key nvarchar(50),
     cst_firstname nvarchar(50),
     cst_lastname nvarchar(50),
     cst_material_status nvarchar(50),
     cst_gndr nvarchar(50),
     cst_create_date date,
     dwh_create_date datetime2 default getdate()
);
Go

if object_id ('Silver.crm_prd_info', 'U') is not null
   drop table Silver.crm_prd_info;

Go

create table Silver.crm_prd_info
(
     prd_id int,
     prd_key nvarchar(50),
     prd_nm nvarchar(50),
     prd_cost int,
     prd_line nvarchar(50),
     prd_start_dt date,
     prd_end_dt date,
     dwh_create_date datetime2 default getdate()
);
Go

if object_id ('Silver.crm_sales_details', 'U') is not null
   drop table Silver.crm_sales_details;

Go

create table Silver.crm_sales_details
(
     sls_ord_num nvarchar(50),
     sls_prd_key nvarchar(50),
     sls_cust_id int,
     sls_order_dt int,
     sls_ship_dt int,
     sls_due_dt int,
     sls_sales int,
     sls_quantity int,
     sls_price int,
     dwh_create_date datetime2 default getdate()
);
Go

if object_id ('Silver.erp_cust_az12', 'U') is not null
   drop table Silver.erp_cust_az12;

Go

create table Silver.erp_cust_az12
(
     cid nvarchar(50),
     bdate date,
     gen nvarchar(50),
     dwh_create_date datetime2 default getdate()
);
Go

if object_id ('Silver.erp_loc_a101', 'U') is not null
   drop table Silver.erp_loc_a101;

Go

create table Silver.erp_loc_a101
(
     cid nvarchar(50),
     cntry nvarchar(50),
     dwh_create_date datetime2 default getdate()
);
Go

if object_id ('Silver.erp_px_cat_glv2', 'U') is not null
   drop table Silver.erp_px_cat_glv2;

Go

create table Silver.erp_px_cat_glv2
(
     id nvarchar(50),
     cat nvarchar(50),
     subcat nvarchar(50),
     maintenance nvarchar(50),
     dwh_create_date datetime2 default getdate()
);
Go
