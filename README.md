# SQL-Data-Warehouse-Project

Welcome to the **Data Warehouse and Analytics** repository!
This project demonstrates a comprehensive data warehousing and analytics solution, from building a data warehouse to generating actionable insights. Designed as a portfolio project highlights industry best practices in data engineering and analytics.

---

## Project Overview
### This project involves:

   1. *Data Architecture:* Designing a modern data warehouse using medalion architecture **Bronze**, **Silver**, and **Gold**                layers
   2. **ETL Pipelines:** Extracting, transforming, and loading data from source systems into the warehouse.
   3. **Data Modeling:** Developing fact and dimension tables optimized for analytical queries.
   4. **Analytics & Reporting:** Creating SQL-based reports and dashboards for actionable insights.

This repository is an excellent resource for professionals and students looking to showcase expertise in:

• **SQL Development**

• **Data Architect**

• **Data Engineering**

• **ETL Pipeline**

• **Data Modeling**

• **Data Analytics**

---

## Project Requirements.

### Building the data warehouse (data engineering).

#### Objective
develop a modern data warehouse using SQL server to consolidate sales, enabling analytical reporting and informed decision-making.

#### Specifications
- **Data sources:** import data from two source systems (ERP and CRM) provided as CSV files.
- **Data quality:** cleans and resolve data quality issues prior to analysis.
- **Integration:** combine both sources into a single, user-friendly data model designed for analytical queries.
- **Scope:** focus on the latest dataset only; historization of data is not required.
- **Documentation:** provide clear documentation of the data model to support both business stakeholders and analytics teams.

  ----

  ### BI: Analytics & Reporting (Data Analytics)

  #### Objective
  Develop SQL-based analytics to deliver detailed insights into:
  - **Consumer Behavior**
  - **Product Performance**
  - **Sales Trends**
 
    These insights empower stakeholders with key business metrics, enabling strategic decision-making.

    ----

### Data Architecture

The data architecture for this project follows medalion **Bronze**, **Silver**, and **Gold** layers:














<img width="414" height="441" alt="draw io 4" src="https://github.com/user-attachments/assets/c8a7b982-afec-4384-b8e3-02f1d2a2cb4a" />
















1. **Bronze Layer:** Stores raw data as-is from the source sysrems. Data is ingested from CSV files into SQL server database.

2. **Silver Layer:** This layer includes data cleansing, standardization, and normalization processes to prepare data for analysis.

3. **Gold Layer:** Houses business-ready data modeled into a star schema required for reporting and analytics.

 ----

## Repository Structure

data-warehouse-project/

├── datasets/                        # Raw datasets used for the project (ERP and CRM data)|
├── docs/                            # Project documentation and architecture details|
│   ├── ETL.drawio                   # Draw.io file shows all different techniques and methods of ETL|
│   ├── Data_architecture.drawio     # Draw.io file shows the project's architecture|
│   ├── Data_catalog.md              # Catalog of datasets, including field descriptions and metadata|
│   ├── Data_flow.drawio             # Draw.io file for the data flow diagram|
│   ├── Data_models.drawio           # Draw.io file for data models (star schema)|
│   └── Naming-conventions.md        # Consistent naming guidelines for tables, columns, and files|

├── scripts/                         # SQL scripts for ETL and transformations|
│   ├── Bronze/                      # Scripts for extracting and loading raw data|
│   ├── Silver/                      # Scripts for cleaning and transforming data|
│   └── Gold/                        # Scripts for creating analytical models|

├── tests/                           # Test scripts and quality files|
├── README.md                        # Project overview and instructions|
├── .gitignore                       # Files and directories to be ignored by Git|
└── requirements.txt                 # Dependencies and requirements for the project|

---

   ## About Me

   Hi there! I'm **ABDELLAH JAMAI**, and I'm a data analyst and a student in the English field. I'm passionate about learning data in an enjoyable and engaging way.

   
