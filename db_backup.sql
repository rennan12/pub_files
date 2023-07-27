--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3 (Ubuntu 15.3-1.pgdg22.04+1)

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
-- Name: Role; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."Role" AS ENUM (
    'ADMIN',
    'USER'
);


ALTER TYPE public."Role" OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: CatComplem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CatComplem" (
    id integer NOT NULL,
    "order" integer NOT NULL,
    "dateCreate" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "dateUpdate" timestamp without time zone NOT NULL,
    name text NOT NULL,
    status boolean DEFAULT true NOT NULL,
    maximo integer NOT NULL,
    minimo integer NOT NULL,
    "productId" integer,
    "restaurantId" integer,
    uuid uuid NOT NULL
);


ALTER TABLE public."CatComplem" OWNER TO postgres;

--
-- Name: CatComplem_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."CatComplem_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."CatComplem_id_seq" OWNER TO postgres;

--
-- Name: CatComplem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."CatComplem_id_seq" OWNED BY public."CatComplem".id;


--
-- Name: CatProd; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CatProd" (
    id integer NOT NULL,
    "order" integer NOT NULL,
    "dateCreate" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "dateUpdate" timestamp without time zone NOT NULL,
    name text NOT NULL,
    status boolean DEFAULT true NOT NULL,
    "restaurantId" integer,
    uuid uuid NOT NULL
);


ALTER TABLE public."CatProd" OWNER TO postgres;

--
-- Name: CatProd_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."CatProd_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."CatProd_id_seq" OWNER TO postgres;

--
-- Name: CatProd_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."CatProd_id_seq" OWNED BY public."CatProd".id;


--
-- Name: Complemento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Complemento" (
    id integer NOT NULL,
    "order" integer NOT NULL,
    "dateCreate" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "dateUpdate" timestamp without time zone NOT NULL,
    name text NOT NULL,
    status boolean DEFAULT true NOT NULL,
    price money DEFAULT 0 NOT NULL,
    "restaurantId" integer,
    uuid uuid NOT NULL
);


ALTER TABLE public."Complemento" OWNER TO postgres;

--
-- Name: Complemento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Complemento_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Complemento_id_seq" OWNER TO postgres;

--
-- Name: Complemento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Complemento_id_seq" OWNED BY public."Complemento".id;


--
-- Name: Customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Customer" (
    id integer NOT NULL,
    "dateCreate" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "dateUpdate" timestamp without time zone NOT NULL,
    name text NOT NULL,
    phone text NOT NULL,
    "streetName" text NOT NULL,
    complement text,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL,
    status boolean DEFAULT true NOT NULL,
    "restaurantId" integer,
    uuid uuid NOT NULL
);


ALTER TABLE public."Customer" OWNER TO postgres;

--
-- Name: Customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Customer_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Customer_id_seq" OWNER TO postgres;

--
-- Name: Customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Customer_id_seq" OWNED BY public."Customer".id;


--
-- Name: IndexUUID; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."IndexUUID" (
    id integer NOT NULL,
    uuid uuid NOT NULL
);


ALTER TABLE public."IndexUUID" OWNER TO postgres;

--
-- Name: IndexUUID_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."IndexUUID_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."IndexUUID_id_seq" OWNER TO postgres;

--
-- Name: IndexUUID_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."IndexUUID_id_seq" OWNED BY public."IndexUUID".id;


--
-- Name: Pedido; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Pedido" (
    id integer NOT NULL,
    "dateCreate" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "customerName" text NOT NULL,
    phone text NOT NULL,
    "typeDelivery" text NOT NULL,
    "streetName" text,
    latitude double precision,
    longitude double precision,
    complement text,
    "valorEntrega" money,
    "typePay" text NOT NULL,
    troco money,
    "observacaoGeral" text,
    amount money NOT NULL,
    "sumTotal" money NOT NULL,
    products text NOT NULL,
    status text DEFAULT 'Pendente'::text NOT NULL,
    "statusCancel" boolean DEFAULT false NOT NULL,
    "datePedidoAndamento" timestamp without time zone,
    "datePedidoSaiuEntrega" timestamp without time zone,
    "datePedidoConcluido" timestamp without time zone,
    "datePedidoCancelado" timestamp without time zone,
    "restaurantId" integer,
    "customerId" integer,
    "distanceDelivery" text,
    "uniqueId" character varying(10),
    uuid uuid NOT NULL
);


ALTER TABLE public."Pedido" OWNER TO postgres;

--
-- Name: Pedido_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Pedido_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Pedido_id_seq" OWNER TO postgres;

--
-- Name: Pedido_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Pedido_id_seq" OWNED BY public."Pedido".id;


--
-- Name: Product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Product" (
    id integer NOT NULL,
    "dateCreate" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "dateUpdate" timestamp without time zone NOT NULL,
    name text NOT NULL,
    "order" integer NOT NULL,
    status boolean DEFAULT true NOT NULL,
    img text,
    descricao text,
    "catProdId" integer,
    "restaurantId" integer,
    price money NOT NULL,
    uuid uuid NOT NULL
);


ALTER TABLE public."Product" OWNER TO postgres;

--
-- Name: Product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Product_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Product_id_seq" OWNER TO postgres;

--
-- Name: Product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Product_id_seq" OWNED BY public."Product".id;


--
-- Name: Restaurant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Restaurant" (
    id integer NOT NULL,
    "nameUnique" text NOT NULL,
    "namePublic" text NOT NULL,
    phone text NOT NULL,
    "streetName" text NOT NULL,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL,
    "feeDelivery" money[],
    "minOrder" money DEFAULT 0.00 NOT NULL,
    "dateCreate" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "dateUpdate" timestamp without time zone NOT NULL,
    paused boolean DEFAULT false NOT NULL,
    "horarioAtendimento" text,
    "imgLogo" text NOT NULL,
    "imgBanner" text,
    scheduling boolean DEFAULT false NOT NULL,
    delivery boolean DEFAULT true NOT NULL,
    "localDelivery" boolean DEFAULT false NOT NULL,
    "typesPayment" text,
    contato text,
    "pixKey" text,
    "timeDelivery" text[],
    "timeStandardWithdraw" integer,
    uuid uuid NOT NULL
);


ALTER TABLE public."Restaurant" OWNER TO postgres;

--
-- Name: Restaurant_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Restaurant_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Restaurant_id_seq" OWNER TO postgres;

--
-- Name: Restaurant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Restaurant_id_seq" OWNED BY public."Restaurant".id;


--
-- Name: User; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."User" (
    id text NOT NULL,
    "dateCreate" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "dateUpdate" timestamp(3) without time zone NOT NULL,
    name text,
    email text NOT NULL,
    password text NOT NULL,
    token text,
    role text NOT NULL,
    status boolean DEFAULT true NOT NULL
);


ALTER TABLE public."User" OWNER TO postgres;

--
-- Name: _CatComplemToComplemento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."_CatComplemToComplemento" (
    "A" integer NOT NULL,
    "B" integer NOT NULL
);


ALTER TABLE public."_CatComplemToComplemento" OWNER TO postgres;

--
-- Name: _RestaurantToUser; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."_RestaurantToUser" (
    "A" integer NOT NULL,
    "B" text NOT NULL
);


ALTER TABLE public."_RestaurantToUser" OWNER TO postgres;

--
-- Name: CatComplem id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CatComplem" ALTER COLUMN id SET DEFAULT nextval('public."CatComplem_id_seq"'::regclass);


--
-- Name: CatProd id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CatProd" ALTER COLUMN id SET DEFAULT nextval('public."CatProd_id_seq"'::regclass);


--
-- Name: Complemento id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Complemento" ALTER COLUMN id SET DEFAULT nextval('public."Complemento_id_seq"'::regclass);


--
-- Name: Customer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Customer" ALTER COLUMN id SET DEFAULT nextval('public."Customer_id_seq"'::regclass);


--
-- Name: IndexUUID id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."IndexUUID" ALTER COLUMN id SET DEFAULT nextval('public."IndexUUID_id_seq"'::regclass);


--
-- Name: Pedido id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pedido" ALTER COLUMN id SET DEFAULT nextval('public."Pedido_id_seq"'::regclass);


--
-- Name: Product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product" ALTER COLUMN id SET DEFAULT nextval('public."Product_id_seq"'::regclass);


--
-- Name: Restaurant id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Restaurant" ALTER COLUMN id SET DEFAULT nextval('public."Restaurant_id_seq"'::regclass);


--
-- Data for Name: CatComplem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."CatComplem" (id, "order", "dateCreate", "dateUpdate", name, status, maximo, minimo, "productId", "restaurantId", uuid) FROM stdin;
64	59	2022-07-06 21:38:59.107	2023-06-20 00:30:31.849	ACOMPANHAMENTO	t	1	1	41	1	baf9db66-672a-4a2b-b8e4-7783600894d5
62	57	2022-07-06 21:38:59.107	2023-06-20 00:30:33.646	ACOMPANHAMENTO	t	1	1	40	1	b14b966e-13e0-49b8-abed-c4b92e809ce6
67	62	2022-07-06 21:38:59.107	2023-06-20 00:30:35.15	PONTO DA CARNE	t	1	1	43	1	a3d81db7-ee2a-40c2-afca-82695c3ccbfe
57	52	2022-07-06 21:38:59.107	2023-06-20 00:30:36.504	ACOMPANHAMENTO	t	1	1	37	1	7f117bfc-bafd-4628-8595-02accd32d793
65	60	2022-07-06 21:38:59.107	2023-06-20 00:30:37.858	PONTO DA CARNE	t	1	1	42	1	8dfc1890-4355-4a18-b1b6-290081e4bd13
4	0	2021-12-27 13:06:31.555	2023-06-20 00:30:39.206	PONTO DA CARNE	t	1	1	1	1	a80e4130-ee67-4632-8aeb-e50428cd0e53
50	45	2022-07-06 21:38:59.107	2023-06-20 00:30:40.562	PONTO DA CARNE	t	1	1	34	1	0080a435-c041-454c-a933-581c290bd2a3
53	48	2022-07-06 21:38:59.107	2023-06-20 00:30:41.911	ACOMPANHAMENTO	t	1	1	35	1	4c1c0cf0-11ca-4319-86ac-68bb08d6daf0
29	24	2021-12-29 00:08:16.821	2023-06-20 00:30:43.264	PONTO DA CARNE	t	1	1	5	1	a75e90d4-2cfb-4dc4-94c0-ef7bb56c1e2b
18	14	2021-12-29 00:02:36.983	2023-06-20 00:30:44.62	PONTO DA CARNE	t	1	1	3	1	b9174d5e-d11b-4274-83d3-ce204539c108
54	49	2022-07-06 21:38:59.107	2023-06-20 00:30:45.967	PONTO DA CARNE	t	1	1	36	1	d3b5ef81-f6de-4a8d-b714-55ede4671806
42	37	2022-07-06 21:38:59.107	2023-06-20 00:30:47.312	PONTO DA CARNE	t	1	1	26	1	55f28491-f16d-4865-b2fd-d75347eb67e2
70	65	2022-07-06 21:38:59.107	2023-06-20 00:30:48.67	ACOMPANHAMENTO	t	1	1	44	1	4b465603-51d7-4ed5-81fe-21df3ffb826b
12	9	2021-12-28 23:58:18.763	2023-06-20 00:30:50.02	PONTO DA CARNE	t	1	1	2	1	00c7b6fe-e575-4ee3-89bd-19a5249cb096
76	71	2022-07-06 21:38:59.107	2023-06-20 00:30:51.523	Selecione	t	10	1	55	1	7ebf77b0-b210-4ef2-a2f3-a08b51205a0a
71	66	2022-07-06 21:38:59.107	2023-06-20 00:30:52.873	PONTO DA CARNE	t	1	1	45	1	646c5a41-6a14-4c9c-b953-027512f5f6d7
59	54	2022-07-06 21:38:59.107	2023-06-20 00:30:54.219	PONTO DA CARNE	t	1	1	39	1	35e7cf73-b403-4e2a-90f2-7c62c1752d07
23	19	2021-12-29 00:05:30.302	2023-06-20 00:30:55.572	PONTO DA CARNE	t	1	1	4	1	36614b04-6e62-4a9e-878a-3e4ea2fb48a7
56	51	2022-07-06 21:38:59.107	2023-06-20 00:30:56.919	PONTO DA CARNE	t	1	1	38	1	6f545fdf-ffc3-4256-80f0-3c46ac819ed4
77	72	2022-07-06 21:38:59.107	2023-06-20 00:30:58.269	Selecione	t	10	1	56	1	9f12c4f6-22c9-48ae-8a23-727290eb7ab6
58	53	2022-07-06 21:38:59.107	2023-06-20 00:30:59.616	ACOMPANHAMENTO	t	1	1	38	1	0968e548-5e6d-4059-af92-b81cbea0d829
61	56	2022-07-06 21:38:59.107	2023-06-20 00:31:00.965	PONTO DA CARNE	t	1	1	40	1	b0de208b-8b5e-44c6-a131-f2e70b33a4ef
43	38	2022-07-06 21:38:59.107	2023-06-20 00:31:02.321	PONTO DA CARNE	t	1	1	27	1	cb816c1f-31c9-4c60-b066-d432bf4a0415
69	64	2022-07-06 21:38:59.107	2023-06-20 00:31:05.027	PONTO DA CARNE	t	1	1	44	1	b6934dd5-c8b1-43e1-ae7a-ff6d8cd7066a
73	68	2022-07-06 21:38:59.107	2023-06-20 00:31:06.527	REFRIGERANTE 350ML	t	1	1	45	1	4c46de79-f219-4f49-8db2-b4f24d9522b1
46	41	2022-07-06 21:38:59.107	2023-06-20 00:31:07.881	PONTO DA CARNE	t	1	1	32	1	de187af1-b8e5-43c1-8f4d-db892644c5ba
47	42	2022-07-06 21:38:59.107	2023-06-20 00:31:09.23	ACOMPANHAMENTO	t	1	1	32	1	66dec69f-c682-4a2d-9ced-d18e5881d498
75	70	2022-07-06 21:38:59.107	2023-06-20 00:31:10.581	Selecione	t	10	1	54	1	59f305ec-1db9-4f30-8217-c6589ea1b1ab
60	55	2022-07-06 21:38:59.107	2023-06-20 00:31:11.931	ACOMPANHAMENTO	t	1	1	39	1	50f18275-d2da-4857-ab52-83602eec7e67
74	69	2022-07-06 21:38:59.107	2023-06-20 00:31:13.283	Selecione	t	10	1	53	1	56a51f70-e8db-4562-b6f9-15ffd3e45a22
63	58	2022-07-06 21:38:59.107	2023-06-20 00:31:14.63	PONTO DA CARNE	t	1	1	41	1	d126fe45-c4d0-40ab-aa35-f5d11b0d7fa0
49	43	2022-07-06 21:38:59.107	2023-06-20 00:31:15.979	PONTO DA CARNE	t	1	1	33	1	90d88f95-6c2c-47b1-b923-6a5fbe17fdde
44	39	2022-07-06 21:38:59.107	2023-06-20 00:31:17.328	PONTO DA CARNE	t	1	1	29	1	81989fb3-2561-4b0d-b643-cc2f72c56bc9
68	63	2022-07-06 21:38:59.107	2023-06-20 00:31:18.676	ACOMPANHAMENTO	t	1	1	43	1	c5af1fa9-36e4-45df-b32e-65d4646f29be
55	50	2022-07-06 21:38:59.107	2023-06-20 00:31:20.027	ACOMPANHAMENTO	t	1	1	36	1	68e266c2-cef1-4cd7-87cd-8cb2bcd44b8d
52	47	2022-07-06 21:38:59.107	2023-06-20 00:31:21.38	PONTO DA CARNE	t	1	1	35	1	267e9a15-94cf-4752-ac70-bb458a2667a7
72	67	2022-07-06 21:38:59.107	2023-06-20 00:31:22.878	ACOMPANHAMENTO	t	1	1	45	1	bf83f22f-c8ac-436a-bc69-e0c71cf5b4eb
34	29	2021-12-29 00:11:06.291	2023-06-20 00:31:24.228	PONTO DA CARNE	t	1	1	6	1	ed56dac1-b596-4a7a-9eed-06c7c6865886
66	61	2022-07-06 21:38:59.107	2023-06-20 00:31:25.577	ACOMPANHAMENTO	t	1	1	42	1	78dd6cae-8167-4b79-bf33-28654a50ad32
51	46	2022-07-06 21:38:59.107	2023-06-20 00:31:26.929	ACOMPANHAMENTO	t	1	1	34	1	3bea5b96-48f5-4358-934d-a21aabbcaa65
45	40	2022-07-06 21:38:59.107	2023-06-20 00:31:28.278	PONTO DA CARNE	t	1	1	30	1	96d25c2c-0f92-4979-8b9f-051044f0d883
48	44	2022-07-06 21:38:59.107	2023-06-20 19:21:30.381	ACOMPANHAMENTO	t	1	0	33	1	34d71896-9389-427e-8179-d2cbdc8e86f7
\.


