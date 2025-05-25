CREATE TABLE IF NOT EXISTS d_product_category (
    product_category_id SERIAL PRIMARY KEY,
    product_category_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS d_product_brand (
    product_brand_id SERIAL PRIMARY KEY,
    product_brand_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS d_product_material (
    product_material_id SERIAL PRIMARY KEY,
    product_material_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS d_product_color (
    product_color_id SERIAL PRIMARY KEY,
    product_color_name VARCHAR(50) NOT NULL UNIQUE
);
-- хотел это в d_date но и так пойдет
CREATE TABLE IF NOT EXISTS d_product_expiry_date (
    product_expiry_date_id SERIAL PRIMARY KEY,
    product_expiry_date DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS d_product_release_date (
    product_release_date_id SERIAL PRIMARY KEY,
    product_release_date DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS d_product_size (
    product_size_id SERIAL PRIMARY KEY,
    product_size_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS d_product (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL ,
    product_price REAL NOT NULL ,
    product_quantity INTEGER NOT NULL,
    product_weight REAL NOT NULL,
    product_description VARCHAR(1024) NOT NULL,
    product_rating REAL,
    product_reviews INTEGER,
    product_category_id INTEGER REFERENCES d_product_category(product_category_id),
    product_brand_id INTEGER REFERENCES d_product_brand(product_brand_id),
    product_material_id INTEGER REFERENCES d_product_material(product_material_id),
    product_color_id INTEGER REFERENCES d_product_color(product_color_id),
    product_size_id INTEGER REFERENCES d_product_size(product_size_id),
    product_expiry_date_id INTEGER REFERENCES d_product_expiry_date(product_expiry_date_id),
    product_release_date_id INTEGER REFERENCES d_product_release_date(product_release_date_id)
);


CREATE INDEX idx_d_product_name_price ON d_product(product_name, product_price);