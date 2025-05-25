CREATE TABLE f_sales ( 
    sale_id SERIAL PRIMARY KEY,
    sale_date_id INTEGER NULL REFERENCES d_date(date_id),
    customer_id INTEGER NULL REFERENCES d_customer(customer_id),
    seller_id INTEGER NULL REFERENCES d_seller(seller_id),
    product_id INTEGER NULL REFERENCES d_product(product_id),
    store_id INTEGER NULL REFERENCES d_store(store_id),
    supplier_id INTEGER NULL REFERENCES d_supplier(supplier_id),
    sale_quantity INTEGER NULL,
    sale_total_price REAL NULL
);
