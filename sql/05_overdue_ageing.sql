-- List of unpaid invoices
SELECT
`Invoice No.`,
`Party Name`,
invoice_date,
due_date,
`Total Amount`,
`Received Amount`,
`Balance Amount`
FROM clinic_sales_github
WHERE `Balance Amount` > 0;

-- Overdue invoices
SELECT
`Invoice No.`,
`Party Name`,
invoice_date,
due_date,
`Balance Amount`
FROM clinic_sales_github
WHERE `Balance Amount` > 0
  AND due_date < CURDATE();

-- Ageing analysis of outstanding balances
SELECT
CASE
    WHEN DATEDIFF(CURDATE(), due_date) BETWEEN 1 AND 30 THEN '1–30 Days'
    WHEN DATEDIFF(CURDATE(), due_date) BETWEEN 31 AND 60 THEN '31–60 Days'
    WHEN DATEDIFF(CURDATE(), due_date) BETWEEN 61 AND 90 THEN '61–90 Days'
    WHEN DATEDIFF(CURDATE(), due_date) > 90 THEN '90+ Days'
END AS ageing_bucket,
SUM(`Balance Amount`) AS outstanding_amount
FROM clinic_sales_github
WHERE `Balance Amount` > 0
  AND due_date < CURDATE()
GROUP BY ageing_bucket;
