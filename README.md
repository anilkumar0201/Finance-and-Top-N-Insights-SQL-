# SQL-Based Sales Analytics

**Project Goal:**  
Analyze over 1.5 million sales transactions to calculate gross and net sales, generate monthly and fiscal-year reports, and identify top-performing customers and markets.

---

## **Technologies Used**
- SQL (MySQL compatible)
- User-Defined Functions (UDF)
- Stored Procedures
- Common Table Expressions (CTEs)
- Window Functions

---

## **Project Workflow**
1. **Data Preparation**
   - Created a `dim_date` table to map calendar dates to fiscal years.
   - Cleaned and validated fact and dimension tables.

2. **User-Defined Function**
   - Created `get_fiscal_year(calendar_date)` to calculate fiscal year from date.

3. **Stored Procedures**
   - `get_monthly_gross_sales_for_customer` – generates monthly gross sales for a given customer.
   - `get_top_n_markets_by_net_sales` – ranks markets by net sales using `DENSE_RANK()`.

4. **CTEs & Window Functions**
   - Aggregate net sales per customer/region.
   - Calculate percentage share of each customer in a region.
   - Rank top markets per fiscal year.

---

## **Example Queries**
```sql
-- Using the get_fiscal_year function
SELECT * 
FROM fact_sales_monthly
WHERE get_fiscal_year(date) = 2021
ORDER BY date ASC
LIMIT 100;

-- Get top 5 markets for fiscal year 2021
CALL get_top_n_markets_by_net_sales(2021, 5);
```

Fact and dimesnion tables 

<img width="1261" height="702" alt="Screenshot 2025-09-24 123720" src="https://github.com/user-attachments/assets/58e24431-fd46-43bb-b32e-d3924651750a" />

 
