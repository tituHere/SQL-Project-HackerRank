QUESTION:
https://www.hackerrank.com/challenges/the-company/forum

FUNCTIONS USED:
COUNT(DISTINCT)
JOIN
GROUP BY
ORDER BY

SQL QUERY:
SELECT  C.company_code, 
        C.founder,
        COUNT(DISTINCT lead_manager_code),
        COUNT(DISTINCT senior_manager_code),
        COUNT(DISTINCT manager_code),
        COUNT(DISTINCT employee_code)
FROM Company C JOIN Employee E ON
     C.company_code = E.company_code
GROUP BY C.company_code, 
        C.founder
ORDER BY 1;
