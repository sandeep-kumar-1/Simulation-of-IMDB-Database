------------------------------------------------------------------
------------------------------------------------------------------
--  Course ID: CS3563                                           --
--                                                              --
--  Group No: 28                                                --
--                                                              --
--  Members : Deepak Reddy  | Sandeep Kumar                     --
--                                                              --
--        Sai Krishna | Yashwanth Purli                         --
--                                                              --
------------------------------------------------------------------
------------------------------------------------------------------

--DATA in title_ratings
CREATE TABLE Entertainment_produt
(
  Id TEXT,
  ordering INT,
  Budget INT,
  title TEXT,
  languages_of_relaese TEXT,
  regions TEXT,
  PRIMARY KEY (Id,ordering)
);

------------------------------------------------------------------

--No DATA
CREATE TABLE Production_studio
(
  Studio_name TEXT,
  Comapny_Id TEXT,
  ordering INT,
  Id TEXT,
  PRIMARY KEY (Comapny_Id, ordering)
);

------------------------------------------------------------------

--No DATA
CREATE TABLE OTT_platform
(
  Platform_name TEXT,
  Platform_ID TEXT,
  PRIMARY KEY (Platform_ID)
);

------------------------------------------------------------------

--DATA in name_basics 
CREATE TABLE Person
(
  NId TEXT,
  Name TEXT,
  death_year INT,
  Gender TEXT,
  birth_year INT,
  Award_id TEXT,
  PRIMARY KEY (NId)
);

------------------------------------------------------------------

--No DATA
CREATE TABLE Award
(
  Award_Name TEXT,
  Award_id TEXT,
  Category TEXT,
  Year INT,
  Id TEXT,
  PRIMARY KEY (Award_id)
);

------------------------------------------------------------------

--NO DATA
CREATE TABLE Production_Info
(
  Id TEXT,
  Comapny_Id TEXT,
  PRIMARY KEY (Id, Comapny_Id)
);

------------------------------------------------------------------

--No DATA
CREATE TABLE Nominations_for_person
(
  Won BOOL,
  Category TEXT,
  NId TEXT,
  PRIMARY KEY (NId)
);

------------------------------------------------------------------

--No DATA
CREATE TABLE Nominations_for_EP
(
  Won BOOL,
  Id TEXT,
  Category TEXT,
  PRIMARY KEY (Id)
);

------------------------------------------------------------------

CREATE TABLE TV_series
(
  isadult BOOL,
  Rating FLOAT,
  Run_Time INT,
  Start_Date INT,
  End_Date INT,
  Series_name TEXT,
  Id TEXT,
  genre TEXT,
  Filmedin TEXT,
  animal_abuse BOOL,
  Drinking_smoking BOOL,
  rating FLOAT,
  PRIMARY KEY (Id)
);

------------------------------------------------------------------

--inner join title.basics, title.episode for EPS_NAME,Series name
--DATA in title.episode
CREATE TABLE Episode
(
  Eid TEXT,
  Episode_name TEXT,
  isadult BOOL,
  Run_time INT,
  Release_Date INT,
  Episode_no INT,
  genre TEXT,
  Season_name_or_no TEXT,
  Series_id TEXT,
  Filmedin TEXT,
  animal_abuse BOOL,
  Drinking_smoking BOOL,
  PRIMARY KEY (Eid)
);

------------------------------------------------------------------

--No DATA                               
CREATE TABLE Digital_rights_for_series
(
  Licensing_value INT,
  Platform_ID TEXT,
  Series_name TEXT,
  PRIMARY KEY (Platform_ID, Series_name)
);

------------------------------------------------------------------

--DATA in title.basics (use WHERE to extract movie) 
CREATE TABLE Movie
(
  BoxOffice INT,
  Movie_name TEXT,
  Certificate TEXT,
  Id TEXT NOT NULL,
  genre TEXT,
  Run_time INT,
  directors TEXT,
  writers TEXT,
  Filmedin TEXT,
  Release_Date INT,
  animal_abuse BOOL,
  Drinking_smoking BOOL,
  rating FLOAT,
  isadult BOOL,                                                                                                                                                                                                                                                                                                                       
  PRIMARY KEY (Id)
);

------------------------------------------------------------------

--No DATA
CREATE TABLE Digital_Rights_for_movie
(
  Licensing_value INT,
  Platform_ID TEXT,
  Movie_name TEXT,
  PRIMARY KEY (Platform_ID)
);

------------------------------------------------------------------

CREATE TABLE Cast_and_Crew
(
  Character_name TEXT,
  Role TEXT,
  NId TEXT,
  Id TEXT,
  Ordering INT,
  PRIMARY KEY (Id,Ordering)
);

------------------------------------------------------------------