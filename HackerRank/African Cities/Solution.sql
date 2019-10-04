SELECT city.name
FROM CITY city
JOIN Country country
ON city.COUNTRYCODE = country.CODE
WHERE country.CONTINENT = 'Africa';
