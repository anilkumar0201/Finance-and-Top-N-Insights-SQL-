Fact and dimension tables

<img width="1261" height="702" alt="Screenshot 2025-09-24 123720" src="https://github.com/user-attachments/assets/58e24431-fd46-43bb-b32e-d3924651750a" />

 
 • SQL-Based Financial Analytics
Finance Analytics

1. User-Defined Functions

get_fiscal_year(date) → maps a calendar date into the fiscal year (April–March).

Enables fiscal-year-based filtering and reporting.

2. Gross Sales Reports

Transaction-Level: Joins sales with product and price data.

Aggregated: Monthly gross sales by customer.

Stored Procedures:

get_monthly_gross_sales_for_customer(customer_codes) → returns monthly totals.

get_market_badge(market, fiscal_year, out_level) → classifies a market as Gold (>5M units sold) or Silver.

Top Customers, Products, Markets
1. Pre- & Post-Invoice Discounts

Added pre-invoice deductions to sales reports.

Created views (sales_preinv_discount, sales_postinv_discount, net_sales) to modularize reporting:

Gross Price → Net Invoice Sales → Net Sales.

2. Performance Improvements

Eliminated repeated calls to get_fiscal_year() by:

Using dim_date table.

Embedding fiscal_year directly in fact_sales_monthly.

3. Top N Markets & Customers

Queries & procedures:

get_top_n_markets_by_net_sales(fiscal_year, n)

get_top_n_customers_by_net_sales(market, fiscal_year, n)

4. Window Functions for Business Insights

OVER() clause to calculate:

% of expenses overall & by category.

Running totals (expenses_till_date).

Customer share of net sales in a region.

Ranking functions:

ROW_NUMBER, RANK, DENSE_RANK.

Procedure: get_top_n_products_per_division_by_qty_sold(fiscal_year, n).

⚙️ Key SQL Concepts Used

Joins across multiple fact and dimension tables.

Functions & Stored Procedures for reusable business logic.

Views for layered reporting pipelines.

Aggregations & Ranking with window functions.

Performance Optimization using surrogate fiscal year columns.

📊 Example Insights

Track Croma India sales (gross, net, discounts) in FY 2021.

Identify top markets and customers by net sales.

Benchmark products per division using sales ranking.

Classify markets (Gold/Silver) based on total quantity sold.

Analyze regional contribution shares of customers.

▶️ Execution Workflow

Set up UDFs → get_fiscal_year().

Run transaction-level reports with gross price & discounts.

Build views (sales_preinv_discount → sales_postinv_discount → net_sales).

Use stored procedures for top-N analysis and market badges.

Apply window functions for contributions, ranking, and rolling totals.
