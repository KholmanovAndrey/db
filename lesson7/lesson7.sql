use shop;

insert ignore into users 
	(name)
values
	('Антон'),
	('Андрей'),
	('Николай'),
	('Виктор');

insert ignore into orders 
	(user_id)
values
	(1),
	(1),
	(2),
	(3);

insert ignore into products 
	(name, catalog_id)
values
	('Intel Core i3-8100', 1),
	('Intel Core i5-7400', 1),
	('Asus Rog Maximus X Hero', 2),
	('Radion HD 7870', 3);


-- 1 задаине
select 
	count(*),
	(select name from users where id=user_id) as `user`
from orders
group by `user`;


-- 2 задание
select
	*,
	(select name from catalogs where catalog_id=id) as `catalog`
from products;

-- 3 задание
select 
	id,
	(select name from cities where `from`=`label`) as `from`,
	(select name from cities where `to`=`label`) as `to`
from flights;



drop table if exists flights;
create table flights(
	id SERIAL primary key,
	`from` VARCHAR(50),
	`to` VARCHAR(50)
);

drop table if exists cities;
create table cities(
	`label` VARCHAR(50),
	name VARCHAR(50)
);

insert ignore into flights 
	(`from`, `to`)
values
	('moscow', 'omsk'),
	('novgorod', 'kazan');
	
insert ignore into cities 
	(`label`, name)
values
	('moscow', 'Москва'),
	('novgorod', 'Новгород'),
	('omsk', 'Омск'),
	('kazan', 'Казань');