INSERT INTO d_supplier_cities (supplier_city_name)
SELECT DISTINCT supplier_city
FROM staging.mock_data
WHERE supplier_city IS NOT NULL;

INSERT INTO d_supplier_countries (supplier_country_name)
SELECT DISTINCT supplier_country
FROM staging.mock_data
WHERE supplier_country IS NOT NULL;

INSERT INTO d_supplier_addresses (supplier_address)
SELECT DISTINCT supplier_address
FROM staging.mock_data
WHERE supplier_address IS NOT NULL;


INSERT INTO d_supplier (
    supplier_name,
    supplier_contact,
    supplier_email,
    supplier_phone,
    supplier_address_id,
    supplier_city_id,
    supplier_country_id
)
SELECT DISTINCT
    m.supplier_name,
    m.supplier_contact,
    m.supplier_email,
    m.supplier_phone,
    sa.supplier_address_id,
    sc.supplier_city_id,
    sct.supplier_country_id
FROM staging.mock_data m
LEFT JOIN d_supplier_addresses sa ON m.supplier_address = sa.supplier_address
LEFT JOIN d_supplier_cities sc ON m.supplier_city = sc.supplier_city_name
LEFT JOIN d_supplier_countries sct ON m.supplier_country = sct.supplier_country_name;

