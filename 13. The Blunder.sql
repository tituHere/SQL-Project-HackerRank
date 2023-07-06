QUESTION:
  https://www.hackerrank.com/challenges/the-blunder/problem
  
FUNCTIONS USED:
  CEIL()
  AVG()
  REPLACE()
  
QUERY:
SELECT  CEIL(
            AVG(SALARY) - AVG(REPLACE(SALARY,'0',''))
            )
FROM EMPLOYEES;
