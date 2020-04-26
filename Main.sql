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

-- 8. Does posing more reviews correlate with more fans?

	-- Please explain your findings and interpretation of the results:

    -- As table below illustrates, posing more reviews does not necessarily correlate with more fans. 
    -- For example, although, Gerald has posed the most reviews, he has fewer fans in comparison with Mimi. 
    -- Therefore, sorting the users in descending order based on their total number of reviews does not sort the fans in the same order, 
    -- meaning that there is not a correlation between the total number of reviews and number of fans. 	


    SELECT
        name
        , id
        , review_count
        , fans
        FROM user
        ORDER BY 3 DESC;

    /*
    +-----------+------------------------+--------------+------+
    | name      | id                     | review_count | fans |
    +-----------+------------------------+--------------+------+
    | Gerald    | -G7Zkl1wIWBBmD0KRy_sCw |         2000 |  253 |
    | Sara      | -3s52C4zL_DHRK0ULG6qtg |         1629 |   50 |
    | Yuri      | -8lbUNlXVSoXqaRRiHiSNg |         1339 |   76 |
    | .Hon      | -K2Tcgh2EKX6e6HqqIrBIQ |         1246 |  101 |
    | William   | -FZBTkAZEXoP7CYvRV2ZwQ |         1215 |  126 |
    | Harald    | --2vR0DIsmQ6WfcSzKWigw |         1153 |  311 |
    | eric      | -gokwePdbXjfS0iF7NsUGA |         1116 |   16 |
    | Roanna    | -DFCC64NXgqrxlO8aLU5rg |         1039 |  104 |
    | Mimi      | -8EnCioUmDygAbsYZmTeRQ |          968 |  497 |
    | Christine | -0IiMAZI2SsQ7VmyzJjokQ |          930 |  173 |
    | Ed        | -fUARDNuXAfrOn4WLSZLgA |          904 |   38 |
    | Nicole    | -hKniZN2OdshWLHYuj21jQ |          864 |   43 |
    | Fran      | -9da1xk7zgnnfO1uTVYGkA |          862 |  124 |
    | Mark      | -B-QEUESGWHPE_889WJaeg |          861 |  115 |
    | Christina | -kLVfaJytOJY2-QdQoCcNQ |          842 |   85 |
    | Dominic   | -kO6984fXByyZm3_6z2JYg |          836 |   37 |
    | Lissa     | -lh59ko3dxChBSZ9U7LfUw |          834 |  120 |
    | Lisa      | -g3XIcCb2b-BD0QBCcq2Sw |          813 |  159 |
    | Alison    | -l9giG8TSDBG1jnUBUXp5w |          775 |   61 |
    | Sui       | -dw8f7FLaUmWR7bfJ_Yf0w |          754 |   78 |
    | Tim       | -AaBjWJYiQxXkCMDlXfPGw |          702 |   35 |
    | L         | -jt1ACMiZljnBFvS6RRvnA |          696 |   10 |
    | Angela    | -IgKkE8JvYNWeGu8ze4P8Q |          694 |  101 |
    | Crissy    | -hxUwfo3cMnLTv-CAaP69A |          676 |   25 |
    | Lyn       | -H6cTbVxeIRYR-atxdielQ |          675 |   45 |
    +-----------+------------------------+--------------+------+
    (Output limit exceeded, 25 of 10000 total rows shown)
    */

-- 9. Are there more reviews with the word "love" or with the word "hate" in them?

	-- Answer:
    -- LOVE
    	
	-- SQL code used to arrive at answer:
    SELECT  
        SUM(CASE WHEN lower(text) LIKE '%love%' THEN 1 ELSE 0 END) AS LOVE,
        SUM(CASE WHEN lower(text) LIKE '%hate%' THEN 1 ELSE 0 END) AS HATE
        FROM review;
    
    /*
    +------+------+
    | LOVE | HATE |
    +------+------+
    | 1780 |  232 |
    +------+------+
    */

