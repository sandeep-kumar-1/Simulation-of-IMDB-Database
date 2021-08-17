------------------------------------------------------------------
------------------------------------------------------------------
--  Course ID: CS3563                                           --
--                                                              --
--  Group No: 28                                                --
--                                                              --
--  Members : Deepak Reddy  | Sandeep Kumar                     --
--                                                              --
--              Sai Krishna | Yashwanth Purli                   --
--                                                              --
------------------------------------------------------------------
------------------------------------------------------------------

CREATE TABLE name_basics(
  nconst TEXT,
  primaryName TEXT,
  birthYear INT,
  deathYear INT,
  primaryProfession TEXT,
  knownForTitles TEXT
);
------------------------------------------------------------------

CREATE TABLE title_akas (
  titleid TEXT,
  ordering INT,
  title TEXT,
  region TEXT,
  language TEXT,
  types TEXT,
  attributers TEXT,
  isoriginaltitle TEXT
);
------------------------------------------------------------------

CREATE TABLE title_basics (
  tconst TEXT,
  titleType TEXT,
  primaryTitle TEXT,
  originalTitle TEXT, 
  isAdult BOOL,
  startYear INT,
  endYear INT,
  runtimeMinutes INT,
  genres TEXT
);
------------------------------------------------------------------

CREATE TABLE title_crew (
  tconst TEXT,
  directors TEXT,
  writers TEXT
);
------------------------------------------------------------------

CREATE TABLE title_epsode (
  tconst TEXT,
  parentTconst TEXT,
  seasonNumber INT,
  episodeNumber INT 
);
------------------------------------------------------------------

CREATE TABLE title_principals(
  tconst TEXT,
  ordering INT,
  nconst TEXT,
  category TEXT,
  job TEXT,
  characters TEXT
);
------------------------------------------------------------------

CREATE TABLE title_ratings(
  tconst TEXT,
  averagerating FLOAT,
  numVotes INT
);
------------------------------------------------------------------

COPY name_basics
FROM '/home/krishna/Downloads/DBMS-2/name.basics.csv' (
    format csv,
    DELIMITER E'\t',
    HEADER 1,
    NULL '\N',
    quote E'\f'
  );
------------------------------------------------------------------

COPY title_akas
FROM '/home/krishna/Downloads/DBMS-2/title.akas.csv' (
    format csv,
    DELIMITER E'\t',
    HEADER 1,
    NULL '\N',
    quote E'\f'
  );
------------------------------------------------------------------

COPY title_basics
FROM '/home/krishna/Downloads/DBMS-2/title.basics.csv' (
    format csv,
    DELIMITER E'\t',
    HEADER 1,
    NULL '\N',
    quote E'\f'
  );
------------------------------------------------------------------

COPY title_crew
FROM '/home/krishna/Downloads/DBMS-2/title.crew.csv' (
    format csv,
    DELIMITER E'\t',
    HEADER 1,
    NULL '\N',
    quote E'\f'
  );
------------------------------------------------------------------

COPY title_epsode
FROM '/home/krishna/Downloads/DBMS-2/title.episode.csv' (
    format csv,
    DELIMITER E'\t',
    HEADER 1,
    NULL '\N',
    quote E'\f'
  );
------------------------------------------------------------------

COPY title_principals
FROM '/home/krishna/Downloads/DBMS-2/title.principals.csv' (
    format csv,
    DELIMITER E'\t',
    HEADER 1,
    NULL '\N',
    quote E'\f'
  );
------------------------------------------------------------------

COPY title_ratings
FROM '/home/krishna/Downloads/DBMS-2/title.ratings.csv' (
    format csv,
    DELIMITER E'\t',
    HEADER 1,
    NULL '\N',
    quote E'\f'
  );
------------------------------------------------------------------