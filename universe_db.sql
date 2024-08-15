CREATE DATABASE universe;
\c universe;

-- Create the galaxy table with its columns
CREATE TABLE galaxy (
    galaxy_id   SERIAL  PRIMARY KEY,
    name    VARCHAR(255) UNIQUE NOT NULL,
    age_in_millions_of_years NUMERIC(7, 2),
    has_life    BOOLEAN,
    description TEXT -- NEVER A TRAILING , for the last item when creating a table with multiple columns
);

-- Add values to the columns for the galaxy table
INSERT INTO galaxy(name, age_in_millions_of_years, has_life, description)
VALUES
    ('Androsia', 8500, True, 'A spiral galaxy with vibrant blue stars and a massive central black hole, known for its dense star clusters.'),
    ('Zyphron', 12000, True, 'A distant, elliptical galaxy with ancient stars, glowing softly with a mysterious greenish hue.'),
    ('Celestara', 1200, NULL, 'A young, irregular galaxy, brimming with nebulae and star formation, shining brightly in the cosmic night.'),
    ('Veridion', 7200, True, 'A barred spiral galaxy with emerald-green nebulae, known for its unusually high number of supernovae.'),
    ('Noctara', 10300, False, 'A dark, lenticular galaxy with a faint glow, home to numerous black holes and ancient, dim stars.'),
    ('Aurivelle', 3400, NULL, 'A starburst galaxy, teeming with young, massive stars, radiating a golden light across its vibrant arms.');
-- End of rows added to galaxy table

-- Create the star table with its columns
CREATE TABLE star (
    star_id   SERIAL  PRIMARY KEY,
    galaxy_id INT,
    name    VARCHAR(255) UNIQUE NOT NULL,
    number_of_planets INT,
    is_dwarf BOOLEAN
);

-- Set the foreign key for the galaxy_id column that references the column of the same name from the galaxy table.
ALTER TABLE star ADD FOREIGN KEY(galaxy_id) REFERENCES galaxy(galaxy_id);

-- Add values to the columns for the star table
INSERT INTO star(galaxy_id, name, number_of_planets, is_dwarf)
VALUES
    (1, 'Zyphra', 5, True),
    (1, 'Luminaris', NULL, False),
    (1, 'Velatrix', NULL, False),
    (2, 'Ardentis', NULL, False),
    (2, 'Noxara', 3, True),
    (2, 'Solvane', 2, False),
    (2, 'Astrael', NULL, False),
    (2, 'Cygnera', 6, True),
    (2, 'Emberon', 5, False),
    (2, 'Virellis', NULL, False),
    (3, 'Thalior', NULL, False),
    (4, 'Zariel', 4, True),
    (4, 'Mirael', 1, False),
    (5, 'Frostis', 0, False),
    (5, 'Glimmeron', 0, False),
    (5, 'Pyraxia', 0, True),
    (5, 'Draethis', 0, False),
    (5, 'Velosia', 0, True),
    (6, 'Sorvannis', NULL, False),
    (6, 'Aurelius', 1, True);

-- Create the planet table with its columns
CREATE TABLE planet (
    planet_id   SERIAL  PRIMARY KEY,
    star_id INT,
    name    VARCHAR(255) UNIQUE NOT NULL,
    has_life BOOLEAN,
    has_moon BOOLEAN,
    no_of_moon INT
);

-- Rows for planet table
INSERT INTO planet(star_id, name, has_life, has_moon, no_of_moon)
VALUES
    (1, 'Aeloria', True, True, 3),
    (1, 'Drathos', False, True, 1),
    (5, 'Veridonia', True, True, 2),
    (5, 'Norith Prime', False, True, 4),
    (5, 'Kaelora', True, False, 0),
    (6, 'Sycorax Minor', False, True, 5),
    (8, 'Eluvia', True, False, 0),
    (8, 'Zephyria', False, True, 6),
    (8, 'Arcanis', True, True, 1),
    (12, 'Thalassia', False, True, 2),
    (13, 'Myridian', True, True, 3),
    (20, 'Corves', False, False, 0);

-- Set the foreign key for the star_id column that references the column of the same name from the star table.
ALTER TABLE planet ADD FOREIGN KEY(star_id) REFERENCES star(star_id);

