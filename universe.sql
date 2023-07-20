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
    name character varying(60) NOT NULL,
    description text NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_milions_of_years numeric,
    has_life boolean
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
    name character varying(60) NOT NULL,
    description text NOT NULL,
    type character varying(30) NOT NULL,
    age_in_milions_of_years integer,
    moon_id integer NOT NULL,
    planet_id integer,
    has_life boolean
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
    name character varying(60) NOT NULL,
    description text NOT NULL,
    type character varying(30) NOT NULL,
    age_in_milions_of_years integer,
    planet_id integer NOT NULL,
    star_id integer,
    has_life boolean
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
    name character varying(60) NOT NULL,
    description text NOT NULL,
    type character varying(30) NOT NULL,
    age_in_milions_of_years integer,
    star_id integer NOT NULL,
    system_id integer,
    galaxy_id integer
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
-- Name: system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.system (
    name character varying(60) NOT NULL,
    description text,
    age_in_milions_of_years numeric,
    system_id integer NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.system OWNER TO freecodecamp;

--
-- Name: system_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.system_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.system_system_id_seq OWNER TO freecodecamp;

--
-- Name: system_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.system_system_id_seq OWNED BY public.system.system_id;


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
-- Name: system system_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.system ALTER COLUMN system_id SET DEFAULT nextval('public.system_system_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Andromeda', 'Near Galaxy', 2, 10, true);
INSERT INTO public.galaxy VALUES ('Sombrero', 'Far Galaxy', 3, 13.25, true);
INSERT INTO public.galaxy VALUES ('Comet', 'Looks like comet?', 4, 5, false);
INSERT INTO public.galaxy VALUES ('Black Eye', 'Odd name', 5, 13.28, false);
INSERT INTO public.galaxy VALUES ('Milky Way', 'Our Galaxy', 1, 13.5, true);
INSERT INTO public.galaxy VALUES ('Needle', 'That type of names...', 6, 13.24, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Lorem', 'Ipsum', 'Lorem', 1, 1, 1, false);
INSERT INTO public.moon VALUES ('Lorem2', 'Ipsum', 'Lorem', 1, 3, 1, false);
INSERT INTO public.moon VALUES ('Lorem3', 'Ipsum', 'Lorem', 1, 4, 1, false);
INSERT INTO public.moon VALUES ('Lorem4', 'Ipsum', 'Lorem', 1, 5, 1, false);
INSERT INTO public.moon VALUES ('Lorem5', 'Ipsum', 'Lorem', 1, 6, 1, false);
INSERT INTO public.moon VALUES ('Lorem6', 'Ipsum', 'Lorem', 1, 7, 1, false);
INSERT INTO public.moon VALUES ('Lorem7', 'Ipsum', 'Lorem', 1, 8, 1, false);
INSERT INTO public.moon VALUES ('Lorem8', 'Ipsum', 'Lorem', 1, 9, 1, false);
INSERT INTO public.moon VALUES ('Lorem9', 'Ipsum', 'Lorem', 1, 10, 1, false);
INSERT INTO public.moon VALUES ('Lorem10', 'Ipsum', 'Lorem', 1, 11, 1, false);
INSERT INTO public.moon VALUES ('Lorem11', 'Ipsum', 'Lorem', 1, 12, 1, false);
INSERT INTO public.moon VALUES ('Lorem12', 'Ipsum', 'Lorem', 1, 13, 1, false);
INSERT INTO public.moon VALUES ('Lorem13', 'Ipsum', 'Lorem', 1, 14, 1, false);
INSERT INTO public.moon VALUES ('Lorem14', 'Ipsum', 'Lorem', 1, 15, 1, false);
INSERT INTO public.moon VALUES ('Lorem15', 'Ipsum', 'Lorem', 1, 16, 1, false);
INSERT INTO public.moon VALUES ('Lorem16', 'Ipsum', 'Lorem', 1, 17, 1, false);
INSERT INTO public.moon VALUES ('Lorem17', 'Ipsum', 'Lorem', 1, 18, 1, false);
INSERT INTO public.moon VALUES ('Lorem18', 'Ipsum', 'Lorem', 1, 19, 1, false);
INSERT INTO public.moon VALUES ('Lorem19', 'Ipsum', 'Lorem', 1, 20, 1, false);
INSERT INTO public.moon VALUES ('Lorem20', 'Ipsum', 'Lorem', 1, 21, 1, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Mercury', 'Closest to the sun', 'dead', 5, 1, 1, false);
INSERT INTO public.planet VALUES ('Venus', 'Used to support life', 'dead', 5, 2, 1, false);
INSERT INTO public.planet VALUES ('Earth', 'Our planet', 'living planet', 5, 3, 1, true);
INSERT INTO public.planet VALUES ('Mars', 'Used to have life', 'dead', 5, 4, 1, true);
INSERT INTO public.planet VALUES ('Jupiter', 'Biggest planet', 'gas giant', 5, 5, 1, false);
INSERT INTO public.planet VALUES ('Saturn', 'Has asteroid belt', 'asteroid belt', 5, 6, 1, false);
INSERT INTO public.planet VALUES ('Uranus', 'Cold', 'ice planet', 5, 7, 1, false);
INSERT INTO public.planet VALUES ('Neptune', 'Cold and rocky', 'ice cold rock', 5, 8, 1, false);
INSERT INTO public.planet VALUES ('Pluto', 'No longer cosider a planet', 'exoplanet', 5, 9, 1, false);
INSERT INTO public.planet VALUES ('Proxima Centuri B', 'Unknown', 'Unknown', 5, 10, 3, false);
INSERT INTO public.planet VALUES ('Proxima Centuri C', 'Unknown', 'Unknown', 5, 11, 3, false);
INSERT INTO public.planet VALUES ('Niburu', 'Unknown', 'Unknown', 5, 12, 3, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sun', 'Our star', 'G2V', 5, 1, 1, 1);
INSERT INTO public.star VALUES ('Sirius', 'Brightest', 'A1V', 265, 2, 1, 1);
INSERT INTO public.star VALUES ('Alpha Centuri', 'Named after Centaur', 'M5', 6, 3, 1, 1);
INSERT INTO public.star VALUES ('Altair', 'Flying Eagle', 'M5', 1, 4, 1, 1);
INSERT INTO public.star VALUES ('Carina', 'That name', 'M4', 12, 5, 1, 1);
INSERT INTO public.star VALUES ('EV Carinea', 'EV?', 'M4', 3, 6, 1, 1);


--
-- Data for Name: system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.system VALUES ('Solar System', 'Our system', 4.571, 1, 1);
INSERT INTO public.system VALUES ('Alpha Centuri', 'Neighbour', 4.85, 2, 1);
INSERT INTO public.system VALUES ('Lorem20', 'Ipsum', 1, 3, 3);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: system_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.system_system_id_seq', 3, true);


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
-- Name: system system_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.system
    ADD CONSTRAINT system_name_key UNIQUE (name);


--
-- Name: system system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.system
    ADD CONSTRAINT system_pkey PRIMARY KEY (system_id);


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
-- Name: star star_system_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_system_id_fkey FOREIGN KEY (system_id) REFERENCES public.system(system_id);


--
-- Name: system system_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.system
    ADD CONSTRAINT system_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

