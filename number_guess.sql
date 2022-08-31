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

DROP DATABASE guessing_game;
--
-- Name: guessing_game; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE guessing_game WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE guessing_game OWNER TO freecodecamp;

\connect guessing_game

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer,
    guesses integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 2, 4);
INSERT INTO public.games VALUES (2, 16, 4);
INSERT INTO public.games VALUES (3, 17, 28);
INSERT INTO public.games VALUES (4, 16, 23);
INSERT INTO public.games VALUES (5, 16, 31);
INSERT INTO public.games VALUES (6, 16, 12);
INSERT INTO public.games VALUES (7, 18, 21);
INSERT INTO public.games VALUES (8, 19, 2);
INSERT INTO public.games VALUES (9, 18, 14);
INSERT INTO public.games VALUES (10, 18, 28);
INSERT INTO public.games VALUES (11, 18, 27);
INSERT INTO public.games VALUES (12, 20, 2);
INSERT INTO public.games VALUES (13, 21, 26);
INSERT INTO public.games VALUES (14, 20, 9);
INSERT INTO public.games VALUES (15, 20, 8);
INSERT INTO public.games VALUES (16, 20, 24);
INSERT INTO public.games VALUES (17, 2, 2);
INSERT INTO public.games VALUES (18, 22, 9);
INSERT INTO public.games VALUES (19, 23, 15);
INSERT INTO public.games VALUES (20, 22, 6);
INSERT INTO public.games VALUES (21, 22, 20);
INSERT INTO public.games VALUES (22, 22, 20);
INSERT INTO public.games VALUES (23, 24, 8);
INSERT INTO public.games VALUES (24, 25, 15);
INSERT INTO public.games VALUES (25, 24, 12);
INSERT INTO public.games VALUES (26, 24, 12);
INSERT INTO public.games VALUES (27, 24, 11);
INSERT INTO public.games VALUES (28, 26, 12);
INSERT INTO public.games VALUES (29, 27, 9);
INSERT INTO public.games VALUES (30, 26, 3);
INSERT INTO public.games VALUES (31, 26, 30);
INSERT INTO public.games VALUES (32, 26, 30);
INSERT INTO public.games VALUES (33, 2, 1);
INSERT INTO public.games VALUES (34, 2, 3);
INSERT INTO public.games VALUES (35, 28, 20);
INSERT INTO public.games VALUES (36, 29, 11);
INSERT INTO public.games VALUES (37, 28, 6);
INSERT INTO public.games VALUES (38, 28, 6);
INSERT INTO public.games VALUES (39, 28, 15);
INSERT INTO public.games VALUES (40, 2, 4);
INSERT INTO public.games VALUES (41, 30, 32);
INSERT INTO public.games VALUES (42, 31, 21);
INSERT INTO public.games VALUES (43, 30, 34);
INSERT INTO public.games VALUES (44, 30, 11);
INSERT INTO public.games VALUES (45, 30, 25);
INSERT INTO public.games VALUES (46, 33, 10);
INSERT INTO public.games VALUES (47, 33, 11);
INSERT INTO public.games VALUES (48, 34, 6);
INSERT INTO public.games VALUES (49, 34, 33);
INSERT INTO public.games VALUES (50, 33, 14);
INSERT INTO public.games VALUES (51, 33, 12);
INSERT INTO public.games VALUES (52, 33, 28);
INSERT INTO public.games VALUES (53, 2, 2);
INSERT INTO public.games VALUES (54, 35, 3);
INSERT INTO public.games VALUES (55, 36, 8);
INSERT INTO public.games VALUES (56, 36, 5);
INSERT INTO public.games VALUES (57, 36, 9);
INSERT INTO public.games VALUES (58, 36, 5);
INSERT INTO public.games VALUES (59, 36, 3);
INSERT INTO public.games VALUES (60, 36, 19);
INSERT INTO public.games VALUES (61, 36, 8);
INSERT INTO public.games VALUES (62, 2, 4);
INSERT INTO public.games VALUES (63, 36, 14);
INSERT INTO public.games VALUES (64, 37, 337);
INSERT INTO public.games VALUES (65, 37, 905);
INSERT INTO public.games VALUES (66, 38, 408);
INSERT INTO public.games VALUES (67, 38, 198);
INSERT INTO public.games VALUES (68, 37, 919);
INSERT INTO public.games VALUES (69, 37, 180);
INSERT INTO public.games VALUES (70, 37, 628);
INSERT INTO public.games VALUES (71, 39, 382);
INSERT INTO public.games VALUES (72, 39, 488);
INSERT INTO public.games VALUES (73, 40, 511);
INSERT INTO public.games VALUES (74, 40, 933);
INSERT INTO public.games VALUES (75, 39, 955);
INSERT INTO public.games VALUES (76, 39, 282);
INSERT INTO public.games VALUES (77, 39, 168);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'the_best_guesser');
INSERT INTO public.users VALUES (2, 'Jose');
INSERT INTO public.users VALUES (3, 'user_1661953628777');
INSERT INTO public.users VALUES (4, 'user_1661953628776');
INSERT INTO public.users VALUES (5, 'user_1661954034375');
INSERT INTO public.users VALUES (6, 'user_1661954034374');
INSERT INTO public.users VALUES (7, 'user_1661956846918');
INSERT INTO public.users VALUES (8, 'user_1661956846917');
INSERT INTO public.users VALUES (9, 'user_1661957014516');
INSERT INTO public.users VALUES (10, 'user_1661957014515');
INSERT INTO public.users VALUES (11, 'Jos');
INSERT INTO public.users VALUES (12, 'user_1661957676358');
INSERT INTO public.users VALUES (13, 'user_1661957676357');
INSERT INTO public.users VALUES (14, 'user_1661958119758');
INSERT INTO public.users VALUES (15, 'user_1661958119757');
INSERT INTO public.users VALUES (16, 'user_1661958729498');
INSERT INTO public.users VALUES (17, 'user_1661958729497');
INSERT INTO public.users VALUES (18, 'user_1661958941145');
INSERT INTO public.users VALUES (19, 'user_1661958941144');
INSERT INTO public.users VALUES (20, 'user_1661959064989');
INSERT INTO public.users VALUES (21, 'user_1661959064988');
INSERT INTO public.users VALUES (22, 'user_1661959414578');
INSERT INTO public.users VALUES (23, 'user_1661959414577');
INSERT INTO public.users VALUES (24, 'user_1661959512829');
INSERT INTO public.users VALUES (25, 'user_1661959512828');
INSERT INTO public.users VALUES (26, 'user_1661959560927');
INSERT INTO public.users VALUES (27, 'user_1661959560926');
INSERT INTO public.users VALUES (28, 'user_1661959742230');
INSERT INTO public.users VALUES (29, 'user_1661959742229');
INSERT INTO public.users VALUES (30, 'user_1661960097118');
INSERT INTO public.users VALUES (31, 'user_1661960097117');
INSERT INTO public.users VALUES (32, 'this-is-one-long-name-to-enter');
INSERT INTO public.users VALUES (33, 'user_1661960172711');
INSERT INTO public.users VALUES (34, 'user_1661960172710');
INSERT INTO public.users VALUES (35, 'new guy');
INSERT INTO public.users VALUES (36, 'Joe');
INSERT INTO public.users VALUES (37, 'user_1661961209118');
INSERT INTO public.users VALUES (38, 'user_1661961209117');
INSERT INTO public.users VALUES (39, 'user_1661961247047');
INSERT INTO public.users VALUES (40, 'user_1661961247046');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 77, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 40, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

