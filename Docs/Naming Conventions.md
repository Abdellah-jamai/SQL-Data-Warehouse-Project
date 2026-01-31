
# Naming Conventions
This document outlines the naming conventions used for schemas, tables, views, columns, and other objects in the data warehouse.

---

## Table of Contents

1. General Principles
   
2. Table Naming Conventions
   
   **. Bronze Rules**
   
   **. Silver Rules**
   
   **. Gold Rules**
   
3.Column Naming Conventions

   **. Surrogate Keys**
   
   **. Technical Columns**
   
4. Stored Procedure

## General Principles

---

**Naming Conventions:** Use snake_case, with lowercase letters and underscores (_) to separate words.

**Language:** Use English for all names.

**Avoid Reserved Words:** Do not use SQL reserved words as object names.

## Table Naming Conventions

---

### Bronze Rules

**.** All names must start with the source system name, and table names must match their original names without renaming.

| Pattern               | Meaning                                                                 | Example                          |
|-----------------------|-------------------------------------------------------------------------|----------------------------------|
| `<sourcesystem>_<entity>` | Combination of source system name and exact table name from that system | crm_customer_info → Customer information from the CRM system |
| `<sourcesystem>`      | Name of the source system (e.g., crm, erp)                              | crm                              |
| `<entity>`            | Exact table name from the source system                                 | customer_info                    |

### Silver Rules

**.** All names must start with the source system name, and table names must match their original names without renaming.

| Pattern               | Meaning                                                                 | Example                          |
|-----------------------|-------------------------------------------------------------------------|----------------------------------|
| `<sourcesystem>_<entity>` | Combination of source system name and exact table name from that system | crm_customer_info → Customer information from the CRM system |
| `<sourcesystem>`      | Name of the source system (e.g., crm, erp)                              | crm                              |
| `<entity>`            | Exact table name from the source system                                 | customer_info                    |

### Gold Rules

**.** All names must use meaningful, business-aligned names for tables, starting with the category prefix.

| Pattern            | Meaning                                                                 | Example(s)                                      |
|--------------------|-------------------------------------------------------------------------|------------------------------------------------|
| `<category>_<entity>` | Combination of table role and descriptive business domain name            | dim_customers → Dimension table for customer data<br>fact_sales → Fact table containing sales transactions |
| `<category>`       | Describes the role of the table (e.g., dim for dimension, fact for fact) | dim, fact                                      |
| `<entity>`         | Descriptive name of the table, aligned with the business domain          | customers, products, sales                     |

### Glossary of Category Patterns

| Pattern   | Meaning           | Example(s)                          |
|-----------|-------------------|-------------------------------------|
| dim_      | Dimension table   | dim_customer, dim_product           |
| fact_     | Fact table        | fact_sales                          |
| report_   | Report table      | report_customers, report_sales_monthly |

## Column Naming Conventions

---

### Surrogate Keys

**.** All primary keys in dimension tables must use the suffix _key.

| Pattern          | Meaning                                                                 | Example                          |
|------------------|-------------------------------------------------------------------------|----------------------------------|
| `<table_name>_key` | Column naming convention where the suffix `_key` indicates a surrogate key | customer_key → Surrogate key in the dim_customers table |
| `<table_name>`   | Refers to the name of the table or entity the key belongs to             | customer                         |
| `key`            | Suffix showing that the column is a surrogate key                        | key                              |

### Technical Columns

---

**.** All technical columns must start with the prefix dwh_, followed by a descriptive name indicating the column's purpose.

| Pattern            | Meaning                                                                 | Example                          |
|--------------------|-------------------------------------------------------------------------|----------------------------------|
| `dwh_<column_name>` | Prefix used exclusively for system-generated metadata columns              | dwh_load_date → System-generated column used to store the date when the record was loaded |
| `dwh`              | Indicates the data warehouse prefix for metadata                         | dwh                              |
| `<column_name>`    | Descriptive name indicating the column's purpose                          | load_date                        |
 
## Stored Procedure

---

**.** All stored procedures used for loading data must follow the naming pattern:

| Pattern        | Meaning                                                        | Example(s)                                                   |
|----------------|----------------------------------------------------------------|--------------------------------------------------------------|
| `load_<layer>` | Naming convention for stored procedures that load data into a specific layer | .load_bronze → Stored procedure for loading data into the Bronze layer<br>.load_silver → Stored procedure for loading data into the Silver layer |
| `<layer>`      | Represents the layer being loaded (e.g., bronze, silver, gold) | bronze, silver, gold                                         |
