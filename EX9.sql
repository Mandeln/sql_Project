SELECT COUNT(id)
FROM stops;

SELECT id
FROM stops
WHERE name =  'Craiglockhart';

SELECT id, name
FROM stops 
JOIN route ON stops.id = route.stop
WHERE route.num = '4' AND route.company = 'LRT';

SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING count(*) = 2;


SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
a.company = b.company AND a.num = b.num
WHERE a.stop=53 AND b.stop = 149;

ELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
a.company = b.company AND a.num = b.num
JOIN stops AS stopa ON a.stop=stopa.id
JOIN stops AS stopb ON b.stop=stopb.id
WHERE stopa.name = 'Craiglockhart'  AND stopb.name = 'London Road';

SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON
a.company = b.company AND a.num = b.num
WHERE a.stop = 115 AND b.stop = 137;

SELECT a.company, a.num
FROM route a JOIN route b ON
a.company = b.company AND a.num = b.num
JOIN stops AS stopa ON a.stop = stopa.id
JOIN stops AS stopb ON b.stop = stopb.id
WHERE stopa.name = 'Craiglockhart' AND stopb.name = 'Tollcross';

SELECT stops_table2.name, route_table2.company, route_table2.num
FROM route AS route_table1 JOIN route AS route_table2 ON
route_table1.company = route_table2.company AND route_table1.num = route_table2.num
JOIN stops AS stops_table1 ON route_table1.stop = stops_table1.id
JOIN stops AS stops_table2 ON route_table2.stop = stops_table2.id
WHERE stops_table1.name = 'Craiglockhart';

/* https://stackoverflow.com/questions/24834948/self-join-tutorial-10-on-sqlzoo most voted solution */

SELECT DISTINCT 1st.num AS first_bus, 1st.company AS first_company, 
                stops.name AS transfer, 
                2nd.num AS second_bus, 2nd.company AS second_company
FROM (
    SELECT a.company, a.num, b.stop
    -- first self-join
    FROM route a JOIN route b ON a.company = b.company AND a.num = b.num
    WHERE a.stop = (SELECT id FROM stops WHERE name = 'Craiglockhart')
) AS 1st
JOIN (
    SELECT a.company, a.num, b.stop
    -- second self-join
    FROM route a JOIN route b ON a.company = b.company AND a.num = b.num
    WHERE a.stop = (SELECT id FROM stops WHERE name = 'Lochend')
) AS 2nd
-- join the above two tables on their matching stops
ON 1st.stop = 2nd.stop
JOIN stops ON stops.id = 1st.stop
ORDER BY first_bus, transfer, second_bus;