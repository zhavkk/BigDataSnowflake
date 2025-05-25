INSERT INTO f_sales (
    sale_date_id,
    customer_id,
    seller_id,
    product_id,
    store_id,
    supplier_id,
    sale_quantity,
    sale_total_price
)
SELECT
    dd.date_id,
    dc.customer_id,
    ds.seller_id,
    dp.product_id,
    dst.store_id,
    dsup.supplier_id,
    m.sale_quantity,
    m.sale_total_price
FROM staging.mock_data m

LEFT JOIN d_date dd ON dd.date = m.sale_date
LEFT JOIN d_customer dc ON m.customer_email = dc.customer_email
LEFT JOIN d_seller ds ON m.seller_email = ds.seller_email

LEFT JOIN (
  SELECT DISTINCT ON (product_name) * 
  FROM d_product
  ORDER BY product_name, product_id
) dp ON m.product_name = dp.product_name

LEFT JOIN (
  SELECT DISTINCT ON (store_name) * 
  FROM d_store
  ORDER BY store_name, store_id
) dst ON m.store_name = dst.store_name

LEFT JOIN (
  SELECT DISTINCT ON (supplier_name) * 
  FROM d_supplier
  ORDER BY supplier_name, supplier_id
) dsup ON m.supplier_name = dsup.supplier_name;
