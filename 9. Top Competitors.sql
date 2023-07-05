/***************************************QUESTION*************************************/
https://www.hackerrank.com/challenges/full-score/problem
  
/***************************************FUNCTIONS USED*************************************/
  INNER JOIN
  GROUP BY
  HAVING
  ORDER BY

/***************************************QUERY*************************************/
SELECT  H.hacker_id,
        H.name
FROM Hackers H 
     JOIN Submissions S ON S.hacker_id = H.hacker_id
     JOIN Challenges C ON C.challenge_id = S.challenge_id
     JOIN Difficulty D ON D.difficulty_level = C.difficulty_level
WHERE S.score = D.score
GROUP BY H.hacker_id,
         H.name
HAVING COUNT(*) >1
ORDER BY COUNT(*) DESC, 1;
