------------------------------------------------------------------
------------------------------------------------------------------
--	Course ID: CS3563											--
--																--
--	Group No: 28												--
--																--
--	Members : Deepak Reddy	|	Sandeep Kumar					--
--																--
--			  Sai Krishna	|	Yashwanth Purli					--
--																--
------------------------------------------------------------------
------------------------------------------------------------------
--Q1

CREATE VIEW Q1 AS
	SELECT id,movie_name,regexp_split_to_array(directors, ',') AS Arr
	FROM movie;

SELECT id,movie_name,Arr
FROM Q1
WHERE cardinality(Arr) > 1;

------------------------------------------------------------------
--Q2

SELECT nid, name FROM person
WHERE name ='Zack Snyder';
--Zack Snyder (nid) = nm0811583

--Movie inner join cast & crew
CREATE VIEW Q2_1 AS
	SELECT id, movie_name, regexp_split_to_table(directors, ',') AS director, rating
	FROM movie;

CREATE VIEW Q2_2 AS
	SELECT Q2_1.id, Q2_1.director,Q2_1.rating, cast_and_crew.nid, cast_and_crew.role
	FROM Q2_1
	INNER JOIN cast_and_crew ON Q2_1.id = cast_and_crew.id
	WHERE role = 'actor' OR role = 'actress';

CREATE VIEW Q2_3 AS
	SELECT nid, director, COUNT(id) AS mv_count FROM Q2_2
	GROUP BY nid, director;

CREATE VIEW Q2_4 AS
	SELECT nid, MAX(mv_count) as mc FROM Q2_3
	GROUP BY nid;
	
SELECT Q2_3.nid, Q2_3.director, Q2_4.mc FROM Q2_3
INNER JOIN Q2_4 ON Q2_3.nid = Q2_4.nid AND Q2_3.mv_count = Q2_4.mc
WHERE director = 'nm0811583';

-----------------------------------------------------------------
--Q3

CREATE VIEW Q3_1 AS
	SELECT movie.id, movie.movie_name, Award.award_id 
	FROM movie
	INNER JOIN Award ON movie.id = Award.id;

SELECT movie_name, COUNT(award_id) AS aw_count FROM Q3_1
GROUP BY movie_name
HAVING aw_count < 2;
-----------------------------------------------------------------
--Q4

SELECT nid, director, COUNT(id), rating FROM Q2_2
WHERE rating > 7
GROUP BY nid,director, rating
HAVING COUNT(id) < 2;

-----------------------------------------------------------------
--Q5

SELECT id, series_name, end_date-start_date FROM tv_series
WHERE end_date-start_date = (SELECT MAX(end_date-start_date) FROM tv_series);

-----------------------------------------------------------------
--Q6

CREATE VIEW Q6 AS
	SELECT directors,movie_name,run_time FROM movie
	WHERE  release_date = 2020
	ORDER BY run_time;
	
SELECT MIN(run_time) AS run_time FROM Q6
WHERE run_time > (SELECT MIN(run_time) FROM Q6)
--GROUP BY directors;
SELECT directors FROM movie
WHERE run_time = 6 AND release_date = 2020

-----------------------------------------------------------------
--Q7

SELECT MIN(rating) FROM tv_series
WHERE isAdult = True

SELECT series_name FROM tv_series
WHERE isAdult = true AND rating = 3

SELECT MIN(rating) FROM movie
WHERE isAdult = True

SELECT movie_name FROM movie
WHERE isAdult = true AND rating = 1.1

-----------------------------------------------------------------
--Q8

SELECT TOP director, AVG(rating) as ratings FROM Q2_1
GROUP BY director
ORDER BY ratings
LIMIT 5 DESC;

-----------------------------------------------------------------
--Q9

CREATE VIEW Q9_1 AS
	SELECT tv_series.id, tv_series.series_name, Entertainment_produt.regions
	FROM tv_series 
	INNER JOIN Entertainment_produt ON tv_series.id = Entertainment_produt.id
	WHERE cardinality(regions) > 2;

CREATE VIEW Q9_2 AS
	SELECT Q9_1.id, Q9_1.series_name, production_studio.company_id
	FROM Q9_1
	INNER JOIN production_studio ON Q9_1.id = production_studio.id;

SELECT id,series_name, COUNT(company_id) FROM Q9_2
GROUP BY id,series_name
HAVING COUNT(company_id) > 1; 

-----------------------------------------------------------------
--Q10

CREATE VIEW Q10_1 as
	SELECT person.nid, person.name, Award.year, Award.award_id, Award.Award_name
	FROM person
	INNER JOIN Award ON person.award_id = Award.award_id
	WHERE Award_name = 'Oscar';

SELECT name, year FROM Q10_1
ORDER BY year DESC;

-----------------------------------------------------------------
--Q11

