QUESTION:
  https://www.hackerrank.com/challenges/interviews/problem

FUNCTIONS USED:
  JOIN
  SUM()
  GROUP BY
  HAVING

QUERY:
WITH SUBM AS (
SELECT  C.contest_id, 
        C.hacker_id, 
        C.name,
        SUM(total_submissions) total_submissions,
        SUM(total_accepted_submissions) total_accepted_submissions
FROM Contests C
     JOIN Colleges CL ON CL.contest_id = C.contest_id
     JOIN Challenges CHL ON CHL.college_id = CL.college_id
     JOIN Submission_Stats S ON S.challenge_id = CHL.challenge_id
GROUP BY C.contest_id, C.hacker_id, C.name
HAVING SUM(total_submissions)>0 AND SUM(total_accepted_submissions)>0
),
VIEWSS AS (
SELECT  C.contest_id, 
        C.hacker_id, 
        C.name,
        SUM(total_views) total_views,
        SUM(total_unique_views) total_unique_views
FROM Contests C
     JOIN Colleges CL ON CL.contest_id = C.contest_id
     JOIN Challenges CHL ON CHL.college_id = CL.college_id
     JOIN View_Stats VS ON VS.challenge_id = CHL.challenge_id
GROUP BY C.contest_id, C.hacker_id, C.name
HAVING SUM(total_views)>0 AND SUM(total_unique_views)>0
)
SELECT  SUBM.contest_id, 
        SUBM.hacker_id, 
        SUBM.name,
        total_submissions,
        total_accepted_submissions,
        total_views,
        total_unique_views
FROM SUBM
     JOIN VIEWSS ON SUBM.hacker_id = VIEWSS.hacker_id
ORDER BY 1
;
