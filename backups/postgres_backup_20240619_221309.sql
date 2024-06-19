--
-- PostgreSQL database dump
--

-- Dumped from database version 14.12 (Homebrew)
-- Dumped by pg_dump version 14.12 (Homebrew)

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

--
-- Name: indoor_plants; Type: SCHEMA; Schema: -; Owner: yuliyastasyuk
--

CREATE SCHEMA indoor_plants;


ALTER SCHEMA indoor_plants OWNER TO yuliyastasyuk;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: dict_light; Type: TABLE; Schema: indoor_plants; Owner: yuliyastasyuk
--

CREATE TABLE indoor_plants.dict_light (
    id_light integer NOT NULL,
    light character varying(50),
    description character varying(100)
);


ALTER TABLE indoor_plants.dict_light OWNER TO yuliyastasyuk;

--
-- Name: dict_light_id_light_seq; Type: SEQUENCE; Schema: indoor_plants; Owner: yuliyastasyuk
--

CREATE SEQUENCE indoor_plants.dict_light_id_light_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE indoor_plants.dict_light_id_light_seq OWNER TO yuliyastasyuk;

--
-- Name: dict_light_id_light_seq; Type: SEQUENCE OWNED BY; Schema: indoor_plants; Owner: yuliyastasyuk
--

ALTER SEQUENCE indoor_plants.dict_light_id_light_seq OWNED BY indoor_plants.dict_light.id_light;


--
-- Name: events; Type: TABLE; Schema: indoor_plants; Owner: yuliyastasyuk
--

CREATE TABLE indoor_plants.events (
    id_event integer NOT NULL,
    id_event_type integer,
    event_date timestamp without time zone,
    id_plant integer
);


ALTER TABLE indoor_plants.events OWNER TO yuliyastasyuk;

--
-- Name: events_id_event_seq; Type: SEQUENCE; Schema: indoor_plants; Owner: yuliyastasyuk
--

CREATE SEQUENCE indoor_plants.events_id_event_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE indoor_plants.events_id_event_seq OWNER TO yuliyastasyuk;

--
-- Name: events_id_event_seq; Type: SEQUENCE OWNED BY; Schema: indoor_plants; Owner: yuliyastasyuk
--

ALTER SEQUENCE indoor_plants.events_id_event_seq OWNED BY indoor_plants.events.id_event;


--
-- Name: plant_types; Type: TABLE; Schema: indoor_plants; Owner: yuliyastasyuk
--

CREATE TABLE indoor_plants.plant_types (
    id_plant_type integer NOT NULL,
    plant_type character varying(100) NOT NULL,
    id_light integer,
    temp_min integer,
    temp_max integer
);


ALTER TABLE indoor_plants.plant_types OWNER TO yuliyastasyuk;

--
-- Name: plant_types_id_seq; Type: SEQUENCE; Schema: indoor_plants; Owner: yuliyastasyuk
--

CREATE SEQUENCE indoor_plants.plant_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE indoor_plants.plant_types_id_seq OWNER TO yuliyastasyuk;

--
-- Name: plant_types_id_seq; Type: SEQUENCE OWNED BY; Schema: indoor_plants; Owner: yuliyastasyuk
--

ALTER SEQUENCE indoor_plants.plant_types_id_seq OWNED BY indoor_plants.plant_types.id_plant_type;


--
-- Name: plant_waterings; Type: TABLE; Schema: indoor_plants; Owner: yuliyastasyuk
--

CREATE TABLE indoor_plants.plant_waterings (
    id_plant_type integer NOT NULL,
    water_spring_d integer NOT NULL,
    water_summer_d integer NOT NULL,
    water_fall_d integer NOT NULL,
    water_winter_d integer NOT NULL
);


ALTER TABLE indoor_plants.plant_waterings OWNER TO yuliyastasyuk;

--
-- Name: dict_light id_light; Type: DEFAULT; Schema: indoor_plants; Owner: yuliyastasyuk
--

ALTER TABLE ONLY indoor_plants.dict_light ALTER COLUMN id_light SET DEFAULT nextval('indoor_plants.dict_light_id_light_seq'::regclass);


--
-- Name: events id_event; Type: DEFAULT; Schema: indoor_plants; Owner: yuliyastasyuk
--

ALTER TABLE ONLY indoor_plants.events ALTER COLUMN id_event SET DEFAULT nextval('indoor_plants.events_id_event_seq'::regclass);


--
-- Name: plant_types id_plant_type; Type: DEFAULT; Schema: indoor_plants; Owner: yuliyastasyuk
--

ALTER TABLE ONLY indoor_plants.plant_types ALTER COLUMN id_plant_type SET DEFAULT nextval('indoor_plants.plant_types_id_seq'::regclass);


--
-- Data for Name: dict_light; Type: TABLE DATA; Schema: indoor_plants; Owner: yuliyastasyuk
--

