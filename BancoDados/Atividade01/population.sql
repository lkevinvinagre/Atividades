-- Population of Tables
INSERT INTO tables (locations, hourValues) VALUES
    ('Table 14', 4.0),
    ('Table 12', 3.0),
    ('Table 10', 5.0);

-- Population of Clients
INSERT INTO clients (names, email) VALUES
    ('Laurindo','email@email'),
    ('Claudia','email1@email'),
    ('Laura','email2@email');

-- Population of Products
INSERT INTO products (names, price) VALUES
    ('Ovo Frito', 4.0),
    ('Hamburger', 10.0),
    ('Picanha', 200.0),
    ('Café', 48.0);
-- Population of Schedulings
INSERT INTO schedulings (tId, cId, dates, status) VALUES
    (1, 2, '2025-03-29', 'reserved'),
    (3, 1, '2025-03-01', 'reserved');
-- Population of Product schedules
INSERT INTO productsche (pId, eId, quantity) VALUES
    (1, 1, 1),
    (1, 2, 2),
    (2, 1, 1);