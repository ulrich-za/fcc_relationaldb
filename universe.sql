--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: celestial_events; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.celestial_events (
    celestial_events_id integer NOT NULL,
    star_id integer,
    planet_id integer,
    moon_id integer,
    name character varying(255) NOT NULL,
    description text
);


ALTER TABLE public.celestial_events OWNER TO freecodecamp;

--
-- Name: celestial_events_event_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.celestial_events_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.celestial_events_event_id_seq OWNER TO freecodecamp;

--
-- Name: celestial_events_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.celestial_events_event_id_seq OWNED BY public.celestial_events.celestial_events_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    age_in_millions_of_years numeric(7,2),
    has_life boolean,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer,
    name character varying(255) NOT NULL,
    mass_10e19_kg numeric(2,1),
    description text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer,
    name character varying(255) NOT NULL,
    has_life boolean,
    has_moon boolean,
    no_of_moon integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer,
    name character varying(255) NOT NULL,
    number_of_planets integer,
    is_dwarf boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: celestial_events celestial_events_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_events ALTER COLUMN celestial_events_id SET DEFAULT nextval('public.celestial_events_event_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: celestial_events; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.celestial_events VALUES (1, 1, 1, 1, 'Solar Flare', 'A massive solar flare erupted from Zyphra, impacting Aeloria and its moons.');
INSERT INTO public.celestial_events VALUES (2, 5, 3, 5, 'Planetary Alignment', 'Veridonia and Kaelora aligned perfectly, creating a rare cosmic sight.');
INSERT INTO public.celestial_events VALUES (3, 8, 8, 20, 'Lunar Eclipse', 'Zephyria caused a full lunar eclipse on Eluvia, darkening its surface.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Androsia', 8500.00, true, 'A spiral galaxy with vibrant blue stars and a massive central black hole, known for its dense star clusters.');
INSERT INTO public.galaxy VALUES (2, 'Zyphron', 12000.00, true, 'A distant, elliptical galaxy with ancient stars, glowing softly with a mysterious greenish hue.');
INSERT INTO public.galaxy VALUES (3, 'Celestara', 1200.00, NULL, 'A young, irregular galaxy, brimming with nebulae and star formation, shining brightly in the cosmic night.');
INSERT INTO public.galaxy VALUES (4, 'Veridion', 7200.00, true, 'A barred spiral galaxy with emerald-green nebulae, known for its unusually high number of supernovae.');
INSERT INTO public.galaxy VALUES (5, 'Noctara', 10300.00, false, 'A dark, lenticular galaxy with a faint glow, home to numerous black holes and ancient, dim stars.');
INSERT INTO public.galaxy VALUES (6, 'Aurivelle', 3400.00, NULL, 'A starburst galaxy, teeming with young, massive stars, radiating a golden light across its vibrant arms.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Lysara', 1.2, 'Covered in icy plains with hidden seas.');
INSERT INTO public.moon VALUES (2, 1, 'Krivor', 0.8, 'Volcanic surface, constantly erupting.');
INSERT INTO public.moon VALUES (3, 1, 'Thalun', 1.0, 'Dense forests with toewering bioluminescent trees.');
INSERT INTO public.moon VALUES (4, 2, 'Erdos', 2.3, 'Rocky terrain with deep chasms and cliffs');
INSERT INTO public.moon VALUES (5, 3, 'Veshla', 1.1, 'Shrouded in thick, toxic clouds.');
INSERT INTO public.moon VALUES (6, 3, 'Zirix', 0.9, 'Glistening metallic surface with sharp peaks.');
INSERT INTO public.moon VALUES (7, 4, 'Norak', 1.4, 'Cratered surface with hidden anciant ruins.');
INSERT INTO public.moon VALUES (8, 4, 'Phetra', 0.6, 'Calm lakes of liquid methane and nitrogen.');
INSERT INTO public.moon VALUES (9, 4, 'Drelis', 1.7, 'Vast deserts with towering sand dunes.');
INSERT INTO public.moon VALUES (10, 4, 'Lynex', 0.5, 'Frequent magnetic storms across the surface.');
INSERT INTO public.moon VALUES (11, 6, 'Marvis', 1.8, 'Home to crystal-clear, icy caves.');
INSERT INTO public.moon VALUES (12, 6, 'Orvel', 1.3, 'Ruggend mountans covered in pink snow.');
INSERT INTO public.moon VALUES (13, 6, 'Fendros', 2.0, 'Radiates a faint blue glow at night.');
INSERT INTO public.moon VALUES (14, 6, 'Thalvos', 0.7, 'Thick jungles with diverse alien wildlife.');
INSERT INTO public.moon VALUES (15, 6, 'Vexar', 1.6, 'Surface littered with ancient fossils.');
INSERT INTO public.moon VALUES (16, 8, 'Zaylon', 1.2, 'Twisting canyons with fast-flowing rivers.');
INSERT INTO public.moon VALUES (17, 8, 'Illara', 0.4, 'Endless fields of red and purple flowers.');
INSERT INTO public.moon VALUES (18, 8, 'Caltha', 2.1, 'Moon-sized coral reef with alien sea life.');
INSERT INTO public.moon VALUES (19, 8, 'Xarun', 0.8, 'Glows bright orange due to its sulfuric gases.');
INSERT INTO public.moon VALUES (20, 8, 'Pelion', 1.9, 'Tidal forces create constant seismic activity.');
INSERT INTO public.moon VALUES (21, 8, 'Nydra', 0.9, 'Smooth, mirror-life surface of frozen gases,');
INSERT INTO public.moon VALUES (22, 9, 'Daris', 1.5, 'Thin atmosphere with shimmering auroras.');
INSERT INTO public.moon VALUES (23, 10, 'Erydia', 1.1, 'Vast, barren plains with sparse rock pillars.');
INSERT INTO public.moon VALUES (24, 10, 'Vyrex', 0.7, 'Riddled with underground tunnels and caverns.');
INSERT INTO public.moon VALUES (25, 11, 'Queris', 1.3, 'Eternal dusk with dim, bluish light.');
INSERT INTO public.moon VALUES (26, 11, 'Omnar', 2.4, 'Powerful gravity, crushing any surface life.');
INSERT INTO public.moon VALUES (27, 11, 'Beleron', 0.6, 'Deserted wasteland of dust and winds.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Aeloria', true, true, 3);
INSERT INTO public.planet VALUES (2, 1, 'Drathos', false, true, 1);
INSERT INTO public.planet VALUES (3, 5, 'Veridonia', true, true, 2);
INSERT INTO public.planet VALUES (4, 5, 'Norith Prime', false, true, 4);
INSERT INTO public.planet VALUES (5, 5, 'Kaelora', true, false, 0);
INSERT INTO public.planet VALUES (6, 6, 'Sycorax Minor', false, true, 5);
INSERT INTO public.planet VALUES (7, 8, 'Eluvia', true, false, 0);
INSERT INTO public.planet VALUES (8, 8, 'Zephyria', false, true, 6);
INSERT INTO public.planet VALUES (9, 8, 'Arcanis', true, true, 1);
INSERT INTO public.planet VALUES (10, 12, 'Thalassia', false, true, 2);
INSERT INTO public.planet VALUES (11, 13, 'Myridian', true, true, 3);
INSERT INTO public.planet VALUES (12, 20, 'Corves', false, false, 0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Zyphra', 5, true);
INSERT INTO public.star VALUES (2, 1, 'Luminaris', NULL, false);
INSERT INTO public.star VALUES (3, 1, 'Velatrix', NULL, false);
INSERT INTO public.star VALUES (4, 2, 'Ardentis', NULL, false);
INSERT INTO public.star VALUES (5, 2, 'Noxara', 3, true);
INSERT INTO public.star VALUES (6, 2, 'Solvane', 2, false);
INSERT INTO public.star VALUES (7, 2, 'Astrael', NULL, false);
INSERT INTO public.star VALUES (8, 2, 'Cygnera', 6, true);
INSERT INTO public.star VALUES (9, 2, 'Emberon', 5, false);
INSERT INTO public.star VALUES (10, 2, 'Virellis', NULL, false);
INSERT INTO public.star VALUES (11, 3, 'Thalior', NULL, false);
INSERT INTO public.star VALUES (12, 4, 'Zariel', 4, true);
INSERT INTO public.star VALUES (13, 4, 'Mirael', 1, false);
INSERT INTO public.star VALUES (14, 5, 'Frostis', 0, false);
INSERT INTO public.star VALUES (15, 5, 'Glimmeron', 0, false);
INSERT INTO public.star VALUES (16, 5, 'Pyraxia', 0, true);
INSERT INTO public.star VALUES (17, 5, 'Draethis', 0, false);
INSERT INTO public.star VALUES (18, 5, 'Velosia', 0, true);
INSERT INTO public.star VALUES (19, 6, 'Sorvannis', NULL, false);
INSERT INTO public.star VALUES (20, 6, 'Aurelius', 1, true);


--
-- Name: celestial_events_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.celestial_events_event_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 27, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 20, true);


--
-- Name: celestial_events celestial_events_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_events
    ADD CONSTRAINT celestial_events_name_key UNIQUE (name);


--
-- Name: celestial_events celestial_events_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_events
    ADD CONSTRAINT celestial_events_pkey PRIMARY KEY (celestial_events_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: celestial_events fk_moon; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_events
    ADD CONSTRAINT fk_moon FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: celestial_events fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_events
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: celestial_events fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_events
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--
