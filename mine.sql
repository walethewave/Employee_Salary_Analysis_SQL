-- 1. Show all the rows and columns
SELECT * FROM salaries;

-- 2. Show only the EmployeeName and JobTitle columns
SELECT EmployeeName, JobTitle FROM salaries;
 
-- 3. Show the number of employees in the table
SELECT COUNT(*) AS NumberOfEmployees FROM salaries;
 
-- 4. Show the unique job titles in the table
SELECT DISTINCT JobTitle FROM salaries;
 
-- 5. Show the JobTitle and overtime pay for all employees with overtime pay greater than 1500
SELECT JobTitle, OvertimePay FROM salaries
WHERE OvertimePay > 1500;
 
-- 6. Show the average base pay for all employees
SELECT AVG(BasePay) AS AverageBasePay FROM salaries;
 
-- 7. Show the top 10 highest paid employees
SELECT EmployeeName, TotalPay FROM salaries
ORDER BY TotalPay DESC
LIMIT 10;
 
-- 8. Show the average of BasePay, OvertimePay, and OtherPay for the employees
SELECT EmployeeName, (BasePay + OvertimePay + OtherPay)/3 AS AverageBP_OP_OP FROM salaries;
 
-- 9. Show the employee who have the word "MANAGER" in their JobTitle
SELECT EmployeeName, JobTitle FROM salaries
WHERE JobTitle LIKE '%MANAGER%';
 
-- 10. Show the total pay for Overtime and OtherPay
SELECT EmployeeName, (BasePay + OvertimePay + OtherPay) AS TotalPay FROM salaries;

-- 11. How does the average overtime pay vary between different years
SELECT Year, AVG(OvertimePay) AS AverageOvertimePay FROM salaries GROUP BY Year;
 
-- 12. What is the median total pay for each job title
SELECT JobTitle, 
       AVG(TotalPay) AS MedianTotalPay
FROM (
    SELECT JobTitle, TotalPay,
           ROW_NUMBER() OVER (PARTITION BY JobTitle ORDER BY TotalPay) AS row_num,
           COUNT(*) OVER (PARTITION BY JobTitle) AS total_rows
    FROM salaries
) sub
WHERE row_num IN ((total_rows + 1) / 2, (total_rows + 2) / 2)
GROUP BY JobTitle;

-- 13. "How does the average total pay (including benefits) change over the years for employees in a specific agency?"
SELECT Year,
       AVG(TotalPayBenefits) AS AverageTotalPayBenefits
FROM salaries


















 

