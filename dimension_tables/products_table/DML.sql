INSERT INTO d_product_category (product_category_name)
SELECT DISTINCT product_category
FROM staging.mock_data
WHERE product_category IS NOT NULL;


INSERT INTO d_product_brand (product_brand_name)
SELECT DISTINCT product_brand
FROM staging.mock_data
WHERE product_brand IS NOT NULL;

INSERT INTO d_product_material (product_material_name)
SELECT DISTINCT product_material
FROM staging.mock_data
WHERE product_material IS NOT NULL;

INSERT INTO d_product_color (product_color_name)
SELECT DISTINCT product_color
FROM staging.mock_data
WHERE product_color IS NOT NULL;

INSERT INTO d_product_expiry_date (product_expiry_date)
SELECT DISTINCT TO_DATE(product_expiry_date,'MM-DD-YYYY')
FROM staging.mock_data
WHERE product_expiry_date IS NOT NULL;

INSERT INTO d_product_release_date (product_release_date)
SELECT DISTINCT TO_DATE(product_release_date,'MM-DD-YYYY')
FROM staging.mock_data
WHERE product_release_date IS NOT NULL;

INSERT INTO d_product_size (product_size_name)
SELECT DISTINCT product_size
FROM staging.mock_data
WHERE product_size IS NOT NULL;

INSERT INTO d_product (product_name, product_price, product_quantity, product_weight, product_description, product_rating, product_reviews, product_category_id, product_brand_id, product_material_id, product_color_id, product_size_id, product_expiry_date_id, product_release_date_id)
SELECT DISTINCT
    m.product_name,
    m.product_price,
    m.product_quantity,
    m.product_weight,
    m.product_description,
    m.product_rating,
    m.product_reviews,
    pc.product_category_id,
    pb.product_brand_id,
    pm.product_material_id,
    pco.product_color_id,
    ps.product_size_id,
    pe.product_expiry_date_id,
    pr.product_release_date_id
FROM staging.mock_data m
LEFT JOIN d_product_category pc ON m.product_category = pc.product_category_name
LEFT JOIN d_product_brand pb ON m.product_brand = pb.product_brand_name
LEFT JOIN d_product_material pm ON m.product_material = pm.product_material_name
LEFT JOIN d_product_color pco ON m.product_color = pco.product_color_name
LEFT JOIN d_product_size ps ON m.product_size = ps.product_size_name
LEFT JOIN d_product_expiry_date pe 
  ON TO_DATE(m.product_expiry_date, 'MM-DD-YYYY') = pe.product_expiry_date
LEFT JOIN d_product_release_date pr 
  ON TO_DATE(m.product_release_date, 'MM-DD-YYYY') = pr.product_release_date
WHERE m.product_name IS NOT NULL
  AND m.product_price IS NOT NULL
  AND m.product_quantity IS NOT NULL
  AND m.product_weight IS NOT NULL;
