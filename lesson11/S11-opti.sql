use shop;

-- 1 задание
drop table if exists logs;
create table logs(
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	`table` VARCHAR(30),
	element_id BIGINT UNSIGNED DEFAULT 0 NOT NULL,
	name VARCHAR(254)
) ENGINE=Archive;

INSERT INTO users (name)
    VALUES('Никита');
INSERT INTO logs (element_id, `table`, name)
    VALUES(LAST_INSERT_ID(), 'users', 'Никита');
       
INSERT INTO catalogs (name)
    VALUES('Жеский диск');
INSERT INTO logs (element_id, `table`, name)
    VALUES(LAST_INSERT_ID(), 'catalogs', 'Жеский диск');
   
INSERT INTO products (name)
    VALUES('80ГБ');
INSERT INTO logs (element_id, `table`, name)
    VALUES(LAST_INSERT_ID(), 'products', '80ГБ');
    
-- 2 задание
