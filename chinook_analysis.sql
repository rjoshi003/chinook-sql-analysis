-- Q1: What is the total revenue generated?
SELECT ROUND(SUM(TOTAL), 2) AS total_revenue FROM "invoice";
-- Insight: Total revenue across all invoices is $2,328.60.


-- Q2: Which year had the highest revenue?
SELECT EXTRACT(YEAR FROM invoice_date) AS invoice_yr, 
SUM(TOTAL) AS total_revenue_yr
FROM "invoice" 
GROUP BY invoice_yr
ORDER BY total_revenue_yr DESC;
--Insight: Year 2022 has the highest revenue of $481.


--Q3: Which artist has generated the most sales, and what is their best-selling album?
SELECT a.title, SUM(il.quantity) AS total_sold
FROM invoice_line il
JOIN track t ON il.track_id = t.track_id 
JOIN album a ON t.album_id = a.album_id
JOIN artist ar ON ar.artist_id = ar.artist_id
WHERE ar.name = 'Legião Urbana'
GROUP BY a.title
ORDER BY total_sold DESC;
--Insight: 


--Q4: Which customers are repeat buyers versus one-time buyers?
SELECT customer_id, COUNT(invoice_id) AS num_orders,
    CASE WHEN COUNT(invoice_id) > 1 THEN 'Repeat' ELSE 'One-time' END AS customer_type
FROM invoice
GROUP BY customer_id
ORDER BY num_orders DESC;
--Insight: Every customer shows & orders, hence all "Repeat" customers.


--Q5: Which country has the highest average order value?
SELECT billing_country, ROUND(AVG(total), 2) AS avg_order_value
FROM invoice
GROUP BY billing_country
ORDER BY avg_order_value DESC;
--Insight: Country with highest average order value is Chile.


--Q6: Within each country, how do customers rank by total spend?
SELECT customer_id, billing_country, SUM(total) AS total_spend,
    RANK() OVER (PARTITION BY billing_country ORDER BY SUM(total) DESC) AS rank_in_country
FROM invoice
GROUP BY customer_id, billing_country
ORDER BY billing_country, rank_in_country;
--Insight: Customer spend clusters tightly around $37-40 regardless of country, with few outliers (e.g. Chile at $46.62) — suggests synthetic, templated data rather than real geographic variance.


--Q7: What is the running (cumulative) monthly revenue total?
WITH monthly_revenue AS (
    SELECT DATE_TRUNC('month', invoice_date) AS month,
           SUM(total) AS revenue
    FROM invoice
    GROUP BY DATE_TRUNC('month', invoice_date)
)
SELECT month, revenue,
       SUM(revenue) OVER (ORDER BY month) AS running_total
FROM monthly_revenue
ORDER BY month;
--Insights: Revenue stayed flat (~$37.62/month, ~7 invoices) through most of 2021, varying more in 2022 — flatness points to templated synthetic data, not a real trend.