--
-- Data for Name: CatProd; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."CatProd" (id, "order", "dateCreate", "dateUpdate", name, status, "restaurantId", uuid) FROM stdin;
3	2	2021-12-29 00:12:52.069	2023-06-20 00:30:24.66	COMBOS	t	1	43517f90-6a36-4eec-8700-7f41f468360c
4	3	2021-12-29 00:12:52.069	2023-06-20 00:30:26.453	ADICIONAIS	t	1	590edd32-68b0-43a5-89a9-73dd03a59978
5	4	2021-12-29 12:28:54.165	2023-06-20 00:30:27.8	BEBIDAS	t	1	4330805a-78af-4296-8b4c-eaf87e9aeb19
1	0	2021-12-27 13:02:44.162	2023-06-20 00:30:29.149	ESPETINHOS AVULSOS	t	1	d60bbbf5-7bad-498f-81af-f8f706716d63
2	1	2021-12-29 00:12:52.069	2023-06-20 00:30:30.499	COMPLETOS	t	1	74dc8b18-4a95-4e7c-8689-18a5282de469
\.


--
-- Data for Name: Complemento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Complemento" (id, "order", "dateCreate", "dateUpdate", name, status, price, "restaurantId", uuid) FROM stdin;
45	9	2021-12-27 13:07:24.79	2023-06-20 00:31:29.631	Coca Cola Zero Açúcar 310ml	t	$5.00	1	b3887fdf-1e08-4577-bab5-becb2c44f9c9
42	6	2021-12-27 13:07:24.79	2023-06-20 00:31:31.426	Guaraná Lata	t	$5.00	1	92349c7f-8451-4d69-ba69-42081132702e
40	4	2021-12-27 13:07:24.79	2023-06-20 00:31:32.777	Fanta Lata	t	$5.00	1	570dd3ca-4419-4d38-a013-829b2d082345
44	8	2021-12-27 13:07:24.79	2023-06-20 00:31:34.13	Sprite Lata	t	$5.00	1	8f01e471-cf94-46ce-abdb-e7ba68e946f1
46	10	2021-12-27 13:07:24.79	2023-06-20 00:31:35.485	H2O Limão 500ml	t	$6.00	1	704ddaf3-1f01-48d5-917d-691670fe7d98
41	5	2021-12-27 13:07:24.79	2023-06-20 00:31:36.834	Guaraná 1Lt retornável	t	$7.00	1	2aefcd6a-5e37-45df-bafa-0ccc45ee8c7a
43	7	2021-12-27 13:07:24.79	2023-06-20 00:31:38.33	Schuweppes Citrus Lata	t	$5.00	1	eea4530e-4a68-484e-810c-b04e43a9245a
14	5	2021-12-27 13:13:59.027	2023-06-20 00:31:39.682	Brahma Duplo Malte Lata 350ml	t	$6.00	1	85d9e21b-c58c-4dce-949d-6c48c791ebae
3	1	2021-12-27 13:09:16.278	2023-06-20 00:31:41.029	SALADA DE REPOLHO	t	$0.00	1	932f17ea-7eaa-41e7-a89a-576d19e330de
19	10	2021-12-27 13:13:59.03	2023-06-20 00:31:42.377	Heineken 0% Long Neck 330ml	t	$9.00	1	f23c43c2-23ce-4c8d-8e69-c150e130259a
31	5	2021-12-27 13:17:00.49	2023-06-20 00:31:43.736	Água com Gás	t	$3.00	1	b2e5d0e1-4825-4322-bb65-c8a479cfe9f2
10	1	2021-12-27 13:13:59.025	2023-06-20 00:31:45.098	Brahma Lata 269ml	t	$5.00	1	55931b49-d2c3-449d-a923-866ac9cb8f67
7	5	2021-12-27 13:09:16.279	2023-06-20 00:31:46.445	SPRITE	t	$0.00	1	f507cc2d-39f0-4b58-a130-43957c8afa64
23	14	2021-12-27 13:13:59.032	2023-06-20 00:31:47.799	Heineken 600ml	t	$15.00	1	b3a9a16e-4109-441d-b91c-a02c49660ebe
38	2	2021-12-27 13:07:24.79	2023-06-20 00:31:49.15	Coca Cola 2Lt	t	$14.00	1	9ae2e5f7-63bd-49d4-b370-0542fca3aca4
2	1	2021-12-27 13:07:24.79	2023-06-20 00:31:50.5	BEM PASSADO	t	$0.00	1	130a75d7-2c1a-4932-b92a-97fa413eb37e
17	8	2021-12-27 13:13:59.029	2023-06-20 00:31:51.847	Corona Long Neck 330ml	t	$9.00	1	95405023-c84e-463f-b196-4fd38b9ef907
13	4	2021-12-27 13:13:59.027	2023-06-20 00:31:53.346	Skol Lata 269ml	t	$5.00	1	aacb58bf-4be6-440f-9e63-8b8b7f3576d2
18	9	2021-12-27 13:13:59.029	2023-06-20 00:31:54.702	Stella Artois Long Neck 330ml	t	$9.00	1	61b57f9c-7aba-41ce-b979-1306cef5d2a5
30	4	2021-12-27 13:17:00.49	2023-06-20 00:31:56.048	Água sem Gás	t	$3.00	1	8d2cb530-2c46-449b-839d-1be2f6953b1c
27	1	2021-12-27 13:17:00.489	2023-06-20 00:31:57.402	Suco Prats LARANJA 900ML	t	$14.00	1	9b5fbe0d-6722-4287-a978-407c81928d72
6	4	2021-12-27 13:09:16.279	2023-06-20 00:31:58.753	FANTA	t	$0.00	1	3244cc16-0d9a-4e58-b8ba-96e6520d00c8
22	13	2021-12-27 13:13:59.031	2023-06-20 00:32:00.101	Skol 600ml	t	$12.00	1	a1300435-1fff-4777-8e17-951dda5c4690
21	12	2021-12-27 13:13:59.031	2023-06-20 00:32:01.448	Brahma 600ml	t	$12.00	1	fe708604-f470-4f8d-9a65-4a6a2f5de3ff
25	7	2021-12-27 13:13:59.033	2023-06-20 00:32:02.798	Suco Prats UVA 300ML	t	$6.00	1	a6a327bd-dff7-43fa-b1d5-6444af4745aa
37	1	2021-12-27 13:07:24.79	2023-06-20 00:32:04.147	Coca Cola 1Lt retornável	t	$7.00	1	b5d41cf2-37a5-4835-b073-859bb7cf787a
12	3	2021-12-27 13:13:59.027	2023-06-20 00:32:05.506	Império Lata 269ml	t	$5.00	1	74abf7dc-12a7-4330-b625-28e910118948
16	7	2021-12-27 13:13:59.028	2023-06-20 00:32:06.857	Eisenbahn Long Neck 330ml	t	$9.00	1	4f66e17f-4adb-4f2a-a411-95aad84df605
29	3	2021-12-27 13:17:00.49	2023-06-20 00:32:08.207	Água Tônica	t	$5.00	1	e0bd02ab-78e6-43d3-9c11-153f69386558
5	3	2021-12-27 13:09:16.279	2023-06-20 00:32:09.706	COCA COLA	t	$0.00	1	5d950936-cadd-4a38-a8c2-86f5328e319a
39	3	2021-12-27 13:07:24.79	2023-06-20 00:32:11.055	Coca Cola Lata	t	$5.00	1	0a0aa7ed-663e-43d6-850e-c5cb34f790c7
9	1	2021-12-27 13:13:59.025	2023-06-20 00:32:12.402	COCA COLA ZERO AÇÚCAR	t	$0.00	1	4cfee4b1-924f-4789-ab70-137b9d08a72c
36	2	2021-12-27 13:07:24.79	2023-06-20 00:32:13.751	MAL PASSADO	t	$0.00	1	748b9ad8-b7c9-4c25-815d-667b81414cee
20	11	2021-12-27 13:13:59.03	2023-06-20 00:32:15.105	Brahma Malzebier Long Neck 330ml	t	$9.00	1	b3fcbbd8-ff16-4262-b29d-f7bdb23fd4e2
24	17	2021-12-27 13:13:59.032	2023-06-20 00:32:16.457	Suco Prats LARANJA 300ML	t	$6.00	1	ded64c48-50cf-491d-b223-acddb75c33ac
11	2	2021-12-27 13:13:59.026	2023-06-20 00:32:17.81	Itaipava Lata 269ml	t	$5.00	1	2c050945-b609-46e4-b45c-7f548863e3ce
28	2	2021-12-27 13:17:00.489	2023-06-20 00:32:19.157	Suco Prats UVA 900ML	t	$14.00	1	93c44d55-4e0d-4129-a188-cc71e6083ac7
4	2	2021-12-27 13:09:16.278	2023-06-20 00:32:20.504	VINAGRETE	t	$0.00	1	18c6f2e8-ece1-4861-a866-46ebc7c07584
1	0	2021-12-27 13:07:24.79	2023-06-20 00:32:21.851	AO PONTO	t	$0.00	1	d7e22da9-051f-4f1f-b5f2-d6b7e5a2cae2
8	6	2021-12-27 13:09:16.279	2023-06-20 00:32:23.201	GUARANÁ ANTARTICA	t	$0.00	1	d45c0521-94aa-45cc-b348-1afb3c93d16b
15	6	2021-12-27 13:13:59.028	2023-06-20 00:32:24.703	Heineken Long Neck 330ml	t	$9.00	1	1d9511f4-b04b-4b0d-95b4-96537fa815ba
\.


