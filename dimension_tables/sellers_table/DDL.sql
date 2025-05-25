CREATE TABLE IF NOT EXISTS d_seller_country (
    seller_country_id SERIAL PRIMARY KEY,
    seller_country_name VARCHAR(50)
);
CREATE TABLE IF NOT EXISTS d_seller_postal_code (
    seller_postal_code_id SERIAL PRIMARY KEY,
    seller_postal_code VARCHAR(50)
);
CREATE TABLE IF NOT EXISTS d_seller (
    seller_id SERIAL PRIMARY KEY,
    seller_first_name VARCHAR(50) NULL,
    seller_last_name VARCHAR(50) NULL,
    seller_email VARCHAR(50) NULL UNIQUE,
    seller_postal_code_id INTEGER NULL REFERENCES d_seller_postal_code(seller_postal_code_id),
    seller_country_id INTEGER NULL REFERENCES d_seller_country(seller_country_id)
);

CREATE UNIQUE INDEX idx_d_seller_email ON d_seller(seller_email);