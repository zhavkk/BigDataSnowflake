INSERT INTO d_pet_breed (pet_breed_name) SELECT DISTINCT customer_pet_breed
FROM staging.mock_data
WHERE customer_pet_breed IS NOT NULL;

INSERT INTO d_pet_type (pet_type_name) SELECT DISTINCT customer_pet_type
FROM staging.mock_data
WHERE customer_pet_type IS NOT NULL;

INSERT INTO d_pet_category(pet_category_name)
  SELECT DISTINCT pet_category
  FROM staging.mock_data
  WHERE pet_category IS NOT NULL;

INSERT INTO d_pets (pet_name, pet_breed_id, pet_type_id)
SELECT DISTINCT
    m.customer_pet_name,
    pb.pet_breed_id,
    pt.pet_type_id
FROM staging.mock_data m
JOIN d_pet_breed pb ON m.customer_pet_breed = pb.pet_breed_name
JOIN d_pet_type pt ON m.customer_pet_type = pt.pet_type_name
WHERE m.customer_pet_name IS NOT NULL;

INSERT INTO d_customer_postal_code (customer_postal_code) SELECT DISTINCT customer_postal_code
FROM staging.mock_data
WHERE customer_postal_code IS NOT NULL;

INSERT INTO d_customer_country (customer_country_name) SELECT DISTINCT customer_country
FROM staging.mock_data
WHERE customer_country IS NOT NULL;

INSERT INTO d_customer (customer_first_name, customer_last_name, customer_age, customer_email, pet_id, customer_postal_code_id, customer_country_id)
SELECT
    m.customer_first_name,
    m.customer_last_name,
    m.customer_age,
    m.customer_email,
    p.pet_id,
    cp.customer_postal_code_id,
    cc.customer_country_id
FROM staging.mock_data m
LEFT JOIN d_customer_postal_code cp ON m.customer_postal_code = cp.customer_postal_code
LEFT JOIN d_customer_country cc ON m.customer_country = cc.customer_country_name
LEFT JOIN d_pets p ON m.customer_pet_name = p.pet_name
    AND EXISTS (
        SELECT 1 FROM d_pet_breed pb 
        WHERE pb.pet_breed_name = m.customer_pet_breed 
        AND pb.pet_breed_id = p.pet_breed_id
    )
    AND EXISTS (
        SELECT 1 FROM d_pet_type pt 
        WHERE pt.pet_type_name = m.customer_pet_type 
        AND pt.pet_type_id = p.pet_type_id
    )
WHERE m.customer_first_name IS NOT NULL
  AND m.customer_last_name IS NOT NULL
  AND m.customer_age IS NOT NULL
  AND m.customer_email IS NOT NULL;



-- INSERT INTO d_customer_pets (customer_id, pet_id)
-- SELECT DISTINCT
--     c.customer_id,
--     p.pet_id
-- FROM staging.mock_data m
-- JOIN d_customer c ON m.customer_email = c.customer_email
-- JOIN d_pets p ON m.customer_pet_name = p.pet_name
--     AND EXISTS (
--         SELECT 1 FROM d_pet_breed pb 
--         WHERE pb.pet_breed_name = m.customer_pet_breed 
--         AND pb.pet_breed_id = p.pet_breed_id
--     )
--     AND EXISTS (
--         SELECT 1 FROM d_pet_type pt 
--         WHERE pt.pet_type_name = m.customer_pet_type 
--         AND pt.pet_type_id = p.pet_type_id
--     )
-- WHERE m.customer_email IS NOT NULL
--   AND m.customer_pet_name IS NOT NULL;