--
-- Data for Name: Customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Customer" (id, "dateCreate", "dateUpdate", name, phone, "streetName", complement, latitude, longitude, status, "restaurantId", uuid) FROM stdin;
726	2023-06-20 02:08:05.386	2023-06-20 20:30:51.252	sdfsdfsdf	(54) 54545-4545	R. José Pereira, 126 - Jardim Bela Vista, Campo Grande - MS, 79003-050, Brazil		-20.4742625	-54.5968915	t	1	52639485-fe06-4b85-b016-dffc34a4e6bc
717	2023-06-07 23:25:45.595	2023-06-20 00:29:21.034	lkjflksjdflkjsdkl	(46) 54654-6546			0	0	t	1	4604a636-ad09-4702-8a8c-e7f3ed2835b3
727	2023-06-20 02:43:07.494	2023-06-20 02:43:07.494	hgjhgjhgj	(65) 45645-6465			0	0	t	1	4560bca5-ce17-4b1e-b7a6-28b221671b66
728	2023-06-20 22:42:31.76	2023-06-21 00:04:24.7	Hdhdhbdbd	(55) 89585-9985			0	0	t	1	578702fd-5bed-46e4-8994-f92168c2a7a1
722	2023-06-09 12:26:58.547	2023-06-20 00:29:22.837	gffdgfdg	(65) 46565-6565	Av. Rita Vieira de Andrade, 5 - Jardim Mansur, Campo Grande - MS, 79051-770, Brasil		-20.4864598	-54.58946210000001	t	1	c8a4894c-2a84-4002-af76-ae66342afa99
720	2023-06-08 16:34:43.351	2023-06-20 00:29:24.187	gffsdgsfdg	(65) 46546-5446	R. Dolores Duran, 1347 - Jardim Campo Alto, Campo Grande - MS, 79063-330, Brazil		-20.5248371	-54.57887969999999	t	1	8cddc9f7-ac92-4fd1-91b8-982cfa5d1087
725	2023-06-11 15:16:42.593	2023-06-20 00:29:25.539	sdfsdfsdf	(54) 54545-4545	Av. Rita Vieira de Andrade, 5 - Jardim Mansur, Campo Grande - MS, 79051-770, Brazil		-20.4864598	-54.58946210000001	t	1	69113714-432e-4b2a-9fd1-cdc6b27cc8f0
718	2023-06-07 23:32:00.576	2023-06-20 00:29:26.892	gffsdgsfdg	(65) 46546-5446	R. Dolores Duran, 1347 - Jardim Campo Alto, Campo Grande - MS, 79063-330, Brazil		-20.5248371	-54.57887969999999	t	1	0d134658-d841-4c07-acd7-fbccf7ae8b5a
723	2023-06-09 12:36:56.71	2023-06-20 00:29:28.244	çfkdjgkjfdçkgjd çkjsfd 	(56) 46565-4654			0	0	t	1	cffe24c0-036f-4610-a5c4-e3ff46465b9d
724	2023-06-11 03:03:44.346	2023-06-20 00:29:29.595	sdfsdfsdf	(54) 54545-4545			0	0	t	1	0d2ad472-0de4-4564-9716-5fb8a00cee82
721	2023-06-08 19:10:16.426	2023-06-20 00:29:30.945	gffsdgsfdg	(65) 46546-5446			0	0	t	1	3355630f-6cfd-47e4-9968-ca719b3067a2
719	2023-06-08 00:16:05.222	2023-06-20 00:29:32.442	Gchgfhjv	(58) 58850-8580	Av. Rita Vieira de Andrade, 5 - Jardim Mansur, Campo Grande - MS, 79051-770, Brazil		-20.4864598	-54.58946210000001	t	1	2dd58b6f-3fac-4e70-8aff-dfa9af1fa220
\.


--
-- Data for Name: IndexUUID; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."IndexUUID" (id, uuid) FROM stdin;
151	f1a52964-7fe3-479d-9038-56918a08e770
152	4604a636-ad09-4702-8a8c-e7f3ed2835b3
153	c8a4894c-2a84-4002-af76-ae66342afa99
154	8cddc9f7-ac92-4fd1-91b8-982cfa5d1087
155	69113714-432e-4b2a-9fd1-cdc6b27cc8f0
156	0d134658-d841-4c07-acd7-fbccf7ae8b5a
157	cffe24c0-036f-4610-a5c4-e3ff46465b9d
158	0d2ad472-0de4-4564-9716-5fb8a00cee82
159	3355630f-6cfd-47e4-9968-ca719b3067a2
160	2dd58b6f-3fac-4e70-8aff-dfa9af1fa220
161	419b4601-8b55-4365-ab35-cdd0c7bb3fd8
162	eef7f898-4644-46d5-930b-60f2b210c1cc
163	eea12020-d7ef-487b-8ef8-1d206472555b
164	e4d1eadd-1c33-4eb9-96db-2299682a628b
165	ff8a3ef4-00f1-4333-9c85-53ffc6777ab8
166	9d477eb2-cc58-4eef-9243-eaf0bfdcf520
167	8cf0c4ff-f5e6-4f16-9f3d-0a0325920954
168	c0359f48-98a5-4885-8965-221c1a9aa6de
169	e34229e6-df12-4edf-84ad-e17e68444da1
170	c490579a-4828-4ed0-bba5-6b5ea23065c9
171	a82a4c83-5da2-4adf-9006-7fbfb62410a3
172	a458f28f-b698-4e73-94aa-caab641423b1
173	463753dd-a2e3-47d4-b8cb-a0b8593559f9
174	f5483ee6-fcf4-41c2-a84f-605d5120ec07
175	dd91ae3b-e24f-4057-bb60-151795028c17
176	798ac3e9-83d2-46b0-b827-642fc0324294
177	a6fd6bda-863b-416b-a0f9-811c8ab3254f
178	8d282d0b-1ddf-4f47-8e63-0f0547398d89
179	33cd787b-19f1-497a-acc0-94b31ea44bfb
180	312bd19c-5506-459a-a2b7-d58f1739bd39
181	0793da58-7dfe-4b46-9e5b-c9f3c4fa8224
182	0de543a0-f438-4ae8-b089-1b887d5be745
183	58090ee0-ce87-4245-8fed-5e4fd34d5d34
184	f9534b66-4560-4b1d-b93d-95d2b562cb0d
185	66db91b2-f757-4935-9819-811a55f90a8e
186	d5b6c1b6-5c15-405a-8b99-711bf6557222
187	157a90b9-9516-4b2f-8eb1-62f4de4f1daa
188	42b02a07-38bc-41d2-b90d-422b35a95adb
189	c95749b9-4018-42f8-bcfa-5c50c2a3b155
190	98539093-3ef6-4b54-a91c-3c60b4ec364d
191	e700dfcc-941b-4b62-b18c-1c8f7ec89b7b
192	f65e7805-b516-4abf-b751-f4827742c7ff
193	3de8d5b8-793d-4163-af36-7d028245dd44
194	9147069b-39c7-4d28-97d2-caa9b9b39a1c
195	eb15fec2-2695-4983-8f4b-9d1d3109cf2c
196	be8ed011-0dc5-4b43-90d3-f19c57af5a23
197	767133a3-019e-442a-9329-322732d7bb18
198	43517f90-6a36-4eec-8700-7f41f468360c
199	590edd32-68b0-43a5-89a9-73dd03a59978
200	4330805a-78af-4296-8b4c-eaf87e9aeb19
201	d60bbbf5-7bad-498f-81af-f8f706716d63
202	74dc8b18-4a95-4e7c-8689-18a5282de469
203	baf9db66-672a-4a2b-b8e4-7783600894d5
204	b14b966e-13e0-49b8-abed-c4b92e809ce6
205	a3d81db7-ee2a-40c2-afca-82695c3ccbfe
206	7f117bfc-bafd-4628-8595-02accd32d793
207	8dfc1890-4355-4a18-b1b6-290081e4bd13
208	a80e4130-ee67-4632-8aeb-e50428cd0e53
209	0080a435-c041-454c-a933-581c290bd2a3
210	4c1c0cf0-11ca-4319-86ac-68bb08d6daf0
211	a75e90d4-2cfb-4dc4-94c0-ef7bb56c1e2b
212	b9174d5e-d11b-4274-83d3-ce204539c108
213	d3b5ef81-f6de-4a8d-b714-55ede4671806
214	55f28491-f16d-4865-b2fd-d75347eb67e2
215	4b465603-51d7-4ed5-81fe-21df3ffb826b
216	00c7b6fe-e575-4ee3-89bd-19a5249cb096
217	7ebf77b0-b210-4ef2-a2f3-a08b51205a0a
218	646c5a41-6a14-4c9c-b953-027512f5f6d7
219	35e7cf73-b403-4e2a-90f2-7c62c1752d07
220	36614b04-6e62-4a9e-878a-3e4ea2fb48a7
221	6f545fdf-ffc3-4256-80f0-3c46ac819ed4
222	9f12c4f6-22c9-48ae-8a23-727290eb7ab6
223	0968e548-5e6d-4059-af92-b81cbea0d829
224	b0de208b-8b5e-44c6-a131-f2e70b33a4ef
225	cb816c1f-31c9-4c60-b066-d432bf4a0415
226	34d71896-9389-427e-8179-d2cbdc8e86f7
227	b6934dd5-c8b1-43e1-ae7a-ff6d8cd7066a
228	4c46de79-f219-4f49-8db2-b4f24d9522b1
229	de187af1-b8e5-43c1-8f4d-db892644c5ba
230	66dec69f-c682-4a2d-9ced-d18e5881d498
231	59f305ec-1db9-4f30-8217-c6589ea1b1ab
232	50f18275-d2da-4857-ab52-83602eec7e67
233	56a51f70-e8db-4562-b6f9-15ffd3e45a22
234	d126fe45-c4d0-40ab-aa35-f5d11b0d7fa0
235	90d88f95-6c2c-47b1-b923-6a5fbe17fdde
236	81989fb3-2561-4b0d-b643-cc2f72c56bc9
237	c5af1fa9-36e4-45df-b32e-65d4646f29be
238	68e266c2-cef1-4cd7-87cd-8cb2bcd44b8d
239	267e9a15-94cf-4752-ac70-bb458a2667a7
240	bf83f22f-c8ac-436a-bc69-e0c71cf5b4eb
241	ed56dac1-b596-4a7a-9eed-06c7c6865886
242	78dd6cae-8167-4b79-bf33-28654a50ad32
243	3bea5b96-48f5-4358-934d-a21aabbcaa65
244	96d25c2c-0f92-4979-8b9f-051044f0d883
245	b3887fdf-1e08-4577-bab5-becb2c44f9c9
246	92349c7f-8451-4d69-ba69-42081132702e
247	570dd3ca-4419-4d38-a013-829b2d082345
248	8f01e471-cf94-46ce-abdb-e7ba68e946f1
249	704ddaf3-1f01-48d5-917d-691670fe7d98
250	2aefcd6a-5e37-45df-bafa-0ccc45ee8c7a
251	eea4530e-4a68-484e-810c-b04e43a9245a
252	85d9e21b-c58c-4dce-949d-6c48c791ebae
253	932f17ea-7eaa-41e7-a89a-576d19e330de
254	f23c43c2-23ce-4c8d-8e69-c150e130259a
255	b2e5d0e1-4825-4322-bb65-c8a479cfe9f2
256	55931b49-d2c3-449d-a923-866ac9cb8f67
257	f507cc2d-39f0-4b58-a130-43957c8afa64
258	b3a9a16e-4109-441d-b91c-a02c49660ebe
259	9ae2e5f7-63bd-49d4-b370-0542fca3aca4
260	130a75d7-2c1a-4932-b92a-97fa413eb37e
261	95405023-c84e-463f-b196-4fd38b9ef907
262	aacb58bf-4be6-440f-9e63-8b8b7f3576d2
263	61b57f9c-7aba-41ce-b979-1306cef5d2a5
264	8d2cb530-2c46-449b-839d-1be2f6953b1c
265	9b5fbe0d-6722-4287-a978-407c81928d72
266	3244cc16-0d9a-4e58-b8ba-96e6520d00c8
267	a1300435-1fff-4777-8e17-951dda5c4690
268	fe708604-f470-4f8d-9a65-4a6a2f5de3ff
269	a6a327bd-dff7-43fa-b1d5-6444af4745aa
270	b5d41cf2-37a5-4835-b073-859bb7cf787a
271	74abf7dc-12a7-4330-b625-28e910118948
272	4f66e17f-4adb-4f2a-a411-95aad84df605
273	e0bd02ab-78e6-43d3-9c11-153f69386558
274	5d950936-cadd-4a38-a8c2-86f5328e319a
275	0a0aa7ed-663e-43d6-850e-c5cb34f790c7
276	4cfee4b1-924f-4789-ab70-137b9d08a72c
277	748b9ad8-b7c9-4c25-815d-667b81414cee
278	b3fcbbd8-ff16-4262-b29d-f7bdb23fd4e2
279	ded64c48-50cf-491d-b223-acddb75c33ac
280	2c050945-b609-46e4-b45c-7f548863e3ce
281	93c44d55-4e0d-4129-a188-cc71e6083ac7
282	18c6f2e8-ece1-4861-a866-46ebc7c07584
283	d7e22da9-051f-4f1f-b5f2-d6b7e5a2cae2
284	d45c0521-94aa-45cc-b348-1afb3c93d16b
285	1d9511f4-b04b-4b0d-95b4-96537fa815ba
286	7927430f-a7a4-4f62-a5ec-d7aba05b0bc3
287	afd1a90d-e242-49be-b572-7c72212a21b6
288	805d56da-6c1d-4b99-9cf8-a181084f3742
289	bd00c4db-3338-410a-88cc-5c344d00be2c
290	5da8aa2c-ba6c-4bd8-bfe4-5bc7d480dcee
291	52639485-fe06-4b85-b016-dffc34a4e6bc
292	2202db3c-e449-4266-834c-79a93a0c357f
293	4560bca5-ce17-4b1e-b7a6-28b221671b66
294	d85ca42a-5d07-43f1-94fb-0854e6ae6910
295	a6940cc8-b77f-45b6-abb8-5e07936d8411
296	fbbfc2b8-e16f-49ca-9f34-6f0057638d42
297	8eb19e00-0367-49e2-804e-76a0ceff4f65
298	3d2feea8-2b45-484c-86a9-5014298912d5
299	01277665-467b-49f2-9b34-dbc852a45d60
300	9ad6b48d-4643-453b-98dc-1165dfddf74d
301	fc4088de-43b6-4894-b273-2536e9978976
302	a1ea8e1c-bfb7-4348-b238-83721788af67
303	793ea372-cd0c-476e-b092-acd8b0fac096
304	18480df6-054d-45fe-9789-3e308eb56b48
305	846aa26f-881f-4a8b-a6d5-7915f107edae
306	578702fd-5bed-46e4-8994-f92168c2a7a1
307	49967e75-e401-4886-b948-3326d531f629
308	1dedb46a-420b-4aa6-84a9-3a36c1bf3a65
\.