-- 10. Find the top 10 users with the most fans:

	-- SQL code used to arrive at answer:
	
	SELECT 
        name
        ,id
        ,fans
        FROM user
        ORDER BY fans DESC;


	-- Copy and Paste the Result Below:

    /*
    +-----------+------------------------+------+
    | name      | id                     | fans |
    +-----------+------------------------+------+
    | Amy       | -9I98YbNQnLdAmcYfb324Q |  503 |
    | Mimi      | -8EnCioUmDygAbsYZmTeRQ |  497 |
    | Harald    | --2vR0DIsmQ6WfcSzKWigw |  311 |
    | Gerald    | -G7Zkl1wIWBBmD0KRy_sCw |  253 |
    | Christine | -0IiMAZI2SsQ7VmyzJjokQ |  173 |
    | Lisa      | -g3XIcCb2b-BD0QBCcq2Sw |  159 |
    | Cat       | -9bbDysuiWeo2VShFJJtcw |  133 |
    | William   | -FZBTkAZEXoP7CYvRV2ZwQ |  126 |
    | Fran      | -9da1xk7zgnnfO1uTVYGkA |  124 |
    | Lissa     | -lh59ko3dxChBSZ9U7LfUw |  120 |
    | Mark      | -B-QEUESGWHPE_889WJaeg |  115 |
    | Tiffany   | -DmqnhW4Omr3YhmnigaqHg |  111 |
    | bernice   | -cv9PPT7IHux7XUc9dOpkg |  105 |
    | Roanna    | -DFCC64NXgqrxlO8aLU5rg |  104 |
    | Angela    | -IgKkE8JvYNWeGu8ze4P8Q |  101 |
    | .Hon      | -K2Tcgh2EKX6e6HqqIrBIQ |  101 |
    | Ben       | -4viTt9UC44lWCFJwleMNQ |   96 |
    | Linda     | -3i9bhfvrM3F1wsC9XIB8g |   89 |
    | Christina | -kLVfaJytOJY2-QdQoCcNQ |   85 |
    | Jessica   | -ePh4Prox7ZXnEBNGKyUEA |   84 |
    | Greg      | -4BEUkLvHQntN6qPfKJP2w |   81 |
    | Nieves    | -C-l8EHSLXtZZVfUAUhsPA |   80 |
    | Sui       | -dw8f7FLaUmWR7bfJ_Yf0w |   78 |
    | Yuri      | -8lbUNlXVSoXqaRRiHiSNg |   76 |
    | Nicole    | -0zEEaDFIjABtPQni0XlHA |   73 |
    +-----------+------------------------+------+
    (Output limit exceeded, 25 of 10000 total rows shown)
    */

--    Part 2: Inferences and Analysis

--  1. Pick one city and category of your choice (Toronto) & (Restaurants)
--  and group the businesses in that city or category by their overall star rating. 
--  Compare the businesses with 2-3 stars to the businesses with 4-5 stars and answer the following questions. Include your code.

SELECT  (name), 
        (stars),
        (category) from business b INNER JOIN category c 
        ON b.id = c.business_id
        WHERE (city = "Toronto") AND (stars >= 4);

/*
+---------------+-------+-----------------------+
| name          | stars | category              |
+---------------+-------+-----------------------+
| Mama Mia      |   4.0 | Spanish               |
| Mama Mia      |   4.0 | Mexican               |
| Mama Mia      |   4.0 | Restaurants           |
| Mama Mia      |   4.0 | Latin American        |
| Cabin Fever   |   4.5 | Cafes                 |
| Cabin Fever   |   4.5 | Art Galleries         |
| Cabin Fever   |   4.5 | Arts & Entertainment  |
| Cabin Fever   |   4.5 | Restaurants           |
| Cabin Fever   |   4.5 | Books                 |
| Cabin Fever   |   4.5 | Mags                  |
| Cabin Fever   |   4.5 | Music & Video         |
| Cabin Fever   |   4.5 | Shopping              |
| Cabin Fever   |   4.5 | Coffee & Tea          |
| Cabin Fever   |   4.5 | Pubs                  |
| Cabin Fever   |   4.5 | Bars                  |
| Cabin Fever   |   4.5 | Food                  |
| Cabin Fever   |   4.5 | Vinyl Records         |
| Cabin Fever   |   4.5 | Nightlife             |
| Cabin Fever   |   4.5 | Arcades               |
| Gussied Up    |   4.5 | Women's Clothing      |
| Gussied Up    |   4.5 | Shopping              |
| Gussied Up    |   4.5 | Fashion               |
| Innercity MMA |   5.0 | Fitness & Instruction |
| Innercity MMA |   5.0 | Martial Arts          |
| Innercity MMA |   5.0 | Active Life           |
+---------------+-------+-----------------------+
(Output limit exceeded, 25 of 59 total rows shown)
*/

