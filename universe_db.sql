CREATE DATABASE universe;
\c universe;

-- Create the galaxy table with its columns
CREATE TABLE galaxy (
    galaxy_id   SERIAL  PRIMARY KEY,
    name    VARCHAR(35) UNIQUE NOT NULL,
    age_in_millions_of_years NUMERIC(5),
    number_of_studied_stars INT,
    description TEXT -- NEVER A TRAILING , for the last item when creating a table with multiple columns
);

-- Add values to the columns for the galaxy table
INSERT INTO galaxy(name, age_in_millions_of_years, number_of_studied_stars, description)
VALUES
    ('Androsia', 8500, 3, 'A spiral galaxy with vibrant blue stars and a massive central black hole, known for its dense star clusters.'),
    ('Zyphron', 12000, 7, 'A distant, elliptical galaxy with ancient stars, glowing softly with a mysterious greenish hue.'),
    ('Celestara', 1200, 1, 'A young, irregular galaxy, brimming with nebulae and star formation, shining brightly in the cosmic night.'),
    ('Veridion', 7200, 2, 'A barred spiral galaxy with emerald-green nebulae, known for its unusually high number of supernovae.'),
    ('Noctara', 10300, 5, 'A dark, lenticular galaxy with a faint glow, home to numerous black holes and ancient, dim stars.'),
    ('Aurivelle', 3400, 2, 'A starburst galaxy, teeming with young, massive stars, radiating a golden light across its vibrant arms.');
-- End of rows added to galaxy table

CREATE TABLE star (
    star_id   SERIAL  PRIMARY KEY,
    name    VARCHAR(35) UNIQUE NOT NULL
);
CREATE TABLE planet (
    planet_id   SERIAL  PRIMARY KEY,
    name    VARCHAR(35) UNIQUE NOT NULL
);
CREATE TABLE moon (
    moon_id   SERIAL  PRIMARY KEY,
    name    VARCHAR(35) UNIQUE NOT NULL
);
