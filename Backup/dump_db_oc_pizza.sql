--
-- PostgreSQL database dump
--

-- Dumped from database version 12.0
-- Dumped by pg_dump version 12.0

-- Started on 2019-11-28 17:01:30

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
-- TOC entry 212 (class 1259 OID 21213)
-- Name: address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.address (
    id integer NOT NULL,
    street_num integer,
    street_name character varying(300) NOT NULL,
    postal_code integer NOT NULL,
    city character varying(300) NOT NULL
);


ALTER TABLE public.address OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 21211)
-- Name: address_id_seq_inc; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.address_id_seq_inc
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.address_id_seq_inc OWNER TO postgres;

--
-- TOC entry 2975 (class 0 OID 0)
-- Dependencies: 211
-- Name: address_id_seq_inc; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.address_id_seq_inc OWNED BY public.address.id;


--
-- TOC entry 215 (class 1259 OID 21229)
-- Name: application_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.application_user (
    id integer NOT NULL,
    first_name character varying(38) NOT NULL,
    last_name character varying(38) NOT NULL,
    tel character varying(10) NOT NULL,
    email character varying(300) NOT NULL,
    password character varying(300) NOT NULL,
    address_id integer NOT NULL,
    role_name character varying(300) NOT NULL
);


ALTER TABLE public.application_user OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 21227)
-- Name: application_user_id_1; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.application_user_id_1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.application_user_id_1 OWNER TO postgres;

--
-- TOC entry 2976 (class 0 OID 0)
-- Dependencies: 214
-- Name: application_user_id_1; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.application_user_id_1 OWNED BY public.application_user.id;


--
-- TOC entry 216 (class 1259 OID 21238)
-- Name: basket; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.basket (
    user_id integer NOT NULL
);


ALTER TABLE public.basket OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 21245)
-- Name: basket_ligne; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.basket_ligne (
    id integer NOT NULL,
    basket_id integer NOT NULL,
    pizza_id integer NOT NULL,
    quantity integer NOT NULL
);


ALTER TABLE public.basket_ligne OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 21243)
-- Name: basket_ligne_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.basket_ligne_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.basket_ligne_id_seq OWNER TO postgres;

--
-- TOC entry 2977 (class 0 OID 0)
-- Dependencies: 217
-- Name: basket_ligne_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.basket_ligne_id_seq OWNED BY public.basket_ligne.id;


--
-- TOC entry 205 (class 1259 OID 21177)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    name character varying(300) NOT NULL
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 21171)
-- Name: ingredient; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ingredient (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(300)
);


ALTER TABLE public.ingredient OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 21169)
-- Name: ingredient_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ingredient_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ingredient_id_seq OWNER TO postgres;

--
-- TOC entry 2978 (class 0 OID 0)
-- Dependencies: 203
-- Name: ingredient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ingredient_id_seq OWNED BY public.ingredient.id;


--
-- TOC entry 209 (class 1259 OID 21198)
-- Name: ingredient_quantity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ingredient_quantity (
    ingredient_id integer NOT NULL,
    pizza_id integer NOT NULL,
    quantity numeric NOT NULL
);


ALTER TABLE public.ingredient_quantity OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 21206)
-- Name: order_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_status (
    name character varying(300) NOT NULL
);


ALTER TABLE public.order_status OWNER TO postgres;

--
-- TOC entry 2979 (class 0 OID 0)
-- Dependencies: 210
-- Name: COLUMN order_status.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.order_status.name IS 'Status :
awaiting prepare,
under prepare,
awaiting delivery,
under delivery,
under modification,
canceled.';


--
-- TOC entry 207 (class 1259 OID 21184)
-- Name: pizza; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pizza (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    url_picture character varying(300),
    recipe character varying(1000) NOT NULL,
    description character varying(1000) NOT NULL,
    price numeric(5,2) NOT NULL
);


ALTER TABLE public.pizza OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 21193)
-- Name: pizza_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pizza_category (
    pizza_id integer NOT NULL,
    category_name character varying(300) NOT NULL
);


ALTER TABLE public.pizza_category OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 21182)
-- Name: pizza_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pizza_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pizza_id_seq OWNER TO postgres;

