drop database if exists test_db;
create database test_db;
use test_db;

-- 1 задание
drop table if exists users;
create table users(
	id SERIAL primary key,
	name VARCHAR(255) COMMENT 'Имя покупателя',
	bithday_at DATE COMMENT 'Дата рождения',
	created_at DATETIME,
	updated_at DATETIME
);

insert into users (name)
values 
	('Kholmanov'),
	('Kholmanov'),
	('Kholmanov')
;

update users
set
	created_at = NOW(),
	updated_at = NOW()
;

-- 2 задание
drop table if exists users;
create table users(
	id SERIAL primary key,
	name VARCHAR(255) COMMENT 'Имя покупателя',
	bithday_at DATE COMMENT 'Дата рождения',
	created_at VARCHAR(255),
	updated_at VARCHAR(255)
);

insert into users (name, created_at, updated_at)
values 
	('Kholmanov', '20.10.2017 8:10', '20.10.2017 8:10')
;

drop table if exists users_copy;
create table users_copy(
	id SERIAL primary key,
	name VARCHAR(255) COMMENT 'Имя покупателя',
	bithday_at DATE COMMENT 'Дата рождения',
	created_at DATETIME,
	updated_at DATETIME
);

insert into users_copy
	(name, created_at, updated_at)
select
	name, date(created_at), updated_at
from users;

select convert(created_at, date) from users;
