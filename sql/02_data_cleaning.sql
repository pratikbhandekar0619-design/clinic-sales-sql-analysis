-- Create clean working table from raw data
CREATE TABLE clinic_sales_clean AS
SELECT * FROM clinic_sales_raw;

-- Add proper DATE columns
ALTER TABLE clinic_sales_clean
ADD invoice_date DATE,
ADD due_date DATE;

-- Convert text dates into DATE format
UPDATE clinic_sales_clean
SET invoice_date = STR_TO_DATE(Date, '%d-%m-%Y'),
    due_date     = STR_TO_DATE(`Due Date`, '%d-%m-%Y');
