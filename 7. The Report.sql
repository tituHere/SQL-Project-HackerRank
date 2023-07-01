/***********************************************QUESTION***********************************************/
https://www.hackerrank.com/challenges/the-report/

/***********************************************FUNCTIONS USED***********************************************/
  CASE WHEN
  INNER JOIN USING BETWEEN AND
  
/***********************************************SQL***********************************************/
SELECT  CASE WHEN GRADE <8 THEN NULL
             ELSE NAME
        END AS "NAME",
        GRADE,
        MARKS
FROM Students S JOIN Grades G 
ON (S.MARKS BETWEEN MIN_MARK AND MAX_MARK)
ORDER BY 2 DESC, 1;
 