--
-- TOC entry 2980 (class 0 OID 0)
-- Dependencies: 206
-- Name: pizza_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pizza_id_seq OWNED BY public.pizza.id;


--
-- TOC entry 223 (class 1259 OID 21271)
-- Name: pizza_order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pizza_order (
    id integer NOT NULL,
    order_status_name character varying(300) NOT NULL,
    date_time timestamp without time zone NOT NULL,
    total_cost numeric NOT NULL,
    basket_id integer NOT NULL,
    user_id integer NOT NULL,
    address_id integer NOT NULL
);


ALTER TABLE public.pizza_order OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 21269)
-- Name: pizza_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pizza_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pizza_order_id_seq OWNER TO postgres;

--
-- TOC entry 2981 (class 0 OID 0)
-- Dependencies: 222
-- Name: pizza_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pizza_order_id_seq OWNED BY public.pizza_order.id;


--
-- TOC entry 221 (class 1259 OID 21264)
-- Name: provide; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.provide (
    suplier_siret character varying(14) NOT NULL,
    sale_store_siret character varying(14) NOT NULL
);


ALTER TABLE public.provide OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 21161)
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    name character varying(300) NOT NULL,
    description character varying(1000) NOT NULL
);


ALTER TABLE public.role OWNER TO postgres;

--
-- TOC entry 2982 (class 0 OID 0)
-- Dependencies: 202
-- Name: COLUMN role.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.role.name IS 'roles :
Customer, Employee, Pizzaiolo, Deliveryman, Manager';


--
-- TOC entry 219 (class 1259 OID 21251)
-- Name: sale_store; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sale_store (
    siret character varying(14) NOT NULL,
    user_id integer NOT NULL,
    address_id integer NOT NULL,
    tel character varying(10) NOT NULL,
    email character varying(300) NOT NULL
);


ALTER TABLE public.sale_store OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 21256)
-- Name: stock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stock (
    ingredient_id integer NOT NULL,
    sale_store_siret character varying(14) NOT NULL,
    quantity numeric
);


ALTER TABLE public.stock OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 21222)
-- Name: suplier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.suplier (
    siret character varying(14) NOT NULL,
    address_id integer NOT NULL,
    name character varying(100) NOT NULL,
    tel character varying(10) NOT NULL,
    email character varying(300) NOT NULL
);


ALTER TABLE public.suplier OWNER TO postgres;

--
-- TOC entry 2766 (class 2604 OID 21216)
-- Name: address id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address ALTER COLUMN id SET DEFAULT nextval('public.address_id_seq_inc'::regclass);


--
-- TOC entry 2767 (class 2604 OID 21232)
-- Name: application_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application_user ALTER COLUMN id SET DEFAULT nextval('public.application_user_id_1'::regclass);


--
-- TOC entry 2768 (class 2604 OID 21248)
-- Name: basket_ligne id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_ligne ALTER COLUMN id SET DEFAULT nextval('public.basket_ligne_id_seq'::regclass);


--
-- TOC entry 2764 (class 2604 OID 21174)
-- Name: ingredient id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredient ALTER COLUMN id SET DEFAULT nextval('public.ingredient_id_seq'::regclass);


--
-- TOC entry 2765 (class 2604 OID 21187)
-- Name: pizza id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pizza ALTER COLUMN id SET DEFAULT nextval('public.pizza_id_seq'::regclass);


--
-- TOC entry 2769 (class 2604 OID 21274)
-- Name: pizza_order id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pizza_order ALTER COLUMN id SET DEFAULT nextval('public.pizza_order_id_seq'::regclass);


--
-- TOC entry 2958 (class 0 OID 21213)
-- Dependencies: 212
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.address (id, street_num, street_name, postal_code, city) VALUES (1, 1, 'Rue aux Ours', 76000, 'ROUEN');
INSERT INTO public.address (id, street_num, street_name, postal_code, city) VALUES (2, 9, 'Rue Guillaume le Conquérant', 76000, 'ROUEN');
INSERT INTO public.address (id, street_num, street_name, postal_code, city) VALUES (3, 16, 'Rue Rollon', 76000, 'ROUEN');
INSERT INTO public.address (id, street_num, street_name, postal_code, city) VALUES (4, 14, 'Rue Richard', 76000, 'ROUEN');
INSERT INTO public.address (id, street_num, street_name, postal_code, city) VALUES (5, 31, 'Rue Louis le Gros', 76000, 'ROUEN');


