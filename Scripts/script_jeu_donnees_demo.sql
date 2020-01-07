-- ROLE

INSERT INTO public.role ( name, description) 
VALUES ('Customer', 'User who orders pizzas.');
INSERT INTO public.role ( name, description) 
VALUES ('Employee', 'User who orders pizzas for the customer.');
INSERT INTO public.role ( name, description) 
VALUES ('Pizzaiolo', 'User who prepares orders.');
INSERT INTO public.role ( name, description) 
VALUES ('Deliveryman', 'User who delivers the orders.');
INSERT INTO public.role ( name, description) 
VALUES ('Manager', 'User who manages the sales shop.');

-- ADDRESS

INSERT INTO public.address (street_num, street_name, postal_code, city)
VALUES (1, 'Rue aux Ours', '76000', 'ROUEN');
INSERT INTO public.address (street_num, street_name, postal_code, city)
VALUES (9, 'Rue Guillaume le Conquérant', '76000', 'ROUEN');
INSERT INTO public.address (street_num, street_name, postal_code, city)
VALUES (16, 'Rue Rollon', '76000', 'ROUEN');
INSERT INTO public.address (street_num, street_name, postal_code, city)
VALUES (14, 'Rue Richard', '76000', 'ROUEN');
INSERT INTO public.address (street_num, street_name, postal_code, city)
VALUES (31, 'Rue Louis le Gros', '76000', 'ROUEN');

-- USER

INSERT INTO public.application_user (first_name, last_name, tel, email, password, address_id, role_name)
VALUES ('Toad', 'Bros', '0744444444', 'toad.bros@gmail.com', 'ToadBros', 4, 'Deliveryman');
INSERT INTO public.application_user (first_name, last_name, tel, email, password, address_id, role_name)
VALUES ('Peach', 'Bros', '0733333333', 'peach.bros@gmail.com', 'PeachBros', 3, 'Pizzaiolo');
INSERT INTO public.application_user (first_name, last_name, tel, email, password, address_id, role_name)
VALUES ('Luigi', 'Bros', '0722222222', 'luigi.bros@gmail.com', 'LuigiBros', 2, 'Employee');
INSERT INTO public.application_user (first_name, last_name, tel, email, password, address_id, role_name)
VALUES ('Mario', 'Bros', '0711111111', 'mario.bros@gmail.com', 'MarioBros', 1, 'Customer');
INSERT INTO public.application_user (first_name, last_name, tel, email, password, address_id, role_name)
VALUES ('Donkey', 'Kong', '0700000000', 'donkey.kong@gmail.com', 'DonkeyKong', 1, 'Customer');
INSERT INTO public.application_user (first_name, last_name, tel, email, password, address_id, role_name)
VALUES ('Yoshi', 'Bros', '0755555555', 'yoshi.bros@gmail.com', 'YoshiBros', 5, 'Manager');
INSERT INTO public.application_user (first_name, last_name, tel, email, password, address_id, role_name)
VALUES ('Funky', 'Kong', '0788888888', 'funky.kong@gmail.com', 'FunkyKong', 3, 'Manager');

-- ORDER STATUS

INSERT INTO public.order_status (name) VALUES ('Awaiting prepare');
INSERT INTO public.order_status (name) VALUES ('Under prepare');
INSERT INTO public.order_status (name) VALUES ('Awaiting delivery');
INSERT INTO public.order_status (name) VALUES ('Under delivery');
INSERT INTO public.order_status (name) VALUES ('Under modification');
INSERT INTO public.order_status (name) VALUES ('Canceled');
INSERT INTO public.order_status (name) VALUES ('Completed');

-- SALE STORE

INSERT INTO public.sale_store (siret, user_id, address_id, tel, email) 
VALUES ('12345678912345', 6, 3, '0766666666', 'ocpizza@support.com' );
INSERT INTO public.sale_store (siret, user_id, address_id, tel, email) 
VALUES ('23456789123456', 7, 2, '0777777777', 'ocpizza@support.com' );

-- SUPLIER

INSERT INTO public.suplier (siret, address_id, name, tel, email)
VALUES ('34567891234567', 3, 'Agidra', '0788888888', 'agidra@support.com');
INSERT INTO public.suplier (siret, address_id, name, tel, email)
VALUES ('45678912345678', 4, 'Sodiaal', '0799999999', 'sodiaal@support.com');

-- PROVIDE

INSERT INTO public.provide(suplier_siret, sale_store_siret)
VALUES ('34567891234567', '12345678912345');
INSERT INTO public.provide(suplier_siret, sale_store_siret)
VALUES ('34567891234567', '23456789123456');
INSERT INTO public.provide(suplier_siret, sale_store_siret)
VALUES ('45678912345678', '12345678912345');
INSERT INTO public.provide(suplier_siret, sale_store_siret)
VALUES ('45678912345678', '23456789123456');

-- INGREDIENT

