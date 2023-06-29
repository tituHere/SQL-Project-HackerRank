QUESTION:
https://www.hackerrank.com/challenges/occupations/

FUNCTIONS USED:
1. ROW_NUMBER()
2. MAX()
3. PIVOT()

SQL QUERY:
SELECT  Doctor, 
        Professor, 
        Singer, 
        Actor 
FROM (
        SELECT
            NAME, 
            OCCUPATION, 
            ROW_NUMBER() OVER(PARTITION BY OCCUPATION ORDER BY NAME) AS RN
        FROM OCCUPATIONS)
PIVOT(
        MAX(NAME) 
        FOR OCCUPATION IN ('Doctor' AS Doctor, 'Professor' AS Professor, 'Singer' AS Singer, 'Actor' AS Actor))
ORDER BY RN;


