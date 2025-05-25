INSERT INTO d_store_locations (store_location_name)
SELECT DISTINCT store_location
FROM staging.mock_data
WHERE store_location IS NOT NULL;

INSERT INTO d_store_cities (store_city_name)
SELECT DISTINCT store_city
FROM staging.mock_data
WHERE store_city IS NOT NULL;

INSERT INTO d_store_states (store_state_name)
SELECT DISTINCT store_state
FROM staging.mock_data
WHERE store_state IS NOT NULL;

INSERT INTO d_store_countries (store_country_name)
SELECT DISTINCT store_country
FROM staging.mock_data
WHERE store_country IS NOT NULL;

INSERT INTO d_store (
    store_name,
    store_email,
    store_phone,
    store_location_id,
    store_city_id,
    store_state_id,
    store_country_id
)
SELECT DISTINCT
    m.store_name,
    m.store_email,
    m.store_phone,
    sl.store_location_id,
    sc.store_city_id,
    ss.store_state_id,
    sct.store_country_id
FROM staging.mock_data m
LEFT JOIN d_store_locations sl ON m.store_location = sl.store_location_name
LEFT JOIN d_store_cities sc ON m.store_city = sc.store_city_name
LEFT JOIN d_store_states ss ON m.store_state = ss.store_state_name
LEFT JOIN d_store_countries sct ON m.store_country = sct.store_country_name;