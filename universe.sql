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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    description text,
    num_stars integer,
    num_planets integer NOT NULL,
    size numeric(10,1),
    age numeric(10,1),
    magnetic_field boolean,
    life boolean
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
    name character varying(30),
    description text,
    radius integer NOT NULL,
    orb_period_days integer NOT NULL,
    size numeric(10,1),
    age numeric(10,1),
    magnetic_field boolean,
    life boolean,
    planet_id integer NOT NULL
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
    name character varying(30),
    description text,
    num_moons integer,
    radius integer NOT NULL,
    size numeric(10,1),
    age numeric(10,1),
    magnetic_field boolean,
    life boolean,
    star_id integer NOT NULL,
    planet_types_id integer
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
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    name character varying(20),
    has_life boolean NOT NULL,
    description text,
    planet_types_id integer NOT NULL
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    description text,
    gravity integer NOT NULL,
    radius integer NOT NULL,
    size numeric(10,1),
    age numeric(5,1),
    magnetic_field boolean,
    life boolean,
    galaxy_id integer NOT NULL
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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred spiral galaxy home to our solar system', 400000, 400000, 100000.0, 13.6, true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'Closest large spiral galaxy to the Milky Way', 400000, 400000, 100000.0, 13.6, true, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 'Closest large spiral galaxy to the Milky Way', 400000, 400000, 100000.0, 13.6, true, true);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'Closest large spiral galaxy to the Milky Way', 400000, 400000, 100000.0, 13.6, true, true);
INSERT INTO public.galaxy VALUES (5, 'SMALL MAGELLANIC CLOUD', 'Closest large spiral galaxy to the Milky Way', 400000, 400000, 100000.0, 13.6, true, true);
INSERT INTO public.galaxy VALUES (6, 'MESIER 87', 'Closest large spiral galaxy to the Milky Way', 400000, 400000, 100000.0, 13.6, true, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'The Moon', 123456, 365, 54321.0, 500000.0, true, false, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Will break into Mars', 123456, 365, 54321.0, 500000.0, true, false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Moving away from Mars', 123456, 365, 54321.0, 500000.0, true, false, 4);
INSERT INTO public.moon VALUES (4, 'Ganymede', 'The largest moon in the solar system', 123456, 365, 54321.0, 500000.0, true, false, 5);
INSERT INTO public.moon VALUES (6, 'Callisto', 'Heavily cratered an ancient surfase', 123456, 365, 54321.0, 500000.0, true, false, 5);
INSERT INTO public.moon VALUES (7, 'Europa', 'Smooth icy surfase', 123456, 365, 54321.0, 500000.0, true, false, 5);
INSERT INTO public.moon VALUES (8, 'Io', 'Most geologically active', 123456, 365, 54321.0, 500000.0, true, false, 5);
INSERT INTO public.moon VALUES (9, 'Titan', 'The largest of Saturns moons', 123456, 365, 54321.0, 500000.0, true, false, 6);
INSERT INTO public.moon VALUES (10, 'Rhea', 'Composed mostly of ice and rock', 123456, 365, 54321.0, 500000.0, true, false, 6);
INSERT INTO public.moon VALUES (11, 'Iapetus', 'one hemisphere is dark and the other is white', 123456, 365, 54321.0, 500000.0, true, false, 6);
INSERT INTO public.moon VALUES (12, 'Dione', 'Possibly has a subsurface ocean', 123456, 365, 54321.0, 500000.0, true, false, 6);
INSERT INTO public.moon VALUES (13, 'Tethys', 'Known for a huge canyon', 123456, 365, 54321.0, 500000.0, true, false, 6);
INSERT INTO public.moon VALUES (14, 'Enceladus', 'Possible environment for microbial life', 123456, 365, 54321.0, 500000.0, true, false, 6);
INSERT INTO public.moon VALUES (15, 'Mimas', 'Similar to Death Star in Star Wars', 123456, 365, 54321.0, 500000.0, true, false, 6);
INSERT INTO public.moon VALUES (16, 'Daphnis', 'Creates distinctive waves in the ring patterns', 123456, 365, 54321.0, 500000.0, true, false, 6);
INSERT INTO public.moon VALUES (17, 'Titania', 'Largest of Uranus moons', 123456, 365, 54321.0, 500000.0, true, false, 7);
INSERT INTO public.moon VALUES (18, 'Oberon', 'Second largest', 123456, 365, 54321.0, 500000.0, true, false, 7);
INSERT INTO public.moon VALUES (19, 'Umbriel', 'Very dark and least reflective of the moons', 123456, 365, 54321.0, 500000.0, true, false, 7);
INSERT INTO public.moon VALUES (20, 'Ariel', 'Brightest surface', 123456, 365, 54321.0, 500000.0, true, false, 7);
INSERT INTO public.moon VALUES (21, 'Miranda', 'Deep Canyons and ridges', 123456, 365, 54321.0, 500000.0, true, false, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'First planet in the solar system', 0, 1737, 3474.8, 5.0, true, false, 1, NULL);
INSERT INTO public.planet VALUES (2, 'Venus', 'Second planet in the solar system', 0, 1737, 3474.8, 5.0, true, false, 1, NULL);
INSERT INTO public.planet VALUES (3, 'Earth', 'Third and only livable planet in the solar system', 1, 1737, 3474.8, 5.0, true, true, 1, NULL);
INSERT INTO public.planet VALUES (4, 'Mars', 'Fourth planet in the solar system', 2, 1737, 3474.8, 5.0, true, false, 1, NULL);
INSERT INTO public.planet VALUES (5, 'Jupyter', 'Fifth planet in the solar system', 95, 1737, 3474.8, 5.0, true, false, 1, NULL);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Sixth planet in the solar system', 146, 1737, 3474.8, 5.0, true, false, 1, NULL);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Seventh planet in the solar system', 27, 1737, 3474.8, 5.0, true, false, 1, NULL);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Eight planet in the solar system', 14, 1737, 3474.8, 5.0, true, false, 1, NULL);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Nineth planet in the solar system', 5, 1737, 3474.8, 5.0, true, false, 1, NULL);
INSERT INTO public.planet VALUES (10, 'Kepler-452', 'Like Earth cousin', 0, 1737, 3474.8, 5.0, true, false, 2, NULL);
INSERT INTO public.planet VALUES (11, 'Proxima b', 'potentially habitable', 0, 1737, 3474.8, 5.0, true, false, 2, NULL);
INSERT INTO public.planet VALUES (12, 'Kepler22b', 'random planet', 0, 1737, 3474.8, 5.0, true, false, 2, NULL);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES ('Dwarf', false, 'Smaller', 1);
INSERT INTO public.planet_types VALUES ('Gas Giant', false, 'also hot', 2);
INSERT INTO public.planet_types VALUES ('Terrestrial', false, 'Terra Firma', 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Star in the center of the solar system', 274, 696340, 864400.0, 4603.0, true, true, 1);
INSERT INTO public.star VALUES (2, 'V1', 'Cepheid variable star', 274, 696340, 864400.0, 4603.0, true, true, 2);
INSERT INTO public.star VALUES (3, 'Andromeda SN 1885A', 'The remnant of a historical supernova', 274, 696340, 864400.0, 4603.0, true, true, 2);
INSERT INTO public.star VALUES (4, 'M33-V19', 'A yellow supergiant variable star', 274, 696340, 864400.0, 4603.0, true, true, 3);
INSERT INTO public.star VALUES (5, 'M33-013406.63', 'A bright star', 274, 696340, 864400.0, 4603.0, true, true, 3);
INSERT INTO public.star VALUES (6, 'Sirius', 'A bright star', 274, 696340, 864400.0, 4603.0, true, true, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


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
-- Name: planet_types planet_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_name_key UNIQUE (name);


--
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


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
-- Name: star fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_types; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_types FOREIGN KEY (planet_types_id) REFERENCES public.planet_types(planet_types_id);


--
-- PostgreSQL database dump complete
--

