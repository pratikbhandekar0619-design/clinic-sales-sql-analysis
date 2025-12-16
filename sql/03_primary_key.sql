-- Ensure Invoice No. can be used as a primary key
ALTER TABLE clinic_sales_clean
MODIFY `Invoice No.` VARCHAR(50);

-- Add primary key on Invoice No.
ALTER TABLE clinic_sales_clean
ADD PRIMARY KEY (`Invoice No.`);
