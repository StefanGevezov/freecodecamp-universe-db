--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    age_in_millions_of_years integer,
    description text,
    has_life boolean,
    galaxy_types character varying(50),
    distance_from_earth numeric
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
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    is_common boolean
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    description text,
    is_spherical boolean,
    distance_from_earth numeric
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
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    planet_types character varying(50),
    has_life boolean,
    distance_from_earth numeric,
    description text
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
    galaxy_id integer NOT NULL,
    age_in_millions_of_years integer,
    is_spherical boolean,
    star_types character varying(30)
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
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13600, 'Our Galaxy', true, 'spiral', 0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10010, 'Nearest large spiral galaxy', false, 'spiral', 2537000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 13000, 'Third largest in the Local Group', false, 'spiral', 2723000);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 13250, 'Bright galaxy with a large central bulge', false, 'lenticular', 31100000);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 12000, 'Interacting with a smaller companion galaxy', false, 'spiral', 23000000);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 12500, 'Ring shape formed by a collision', false, 'lenticular', 500000000);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'Spiral', 'Flat, rotating disk with spiral arms', true);
INSERT INTO public.galaxy_type VALUES (2, 'Elliptical', 'Smooth, featureless light profile, spherical or elongated', true);
INSERT INTO public.galaxy_type VALUES (3, 'Lenticular', 'Disk shape without prominent spiral arms', false);
INSERT INTO public.galaxy_type VALUES (4, 'Irregular', 'No defined shape, often result of gravitational disruption', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 3, 'Earth''s only natural satellite', true, 384400);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 'Larger and closer of Mars'' two moons', false, 225000000);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 'Smaller of Mars'' two moons', false, 225000000);
INSERT INTO public.moon VALUES (4, 'Io', 5, 'Most volcanically active body in the solar system', true, 628000000);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 'Icy moon with a subsurface ocean', true, 628000000);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 'Largest moon in the solar system', true, 628000000);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 'Heavily cratered moon of Jupiter', true, 628000000);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 'Only moon with a dense atmosphere', true, 1275000000);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 'Has geysers of water ice', true, 1275000000);
INSERT INTO public.moon VALUES (10, 'Mimas', 6, 'Known for its large crater', true, 1275000000);
INSERT INTO public.moon VALUES (11, 'Rhea', 6, 'Second largest moon of Saturn', true, 1275000000);
INSERT INTO public.moon VALUES (12, 'Iapetus', 6, 'Has a two-toned coloring', true, 1275000000);
INSERT INTO public.moon VALUES (13, 'Charon', 12, 'Largest moon relative to its planet', true, 25000000000000);
INSERT INTO public.moon VALUES (14, 'Triton', 7, 'Orbits Sirius Prime backwards', false, 8600000000000);
INSERT INTO public.moon VALUES (15, 'Nereid', 7, 'Has a highly eccentric orbit', false, 8600000000000);
INSERT INTO public.moon VALUES (16, 'Vega c I', 11, 'First moon of Vega c', true, 20000000000000);
INSERT INTO public.moon VALUES (17, 'Vega c II', 11, 'Second moon of Vega c', false, 20000000000000);
INSERT INTO public.moon VALUES (18, 'Vega d I', 12, 'Only moon of Vega d', true, 25000000000000);
INSERT INTO public.moon VALUES (19, 'Rigel b I', 10, 'Orbits a gas giant', true, 46000000000000);
INSERT INTO public.moon VALUES (20, 'Proxima b I', 9, 'Orbits Proxima b', false, 40000000000000);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'terrestrial', false, 77000000, 'Closest planet to the Sun');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'terrestrial', false, 261000000, 'Hottest planet in the system');
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'terrestrial', true, 0, 'Home planet');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'terrestrial', false, 225000000, 'The red planet');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'gas giant', false, 628000000, 'Largest planet');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'gas giant', false, 1275000000, 'Known for its rings');
INSERT INTO public.planet VALUES (7, 'Sirius Prime', 2, 'gas giant', false, 8600000000000, 'Orbits Sirius');
INSERT INTO public.planet VALUES (8, 'Betelgeuse I', 3, 'terrestrial', false, 6000000000000, 'Orbits a red supergiant');
INSERT INTO public.planet VALUES (9, 'Proxima b', 4, 'terrestrial', false, 40000000000000, 'Orbits Proxima Centauri');
INSERT INTO public.planet VALUES (10, 'Rigel b', 5, 'gas giant', false, 46000000000000, 'Orbits a blue supergiant');
INSERT INTO public.planet VALUES (11, 'Vega c', 6, 'terrestrial', false, 20000000000000, 'Orbits Vega');
INSERT INTO public.planet VALUES (12, 'Vega d', 6, 'gas giant', false, 25000000000000, 'Second planet around Vega');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4600, true, 'yellow dwarf');
INSERT INTO public.star VALUES (2, 'Sirius', 1, 242, true, 'main sequence');
INSERT INTO public.star VALUES (3, 'Betelgeuse', 2, 8, false, 'red supergiant');
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 2, 4850, true, 'red dwarf');
INSERT INTO public.star VALUES (5, 'Rigel', 3, 8, true, 'blue supergiant');
INSERT INTO public.star VALUES (6, 'Vega', 4, 455, true, 'main sequence');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 4, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: galaxy_type galaxy_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


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

