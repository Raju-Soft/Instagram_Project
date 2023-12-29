use ig_clone
/*(A) Marketing:*/
/*Task: Identify the five oldest users on Instagram from the provided database.*/
select * from users
order by created_at asc
limit 5;

/*Task: Identify users who have never posted a single photo on Instagram.*/
SELECT * FROM users as u
LEFT JOIN photos as p 
ON u.id = p.user_id 
WHERE p.user_id is null;

/*Task: Determine the winner of the contest and provide their details to the team*/
select username, count('id') as most_likes  from users
right JOIN likes
ON users.id=likes.user_id
GROUP BY users.username
ORDER BY most_likes DESC
LIMIT 1;
/*Task: Identify and suggest the top five most commonly used hashtags on the platform.*/
select tag_name, count('id') as most_popular from photo_tags
right join tags
on tags.id = photo_tags.tag_id
group by tags.tag_name
order by most_popular desc
limit 5;

/* Task: Determine the day of the week when most users register on Instagram. Provide insights on when to schedule an ad campaign.*/
select date_format(created_at,'%W') as 'Days',
count(*) as Registrations 
from users
group by Days
order by Registrations desc;

/*------------------------------------------------------------------------------------------------*/

/* (B) Investor Metrics:*/

/* Task: Calculate the average number of posts per user on Instagram. Also, 
provide the total number of photos on Instagram divided by the total number of users*/
select round(
(select count(*) from photos)
/
(select count(*) from users)
,2)

/*Task: Identify users (potential bots) who have liked every single photo on the site, as this is not typically possible for a normal user*/
select id,username, count('id') as total_likes  from users
JOIN likes
ON users.id=likes.user_id
GROUP BY users.id
having total_likes =  (SELECT COUNT(*) FROM photos);