--
-- TOC entry 2961 (class 0 OID 21229)
-- Dependencies: 215
-- Data for Name: application_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.application_user (id, first_name, last_name, tel, email, password, address_id, role_name) VALUES (1, 'Toad', 'Bros', '0744444444', 'toad.bros@gmail.com', 'ToadBros', 4, 'Deliveryman');
INSERT INTO public.application_user (id, first_name, last_name, tel, email, password, address_id, role_name) VALUES (2, 'Peach', 'Bros', '0733333333', 'peach.bros@gmail.com', 'PeachBros', 3, 'Pizzaiolo');
INSERT INTO public.application_user (id, first_name, last_name, tel, email, password, address_id, role_name) VALUES (3, 'Luigi', 'Bros', '0722222222', 'luigi.bros@gmail.com', 'LuigiBros', 2, 'Employee');
INSERT INTO public.application_user (id, first_name, last_name, tel, email, password, address_id, role_name) VALUES (4, 'Mario', 'Bros', '0711111111', 'mario.bros@gmail.com', 'MarioBros', 1, 'Customer');
INSERT INTO public.application_user (id, first_name, last_name, tel, email, password, address_id, role_name) VALUES (5, 'Donkey', 'Kong', '0700000000', 'donkey.kong@gmail.com', 'DonkeyKong', 1, 'Customer');
INSERT INTO public.application_user (id, first_name, last_name, tel, email, password, address_id, role_name) VALUES (6, 'Yoshi', 'Bros', '0755555555', 'yoshi.bros@gmail.com', 'YoshiBros', 5, 'Manager');
INSERT INTO public.application_user (id, first_name, last_name, tel, email, password, address_id, role_name) VALUES (7, 'Funky', 'Kong', '0788888888', 'funky.kong@gmail.com', 'FunkyKong', 3, 'Manager');


--
-- TOC entry 2962 (class 0 OID 21238)
-- Dependencies: 216
-- Data for Name: basket; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.basket (user_id) VALUES (4);
INSERT INTO public.basket (user_id) VALUES (5);


--
-- TOC entry 2964 (class 0 OID 21245)
-- Dependencies: 218
-- Data for Name: basket_ligne; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.basket_ligne (id, basket_id, pizza_id, quantity) VALUES (1, 4, 1, 5);
INSERT INTO public.basket_ligne (id, basket_id, pizza_id, quantity) VALUES (2, 4, 2, 3);
INSERT INTO public.basket_ligne (id, basket_id, pizza_id, quantity) VALUES (3, 5, 2, 1);


--
-- TOC entry 2951 (class 0 OID 21177)
-- Dependencies: 205
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.category (name) VALUES ('Cheeses');
INSERT INTO public.category (name) VALUES ('Meats');
INSERT INTO public.category (name) VALUES ('Fishes');
INSERT INTO public.category (name) VALUES ('Fruits');


--
-- TOC entry 2950 (class 0 OID 21171)
-- Dependencies: 204
-- Data for Name: ingredient; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ingredient (id, name, description) VALUES (1, 'Flour', 'Flour T45.');
INSERT INTO public.ingredient (id, name, description) VALUES (2, 'Yeast', 'Fresh baking yeast.');
INSERT INTO public.ingredient (id, name, description) VALUES (3, 'Salt', 'Fine salt.');
INSERT INTO public.ingredient (id, name, description) VALUES (4, 'Sugar', 'Fine sugar.');
INSERT INTO public.ingredient (id, name, description) VALUES (5, 'Olive oil', 'Extra virgin olive oil.');
INSERT INTO public.ingredient (id, name, description) VALUES (6, 'Tomate premio', 'Tomate Premio F1.');
INSERT INTO public.ingredient (id, name, description) VALUES (7, 'Garlic', 'Germidour garlic');
INSERT INTO public.ingredient (id, name, description) VALUES (8, 'Olive', 'Green olive');
INSERT INTO public.ingredient (id, name, description) VALUES (9, 'Pepper', 'Fleshy Marconi Red Pepper');
INSERT INTO public.ingredient (id, name, description) VALUES (10, 'Gorgonzola', NULL);
INSERT INTO public.ingredient (id, name, description) VALUES (11, 'Gruyere', NULL);
INSERT INTO public.ingredient (id, name, description) VALUES (12, 'Parmesan ', NULL);
INSERT INTO public.ingredient (id, name, description) VALUES (13, 'Goat cheese', NULL);
INSERT INTO public.ingredient (id, name, description) VALUES (14, 'Reblochon', NULL);


