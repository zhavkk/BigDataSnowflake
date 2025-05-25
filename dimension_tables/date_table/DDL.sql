	-- sale_date varchar(50) NULL,

CREATE TABLE IF NOT EXISTS d_date_month (
    month_id SERIAL PRIMARY KEY,
    month_num INTEGER NULL
);

CREATE TABLE IF NOT EXISTS d_date_day (
    day_id SERIAL PRIMARY KEY,
    day_num INTEGER NULL
);


CREATE TABLE IF NOT EXISTS d_date (
    date_id SERIAL PRIMARY KEY,
    date VARCHAR(50) NULL UNIQUE,
    day_id INTEGER REFERENCES d_date_day(day_id),
    month_id INTEGER REFERENCES d_date_month(month_id),
    year INTEGER
);

CREATE UNIQUE INDEX idx_d_date_date ON d_date(date);