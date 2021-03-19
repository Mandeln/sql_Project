SELECT *
  FROM nobel
 WHERE yr = 1950;

 SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature';

SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein';

SELECT winner
FROM nobel
WHERE yr >= 2000 and subject = 'peace';

SELECT *
FROM nobel
WHERE subject = 'Literature' AND yr BETWEEN 1980 AND 1989;

SELECT * FROM nobel
 WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter', 'Barack Obama');

SELECT winner
FROM nobel
WHERE winner LIKE 'John%';

SELECT *
FROM nobel
WHERE (subject = 'Physics' AND yr = 1980) OR 
       (subject = 'Chemistry' AND yr = 1984);

SELECT *
FROM nobel
WHERE yr = 1980 AND subject NOT IN ('Chemistry', 'Medicine');

SELECT *
FROM nobel
WHERE (yr < 1910 AND subject = 'Medicine') OR 
      (yr >= 2004 AND subject = 'Literature')

SELECT *
FROM nobel
WHERE winner = 'PETER GRÜNBERG'

SELECT *
FROM nobel
WHERE winner = 'EUGENE O''NEILL'

SELECT winner, yr, subject
FROM nobel
WHERE winner LIKE 'Sir%'
ORDER BY yr DESC, winner;
