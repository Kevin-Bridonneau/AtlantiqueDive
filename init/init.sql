--
-- PostgreSQL database dump
--

-- Dumped from database version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: divesites; Type: TABLE; Schema: public; Owner: daegon
--

CREATE TABLE public.divesites (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    lat double precision NOT NULL,
    lng double precision NOT NULL,
    depth integer NOT NULL,
    visibility character varying(255),
    current character varying(255),
    pathtopicture character varying(255)
);


ALTER TABLE public.divesites OWNER TO daegon;

--
-- Name: divesites_id_seq; Type: SEQUENCE; Schema: public; Owner: daegon
--

CREATE SEQUENCE public.divesites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.divesites_id_seq OWNER TO daegon;

--
-- Name: divesites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daegon
--

ALTER SEQUENCE public.divesites_id_seq OWNED BY public.divesites.id;


--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: daegon
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO daegon;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: daegon
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.failed_jobs_id_seq OWNER TO daegon;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daegon
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: daegon
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO daegon;


--
-- Name: notice; Type: TABLE; Schema: public; Owner: daegon
--

CREATE TABLE public.notice (
    id bigint NOT NULL,
    dive_id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    msg character varying(255) NOT NULL,
    rate integer NOT NULL
);


ALTER TABLE public.notice OWNER TO daegon;

--
-- Name: notice_id_seq; Type: SEQUENCE; Schema: public; Owner: daegon
--

CREATE SEQUENCE public.notice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notice_id_seq OWNER TO daegon;

--
-- Name: notice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daegon
--

ALTER SEQUENCE public.notice_id_seq OWNED BY public.notice.id;


--
-- Name: oauth_access_tokens; Type: TABLE; Schema: public; Owner: daegon
--

CREATE TABLE public.oauth_access_tokens (
    id character varying(100) NOT NULL,
    user_id bigint,
    client_id bigint NOT NULL,
    name character varying(255),
    scopes text,
    revoked boolean NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone
);


ALTER TABLE public.oauth_access_tokens OWNER TO daegon;

--
-- Name: oauth_auth_codes; Type: TABLE; Schema: public; Owner: daegon
--

CREATE TABLE public.oauth_auth_codes (
    id character varying(100) NOT NULL,
    user_id bigint NOT NULL,
    client_id bigint NOT NULL,
    scopes text,
    revoked boolean NOT NULL,
    expires_at timestamp(0) without time zone
);


ALTER TABLE public.oauth_auth_codes OWNER TO daegon;

--
-- Name: oauth_clients; Type: TABLE; Schema: public; Owner: daegon
--

