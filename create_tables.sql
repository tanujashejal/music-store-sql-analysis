CREATE TABLE artists (
    artist_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE albums (
    album_id SERIAL PRIMARY KEY,
    title VARCHAR(160) NOT NULL,
    artist_id INT REFERENCES artists(artist_id)
);

CREATE TABLE genres (
    genre_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE tracks (
    track_id SERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    album_id INT REFERENCES albums(album_id),
    genre_id INT REFERENCES genres(genre_id),
    composer VARCHAR(220),
    milliseconds INT,
    unit_price NUMERIC(10,2)
);

CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    email VARCHAR(100),
    country VARCHAR(50)
);

CREATE TABLE invoices (
    invoice_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    invoice_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    billing_country VARCHAR(50),
    total NUMERIC(10,2)
);

CREATE TABLE invoice_items (
    invoice_line_id SERIAL PRIMARY KEY,
    invoice_id INT REFERENCES invoices(invoice_id),
    track_id INT REFERENCES tracks(track_id),
    unit_price NUMERIC(10,2) NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0)
);