## Data Dictionary for Gold Layer.

# Overview:
The gold layer is the business-level data representation, structured to support analytical and reporting use cases.
It consists of *dimension tables* and *fact tables* for specific business metrics.

## 1. Gold.dimension_customers
------------------------------	
• *Purpose:* Stores customer details enriched with demographic and geographic data.
•*Columns:*

| Column name      | Data type     | Description                                                                 |
|------------------|---------------|-----------------------------------------------------------------------------|
| Customer_key     | INT           | Surrogate key uniquely identifying each customer record in the dimension table. |
---------------------------------------------------------------------------------------------------------------------
| Customer_id      | INT           | Unique numerical identifier assigned to each customer.                      |
-----------------------------------------------------------------------------------------------------------------
| Customer_number  | NVARCHAR(50)  | Alphanumeric identifier representing the customer, used for tracking and referencing. |
---------------------------------------------------------------------------------------------------------------------------
| First_name       | NVARCHAR(50)  | The customer's first name, as recorded in the system.                       |
-----------------------------------------------------------------------------------------------------------------
| Last_name        | NVARCHAR(50)  | The customer's last name or family name.                                    |
-----------------------------------------------------------------------------------------------------------------
| Country          | NVARCHAR(50)  | The country of residence for the customer (e.g., 'Australia').              |
-----------------------------------------------------------------------------------------------------------------
| Marital_status   | NVARCHAR(50)  | The marital status of the customer (e.g., 'Married', 'Single').             |
-----------------------------------------------------------------------------------------------------------------
| Gender           | NVARCHAR(50)  | The gender of the customer (e.g., 'Male', 'Female', 'N/A').                 |
-----------------------------------------------------------------------------------------------------------------
| Birth_date       | DATE          | The date of birth of the customer, formatted as YYYY-MM-DD (e.g., 1980-10-15). |
--------------------------------------------------------------------------------------------------------------------
| Create_date      | DATE          | The date and time when the customer record was created in the system.       |
-----------------------------------------------------------------------------------------------------------------

## 2. Gold.dimention_products
-----------------------------	
• *Purpose:* Provides information about the products and their attributes.
• *Culumns:*

| Column name     | Data type     | Description                                                                 |
|-----------------|---------------|-----------------------------------------------------------------------------|
| Product_key     | INT           | Surrogate key uniquely identifying each product record in the product dimension table. |
---------------------------------------------------------------------------------------------------------------------------
| Product_id      | INT           | A unique identifier assigned to the product for internal tracking and referencing. |
-----------------------------------------------------------------------------------------------------------------------
| Product_number  | NVARCHAR(50)  | A structured alphanumeric code representing the product, often used for categorization or inventory. |
-----------------------------------------------------------------------------------------------------------------------------------------
| Product_name    | NVARCHAR(50)  | Descriptive name of the product, including key details such as type, color, and size. |
--------------------------------------------------------------------------------------------------------------------------
| Category_id     | NVARCHAR(50)  | A unique identifier for the product's category, linking to its high-level classification. |
------------------------------------------------------------------------------------------------------------------------------
| Category        | NVARCHAR(50)  | The broader classification of the product (e.g., Bikes, Components) to group related items. |
--------------------------------------------------------------------------------------------------------------------------------
| Subcategory     | NVARCHAR(50)  | A more detailed classification of the product within the category, such as product type. |
-----------------------------------------------------------------------------------------------------------------------------
| Maintenance     | NVARCHAR(50)  | Indicates whether the product requires maintenance (e.g., 'YES', 'NO'). |
------------------------------------------------------------------------------------------------------------
| Cost            | INT           | The cost or base price of the product, measured in monetary units. |
-------------------------------------------------------------------------------------------------------
| Product_line    | NVARCHAR(50)  | The specific product line or series to which the product belongs (e.g., Road, Mountain). |
-----------------------------------------------------------------------------------------------------------------------------
| Start_date      | DATE          | The date when the product became available for sale or use. |
------------------------------------------------------------------------------------------------


## 3. Gold.fact_sales
----------------------
• *Purpose:* Stores transactional sales data for analytical purposes.
• *Columns:*

| Column name   | Data type     | Description                                                                 |
|---------------|---------------|-----------------------------------------------------------------------------|
| Order_number  | NVARCHAR(50)  | A unique alphanumeric identifier for each sales order (e.g., 'SO54496').    |
--------------------------------------------------------------------------------------------------------------
| Product_key   | INT           | Surrogate key linking the order to the PRODUCT dimension table.             |
--------------------------------------------------------------------------------------------------------------
| Customer_key  | INT           | Surrogate key linking the order to the CUSTOMER dimension table.            |
--------------------------------------------------------------------------------------------------------------
| Order_date    | DATE          | The date when the order was placed.                                         |
--------------------------------------------------------------------------------------------------------------
| Shipping_date | DATE          | The date when the order was shipped to the customer.                        |
--------------------------------------------------------------------------------------------------------------
| Due_date      | DATE          | The date when the order payment was due.                                    |
--------------------------------------------------------------------------------------------------------------
| Sales_amount  | INT           | The total monetary value of the sale for the line item, in whole currency units (e.g., 35). |
------------------------------------------------------------------------------------------------------------------------------
| Quantity      | INT           | The number of units of the product ordered for the line item (e.g., 1).     |
--------------------------------------------------------------------------------------------------------------
| Price         | INT           | The price per unit of the product for the line item, in whole currency units (e.g., 35). |
---------------------------------------------------------------------------------------------------------------------------