--
-- TOC entry 2955 (class 0 OID 21198)
-- Dependencies: 209
-- Data for Name: ingredient_quantity; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ingredient_quantity (ingredient_id, pizza_id, quantity) VALUES (1, 1, 400);
INSERT INTO public.ingredient_quantity (ingredient_id, pizza_id, quantity) VALUES (2, 1, 25);
INSERT INTO public.ingredient_quantity (ingredient_id, pizza_id, quantity) VALUES (3, 1, 4);
INSERT INTO public.ingredient_quantity (ingredient_id, pizza_id, quantity) VALUES (4, 1, 2);
INSERT INTO public.ingredient_quantity (ingredient_id, pizza_id, quantity) VALUES (5, 1, 4);
INSERT INTO public.ingredient_quantity (ingredient_id, pizza_id, quantity) VALUES (6, 1, 40);
INSERT INTO public.ingredient_quantity (ingredient_id, pizza_id, quantity) VALUES (7, 1, 8);
INSERT INTO public.ingredient_quantity (ingredient_id, pizza_id, quantity) VALUES (13, 1, 30);
INSERT INTO public.ingredient_quantity (ingredient_id, pizza_id, quantity) VALUES (1, 2, 400);
INSERT INTO public.ingredient_quantity (ingredient_id, pizza_id, quantity) VALUES (2, 2, 25);
INSERT INTO public.ingredient_quantity (ingredient_id, pizza_id, quantity) VALUES (3, 2, 4);
INSERT INTO public.ingredient_quantity (ingredient_id, pizza_id, quantity) VALUES (4, 2, 2);
INSERT INTO public.ingredient_quantity (ingredient_id, pizza_id, quantity) VALUES (5, 2, 4);
INSERT INTO public.ingredient_quantity (ingredient_id, pizza_id, quantity) VALUES (6, 2, 40);
INSERT INTO public.ingredient_quantity (ingredient_id, pizza_id, quantity) VALUES (7, 2, 8);
INSERT INTO public.ingredient_quantity (ingredient_id, pizza_id, quantity) VALUES (10, 2, 30);
INSERT INTO public.ingredient_quantity (ingredient_id, pizza_id, quantity) VALUES (11, 2, 30);
INSERT INTO public.ingredient_quantity (ingredient_id, pizza_id, quantity) VALUES (12, 2, 30);
INSERT INTO public.ingredient_quantity (ingredient_id, pizza_id, quantity) VALUES (14, 2, 30);


--
-- TOC entry 2956 (class 0 OID 21206)
-- Dependencies: 210
-- Data for Name: order_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.order_status (name) VALUES ('Awaiting prepare');
INSERT INTO public.order_status (name) VALUES ('Under prepare');
INSERT INTO public.order_status (name) VALUES ('Awaiting delivery');
INSERT INTO public.order_status (name) VALUES ('Under delivery');
INSERT INTO public.order_status (name) VALUES ('Under modification');
INSERT INTO public.order_status (name) VALUES ('Canceled');
INSERT INTO public.order_status (name) VALUES ('Completed');


