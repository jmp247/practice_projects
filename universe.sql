--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    name character varying(30) NOT NULL,
    galaxy_type character varying(30),
    active boolean,
    diameter text
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
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    description text,
    type character varying(20)
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
-- Name: more_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.more_info (
    object_type character varying(10) NOT NULL,
    name character varying(20),
    more_info_id integer NOT NULL,
    more_info text
);


ALTER TABLE public.more_info OWNER TO freecodecamp;

--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.more_info_more_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.more_info_more_info_id_seq OWNER TO freecodecamp;

--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.more_info_more_info_id_seq OWNED BY public.more_info.more_info_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_life boolean,
    distance_from_earth integer,
    description text,
    star_id integer NOT NULL,
    age_in_millions_of_years numeric,
    is_spherical boolean
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
    name character varying(30) NOT NULL,
    astro_name text,
    distance_in_yrs integer,
    type character varying(30)
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
-- Name: more_info more_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info ALTER COLUMN more_info_id SET DEFAULT nextval('public.more_info_more_info_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (2, 'LMC', 'Satellite Galaxy', true, '14000');
INSERT INTO public.galaxy VALUES (3, 'Andromeda', '', true, '220000');
INSERT INTO public.galaxy VALUES (1, 'Milky Way', '', true, '10000');
INSERT INTO public.galaxy VALUES (4, 'Cigar Galaxy', NULL, true, '37000');
INSERT INTO public.galaxy VALUES (5, 'Pinwheel Galaxy', NULL, true, '170000');
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', NULL, true, '50000');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'Europa', 3, 'The smallest of the four Galilean moons orbiting Jupiter', NULL);
INSERT INTO public.moon VALUES (3, 'Ganymede', 3, 'The largest and most massive of the Solar System moons', NULL);
INSERT INTO public.moon VALUES (7, 'Callisto', 3, 'the second-largest moon of Jupter', NULL);
INSERT INTO public.moon VALUES (8, 'Titan', 4, 'The largest moon of Saturn and the second-largest natural satellite in the Solar System', NULL);
INSERT INTO public.moon VALUES (1, 'Phobos', 1, 'Innermost and larger of the two natural satellites of Mars', NULL);
INSERT INTO public.moon VALUES (9, 'Triton', 5, 'Largest natural satellite of the planet Neptune', NULL);
INSERT INTO public.moon VALUES (10, 'Titania', 6, 'Largest of the moons of the Uranus and eighth largest in the Solar System', NULL);
INSERT INTO public.moon VALUES (11, 'Thebe', 3, 'Fourth of Jupter moons by distance from the planet', NULL);
INSERT INTO public.moon VALUES (12, 'Oberon', 6, 'Outermost major moon of Uranus', NULL);
INSERT INTO public.moon VALUES (13, 'Hyperion', 4, 'Discovered by William Cranch Bond', NULL);
INSERT INTO public.moon VALUES (14, 'Nereid', 5, 'Third-largest moon of Neptune', NULL);
INSERT INTO public.moon VALUES (15, 'Amalthea', 3, 'Third closest orbit around Jupter among known moons', NULL);
INSERT INTO public.moon VALUES (16, 'Charon', 7, 'Largest of the five known natural satellites of the dwarf planet Pluto', NULL);
INSERT INTO public.moon VALUES (17, 'Kerberos', 7, 'Fourth moon of Pluto to be discovered', NULL);
INSERT INTO public.moon VALUES (18, 'Epimetheus', 4, 'Inner satellite of Saturn', NULL);
INSERT INTO public.moon VALUES (19, 'Galatea', 5, 'Small and irregularly-shaped like Despina', NULL);
INSERT INTO public.moon VALUES (20, 'Puck', 6, 'Discovered in December 1985', NULL);
INSERT INTO public.moon VALUES (21, 'Elara', 3, 'Prograde irregular satellite of Jupiter', NULL);
INSERT INTO public.moon VALUES (22, 'Ananke', 3, 'Retrograde irregular moon of Jupiter', NULL);
INSERT INTO public.moon VALUES (23, 'Pasiphae', 3, 'Retrograde irregular satellite of Jupiter', NULL);


--
-- Data for Name: more_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.more_info VALUES ('planet', 'Ceres', 1, 'Ceres has something a lot of other planets do not: water');
INSERT INTO public.more_info VALUES ('planet', 'Pluto', 2, 'In the Kuiper belt');
INSERT INTO public.more_info VALUES ('planet', 'Pluto', 3, 'Pluto is very small, only about half the width of the United States');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mars', false, NULL, 'Mars is the fourth planet from the Sun and the second-smallest planet in the Solar System, being larger than only Mercury. In English, Mars carries the name of the Roman god of war and is often called the Red Planet', 1, NULL, NULL);
INSERT INTO public.planet VALUES (2, 'Venus', false, NULL, 'Venus is the second planet from the Sun and is named after the Roman goddess of love and beauty', 1, NULL, NULL);
INSERT INTO public.planet VALUES (3, 'Jupiter', false, NULL, NULL, 1, NULL, NULL);
INSERT INTO public.planet VALUES (4, 'Saturn', false, NULL, NULL, 1, NULL, NULL);
INSERT INTO public.planet VALUES (5, 'Neptune', false, NULL, NULL, 1, NULL, NULL);
INSERT INTO public.planet VALUES (6, 'Uranus', false, NULL, NULL, 1, NULL, NULL);
INSERT INTO public.planet VALUES (7, 'Pluto', false, NULL, NULL, 1, NULL, NULL);
INSERT INTO public.planet VALUES (8, 'Earth', true, NULL, NULL, 1, NULL, NULL);
INSERT INTO public.planet VALUES (9, 'Mercury', false, NULL, NULL, 1, NULL, NULL);
INSERT INTO public.planet VALUES (10, 'Ceres', false, NULL, 'A dwarf planet that is the largest object in the asteroid belt between Mars and Jupiter and the only dwarf planet located in the inner solar system', 1, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'Haumea', false, NULL, 'Dwarf planet that orbits in a disc-like zone beyond the orbit of Neptune', 1, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'Eris', false, NULL, 'Most massive and second-largest known dwarf planet in Solar System', 1, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', NULL, NULL, NULL);
INSERT INTO public.star VALUES (2, 'Sirius', 'Alpha Canis Majoris', 9, NULL);
INSERT INTO public.star VALUES (3, 'Canopus', 'Alpha Carinae', 313, NULL);
INSERT INTO public.star VALUES (4, 'Arcturus', 'Alpha Bootis', 37, NULL);
INSERT INTO public.star VALUES (5, 'Rigel Kentaurus', 'Alpha Centauri', 4, NULL);
INSERT INTO public.star VALUES (6, 'Vega', 'Alpha Lyrae', 25, NULL);
INSERT INTO public.star VALUES (7, 'Capella', 'Alpha Aurigae', 42, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.more_info_more_info_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: more_info more_info_more_info_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_more_info_id_key UNIQUE (more_info_id);


--
-- Name: more_info more_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_pkey PRIMARY KEY (more_info_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy UNIQUE (name);


--
-- Name: moon unique_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon UNIQUE (name);


--
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: planet unique_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet UNIQUE (planet_id);


--
-- Name: star unique_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star UNIQUE (name);


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
-- PostgreSQL database dump complete
--

