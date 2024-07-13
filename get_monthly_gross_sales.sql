select s.date, Round(Sum(s.sold_quantity*g.gross_price),2) as monthly_sales
 from fact_sales_monthly s
join fact_gross_price g
on g.product_code= s.product_code and g.fiscal_year = get_fiscal_year(s.date)
where 
customer_code=90002008
group BY date;