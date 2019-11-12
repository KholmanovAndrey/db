use shop;

-- 1 �������
drop table if exists logs;
create table logs(
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	`table` VARCHAR(30),
	element_id BIGINT UNSIGNED DEFAULT 0 NOT NULL,
	name VARCHAR(254)
) ENGINE=Archive;

INSERT INTO users (name)
    VALUES('������');
INSERT INTO logs (element_id, `table`, name)
    VALUES(LAST_INSERT_ID(), 'users', '������');
       
INSERT INTO catalogs (name)
    VALUES('������ ����');
INSERT INTO logs (element_id, `table`, name)
    VALUES(LAST_INSERT_ID(), 'catalogs', '������ ����');
   
INSERT INTO products (name)
    VALUES('80��');
INSERT INTO logs (element_id, `table`, name)
    VALUES(LAST_INSERT_ID(), 'products', '80��');
    
-- 2 �������
