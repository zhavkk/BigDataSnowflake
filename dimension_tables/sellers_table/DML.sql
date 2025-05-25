INSERT INTO d_seller_country (seller_country_name)
SELECT DISTINCT seller_country
FROM staging.mock_data
WHERE seller_country IS NOT NULL;

INSERT INTO d_seller_postal_code (seller_postal_code)
SELECT DISTINCT seller_postal_code
FROM staging.mock_data
WHERE seller_postal_code IS NOT NULL;

INSERT INTO d_seller (seller_first_name, seller_last_name,seller_email, seller_postal_code_id, seller_country_id)
SELECT DISTINCT
    m.seller_first_name,
    m.seller_last_name,
    m.seller_email,
    sp.seller_postal_code_id,
    sc.seller_country_id
FROM staging.mock_data m
LEFT JOIN d_seller_postal_code sp ON m.seller_postal_code = sp.seller_postal_code
LEFT JOIN d_seller_country sc ON m.seller_country = sc.seller_country_name;

