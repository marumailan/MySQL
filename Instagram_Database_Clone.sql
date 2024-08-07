-- INSTAGRAM CLONE DB FROM COLT STEELE
-- SOLUTIONS TO CHALLENEGS

-- IG CHALLENGE #1: FIND THE 5 OLDEST USERS

SELECT*
FROM users
ORDER BY created_at ASC
LIMIT 5;

-- IG CHALLENGE #2: WHAT DAY OF THE WEEK DO MOST USERS REGISTER ON?

SELECT
DAYNAME(created_at) AS Day_Name,
COUNT(*) AS Total
FROM users
GROUP BY Day_Name
ORDER BY Total DESC;

-- IG CHALLENGE #3: FIND THE USERS WHO HAVE NEVER POSTED A PHOTO OR INACTIVE USERS

SELECT u.username
FROM users u
LEFT JOIN photos p
ON u.id = p.user_id
WHERE p.id IS NULL;

-- IG CHALLENGE #4: TOP MOST LIKES PHOTOS IN USER WHO CREATED IT

SELECT u.username, p.id, p.image_url, COUNT(*) AS Total
FROM photos p
LEFT JOIN likes l
ON p.id = l.photo_id
INNER JOIN users u
ON p.user_id = u.id
GROUP BY p.id
ORDER BY Total DESC
LIMIT 1;

-- IG CHALLENGE #5: HOW MANY TIMES DOES THE AVERAGE USER POST?

SELECT COUNT(*) FROM photos;
SELECT COUNT(*) FROM users;

-- AVERAGE NUMBER OF PHOTOS PER USER = TOTAL NUMBER OF PHOTO / TOTAL NUMBER OF USERS

SELECT
	ROUND((SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users),0) AS AVE_USER_POST;
    
-- IG CHALLENGE #6: WHAT ARE THE TOP 5 MOST COMMONLY USED HASHTAGS?

SELECT* FROM tags;
SELECT* FROM photo_tags;
SELECT* FROM likes;

SELECT tag_name, COUNT(*) AS TOTAL
FROM tags t
LEFT JOIN photo_tags p
ON p.tag_id = t.id
GROUP BY tag_name
ORDER BY TOTAL DESC
LIMIT 5;

-- IG CHALLENGE #7: FIND USERS WHO HAVE LIKED EVERY SINGLE PHOTO ON THE SITE

SELECT username, COUNT(*) AS num_likes
FROM users
INNER JOIN likes
ON users.id = likes.user_id
GROUP BY likes.user_idss
HAVING num_likes = (SELECT COUNT(*) FROM photos)
ORDER BY num_likes DESC;









