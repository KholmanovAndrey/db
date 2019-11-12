use shop;

create table logs(
	id SERIAL PRIMARY KEY,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	`table` VARCHAR(30),
	element_id BIGINT UNSIGNED DEFAULT 0 NOT NULL,
	name VARCHAR(254)
) ;