--
-- Data for Name: Pedido; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Pedido" (id, "dateCreate", "customerName", phone, "typeDelivery", "streetName", latitude, longitude, complement, "valorEntrega", "typePay", troco, "observacaoGeral", amount, "sumTotal", products, status, "statusCancel", "datePedidoAndamento", "datePedidoSaiuEntrega", "datePedidoConcluido", "datePedidoCancelado", "restaurantId", "customerId", "distanceDelivery", "uniqueId", uuid) FROM stdin;
1957	2023-06-07 01:56:24.021	lkjflksjdflkjsdkl	(46) 54654-6546	Retirada no estabelecimento		0	0		$0.00	Cartão de Débito	$0.00		$14.00	$14.00	[{"id":26,"uuid":"d9d33300-e6a8-4ee5-bec3-262bd59eb290","dateCreate":"2022-07-02T21:48:43.870Z","dateUpdate":"2022-07-02T21:45:46.770Z","name":"Espetinho de Medalhão de Carne","order":6,"status":true,"img":"imagens/Espetinho de Medalhão de Carne1679156780090blob_600.jpg","descricao":"Carne com bacon","catProdId":1,"restaurantId":1,"price":"14","restaurant":{"nameUnique":"rotadoespeto"},"catComplems":[{"id":42,"uuid":"6ebe956e-acf4-4ab6-af66-69c52e43d874","order":37,"dateCreate":"2022-07-06T21:38:59.107Z","dateUpdate":"2022-07-06T21:37:52.832Z","name":"PONTO DA CARNE","status":true,"maximo":1,"minimo":1,"productId":26,"restaurantId":1,"complementos":[{"id":2,"uuid":"a4df5343-9726-4241-9cca-b2e910339c81","order":1,"dateCreate":"2021-12-27T13:07:24.790Z","dateUpdate":"2022-12-19T01:04:08.736Z","name":"BEM PASSADO","status":true,"price":"0","restaurantId":1,"quantidade":1}]}],"quantidade":1,"valorTotal":14,"obsItem":"","item":7708}]	Pendente	f	\N	\N	\N	\N	1	\N	\N	c56ca928	7927430f-a7a4-4f62-a5ec-d7aba05b0bc3
1959	2023-06-07 02:02:00.22	lkjflksjdflkjsdkl	(46) 54654-6546	Retirada no estabelecimento		0	0		$0.00	Cartão de Débito	$0.00		$14.00	$14.00	[{"id":26,"uuid":"d9d33300-e6a8-4ee5-bec3-262bd59eb290","dateCreate":"2022-07-02T21:48:43.870Z","dateUpdate":"2022-07-02T21:45:46.770Z","name":"Espetinho de Medalhão de Carne","order":6,"status":true,"img":"imagens/Espetinho de Medalhão de Carne1679156780090blob_600.jpg","descricao":"Carne com bacon","catProdId":1,"restaurantId":1,"price":"14","restaurant":{"nameUnique":"rotadoespeto"},"catComplems":[{"id":42,"uuid":"6ebe956e-acf4-4ab6-af66-69c52e43d874","order":37,"dateCreate":"2022-07-06T21:38:59.107Z","dateUpdate":"2022-07-06T21:37:52.832Z","name":"PONTO DA CARNE","status":true,"maximo":1,"minimo":1,"productId":26,"restaurantId":1,"complementos":[{"id":2,"uuid":"a4df5343-9726-4241-9cca-b2e910339c81","order":1,"dateCreate":"2021-12-27T13:07:24.790Z","dateUpdate":"2022-12-19T01:04:08.736Z","name":"BEM PASSADO","status":true,"price":"0","restaurantId":1,"quantidade":1}]}],"quantidade":1,"valorTotal":14,"obsItem":"","item":7708}]	Pendente	f	\N	\N	\N	\N	1	\N	\N	da54f628	afd1a90d-e242-49be-b572-7c72212a21b6
1956	2023-06-07 01:54:43.345	lkjflksjdflkjsdkl	(46) 54654-6546	Retirada no estabelecimento		0	0		$0.00	Cartão de Débito	$0.00		$14.00	$14.00	[{"id":26,"uuid":"d9d33300-e6a8-4ee5-bec3-262bd59eb290","dateCreate":"2022-07-02T21:48:43.870Z","dateUpdate":"2022-07-02T21:45:46.770Z","name":"Espetinho de Medalhão de Carne","order":6,"status":true,"img":"imagens/Espetinho de Medalhão de Carne1679156780090blob_600.jpg","descricao":"Carne com bacon","catProdId":1,"restaurantId":1,"price":"14","restaurant":{"nameUnique":"rotadoespeto"},"catComplems":[{"id":42,"uuid":"6ebe956e-acf4-4ab6-af66-69c52e43d874","order":37,"dateCreate":"2022-07-06T21:38:59.107Z","dateUpdate":"2022-07-06T21:37:52.832Z","name":"PONTO DA CARNE","status":true,"maximo":1,"minimo":1,"productId":26,"restaurantId":1,"complementos":[{"id":2,"uuid":"a4df5343-9726-4241-9cca-b2e910339c81","order":1,"dateCreate":"2021-12-27T13:07:24.790Z","dateUpdate":"2022-12-19T01:04:08.736Z","name":"BEM PASSADO","status":true,"price":"0","restaurantId":1,"quantidade":1}]}],"quantidade":1,"valorTotal":14,"obsItem":"","item":7708}]	Pendente	f	\N	\N	\N	\N	1	\N	\N	a740635f	805d56da-6c1d-4b99-9cf8-a181084f3742
2015	2023-06-20 02:08:07.781	sdfsdfsdf	(54) 54545-4545	Retirada no estabelecimento		0	0		$0.00	Cartão de Débito	$0.00		$14.00	$14.00	[{"id":26,"uuid":"8cf0c4ff-f5e6-4f16-9f3d-0a0325920954","dateCreate":"2022-07-02T21:48:43.870Z","dateUpdate":"2023-06-20T00:29:42.351Z","name":"Espetinho de Medalhão de Carne","order":6,"status":true,"img":"imagens/Espetinho de Medalhão de Carne1679156780090blob_600.jpg","descricao":"Carne com bacon","catProdId":1,"restaurantId":1,"price":"14","restaurant":{"nameUnique":"rotadoespeto"},"catComplems":[{"id":42,"uuid":"55f28491-f16d-4865-b2fd-d75347eb67e2","order":37,"dateCreate":"2022-07-06T21:38:59.107Z","dateUpdate":"2023-06-20T00:30:47.312Z","name":"PONTO DA CARNE","status":true,"maximo":1,"minimo":1,"productId":26,"restaurantId":1,"complementos":[{"id":2,"uuid":"130a75d7-2c1a-4932-b92a-97fa413eb37e","order":1,"dateCreate":"2021-12-27T13:07:24.790Z","dateUpdate":"2023-06-20T00:31:50.500Z","name":"BEM PASSADO","status":true,"price":"0","restaurantId":1,"quantidade":1}]}],"quantidade":1,"valorTotal":14,"obsItem":"","item":5784}]	Pendente	f	\N	\N	\N	\N	1	726		a4173f08	2202db3c-e449-4266-834c-79a93a0c357f
2016	2023-06-20 02:43:07.589	hgjhgjhgj	(65) 45645-6465	Retirada no estabelecimento		0	0		$0.00	Cartão de Crédito	$0.00		$14.00	$14.00	[{"id":26,"uuid":"8cf0c4ff-f5e6-4f16-9f3d-0a0325920954","dateCreate":"2022-07-02T21:48:43.870Z","dateUpdate":"2023-06-20T00:29:42.351Z","name":"Espetinho de Medalhão de Carne","order":6,"status":true,"img":"imagens/Espetinho de Medalhão de Carne1679156780090blob_600.jpg","descricao":"Carne com bacon","catProdId":1,"restaurantId":1,"price":"14","restaurant":{"nameUnique":"rotadoespeto"},"catComplems":[{"id":42,"uuid":"55f28491-f16d-4865-b2fd-d75347eb67e2","order":37,"dateCreate":"2022-07-06T21:38:59.107Z","dateUpdate":"2023-06-20T00:30:47.312Z","name":"PONTO DA CARNE","status":true,"maximo":1,"minimo":1,"productId":26,"restaurantId":1,"complementos":[{"id":2,"uuid":"130a75d7-2c1a-4932-b92a-97fa413eb37e","order":1,"dateCreate":"2021-12-27T13:07:24.790Z","dateUpdate":"2023-06-20T00:31:50.500Z","name":"BEM PASSADO","status":true,"price":"0","restaurantId":1,"quantidade":1}]}],"quantidade":1,"valorTotal":14,"obsItem":"","item":397}]	Pendente	f	\N	\N	\N	\N	1	727		3e0d03fa	d85ca42a-5d07-43f1-94fb-0854e6ae6910
2017	2023-06-20 13:31:29.197	sdfsdfsdf	(54) 54545-4545	Retirada no estabelecimento		0	0		$0.00	Cartão de Crédito	$0.00		$28.00	$28.00	[{"id":26,"uuid":"8cf0c4ff-f5e6-4f16-9f3d-0a0325920954","dateCreate":"2022-07-02T21:48:43.870Z","dateUpdate":"2023-06-20T00:29:42.351Z","name":"Espetinho de Medalhão de Carne","order":6,"status":true,"img":"imagens/Espetinho de Medalhão de Carne1679156780090blob_600.jpg","descricao":"Carne com bacon","catProdId":1,"restaurantId":1,"price":"14","restaurant":{"nameUnique":"rotadoespeto"},"catComplems":[{"id":42,"uuid":"55f28491-f16d-4865-b2fd-d75347eb67e2","order":37,"dateCreate":"2022-07-06T21:38:59.107Z","dateUpdate":"2023-06-20T00:30:47.312Z","name":"PONTO DA CARNE","status":true,"maximo":1,"minimo":1,"productId":26,"restaurantId":1,"complementos":[{"id":2,"uuid":"130a75d7-2c1a-4932-b92a-97fa413eb37e","order":1,"dateCreate":"2021-12-27T13:07:24.790Z","dateUpdate":"2023-06-20T00:31:50.500Z","name":"BEM PASSADO","status":true,"price":"0","restaurantId":1,"quantidade":1}]}],"quantidade":2,"valorTotal":28,"item":4052}]	Pendente	f	\N	\N	\N	\N	1	726		511c5750	a6940cc8-b77f-45b6-abb8-5e07936d8411
2018	2023-06-20 13:43:24.928	sdfsdfsdf	(54) 54545-4545	Retirada no estabelecimento		0	0		$0.00	Cartão de Débito	$0.00		$23.00	$23.00	[{"id":28,"uuid":"c490579a-4828-4ed0-bba5-6b5ea23065c9","dateCreate":"2022-07-02T21:48:43.870Z","dateUpdate":"2023-06-20T00:29:46.412Z","name":"Espetinho de Queijo Coalho","order":6,"status":true,"img":"imagens/Espetinho de Queijo Coalho1679157186060blob_600.jpg","descricao":"","catProdId":1,"restaurantId":1,"price":"9","restaurant":{"nameUnique":"rotadoespeto"},"catComplems":[],"quantidade":1,"valorTotal":9,"obsItem":"","item":9898},{"id":26,"uuid":"8cf0c4ff-f5e6-4f16-9f3d-0a0325920954","dateCreate":"2022-07-02T21:48:43.870Z","dateUpdate":"2023-06-20T00:29:42.351Z","name":"Espetinho de Medalhão de Carne","order":6,"status":true,"img":"imagens/Espetinho de Medalhão de Carne1679156780090blob_600.jpg","descricao":"Carne com bacon","catProdId":1,"restaurantId":1,"price":"14","restaurant":{"nameUnique":"rotadoespeto"},"catComplems":[{"id":42,"uuid":"55f28491-f16d-4865-b2fd-d75347eb67e2","order":37,"dateCreate":"2022-07-06T21:38:59.107Z","dateUpdate":"2023-06-20T00:30:47.312Z","name":"PONTO DA CARNE","status":true,"maximo":1,"minimo":1,"productId":26,"restaurantId":1,"complementos":[{"id":2,"uuid":"130a75d7-2c1a-4932-b92a-97fa413eb37e","order":1,"dateCreate":"2021-12-27T13:07:24.790Z","dateUpdate":"2023-06-20T00:31:50.500Z","name":"BEM PASSADO","status":true,"price":"0","restaurantId":1,"quantidade":1}]}],"quantidade":1,"valorTotal":14,"obsItem":"","item":3121}]	Pendente	f	\N	\N	\N	\N	1	726		ee7c0c4b	fbbfc2b8-e16f-49ca-9f34-6f0057638d42
2019	2023-06-20 13:45:03.202	sdfsdfsdf	(54) 54545-4545	Retirada no estabelecimento		0	0		$0.00	Cartão de Débito	$0.00		$29.00	$29.00	[{"id":30,"uuid":"798ac3e9-83d2-46b0-b827-642fc0324294","dateCreate":"2022-07-02T21:48:43.870Z","dateUpdate":"2023-06-20T00:29:54.655Z","name":"Espetinho de Picanha","order":6,"status":true,"img":"imagens/semfoto.jpg","descricao":"Peso aproximado 300g in natura","catProdId":1,"restaurantId":1,"price":"29","restaurant":{"nameUnique":"rotadoespeto"},"catComplems":[{"id":45,"uuid":"96d25c2c-0f92-4979-8b9f-051044f0d883","order":40,"dateCreate":"2022-07-06T21:38:59.107Z","dateUpdate":"2023-06-20T00:31:28.278Z","name":"PONTO DA CARNE","status":true,"maximo":1,"minimo":1,"productId":30,"restaurantId":1,"complementos":[{"id":2,"uuid":"130a75d7-2c1a-4932-b92a-97fa413eb37e","order":1,"dateCreate":"2021-12-27T13:07:24.790Z","dateUpdate":"2023-06-20T00:31:50.500Z","name":"BEM PASSADO","status":true,"price":"0","restaurantId":1,"quantidade":1}]}],"quantidade":1,"valorTotal":29,"obsItem":"","item":9515}]	Pendente	f	\N	\N	\N	\N	1	726		b02c8d1e	8eb19e00-0367-49e2-804e-76a0ceff4f65
2021	2023-06-20 13:47:11.307	sdfsdfsdf	(54) 54545-4545	Retirada no estabelecimento		0	0		$0.00	Cartão de Crédito	$0.00		$29.00	$29.00	[{"id":30,"uuid":"798ac3e9-83d2-46b0-b827-642fc0324294","dateCreate":"2022-07-02T21:48:43.870Z","dateUpdate":"2023-06-20T00:29:54.655Z","name":"Espetinho de Picanha","order":6,"status":true,"img":"imagens/semfoto.jpg","descricao":"Peso aproximado 300g in natura","catProdId":1,"restaurantId":1,"price":"29","restaurant":{"nameUnique":"rotadoespeto"},"catComplems":[{"id":45,"uuid":"96d25c2c-0f92-4979-8b9f-051044f0d883","order":40,"dateCreate":"2022-07-06T21:38:59.107Z","dateUpdate":"2023-06-20T00:31:28.278Z","name":"PONTO DA CARNE","status":true,"maximo":1,"minimo":1,"productId":30,"restaurantId":1,"complementos":[{"id":2,"uuid":"130a75d7-2c1a-4932-b92a-97fa413eb37e","order":1,"dateCreate":"2021-12-27T13:07:24.790Z","dateUpdate":"2023-06-20T00:31:50.500Z","name":"BEM PASSADO","status":true,"price":"0","restaurantId":1,"quantidade":1}]}],"quantidade":1,"valorTotal":29,"obsItem":"","item":9635}]	Pendente	f	\N	\N	\N	\N	1	726		622fbc1e	01277665-467b-49f2-9b34-dbc852a45d60
2023	2023-06-20 13:49:42.334	sdfsdfsdf	(54) 54545-4545	Retirada no estabelecimento		0	0		$0.00	Cartão de Crédito	$0.00		$36.00	$36.00	[{"id":28,"uuid":"c490579a-4828-4ed0-bba5-6b5ea23065c9","dateCreate":"2022-07-02T21:48:43.870Z","dateUpdate":"2023-06-20T00:29:46.412Z","name":"Espetinho de Queijo Coalho","order":6,"status":true,"img":"imagens/Espetinho de Queijo Coalho1679157186060blob_600.jpg","descricao":"","catProdId":1,"restaurantId":1,"price":"9","restaurant":{"nameUnique":"rotadoespeto"},"catComplems":[],"quantidade":4,"valorTotal":36,"obsItem":"","item":9362}]	Pendente	f	\N	\N	\N	\N	1	726		95345a63	fc4088de-43b6-4894-b273-2536e9978976
2020	2023-06-20 13:46:19.104	sdfsdfsdf	(54) 54545-4545	Retirada no estabelecimento		0	0		$0.00	Cartão de Débito	$0.00		$29.00	$29.00	[{"id":30,"uuid":"798ac3e9-83d2-46b0-b827-642fc0324294","dateCreate":"2022-07-02T21:48:43.870Z","dateUpdate":"2023-06-20T00:29:54.655Z","name":"Espetinho de Picanha","order":6,"status":true,"img":"imagens/semfoto.jpg","descricao":"Peso aproximado 300g in natura","catProdId":1,"restaurantId":1,"price":"29","restaurant":{"nameUnique":"rotadoespeto"},"catComplems":[{"id":45,"uuid":"96d25c2c-0f92-4979-8b9f-051044f0d883","order":40,"dateCreate":"2022-07-06T21:38:59.107Z","dateUpdate":"2023-06-20T00:31:28.278Z","name":"PONTO DA CARNE","status":true,"maximo":1,"minimo":1,"productId":30,"restaurantId":1,"complementos":[{"id":2,"uuid":"130a75d7-2c1a-4932-b92a-97fa413eb37e","order":1,"dateCreate":"2021-12-27T13:07:24.790Z","dateUpdate":"2023-06-20T00:31:50.500Z","name":"BEM PASSADO","status":true,"price":"0","restaurantId":1,"quantidade":1}]}],"quantidade":1,"valorTotal":29,"obsItem":"","item":5695}]	Pendente	f	\N	\N	\N	\N	1	726		4838d3b3	3d2feea8-2b45-484c-86a9-5014298912d5
2022	2023-06-20 13:48:54.247	sdfsdfsdf	(54) 54545-4545	Retirada no estabelecimento		0	0		$0.00	Cartão de Débito	$0.00		$29.00	$29.00	[{"id":30,"uuid":"798ac3e9-83d2-46b0-b827-642fc0324294","dateCreate":"2022-07-02T21:48:43.870Z","dateUpdate":"2023-06-20T00:29:54.655Z","name":"Espetinho de Picanha","order":6,"status":true,"img":"imagens/semfoto.jpg","descricao":"Peso aproximado 300g in natura","catProdId":1,"restaurantId":1,"price":"29","restaurant":{"nameUnique":"rotadoespeto"},"catComplems":[{"id":45,"uuid":"96d25c2c-0f92-4979-8b9f-051044f0d883","order":40,"dateCreate":"2022-07-06T21:38:59.107Z","dateUpdate":"2023-06-20T00:31:28.278Z","name":"PONTO DA CARNE","status":true,"maximo":1,"minimo":1,"productId":30,"restaurantId":1,"complementos":[{"id":2,"uuid":"130a75d7-2c1a-4932-b92a-97fa413eb37e","order":1,"dateCreate":"2021-12-27T13:07:24.790Z","dateUpdate":"2023-06-20T00:31:50.500Z","name":"BEM PASSADO","status":true,"price":"0","restaurantId":1,"quantidade":1}]}],"quantidade":1,"valorTotal":29,"obsItem":"","item":4144}]	Pendente	f	\N	\N	\N	\N	1	726		5e0477be	9ad6b48d-4643-453b-98dc-1165dfddf74d
2024	2023-06-20 15:19:41.587	sdfsdfsdf	(54) 54545-4545	Retirada no estabelecimento		0	0		$0.00	Cartão de Débito	$0.00		$14.00	$14.00	[{"id":26,"uuid":"8cf0c4ff-f5e6-4f16-9f3d-0a0325920954","dateCreate":"2022-07-02T21:48:43.870Z","dateUpdate":"2023-06-20T00:29:42.351Z","name":"Espetinho de Medalhão de Carne","order":6,"status":true,"img":"imagens/Espetinho de Medalhão de Carne1679156780090blob_600.jpg","descricao":"Carne com bacon","catProdId":1,"restaurantId":1,"price":"14","restaurant":{"nameUnique":"rotadoespeto"},"catComplems":[{"id":42,"uuid":"55f28491-f16d-4865-b2fd-d75347eb67e2","order":37,"dateCreate":"2022-07-06T21:38:59.107Z","dateUpdate":"2023-06-20T00:30:47.312Z","name":"PONTO DA CARNE","status":true,"maximo":1,"minimo":1,"productId":26,"restaurantId":1,"complementos":[{"id":2,"uuid":"130a75d7-2c1a-4932-b92a-97fa413eb37e","order":1,"dateCreate":"2021-12-27T13:07:24.790Z","dateUpdate":"2023-06-20T00:31:50.500Z","name":"BEM PASSADO","status":true,"price":"0","restaurantId":1,"quantidade":1}]}],"quantidade":1,"valorTotal":14,"obsItem":"","item":2101}]	Pendente	f	\N	\N	\N	\N	1	726		a2b6eadc	a1ea8e1c-bfb7-4348-b238-83721788af67
2025	2023-06-20 19:36:45.804	sdfsdfsdf	(54) 54545-4545	Retirada no estabelecimento		0	0		$0.00	Cartão de Débito	$0.00		$99.00	$99.00	[{"id":33,"uuid":"f5483ee6-fcf4-41c2-a84f-605d5120ec07","dateCreate":"2022-07-02T21:48:43.870Z","dateUpdate":"2023-06-20T00:29:51.957Z","name":"Completo de Carne Magra","order":2,"status":true,"img":"imagens/Completo de Carne Magra1679157363048blob_600.jpg","descricao":"Acompanha arroz, salada de repolho ou vinagrete, farofa, mandioca, creme de alho","catProdId":2,"restaurantId":1,"price":"20","restaurant":{"nameUnique":"rotadoespeto"},"catComplems":[{"id":49,"uuid":"90d88f95-6c2c-47b1-b923-6a5fbe17fdde","order":43,"dateCreate":"2022-07-06T21:38:59.107Z","dateUpdate":"2023-06-20T00:31:15.979Z","name":"PONTO DA CARNE","status":true,"maximo":1,"minimo":1,"productId":33,"restaurantId":1,"complementos":[{"id":1,"uuid":"d7e22da9-051f-4f1f-b5f2-d6b7e5a2cae2","order":0,"dateCreate":"2021-12-27T13:07:24.790Z","dateUpdate":"2023-06-20T00:32:21.851Z","name":"AO PONTO","status":true,"price":"0","restaurantId":1,"quantidade":0},{"id":2,"uuid":"130a75d7-2c1a-4932-b92a-97fa413eb37e","order":1,"dateCreate":"2021-12-27T13:07:24.790Z","dateUpdate":"2023-06-20T00:31:50.500Z","name":"BEM PASSADO","status":true,"price":"0","restaurantId":1,"quantidade":0},{"id":36,"uuid":"748b9ad8-b7c9-4c25-815d-667b81414cee","order":2,"dateCreate":"2021-12-27T13:07:24.790Z","dateUpdate":"2023-06-20T00:32:13.751Z","name":"MAL PASSADO","status":true,"price":"0","restaurantId":1,"quantidade":1}]},{"id":48,"uuid":"34d71896-9389-427e-8179-d2cbdc8e86f7","order":44,"dateCreate":"2022-07-06T21:38:59.107Z","dateUpdate":"2023-06-20T19:21:30.381Z","name":"ACOMPANHAMENTO","status":true,"maximo":1,"minimo":0,"productId":33,"restaurantId":1,"complementos":[{"id":3,"uuid":"932f17ea-7eaa-41e7-a89a-576d19e330de","order":1,"dateCreate":"2021-12-27T13:09:16.278Z","dateUpdate":"2023-06-20T00:31:41.029Z","name":"SALADA DE REPOLHO","status":true,"price":"0","restaurantId":1,"quantidade":0},{"id":4,"uuid":"18c6f2e8-ece1-4861-a866-46ebc7c07584","order":2,"dateCreate":"2021-12-27T13:09:16.278Z","dateUpdate":"2023-06-20T00:32:20.504Z","name":"VINAGRETE","status":true,"price":"0","restaurantId":1,"quantidade":0}]}],"quantidade":1,"valorTotal":20,"obsItem":"","item":285480540516},{"id":26,"uuid":"8cf0c4ff-f5e6-4f16-9f3d-0a0325920954","dateCreate":"2022-07-02T21:48:43.870Z","dateUpdate":"2023-06-20T00:29:42.351Z","name":"Espetinho de Medalhão de Carne","order":6,"status":true,"img":"imagens/Espetinho de Medalhão de Carne1679156780090blob_600.jpg","descricao":"Carne com bacon","catProdId":1,"restaurantId":1,"price":"14","restaurant":{"nameUnique":"rotadoespeto"},"catComplems":[{"id":42,"uuid":"55f28491-f16d-4865-b2fd-d75347eb67e2","order":37,"dateCreate":"2022-07-06T21:38:59.107Z","dateUpdate":"2023-06-20T00:30:47.312Z","name":"PONTO DA CARNE","status":true,"maximo":1,"minimo":1,"productId":26,"restaurantId":1,"complementos":[{"id":1,"uuid":"d7e22da9-051f-4f1f-b5f2-d6b7e5a2cae2","order":0,"dateCreate":"2021-12-27T13:07:24.790Z","dateUpdate":"2023-06-20T00:32:21.851Z","name":"AO PONTO","status":true,"price":"0","restaurantId":1,"quantidade":0},{"id":2,"uuid":"130a75d7-2c1a-4932-b92a-97fa413eb37e","order":1,"dateCreate":"2021-12-27T13:07:24.790Z","dateUpdate":"2023-06-20T00:31:50.500Z","name":"BEM PASSADO","status":true,"price":"0","restaurantId":1,"quantidade":1},{"id":36,"uuid":"748b9ad8-b7c9-4c25-815d-667b81414cee","order":2,"dateCreate":"2021-12-27T13:07:24.790Z","dateUpdate":"2023-06-20T00:32:13.751Z","name":"MAL PASSADO","status":true,"price":"0","restaurantId":1,"quantidade":0}]}],"quantidade":1,"valorTotal":14,"obsItem":"","item":518940189860},{"id":39,"uuid":"a82a4c83-5da2-4adf-9006-7fbfb62410a3","dateCreate":"2022-07-02T21:48:43.870Z","dateUpdate":"2023-06-20T00:29:47.912Z","name":"Completo de Medalhão de Carne\\n","order":8,"status":true,"img":"imagens/Completo de Medalhão de Carne1679157895378blob_600.jpg","descricao":"Acompanha arroz, salada de repolho ou vinagrete, farofa, mandioca, creme de alho","catProdId":2,"restaurantId":1,"price":"25","restaurant":{"nameUnique":"rotadoespeto"},"catComplems":[{"id":59,"uuid":"35e7cf73-b403-4e2a-90f2-7c62c1752d07","order":54,"dateCreate":"2022-07-06T21:38:59.107Z","dateUpdate":"2023-06-20T00:30:54.219Z","name":"PONTO DA CARNE","status":true,"maximo":1,"minimo":1,"productId":39,"restaurantId":1,"complementos":[{"id":1,"uuid":"d7e22da9-051f-4f1f-b5f2-d6b7e5a2cae2","order":0,"dateCreate":"2021-12-27T13:07:24.790Z","dateUpdate":"2023-06-20T00:32:21.851Z","name":"AO PONTO","status":true,"price":"0","restaurantId":1,"quantidade":0},{"id":2,"uuid":"130a75d7-2c1a-4932-b92a-97fa413eb37e","order":1,"dateCreate":"2021-12-27T13:07:24.790Z","dateUpdate":"2023-06-20T00:31:50.500Z","name":"BEM PASSADO","status":true,"price":"0","restaurantId":1,"quantidade":0},{"id":36,"uuid":"748b9ad8-b7c9-4c25-815d-667b81414cee","order":2,"dateCreate":"2021-12-27T13:07:24.790Z","dateUpdate":"2023-06-20T00:32:13.751Z","name":"MAL PASSADO","status":true,"price":"0","restaurantId":1,"quantidade":1}]},{"id":60,"uuid":"50f18275-d2da-4857-ab52-83602eec7e67","order":55,"dateCreate":"2022-07-06T21:38:59.107Z","dateUpdate":"2023-06-20T00:31:11.931Z","name":"ACOMPANHAMENTO","status":true,"maximo":1,"minimo":1,"productId":39,"restaurantId":1,"complementos":[{"id":3,"uuid":"932f17ea-7eaa-41e7-a89a-576d19e330de","order":1,"dateCreate":"2021-12-27T13:09:16.278Z","dateUpdate":"2023-06-20T00:31:41.029Z","name":"SALADA DE REPOLHO","status":true,"price":"0","restaurantId":1,"quantidade":1},{"id":4,"uuid":"18c6f2e8-ece1-4861-a866-46ebc7c07584","order":2,"dateCreate":"2021-12-27T13:09:16.278Z","dateUpdate":"2023-06-20T00:32:20.504Z","name":"VINAGRETE","status":true,"price":"0","restaurantId":1,"quantidade":0}]}],"quantidade":1,"valorTotal":25,"obsItem":"","item":400494502474},{"id":33,"uuid":"f5483ee6-fcf4-41c2-a84f-605d5120ec07","dateCreate":"2022-07-02T21:48:43.870Z","dateUpdate":"2023-06-20T00:29:51.957Z","name":"Completo de Carne Magra","order":2,"status":true,"img":"imagens/Completo de Carne Magra1679157363048blob_600.jpg","descricao":"Acompanha arroz, salada de repolho ou vinagrete, farofa, mandioca, creme de alho","catProdId":2,"restaurantId":1,"price":"20","restaurant":{"nameUnique":"rotadoespeto"},"catComplems":[{"id":49,"uuid":"90d88f95-6c2c-47b1-b923-6a5fbe17fdde","order":43,"dateCreate":"2022-07-06T21:38:59.107Z","dateUpdate":"2023-06-20T00:31:15.979Z","name":"PONTO DA CARNE","status":true,"maximo":1,"minimo":1,"productId":33,"restaurantId":1,"complementos":[{"id":1,"uuid":"d7e22da9-051f-4f1f-b5f2-d6b7e5a2cae2","order":0,"dateCreate":"2021-12-27T13:07:24.790Z","dateUpdate":"2023-06-20T00:32:21.851Z","name":"AO PONTO","status":true,"price":"0","restaurantId":1,"quantidade":0},{"id":2,"uuid":"130a75d7-2c1a-4932-b92a-97fa413eb37e","order":1,"dateCreate":"2021-12-27T13:07:24.790Z","dateUpdate":"2023-06-20T00:31:50.500Z","name":"BEM PASSADO","status":true,"price":"0","restaurantId":1,"quantidade":0},{"id":36,"uuid":"748b9ad8-b7c9-4c25-815d-667b81414cee","order":2,"dateCreate":"2021-12-27T13:07:24.790Z","dateUpdate":"2023-06-20T00:32:13.751Z","name":"MAL PASSADO","status":true,"price":"0","restaurantId":1,"quantidade":1}]},{"id":48,"uuid":"34d71896-9389-427e-8179-d2cbdc8e86f7","order":44,"dateCreate":"2022-07-06T21:38:59.107Z","dateUpdate":"2023-06-20T19:21:30.381Z","name":"ACOMPANHAMENTO","status":true,"maximo":1,"minimo":0,"productId":33,"restaurantId":1,"complementos":[{"id":3,"uuid":"932f17ea-7eaa-41e7-a89a-576d19e330de","order":1,"dateCreate":"2021-12-27T13:09:16.278Z","dateUpdate":"2023-06-20T00:31:41.029Z","name":"SALADA DE REPOLHO","status":true,"price":"0","restaurantId":1,"quantidade":0},{"id":4,"uuid":"18c6f2e8-ece1-4861-a866-46ebc7c07584","order":2,"dateCreate":"2021-12-27T13:09:16.278Z","dateUpdate":"2023-06-20T00:32:20.504Z","name":"VINAGRETE","status":true,"price":"0","restaurantId":1,"quantidade":1}]}],"quantidade":1,"valorTotal":20,"obsItem":"","item":149708870665},{"id":33,"uuid":"f5483ee6-fcf4-41c2-a84f-605d5120ec07","dateCreate":"2022-07-02T21:48:43.870Z","dateUpdate":"2023-06-20T00:29:51.957Z","name":"Completo de Carne Magra","order":2,"status":true,"img":"imagens/Completo de Carne Magra1679157363048blob_600.jpg","descricao":"Acompanha arroz, salada de repolho ou vinagrete, farofa, mandioca, creme de alho","catProdId":2,"restaurantId":1,"price":"20","restaurant":{"nameUnique":"rotadoespeto"},"catComplems":[{"id":49,"uuid":"90d88f95-6c2c-47b1-b923-6a5fbe17fdde","order":43,"dateCreate":"2022-07-06T21:38:59.107Z","dateUpdate":"2023-06-20T00:31:15.979Z","name":"PONTO DA CARNE","status":true,"maximo":1,"minimo":1,"productId":33,"restaurantId":1,"complementos":[{"id":1,"uuid":"d7e22da9-051f-4f1f-b5f2-d6b7e5a2cae2","order":0,"dateCreate":"2021-12-27T13:07:24.790Z","dateUpdate":"2023-06-20T00:32:21.851Z","name":"AO PONTO","status":true,"price":"0","restaurantId":1,"quantidade":0},{"id":2,"uuid":"130a75d7-2c1a-4932-b92a-97fa413eb37e","order":1,"dateCreate":"2021-12-27T13:07:24.790Z","dateUpdate":"2023-06-20T00:31:50.500Z","name":"BEM PASSADO","status":true,"price":"0","restaurantId":1,"quantidade":0},{"id":36,"uuid":"748b9ad8-b7c9-4c25-815d-667b81414cee","order":2,"dateCreate":"2021-12-27T13:07:24.790Z","dateUpdate":"2023-06-20T00:32:13.751Z","name":"MAL PASSADO","status":true,"price":"0","restaurantId":1,"quantidade":1}]},{"id":48,"uuid":"34d71896-9389-427e-8179-d2cbdc8e86f7","order":44,"dateCreate":"2022-07-06T21:38:59.107Z","dateUpdate":"2023-06-20T19:21:30.381Z","name":"ACOMPANHAMENTO","status":true,"maximo":1,"minimo":0,"productId":33,"restaurantId":1,"complementos":[{"id":3,"uuid":"932f17ea-7eaa-41e7-a89a-576d19e330de","order":1,"dateCreate":"2021-12-27T13:09:16.278Z","dateUpdate":"2023-06-20T00:31:41.029Z","name":"SALADA DE REPOLHO","status":true,"price":"0","restaurantId":1,"quantidade":0},{"id":4,"uuid":"18c6f2e8-ece1-4861-a866-46ebc7c07584","order":2,"dateCreate":"2021-12-27T13:09:16.278Z","dateUpdate":"2023-06-20T00:32:20.504Z","name":"VINAGRETE","status":true,"price":"0","restaurantId":1,"quantidade":0}]}],"quantidade":1,"valorTotal":20,"obsItem":"","item":867189293871}]	Pendente	f	\N	\N	\N	\N	1	726		0e64bc9a	793ea372-cd0c-476e-b092-acd8b0fac096
2026	2023-06-20 20:13:02.665	sdfsdfsdf	(54) 54545-4545	Entrega	R. José Pereira, 126 - Jardim Bela Vista, Campo Grande - MS, 79003-050, Brazil	-20.4742625	-54.5968915		$15.00	Cartão de Débito	$0.00	fdgdfgfdgfdgfd dfg fdg fd g	$14.00	$29.00	[{"id":26,"uuid":"8cf0c4ff-f5e6-4f16-9f3d-0a0325920954","dateCreate":"2022-07-02T21:48:43.870Z","dateUpdate":"2023-06-20T00:29:42.351Z","name":"Espetinho de Medalhão de Carne","order":6,"status":true,"img":"imagens/Espetinho de Medalhão de Carne1679156780090blob_600.jpg","descricao":"Carne com bacon","catProdId":1,"restaurantId":1,"price":"14","restaurant":{"nameUnique":"rotadoespeto"},"catComplems":[{"id":42,"uuid":"55f28491-f16d-4865-b2fd-d75347eb67e2","order":37,"dateCreate":"2022-07-06T21:38:59.107Z","dateUpdate":"2023-06-20T00:30:47.312Z","name":"PONTO DA CARNE","status":true,"maximo":1,"minimo":1,"productId":26,"restaurantId":1,"complementos":[{"id":1,"uuid":"d7e22da9-051f-4f1f-b5f2-d6b7e5a2cae2","order":0,"dateCreate":"2021-12-27T13:07:24.790Z","dateUpdate":"2023-06-20T00:32:21.851Z","name":"AO PONTO","status":true,"price":"0","restaurantId":1,"quantidade":0},{"id":2,"uuid":"130a75d7-2c1a-4932-b92a-97fa413eb37e","order":1,"dateCreate":"2021-12-27T13:07:24.790Z","dateUpdate":"2023-06-20T00:31:50.500Z","name":"BEM PASSADO","status":true,"price":"0","restaurantId":1,"quantidade":1},{"id":36,"uuid":"748b9ad8-b7c9-4c25-815d-667b81414cee","order":2,"dateCreate":"2021-12-27T13:07:24.790Z","dateUpdate":"2023-06-20T00:32:13.751Z","name":"MAL PASSADO","status":true,"price":"0","restaurantId":1,"quantidade":0}]}],"quantidade":1,"valorTotal":14,"obsItem":"","item":135376029152}]	Pendente	f	\N	\N	\N	\N	1	726	3.79	a204c6bd	18480df6-054d-45fe-9789-3e308eb56b48
2027	2023-06-20 20:30:54.615	sdfsdfsdf	(54) 54545-4545	Entrega	R. José Pereira, 126 - Jardim Bela Vista, Campo Grande - MS, 79003-050, Brazil	-20.4742625	-54.5968915		$15.00	Cartão de Crédito	$0.00	sfdsfsd	$18.00	$33.00	[{"id":2,"uuid":"eea12020-d7ef-487b-8ef8-1d206472555b","dateCreate":"2021-12-28T23:51:16.707Z","dateUpdate":"2023-06-20T00:29:36.950Z","name":"Espetinho de Carne Magra","order":1,"status":true,"img":"imagens/Espetinho de Carne Magra1679152353070blob_600.jpg","descricao":"Sem gordura","catProdId":1,"restaurantId":1,"price":"9","restaurant":{"nameUnique":"rotadoespeto"},"catComplems":[{"id":12,"uuid":"00c7b6fe-e575-4ee3-89bd-19a5249cb096","order":9,"dateCreate":"2021-12-28T23:58:18.763Z","dateUpdate":"2023-06-20T00:30:50.020Z","name":"PONTO DA CARNE","status":true,"maximo":1,"minimo":1,"productId":2,"restaurantId":1,"complementos":[{"id":1,"uuid":"d7e22da9-051f-4f1f-b5f2-d6b7e5a2cae2","order":0,"dateCreate":"2021-12-27T13:07:24.790Z","dateUpdate":"2023-06-20T00:32:21.851Z","name":"AO PONTO","status":true,"price":"0","restaurantId":1,"quantidade":1},{"id":2,"uuid":"130a75d7-2c1a-4932-b92a-97fa413eb37e","order":1,"dateCreate":"2021-12-27T13:07:24.790Z","dateUpdate":"2023-06-20T00:31:50.500Z","name":"BEM PASSADO","status":true,"price":"0","restaurantId":1,"quantidade":0},{"id":36,"uuid":"748b9ad8-b7c9-4c25-815d-667b81414cee","order":2,"dateCreate":"2021-12-27T13:07:24.790Z","dateUpdate":"2023-06-20T00:32:13.751Z","name":"MAL PASSADO","status":true,"price":"0","restaurantId":1,"quantidade":0}]}],"quantidade":2,"valorTotal":18,"obsItem":"ghgfhgfhgf dfg fdgfd gdg ","item":969361504555}]	Pendente	f	\N	\N	\N	\N	1	726	3.79	c9149058	846aa26f-881f-4a8b-a6d5-7915f107edae
2028	2023-06-20 22:42:31.857	Hdhdhbdbd	(55) 89585-9985	Retirada no estabelecimento		0	0		$0.00	Dinheiro	$30.00		$28.00	$28.00	[{"id":26,"uuid":"8cf0c4ff-f5e6-4f16-9f3d-0a0325920954","dateCreate":"2022-07-02T21:48:43.870Z","dateUpdate":"2023-06-20T00:29:42.351Z","name":"Espetinho de Medalhão de Carne","order":6,"status":true,"img":"imagens/Espetinho de Medalhão de Carne1679156780090blob_600.jpg","descricao":"Carne com bacon","catProdId":1,"restaurantId":1,"price":"14","restaurant":{"nameUnique":"rotadoespeto"},"catComplems":[{"id":42,"uuid":"55f28491-f16d-4865-b2fd-d75347eb67e2","order":37,"dateCreate":"2022-07-06T21:38:59.107Z","dateUpdate":"2023-06-20T00:30:47.312Z","name":"PONTO DA CARNE","status":true,"maximo":1,"minimo":1,"productId":26,"restaurantId":1,"complementos":[{"id":1,"uuid":"d7e22da9-051f-4f1f-b5f2-d6b7e5a2cae2","order":0,"dateCreate":"2021-12-27T13:07:24.790Z","dateUpdate":"2023-06-20T00:32:21.851Z","name":"AO PONTO","status":true,"price":"0","restaurantId":1,"quantidade":1},{"id":2,"uuid":"130a75d7-2c1a-4932-b92a-97fa413eb37e","order":1,"dateCreate":"2021-12-27T13:07:24.790Z","dateUpdate":"2023-06-20T00:31:50.500Z","name":"BEM PASSADO","status":true,"price":"0","restaurantId":1,"quantidade":0},{"id":36,"uuid":"748b9ad8-b7c9-4c25-815d-667b81414cee","order":2,"dateCreate":"2021-12-27T13:07:24.790Z","dateUpdate":"2023-06-20T00:32:13.751Z","name":"MAL PASSADO","status":true,"price":"0","restaurantId":1,"quantidade":0}]}],"quantidade":2,"valorTotal":28,"obsItem":"","item":285428918775}]	Pendente	f	\N	\N	\N	\N	1	728		c48ee3bf	49967e75-e401-4886-b948-3326d531f629
2029	2023-06-21 00:04:24.8	Hdhdhbdbd	(55) 89585-9985	Retirada no estabelecimento		0	0		$0.00	Cartão de Débito	$0.00		$10.00	$10.00	[{"id":31,"uuid":"463753dd-a2e3-47d4-b8cb-a0b8593559f9","dateCreate":"2022-07-02T21:48:43.870Z","dateUpdate":"2023-06-20T00:29:50.608Z","name":"Pão de Alho","order":6,"status":true,"img":"imagens/Pão de Alho1679157158367blob_600.jpg","descricao":"","catProdId":1,"restaurantId":1,"price":"5","restaurant":{"nameUnique":"rotadoespeto"},"catComplems":[],"quantidade":2,"valorTotal":10,"obsItem":"","item":381635361425}]	Pendente	f	\N	\N	\N	\N	1	728		3f9ba5a9	1dedb46a-420b-4aa6-84a9-3a36c1bf3a65
1958	2023-06-07 01:57:03.04	lkjflksjdflkjsdkl	(46) 54654-6546	Retirada no estabelecimento		0	0		$0.00	Cartão de Débito	$0.00		$14.00	$14.00	[{"id":26,"uuid":"d9d33300-e6a8-4ee5-bec3-262bd59eb290","dateCreate":"2022-07-02T21:48:43.870Z","dateUpdate":"2022-07-02T21:45:46.770Z","name":"Espetinho de Medalhão de Carne","order":6,"status":true,"img":"imagens/Espetinho de Medalhão de Carne1679156780090blob_600.jpg","descricao":"Carne com bacon","catProdId":1,"restaurantId":1,"price":"14","restaurant":{"nameUnique":"rotadoespeto"},"catComplems":[{"id":42,"uuid":"6ebe956e-acf4-4ab6-af66-69c52e43d874","order":37,"dateCreate":"2022-07-06T21:38:59.107Z","dateUpdate":"2022-07-06T21:37:52.832Z","name":"PONTO DA CARNE","status":true,"maximo":1,"minimo":1,"productId":26,"restaurantId":1,"complementos":[{"id":2,"uuid":"a4df5343-9726-4241-9cca-b2e910339c81","order":1,"dateCreate":"2021-12-27T13:07:24.790Z","dateUpdate":"2022-12-19T01:04:08.736Z","name":"BEM PASSADO","status":true,"price":"0","restaurantId":1,"quantidade":1}]}],"quantidade":1,"valorTotal":14,"obsItem":"","item":7708}]	Pendente	f	\N	\N	\N	\N	1	\N	\N	7a785d53	bd00c4db-3338-410a-88cc-5c344d00be2c
1960	2023-06-07 12:47:10.115	lkjflksjdflkjsdkl	(46) 54654-6546	Retirada no estabelecimento		0	0		$0.00	Cartão de Débito	$0.00		$14.00	$14.00	[{"id":26,"uuid":"d9d33300-e6a8-4ee5-bec3-262bd59eb290","dateCreate":"2022-07-02T21:48:43.870Z","dateUpdate":"2022-07-02T21:45:46.770Z","name":"Espetinho de Medalhão de Carne","order":6,"status":true,"img":"imagens/Espetinho de Medalhão de Carne1679156780090blob_600.jpg","descricao":"Carne com bacon","catProdId":1,"restaurantId":1,"price":"14","restaurant":{"nameUnique":"rotadoespeto"},"catComplems":[{"id":42,"uuid":"6ebe956e-acf4-4ab6-af66-69c52e43d874","order":37,"dateCreate":"2022-07-06T21:38:59.107Z","dateUpdate":"2022-07-06T21:37:52.832Z","name":"PONTO DA CARNE","status":true,"maximo":1,"minimo":1,"productId":26,"restaurantId":1,"complementos":[{"id":2,"uuid":"a4df5343-9726-4241-9cca-b2e910339c81","order":1,"dateCreate":"2021-12-27T13:07:24.790Z","dateUpdate":"2022-12-19T01:04:08.736Z","name":"BEM PASSADO","status":true,"price":"0","restaurantId":1,"quantidade":1}]}],"quantidade":1,"valorTotal":14,"obsItem":"","item":8160}]	Pendente	f	\N	\N	\N	\N	1	\N	\N	78876fee	5da8aa2c-ba6c-4bd8-bfe4-5bc7d480dcee
\.