INSERT INTO public.ingredient (name, description)
VALUES ('Flour', 'Flour T45.');
INSERT INTO public.ingredient (name, description)
VALUES ('Yeast', 'Fresh baking yeast.');
INSERT INTO public.ingredient (name, description)
VALUES ('Salt', 'Fine salt.');
INSERT INTO public.ingredient (name, description)
VALUES ('Sugar', 'Fine sugar.');
INSERT INTO public.ingredient (name, description)
VALUES ('Olive oil', 'Extra virgin olive oil.');
INSERT INTO public.ingredient (name, description)
VALUES ('Tomate premio', 'Tomate Premio F1.');
INSERT INTO public.ingredient (name, description)
VALUES ('Garlic', 'Germidour garlic');
INSERT INTO public.ingredient (name, description)
VALUES ('Olive', 'Green olive');
INSERT INTO public.ingredient (name, description)
VALUES ('Pepper', 'Fleshy Marconi Red Pepper');
INSERT INTO public.ingredient (name, description)
VALUES ('Gorgonzola', null);
INSERT INTO public.ingredient (name, description)
VALUES ('Gruyere', null);
INSERT INTO public.ingredient (name, description)
VALUES ('Parmesan ', null);
INSERT INTO public.ingredient (name, description)
VALUES ('Goat cheese', null);
INSERT INTO public.ingredient (name, description)
VALUES ('Reblochon', null);

-- STOCK

INSERT INTO public.stock (ingredient_id, sale_store_siret, quantity)
VALUES (1, 12345678912345, 30000);
INSERT INTO public.stock (ingredient_id, sale_store_siret, quantity)
VALUES (2, 12345678912345, 5000);
INSERT INTO public.stock (ingredient_id, sale_store_siret, quantity)
VALUES (3, 12345678912345, 5000);
INSERT INTO public.stock (ingredient_id, sale_store_siret, quantity)
VALUES (4, 12345678912345, 5000);
INSERT INTO public.stock (ingredient_id, sale_store_siret, quantity)
VALUES (5, 12345678912345, 8000);
INSERT INTO public.stock (ingredient_id, sale_store_siret, quantity)
VALUES (6, 12345678912345, 30000);
INSERT INTO public.stock (ingredient_id, sale_store_siret, quantity)
VALUES (7, 12345678912345, 3000);
INSERT INTO public.stock (ingredient_id, sale_store_siret, quantity)
VALUES (8, 12345678912345, 8000);
INSERT INTO public.stock (ingredient_id, sale_store_siret, quantity)
VALUES (9, 12345678912345, 8000);
INSERT INTO public.stock (ingredient_id, sale_store_siret, quantity)
VALUES (10, 12345678912345, 20000);
INSERT INTO public.stock (ingredient_id, sale_store_siret, quantity)
VALUES (11, 12345678912345, 20000);
INSERT INTO public.stock (ingredient_id, sale_store_siret, quantity)
VALUES (12, 12345678912345, 20000);
INSERT INTO public.stock (ingredient_id, sale_store_siret, quantity)
VALUES (13, 12345678912345, 20000);
INSERT INTO public.stock (ingredient_id, sale_store_siret, quantity)
VALUES (14, 12345678912345, 20000);

INSERT INTO public.stock (ingredient_id, sale_store_siret, quantity)
VALUES (1, 23456789123456, 30000);
INSERT INTO public.stock (ingredient_id, sale_store_siret, quantity)
VALUES (2, 23456789123456, 5000);
INSERT INTO public.stock (ingredient_id, sale_store_siret, quantity)
VALUES (3, 23456789123456, 5000);
INSERT INTO public.stock (ingredient_id, sale_store_siret, quantity)
VALUES (4, 23456789123456, 5000);
INSERT INTO public.stock (ingredient_id, sale_store_siret, quantity)
VALUES (5, 23456789123456, 8000);
INSERT INTO public.stock (ingredient_id, sale_store_siret, quantity)
VALUES (6, 23456789123456, 30000);
INSERT INTO public.stock (ingredient_id, sale_store_siret, quantity)
VALUES (7, 23456789123456, 3000);
INSERT INTO public.stock (ingredient_id, sale_store_siret, quantity)
VALUES (8, 23456789123456, 8000);
INSERT INTO public.stock (ingredient_id, sale_store_siret, quantity)
VALUES (9, 23456789123456, 8000);
INSERT INTO public.stock (ingredient_id, sale_store_siret, quantity)
VALUES (10, 23456789123456, 20000);
INSERT INTO public.stock (ingredient_id, sale_store_siret, quantity)
VALUES (11, 23456789123456, 20000);
INSERT INTO public.stock (ingredient_id, sale_store_siret, quantity)
VALUES (12, 23456789123456, 20000);
INSERT INTO public.stock (ingredient_id, sale_store_siret, quantity)
VALUES (13, 23456789123456, 20000);
INSERT INTO public.stock (ingredient_id, sale_store_siret, quantity)
VALUES (14, 23456789123456, 20000);

-- CATEGORY

INSERT INTO public.category (name) VALUES ('Cheeses');
INSERT INTO public.category (name) VALUES ('Meats');
INSERT INTO public.category (name) VALUES ('Fishes');
INSERT INTO public.category (name) VALUES ('Fruits');