SELECT  (name), 
        (stars),
        (category) from business b INNER JOIN category c 
        ON b.id = c.business_id
        WHERE (city = "Toronto") AND (stars >= 2 AND stars <= 3);

/*
+--------------------------------+-------+------------------------------+
| name                           | stars | category                     |
+--------------------------------+-------+------------------------------+
| Big Smoke Burger               |   3.0 | Poutineries                  |
| Big Smoke Burger               |   3.0 | Burgers                      |
| Big Smoke Burger               |   3.0 | Restaurants                  |
| 99 Cent Sushi                  |   2.0 | Sushi Bars                   |
| 99 Cent Sushi                  |   2.0 | Japanese                     |
| 99 Cent Sushi                  |   2.0 | Restaurants                  |
| Pizzaiolo                      |   3.0 | Pizza                        |
| Pizzaiolo                      |   3.0 | Restaurants                  |
| The Gym at 99 Sudbury          |   3.0 | Active Life                  |
| The Gym at 99 Sudbury          |   3.0 | Gyms                         |
| The Gym at 99 Sudbury          |   3.0 | Fitness & Instruction        |
| The Gym at 99 Sudbury          |   3.0 | Yoga                         |
| Loblaws                        |   2.5 | Food                         |
| Loblaws                        |   2.5 | Grocery                      |
| The Fox & Fiddle               |   2.5 | Pubs                         |
| The Fox & Fiddle               |   2.5 | Nightlife                    |
| The Fox & Fiddle               |   2.5 | Bars                         |
| Humber River Regional Hospital |   2.0 | Hospitals                    |
| Humber River Regional Hospital |   2.0 | Medical Centers              |
| Humber River Regional Hospital |   2.0 | Health & Medical             |
| Humber River Regional Hospital |   2.0 | Public Services & Government |
+--------------------------------+-------+------------------------------+
*/
	
i. Do the two groups you chose to analyze have a different distribution of hours?
-- YES, Higher stars at Restaurants opens at 16-18

SELECT  (name), 
        (stars),
        (category),
        (review_count),
        (hours) FROM 
        business b INNER JOIN category c ON b.id = c.business_id
        INNER JOIN hours h ON h.business_id = c.business_id
        WHERE (city = "Toronto") 
        AND (stars >= 4)
        AND (category = 'Restaurants');
/*
+-------------+-------+-------------+--------------+-----------------------+
| name        | stars | category    | review_count | hours                 |
+-------------+-------+-------------+--------------+-----------------------+
| Cabin Fever |   4.5 | Restaurants |           26 | Monday|16:00-2:00     |
| Cabin Fever |   4.5 | Restaurants |           26 | Tuesday|18:00-2:00    |
| Cabin Fever |   4.5 | Restaurants |           26 | Friday|18:00-2:00     |
| Cabin Fever |   4.5 | Restaurants |           26 | Wednesday|18:00-2:00  |
| Cabin Fever |   4.5 | Restaurants |           26 | Thursday|18:00-2:00   |
| Cabin Fever |   4.5 | Restaurants |           26 | Sunday|16:00-2:00     |
| Cabin Fever |   4.5 | Restaurants |           26 | Saturday|16:00-2:00   |
| Sushi Osaka |   4.5 | Restaurants |            8 | Monday|11:00-23:00    |
| Sushi Osaka |   4.5 | Restaurants |            8 | Tuesday|11:00-23:00   |
| Sushi Osaka |   4.5 | Restaurants |            8 | Friday|11:00-23:00    |
| Sushi Osaka |   4.5 | Restaurants |            8 | Wednesday|11:00-23:00 |
| Sushi Osaka |   4.5 | Restaurants |            8 | Thursday|11:00-23:00  |
| Sushi Osaka |   4.5 | Restaurants |            8 | Sunday|14:00-23:00    |
| Sushi Osaka |   4.5 | Restaurants |            8 | Saturday|11:00-23:00  |
| Edulis      |   4.0 | Restaurants |           89 | Sunday|12:00-16:00    |
| Edulis      |   4.0 | Restaurants |           89 | Friday|18:00-23:00    |
| Edulis      |   4.0 | Restaurants |           89 | Wednesday|18:00-23:00 |
| Edulis      |   4.0 | Restaurants |           89 | Thursday|18:00-23:00  |
| Edulis      |   4.0 | Restaurants |           89 | Saturday|18:00-23:00  |
+-------------+-------+-------------+--------------+-----------------------+
*/

