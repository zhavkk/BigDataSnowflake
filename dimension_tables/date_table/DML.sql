INSERT INTO d_date_day (day_num)
SELECT DISTINCT EXTRACT(DAY FROM TO_DATE(sale_date, 'MM-DD-YYYY'))::INTEGER
FROM staging.mock_data
WHERE sale_date IS NOT NULL;

INSERT INTO d_date_month (month_num)
SELECT DISTINCT EXTRACT(MONTH FROM TO_DATE(sale_date, 'MM-DD-YYYY'))::INTEGER
FROM staging.mock_data
WHERE sale_date IS NOT NULL;

INSERT INTO d_date (date, day_id, month_id, year)
SELECT DISTINCT
    TO_DATE(m.sale_date, 'MM-DD-YYYY'),
    dd.day_id,
    dm.month_id,
    EXTRACT(YEAR FROM TO_DATE(m.sale_date, 'MM-DD-YYYY'))::INTEGER
FROM staging.mock_data m
JOIN d_date_day dd 
    ON dd.day_num = EXTRACT(DAY FROM TO_DATE(m.sale_date, 'MM-DD-YYYY'))::INTEGER
JOIN d_date_month dm 
    ON dm.month_num = EXTRACT(MONTH FROM TO_DATE(m.sale_date, 'MM-DD-YYYY'))::INTEGER
WHERE m.sale_date IS NOT NULL;
