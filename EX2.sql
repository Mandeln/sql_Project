SELECT name, continent, population FROM world

SELECT name
  FROM world
 WHERE population > 200000000

SELECT name, gdp/population as 'per capita GDP'
FROM world
WHERE population > 200000000

SELECT name, population/1000000
FROM world
WHERE continent = 'South America'

SELECT name, population
FROM world
WHERE name in ('France', 'Germany', 'Italy')

SELECT name
FROM world
WHERE name like '%United%'

SELECT name, population, area
FROM world
WHERE population > 250000000 or area > 3000000

SELECT name, population, area
FROM world
WHERE (population > 250000000  AND  area < 3000000) OR (population < 250000000 AND area > 3000000)

SELECT name, ROUND(population/1000000, 2) AS 'Pop in Millions', ROUND(GDP/1000000000, 2) AS 'GDP in Billions'
FROM WORLD
WHERE continent = 'South America'

SELECT name, ROUND(gdp/population, -3)
FROM world
WHERE GDP > 1000000000000

SELECT name, capital
FROM world
WHERE LEN(name) = LEN(capital)

SELECT name, capital
FROM world
WHERE (LEFT(name, 1) = LEFT(capital, 1)) AND (name <> capital)

SELECT name
FROM world
WHERE name LIKE '%a%' 
  AND name LIKE '%e%' 
  AND name LIKE '%i%' 
  AND name LIKE '%o%' 
  AND name LIKE '%u%' 
  AND name NOT LIKE '% %'