SELECT  (name), 
        (stars),
        (category),
        (review_count),
        (hours) FROM 
        business b INNER JOIN category c ON b.id = c.business_id
        INNER JOIN hours h ON h.business_id = c.business_id
        WHERE (city = "Toronto") 
        AND (stars >= 2 AND stars <= 3)
        AND (category = 'Restaurants');


/*
+------------------+-------+-------------+--------------+-----------------------+
| name             | stars | category    | review_count | hours                 |
+------------------+-------+-------------+--------------+-----------------------+
| Big Smoke Burger |   3.0 | Restaurants |           47 | Monday|10:30-21:00    |
| Big Smoke Burger |   3.0 | Restaurants |           47 | Tuesday|10:30-21:00   |
| Big Smoke Burger |   3.0 | Restaurants |           47 | Friday|10:30-21:00    |
| Big Smoke Burger |   3.0 | Restaurants |           47 | Wednesday|10:30-21:00 |
| Big Smoke Burger |   3.0 | Restaurants |           47 | Thursday|10:30-21:00  |
| Big Smoke Burger |   3.0 | Restaurants |           47 | Sunday|11:00-19:00    |
| Big Smoke Burger |   3.0 | Restaurants |           47 | Saturday|10:30-21:00  |
| 99 Cent Sushi    |   2.0 | Restaurants |            5 | Monday|11:00-23:00    |
| 99 Cent Sushi    |   2.0 | Restaurants |            5 | Tuesday|11:00-23:00   |
| 99 Cent Sushi    |   2.0 | Restaurants |            5 | Friday|11:00-23:00    |
| 99 Cent Sushi    |   2.0 | Restaurants |            5 | Wednesday|11:00-23:00 |
| 99 Cent Sushi    |   2.0 | Restaurants |            5 | Thursday|11:00-23:00  |
| 99 Cent Sushi    |   2.0 | Restaurants |            5 | Sunday|11:00-23:00    |
| 99 Cent Sushi    |   2.0 | Restaurants |            5 | Saturday|11:00-23:00  |
| Pizzaiolo        |   3.0 | Restaurants |           34 | Monday|9:00-23:00     |
| Pizzaiolo        |   3.0 | Restaurants |           34 | Tuesday|9:00-23:00    |
| Pizzaiolo        |   3.0 | Restaurants |           34 | Friday|9:00-4:00      |
| Pizzaiolo        |   3.0 | Restaurants |           34 | Wednesday|9:00-23:00  |
| Pizzaiolo        |   3.0 | Restaurants |           34 | Thursday|9:00-23:00   |
| Pizzaiolo        |   3.0 | Restaurants |           34 | Sunday|10:00-23:00    |
| Pizzaiolo        |   3.0 | Restaurants |           34 | Saturday|10:00-4:00   |
+------------------+-------+-------------+--------------+-----------------------+
*/


-- ii. Do the two groups you chose to analyze have a different number of reviews?
-- YES

         
         
-- iii. Are you able to infer anything from the location data provided between these two groups? Explain.
-- There's no difference 

SQL code used for analysis:

SELECT  (name), 
        (stars),
        (category),
        (review_count),
        (hours),
        (latitude),
        (longitude) FROM 
        business b INNER JOIN category c ON b.id = c.business_id
        INNER JOIN hours h ON h.business_id = c.business_id
        WHERE (city = "Toronto") 
        AND (stars >= 4)
        AND (category = 'Restaurants')
        ORDER BY 4;