--
-- TOC entry 2953 (class 0 OID 21184)
-- Dependencies: 207
-- Data for Name: pizza; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pizza (id, name, url_picture, recipe, description, price) VALUES (1, 'Honey goat', NULL, 'Préchauffer le four à 220 °C.
Couper le rondin de chèvre en tranches.
Étendre la pâte à pizza et la déposer sur une plaque à pâtisserie allant au four recouverte de papier parchemin.
Étendre la sauce tomate dessus.
Déposer les tranches de chèvre sur le dessus et saupoudrer de gruyère râpé.
Saler, poivrer et verser le miel et l''huile d''olive.
Cuire au four de 15 à 20 minutes.', 'Pizza au fromage de chèvre recouverte de miel.', 10.50);
INSERT INTO public.pizza (id, name, url_picture, recipe, description, price) VALUES (2, 'Pizza 4 Fromages', NULL, 'Préchauffez le four à 220 °C.
Égouttez la mozzarella et coupez-la en rondelles.
Étalez la pâte à pizza et déposez-la sur une plaque allant au four recouverte de papier sulfurisé.
Étalez le coulis de tomates par-dessus.
Déposez les tranches de mozzarella puis parsemez de Comté et de gruyère râpé.
Émiettez le Roquefort sur la pizza.
Poivrez et parsemez de thym.
Enfournez durant 15 à 20 min.', 'Pizza aux 4 fromages.', 12.00);


--
-- TOC entry 2954 (class 0 OID 21193)
-- Dependencies: 208
-- Data for Name: pizza_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pizza_category (pizza_id, category_name) VALUES (1, 'Cheeses');
INSERT INTO public.pizza_category (pizza_id, category_name) VALUES (2, 'Cheeses');
INSERT INTO public.pizza_category (pizza_id, category_name) VALUES (2, 'Meats');


--
-- TOC entry 2969 (class 0 OID 21271)
-- Dependencies: 223
-- Data for Name: pizza_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pizza_order (id, order_status_name, date_time, total_cost, basket_id, user_id, address_id) VALUES (1, 'Awaiting prepare', '2019-11-10 18:05:00', 80.5, 4, 4, 1);
INSERT INTO public.pizza_order (id, order_status_name, date_time, total_cost, basket_id, user_id, address_id) VALUES (2, 'Awaiting prepare', '2019-11-12 18:05:00', 12, 5, 5, 1);


--
-- TOC entry 2967 (class 0 OID 21264)
-- Dependencies: 221
-- Data for Name: provide; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.provide (suplier_siret, sale_store_siret) VALUES ('34567891234567', '12345678912345');
INSERT INTO public.provide (suplier_siret, sale_store_siret) VALUES ('34567891234567', '23456789123456');
INSERT INTO public.provide (suplier_siret, sale_store_siret) VALUES ('45678912345678', '12345678912345');
INSERT INTO public.provide (suplier_siret, sale_store_siret) VALUES ('45678912345678', '23456789123456');


--
-- TOC entry 2948 (class 0 OID 21161)
-- Dependencies: 202
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.role (name, description) VALUES ('Customer', 'User who orders pizzas.');
INSERT INTO public.role (name, description) VALUES ('Employee', 'User who orders pizzas for the customer.');
INSERT INTO public.role (name, description) VALUES ('Pizzaiolo', 'User who prepares orders.');
INSERT INTO public.role (name, description) VALUES ('Deliveryman', 'User who delivers the orders.');
INSERT INTO public.role (name, description) VALUES ('Manager', 'User who manages the sales shop.');


--
-- TOC entry 2965 (class 0 OID 21251)
-- Dependencies: 219
-- Data for Name: sale_store; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sale_store (siret, user_id, address_id, tel, email) VALUES ('12345678912345', 6, 3, '0766666666', 'ocpizza@support.com');
INSERT INTO public.sale_store (siret, user_id, address_id, tel, email) VALUES ('23456789123456', 7, 2, '0777777777', 'ocpizza@support.com');


--
-- TOC entry 2966 (class 0 OID 21256)
-- Dependencies: 220
-- Data for Name: stock; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.stock (ingredient_id, sale_store_siret, quantity) VALUES (1, '12345678912345', 30000);
INSERT INTO public.stock (ingredient_id, sale_store_siret, quantity) VALUES (2, '12345678912345', 5000);
INSERT INTO public.stock (ingredient_id, sale_store_siret, quantity) VALUES (3, '12345678912345', 5000);
INSERT INTO public.stock (ingredient_id, sale_store_siret, quantity) VALUES (4, '12345678912345', 5000);
INSERT INTO public.stock (ingredient_id, sale_store_siret, quantity) VALUES (5, '12345678912345', 8000);
INSERT INTO public.stock (ingredient_id, sale_store_siret, quantity) VALUES (6, '12345678912345', 30000);
INSERT INTO public.stock (ingredient_id, sale_store_siret, quantity) VALUES (7, '12345678912345', 3000);
INSERT INTO public.stock (ingredient_id, sale_store_siret, quantity) VALUES (8, '12345678912345', 8000);
INSERT INTO public.stock (ingredient_id, sale_store_siret, quantity) VALUES (9, '12345678912345', 8000);
INSERT INTO public.stock (ingredient_id, sale_store_siret, quantity) VALUES (10, '12345678912345', 20000);
INSERT INTO public.stock (ingredient_id, sale_store_siret, quantity) VALUES (11, '12345678912345', 20000);
INSERT INTO public.stock (ingredient_id, sale_store_siret, quantity) VALUES (12, '12345678912345', 20000);
INSERT INTO public.stock (ingredient_id, sale_store_siret, quantity) VALUES (13, '12345678912345', 20000);
INSERT INTO public.stock (ingredient_id, sale_store_siret, quantity) VALUES (14, '12345678912345', 20000);
INSERT INTO public.stock (ingredient_id, sale_store_siret, quantity) VALUES (1, '23456789123456', 30000);
INSERT INTO public.stock (ingredient_id, sale_store_siret, quantity) VALUES (2, '23456789123456', 5000);
INSERT INTO public.stock (ingredient_id, sale_store_siret, quantity) VALUES (3, '23456789123456', 5000);
INSERT INTO public.stock (ingredient_id, sale_store_siret, quantity) VALUES (4, '23456789123456', 5000);
INSERT INTO public.stock (ingredient_id, sale_store_siret, quantity) VALUES (5, '23456789123456', 8000);
INSERT INTO public.stock (ingredient_id, sale_store_siret, quantity) VALUES (6, '23456789123456', 30000);
INSERT INTO public.stock (ingredient_id, sale_store_siret, quantity) VALUES (7, '23456789123456', 3000);
INSERT INTO public.stock (ingredient_id, sale_store_siret, quantity) VALUES (8, '23456789123456', 8000);
INSERT INTO public.stock (ingredient_id, sale_store_siret, quantity) VALUES (9, '23456789123456', 8000);
INSERT INTO public.stock (ingredient_id, sale_store_siret, quantity) VALUES (10, '23456789123456', 20000);
INSERT INTO public.stock (ingredient_id, sale_store_siret, quantity) VALUES (11, '23456789123456', 20000);
INSERT INTO public.stock (ingredient_id, sale_store_siret, quantity) VALUES (12, '23456789123456', 20000);
INSERT INTO public.stock (ingredient_id, sale_store_siret, quantity) VALUES (13, '23456789123456', 20000);
INSERT INTO public.stock (ingredient_id, sale_store_siret, quantity) VALUES (14, '23456789123456', 20000);


--
-- TOC entry 2959 (class 0 OID 21222)
-- Dependencies: 213
-- Data for Name: suplier; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.suplier (siret, address_id, name, tel, email) VALUES ('34567891234567', 3, 'Agidra', '0788888888', 'agidra@support.com');
INSERT INTO public.suplier (siret, address_id, name, tel, email) VALUES ('45678912345678', 4, 'Sodiaal', '0799999999', 'sodiaal@support.com');


--
-- TOC entry 2983 (class 0 OID 0)
-- Dependencies: 211
-- Name: address_id_seq_inc; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.address_id_seq_inc', 5, true);


--
-- TOC entry 2984 (class 0 OID 0)
-- Dependencies: 214
-- Name: application_user_id_1; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.application_user_id_1', 7, true);


--
-- TOC entry 2985 (class 0 OID 0)
-- Dependencies: 217
-- Name: basket_ligne_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.basket_ligne_id_seq', 3, true);


--
-- TOC entry 2986 (class 0 OID 0)
-- Dependencies: 203
-- Name: ingredient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ingredient_id_seq', 14, true);


--
-- TOC entry 2987 (class 0 OID 0)
-- Dependencies: 206
-- Name: pizza_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pizza_id_seq', 2, true);


--
-- TOC entry 2988 (class 0 OID 0)
-- Dependencies: 222
-- Name: pizza_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pizza_order_id_seq', 2, true);


--
-- TOC entry 2785 (class 2606 OID 21221)
-- Name: address address_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pk PRIMARY KEY (id);


--
-- TOC entry 2789 (class 2606 OID 21237)
-- Name: application_user application_user_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application_user
    ADD CONSTRAINT application_user_pk PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 21250)
-- Name: basket_ligne basket_ligne_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_ligne
    ADD CONSTRAINT basket_ligne_pk PRIMARY KEY (id);


--
-- TOC entry 2791 (class 2606 OID 21242)
-- Name: basket basket_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket
    ADD CONSTRAINT basket_pk PRIMARY KEY (user_id);


--
-- TOC entry 2775 (class 2606 OID 21181)
-- Name: category category_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pk PRIMARY KEY (name);


--
-- TOC entry 2773 (class 2606 OID 21176)
-- Name: ingredient ingredient_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredient
    ADD CONSTRAINT ingredient_pk PRIMARY KEY (id);


--
-- TOC entry 2781 (class 2606 OID 21205)
-- Name: ingredient_quantity ingredient_quantity_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredient_quantity
    ADD CONSTRAINT ingredient_quantity_pk PRIMARY KEY (ingredient_id, pizza_id);


--
-- TOC entry 2783 (class 2606 OID 21210)
-- Name: order_status order_status_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_status
    ADD CONSTRAINT order_status_pk PRIMARY KEY (name);


--
-- TOC entry 2779 (class 2606 OID 21197)
-- Name: pizza_category pizza_category_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pizza_category
    ADD CONSTRAINT pizza_category_pk PRIMARY KEY (pizza_id, category_name);


--
-- TOC entry 2801 (class 2606 OID 21279)
-- Name: pizza_order pizza_order_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pizza_order
    ADD CONSTRAINT pizza_order_pk PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 21192)
