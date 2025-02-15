SELECT 
    SUM(weekly_sales)::NUMERIC total_revenue
FROM train; -- total revenue from all sales made from FEBURARY 2010 TO DEC 2012

--SALES TREND
SELECT 
     date,
	 SUM(weekly_sales)::NUMERIC(10,2) total_sales
FROM 
     train
GROUP BY 
     date;

SELECT 
     EXTRACT(YEAR FROM date::DATE) AS year,
     SUM(weekly_sales::NUMERIC(10,2)) year_total
FROM train
GROUP BY year;

-- Monthly Moving Average Of Sales.
WITH Sales_in_4Weeks AS (  
    SELECT  
        DATE_TRUNC('month', TO_DATE(Date, 'YYYY-MM-DD'))::DATE AS Month_Date,
        SUM(weekly_Sales)::NUMERIC AS Total_sales  
    FROM train  
    GROUP BY Month_Date  
)  
SELECT  
    Month_Date,  
    Total_sales::NUMERIC(16, 2) AS Total_sales,  
    ROUND(AVG(Total_sales) OVER (ORDER BY Month_Date ROWS BETWEEN 3 PRECEDING AND CURRENT ROW), 2) AS Moving_Avg_4_Weeks  
FROM 
    Sales_in_4Weeks  
ORDER BY  
    Month_Date;  
    
--Percentage Change In Sales
SELECT 
    Date, 
    SUM(Weekly_Sales)::NUMERIC(10,2) AS Total_sales,
    LAG(SUM(Weekly_Sales)) OVER (ORDER BY Date) AS Previous_Day_Sales,
    ROUND(
        (SUM(Weekly_Sales)::NUMERIC - LAG(SUM(Weekly_Sales)) OVER (ORDER BY Date)::NUMERIC) / 
        NULLIF(LAG(SUM(Weekly_Sales)) OVER (ORDER BY Date)::NUMERIC, 0) * 100, 2
    ) AS Sales_Percentage_Change
FROM train 
GROUP BY Date
ORDER BY Date;

--Which stores have the most consistent sales performance over time?
SELECT 
    store,
    AVG(weekly_sales)::NUMERIC(10,2) AS avg_weekly_sales, 
    STDDEV(weekly_sales)::NUMERIC(10,3) AS sales_std_dev
FROM 
    train
GROUP BY 
    store
ORDER BY 
    sales_std_dev ASC;

--Creating a temp table for the impact of markdowns on sales--
CREATE TEMP TABLE joined_data AS
SELECT 
    t.store,
    t.dept,
    t.date,
    t.weekly_sales,
    f.markdown1,
    f.markdown2,
    f.markdown3,
    f.markdown4,
    f.markdown5,
    f.isholiday
FROM 
    train t
JOIN 
    features f 
ON 
    t.store = f.store AND t.date = f.date;
	
--the Impact of Markdowns on Sales
SELECT 
	CORR(weekly_sales, markdown1)::NUMERIC(10, 2) AS markdown1_corr,
	CORR(weekly_sales, markdown2)::NUMERIC(10, 2) AS markdown2_corr,
	CORR(weekly_sales, markdown3)::NUMERIC(10, 2) AS markdown3_corr,
	CORR(weekly_sales, markdown4)::NUMERIC(10, 2) AS markdown4_corr,
	CORR(weekly_sales, markdown5)::NUMERIC(10, 2) AS markdown5_corr
FROM
	joined_data;

--Markdown Effectiveness During Holidays
SELECT 
	isholiday,
	AVG(weekly_sales)::NUMERIC(10, 2) AS avg_sales,
	AVG(markdown1)::NUMERIC(10, 2) AS avg_markdown1,
	AVG(markdown2)::NUMERIC(10, 2) AS avg_markdown2,
	AVG(markdown3)::NUMERIC(10, 2) AS avg_markdown3,
	AVG(markdown4)::NUMERIC(10, 2) AS avg_markdown4,
	AVG(markdown5)::NUMERIC(10, 2) AS avg_markdown5
FROM
	joined_data
GROUP BY
	isholiday;
	

--Holiday Impact Analysis BY Store:
SELECT 
	store,
	AVG(CASE WHEN isholiday = true THEN weekly_sales END)::NUMERIC(10, 2) AS holiday_sales,
	AVG(CASE WHEN isholiday = false THEN weekly_sales END)::NUMERIC(10, 2) AS regular_sales
FROM
	joined_data
GROUP BY 
	store
ORDER BY 
	store;
	
-- Impact of External factors (CPI, unemployment, temperature) on weekly sales
WITH External_factor AS 
(
    SELECT 
        cpi, unemployment, temperature, weekly_sales
    FROM
        features f
    JOIN train t
    ON f.store = t.store
)
SELECT
    CORR(weekly_sales, cpi) AS corr_cpi,
    CORR(weekly_sales, unemployment) AS corr_unemployment,
    CORR(weekly_sales, temperature) AS corr_temperature
FROM External_factor;

