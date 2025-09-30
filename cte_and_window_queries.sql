-- Example: Customer contribution per region
WITH cte1 AS (
    SELECT 
        c.customer,
        c.region,
        ROUND(SUM(n.net_sales)/1000000,2) AS net_sales_mln
    FROM net_sales n
    JOIN dim_customer c
        ON n.customer_code = c.customer_code
    WHERE fiscal_year = 2021
    GROUP BY c.customer, c.region
)
SELECT *,
       net_sales_mln*100/SUM(net_sales_mln) OVER (PARTITION BY region) AS pct_share_region
FROM cte1
ORDER BY region, pct_share_region DESC;
