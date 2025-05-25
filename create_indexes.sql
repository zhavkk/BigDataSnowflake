-- Создание индексов для оптимизации JOIN'ов в f_sales
-- Обновлено для корректной структуры с SERIAL ID и JOIN'ами по полям

-- Индексы для staging.mock_data (для JOIN'ов в DML)
CREATE INDEX IF NOT EXISTS idx_mock_data_customer_email ON staging.mock_data(customer_email);
CREATE INDEX IF NOT EXISTS idx_mock_data_seller_email ON staging.mock_data(seller_email);
CREATE INDEX IF NOT EXISTS idx_mock_data_product_name ON staging.mock_data(product_name);
CREATE INDEX IF NOT EXISTS idx_mock_data_store_name ON staging.mock_data(store_name);
CREATE INDEX IF NOT EXISTS idx_mock_data_supplier_name ON staging.mock_data(supplier_name);
CREATE INDEX IF NOT EXISTS idx_mock_data_sale_date ON staging.mock_data(sale_date);

-- Индексы для dimension tables (для JOIN'ов)
CREATE INDEX IF NOT EXISTS idx_d_customer_email ON d_customer(customer_email);
CREATE INDEX IF NOT EXISTS idx_d_seller_email ON d_seller(seller_email);
CREATE INDEX IF NOT EXISTS idx_d_product_name ON d_product(product_name);
CREATE INDEX IF NOT EXISTS idx_d_store_name ON d_store(store_name);
CREATE INDEX IF NOT EXISTS idx_d_supplier_name ON d_supplier(supplier_name);
CREATE INDEX IF NOT EXISTS idx_d_date_date ON d_date(date);

-- Индексы для f_sales таблицы (для аналитических запросов)
CREATE INDEX IF NOT EXISTS idx_f_sales_customer ON f_sales(customer_id);
CREATE INDEX IF NOT EXISTS idx_f_sales_seller ON f_sales(seller_id);
CREATE INDEX IF NOT EXISTS idx_f_sales_product ON f_sales(product_id);
CREATE INDEX IF NOT EXISTS idx_f_sales_store ON f_sales(store_id);
CREATE INDEX IF NOT EXISTS idx_f_sales_supplier ON f_sales(supplier_id);
CREATE INDEX IF NOT EXISTS idx_f_sales_date ON f_sales(sale_date_id);

-- Composite индексы для часто используемых комбинаций
CREATE INDEX IF NOT EXISTS idx_f_sales_customer_date ON f_sales(customer_id, sale_date_id);
CREATE INDEX IF NOT EXISTS idx_f_sales_product_date ON f_sales(product_id, sale_date_id);
CREATE INDEX IF NOT EXISTS idx_f_sales_seller_date ON f_sales(seller_id, sale_date_id);

-- Индекс для аналитических запросов по суммам
CREATE INDEX IF NOT EXISTS idx_f_sales_price_quantity ON f_sales(sale_total_price, sale_quantity);
