QUESTION:
https://www.hackerrank.com/challenges/earnings-of-employees/problem

FUNCTIONS USED:
COUNT()
MAX()
GROUP BY
HAVING

QUERY:
SELECT  (MONTHS*SALARY), 
        COUNT(EMPLOYEE_ID)
FROM EMPLOYEE 
GROUP BY (MONTHS*SALARY)
HAVING (MONTHS*SALARY) = (SELECT MAX(MONTHS*SALARY) FROM EMPLOYEE);