-- Name: pizza pizza_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pizza
    ADD CONSTRAINT pizza_pk PRIMARY KEY (id);


--
-- TOC entry 2799 (class 2606 OID 21268)
-- Name: provide provide_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provide
    ADD CONSTRAINT provide_pk PRIMARY KEY (suplier_siret, sale_store_siret);


--
-- TOC entry 2771 (class 2606 OID 21168)
-- Name: role role_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pk PRIMARY KEY (name);


--
-- TOC entry 2795 (class 2606 OID 21255)
-- Name: sale_store sale_store_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_store
    ADD CONSTRAINT sale_store_pk PRIMARY KEY (siret);


--
-- TOC entry 2797 (class 2606 OID 21263)
-- Name: stock stock_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT stock_pk PRIMARY KEY (ingredient_id, sale_store_siret);


--
-- TOC entry 2787 (class 2606 OID 21226)
-- Name: suplier suplier_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suplier
    ADD CONSTRAINT suplier_pk PRIMARY KEY (siret);


--
-- TOC entry 2819 (class 2606 OID 21335)
-- Name: pizza_order address_pizza_order_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pizza_order
    ADD CONSTRAINT address_pizza_order_fk FOREIGN KEY (address_id) REFERENCES public.address(id);


--
-- TOC entry 2812 (class 2606 OID 21325)
-- Name: sale_store address_sale_store_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_store
    ADD CONSTRAINT address_sale_store_fk FOREIGN KEY (address_id) REFERENCES public.address(id);


