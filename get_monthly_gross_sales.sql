-- Monthly gross sales per customer
DELIMITER //
CREATE PROCEDURE `get_monthly_gross_sales_for_customer`(
    IN in_customer_codes TEXT
)
BEGIN
    SELECT 
        s.date, 
        SUM(ROUND(s.sold_quantity*g.gross_price,2)) AS monthly_sales
    FROM fact_sales_monthly s
    JOIN fact_gross_price g
        ON g.fiscal_year = get_fiscal_year(s.date)
        AND g.product_code = s.product_code
    WHERE FIND_IN_SET(s.customer_code, in_customer_codes) > 0
    GROUP BY s.date
    ORDER BY s.date DESC;
END //
DELIMITER ;

-- Top N markets by net sales using DENSE_RANK
DELIMITER //
CREATE PROCEDURE `get_top_n_markets_by_net_sales`(
    IN in_fiscal_year INT,
    IN in_top_n INT
)
BEGIN
    WITH market_sales AS (
        SELECT market, SUM(net_sales) AS total_net_sales
        FROM net_sales
        WHERE fiscal_year = in_fiscal_year
        GROUP BY market
    ),
    ranked_markets AS (
        SELECT 
            market,
            ROUND(total_net_sales / 1000000, 2) AS net_sales_mln,
            DENSE_RANK() OVER (ORDER BY total_net_sales DESC) AS dr
        FROM market_sales
    )
    SELECT market, net_sales_mln
    FROM ranked_markets
    WHERE dr <= in_top_n
    ORDER BY dr;
END //
DELIMITER ;
