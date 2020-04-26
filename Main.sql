--Part 1: Yelp Dataset Profiling and Understanding

--1. Profile the data by finding the total number of records for each of the tables below:

SELECT COUNT(*) from business; -- Business Table (10000) rows
SELECT COUNT(*) from attribute; -- Attribute (10000)
SELECT COUNT(*) from category; -- Category (10000) rows 
SELECT COUNT(*) from checkin; -- Checkin (10000) rows
SELECT COUNT(*) from elite_years; -- elite_years (10000) rows
SELECT COUNT(*) from friend; -- friend (10000) rows 
SELECT COUNT(*) from hours; -- hours (10000) rows
SELECT COUNT(*) from photo; -- photo (10000) rows
SELECT COUNT(*) from review; -- review (10000) rows
SELECT COUNT(*) from tip; -- tip (10000) rows
SELECT COUNT(*) from user; -- user (10000) rows

--2. Find the total distinct records by either the foreign key or primary key for each table. If two foreign keys are listed in the table, please specify which foreign key.

SELECT Count(DISTINCT(id)) from business; -- Business Table (10000) rows
SELECT Count(DISTINCT(business_id)) from hours; -- Hours Table (1562) rows
SELECT Count(DISTINCT(business_id)) from category; -- Category Table (2643) rows
SELECT Count(DISTINCT(business_id)) from attribute; -- Attribute Table (1115) rows
SELECT  Count(DISTINCT(id)),
        Count(DISTINCT(business_id)),
        Count(DISTINCT(user_id)) 
        from review; -- review Table (10000), (8090), (9581)
SELECT Count(DISTINCT(business_id)) from checkin; -- Chekin Table (493) rows
SELECT  Count(DISTINCT(id)), 
        Count(DISTINCT(business_id)) 
        from photo; -- Photo Table (10000), (6493) Distinctive rows
SELECT  Count(DISTINCT(user_id)), 
        Count(DISTINCT(business_id))
        from tip; -- Tip Table (537) Distictive user,  (3979) Distinctive business
SELECT COUNT(id) from user; -- (10000) Distinctive users.
SELECT Count(DISTINCT(user_id)) from friend; -- Only (11) distictive users has friends
SELECT Count(DISTINCT(user_id)) from elite_years; -- (2780) Users have elite years.

-- 3. Are there any columns with null values in the Users table? (NO)

Select Count(id), 
       Count(name),
       Count(review_count),
       Count(yelping_since),
       Count(useful),
       Count(funny),
       Count(cool),
       Count(fans),
       Count(average_stars),
       Count(compliment_hot),
       Count(compliment_more),
       Count(compliment_profile),
       Count(compliment_cute),
       Count(compliment_list),
       Count(compliment_note),
       Count(compliment_plain),
       Count(compliment_cool),
       Count(compliment_funny),
       Count(compliment_writer),
       Count(compliment_photos) from user;

-- 4. For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields:

--	i. Table: Review, Column: Stars
	Select MIN(stars), 
       MAX(stars),
       AVG(stars) from review;
--		min:	1	max:	5	avg: 3.7082
		
	
--	ii. Table: Business, Column: Stars
	Select MIN(stars), 
       MAX(stars),
       AVG(stars) from business;
--		min:  1.0	max:   5.0 	avg: 3.6549
		
	
--	iii. Table: Tip, Column: Likes
	Select MIN(likes), 
       MAX(likes),
       AVG(likes) from tip;
--		min:   0 	max:	2	avg: 0.0144
		
	
--	iv. Table: Checkin, Column: Count
    Select MIN(count), 
       MAX(count),
       AVG(count) from checkin;
--		min:	1	max:	53	avg: 1.9414
		
	
--	v. Table: User, Column: Review_count
	Select MIN(review_count), 
       MAX(review_count),
       AVG(review_count) from user;
--		min:	0	max:	2000	avg: 24.2995