CREATE VIEW Q11_1 AS 
	SELECT movie.id,movie.rating, cast_and_crew.nid, cast_and_crew.role, 
	FROM movie
	INNER JOIN cast_and_crew ON movie.id = cast_and_crew.id
	WHERE role = 'director';

CREATE VIEW Q11_2 AS 
	SELECT nid, COUNT(id) AS exp, AVG(rating) AS avg_mr FROM Q11_1
	GROUP BY nid;

SELECT nid, 0.3*exp + 0.7*avg_mr AS Score FROM Q11_2
ORDER BY Score DESC;

-----------------------------------------------------------------
--Q12

CREATE VIEW Q12_1 AS
	SELECT id, movie_name, directors,boxoffice,regexp_split_to_table(genre, ',') AS genre, rating
	FROM movie;

CREATE VIEW Q12_2 as 
    SELECT *, ROW_NUMBER()
    over (
        PARTITION BY genre
        order by boxoffice DESC
    ) AS Row_No
    FROM Q12_1;

SELECT movie_name, directors FROM Q12_2 WHERE Row_No <= 5;
--Can do join with person for Director name.

-----------------------------------------------------------------
--Q13

CREATE VIEW Q13_1 AS 
	SELECT movie.id, cast_and_crew.nid
	FROM movie
	INNER JOIN cast_and_crew ON movie.id = cast_and_crew.id;

CREATE VIEW Q13_2 AS
	SELECT tv_series.id, cast_and_crew.nid
	FROM tv_series
	INNER JOIN cast_and_crew ON tv_series.id = cast_and_crew.id;

--CREATE VIEW Q13_3 AS
	SELECT Q13_1.nid FROM Q13_1
	INNER JOIN Q13_2 ON Q13_1.nid = Q13_2.nid
	GROUP BY Q13_1.nid;

-----------------------------------------------------------------
--Q14

CREATE VIEW Q14_1 AS
	SELECT Release_date, MIN(run_time) AS min_runtime
	FROM episode
	GROUP BY Release_date;

CREATE VIEW Q14_2 AS
	SELECT episode.release_date, episode.episode_name, Q14_1.min_runtime
	FROM episode
	INNER JOIN Q14_1 ON episode.release_date = Q14_1.release_date AND episode.run_time = Q14_1.min_runtime;

SELECT * FROM Q14_2
ORDER BY release_date;

-----------------------------------------------------------------
--Q15

CREATE VIEW Q15_1 AS
	SELECT id, movie_name, regexp_split_to_table(genre, ',') AS genre, rating
	FROM movie;

CREATE VIEW Q15_2 as 
    SELECT *, ROW_NUMBER()
    over (
        PARTITION BY genre
        order by rating DESC
    ) AS Row_No
    FROM Q15_1;

SELECT * FROM Q15_2 WHERE Row_No <= 3

-----------------------------------------------------------------
--Q16

SELECT series_name FROM tv_series
WHERE 'Switzerland' IN filmedin;

SELECT movie_name FROM movie
WHERE 'Switzerland' IN filmedin;

-----------------------------------------------------------------
--Q17

SELECT id, movie_name, release_date, isAdult FROM movie
WHERE isAdult = true AND release_date = 1995;

-----------------------------------------------------------------
--Q18

CREATE VIEW Q18_1 AS
	SELECT person.nid, person.name, person.birth_year, cast_and_crew.role
	FROM person
	INNER JOIN cast_and_crew ON person.nid = cast_and_crew.nid;
	WHERE birth_year is not NULL;

CREATE VIEW Q18_2 as 
    SELECT *, ROW_NUMBER()
    over (
        PARTITION BY role
        order by birth_year DESC
    ) AS Row_No
    FROM Q18_1;

SELECT * FROM Q18_2 WHERE Row_No = 1;
-----------------------------------------------------------------
--Q19

--music tech = 'achieve_sound'
CREATE VIEW Q19_1 AS
	SELECT movie.id, cast_and_crew.role, cast_and_crew.nid
	FROM movie
	INNER JOIN cast_and_crew ON movie.id = cast_and_crew.id
	WHERE role = 'archive_sound';

SELECT nid, COUNT(id) FROM Q19_1
GROUP BY nid
HAVING COUNT(id) > 4;

--Alternate query for Count
SELECT nid, COUNT(id) FROM Q19_1
GROUP BY nid
ORDER BY nid;

-----------------------------------------------------------------
--Q20

--movie name = 'Angel Wolf'
CREATE VIEW Q20_1 AS
	SELECT movie.movie_name, movie.id, cast_and_crew.nid
	FROM movie
	INNER JOIN cast_and_crew ON movie.id = cast_and_crew.id;

SELECT nid, COUNT(id) FROM Q20_1
GROUP BY nid
HAVING COUNT(id) = (SELECT COUNT(nid) FROM Q20_1 WHERE movie_name = 'Angel Wolf');

------------------------------------------------------------------