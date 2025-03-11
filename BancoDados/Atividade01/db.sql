-- Tables
CREATE TABLE IF NOT EXISTS tables(
    id LONG NOT NULL PRIMARY KEY AUTO_INCREMENT,
    locations VARCHAR(160) NOT NULL,
    hourValues DOUBLE NOT NULL
);
-- Clients
CREATE TABLE IF NOT EXISTS clients(
    id LONG NOT NULL PRIMARY KEY AUTO_INCREMENT,
    names VARCHAR(160) NOT NULL,
    email VARCHAR(160) NOT NULL
);
-- Products
CREATE TABLE IF NOT EXISTS products(
    id LONG NOT NULL PRIMARY KEY AUTO_INCREMENT,
    names VARCHAR(160) NOT NULL,
    price DOUBLE NOT NULL
);
-- Schedulings
CREATE TABLE IF NOT EXISTS schedulings(
    id LONG NOT NULL PRIMARY KEY AUTO_INCREMENT,
    tId LONG NOT NULL,
    cId LONG NOT NULL,
    dates DATE NOT NULL DEFAULT CURRENT_DATE,
    status ENUM ('reserved', 'canceled', 'open','payment','closed') NOT NULL DEFAULT 'reserved',
    FOREIGN KEY (tId) REFERENCES tables(id),
    FOREIGN KEY (cId) REFERENCES clients(id)
);
-- Product schedules
CREATE TABLE IF NOT EXISTS productsche(
    id LONG NOT NULL PRIMARY KEY AUTO_INCREMENT,
    pId LONG NOT NULL,
    sId LONG NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (pId) REFERENCES products(id),
    FOREIGN KEY (sId) REFERENCES schedulings(id)
);