CREATE TABLE IF NOT EXISTS d_supplier_cities (
    supplier_city_id SERIAL PRIMARY KEY,
    supplier_city_name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS d_supplier_countries (
    supplier_country_id SERIAL PRIMARY KEY,
    supplier_country_name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS d_supplier_addresses (
    supplier_address_id SERIAL PRIMARY KEY,
    supplier_address VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS d_supplier (
    supplier_id SERIAL PRIMARY KEY,
    supplier_name VARCHAR(50)  ,
    supplier_contact VARCHAR(50),
    supplier_email VARCHAR(50),
    supplier_phone VARCHAR(50),
    supplier_address_id INTEGER REFERENCES d_supplier_addresses(supplier_address_id),
    supplier_city_id INTEGER REFERENCES d_supplier_cities(supplier_city_id),
    supplier_country_id INTEGER REFERENCES d_supplier_countries(supplier_country_id)
);

CREATE INDEX idx_d_supplier_name ON d_supplier(supplier_name);