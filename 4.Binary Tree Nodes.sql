Question:
https://www.hackerrank.com/challenges/binary-search-tree-1/

FUNCTIONS USED:
NOT IN()
CASE WHEN
LEFT JOIN
CONCAT()

SQL QUERY:
 /*******************************METHOD1*******************************/
SELECT
    N,
    CASE WHEN P IS NULL THEN 'Root'
         WHEN N NOT IN (SELECT P FROM BST WHERE P IS NOT NULL) THEN 'Leaf'
         ELSE 'Inner'
    END
FROM BST ORDER BY 1;

/*******************************METHOD2*******************************/
SELECT DISTINCT
    A.N,
    CASE WHEN A.P IS NULL THEN 'Root'
         WHEN B.N IS NULL THEN 'Leaf'
         ELSE 'Inner'
    END
FROM BST a LEFT JOIN BST b 
     ON A.N = B.P 
ORDER BY 1;

/*******************************METHOD3*******************************/
EXPLAIN PLAN FOR 
WITH cte AS(
    SELECT DISTINCT P AS pdist
    FROM BST
)
SELECT 
    CASE 
    WHEN t1.P IS NULL THEN CONCAT (t1.N, 'Root')
    WHEN t2.pdist IS NULL THEN CONCAT (t1.N, 'Leaf')
    ELSE CONCAT(t1.N, 'Inner')
    END
FROM BST t1 LEFT JOIN cte t2 ON t1.N = t2.pdist
ORDER BY t1.N;

SELECT * 
FROM   TABLE(DBMS_XPLAN.DISPLAY);


/*******************************Create the table*******************************/
-- Create the table
CREATE TABLE my_table (
  N NUMBER,
  P NUMBER
);

/*******************************Insert the values*******************************/
INSERT INTO BST (N, P) VALUES (1, 2);
INSERT INTO BST (N, P) VALUES (3, 2);
INSERT INTO BST (N, P) VALUES (6, 8);
INSERT INTO BST (N, P) VALUES (9, 8);
INSERT INTO BST (N, P) VALUES (2, 5);
INSERT INTO BST (N, P) VALUES (8, 5);
INSERT INTO BST (N, P) VALUES (5, NULL);