-- 5. List the cities with the most reviews in descending order:

	--SQL code used to arrive at answer:
    Select b.City, 
        Count(r.id) 
        from (business) b LEFT JOIN ( review) r
        ON b.id = r.business_id
        GROUP BY 1
        ORDER BY 2 DESC;
	
	
	--Copy and Paste the Result Below: 
    /*
    +-----------------+-------------+
    | b.City          | Count(r.id) |
    +-----------------+-------------+
    | Las Vegas       |         193 |
    | Phoenix         |          65 |
    | Toronto         |          51 |
    | Scottsdale      |          37 |
    | Henderson       |          30 |
    | Tempe           |          28 |
    | Pittsburgh      |          23 |
    | Chandler        |          22 |
    | Charlotte       |          21 |
    | Montréal        |          18 |
    | Madison         |          16 |
    | Gilbert         |          13 |
    | Mesa            |          13 |
    | Cleveland       |          12 |
    | North Las Vegas |           6 |
    | Edinburgh       |           5 |
    | Glendale        |           5 |
    | Lakewood        |           5 |
    | Cave Creek      |           4 |
    | Champaign       |           4 |
    | Markham         |           4 |
    | North York      |           4 |
    | Mississauga     |           3 |
    | Surprise        |           3 |
    | Avondale        |           2 |
    +-----------------+-------------+
    (Output limit exceeded, 25 of 362 total rows shown)
    */

-- 6. Find the distribution of star ratings to the business in the following cities:

--i. Avon

--SQL code used to arrive at answer:
Select b.stars, 
       b.review_count 
       from (business) b 
       WHERE b.City = "Avon"
       ORDER BY 1 DESC;

--Copy and Paste the Resulting Table Below (2 columns â€“ star rating and count):

/*
+---------+----------------+
| b.stars | b.review_count |
+---------+----------------+
|     5.0 |              3 |
|     4.5 |             31 |
|     4.0 |              4 |
|     4.0 |             17 |
|     3.5 |              7 |
|     3.5 |             31 |
|     3.5 |             50 |
|     2.5 |              3 |
|     2.5 |              3 |
|     1.5 |             10 |
+---------+----------------+
*/

--ii. Beachwood

--SQL code used to arrive at answer:
Select b.stars, 
       b.review_count 
       from (business) b 
       WHERE b.City = "Beachwood"
       ORDER BY 1 DESC;

--Copy and Paste the Resulting Table Below (2 columns â€“ star rating and count):
/*
+---------+----------------+
| b.stars | b.review_count |
+---------+----------------+
|     5.0 |              6 |
|     5.0 |              4 |
|     5.0 |              6 |
|     5.0 |              3 |
|     5.0 |              4 |
|     4.5 |             14 |
|     4.5 |              3 |
|     4.0 |             69 |
|     3.5 |              3 |
|     3.5 |              3 |
|     3.0 |              8 |
|     3.0 |              3 |
|     2.5 |              3 |
|     2.0 |              8 |
+---------+----------------+
*/

--7. Find the top 3 users based on their total number of reviews:
		
--	SQL code used to arrive at answer:

Select u.name, 
       u.review_count 
       from (user) u 
       ORDER BY 2 DESC
       LIMIT 3;

Select u.name, 
       Count(r.id) 
       from (user) u INNER JOIN (review) r
       ON u.id = r.user_id
       GROUP BY 1
       ORDER BY 2 DESC
       LIMIT 3;
		
	-- Copy and Paste the Result Below:

    /*
    +--------+----------------+
    | u.name | u.review_count |
    +--------+----------------+
    | Gerald |           2000 |
    | Sara   |           1629 |
    | Yuri   |           1339 |
    +--------+----------------+

    +-----------+-------------+
    | u.name    | Count(r.id) |
    +-----------+-------------+
    | Ed        |           3 |
    | Amy       |           2 |
    | Christina |           2 |
    +-----------+-------------+
    */