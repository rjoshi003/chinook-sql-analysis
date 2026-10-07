# Chinook Sales Analysis — SQL

Answered 7 business questions on the Chinook sample database (a digital music store's catalog, customers, and sales) using PostgreSQL — covering joins, aggregations, CTEs, and window functions.

**Tools:** SQL (PostgreSQL)

## Why This Dataset

Chinook is a widely-used, industry-standard sample database for practicing relational SQL — it has a realistic multi-table schema (customers, invoices, tracks, albums, artists, employees) that mirrors the kind of joins, aggregations, and business questions you'd encounter in a real analyst role, without requiring access to proprietary company data.

## Questions & Insights

**1. What is the total revenue generated?**
Total revenue across all invoices is $2,328.60.

**2. Which year had the highest revenue?**
*[Fill in: which year topped your Q2 result, and the revenue figure]*

**3. Which artist has generated the most sales, and what is their best-selling album?**
Legião Urbana is the top-selling artist by units sold. *[Fill in: their best-selling album and units sold, once Q3's WHERE-filtered query is confirmed correct]*

**4. Which customers are repeat buyers versus one-time buyers?**
*[Fill in: total repeat vs. one-time customer counts and % split, from your full Q4 result]*

**5. Which country has the highest average order value?**
*[Fill in: top country and its average order value]*

**6. Within each country, how do customers rank by total spend?**
Customer spend clusters tightly around $37-40 regardless of country, with a few outliers (e.g. Chile at $46.62) — suggests synthetic, templated data rather than real geographic variance.

**7. What is the running (cumulative) monthly revenue total?**
Revenue stayed flat (~$37.62/month, ~7 invoices) through most of 2021, varying more in 2022 — the flatness points to templated synthetic data rather than a real trend.

## Skills Demonstrated
- Multi-table JOINs (up to 4 tables)
- Aggregation (`SUM`, `AVG`, `COUNT`, `GROUP BY`)
- CTEs (`WITH`)
- Window functions (`RANK() OVER (PARTITION BY ...)`, running totals)
- Data-quality investigation — flagged and explained unusually uniform values rather than taking them at face value

## Files
- `chinook_analysis.sql` — all 7 queries, each with the question as a comment and a one-line insight underneath
