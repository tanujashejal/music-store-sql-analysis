-- 1. Insert Artists
INSERT INTO artists (name)
VALUES
    ('Arijit Singh'),
    ('A. R. Rahman'),
    ('Shreya Ghoshal'),
    ('Sonu Nigam'),
    ('Taylor Swift');

-- 2. Insert Albums
INSERT INTO albums (title, artist_id)
VALUES
    ('Melody Collection', 1),
    ('Music Magic', 2),
    ('Sweet Melodies', 3),
    ('Golden Hits', 4),
    ('Pop Collection', 5);

-- 3. Insert Genres
INSERT INTO genres (name)
VALUES
    ('Rock'),
    ('Jazz'),
    ('Pop'),
    ('Metal'),
    ('Blues'),
    ('Classical'),
    ('Hip Hop'),
    ('Electronic');

-- 4. Insert Tracks
INSERT INTO tracks
(name, album_id, genre_id, composer, milliseconds, unit_price)
VALUES
    ('Tum Hi Ho', 1, 3, 'Mithoon', 262000, 1.99),
    ('Jai Ho', 2, 6, 'A. R. Rahman', 300000, 1.99),
    ('Melody Song', 3, 2, 'Unknown', 240000, 0.99),
    ('Rock Anthem', 4, 1, 'Unknown', 210000, 0.99),
    ('Pop Song', 5, 3, 'Unknown', 220000, 1.49);

-- 5. Insert Customers
INSERT INTO customers
(first_name, last_name, email, country)
VALUES
    ('Tanuja', 'Shejal', 'tanuja@example.com', 'India'),
    ('Rahul', 'Patil', 'rahul@example.com', 'India'),
    ('Priya', 'Sharma', 'priya@example.com', 'USA'),
    ('Amit', 'Joshi', 'amit@example.com', 'UK'),
    ('Sneha', 'Deshmukh', 'sneha@example.com', 'India');

-- 6. Insert Invoices
INSERT INTO invoices
(customer_id, billing_country, total)
VALUES
    (1, 'India', 19.99),
    (2, 'India', 29.99),
    (3, 'USA', 15.50),
    (4, 'UK', 39.99),
    (5, 'India', 24.99);

-- 7. Insert Invoice Items
INSERT INTO invoice_items
(invoice_id, track_id, unit_price, quantity)
VALUES
    (1, 1, 1.99, 2),
    (1, 2, 1.99, 3),
    (2, 3, 0.99, 2),
    (3, 4, 0.99, 4),
    (4, 5, 1.49, 3),
    (5, 1, 1.99, 1);