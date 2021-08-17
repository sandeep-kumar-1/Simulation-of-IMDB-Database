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

INSERT INTO Entertainment_produt(Id, ordering, title, languages_of_relaese, regions) 
SELECT titleId, ordering, title, language, region FROM title_akas;

----------------------------------------------------------------

INSERT INTO Person(NId, Name, death_year, birth_year)
SELECT nconst, primaryName, deathyear, birthyear FROM name_basics;

----------------------------------------------------------------

CREATE TABLE join4 AS
	SELECT title_basics.isAdult,title_basics.runtimeMinutes, title_basics.startYear, title_basics.endYear, title_basics.originaltitle, title_basics.tconst, title_basics.genres, title_ratings.averagerating
	FROM title_basics
	WHERE titletype = 'tvSeries' AND
	INNER JOIN title_ratings ON title_basics.tconst = title_ratings.tconst;

INSERT INTO TV_series(isadult, Run_time, Start_Date, End_Date, Series_name, Id, genre, rating)
SELECT isAdult, runtimeMinutes, startYear, endYear, originaltitle, tconst, genres, averagerating FROM join4;

----------------------------------------------------------------

CREATE TABLE join1 AS
	SELECT title_epsode.tconst, title_basics.originaltitle, title_basics.isAdult, title_basics.runtimeMinutes, title_basics.startYear, title_epsode.episodeNumber,title_basics.genres,title_epsode.seasonNumber, title_epsode.parentTconst AS pTconst
	FROM title_basics
	INNER JOIN title_epsode ON title_basics.tconst = title_epsode.tconst;


INSERT INTO Episode(Eid,Episode_name,isadult,Run_time,Release_Date, Episode_no, genre,Season_name_or_no, Series_id)
SELECT tconst, originaltitle, isAdult,runtimeMinutes, startYear, ep_num, genre, seasonNumber, pTconst FROM join1;

----------------------------------------------------------------

INSERT INTO Cast_and_crew(Id, NId, Ordering, Role, Character_name)
SELECT tconst, nconst, ordering, category, characters FROM title_principals;

----------------------------------------------------------------

---TITLE CREW, TITLE BASICS, TITLE RATING

CREATE TABLE join2 AS
	SELECT title_basics.tconst, title_basics.originaltitle, title_basics.genres, title_basics.startYear,title_basics.isAdult, title_basics.runtimeMinutes AS run_time, title_crew.directors, title_crew.writers
	FROM title_basics 
	INNER JOIN title_crew ON title_basics.tconst = title_crew.tconst
	WHERE titletype = 'movie';

CREATE TABLE join3 AS
	SELECT join2.tconst, join2.originaltitle, join2.isAdult, join2.genres,join2.startYear,join2.run_time, join2.directors, join2.writers,title_ratings.averagerating AS rating
	FROM join2
	INNER JOIN title_ratings ON join2.tconst = title_ratings.tconst;

INSERT INTO Movie(Movie_name, Id, genre,Release_Date, rating, isAdult, directors, writers, run_time)
SELECT originaltitle, tconst, genres, startYear, rating, isAdult, directors, writers, run_time FROM join3;

----------------------------------------------------------------