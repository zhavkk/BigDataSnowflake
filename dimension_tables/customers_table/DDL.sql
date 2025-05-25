/*---
	customer_first_name varchar(50) NULL,
	customer_last_name varchar(50) NULL,
	customer_age INTEGER NULL,
	customer_email varchar(50) NULL,
	customer_country varchar(50) NULL,
	customer_postal_code varchar(50) NULL,
	customer_pet_type varchar(50) NULL,
	customer_pet_name varchar(50) NULL,
	customer_pet_breed varchar(50) NULL,
*/---

CREATE TABLE IF NOT EXISTS d_pet_breed (
    pet_breed_id SERIAL PRIMARY KEY,
    pet_breed_name VARCHAR(50) NOT NULL
);
CREATE TABLE IF NOT EXISTS d_pet_type (
    pet_type_id SERIAL PRIMARY KEY,
    pet_type_name VARCHAR(50) NOT NULL
);
CREATE TABLE IF NOT EXISTS d_pet_category (
  pet_category_id   SERIAL PRIMARY KEY,
  pet_category_name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS d_pets (
    pet_id SERIAL PRIMARY KEY,
    pet_name VARCHAR(50) NOT NULL,
    pet_breed_id INTEGER REFERENCES d_pet_breed(pet_breed_id),
    pet_type_id INTEGER REFERENCES d_pet_type(pet_type_id),
    pet_category_id INTEGER REFERENCES d_pet_category(pet_category_id)
);


CREATE TABLE IF NOT EXISTS d_customer_postal_code (
    customer_postal_code_id SERIAL PRIMARY KEY,
    customer_postal_code VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS d_customer_country (
    customer_country_id SERIAL PRIMARY KEY,
    customer_country_name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS d_customer (
    customer_id SERIAL PRIMARY KEY,
    customer_first_name VARCHAR(50) NOT NULL,
    customer_last_name VARCHAR(50) NOT NULL,
    customer_age INTEGER NOT NULL,
    customer_email VARCHAR(50) NOT NULL UNIQUE,
    pet_id INTEGER NULL REFERENCES d_pets(pet_id),
    customer_postal_code_id INTEGER REFERENCES d_customer_postal_code(customer_postal_code_id),
    customer_country_id INTEGER REFERENCES d_customer_country(customer_country_id)
);


CREATE UNIQUE INDEX idx_d_customer_email ON d_customer(customer_email);


-- CREATE TABLE IF NOT EXISTS d_customer_pets (
--     customer_id INTEGER REFERENCES d_customer(customer_id),
--     pet_id INTEGER REFERENCES d_pets(pet_id),
--     PRIMARY KEY (customer_id, pet_id)
-- );в