--
-- Data for Name: Product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Product" (id, "dateCreate", "dateUpdate", name, "order", status, img, descricao, "catProdId", "restaurantId", price, uuid) FROM stdin;
42	2022-07-02 21:48:43.87	2023-06-20 00:29:53.306	Completo de Picanha\n	11	t	semfoto.jpg	Acompanha arroz, salada de repolho ou vinagrete, farofa, mandioca, creme de alho	2	1	$40.00	dd91ae3b-e24f-4057-bb60-151795028c17
45	2022-07-02 21:48:43.87	2023-06-20 00:29:49.26	Completo Carne com Refrigerante Lata	3	t	semfoto.jpg	Acompanha arroz, salada de repolho ou vinagrete, farofa, mandioca, creme de alho	3	1	$24.00	a458f28f-b698-4e73-94aa-caab641423b1
33	2022-07-02 21:48:43.87	2023-06-20 00:29:51.957	Completo de Carne Magra	2	t	Completo de Carne Magra1679157363048blob_600.jpg	Acompanha arroz, salada de repolho ou vinagrete, farofa, mandioca, creme de alho	2	1	$20.00	f5483ee6-fcf4-41c2-a84f-605d5120ec07
46	2022-07-02 21:48:43.87	2023-06-20 00:30:15.069	ARROZ	1	t	ARROZ1679152163739blob_600.webp	SERVE 1 PESSOA	4	1	$4.00	e700dfcc-941b-4b62-b18c-1c8f7ec89b7b
1	2021-12-27 13:03:44.595	2023-06-20 00:30:20.606	Espetinho de Carne Gorda	5	t	Espetinho de Carne Gorda1679152856166blob_600.jpg	Com 2 gordura	1	1	$8.00	eb15fec2-2695-4983-8f4b-9d1d3109cf2c
29	2022-07-02 21:48:43.87	2023-06-20 00:30:13.722	Espetinho de Contra Filé\n	6	t	semfoto.jpg		1	1	$19.00	98539093-3ef6-4b54-a91c-3c60b4ec364d
32	2022-07-02 21:48:43.87	2023-06-20 00:30:05.601	Completo de Carne Gorda	1	t	Completo de Carne Gorda1679157336293blob_600.jpg	Acompanha arroz, salada de repolho ou vinagrete, farofa, mandioca, creme de alho	2	1	$20.00	f9534b66-4560-4b1d-b93d-95d2b562cb0d
47	2022-07-02 21:48:43.87	2023-06-20 00:30:23.302	CREME DE ALHO 30ML	2	t	63d05073703e8c0027f08a76blob_600.webp		4	1	$2.00	767133a3-019e-442a-9329-322732d7bb18
34	2022-07-02 21:48:43.87	2023-06-20 00:30:19.257	Completo de Frango (Tulipa)\n	3	t	Completo de Frango (Tulipa)1679157623090blob_600.jpg	Acompanha arroz, salada de repolho ou vinagrete, farofa, mandioca, creme de alho	2	1	$20.00	9147069b-39c7-4d28-97d2-caa9b9b39a1c
3	2021-12-28 23:51:16.708	2023-06-20 00:30:12.374	Espetinho de Frango	2	t	Espetinho de Frango1679152875479blob_600.jpg	Tulipa	1	1	$8.00	c95749b9-4018-42f8-bcfa-5c50c2a3b155
51	2022-07-02 21:48:43.87	2023-06-20 00:29:38.302	SALADA DE REPOLHO COM TOMATE	6	t	SALADA DE REPOLHO COM TOMATE1679152197528blob_600.jpg		4	1	$4.00	e4d1eadd-1c33-4eb9-96db-2299682a628b
2	2021-12-28 23:51:16.707	2023-06-20 00:29:36.95	Espetinho de Carne Magra	1	t	Espetinho de Carne Magra1679152353070blob_600.jpg	Sem gordura	1	1	$9.00	eea12020-d7ef-487b-8ef8-1d206472555b
56	2022-07-02 21:48:43.87	2023-06-20 00:30:02.755	REFRIGERANTES	4	t	refrigerantes.jpg		5	1	$0.00	0de543a0-f438-4ae8-b089-1b887d5be745
53	2022-07-02 21:48:43.87	2023-06-20 00:30:04.253	CERVEJAS	1	t	placa_decorativa_cervejas_garrafas_beer_recorte_35x27_cm_1567588777_6167_600x600.avif		5	1	$0.00	58090ee0-ce87-4245-8fed-5e4fd34d5d34
48	2022-07-02 21:48:43.87	2023-06-20 00:30:08.299	FAROFA	3	t	FAROFA1679152179709blob_600.webp	FARINHA DE MANDIOCA	4	1	$4.00	d5b6c1b6-5c15-405a-8b99-711bf6557222
52	2022-07-02 21:48:43.87	2023-06-20 00:30:01.407	VINAGRETE	7	t	VINAGRETE1679153102593blob_600.webp	TOMATE COM CEBOLA	4	1	$4.00	0793da58-7dfe-4b46-9e5b-c9f3c4fa8224
4	2021-12-28 23:51:16.709	2023-06-20 00:30:21.955	Espetinho de Linguiça	3	t	semfoto.jpg		1	1	$8.00	be8ed011-0dc5-4b43-90d3-f19c57af5a23
44	2022-07-02 21:48:43.87	2023-06-20 00:30:11.01	Completo Carne com Linguiça	2	t	semfoto.jpg	Acompanha arroz, salada de repolho ou vinagrete, farofa, mandioca, creme de alho	3	1	$27.00	42b02a07-38bc-41d2-b90d-422b35a95adb
6	2021-12-28 23:51:16.709	2023-06-20 00:30:00.057	Espetinho de Brochete	7	t	semfoto.jpg	CARNE COM FATIAS DE CEBOLA E PIMENTÃO	1	1	$15.00	312bd19c-5506-459a-a2b7-d58f1739bd39
35	2022-07-02 21:48:43.87	2023-06-20 00:29:45.049	Completo de Linguiça\n	4	t	semfoto.jpg	Acompanha arroz, salada de repolho ou vinagrete, farofa, mandioca, creme de alho	2	1	$20.00	e34229e6-df12-4edf-84ad-e17e68444da1
54	2022-07-02 21:48:43.87	2023-06-20 00:29:35.596	SUCO PRATS	2	t	suco_laranja_integral_prats_900_ml_32c51e11-60e3-49e9-859e-c25e79b3eb45.jpg		5	1	$0.00	eef7f898-4644-46d5-930b-60f2b210c1cc
28	2022-07-02 21:48:43.87	2023-06-20 00:29:46.412	Espetinho de Queijo Coalho	6	t	Espetinho de Queijo Coalho1679157186060blob_600.jpg		1	1	$9.00	c490579a-4828-4ed0-bba5-6b5ea23065c9
30	2022-07-02 21:48:43.87	2023-06-20 00:29:54.655	Espetinho de Picanha	6	t	semfoto.jpg	Peso aproximado 300g in natura	1	1	$29.00	798ac3e9-83d2-46b0-b827-642fc0324294
41	2022-07-02 21:48:43.87	2023-06-20 00:29:43.702	Completo de Contra Filé\n	10	t	semfoto.jpg	Acompanha arroz, salada de repolho ou vinagrete, farofa, mandioca, creme de alho	2	1	$30.00	c0359f48-98a5-4885-8965-221c1a9aa6de
43	2022-07-02 21:48:43.87	2023-06-20 00:29:33.795	Completo Carne com Pão de Alho	1	t	semfoto.jpg	Acompanha arroz, salada de repolho ou vinagrete, farofa, mandioca, creme de alho	3	1	$24.00	419b4601-8b55-4365-ab35-cdd0c7bb3fd8
38	2022-07-02 21:48:43.87	2023-06-20 00:29:56.001	Completo de Brochete\n	7	t	semfoto.jpg	Acompanha arroz, salada de repolho ou vinagrete, farofa, mandioca, creme de alho	2	1	$25.00	a6fd6bda-863b-416b-a0f9-811c8ab3254f
50	2022-07-02 21:48:43.87	2023-06-20 00:29:41.001	MANDIOCA	5	t	MANDIOCA1679158479097blob_600.webp	SERVE 1 PESSOA	4	1	$2.00	9d477eb2-cc58-4eef-9243-eaf0bfdcf520
37	2022-07-02 21:48:43.87	2023-06-20 00:29:57.351	Completo de Queijo coalho com fatias de cebola, pimentão e tomate cereja.(vegetariano)\n	6	t	semfoto.jpg	Acompanha arroz, salada de repolho ou vinagrete, farofa, mandioca, creme de alho	2	1	$23.00	8d282d0b-1ddf-4f47-8e63-0f0547398d89
55	2022-07-02 21:48:43.87	2023-06-20 00:30:09.664	ÁGUA	3	t	Frente.jpg		5	1	$0.00	157a90b9-9516-4b2f-8eb1-62f4de4f1daa
5	2021-12-28 23:51:16.709	2023-06-20 00:30:06.949	Espetinho de Coração	4	t	Espetinho de Coracao1679156529237blob_600.jpg	Coração de galinha	1	1	$8.00	66db91b2-f757-4935-9819-811a55f90a8e
26	2022-07-02 21:48:43.87	2023-06-20 00:29:42.351	Espetinho de Medalhão de Carne	6	t	Espetinho de Medalhao de Carne1679156780090blob_600.jpg	Carne com bacon	1	1	$14.00	8cf0c4ff-f5e6-4f16-9f3d-0a0325920954
27	2022-07-02 21:48:43.87	2023-06-20 00:29:58.702	Espetinho de Medalhão de Frango	6	t	Espetinho de Medalhao de Frango1679156858762blob_600.jpg	Franco com bacon	1	1	$14.00	33cd787b-19f1-497a-acc0-94b31ea44bfb
31	2022-07-02 21:48:43.87	2023-06-20 00:29:50.608	Pão de Alho	6	t	Pao de Alho1679157158367blob_600.jpg		1	1	$5.00	463753dd-a2e3-47d4-b8cb-a0b8593559f9
36	2022-07-02 21:48:43.87	2023-06-20 00:29:39.65	Completo de Coração\n	5	t	Completo de Coracao1679157810139blob_600.jpg	Acompanha arroz, salada de repolho ou vinagrete, farofa, mandioca, creme de alho	2	1	$20.00	ff8a3ef4-00f1-4333-9c85-53ffc6777ab8
39	2022-07-02 21:48:43.87	2023-06-20 00:29:47.912	Completo de Medalhão de Carne\n	8	t	Completo de Medalhao de Carne1679157895378blob_600.jpg	Acompanha arroz, salada de repolho ou vinagrete, farofa, mandioca, creme de alho	2	1	$25.00	a82a4c83-5da2-4adf-9006-7fbfb62410a3
40	2022-07-02 21:48:43.87	2023-06-20 00:30:16.414	Completo de Medalhão de Frango\n	9	t	Completo de Medalhao de Frango1679157942120blob_600.jpg	Acompanha arroz, salada de repolho ou vinagrete, farofa, mandioca, creme de alho	2	1	$25.00	f65e7805-b516-4abf-b751-f4827742c7ff
49	2022-07-02 21:48:43.87	2023-06-20 00:30:17.761	FEIJÃO	4	t	FEIJAO1679153120274blob_600.webp	SERVE 1 PESSOA	4	1	$4.00	3de8d5b8-793d-4163-af36-7d028245dd44
\.


