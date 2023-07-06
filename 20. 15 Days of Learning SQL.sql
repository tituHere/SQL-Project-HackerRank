QUESTION:
  https://www.hackerrank.com/challenges/15-days-of-learning-sql/problem

FUNCTIONS USED:
  CTE
  JOIN
  ROW_NUMBER()
  COUNT()
  EXTRACT(DAY FROM DATE_VALUE)

QUERY:
with unique_hackers as (
        select  distinct h.hacker_id, 
                name, 
                submission_date
        from hackers h 
             join submissions s on s.hacker_id = h.hacker_id 
        ),
    day_no as (
        select  unique_hackers.*, 
                row_number() over(
                    partition by hacker_id order by submission_date) as rn
        from unique_hackers),
    max_sub as (
        select  h.hacker_id, 
                name,
                submission_date,
                row_number() over(
                    partition by submission_date order by count(h.hacker_id) desc, h.hacker_id) as rnk
        from hackers h 
             join submissions s on s.hacker_id = h.hacker_id
        group by h.hacker_id,submission_date, name
    )
select  day_no.submission_date, 
        count(day_no.hacker_id),
        max_sub.hacker_id,
        max_sub.name
from day_no 
     join max_sub on max_sub.submission_date = day_no.submission_date
where extract(day from day_no.submission_date) = day_no.rn
and rnk =1
group by day_no.submission_date,max_sub.hacker_id ,max_sub.name
order by 1;
