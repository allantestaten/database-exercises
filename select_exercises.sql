--1. Create a new file called select_exercises.sql. Store your code for this exercise in that file. You should be testing your code in MySQL Workbench as you go.

--2. Use the albums_db database.

--3. Explore the structure of the albums table.

-- a. How many rows are in the albums table?
    - 31 rows
SELECT *
FROM albums; 
-- b. How many unique artist names are in the albums table?
    - 23
SELECT DISTINCT artist
FROM albums; 
-- c. What is the primary key for the albums table?
	- id
-- d. What is the oldest release date for any album in the albums table? What is the most recent release date?
	SELECT *
	FROM albums
	-- Sorted in mySQL Result Grid
	- oldest 1967
	- Most recent 2011
--4. Write queries to find the following information:

-- a. The name of all albums by Pink Floyd
SELECT *
FROM albums
WHERE artist = 'Pink Floyd';
-- Names 'The Dark Side of the Moon' and 'The Wall'
-- b. The year Sgt. Pepper's Lonely Hearts Club Band was released 
SELECT *
FROM albums
WHERE name = 'Sgt. Pepper''s Lonely Hearts Club Band'
--	1967

-- c. The genre for the album Nevermind
SELECT *
FROM albums
WHERE name = 'Nevermind'
-- Grunge, Alternative rock

-- d. Which albums were released in the 1990s
SELECT name
FROM albums
WHERE release_date BETWEEN 1990 AND 1999

--# name 'The Bodyguard'
--'Jagged Little Pill'
--'Come On Over'
--'Falling into You'
--'Let\'s Talk About Love'
--'Dangerous'
--'The Immaculate Collection'
--'Titanic: Music from the Motion Picture'
--'Metallica'
--'Nevermind'
--'Supernatural'

-- e. Which albums had less than 20 million certified sales
SELECT name
FROM albums
WHERE sales < 20000000

--Thriller
--Back in Black
--The Dark Side of the Moon
--Bat Out of Hell
--The Bodyguard
--Their Greatest Hits (1971–1975)
--Saturday Night Fever
--Rumours
--Grease: The Original Soundtrack from the Motion Picture
--Led Zeppelin IV
--Bad
--Jagged Little Pill
--Come On Over
--Falling into You
--Sgt. Pepper's Lonely Hearts Club Band
--Hotel California
--Dirty Dancing
--21
--Let's Talk About Love
--1
--Dangerous
--The Immaculate Collection
--Abbey Road
--Born in the U.S.A.
--Brothers in Arms
--Titanic: Music from the Motion Picture
--Metallica
--Nevermind
--The Wall
--Supernatural
--Appetite for Destruction

-- f. All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?
SELECT name
FROM albums
WHERE genre = 'rock'
-- Does not include hard rock because of the back tics 
--'Sgt. Pepper\'s Lonely Hearts Club Band'
--'1'
--'Abbey Road'
--'Born in the U.S.A.'
--'Supernatural'

