SELECT SUM(population)
FROM world;

SELECT DISTINCT(continent)
FROM world;

SELECT sum(gdp)
FROM world
where continent = 'Africa';

SELECT COUNT(name)
FROM world
where area > 1000000;

SELECT SUM(population)
FROM world
where name IN  ('Estonia', 'Latvia', 'Lithuania');

SELECT continent, COUNT(name)
FROM world
GROUP BY continent;

SELECT continent, COUNT(name)
FROM world
WHERE population > 10000000
GROUP BY continent;

SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population) > 100000000;
