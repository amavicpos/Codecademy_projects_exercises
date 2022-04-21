CREATE TABLE state (
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

CREATE TABLE state_details (
    state_id integer PRIMARY KEY REFERENCES state(id),
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

CREATE TABLE states_official_languages (
    state_id integer REFERENCES state(id),
    language_id integer REFERENCES language(id)
);

COPY state FROM 'C:\\Users\\Public\\Documents\\States1.csv' DELIMITER ',' CSV HEADER;
COPY state_details FROM 'C:\\Users\\Public\\Documents\\States2.csv' DELIMITER ',' CSV HEADER;
COPY type_government FROM 'C:\\Users\\Public\\Documents\\States3.csv' DELIMITER ',' CSV HEADER;
COPY language FROM 'C:\\Users\\Public\\Documents\\States4.csv' DELIMITER ',' CSV HEADER;
COPY states_official_languages FROM 'C:\\Users\\Public\\Documents\\States5.csv' DELIMITER ',' CSV HEADER;

SELECT COUNT(*) AS Number_of_European_states FROM state;

SELECT SUM(population) AS total_population_in_Europe FROM state_details;

SELECT name AS states_in_EU_not_in_NATO FROM state
WHERE EU = TRUE AND NATO = FALSE;

SELECT name AS states_in_NATO_not_in_EU FROM state
WHERE NATO = TRUE AND EU = FALSE;

SELECT state.name AS states_with_monarchy FROM state, state_details, type_government
WHERE state.id = state_details.state_id
AND state_details.type_government_id = type_government.id
AND type_government.id IN (2, 5, 6, 10);

SELECT MIN(language.name) AS most_popular_official_language, COUNT(*) AS number_of_states_in_which_it_is_official
FROM language, states_official_languages
WHERE language.id = states_official_languages.language_id
GROUP BY states_official_languages.language_id
ORDER BY COUNT(*) DESC
LIMIT 1;