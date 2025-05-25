CREATE TABLE IF NOT EXISTS d_store_locations (
    store_location_id SERIAL PRIMARY KEY,
    store_location_name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS d_store_cities (
    store_city_id SERIAL PRIMARY KEY,
    store_city_name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS d_store_states (
    store_state_id SERIAL PRIMARY KEY,
    store_state_name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS d_store_countries (
    store_country_id SERIAL PRIMARY KEY,
    store_country_name VARCHAR(50)
);



CREATE TABLE IF NOT EXISTS d_store (
    store_id SERIAL PRIMARY KEY,
    store_name VARCHAR(50) NULL,
    store_email VARCHAR(50),
    store_phone VARCHAR(50),
    store_location_id INTEGER REFERENCES d_store_locations(store_location_id),
    store_city_id INTEGER REFERENCES d_store_cities(store_city_id),
    store_state_id INTEGER REFERENCES d_store_states(store_state_id),
    store_country_id INTEGER REFERENCES d_store_countries(store_country_id)
);


CREATE INDEX idx_d_store_name ON d_store(store_name);