-- Create moon table
CREATE TABLE moon (
    moon_id   SERIAL  PRIMARY KEY,
    planet_id INT,
    name    VARCHAR(255) UNIQUE NOT NULL,
    mass_10e19_kg NUMERIC(2, 1),
    description TEXT
);

-- Rows for moon table
INSERT INTO moon(planet_id, name,  mass_10e19_kg, description)
VALUES
    (1, 'Lysara', 1.2, 'Covered in icy plains with hidden seas.'),
    (1, 'Krivor', 0.8, 'Volcanic surface, constantly erupting.'),
    (1, 'Thalun', 1, 'Dense forests with toewering bioluminescent trees.'),
    (2, 'Erdos', 2.3, 'Rocky terrain with deep chasms and cliffs'),
    (3, 'Veshla', 1.1, 'Shrouded in thick, toxic clouds.'),
    (3, 'Zirix', 0.9, 'Glistening metallic surface with sharp peaks.'),
    (4, 'Norak', 1.4, 'Cratered surface with hidden anciant ruins.'),
    (4, 'Phetra', 0.6, 'Calm lakes of liquid methane and nitrogen.'),
    (4, 'Drelis', 1.7, 'Vast deserts with towering sand dunes.'),
    (4, 'Lynex', 0.5, 'Frequent magnetic storms across the surface.'),
    (6, 'Marvis', 1.8, 'Home to crystal-clear, icy caves.'),
    (6, 'Orvel', 1.3, 'Ruggend mountans covered in pink snow.'),
    (6, 'Fendros', 2, 'Radiates a faint blue glow at night.'),
    (6, 'Thalvos', 0.7, 'Thick jungles with diverse alien wildlife.'),
    (6, 'Vexar', 1.6, 'Surface littered with ancient fossils.'),
    (8, 'Zaylon', 1.2, 'Twisting canyons with fast-flowing rivers.'),
    (8, 'Illara', 0.4, 'Endless fields of red and purple flowers.'),
    (8, 'Caltha', 2.1, 'Moon-sized coral reef with alien sea life.'),
    (8, 'Xarun', 0.8, 'Glows bright orange due to its sulfuric gases.'),
    (8, 'Pelion', 1.9, 'Tidal forces create constant seismic activity.'),
    (8, 'Nydra', 0.9, 'Smooth, mirror-life surface of frozen gases,'),
    (9, 'Daris', 1.5, 'Thin atmosphere with shimmering auroras.'),
    (10, 'Erydia', 1.1, 'Vast, barren plains with sparse rock pillars.'),
    (10, 'Vyrex', 0.7, 'Riddled with underground tunnels and caverns.'),
    (11, 'Queris', 1.3, 'Eternal dusk with dim, bluish light.'),
    (11, 'Omnar', 2.4, 'Powerful gravity, crushing any surface life.'),
    (11, 'Beleron', 0.6, 'Deserted wasteland of dust and winds.');


-- Set the foreign key for the planet_id column that references the column of the same name from the planet table.
ALTER TABLE moon ADD FOREIGN KEY(planet_id) REFERENCES planet(planet_id);

-- Final table for celestial events
CREATE TABLE celestial_events(
    celestial_events_id SERIAL PRIMARY KEY,
    star_id INT,
    planet_id INT,
    moon_id INT,
    name VARCHAR(255) UNIQUE NOT NULL,
    description TEXT
);

INSERT INTO celestial_events(star_id, planet_id, moon_id, name, description)
VALUES
    (1, 1, 1, 'Solar Flare', 'A massive solar flare erupted from Zyphra, impacting Aeloria and its moons.'),
    (5, 3, 5, 'Planetary Alignment', 'Veridonia and Kaelora aligned perfectly, creating a rare cosmic sight.'),
    (8, 8, 20, 'Lunar Eclipse', 'Zephyria caused a full lunar eclipse on Eluvia, darkening its surface.');

ALTER TABLE celestial_events
ADD CONSTRAINT fk_star
FOREIGN KEY (star_id) REFERENCES star(star_id);

ALTER TABLE celestial_events
ADD CONSTRAINT fk_planet
FOREIGN KEY (planet_id) REFERENCES planet(planet_id);

ALTER TABLE celestial_events
ADD CONSTRAINT fk_moon
FOREIGN KEY (moon_id) REFERENCES moon(moon_id);
