-- Create a dashboard-ready view for collections tracking
CREATE OR REPLACE VIEW collections_dashboard AS
SELECT
`Invoice No.`,
`Party Name`,
invoice_date,
due_date,
`Total Amount`,
`Received Amount`,
`Balance Amount`,
CASE
    WHEN `Balance Amount` = 0 THEN 'Paid'
    WHEN due_date < CURDATE() THEN 'Overdue'
    ELSE 'Pending'
END AS collection_status
FROM clinic_sales_github;