--
-- TOC entry 2806 (class 2606 OID 21330)
-- Name: suplier address_suplier_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suplier
    ADD CONSTRAINT address_suplier_fk FOREIGN KEY (address_id) REFERENCES public.address(id);


--
-- TOC entry 2808 (class 2606 OID 21320)
-- Name: application_user address_user_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application_user
    ADD CONSTRAINT address_user_fk FOREIGN KEY (address_id) REFERENCES public.address(id);


--
-- TOC entry 2809 (class 2606 OID 21355)
-- Name: basket application_user_basket_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket
    ADD CONSTRAINT application_user_basket_fk FOREIGN KEY (user_id) REFERENCES public.application_user(id);


--
-- TOC entry 2811 (class 2606 OID 21365)
-- Name: basket_ligne basket_basket_ligne_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_ligne
    ADD CONSTRAINT basket_basket_ligne_fk FOREIGN KEY (basket_id) REFERENCES public.basket(user_id);


--
-- TOC entry 2821 (class 2606 OID 21360)
-- Name: pizza_order basket_order_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pizza_order
    ADD CONSTRAINT basket_order_fk FOREIGN KEY (basket_id) REFERENCES public.basket(user_id);


--
-- TOC entry 2802 (class 2606 OID 21295)
-- Name: pizza_category category_pizza_category_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pizza_category
    ADD CONSTRAINT category_pizza_category_fk FOREIGN KEY (category_name) REFERENCES public.category(name);