-- PIZZA

INSERT INTO public.pizza (name, price, recipe, url_picture, description)
VALUES ('Honey goat', 10.5, 'Préchauffer le four à 220 °C.
Couper le rondin de chèvre en tranches.
Étendre la pâte à pizza et la déposer sur une plaque à pâtisserie allant au four recouverte de papier parchemin.
Étendre la sauce tomate dessus.
Déposer les tranches de chèvre sur le dessus et saupoudrer de gruyère râpé.
Saler, poivrer et verser le miel et l''huile d''olive.
Cuire au four de 15 à 20 minutes.', null, 'Pizza au fromage de chèvre recouverte de miel.');

INSERT INTO public.pizza (name, price, recipe, url_picture, description)
VALUES ('Pizza 4 Fromages', 12, 'Préchauffez le four à 220 °C.
Égouttez la mozzarella et coupez-la en rondelles.
Étalez la pâte à pizza et déposez-la sur une plaque allant au four recouverte de papier sulfurisé.
Étalez le coulis de tomates par-dessus.
Déposez les tranches de mozzarella puis parsemez de Comté et de gruyère râpé.
Émiettez le Roquefort sur la pizza.
Poivrez et parsemez de thym.
Enfournez durant 15 à 20 min.', null, 'Pizza aux 4 fromages.');

-- PIZZA CATEGORY

INSERT INTO public.pizza_category (pizza_id, category_name) VALUES (1, 'Cheeses');
INSERT INTO public.pizza_category (pizza_id, category_name) VALUES (2, 'Cheeses');
INSERT INTO public.pizza_category (pizza_id, category_name) VALUES (2, 'Meats');

-- INGREDIENT QUANTITY

INSERT INTO public.ingredient_quantity (ingredient_id, pizza_id, quantity)
VALUES (1, 1, 400);
INSERT INTO public.ingredient_quantity (ingredient_id, pizza_id, quantity)
VALUES (2, 1, 25);
INSERT INTO public.ingredient_quantity (ingredient_id, pizza_id, quantity)
VALUES (3, 1, 4);
INSERT INTO public.ingredient_quantity (ingredient_id, pizza_id, quantity)
VALUES (4, 1, 2);
INSERT INTO public.ingredient_quantity (ingredient_id, pizza_id, quantity)
VALUES (5, 1, 4);
INSERT INTO public.ingredient_quantity (ingredient_id, pizza_id, quantity)
VALUES (6, 1, 40);
INSERT INTO public.ingredient_quantity (ingredient_id, pizza_id, quantity)
VALUES (7, 1, 8);
INSERT INTO public.ingredient_quantity (ingredient_id, pizza_id, quantity)
VALUES (13, 1, 30);

INSERT INTO public.ingredient_quantity (ingredient_id, pizza_id, quantity)
VALUES (1, 2, 400);
INSERT INTO public.ingredient_quantity (ingredient_id, pizza_id, quantity)
VALUES (2, 2, 25);
INSERT INTO public.ingredient_quantity (ingredient_id, pizza_id, quantity)
VALUES (3, 2, 4);
INSERT INTO public.ingredient_quantity (ingredient_id, pizza_id, quantity)
VALUES (4, 2, 2);
INSERT INTO public.ingredient_quantity (ingredient_id, pizza_id, quantity)
VALUES (5, 2, 4);
INSERT INTO public.ingredient_quantity (ingredient_id, pizza_id, quantity)
VALUES (6, 2, 40);
INSERT INTO public.ingredient_quantity (ingredient_id, pizza_id, quantity)
VALUES (7, 2, 8);
INSERT INTO public.ingredient_quantity (ingredient_id, pizza_id, quantity)
VALUES (10, 2, 30);
INSERT INTO public.ingredient_quantity (ingredient_id, pizza_id, quantity)
VALUES (11, 2, 30);
INSERT INTO public.ingredient_quantity (ingredient_id, pizza_id, quantity)
VALUES (12, 2, 30);
INSERT INTO public.ingredient_quantity (ingredient_id, pizza_id, quantity)
VALUES (14, 2, 30);

-- BASKET

INSERT INTO public.basket (user_id) VALUES (4);
INSERT INTO public.basket (user_id) VALUES (5);

-- BASKET LIGNE

INSERT INTO public.basket_ligne (basket_id, pizza_id, quantity) VALUES (4, 1, 5);
INSERT INTO public.basket_ligne (basket_id, pizza_id, quantity) VALUES (4, 2, 3);
INSERT INTO public.basket_ligne (basket_id, pizza_id, quantity) VALUES (5, 2, 1);

-- PIZZA ORDER

INSERT INTO public.pizza_order (date_time, order_status_name, total_cost, basket_id, user_id, address_id)
VALUES ('2019-11-10 18:05', 'Awaiting prepare', 80.5, 4, 4, 1);
INSERT INTO public.pizza_order (date_time, order_status_name, total_cost, basket_id, user_id, address_id)
VALUES ('2019-11-12 18:05', 'Awaiting prepare', 12, 5, 5, 1);