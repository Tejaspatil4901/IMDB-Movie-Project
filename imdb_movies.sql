use project_movie_database;
select* from directors;
select * from movies;


 /*
Attribute Information:

Table Directors:
- Name: Name of the Director
- ID: Unique ID of the Directors
- Gender: Gender of the Director → 0/2 = Male, 1 = Female
- Department: Department of the Directors

Table Movies:
- ID: Unique ID for Movies
- Original_title: Movie name
- Budget: Budget of the movie
- Popularity: Popularity of the Movie
- Release_Date: Release date for the movies
- Revenue: Revenue collected by the movie
- Title: Initial title of the movie
- Vote_Average: Average IMDB rating
- Vote_Count: Number of votes the movie got
- Overview: Description of the movie
- Tagline: Tagline of the Movie
- UID: Unique ID for Movie
- Director_ID: Director ID (foreign key to Directors table)
*/



SELECT 
    m.UID,
    m.Title,
    m.Original_title,
    m.Budget,
    m.Popularity,
    m.Release_Date,
    m.Revenue,
    m.Vote_Average,
    m.Vote_Count,
    m.Overview,
    m.Tagline,
    d.ID AS director_ID,
    d.Name AS director_Name,
    d.Gender,
    d.Department
FROM movies m
JOIN directors d
ON m.director_ID = d.ID;



-- Perform the Problem Queries:

-- a)Can you get all data about movies? 
SELECT * FROM movies;


-- B)How do you get all data about directors?
SELECT 
    ID AS Director_ID,
    Name AS Director_Name,
    Gender,
    Department
FROM directors;

-- c) Check how many movies are present in IMDB.?
SELECT COUNT(*) AS Total_movies
FROM movies;



-- d) Find these 3 directors: James Cameron ; Luc Besson ; John Woo?
SELECT * 
FROM directors
WHERE Name IN ('James Cameron', 'Luc Besson', 'John Woo');

-- e) Find all directors with name starting with S.?
SELECT * 
FROM directors
WHERE Name LIKE 'S%';

-- f) Count female directors.?
SELECT COUNT(*) AS female_directors FROM directors where gender = 1;

-- g) Find the name of the 10th first women directors?
SELECT Name FROM directors
WHERE Gender = 1
ORDER BY Name
LIMIT 10;


-- h) What are the 3 most popular movies?
SELECT title,popularity
FROM movies
ORDER BY popularity DESC
LIMIT 3;


-- I) What are the 3 most bankable movies?
SELECT title,revenue
FROM movies
ORDER BY revenue DESC
LIMIT 3;


-- J)What is the most awarded average vote since the January 1st, 2000?
SELECT title,release_date,vote_average 
FROM movies 
WHERE release_date > '2000-01-01'
ORDER BY vote_average  
DESC LIMIT 1;




-- K) Which movie(s) were directed by Brenda Chapman?
SELECT m.title,m.release_date,m.vote_average ,m.revenue
from movies m
JOIN 
directors d ON m.director_id =d.id
WHERE d.name ='Brenda Chapman';


-- M) Which director made the most movies?
SELECT d.Name AS director_Name, COUNT(title) AS movie_Count
FROM movies m
JOIN directors d ON m.director_ID = d.ID
GROUP BY d.Name
ORDER BY movie_Count DESC
LIMIT 1;


-- N)Which director is the most bankable?
SELECT d.Name AS director_Name, sum(revenue) AS most_bankable_director
FROM movies m
JOIN directors d ON m.director_ID = d.ID
GROUP BY d.Name
ORDER BY most_bankable_director DESC
LIMIT 1;



