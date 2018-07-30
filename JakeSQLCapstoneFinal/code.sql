-- Part 1 Code

SELECT *
FROM survey
LIMIT 10;


-- Part 2 Code

SELECT question, COUNT(DISTINCT user_id) AS 'Users that Answered'
FROM survey
GROUP BY question;


-- Part 4 Code

SELECT *
FROM quiz
LIMIT 5;

SELECT *
FROM home_try_on
LIMIT 5;

SELECT *
FROM purchase
LIMIT 5;


-- Part 5 Code

SELECT DISTINCT q.user_id, h.user_id IS NOT NULL AS 'is_home_try_on',
h.number_of_pairs,
p.user_id IS NOT NULL AS 'is_purchase'
FROM quiz q
LEFT JOIN home_try_on h
ON q.user_id = h.user_id
LEFT JOIN purchase p
ON p.user_id = q.user_id
LIMIT 10;

--  Part 6 Code 

-- Most common quiz choices for styles 
SELECT style as 'Quiz Choice', COUNT(*) as 'User Count'
FROM quiz
GROUP BY style
ORDER BY COUNT(*) DESC;

-- Most common type of purchase
SELECT style, model_name as 'Model', color, COUNT(*) as 'Purchase Count'
FROM purchase
GROUP BY product_id
ORDER BY COUNT(*) DESC;

-- Users that purchased with three pairs and users that purchased with 5 pairs

	-- Used to find Total Amount of Users who either received 3 or 5 pairs
SELECT h.user_id IS NOT NULL AS 'is_home_try_on',
   h.number_of_pairs,  COUNT(*) AS 'Total Users'
FROM quiz q
LEFT JOIN home_try_on h
   ON q.user_id = h.user_id
LEFT JOIN purchase p
   ON p.user_id = q.user_id
   WHERE number_of_pairs IS NOT NULL
   GROUP BY number_of_pairs;

	-- Used to find Total Amount of Users who made purchases
SELECT h.user_id IS NOT NULL AS 'is_home_try_on',
   h.number_of_pairs,
   p.user_id IS NOT NULL AS 'is_purchase', COUNT(*) AS 'Total Purchases'
FROM quiz q
LEFT JOIN home_try_on h
   ON q.user_id = h.user_id
LEFT JOIN purchase p
   ON p.user_id = q.user_id
   WHERE is_purchase > 0
GROUP BY number_of_pairs;

	-- Used to find Total Amount of Users who did not make purchases
SELECT h.user_id IS NOT NULL AS 'is_home_try_on',
   h.number_of_pairs,
   p.user_id IS NOT NULL AS 'is_purchase', COUNT(*) AS 'Users that did not purchase'
FROM quiz q
LEFT JOIN home_try_on h
   ON q.user_id = h.user_id
LEFT JOIN purchase p
   ON p.user_id = q.user_id
   WHERE is_purchase = 0
   AND number_of_pairs IS NOT NULL
GROUP BY number_of_pairs;