CREATE TABLE public.oauth_clients (
    id bigint NOT NULL,
    user_id bigint,
    name character varying(255) NOT NULL,
    secret character varying(100),
    provider character varying(255),
    redirect text NOT NULL,
    personal_access_client boolean NOT NULL,
    password_client boolean NOT NULL,
    revoked boolean NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.oauth_clients OWNER TO daegon;

--
-- Name: oauth_clients_id_seq; Type: SEQUENCE; Schema: public; Owner: daegon
--

CREATE SEQUENCE public.oauth_clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth_clients_id_seq OWNER TO daegon;

--
-- Name: oauth_clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daegon
--

ALTER SEQUENCE public.oauth_clients_id_seq OWNED BY public.oauth_clients.id;


--
-- Name: oauth_personal_access_clients; Type: TABLE; Schema: public; Owner: daegon
--

CREATE TABLE public.oauth_personal_access_clients (
    id bigint NOT NULL,
    client_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.oauth_personal_access_clients OWNER TO daegon;

--
-- Name: oauth_personal_access_clients_id_seq; Type: SEQUENCE; Schema: public; Owner: daegon
--

CREATE SEQUENCE public.oauth_personal_access_clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth_personal_access_clients_id_seq OWNER TO daegon;

--
-- Name: oauth_personal_access_clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daegon
--

ALTER SEQUENCE public.oauth_personal_access_clients_id_seq OWNED BY public.oauth_personal_access_clients.id;


--
-- Name: oauth_refresh_tokens; Type: TABLE; Schema: public; Owner: daegon
--

CREATE TABLE public.oauth_refresh_tokens (
    id character varying(100) NOT NULL,
    access_token_id character varying(100) NOT NULL,
    revoked boolean NOT NULL,
    expires_at timestamp(0) without time zone
);


ALTER TABLE public.oauth_refresh_tokens OWNER TO daegon;

--
-- Name: password_resets; Type: TABLE; Schema: public; Owner: daegon
--

CREATE TABLE public.password_resets (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_resets OWNER TO daegon;

--
-- Name: presence; Type: TABLE; Schema: public; Owner: daegon
--

CREATE TABLE public.presence (
    id bigint NOT NULL,
    dive_id integer NOT NULL,
    club_id integer NOT NULL
);


ALTER TABLE public.presence OWNER TO daegon;

--
-- Name: presence_id_seq; Type: SEQUENCE; Schema: public; Owner: daegon
--

CREATE SEQUENCE public.presence_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.presence_id_seq OWNER TO daegon;

--
-- Name: presence_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daegon
--

ALTER SEQUENCE public.presence_id_seq OWNED BY public.presence.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: daegon
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    type character varying(255),
    adress character varying(255),
    phone character varying(255),
    website character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.users OWNER TO daegon;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: daegon
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO daegon;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daegon
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: divesites id; Type: DEFAULT; Schema: public; Owner: daegon
--

ALTER TABLE ONLY public.divesites ALTER COLUMN id SET DEFAULT nextval('public.divesites_id_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: daegon
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: daegon
--


--
-- Name: notice id; Type: DEFAULT; Schema: public; Owner: daegon
--

ALTER TABLE ONLY public.notice ALTER COLUMN id SET DEFAULT nextval('public.notice_id_seq'::regclass);


--
-- Name: oauth_clients id; Type: DEFAULT; Schema: public; Owner: daegon
--

ALTER TABLE ONLY public.oauth_clients ALTER COLUMN id SET DEFAULT nextval('public.oauth_clients_id_seq'::regclass);


--
-- Name: oauth_personal_access_clients id; Type: DEFAULT; Schema: public; Owner: daegon
--

ALTER TABLE ONLY public.oauth_personal_access_clients ALTER COLUMN id SET DEFAULT nextval('public.oauth_personal_access_clients_id_seq'::regclass);


--
-- Name: presence id; Type: DEFAULT; Schema: public; Owner: daegon
--

ALTER TABLE ONLY public.presence ALTER COLUMN id SET DEFAULT nextval('public.presence_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: daegon
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: divesites; Type: TABLE DATA; Schema: public; Owner: daegon
--

COPY public.divesites (id, name, description, lat, lng, depth, visibility, current, pathtopicture) FROM stdin;
1	Epave du Cimcour	Dit le Cimentier l'Alizée	46.0333333333329975	-2.16666666666669983	38	Bonne	faible	/images/1.jpg
2	L'Afrique	En quittant Bordeaux, le bateau est victime d'une voie d'eau. Il dérive dans la tempête qui le drosse sur Rochebonne. Il coule le 12 janvier 1920.	46.3333333333330017	-2.18333333333329982	47	Bonne	faible	/images/1.jpg
\.


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: daegon
--

COPY public.failed_jobs (id, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: daegon
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	2014_10_12_000000_create_users_table	1
2	2014_10_12_100000_create_password_resets_table	1
3	2016_06_01_000001_create_oauth_auth_codes_table	1
4	2016_06_01_000002_create_oauth_access_tokens_table	1
5	2016_06_01_000003_create_oauth_refresh_tokens_table	1
6	2016_06_01_000004_create_oauth_clients_table	1
7	2016_06_01_000005_create_oauth_personal_access_clients_table	1
8	2019_08_19_000000_create_failed_jobs_table	1
9	2020_08_05_101519_dive_sites	1
10	2020_08_06_080509_notice	2
11	2020_08_06_081847_presence	3
\.


--
-- Data for Name: notice; Type: TABLE DATA; Schema: public; Owner: daegon
--

COPY public.notice (id, dive_id, user_id, created_at, msg, rate) FROM stdin;
1	1	1	2020-08-06 08:36:56	Super site de plongée , pratiqué au mois d'aout 2020	5
2	2	1	2020-08-06 08:39:53	Site très poissonneux, ne pas oublier sa torche pour bien en profité	4
\.


--
-- Data for Name: oauth_access_tokens; Type: TABLE DATA; Schema: public; Owner: daegon
--

COPY public.oauth_access_tokens (id, user_id, client_id, name, scopes, revoked, created_at, updated_at, expires_at) FROM stdin;
\.


--
-- Data for Name: oauth_auth_codes; Type: TABLE DATA; Schema: public; Owner: daegon
--

COPY public.oauth_auth_codes (id, user_id, client_id, scopes, revoked, expires_at) FROM stdin;
\.


--
-- Data for Name: oauth_clients; Type: TABLE DATA; Schema: public; Owner: daegon
--

COPY public.oauth_clients (id, user_id, name, secret, provider, redirect, personal_access_client, password_client, revoked, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: oauth_personal_access_clients; Type: TABLE DATA; Schema: public; Owner: daegon
--

COPY public.oauth_personal_access_clients (id, client_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: oauth_refresh_tokens; Type: TABLE DATA; Schema: public; Owner: daegon
--

COPY public.oauth_refresh_tokens (id, access_token_id, revoked, expires_at) FROM stdin;
\.


--
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: daegon
--

COPY public.password_resets (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: presence; Type: TABLE DATA; Schema: public; Owner: daegon
--

COPY public.presence (id, dive_id, club_id) FROM stdin;
1	2	2
2	1	2
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: daegon
--

COPY public.users (id, name, email, email_verified_at, password, remember_token, type, adress, phone, website, created_at, updated_at) FROM stdin;
1	Kevin Bridonneau	bridonneau.kevin@gmail.com	\N	$2y$10$16X4Vaatwn6rbMLwSxiWgewIJGbWKi895d2PpDPriXmQP6THYbhrK	\N	plongeur	\N	\N	\N	2020-08-05 14:47:25	2020-08-05 14:47:25
2	Scy85	scy85@gmail.com	\N	$2y$10$natG1Y/Cwz/Ksk94eqjM1uvuWNGgIqvO3xr1kPzs6vAw9YopJjjg2	\N	club	La Roche Sur Yon	0240545454	scy85.org	2020-08-06 08:46:51	2020-08-06 08:46:51
\.


--
-- Name: divesites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daegon
--

SELECT pg_catalog.setval('public.divesites_id_seq', 2, true);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daegon
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daegon
--



--
-- Name: notice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daegon
--

SELECT pg_catalog.setval('public.notice_id_seq', 2, true);


--
-- Name: oauth_clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daegon
--

SELECT pg_catalog.setval('public.oauth_clients_id_seq', 1, false);


--
-- Name: oauth_personal_access_clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daegon
--

SELECT pg_catalog.setval('public.oauth_personal_access_clients_id_seq', 1, false);


--
-- Name: presence_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daegon
--

SELECT pg_catalog.setval('public.presence_id_seq', 2, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daegon
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- Name: divesites divesites_pkey; Type: CONSTRAINT; Schema: public; Owner: daegon
--

ALTER TABLE ONLY public.divesites
    ADD CONSTRAINT divesites_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: daegon
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: daegon
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: notice notice_pkey; Type: CONSTRAINT; Schema: public; Owner: daegon
--

ALTER TABLE ONLY public.notice
    ADD CONSTRAINT notice_pkey PRIMARY KEY (id);


--
-- Name: oauth_access_tokens oauth_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: daegon
--

ALTER TABLE ONLY public.oauth_access_tokens
    ADD CONSTRAINT oauth_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: oauth_auth_codes oauth_auth_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: daegon
--

ALTER TABLE ONLY public.oauth_auth_codes
    ADD CONSTRAINT oauth_auth_codes_pkey PRIMARY KEY (id);


--
-- Name: oauth_clients oauth_clients_pkey; Type: CONSTRAINT; Schema: public; Owner: daegon
--

ALTER TABLE ONLY public.oauth_clients
    ADD CONSTRAINT oauth_clients_pkey PRIMARY KEY (id);


--
-- Name: oauth_personal_access_clients oauth_personal_access_clients_pkey; Type: CONSTRAINT; Schema: public; Owner: daegon
--

ALTER TABLE ONLY public.oauth_personal_access_clients
    ADD CONSTRAINT oauth_personal_access_clients_pkey PRIMARY KEY (id);


--
-- Name: oauth_refresh_tokens oauth_refresh_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: daegon
--

ALTER TABLE ONLY public.oauth_refresh_tokens
    ADD CONSTRAINT oauth_refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: presence presence_pkey; Type: CONSTRAINT; Schema: public; Owner: daegon
--

ALTER TABLE ONLY public.presence
    ADD CONSTRAINT presence_pkey PRIMARY KEY (id);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: daegon
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: daegon
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: oauth_access_tokens_user_id_index; Type: INDEX; Schema: public; Owner: daegon
--

CREATE INDEX oauth_access_tokens_user_id_index ON public.oauth_access_tokens USING btree (user_id);


--
-- Name: oauth_auth_codes_user_id_index; Type: INDEX; Schema: public; Owner: daegon
--

CREATE INDEX oauth_auth_codes_user_id_index ON public.oauth_auth_codes USING btree (user_id);


--
-- Name: oauth_clients_user_id_index; Type: INDEX; Schema: public; Owner: daegon
--

CREATE INDEX oauth_clients_user_id_index ON public.oauth_clients USING btree (user_id);


--
-- Name: oauth_refresh_tokens_access_token_id_index; Type: INDEX; Schema: public; Owner: daegon
--

CREATE INDEX oauth_refresh_tokens_access_token_id_index ON public.oauth_refresh_tokens USING btree (access_token_id);


--
-- Name: password_resets_email_index; Type: INDEX; Schema: public; Owner: daegon
--

CREATE INDEX password_resets_email_index ON public.password_resets USING btree (email);


--
-- Name: notice notice_dive_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: daegon
--

ALTER TABLE ONLY public.notice
    ADD CONSTRAINT notice_dive_id_foreign FOREIGN KEY (dive_id) REFERENCES public.divesites(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: notice notice_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: daegon
--

ALTER TABLE ONLY public.notice
    ADD CONSTRAINT notice_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: presence presence_club_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: daegon
--

ALTER TABLE ONLY public.presence
    ADD CONSTRAINT presence_club_id_foreign FOREIGN KEY (club_id) REFERENCES public.users(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: presence presence_dive_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: daegon
--

ALTER TABLE ONLY public.presence
    ADD CONSTRAINT presence_dive_id_foreign FOREIGN KEY (dive_id) REFERENCES public.divesites(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