--
-- Data for Name: Restaurant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Restaurant" (id, "nameUnique", "namePublic", phone, "streetName", latitude, longitude, "feeDelivery", "minOrder", "dateCreate", "dateUpdate", paused, "horarioAtendimento", "imgLogo", "imgBanner", scheduling, delivery, "localDelivery", "typesPayment", contato, "pixKey", "timeDelivery", "timeStandardWithdraw", uuid) FROM stdin;
1	rotadoespeto	Rota do Espeto	update1	Rua Joana Maria de Souza, 29 Campo Grande - MS CEP: 79062-100	-20.50153844929556	-54.57511050966514	{$0.00,$0.00,$0.00,$0.00,$5.00,$8.00,$8.00,$15.00,$15.00}	$10.00	2021-12-25 18:59:08.562	2023-06-21 14:19:59.407	f	{"Sunday": ["00:00","00:00"],"Monday": ["17:45","23:30"],"Tuesday": ["09:00","23:30"],"Wednesday": ["09:45","23:30"],"Thursday": ["20:10","23:30"],"Friday": ["12:02","16:20","16:21","17:20"],"Saturday": ["18:00","22:30"],"UTC": -4}	logo.jpg	hgjj	f	t	f	Dinheiro | Crédito | Débito | Pix	(67) 9 9277-9989	{"keyPix":"65454654654","typeKeyPix":"CPF"}	{50,50,60,60,70,80,90,100,110}	30	f1a52964-7fe3-479d-9038-56918a08e770
\.


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."User" (id, "dateCreate", "dateUpdate", name, email, password, token, role, status) FROM stdin;
clhp22cw80000qn1sr6y3b02b	2023-05-15 16:24:29.385	2023-05-15 16:24:29.385	Cristiano	cristianorotadoespeto@gmail.com	$2b$10$RACkeY0uojSPMtgyXrGXIOORi69QwaYhFeLaAQhmBU4ssEQeH7fVG	\N	deliverer	t
cl02fbcnq000218doka1bhjl5	2022-02-25 13:01:42.23	2022-02-25 13:01:42.232	Rennan entregador	entregador@gmail.com	$2b$10$HPxQVLz3xjJr4oCRApItCeQsYapOTG3yMeBwcBDf/mh5vbTfWEWA2	\N	deliverer	t
ckzrnum47000224doidlfvxj1	2022-02-18 00:15:09.943	2023-05-08 19:18:50.968	Rennan	engcivil.rennan@gmail.com2	$2b$10$wI9a/hgNYVg7wuM2xnN21ORrkNOZDMl5Eywraju0DvLbNvsIg.Fti	\N	owner	t
ckzu9t3os0002j0do1nmnj1em	2022-02-19 20:05:23.308	2022-02-19 20:05:23.31	Denize	denizefurst@gmail.com	$2b$10$HMLkChb9.NZzjMVA9E1STObnPhwtpoFW6Oy87I7M3w9CA3cq6L5sC	\N	owner	t
\.


