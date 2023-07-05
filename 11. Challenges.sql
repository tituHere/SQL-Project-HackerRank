QUESTION:
  https://www.hackerrank.com/challenges/challenges/problem

FUNCTIONS USED:
  CTE
  COUNT()
  HAVING
  JOIN
  MAX()

SQL:
WITH CTE AS(
            SELECT  H.HACKER_ID,
                    H.NAME,
                    COUNT(challenge_id) AS CHLNG_CRTD
            FROM Hackers H
                 JOIN Challenges C ON H.HACKER_ID = C.HACKER_ID
            GROUP BY H.HACKER_ID,
                    H.NAME
),
ELIGIBLE AS(
            SELECT CHLNG_CRTD, COUNT(CHLNG_CRTD) AS CHLNG_CNT  
            FROM CTE 
            GROUP BY CHLNG_CRTD
            HAVING COUNT(CHLNG_CRTD) =1
)
SELECT DISTINCT HACKER_ID, NAME, CTE.CHLNG_CRTD FROM CTE
JOIN ELIGIBLE ON ELIGIBLE.CHLNG_CRTD = CTE.CHLNG_CRTD OR CTE.CHLNG_CRTD
IN (SELECT MAX(CHLNG_CRTD) FROM CTE)
ORDER BY CHLNG_CRTD DESC, 1;
