-- Total Revenue
SELECT 
SUM(`Total Amount`) AS total_revenue
FROM clinic_sales_github;

-- Total Amount Collected
SELECT 
SUM(`Received Amount`) AS total_collected
FROM clinic_sales_github;

-- Total Pending Amount
SELECT 
SUM(`Balance Amount`) AS pending_amount
FROM clinic_sales_github;

-- Collection Efficiency Percentage
SELECT
ROUND(
    SUM(`Received Amount`) / SUM(`Total Amount`) * 100,
    2
) AS collection_efficiency_percent
FROM clinic_sales_github;