--
-- Data for Name: _CatComplemToComplemento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."_CatComplemToComplemento" ("A", "B") FROM stdin;
4	1
4	2
18	1
18	36
18	2
23	2
23	36
23	1
29	36
29	1
29	2
34	1
34	36
34	2
43	1
43	2
43	36
44	1
44	2
44	36
45	1
45	2
45	36
46	1
46	2
46	36
47	3
50	1
50	2
50	36
51	3
51	4
52	1
52	2
52	36
53	3
53	4
54	1
54	2
54	36
55	3
55	4
56	1
56	36
57	3
57	4
58	3
58	4
56	2
59	1
59	2
59	36
60	3
60	4
61	1
61	2
61	36
62	3
62	4
63	1
63	2
63	36
64	3
64	4
65	1
65	2
65	36
66	3
66	4
67	1
67	2
67	36
68	3
68	4
69	1
69	2
69	36
70	3
70	4
74	10
74	11
74	12
74	13
74	14
74	15
74	16
74	17
74	18
74	19
74	20
74	21
74	22
74	23
75	24
75	25
75	27
75	28
76	29
76	30
76	31
77	37
77	38
77	39
77	40
77	41
77	42
77	43
77	44
77	45
77	46
47	4
12	2
12	1
12	36
49	1
49	2
49	36
48	3
48	4
71	1
71	2
71	36
72	3
72	4
73	5
73	6
42	2
4	36
42	36
42	1
73	7
73	8
73	9
\.


