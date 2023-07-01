QUESTION:
https://www.hackerrank.com/challenges/harry-potter-and-wands/problem

FUNCTIONS USED:
  RANK()
  INNER JOIN

SQL:
SELECT id, age, coins_needed,  power 
FROM
    (select id, 
            age, 
            coins_needed,  
            power,
            RANK() OVER(PARTITION BY age,power ORDER BY coins_needed) AS RN
    FROM Wands w join Wands_Property wp
    on w.code = wp.code 
    WHERE is_evil =0)
WHERE RN = 1 
order by 4 DESC , 2 DESC;