--  2.	Group business based on the ones that are open and the ones that are closed. What differences can you find between the ones that are still open and the ones that are closed? 
--  List at least two differences and the SQL code you used to arrive at your answer.
		
	-- i. 	Difference 1: The business that are still open have higher rating.
    -- ii.	Difference 2: The business that are still open have more reviews.

	-- SQL code used for analysis:

SELECT  (name), 
        (stars),
        (category),
        (review_count),
        (hours),
        (neighborhood)
        FROM 
        business b INNER JOIN category c ON b.id = c.business_id
        INNER JOIN hours h ON h.business_id = c.business_id
        WHERE (is_open = 1)
        GROUP BY 1
        ORDER BY 4 DESC;




-- 3. For this last part of your analysis, you are going to choose the type of analysis you want to conduct on the Yelp dataset and are going to prepare the data for analysis.
-- Ideas for analysis include: Parsing out keywords and business attributes for sentiment analysis, clustering businesses to find commonalities or anomalies between them, predicting the overall star rating for a business, predicting the number of fans a user will have, and so on. These are just a few examples to get you started, so feel free to be creative and come up with your own problem you want to solve. Provide answers, in-line, to all of the following:
	
-- i. Indicate the type of analysis you chose to do: (Which business do people review?)
         
         
-- ii. Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data:
/*
I want to know, What people like to review more? and In which city?
*/
                           
                  
iii. Output of your finished dataset:

/*
+------------------------+----------------------+
| category               | REVIEW NUMBER        |
+------------------------+----------------------+
| Restaurants            |                    9 |
| Food                   |                    6 |
| American (Traditional) |                    4 |
| Nightlife              |                    4 |
| Barbeque               |                    3 |
| Bars                   |                    3 |
| Smokehouse             |                    3 |
| Asian Fusion           |                    2 |
| Breakfast & Brunch     |                    2 |
| Chinese                |                    2 |
| Ethnic Food            |                    2 |
| Farmers Market         |                    2 |
| Fruits & Veggies       |                    2 |
| Malaysian              |                    2 |
| Market Stalls          |                    2 |
| Meat Shops             |                    2 |
| Noodles                |                    2 |
| Public Markets         |                    2 |
| Seafood Markets        |                    2 |
| Shopping               |                    2 |
| Soup                   |                    2 |
| Specialty Food         |                    2 |
| Taiwanese              |                    2 |
| Active Life            |                    1 |
| Arts & Entertainment   |                    1 |
+------------------------+----------------------+
*/

/*
+-----------------+---------------+
| city            | NUMBER_REVIEW |
+-----------------+---------------+
| Las Vegas       |           193 |
| Phoenix         |            65 |
| Toronto         |            51 |
| Scottsdale      |            37 |
| Henderson       |            30 |
| Tempe           |            28 |
| Pittsburgh      |            23 |
| Chandler        |            22 |
| Charlotte       |            21 |
| Montréal        |            18 |
| Madison         |            16 |
| Gilbert         |            13 |
| Mesa            |            13 |
| Cleveland       |            12 |
| North Las Vegas |             6 |
| Edinburgh       |             5 |
| Glendale        |             5 |
| Lakewood        |             5 |
| Cave Creek      |             4 |
| Champaign       |             4 |
| Markham         |             4 |
| North York      |             4 |
| Mississauga     |             3 |
| Surprise        |             3 |
| Avondale        |             2 |
+-----------------+---------------+
(Output limit exceeded, 25 of 67 total rows shown)
*/
         
         
iv. Provide the SQL code you used to create your final dataset:


SELECT  category, COUNT(r.business_id) AS REVIEW_NUMBER
        FROM review r INNER JOIN business b ON r.business_id = b.id
        INNER JOIN category c ON r.business_id = c.business_id
        GROUP BY 1
        ORDER BY 2 DESC;

SELECT  city, COUNT(r.id) AS NUMBER_REVIEW
        FROM review r INNER JOIN business b ON r.business_id = b.id
        GROUP BY 1
        ORDER BY 2 DESC;