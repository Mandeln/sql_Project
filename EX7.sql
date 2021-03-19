SELECT id, title
 FROM movie
 WHERE yr=1962;

 SELECT yr
 FROM movie
 WHERE title='Citizen Kane';

SELECT id
FROM actor
WHERE name ='Glenn Close' ;

SELECT id
FROM movie
WHERE title ='Casablanca' ;

SELECT name
FROM actor
JOIN casting ON actor.id = casting.actorid
WHERE movieid=27;

SELECT name
FROM actor
JOIN casting ON actor.id = casting.actorid
JOIN movie ON casting.movieid = movie.id
WHERE title = 'Alien';

SELECT title
FROM actor
JOIN casting ON actor.id = casting.actorid
JOIN movie ON casting.movieid = movie.id
WHERE actor.name = 'Harrison Ford';

SELECT title
FROM actor
JOIN casting ON actor.id = casting.actorid
JOIN movie ON casting.movieid = movie.id
WHERE actor.name = 'Harrison Ford' AND casting.ord != 1;

SELECT title, name
FROM actor
JOIN casting ON actor.id = casting.actorid
JOIN movie ON casting.movieid = movie.id
WHERE yr = 1962 AND casting.ord = 1;

SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Doris Day'
GROUP BY yr
HAVING COUNT(title) > 1;

SELECT title, name
FROM movie
JOIN casting ON movieid = movie.id AND ord = 1
JOIN actor ON actor.id = actorid
WHERE movieid IN (171, 1233, 1249);

SELECT name
FROM movie
JOIN casting ON movieid = movie.id AND ord = 1
JOIN actor ON actor.id = actorid
GROUP BY name
HAVING COUNT(ord) >= 15;

SELECT movie.title, COUNT(casting.actorid)
FROM movie JOIN casting
             ON movie.id = casting.movieid AND movie.yr = 1978
GROUP BY movie.title
ORDER BY COUNT(casting.actorid) DESC, movie.title;

SELECT actor.name
FROM movie JOIN casting
             ON movie.id = casting.movieid
            JOIN actor ON actor.id = casting.actorid
WHERE movie.id IN (
    SELECT casting.movieid FROM casting
    WHERE casting.actorid IN (
        SELECT actor.id FROM actor
        WHERE name = 'Art Garfunkel'
    )
) 
AND actor.name != 'Art Garfunkel';