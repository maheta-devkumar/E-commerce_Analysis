# Olist E-Commerce Analytics Dashboard

An end-to-end e-commerce analytics project built using **PostgreSQL, SQL, Power BI, and DAX**. The project transforms raw Olist marketplace data into business-focused dashboards for analyzing revenue, sales trends, customers, delivery performance, reviews, and sellers.

## Project Overview

E-commerce businesses generate data across orders, customers, products, payments, sellers, and deliveries. Analyzing these datasets together can reveal patterns in business performance and help identify areas for improvement.

This project uses PostgreSQL to store and prepare the data, SQL views to create reporting-ready datasets, and Power BI to build an interactive analytics dashboard using DirectQuery.

## Tech Stack

- **PostgreSQL** — Database management, data preparation, SQL views, constraints, and indexes.
- **Power BI Desktop** — Interactive dashboards and business reporting.
- **DAX** — Measures, KPIs, time intelligence, and review analysis.
- **Power Query / Power BI data connectivity** — Connecting the reporting layer to PostgreSQL.
- **Git and GitHub** — Version control and project documentation.

## Project Workflow

1. Downloaded and extracted the Olist dataset from Kaggle.
2. Created a PostgreSQL database and raw tables for the available CSV datasets.
3. Loaded the CSV data into PostgreSQL.
4. Defined primary keys, foreign key constraints, and indexes on relevant columns.
5. Created SQL views to prepare product, order, review, sales, and payment data for reporting.
6. Tested the BI views with SQL queries and sample records.
7. Connected Power BI Desktop to PostgreSQL using DirectQuery.
8. Created a date dimension and configured date relationships for time-based analysis.
9. Developed DAX measures for revenue, orders, customers, delivery performance, reviews, payments, and sellers.
10. Built interactive report pages and configured slicers, filtering, and drillthrough.
11. Reviewed report performance and kept the dashboard focused on relevant business questions.

## Dashboard Pages

### 1. Executive Overview
- Revenue, order volume, unique customers, average order value, and on-time delivery KPIs.
- Monthly revenue trends.
- Revenue contribution by product category.
- Geographic distribution of orders.

### 2. Sales & Revenue
- Year-to-date revenue and previous-year comparisons.
- Year-over-year revenue change.
- Revenue trends over time.
- Top-performing product categories.
- Monthly order volume and revenue.

### 3. Customers & Geography
- Unique customers and order metrics.
- Orders by customer state.
- Top customer cities.
- Revenue contribution by state.

### 4. Delivery & Logistics
- Average delivery time.
- Delivered and late order counts.
- On-time delivery rate and late delivery rate.
- Delivery performance by state.

### 5. Reviews & Sellers
- Average review score.
- Positive and negative review percentages.
- Review distribution by sentiment category.
- Revenue by seller state.
- Seller-level performance table.

## Key DAX Measures

The report includes measures such as:

| Measure | Purpose |
|---|---|
| Revenue | Sum of item prices |
| Freight | Sum of freight charges |
| GMV | Revenue plus freight |
| Orders | Distinct order count |
| Customers | Distinct customer count |
| AOV | Revenue divided by distinct orders |
| Items per Order | Item count divided by distinct orders |
| Revenue YTD | Year-to-date revenue |
| Revenue LY | Revenue for the comparable previous-year period |
| YoY % | Percentage change compared with the previous year |
| Rolling 30D Revenue | Revenue over a rolling 30-day date window |
| On-time % | Share of delivered orders not classified as late |
| Late % | Share of delivered orders classified as late |
| Positive Reviews % | Share of nonblank review rows with scores of 4 or 5 |
| Negative Reviews % | Share of nonblank review rows with scores of 1 or 2 |
| Revenue per Seller | Revenue divided by distinct seller count |

The measures are documented separately in [`powerbi/DAX_Measures.md`](powerbi/DAX_Measures.md).

## SQL Implementation

The SQL layer includes:

- Raw tables for customers, geolocation, products, sellers, orders, order items, payments, reviews, and product category translations.
- Primary and foreign key constraints where applicable.
- Indexes on important join and filtering columns.
- `bi_dim_product` for product attributes and translated category names.
- `bi_fact_review_latest` for selecting the latest review record per order.
- `bi_fact_order` for order-level dates, delivery duration, delivery status, and customer attributes.
- `bi_fact_sales` as the primary reporting view.
- `bi_payments_order` for aggregated order-level payment information.

The SQL scripts are available in the [`sql/`](sql/) directory.

## Data Model & Reporting Approach

The project uses SQL views to prepare the reporting layer before connecting Power BI to PostgreSQL.

The main sales view combines order items with order, customer, product, seller, review, and payment information. The payment aggregation view provides a separate order-level payment dataset.

Power BI uses DirectQuery for PostgreSQL-backed reporting data, with a date dimension for time intelligence.

**Data-grain consideration:** Order items, payments, and reviews have different levels of granularity. Before interpreting financial or review metrics, the joined reporting view should be validated for row multiplication and repeated values. Payment totals and order-level review metrics should be calculated from appropriately aggregated data.

## Repository Structure

```text
olist-ecommerce-analytics/
├── sql/
│   ├── 01_create_tables.sql
│   ├── 02_constraints_indexes.sql
│   ├── 03_create_bi_views.sql
│   └── 04_validation_queries.sql
├── powerbi/
│   ├── Olist_Analytics.pbix
│   └── DAX_Measures.md
├── screenshots/
│   ├── executive-overview.png
│   ├── sales-revenue.png
│   ├── customers-geography.png
│   ├── delivery-logistics.png
│   └── reviews-sellers.png
├── .gitignore
└── README.md
```

## Getting Started

### Prerequisites

- PostgreSQL and pgAdmin, or another PostgreSQL client.
- Power BI Desktop.
- The Olist dataset downloaded from Kaggle.

### Setup

1. Download the dataset from the [Olist Brazilian E-Commerce Public Dataset on Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce).
2. Create a PostgreSQL database.
3. Run the SQL scripts in the `sql/` directory in the required order.
4. Load the corresponding CSV files into the raw tables.
5. Validate the tables and reporting views.
6. Open the Power BI report in Power BI Desktop.
7. Update the PostgreSQL server, database, and authentication settings for your environment.
8. Refresh or query the data using the configured DirectQuery connection.

**Note:** The Power BI report requires access to a compatible PostgreSQL database. The `.pbix` file does not automatically include your local PostgreSQL database.

## Skills Demonstrated

- Relational database design and SQL.
- Data cleaning and transformation using SQL views.
- Primary keys, foreign keys, and indexing.
- Data-grain and aggregation considerations.
- Power BI data connectivity and modelling.
- DAX measures and time intelligence.
- KPI design and interactive dashboard development.
- Business-focused data visualization.
- Project documentation and version control.

## Data Source

The project uses the publicly available Olist Brazilian E-Commerce Public Dataset from Kaggle. Refer to the original dataset page for its description and applicable terms of use.

## Author

**Dev Mehta**