--
-- TOC entry 2804 (class 2606 OID 21285)
-- Name: ingredient_quantity ingredient_ingredient_quantity_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredient_quantity
    ADD CONSTRAINT ingredient_ingredient_quantity_fk FOREIGN KEY (ingredient_id) REFERENCES public.ingredient(id);


--
-- TOC entry 2814 (class 2606 OID 21290)
-- Name: stock ingredient_stock_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT ingredient_stock_fk FOREIGN KEY (ingredient_id) REFERENCES public.ingredient(id);


--
-- TOC entry 2818 (class 2606 OID 21315)
-- Name: pizza_order order_status_order_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pizza_order
    ADD CONSTRAINT order_status_order_fk FOREIGN KEY (order_status_name) REFERENCES public.order_status(name);


--
-- TOC entry 2810 (class 2606 OID 21305)
-- Name: basket_ligne pizza_basket_ligne_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_ligne
    ADD CONSTRAINT pizza_basket_ligne_fk FOREIGN KEY (pizza_id) REFERENCES public.pizza(id);


--
-- TOC entry 2805 (class 2606 OID 21300)
-- Name: ingredient_quantity pizza_ingredient_quantity_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredient_quantity
    ADD CONSTRAINT pizza_ingredient_quantity_fk FOREIGN KEY (pizza_id) REFERENCES public.pizza(id);


--
-- TOC entry 2803 (class 2606 OID 21310)
-- Name: pizza_category pizza_pizza_category_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pizza_category
    ADD CONSTRAINT pizza_pizza_category_fk FOREIGN KEY (pizza_id) REFERENCES public.pizza(id);


--
-- TOC entry 2807 (class 2606 OID 21280)
-- Name: application_user role_user_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application_user
    ADD CONSTRAINT role_user_fk FOREIGN KEY (role_name) REFERENCES public.role(name);


--
-- TOC entry 2817 (class 2606 OID 21370)
-- Name: provide sale_store_provide_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provide
    ADD CONSTRAINT sale_store_provide_fk FOREIGN KEY (sale_store_siret) REFERENCES public.sale_store(siret);


--
-- TOC entry 2815 (class 2606 OID 21375)
-- Name: stock sale_store_stock_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT sale_store_stock_fk FOREIGN KEY (sale_store_siret) REFERENCES public.sale_store(siret);


--
-- TOC entry 2816 (class 2606 OID 21340)
-- Name: provide suplier_provide_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provide
    ADD CONSTRAINT suplier_provide_fk1 FOREIGN KEY (suplier_siret) REFERENCES public.suplier(siret);


--
-- TOC entry 2820 (class 2606 OID 21345)
-- Name: pizza_order user_order_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pizza_order
    ADD CONSTRAINT user_order_fk FOREIGN KEY (user_id) REFERENCES public.application_user(id);


--
-- TOC entry 2813 (class 2606 OID 21350)
-- Name: sale_store user_sale_store_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_store
    ADD CONSTRAINT user_sale_store_fk FOREIGN KEY (user_id) REFERENCES public.application_user(id);


-- Completed on 2019-11-28 17:01:30

--
-- PostgreSQL database dump complete
--

