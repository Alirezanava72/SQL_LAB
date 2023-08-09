-- Clue #1: We recently got word that someone fitting Carmen Sandiego's description has been
-- traveling through Southern Europe. She's most likely traveling someplace where she won't be noticed,
-- so find the least populated country in Southern Europe, and we'll start looking for her there.
 
-- Write SQL query here
SELECT * FROM country
WHERE region = 'Southern Europe'
ORDER BY population
LIMIT 1;

-- SELECT *: specifies that we want to retrieve all columns from the result set
-- FROM country: This indicates the source table for the data we're querying, which is the country table
-- WHERE region = 'Southern Europe': This is a condition that filters the results. It specifies that we only want to include rows where the value in the region column is equal to 'Southern Europe'. This condition narrows down the results to countries located in the Southern Europe region.
-- ORDER BY population: This part of the query sorts the filtered rows based on the population column in ascending order. This means that the country with the smallest population in the Southern Europe region will appear first.
-- LIMIT 1: This limits the number of rows in the result set to just 1. Since the rows are sorted by population in ascending order, the country with the smallest population in the Southern Europe region will be selected.





-- Clue #2: Now that we're here, we have insight that Carmen was seen attending language classes in
-- this country's officially recognized language. Check our databases and find out what language is
-- spoken in this country, so we can call in a translator to work with you.

-- Write SQL query here
SELECT * FROM countrylanguage L
JOIN country C on L.countrycode = C.code
WHERE C.code = 'VAT';

-- FROM countrylanguage L: This indicates the source table for the data we're querying. The table is given an alias L, which can be used as a shorthand when referencing the table in the rest of the query.

-- JOIN country C ON L.countrycode = C.code: This is a JOIN operation that combines rows from the countrylanguage table (L) and the country table (C). It specifies that we want to match rows where the countrycode column in the countrylanguage table matches the code column in the country table. This creates a relationship between the two tables.

-- WHERE C.code = 'VAT': This is a condition that filters the results. It states that we only want to include rows where the code column in the country table (C) is equal to 'VAT'. This effectively narrows down the results to the specific country code 'VAT'.







-- Clue #3: We have new news on the classes Carmen attended – our gumshoes tell us she's moved on
-- to a different country, a country where people speak only the language she was learning. Find out which
-- nearby country speaks nothing but that language.

-- Write SQL query here

SELECT * FROM country C
JOIN countrylanguage L
ON C.code = L.countrycode
WHERE C.region = 'Southern Europe' AND L.language = 'Italian';





-- Clue #4: We're booking the first flight out – maybe we've actually got a chance to catch her this time.
-- There are only two cities she could be flying to in the country. One is named the same as the country – that
-- would be too obvious. We're following our gut on this one; find out what other city in that country she might
-- be flying to.

-- Write SQL query here


SELECT * FROM city
WHERE countrycode = 'SMR' AND name <> 'San Marino';

-- FROM city: This indicates the source table for the data we're querying, which is the city table.

-- countrycode = 'SMR': This condition ensures that the countrycode column matches the value 'SMR', which is the country code for San Marino.

-- name <> 'San Marino': This condition ensures that the name column is not equal to 'San Marino'. This filters out the row for the city named San Marino itse



-- Clue #5: Oh no, she pulled a switch – there are two cities with very similar names, but in totally different
-- parts of the globe! She's headed to South America as we speak; go find a city whose name is like the one we were
-- headed to, but doesn't end the same. Find out the city, and do another search for what country it's in. Hurry!

-- Write SQL query here

SELECT * FROM country CO
JOIN city CI ON CO.code = CI.countrycode
WHERE CO.continent = 'South America' AND CI.name LIKE 'Serra%';




-- Clue #6: We're close! Our South American agent says she just got a taxi at the airport, and is headed towards
-- the capital! Look up the country's capital, and get there pronto! Send us the name of where you're headed and we'll
-- follow right behind you!

-- Write SQL query here

SELECT * FROM country CO
JOIN city CI ON CO.capital = CI.id
WHERE CO.code = 'BRA';





-- Clue #7: She knows we're on to her – her taxi dropped her off at the international airport, and she beat us to
-- the boarding gates. We have one chance to catch her, we just have to know where she's heading and beat her to the
-- landing dock. Lucky for us, she's getting cocky. She left us a note (below), and I'm sure she thinks she's very clever, but
-- if we can crack it, we can finally put her where she belongs – behind bars.


--               Our playdate of late has been unusually fun –
--               As an agent, I'll say, you've been a joy to outrun.
--               And while the food here is great, and the people – so nice!
--               I need a little more sunshine with my slice of life.
--               So I'm off to add one to the population I find
--               In a city of ninety-one thousand and now, eighty five.

SELECT * FROM city
WHERE population = 91084;


-- We're counting on you, gumshoe. Find out where she's headed, send us the info, and we'll be sure to meet her at the gates with bells on.

