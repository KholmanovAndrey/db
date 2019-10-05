create database geekbrains_db;
use geekbrains_db;
/*
Ctrl+Space - подзказки
Alt+X - исполнить все или выделенное
Ctrl+Enter - исполнить выражение под курсором
Ctrl+PgUp / Ctrl+PgDn - навигация меджу вкладками
*/

--- команды DDL
create table courses (
	id INT auto_increment not null primary key,
	name VARCHAR(150) unique
);

create table students (
	id INT auto_increment not null primary key,
	firstname VARCHAR(150) not null,
	lastname VARCHAR(150) not null,
	email VARCHAR(150) unique,
	course_id INT
);

-- добавление полей в таблицу
alter table students
add column birthday date;

-- изменение полей в таблице
ALTER TABLE geekbrains_db.students 
CHANGE birthday birthday1 date NULL;

-- удаление полей в таблице
alter table students
drop column birthday;

-- удаление таблицы
drop table students;

-- удаление базы данных
drop database geekbrains_db;


--- команды DML data maniputation language
-- CRUD
insert into courses (name) values
("databases"),
("linux"),
("bigdata");

select * from courses;

update courses
set name = 'jkk'
where id = 1;

delete from courses
where id = 1;

delete from courses;