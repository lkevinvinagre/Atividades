-- Tables
CREATE TABLE IF NOT EXISTS tables(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    locations VARCHAR(160) NOT NULL,
    hourValues DOUBLE NOT NULL
);
-- Clients
CREATE TABLE IF NOT EXISTS clients(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    names VARCHAR(160) NOT NULL,
    email VARCHAR(160) NOT NULL
);
-- Products
CREATE TABLE IF NOT EXISTS products(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    names VARCHAR(160) NOT NULL,
    price DOUBLE NOT NULL
);
-- Schedulings
CREATE TABLE IF NOT EXISTS schedulings(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tId INT NOT NULL,
    cId INT NOT NULL,
    dates DATE NOT NULL DEFAULT CURRENT_DATE,
    status ENUM ('reserved', 'canceled', 'open','payment','closed') NOT NULL DEFAULT 'reserved',
    FOREIGN KEY (tId) REFERENCES tables(id),
    FOREIGN KEY (cId) REFERENCES clients(id)
);
-- Product schedules
CREATE TABLE IF NOT EXISTS productsche(
    pId INT NOT NULL,
    eId INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (pId) REFERENCES products(id),
    FOREIGN KEY (eId) REFERENCES schedulings(id),
    PRIMARY KEY (pId, sId)
);