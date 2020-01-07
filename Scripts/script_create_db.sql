
CREATE TABLE public.role (
                name VARCHAR(300) NOT NULL,
                description VARCHAR(1000) NOT NULL,
                CONSTRAINT role_pk PRIMARY KEY (name)
);
COMMENT ON COLUMN public.role.name IS 'roles :
Customer, Employee, Pizzaiolo, Deliveryman, Manager';


CREATE SEQUENCE public.ingredient_id_seq;

CREATE TABLE public.ingredient (
                id INTEGER NOT NULL DEFAULT nextval('public.ingredient_id_seq'),
                name VARCHAR(100) NOT NULL,
                description VARCHAR(300),
                CONSTRAINT ingredient_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.ingredient_id_seq OWNED BY public.ingredient.id;

CREATE TABLE public.category (
                name VARCHAR(300) NOT NULL,
                CONSTRAINT category_pk PRIMARY KEY (name)
);


CREATE SEQUENCE public.pizza_id_seq;

CREATE TABLE public.pizza (
                id INTEGER NOT NULL DEFAULT nextval('public.pizza_id_seq'),
                name VARCHAR(100) NOT NULL,
                url_picture VARCHAR(300),
                recipe VARCHAR(1000) NOT NULL,
                description VARCHAR(1000) NOT NULL,
                price NUMERIC(5,2) NOT NULL,
                CONSTRAINT pizza_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.pizza_id_seq OWNED BY public.pizza.id;

CREATE TABLE public.pizza_category (
                pizza_id INTEGER NOT NULL,
                category_name VARCHAR(300) NOT NULL,
                CONSTRAINT pizza_category_pk PRIMARY KEY (pizza_id, category_name)
);


CREATE TABLE public.ingredient_quantity (
                ingredient_id INTEGER NOT NULL,
                pizza_id INTEGER NOT NULL,
                quantity NUMERIC NOT NULL,
                CONSTRAINT ingredient_quantity_pk PRIMARY KEY (ingredient_id, pizza_id)
);


CREATE TABLE public.order_status (
                name VARCHAR(300) NOT NULL,
                CONSTRAINT order_status_pk PRIMARY KEY (name)
);
COMMENT ON COLUMN public.order_status.name IS 'Status :
awaiting prepare,
under prepare,
awaiting delivery,
under delivery,
under modification,
canceled.';


CREATE SEQUENCE public.address_id_seq_inc;

CREATE TABLE public.address (
                id INTEGER NOT NULL DEFAULT nextval('public.address_id_seq_inc'),
                street_num INTEGER,
                street_name VARCHAR(300) NOT NULL,
                postal_code INTEGER NOT NULL,
                city VARCHAR(300) NOT NULL,
                CONSTRAINT address_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.address_id_seq_inc OWNED BY public.address.id;

CREATE TABLE public.suplier (
                siret VARCHAR(14) NOT NULL,
                address_id INTEGER NOT NULL,
                name VARCHAR(100) NOT NULL,
                tel VARCHAR(10) NOT NULL,
                email VARCHAR(300) NOT NULL,
                CONSTRAINT suplier_pk PRIMARY KEY (siret)
);


CREATE SEQUENCE public.application_user_id_1;

CREATE TABLE public.application_user (
                id INTEGER NOT NULL DEFAULT nextval('public.application_user_id_1'),
                first_name VARCHAR(38) NOT NULL,
                last_name VARCHAR(38) NOT NULL,
                tel VARCHAR(10) NOT NULL,
                email VARCHAR(300) NOT NULL,
                password VARCHAR(300) NOT NULL,
                address_id INTEGER NOT NULL,
                role_name VARCHAR(300) NOT NULL,
                CONSTRAINT application_user_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.application_user_id_1 OWNED BY public.application_user.id;

CREATE TABLE public.basket (
                user_id INTEGER NOT NULL,
                CONSTRAINT basket_pk PRIMARY KEY (user_id)
);


CREATE SEQUENCE public.basket_ligne_id_seq;

CREATE TABLE public.basket_ligne (
                id INTEGER NOT NULL DEFAULT nextval('public.basket_ligne_id_seq'),
                basket_id INTEGER NOT NULL,
                pizza_id INTEGER NOT NULL,
                quantity INTEGER NOT NULL,
                CONSTRAINT basket_ligne_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.basket_ligne_id_seq OWNED BY public.basket_ligne.id;

CREATE TABLE public.sale_store (
                siret VARCHAR(14) NOT NULL,
                user_id INTEGER NOT NULL,
                address_id INTEGER NOT NULL,
                tel VARCHAR(10) NOT NULL,
                email VARCHAR(300) NOT NULL,
                CONSTRAINT sale_store_pk PRIMARY KEY (siret)
);


CREATE TABLE public.stock (
                ingredient_id INTEGER NOT NULL,
                sale_store_siret VARCHAR(14) NOT NULL,
                quantity NUMERIC,
                CONSTRAINT stock_pk PRIMARY KEY (ingredient_id, sale_store_siret)
);


CREATE TABLE public.provide (
                suplier_siret VARCHAR(14) NOT NULL,
                sale_store_siret VARCHAR(14) NOT NULL,
                CONSTRAINT provide_pk PRIMARY KEY (suplier_siret, sale_store_siret)
);


CREATE SEQUENCE public.pizza_order_id_seq;

CREATE TABLE public.pizza_order (
                id INTEGER NOT NULL DEFAULT nextval('public.pizza_order_id_seq'),
                order_status_name VARCHAR(300) NOT NULL,
                date_time TIMESTAMP NOT NULL,
                total_cost NUMERIC NOT NULL,
                basket_id INTEGER NOT NULL,
                user_id INTEGER NOT NULL,
                address_id INTEGER NOT NULL,
                CONSTRAINT pizza_order_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.pizza_order_id_seq OWNED BY public.pizza_order.id;

ALTER TABLE public.application_user ADD CONSTRAINT role_user_fk
FOREIGN KEY (role_name)
REFERENCES public.role (name)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ingredient_quantity ADD CONSTRAINT ingredient_ingredient_quantity_fk
FOREIGN KEY (ingredient_id)
REFERENCES public.ingredient (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.stock ADD CONSTRAINT ingredient_stock_fk
FOREIGN KEY (ingredient_id)
REFERENCES public.ingredient (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pizza_category ADD CONSTRAINT category_pizza_category_fk
FOREIGN KEY (category_name)
REFERENCES public.category (name)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ingredient_quantity ADD CONSTRAINT pizza_ingredient_quantity_fk
FOREIGN KEY (pizza_id)
REFERENCES public.pizza (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.basket_ligne ADD CONSTRAINT pizza_basket_ligne_fk
FOREIGN KEY (pizza_id)
REFERENCES public.pizza (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pizza_category ADD CONSTRAINT pizza_pizza_category_fk
FOREIGN KEY (pizza_id)
REFERENCES public.pizza (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pizza_order ADD CONSTRAINT order_status_order_fk
FOREIGN KEY (order_status_name)
REFERENCES public.order_status (name)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.application_user ADD CONSTRAINT address_user_fk
FOREIGN KEY (address_id)
REFERENCES public.address (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.sale_store ADD CONSTRAINT address_sale_store_fk
FOREIGN KEY (address_id)
REFERENCES public.address (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.suplier ADD CONSTRAINT address_suplier_fk
FOREIGN KEY (address_id)
REFERENCES public.address (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pizza_order ADD CONSTRAINT address_pizza_order_fk
FOREIGN KEY (address_id)
REFERENCES public.address (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.provide ADD CONSTRAINT suplier_provide_fk1
FOREIGN KEY (suplier_siret)
REFERENCES public.suplier (siret)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pizza_order ADD CONSTRAINT user_order_fk
FOREIGN KEY (user_id)
REFERENCES public.application_user (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.sale_store ADD CONSTRAINT user_sale_store_fk
FOREIGN KEY (user_id)
REFERENCES public.application_user (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.basket ADD CONSTRAINT application_user_basket_fk
FOREIGN KEY (user_id)
REFERENCES public.application_user (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pizza_order ADD CONSTRAINT basket_order_fk
FOREIGN KEY (basket_id)
REFERENCES public.basket (user_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.basket_ligne ADD CONSTRAINT basket_basket_ligne_fk
FOREIGN KEY (basket_id)
REFERENCES public.basket (user_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.provide ADD CONSTRAINT sale_store_provide_fk
FOREIGN KEY (sale_store_siret)
REFERENCES public.sale_store (siret)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.stock ADD CONSTRAINT sale_store_stock_fk
FOREIGN KEY (sale_store_siret)
REFERENCES public.sale_store (siret)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
