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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    name character varying(40) NOT NULL,
    asteroid_id integer NOT NULL,
    size_in_km numeric NOT NULL
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(20) NOT NULL,
    galaxy_id integer NOT NULL,
    distance_across numeric(8,1) NOT NULL,
    number_of_stars numeric(8,2),
    age integer NOT NULL
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
    name character varying(20) NOT NULL,
    moon_id integer NOT NULL,
    planet_id integer,
    closest_planet text,
    distance_to_closest_planet numeric(10,2)
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
    name character varying(20) NOT NULL,
    planet_id integer NOT NULL,
    surfaces text,
    rings boolean,
    ring_count integer,
    moon boolean,
    star_id integer
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
    name character varying(20) NOT NULL,
    star_id integer NOT NULL,
    color text,
    mass numeric(10,2),
    galaxy_id integer,
    size numeric(10,2)
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES ('Ceres', 1, 940);
INSERT INTO public.asteroid VALUES ('Vesta', 2, 526);
INSERT INTO public.asteroid VALUES ('Pallas', 3, 511);
INSERT INTO public.asteroid VALUES ('Hygiea', 4, 433);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Large Magellanic', 1, 158200.0, 30.00, 1);
INSERT INTO public.galaxy VALUES ('RSGC1', 2, 22.0, 200.00, 14);
INSERT INTO public.galaxy VALUES ('Milky Way', 3, 87.4, 100.00, 14);
INSERT INTO public.galaxy VALUES ('Andromeda', 4, 220.0, 1000.00, 10);
INSERT INTO public.galaxy VALUES ('Cigar', 5, 11.4, 30.00, 12);
INSERT INTO public.galaxy VALUES ('Cartwheel', 6, 150.0, 44.23, 500);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Phobos', 2, 4, 'Mars', 3700.00);
INSERT INTO public.moon VALUES ('Deimos', 3, 4, 'Mars', 3700.00);
INSERT INTO public.moon VALUES ('the Moon', 1, 3, 'Earth', 238855.00);
INSERT INTO public.moon VALUES ('lo', 4, 5, 'Jupiter', 262000.00);
INSERT INTO public.moon VALUES ('Europa', 5, 5, 'Jupiter', 417000.00);
INSERT INTO public.moon VALUES ('Ganymede', 6, 5, 'Jupiter', 665000.00);
INSERT INTO public.moon VALUES ('Callisto', 7, 5, 'Jupiter', 1170000.00);
INSERT INTO public.moon VALUES ('lapetus', 8, 6, 'Saturn', 2213000.00);
INSERT INTO public.moon VALUES ('Rhea', 9, 6, 'Saturn', 327500.00);
INSERT INTO public.moon VALUES ('Dione', 10, 6, 'Saturn', 234500.00);
INSERT INTO public.moon VALUES ('Tethys', 11, 6, 'Saturn', 183000.00);
INSERT INTO public.moon VALUES ('Oberon', 12, 7, 'Uranus', 362000.00);
INSERT INTO public.moon VALUES ('Titania', 13, 7, 'Uranus', 270820.00);
INSERT INTO public.moon VALUES ('Ariel', 14, 7, 'Uranus', 118620.00);
INSERT INTO public.moon VALUES ('Umbriel', 15, 7, 'Uranus', 165000.00);
INSERT INTO public.moon VALUES ('Triton', 16, 8, 'Neptune', 220500.00);
INSERT INTO public.moon VALUES ('Nereid', 17, 8, 'Neptune', 3425900.00);
INSERT INTO public.moon VALUES ('Halimede', 18, 8, 'Neptune', 10000000.00);
INSERT INTO public.moon VALUES ('Sao', 19, 8, 'Neptune', 14000000.00);
INSERT INTO public.moon VALUES ('Nix', 20, 10, 'Pluto', 30257.00);
INSERT INTO public.moon VALUES ('Hydra', 21, 10, 'Pluto', 40226.00);
INSERT INTO public.moon VALUES ('Kerberos', 22, 10, 'Pluto', 245600.00);
INSERT INTO public.moon VALUES ('Styx', 23, 10, 'Pluto', 12204.00);
INSERT INTO public.moon VALUES ('Charon', 24, 10, 'Pluto', 12200.00);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Mercury', 1, 'sulfur', false, 0, false, 7);
INSERT INTO public.planet VALUES ('Venus', 2, 'carbon dioxide', false, 0, false, 7);
INSERT INTO public.planet VALUES ('Earth', 3, 'nitrogen', false, 0, true, 7);
INSERT INTO public.planet VALUES ('Mars', 4, 'carbon dioxide', false, 0, true, 7);
INSERT INTO public.planet VALUES ('Jupiter', 5, 'hydrogen', true, 4, true, 7);
INSERT INTO public.planet VALUES ('Saturn', 6, 'hydrogen', true, 7, true, 7);
INSERT INTO public.planet VALUES ('Uranus', 7, 'hydrogen', true, 13, true, 7);
INSERT INTO public.planet VALUES ('Neptune', 8, 'hydrogen', true, 6, true, 7);
INSERT INTO public.planet VALUES ('Ceres', 9, 'oxygen', false, 0, false, 7);
INSERT INTO public.planet VALUES ('Pluto', 10, 'nitrogen', false, 0, true, 7);
INSERT INTO public.planet VALUES ('Haumea', 11, 'silicate minerals', true, 1, true, 7);
INSERT INTO public.planet VALUES ('Makemake', 12, 'nitrogen', false, 0, true, 7);
INSERT INTO public.planet VALUES ('Eris', 13, 'methane', false, 0, true, 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('RSGC1-F01', 4, 'red', 0.03, 2, 1.50);
INSERT INTO public.star VALUES ('WOH 5170', 3, 'red', 1.70, 1, 1461.00);
INSERT INTO public.star VALUES ('WOH G64', 2, 'red', 4.97, 1, 2.00);
INSERT INTO public.star VALUES ('UY SCUTI', 1, 'bright red', 7.00, 3, 2.40);
INSERT INTO public.star VALUES ('VY CANIS MAJORIS', 6, 'red', 3.38, 3, 2000.00);
INSERT INTO public.star VALUES ('HD 269551', 5, 'red', 15.00, 1, 1.20);
INSERT INTO public.star VALUES ('Sol', 7, 'white', 1.99, 3, 846.40);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 1, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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

