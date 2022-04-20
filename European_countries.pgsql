CREATE TABLE country (
    id integer PRIMARY KEY,
    name varchar(50) UNIQUE NOT NULL,
    capital_city varchar(50) UNIQUE NOT NULL,
    EU boolean NOT NULL,
    NATO boolean NOT NULL
);

CREATE TABLE type_government (
    id integer PRIMARY KEY,
    name varchar(200) UNIQUE NOT NULL,
    head_of_state varchar(100),
    head_of_government varchar(100)
);

CREATE TABLE country_details (
    country_id integer PRIMARY KEY REFERENCES country(id),
    population integer,
    head_of_state varchar(200),
    head_of_government varchar(200),
    type_government_id integer REFERENCES type_government(id)
);

CREATE TABLE language (
    id integer PRIMARY KEY,
    name varchar(50) UNIQUE NOT NULL,
    total_number_speakers integer
);

CREATE TABLE countries_official_languages (
    country_id integer REFERENCES country(id),
    language_id integer REFERENCES language(id)
);

COPY country FROM 'C:\\Users\\Public\\Documents\\Countries1.csv' DELIMITER ',' CSV HEADER;
COPY country_details FROM 'C:\\Users\\Public\\Documents\\Countries2.csv' DELIMITER ',' CSV HEADER;
COPY type_government FROM 'C:\\Users\\Public\\Documents\\Countries3.csv' DELIMITER ',' CSV HEADER;
COPY language FROM 'C:\\Users\\Public\\Documents\\Countries4.csv' DELIMITER ',' CSV HEADER;
COPY countries_official_languages FROM 'C:\\Users\\Public\\Documents\\Countries5.csv' DELIMITER ',' CSV HEADER;

SELECT COUNT(*) AS Number_of_European_countries FROM country;

SELECT SUM(population) AS total_population_in_Europe FROM country_details;

SELECT name AS countries_in_EU_not_in_NATO FROM country
WHERE EU = TRUE AND NATO = FALSE;

SELECT name AS countries_in_NATO_not_in_EU FROM country
WHERE NATO = TRUE AND EU = FALSE;

SELECT country.name AS countries_with_monarchy FROM country, country_details, type_government
WHERE country.id = country_details.country_id
AND country_details.type_government_id = type_government.id
AND type_government.id IN (2, 5, 6, 10);

SELECT MIN(language.name) AS most_popular_official_language, COUNT(*) AS number_of_countries_in_which_it_is_official
FROM language, countries_official_languages
WHERE language.id = countries_official_languages.language_id
GROUP BY countries_official_languages.language_id
ORDER BY COUNT(*) DESC
LIMIT 1;