--
-- Data for Name: _RestaurantToUser; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."_RestaurantToUser" ("A", "B") FROM stdin;
1	ckzrnum47000224doidlfvxj1
1	ckzu9t3os0002j0do1nmnj1em
1	cl02fbcnq000218doka1bhjl5
1	clhp22cw80000qn1sr6y3b02b
\.


--
-- Name: CatComplem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."CatComplem_id_seq"', 42, true);


--
-- Name: CatProd_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."CatProd_id_seq"', 3, true);


--
-- Name: Complemento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Complemento_id_seq"', 36, true);


--
-- Name: Customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Customer_id_seq"', 728, true);


--
-- Name: IndexUUID_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."IndexUUID_id_seq"', 308, true);


--
-- Name: Pedido_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Pedido_id_seq"', 2029, true);


--
-- Name: Product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Product_id_seq"', 27, true);


--
-- Name: Restaurant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Restaurant_id_seq"', 1, true);


--
-- Name: CatComplem CatComplem_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CatComplem"
    ADD CONSTRAINT "CatComplem_pk" UNIQUE (uuid);


--
-- Name: CatComplem CatComplem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CatComplem"
    ADD CONSTRAINT "CatComplem_pkey" PRIMARY KEY (id);


--
-- Name: CatProd CatProd_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CatProd"
    ADD CONSTRAINT "CatProd_pk" UNIQUE (uuid);


--
-- Name: CatProd CatProd_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CatProd"
    ADD CONSTRAINT "CatProd_pkey" PRIMARY KEY (id);


--
-- Name: Complemento Complemento_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Complemento"
    ADD CONSTRAINT "Complemento_pk" UNIQUE (uuid);


--
-- Name: Complemento Complemento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Complemento"
    ADD CONSTRAINT "Complemento_pkey" PRIMARY KEY (id);


--
-- Name: Customer Customer_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Customer"
    ADD CONSTRAINT "Customer_pk" UNIQUE (uuid);


--
-- Name: Customer Customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Customer"
    ADD CONSTRAINT "Customer_pkey" PRIMARY KEY (id);


--
-- Name: IndexUUID IndexUUID_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."IndexUUID"
    ADD CONSTRAINT "IndexUUID_pk" PRIMARY KEY (id);


--
-- Name: IndexUUID IndexUUID_uuid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."IndexUUID"
    ADD CONSTRAINT "IndexUUID_uuid_key" UNIQUE (uuid);


--
-- Name: Pedido Pedido_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pedido"
    ADD CONSTRAINT "Pedido_pk" UNIQUE ("uniqueId");


--
-- Name: Pedido Pedido_pk2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pedido"
    ADD CONSTRAINT "Pedido_pk2" UNIQUE (uuid);


--
-- Name: Pedido Pedido_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pedido"
    ADD CONSTRAINT "Pedido_pkey" PRIMARY KEY (id);


--
-- Name: Product Product_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_pk" UNIQUE (uuid);


--
-- Name: Product Product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_pkey" PRIMARY KEY (id);


--
-- Name: Restaurant Restaurant_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Restaurant"
    ADD CONSTRAINT "Restaurant_pk" UNIQUE (uuid);


--
-- Name: Restaurant Restaurant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Restaurant"
    ADD CONSTRAINT "Restaurant_pkey" PRIMARY KEY (id);


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: CatComplem_order_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "CatComplem_order_key" ON public."CatComplem" USING btree ("order");


--
-- Name: CatProd_order_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "CatProd_order_key" ON public."CatProd" USING btree ("order");


--
-- Name: Restaurant_nameUnique_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Restaurant_nameUnique_key" ON public."Restaurant" USING btree ("nameUnique");


--
-- Name: User_email_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "User_email_key" ON public."User" USING btree (email);


--
-- Name: _CatComplemToComplemento_AB_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "_CatComplemToComplemento_AB_unique" ON public."_CatComplemToComplemento" USING btree ("A", "B");


--
-- Name: _CatComplemToComplemento_B_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "_CatComplemToComplemento_B_index" ON public."_CatComplemToComplemento" USING btree ("B");


--
-- Name: _RestaurantToUser_AB_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "_RestaurantToUser_AB_unique" ON public."_RestaurantToUser" USING btree ("A", "B");


--
-- Name: _RestaurantToUser_B_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "_RestaurantToUser_B_index" ON public."_RestaurantToUser" USING btree ("B");


--
-- Name: CatComplem CatComplem_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CatComplem"
    ADD CONSTRAINT "CatComplem_productId_fkey" FOREIGN KEY ("productId") REFERENCES public."Product"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: CatComplem CatComplem_restaurantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CatComplem"
    ADD CONSTRAINT "CatComplem_restaurantId_fkey" FOREIGN KEY ("restaurantId") REFERENCES public."Restaurant"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: CatProd CatProd_restaurantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CatProd"
    ADD CONSTRAINT "CatProd_restaurantId_fkey" FOREIGN KEY ("restaurantId") REFERENCES public."Restaurant"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Complemento Complemento_restaurantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Complemento"
    ADD CONSTRAINT "Complemento_restaurantId_fkey" FOREIGN KEY ("restaurantId") REFERENCES public."Restaurant"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Customer Customer_restaurantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Customer"
    ADD CONSTRAINT "Customer_restaurantId_fkey" FOREIGN KEY ("restaurantId") REFERENCES public."Restaurant"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Pedido Pedido_customerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pedido"
    ADD CONSTRAINT "Pedido_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES public."Customer"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Pedido Pedido_restaurantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pedido"
    ADD CONSTRAINT "Pedido_restaurantId_fkey" FOREIGN KEY ("restaurantId") REFERENCES public."Restaurant"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Product Product_catProdId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_catProdId_fkey" FOREIGN KEY ("catProdId") REFERENCES public."CatProd"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Product Product_restaurantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_restaurantId_fkey" FOREIGN KEY ("restaurantId") REFERENCES public."Restaurant"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: _CatComplemToComplemento _CatComplemToComplemento_A_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."_CatComplemToComplemento"
    ADD CONSTRAINT "_CatComplemToComplemento_A_fkey" FOREIGN KEY ("A") REFERENCES public."CatComplem"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: _CatComplemToComplemento _CatComplemToComplemento_B_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."_CatComplemToComplemento"
    ADD CONSTRAINT "_CatComplemToComplemento_B_fkey" FOREIGN KEY ("B") REFERENCES public."Complemento"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: _RestaurantToUser _RestaurantToUser_A_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."_RestaurantToUser"
    ADD CONSTRAINT "_RestaurantToUser_A_fkey" FOREIGN KEY ("A") REFERENCES public."Restaurant"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: _RestaurantToUser _RestaurantToUser_B_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."_RestaurantToUser"
    ADD CONSTRAINT "_RestaurantToUser_B_fkey" FOREIGN KEY ("B") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