COPY indoor_plants.dict_light (id_light, light, description) FROM stdin;
1	Direct sunlight	Intense, direct sunlight for several hours a day.
2	Bright, indirect light	Bright, but not direct sunlight, received near a window.
3	Filtered sunlight	Light filtered through curtains or foliage.
4	Medium light	Moderate light intensity, away from direct sun.
5	Low light	Minimal natural light, suitable for shaded areas.
6	Shade or dappled light	Very little direct light, often found under trees or shaded areas.
7	Artificial grow lights	Light provided by artificial sources, adjustable for plant needs.
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: indoor_plants; Owner: yuliyastasyuk
--

COPY indoor_plants.events (id_event, id_event_type, event_date, id_plant) FROM stdin;
\.


--
-- Data for Name: plant_types; Type: TABLE DATA; Schema: indoor_plants; Owner: yuliyastasyuk
--

COPY indoor_plants.plant_types (id_plant_type, plant_type, id_light, temp_min, temp_max) FROM stdin;
1	Sedum	1	10	30
18	Aloe Vera	1	15	25
19	Jade Plant	1	18	24
2	Tradescantia "Purple Heart"	2	15	25
3	Tradescantia "Zebrina"	2	15	25
4	Epipremnum "Happy Leaf"	2	18	27
5	Variegated Croton	2	18	27
6	Flaming Katy	2	18	24
7	Alligator Plant	2	18	24
9	Tradescantia Nanouk	2	18	24
10	Hoya Carnosa Albomarginata	2	18	24
11	Philodendron Moonshine	2	18	24
15	Maranta Fascinator	2	18	24
20	Tradescantia Turtle Vine	2	18	24
21	Codiaeum variegatum "Aucubaefolia"	2	18	27
8	Oxalis "Plum Crazy"	3	18	24
17	Christmas Cactus	3	15	25
12	Crassula	4	18	24
13	Ficus Tineke	4	18	27
14	Ficus Robusta "Belize"	4	18	27
22	Spider Plant	4	18	24
23	Chinese Money Plant	4	18	24
24	Polka Dot	4	18	24
16	Haworthia	5	18	24
25	Calathea "Freddie"	6	18	24
28	Blue Chalksticks	6	18	24
26	Mint	7	15	25
27	Rosemary	7	15	25
\.


--
-- Data for Name: plant_waterings; Type: TABLE DATA; Schema: indoor_plants; Owner: yuliyastasyuk
--

COPY indoor_plants.plant_waterings (id_plant_type, water_spring_d, water_summer_d, water_fall_d, water_winter_d) FROM stdin;
1	14	10	18	28
18	10	7	10	21
19	10	7	10	21
2	7	7	7	14
3	7	7	7	14
4	7	7	7	14
5	7	7	7	14
6	7	7	7	14
7	7	7	7	14
9	7	7	7	14
10	7	7	7	14
11	7	7	7	14
15	7	7	7	14
20	7	7	7	14
21	7	7	7	14
8	7	7	7	14
17	7	7	7	14
12	7	7	7	14
13	7	7	7	14
14	7	7	7	14
22	7	7	7	14
23	7	7	7	14
24	7	7	7	14
16	7	7	7	14
25	7	7	7	14
28	7	7	7	14
26	7	7	7	14
27	7	7	7	14
\.


--
-- Name: dict_light_id_light_seq; Type: SEQUENCE SET; Schema: indoor_plants; Owner: yuliyastasyuk
--

SELECT pg_catalog.setval('indoor_plants.dict_light_id_light_seq', 7, true);


--
-- Name: events_id_event_seq; Type: SEQUENCE SET; Schema: indoor_plants; Owner: yuliyastasyuk
--

SELECT pg_catalog.setval('indoor_plants.events_id_event_seq', 1, false);


--
-- Name: plant_types_id_seq; Type: SEQUENCE SET; Schema: indoor_plants; Owner: yuliyastasyuk
--

SELECT pg_catalog.setval('indoor_plants.plant_types_id_seq', 28, true);


--
-- Name: dict_light dict_light_pkey; Type: CONSTRAINT; Schema: indoor_plants; Owner: yuliyastasyuk
--

ALTER TABLE ONLY indoor_plants.dict_light
    ADD CONSTRAINT dict_light_pkey PRIMARY KEY (id_light);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: indoor_plants; Owner: yuliyastasyuk
--

ALTER TABLE ONLY indoor_plants.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id_event);


--
-- Name: plant_types plant_types_pkey; Type: CONSTRAINT; Schema: indoor_plants; Owner: yuliyastasyuk
--

ALTER TABLE ONLY indoor_plants.plant_types
    ADD CONSTRAINT plant_types_pkey PRIMARY KEY (id_plant_type);


--
-- Name: plant_waterings plant_waterings_pkey; Type: CONSTRAINT; Schema: indoor_plants; Owner: yuliyastasyuk
--

ALTER TABLE ONLY indoor_plants.plant_waterings
    ADD CONSTRAINT plant_waterings_pkey PRIMARY KEY (id_plant_type);


--
-- PostgreSQL database dump complete
--

