# WALMART-SALES-ANALYSIS
![data-flow-animated.svg](https://github.com/giftekpen/WALMART-SALES-ANALYSIS/blob/main/data-flow-animated.svg).
## INTRODUCTION
The objective of this analysis is to evaluate Walmart's sales performance by exploring key factors that influence it. Using SQL, I analyzed the impact of holidays, unemployment rates, and store-specific attributes (such as type) on weekly sales.
## PROBLEM STATEMENT
Walmart’s Sales Strategy Manager faces challenges with complex reports and limited BI support he needs clear insights into sales trends. His goal is to identify sales patterns, evaluate the effectiveness of markdowns, and assess the impact of holidays on sales to make data-driven decisions. This analysis, leveraging SQL, will uncover key performance metrics to support strategic planning.
- Sales trends over time
- Monthly moving average
- Percentage change in sales
- Impact of markdowns, especially during holidays
- Performance distribution across store types
  
## DATA SOURCE
<a href="https://www.kaggle.com/datasets/gustavoserafim/walmart-recruiting-store-sales-forecasting-gsr">kaggle
# SKILLS/CONCEPTS DEMONSTRATED
- Data Importation & Integration: Imported multiple CSV files into SQL using Python.
- SQL Querying & Optimization: Utilized JOINS, CTEs, subqueries, and other functions for in-depth analysis.
- Data Aggregation & Trend Analysis: Applied aggregation techniques to unravel sales trends and performance insights.
  
# DATA IMPORTATION
Imported CSV files into SQL using python.<a href="https://github.com/giftekpen/WALMART-SALES-ANALYSIS/blob/main/Csv%20import%20to%20sql.ipynb">View Code

# VALIDATION – ANALYZING THE POTENTIAL RETURN ON INVESTMENT (ROI)
For this analysis, I conducted a comprehensive evaluation of Walmart's sales performance using SQL. The analysis focused on key metrics to assess the impact of markdowns, identify sales trends, and evaluate store performance. Below is a breakdown of the calculations and methodologies used:

- Monthly Average: Calculated to smooth out sales trends and identify underlying patterns over time.
- Percentage Change in Sales: Tracked to measure growth or decline in sales performance across periods.
- Markdown Effectiveness: Analyzed by comparing sales performance before and after markdowns to evaluate their impact on revenue.
- Holiday Sales Impact: Assessed by comparing sales during holiday periods to non-holiday periods, highlighting the influence of holidays on performance.
- Evaluated through correlation analysis by comparing weekly sales with external factors.
- Performance Distribution Across Store Types: Evaluated to identify top-performing stores and understand how different store types contribute to overall sales.

These calculations provide actionable insights into sales trends, the effectiveness of markdown strategies, and the impact of external factors like holidays. The findings enable data-driven decision-making to optimize revenue, pricing strategies, and inventory management.

# PROJECT
<a href="https://github.com/giftekpen/WALMART-SALES-ANALYSIS/blob/main/WALMART%20SQL%20PROJECT%20DONE.sql">SQL CODE

# INSIGHTS
- Sales exhibit a fluctuating pattern over time, characterized by significant peaks and dips. The highest sales peak occurred on December 24, 2010, reaching 80,932,415.60, while the lowest point was recorded in September 24, 2010, with sales dropping to 41,358,514.41.
- Sales surge dramatically during the holiday season (November and December), with notable increases of 45.86% on November 26, 2010, and 43.40% on November 25, 2011. However, sales experience sharp declines immediately after the holiday season, with significant drops of -50.04% on December 31, 2010, and -40.20% on December 30, 2011.
- The percentage change in sales varies widely, ranging from -50.04% to +45.86%. Negative percentage changes occur more frequently, highlighting challenges in sustaining consistent sales growth outside of peak holiday periods.

